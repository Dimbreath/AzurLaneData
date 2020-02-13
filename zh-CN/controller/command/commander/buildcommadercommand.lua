class("BuildCommaderCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = slot1:getBody().callback
	slot7 = getProxy(PlayerProxy):getData()
	slot8 = getProxy(BagProxy)
	slot10 = {}

	for slot14, slot15 in ipairs(slot9) do
		if slot15[1] == DROP_TYPE_RESOURCE then
			if slot7:getResById(slot15[2]) < slot15[3] then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))

				return
			end
		elseif slot15[1] == DROP_TYPE_ITEM and slot8:getItemCountById(slot15[2]) < slot15[3] then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_item_1"))

			return
		end

		table.insert(slot10, Item.New({
			type = slot15[1],
			id = slot15[2],
			count = slot15[3]
		}))
	end

	pg.ConnectionMgr.GetInstance():Send(25002, {
		boxid = slot3
	}, 25003, function (slot0)
		if slot0.result == 0 then
			slot0:updateBox(slot1)

			for slot5, slot6 in ipairs(slot1) do
				slot2:sendNotification(GAME.CONSUME_ITEM, slot6)
			end

			slot2:sendNotification(GAME.COMMANDER_ON_BUILD_DONE)
			pg.TipsMgr.GetInstance():ShowTips(i18n("commander_build_done"))
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("commander_build_erro", slot0.result))
		end

		if slot3 then
			slot3()
		end
	end)
end

return class("BuildCommaderCommand", pm.SimpleCommand)
