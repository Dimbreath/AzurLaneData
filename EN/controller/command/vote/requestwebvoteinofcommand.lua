class("RequestWebVoteInofCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = getProxy(VoteProxy).getVoteGroup(slot3)
	slot5 = getProxy(ActivityProxy)
	slot6 = nil
	slot6 = coroutine.create(function ()
		if not pg.TimeMgr.GetInstance():GetServerTime() or VoteConst.RankExpiredTime < slot0 - slot1.lastWebRequestTime then
			slot2:sendNotification(GAME.FETCH_VOTE_INFO, {
				voteId = slot3.configId,
				callback = function (slot0)
					slot0 = slot0

					slot1()
				end
			})
			coroutine.yield()

			slot1.lastWebRequestTime = pg.TimeMgr.GetInstance():GetServerTime()

			slot1:InitWebGroup(nil, slot3.configId)
		end

		if slot3.callback then
			slot3.callback()
		end
	end)

	function ()
		if slot0 and coroutine.status(coroutine.status) == "suspended" then
			slot0, slot1 = coroutine.resume(coroutine.resume)
		end
	end()
end

return class("RequestWebVoteInofCommand", pm.SimpleCommand)
