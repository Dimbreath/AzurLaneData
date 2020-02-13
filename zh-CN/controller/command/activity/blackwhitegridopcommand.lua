class("BlackWhiteGridOPCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()
	slot3 = slot2.id
	slot4 = slot2.activityId
	slot5 = slot2.cmd

	if slot2.score < 0 then
		return
	end

	if not getProxy(ActivityProxy):getActivityById(slot4) or slot8:isEnd() then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(11202, {
		cmd = 1,
		activity_id = slot4,
		arg1 = slot3,
		arg2 = slot6
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

			if not table.contains(slot1.data1_list, table.contains) then
				table.insert(slot1.data1_list, table.insert)
			end

			slot1.data2_list[table.indexof(slot1.data1_list, table.indexof)] = slot1.data2_list

			slot1.data2_list:updateActivity(slot1)
			slot0:sendNotification(GAME.BLACK_WHITE_GRID_OP_DONE, {
				awards = slot1
			})
		else
			print(slot0.result)
		end
	end)
end

return class("BlackWhiteGridOPCommand", pm.SimpleCommand)
