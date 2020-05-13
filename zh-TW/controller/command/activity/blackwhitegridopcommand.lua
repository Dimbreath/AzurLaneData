slot0 = class("BlackWhiteGridOPCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
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
			for slot5, slot6 in ipairs(slot0.award_list) do
				slot7 = {
					type = slot6.type,
					id = slot6.id,
					count = slot6.number
				}

				table.insert({}, slot7)
				uv0:sendNotification(GAME.ADD_ITEM, Item.New(slot7))
			end

			if not table.contains(uv1.data1_list, uv2) then
				table.insert(uv1.data1_list, uv2)
			end

			uv1.data2_list[table.indexof(uv1.data1_list, uv2)] = uv3

			uv4:updateActivity(uv1)
			uv0:sendNotification(GAME.BLACK_WHITE_GRID_OP_DONE, {
				awards = slot1
			})
		else
			print(slot0.result)
		end
	end)
end

return slot0
