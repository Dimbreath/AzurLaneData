class("SendFriendRequestCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot3 = slot1:getBody().id
	slot6 = getProxy(PlayerProxy).getData(slot5)

	if wordVer(slot4) > 0 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("friend_msg_forbid"))

		return
	end

	if slot6.id == slot3 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("dont_add_self"))

		return
	end

	if getProxy(FriendProxy):isFriend(slot3) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("friend_already_add"))

		return
	end

	if slot7:getFriendCount() == MAX_FRIEND_COUNT then
		pg.TipsMgr.GetInstance():ShowTips(i18n("friend_max_count"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(50003, {
		id = slot3,
		content = slot4
	}, 50004, function (slot0)
		if slot0.result == 0 then
			slot0:sendNotification(GAME.FRIEND_SEND_REQUEST_DONE, slot0.sendNotification)
			pg.TipsMgr.GetInstance():ShowTips(i18n("friend_sendFriendRequest_success"))
		elseif slot0.result == 1 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("friend_sendFriendRequest_success"))
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("friend_sendFriendRequest", slot0.result))
		end
	end)
end

return class("SendFriendRequestCommand", pm.SimpleCommand)
