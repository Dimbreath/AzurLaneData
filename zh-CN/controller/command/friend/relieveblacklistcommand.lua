class("RelieveBlackListCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	if not getProxy(FriendProxy):getBlackPlayerById(slot1:getBody()) then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(50107, {
		id = slot2
	}, 50108, function (slot0)
		if slot0.result == 0 then
			slot0:relieveBlackListById(slot0.relieveBlackListById)
			slot0:sendNotification(GAME.FRIEND_RELIEVE_BLACKLIST_DONE)
			pg.TipsMgr.GetInstance():ShowTips(i18n("friend_relieveblacklist_success"))
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("friend_relieveblacklist", slot0.result))
		end
	end)
end

return class("RelieveBlackListCommand", pm.SimpleCommand)
