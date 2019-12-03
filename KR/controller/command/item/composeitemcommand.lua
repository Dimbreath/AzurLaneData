class("ComposeItemCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot7 = getProxy(BagProxy).getItemById(slot5, slot3):getTempCfgTable()

	if slot1:getBody().count == 0 then
		return
	end

	slot8 = slot7.target_id

	if slot4 > slot6.count / slot7.compose_number then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_item_1"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(15006, {
		id = slot3,
		num = slot4
	}, 15007, function (slot0)
		if slot0.result == 0 then
			slot0:removeItemById(slot1, slot2 * slot0)
			table.insert(slot1, slot2)
			slot5:sendNotification(GAME.ADD_ITEM, slot2)
			slot5:sendNotification(GAME.USE_ITEM_DONE, {})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("", slot0.result))
		end
	end)
end

return class("ComposeItemCommand", pm.SimpleCommand)
