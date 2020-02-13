class("GetSummaryInfoCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(26021, {
		act_id = slot1:getBody().activityId
	}, 26022, function (slot0)
		if slot0.result == 0 then
			getProxy(PlayerProxy).setSummaryInfo(slot2, slot1)
			slot0:sendNotification(GAME.GET_PLAYER_SUMMARY_INFO_DONE, Clone(Summary.New(slot0)))
		end
	end)
end

return class("GetSummaryInfoCommand", pm.SimpleCommand)
