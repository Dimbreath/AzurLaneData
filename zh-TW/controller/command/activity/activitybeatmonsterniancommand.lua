class("ActivityBeatMonsterNianCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot3 = slot1:getBody().callback

	if not getProxy(ActivityProxy):getActivityById(slot1.getBody().activity_id) or slot4:isEnd() then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(11202, {
		activity_id = slot2.activity_id,
		cmd = slot2.cmd,
		arg1 = slot2.arg1,
		arg2 = slot2.arg2
	}, 11203, function (slot0)
		if slot0.result == 0 then
			slot1 = {}

			for slot5, slot6 in ipairs(slot0.award_list) do
				table.insert(slot1, slot7)
				slot0:sendNotification(GAME.ADD_ITEM, Item.New({
					type = slot6.type,
					id = slot6.id,
					count = slot6.number
				}))
			end

			slot1.data2 = slot1.data2 + 1
			slot1.data3 = slot0.number[1]

			if slot1:GetDataConfig("hp") - slot1.data3 <= 0 then
				slot1.data1 = 1
			end

			getProxy(ActivityProxy):updateActivity(slot1)

			if slot2 then
				slot2(slot1)
			end
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[slot0.result] .. slot0.result)
		end
	end)
end

return class("ActivityBeatMonsterNianCommand", pm.SimpleCommand)
