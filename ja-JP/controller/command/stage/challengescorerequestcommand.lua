slot0 = class("ChallengeStrategyCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot7.season = 1

	pg.ConnectionMgr.GetInstance():Send(24009, {}, 24010, function (slot0)
		getProxy(ChallengeProxy):updateScore(slot0.score)
	end)
end

return slot0
