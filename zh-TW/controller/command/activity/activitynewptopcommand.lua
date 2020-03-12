class("ActivityNewPtOPCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot3 = slot1:getBody().callback

	if not getProxy(ActivityProxy):getActivityById(slot1.getBody().activity_id) or slot5:isEnd() then
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

			if slot0.cmd == 1 then
				for slot5 = #PlayerConst.tranOwnShipSkin(slot0.award_list), 1, -1 do
					if slot1[slot5].type ~= DROP_TYPE_SHIP then
						slot1:sendNotification(GAME.ADD_ITEM, slot6)
					end
				end

				table.insert(slot2.data1_list, slot0.arg1)
			elseif slot0.cmd == 2 then
				slot2.data3 = slot0.number[1]
			end

			slot3:updateActivity(slot3.updateActivity)
			slot1:sendNotification(GAME.ACT_NEW_PT_DONE, {
				awards = slot1,
				callback = GAME.ACT_NEW_PT_DONE
			})
		else
			print(errorTip("", slot0.result))
		end
	end)
end

return class("ActivityNewPtOPCommand", pm.SimpleCommand)
