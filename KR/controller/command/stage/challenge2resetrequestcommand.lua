class("Challenge2ResetRequestCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody().mode
	slot3 = slot1:getBody().isInfiniteSeasonClear

	if not getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_CHALLENGE) or slot5:isEnd() then
		return
	end

	slot6 = getProxy(ChallengeProxy)

	pg.ConnectionMgr.GetInstance():Send(24011, {
		activity_id = slot5.id,
		mode = slot2
	}, 24012, function (slot0)
		if slot0.result == 0 then
			slot0:getUserChallengeInfoList()[slot1] = nil

			if slot1 == true then
				slot0:setCurMode(ChallengeProxy.MODE_CASUAL)
			end

			slot3:sendNotification(GAME.CHALLENGE2_RESET_DONE)
		end
	end)
end

return class("Challenge2ResetRequestCommand", pm.SimpleCommand)
