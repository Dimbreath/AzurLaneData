class("ChallengeResetCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()

	if not getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_CHALLENGE) or slot4:isEnd() then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(24004, {
		act = Challenge.CHALLENGE_OP_RESET,
		activity_id = slot4.id
	}, 24005, function (slot0)
		if slot0.result == 0 then
			slot2 = getProxy(ChallengeProxy)

			slot2:updateChallenge(slot1)
			slot2:SetPlayerPrefsChallengeFleet(slot1)
			slot0:sendNotification(GAME.CHALLENGE_RESET_DONE)
		end
	end)
end

return class("ChallengeResetCommand", pm.SimpleCommand)
