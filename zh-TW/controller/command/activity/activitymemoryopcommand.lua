class("ActivityMemoryOPCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot3 = slot1:getBody().id
	slot5 = getProxy(ActivityProxy)

	if not getProxy(ActivityProxy):getActivityById(slot1.getBody().actId) or slot6:isEnd() then
		return
	end

	if not table.contains(slot6.data1_list, slot3) then
		return
	end

	if table.contains(slot6.data2_list, slot3) then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(11202, {
		cmd = 2,
		arg2 = 0,
		activity_id = slot4,
		arg1 = slot3
	}, 11203, function (slot0)
		if slot0.result == 0 then
			table.insert(slot0.data2_list, table.insert)
			slot0.data2_list:updateActivity(slot0)
			slot3:sendNotification(GAME.MEMORYBOOK_UNLOCK_DONE, slot3.sendNotification)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("", slot0.result))
		end
	end)
end

return class("ActivityMemoryOPCommand", pm.SimpleCommand)
