class("EscortShoppingCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot6 = getProxy(PlayerProxy).getRawData(slot5)
	slot9 = getProxy(ChapterProxy).getEscortShop(slot7).getGoodsCfg(slot8, slot3)
	slot10, slot11 = getPlayerOwn(slot9.resource_category, slot9.resource_type)

	if slot11 < slot9.resource_num * slot1:getBody().count then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_x", slot10))

		return
	end

	if slot9.commodity_type == 1 then
		if slot9.commodity_id == 1 and slot6:GoldMax(slot9.num * slot4) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("gold_max_tip_title") .. i18n("resource_max_tip_shop"))

			return
		end

		if slot9.commodity_id == 2 and slot6:OilMax(slot9.num * slot4) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("oil_max_tip_title") .. i18n("resource_max_tip_shop"))

			return
		end
	end

	pg.ConnectionMgr.GetInstance():Send(23010, {
		id = slot3,
		count = slot4
	}, 23011, function (slot0)
		if slot0.result == 0 then
			table.insert(slot1, {
				type = slot0.commodity_type,
				id = slot0.commodity_id,
				count = slot1 * slot0.num
			})
			_.each(slot1, function (slot0)
				slot0:sendNotification(GAME.ADD_ITEM, Item.New(slot0))
			end)

			slot2 = slot1:getEscortShop()
			slot3 = slot2:getGoodsById(slot4)

			slot3:addBuyCount(slot1)
			slot3:updateEscortShop(slot2)
			reducePlayerOwn(slot0.resource_category, slot0.resource_type, slot0.resource_num * {})
			slot2:sendNotification(GAME.ESCORT_SHOPPING_DONE, {
				awards = 
			})
		end
	end)
end

return class("EscortShoppingCommand", pm.SimpleCommand)
