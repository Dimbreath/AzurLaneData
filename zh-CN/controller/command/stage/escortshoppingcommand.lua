slot0 = class("EscortShoppingCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot6 = getProxy(PlayerProxy):getRawData()
	slot9 = getProxy(ChapterProxy):getEscortShop():getGoodsCfg(slot2.id)
	slot10, slot11 = getPlayerOwn(slot9.resource_category, slot9.resource_type)

	if slot11 < slot9.resource_num * slot2.count then
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
			slot1 = {}

			table.insert(slot1, {
				type = uv0.commodity_type,
				id = uv0.commodity_id,
				count = uv1 * uv0.num
			})
			_.each(slot1, function (slot0)
				uv0:sendNotification(GAME.ADD_ITEM, Item.New(slot0))
			end)

			slot2 = uv3:getEscortShop()

			slot2:getGoodsById(uv4):addBuyCount(uv1)
			uv3:updateEscortShop(slot2)
			reducePlayerOwn(uv0.resource_category, uv0.resource_type, uv0.resource_num * uv1)
			uv2:sendNotification(GAME.ESCORT_SHOPPING_DONE, {
				awards = slot1
			})
		end
	end)
end

return slot0
