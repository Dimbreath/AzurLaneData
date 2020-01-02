class("ShoppingCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = slot1:getBody().count
	slot5 = pg.shop_template[slot1.getBody().id]
	slot7 = getProxy(PlayerProxy).getData(slot6)
	slot8 = getProxy(NavalAcademyProxy)

	if not slot1.getBody().id then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_shopId_noFound"))

		return
	end

	if slot5.type == 2 then
		for slot15, slot16 in pairs(slot11) do
			if slot16[1] == 1 then
				if slot16[2] == 1 and slot7:GoldMax(slot16[3]) then
					pg.TipsMgr.GetInstance():ShowTips(i18n("gold_max_tip_title") .. i18n("resource_max_tip_shop"))

					return
				end

				if slot16[2] == 2 and slot7:OilMax(slot16[3]) then
					pg.TipsMgr.GetInstance():ShowTips(i18n("oil_max_tip_title") .. i18n("resource_max_tip_shop"))

					return
				end
			end
		end
	end

	if slot5.type == 1 then
		if slot5.effect_args[1] == 1 and slot7:GoldMax(slot5.num) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("gold_max_tip_title") .. i18n("resource_max_tip_shop"))

			return
		end

		if slot5.effect_args[1] == 2 then
			if slot5.num == -1 and slot5.genre == ShopArgs.BuyOil then
				slot9 = ShopArgs.getOilByLevel(slot7.level)
			end

			if slot7:OilMax(slot9) then
				pg.TipsMgr.GetInstance():ShowTips(i18n("oil_max_tip_title") .. i18n("resource_max_tip_shop"))

				return
			end
		end
	end

	if slot4 == 0 then
		return
	end

	slot10 = getProxy(ShopsProxy).getShopStreet(slot9)
	slot11 = false

	if slot5.resource_num ~= -1 then
		slot12 = slot5.resource_num * slot4

		if slot10 and slot5.genre == ShopArgs.ShoppingStreetLimit then
			slot11 = true
			slot12 = math.ceil(slot10:getGoodsById(slot3).discount / 100 * slot12)
		end
	elseif slot12 == -1 and slot5.effect_args == ShopArgs.EffectShopStreetLevel then
		slot12 = pg.navalacademy_shoppingstreet_template[slot10.level].lv_up_cost[2] * slot4
	elseif slot12 == -1 and (slot5.effect_args == ShopArgs.EffectTradingPortLevel or slot5.effect_args == ShopArgs.EffectOilFieldLevel or slot5.effect_args == ShopArgs.EffectClassLevel) then
		slot13 = nil

		if slot5.effect_args == ShopArgs.EffectTradingPortLevel then
			slot13 = slot8._goldVO
		elseif slot5.effect_args == ShopArgs.EffectOilFieldLevel then
			slot13 = slot8._oilVO
		elseif slot5.effect_args == ShopArgs.EffectClassLevel then
			slot13 = slot8._classVO
		end

		slot12 = slot13:bindConfigTable()[slot13:GetLevel()].use[2] * slot4
	end

	if slot5.limit_args then
		for slot16, slot17 in ipairs(slot5.limit_args) do
			if type(slot17) == "table" and slot17[1] == "level" and slot7.level < slot17[2] then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_limit_level", slot17[2]))

				return
			end
		end
	end

	if slot5.discount ~= 0 and (table.getCount(slot5.discount_time) == 0 or pg.TimeMgr.GetInstance():inTime(slot5.discount_time)) then
		slot12 = slot12 * (100 - slot5.discount) / 100
	end

	if slot7[id2res(slot5.resource_type)] < slot12 then
		slot13 = pg.item_data_statistics[id2ItemId(slot5.resource_type)].name

		if slot5.resource_type == 1 then
			GoShoppingMsgBox(i18n("switch_to_shop_tip_2", i18n("word_gold")), ChargeScene.TYPE_ITEM, {
				{
					59001,
					slot12 - slot7[id2res(slot5.resource_type)],
					slot12
				}
			})
		elseif slot5.resource_type == 4 or slot5.resource_type == 14 then
			GoShoppingMsgBox(i18n("switch_to_shop_tip_3", i18n("word_gem")), ChargeScene.TYPE_DIAMOND)
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("buyProp_noResource_error", slot13))
		end

		return
	end

	pg.ConnectionMgr.GetInstance():Send(16001, {
		id = slot3,
		number = slot4
	}, 16002, function (slot0)
		if slot0.result == 0 then
			slot1 = {}

			if slot0.type ~= 0 then
				if slot0.is_auto_use == 1 then
					for slot5, slot6 in ipairs(slot0.drop_list) do
						slot1:sendNotification(GAME.ADD_ITEM, Item.New({
							type = slot6.type,
							id = slot6.id,
							count = slot6.number
						}))
						table.insert(slot1, Item.New())
					end
				else
					slot2 = slot0.num

					if slot0.num == -1 and slot0.genre == ShopArgs.BuyOil then
						slot2 = ShopArgs.getOilByLevel(slot2:getData().level)
					end

					slot1:sendNotification(GAME.ADD_ITEM, Item.New({
						type = slot0.type,
						id = slot0.effect_args[1],
						count = slot2 * slot3
					}))
					table.insert(slot1, Item.New())
				end

				if slot4 == GoldExchangeView.itemid1 or slot4 == GoldExchangeView.itemid2 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("common_buy_gold_success", pg.shop_template[slot4].num * pg.TipsMgr.GetInstance()))
				else
					pg.TipsMgr.GetInstance():ShowTips(i18n("common_buy_success"))
				end
			elseif slot0.type == 0 then
				slot1:sendNotification(GAME.EXTEND, {
					id = slot4,
					count = slot1
				})
			end

			slot2:getData().consume(slot2, {
				[id2res(slot0.resource_type)] = 
			})

			if slot0.genre == ShopArgs.BuyOil then
				slot2:increaseBuyOilCount()
			end

			slot2:updatePlayer(slot2)

			slot3 = nil

			if slot6 then
				slot4 = slot7:getShopStreet()
				slot3 = slot4.type

				slot4:getGoodsById(slot4).reduceBuyCount(slot5)
				slot5:setShopStreet(slot4)

				if slot1[1].type == DROP_TYPE_ITEM and slot6:isEquipmentSkinBox() then
					slot1:sendNotification(GAME.USE_ITEM, {
						skip_check = true,
						count = 1,
						id = slot6.id
					})
				end
			elseif slot0.genre == ShopArgs.ArenaShopLimit then
				slot4 = getProxy(ShopsProxy)
				slot5 = slot4:getMeritorousShop()
				slot6 = slot5:getGoodsById(slot4)

				slot6:increaseBuyCount()
				slot5:updateGoods(slot6)

				slot3 = slot5.type

				slot4:updateMeritorousShop(slot5)
			elseif slot0.genre == ShopArgs.GiftPackage then
				slot7:GetNormalByID(slot7.GetNormalByID):increaseBuyCount()
			elseif slot0.genre == ShopArgs.SkinShop then
				getProxy(ShipSkinProxy):addSkin(ShipSkin.New({
					id = slot0.effect_args[1]
				}))
			elseif slot0.genre == ShopArgs.SkinShopTimeLimit then
				if getProxy(ShipSkinProxy):getSkinById(slot0.effect_args[1]) and slot6:isExpireType() then
					slot5:addSkin(ShipSkin.New({
						id = slot4,
						end_time = slot0.time_second * slot3 + slot6.endTime
					}))
				elseif not slot6 then
					slot5:addSkin(ShipSkin.New({
						id = slot4,
						end_time = slot0.time_second * slot3 + pg.TimeMgr.GetInstance():GetServerTime()
					}))
				end
			elseif slot0.genre == ShopArgs.guildShop then
				slot4 = getProxy(ShopsProxy):getGuildShop()

				slot4:getGoodsById(slot4).reduceBuyCount(slot5)
				slot5:updateGuildShop(slot4)
			end

			if slot0.group > 0 then
				slot7:updateNormalGroupList(slot0.group, slot0.group_buy_count)
			end

			if slot0.effect_args == ShopArgs.EffecetShipBagSize then
				pg.TipsMgr.GetInstance():ShowTips(i18n("shop_extendship_success"))
			end

			if slot0.effect_args == ShopArgs.EffecetEquipBagSize then
				pg.TipsMgr.GetInstance():ShowTips(i18n("shop_extendequip_success"))
			end

			if slot0.effect_args == ShopArgs.EffectCommanderBagSize then
				pg.TipsMgr.GetInstance():ShowTips(i18n("shop_extendcommander_success"))
			end

			slot7.awards = (slot0.is_auto_use == 1 and slot1) or {}

			slot4(slot1, GAME.SHOPPING_DONE, slot7)
		else
			print(slot0.result)
			pg.TipsMgr.GetInstance():ShowTips(errorTip("", slot0.result))
		end
	end)
end

return class("ShoppingCommand", pm.SimpleCommand)
