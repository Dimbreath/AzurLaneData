class("RejectFriendRequestCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()

	if getProxy(NotificationProxy):getRequestCount() == 0 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("friend_no_request"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(50009, {
		id = slot2
	}, 50010, function (slot0)
		if slot0.result == 0 then
			if slot0 == 0 then
				slot1:removeAllRequest()
				pg.TipsMgr.GetInstance():ShowTips(i18n("reject_all_friend_ok"))
			else
				slot1:removeRequest(slot0)
				pg.TipsMgr.GetInstance():ShowTips(i18n("reject_friend_ok"))
			end

			slot2:sendNotification(GAME.FRIEND_REJECT_REQUEST_DONE, slot0)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("friend_rejectFriendRequest", slot0.result))
		end
	end)
end

return class("RejectFriendRequestCommand", pm.SimpleCommand)
