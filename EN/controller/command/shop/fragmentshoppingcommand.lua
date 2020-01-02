slot0 = class("FragmentShoppingCommand", pm.SimpleCommand)
slot0.FRAG_SHOP = 2

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot5 = slot2.type
	slot7 = getProxy(PlayerProxy).getRawData(slot6)
	slot10 = getProxy(ShopsProxy).getFragmentShop(slot8).getGoodsCfg(slot9, slot3)
	slot11, slot12 = getPlayerOwn(slot10.resource_category, slot10.resource_type)

	if slot12 < slot10.resource_num * slot2.count then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_x", slot11))

		return
	end

	if slot10.commodity_type == 1 then
		if slot10.commodity_id == 1 and slot7:GoldMax(slot10.num * slot4) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("gold_max_tip_title") .. i18n("resource_max_tip_shop"))

			return
		end

		if slot10.commodity_id == 2 and slot7:OilMax(slot10.num * slot4) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("oil_max_tip_title") .. i18n("resource_max_tip_shop"))

			return
		end
	end

	pg.ConnectionMgr.GetInstance():Send(16201, {
		id = slot3,
		type = slot0.FRAG_SHOP,
		count = slot4
	}, 16202, function (slot0)
		if slot0.result == 0 then
			table.insert(slot1, {
				type = slot0.commodity_type,
				id = slot0.commodity_id,
				count = slot1 * slot0.num
			})
			_.each(slot1, function (slot0)
				slot0:sendNotification(GAME.ADD_ITEM, Item.New(slot0))
			end)

			slot2 = slot1:getFragmentShop()
			slot3 = slot2:getGoodsById(slot4)

			slot3:addBuyCount(slot1)
			slot3:updateFragmentShop(slot2)
			reducePlayerOwn(slot0.resource_category, slot0.resource_type, slot0.resource_num * {})
			slot2:sendNotification(GAME.FRAG_SHOPPING_DONE, {
				awards = 
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("", slot0.result))
		end
	end)
end

return slot0
