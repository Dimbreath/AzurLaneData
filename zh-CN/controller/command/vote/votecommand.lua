class("VoteCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()
	slot3 = slot2.voteId
	slot4 = slot2.gid
	slot5 = slot2.count
	slot6 = getProxy(VoteProxy)

	if not getProxy(ActivityProxy):GetVoteActivity() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

		return
	else
		activityId = slot7.id
	end

	if not pg.TimeMgr.GetInstance():inTime(slot6:getVoteGroup().getConfig(slot8, "time_vote")) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

		return
	end

	if slot6.votes < slot5 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("vote_not_enough"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(11202, {
		cmd = 1,
		activity_id = activityId,
		arg1 = slot3,
		arg2 = slot4,
		arg3 = slot5
	}, 11203, function (slot0)
		if slot0.result == 0 then
			slot1 = getProxy(ActivityProxy)
			slot2 = slot1:getActivityById(activityId)
			slot2.data1 = slot2.data1 - slot0

			slot1:updateActivity(slot2)
			slot1:UpdateVotes(slot0)
			slot2:UpdateVoteCnt(slot2.UpdateVoteCnt, slot0)
			slot1:updateVoteGroup(slot2)
			slot1:sendNotification(GAME.ON_NEW_VOTE_DONE)
		else
			print(slot0.result)
		end
	end)
end

return class("VoteCommand", pm.SimpleCommand)
