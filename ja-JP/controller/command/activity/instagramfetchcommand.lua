class("InstagramFetchCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = getProxy(ActivityProxy).getActivityById(slot3, slot1:getBody().activity_id)

	pg.ConnectionMgr.GetInstance():Send(11202, {
		cmd = 6,
		activity_id = slot1.getBody().activity_id
	}, 11203, function (slot0)
		if slot0.result == 0 then
			slot1 = slot0.data1_list

			for slot6 = 1, math.floor(#slot0.number), 1 do
				slot0.data1_list[slot6] = slot0.number[slot6]
			end

			slot1:RegisterRequestTime(slot2.activity_id, pg.TimeMgr.GetInstance():GetServerTime())
			slot1:updateActivity(slot0)
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[slot0.result] .. slot0.result)
		end
	end)
end

return class("InstagramFetchCommand", pm.SimpleCommand)
