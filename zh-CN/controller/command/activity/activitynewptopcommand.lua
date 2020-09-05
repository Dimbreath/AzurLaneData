slot0 = class("ActivityNewPtOPCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot3 = slot2.callback

	if not getProxy(ActivityProxy):getActivityById(slot2.activity_id) or slot5:isEnd() then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(11202, {
		activity_id = slot2.activity_id,
		cmd = slot2.cmd or 0,
		arg1 = slot2.arg1 or 0,
		arg2 = slot2.arg2 or 0
	}, 11203, function (slot0)
		if slot0.result == 0 then
			slot1 = {}

			if uv0.cmd == 1 then
				slot1 = PlayerConst.addTranDrop(slot0.award_list)

				table.insert(uv1.data1_list, uv0.arg1)

				if uv1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_PIZZA_PT and uv0.arg2 and uv0.arg2 > 0 then
					table.insert(uv1.data2_list, uv0.arg2)
				end
			elseif uv0.cmd == 2 then
				uv1.data3 = slot0.number[1]
			end

			uv2:updateActivity(uv1)
			uv3:sendNotification(GAME.ACT_NEW_PT_DONE, {
				awards = slot1,
				callback = uv4
			})
		else
			print(errorTip("", slot0.result))
		end
	end)
end

return slot0
