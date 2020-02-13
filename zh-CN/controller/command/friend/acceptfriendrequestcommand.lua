class("AcceptFriendRequestCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()

	function slot5(slot0)
		pg.ConnectionMgr.GetInstance():Send(50006, {
			id = slot0
		}, 50007, function (slot0)
			if slot0.result == 0 then
				slot1 = getProxy(NotificationProxy)

				slot1:removeRequest(slot0)

				if slot1 then
					slot2:relieveBlackListById(slot0)
				end

				pg.TipsMgr.GetInstance():ShowTips(i18n("friend_add_ok"))
				pg.TipsMgr.GetInstance():sendNotification(GAME.FRIEND_ACCEPT_REQUEST_DONE, slot0)
			else
				if slot0.result == 6 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("friend_max_count_1"))
				end

				pg.TipsMgr.GetInstance():ShowTips(errorTip("friend_acceptFriendRequest", slot0.result))
			end
		end)
	end

	if getProxy(FriendProxy).getFriendCount(slot3) == MAX_FRIEND_COUNT then
		pg.TipsMgr.GetInstance():ShowTips(i18n("friend_max_count"))

		return
	end

	if slot3:isInBlackList(slot2) then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("friend_relieve_backlist_tip"),
			onYes = function ()
				slot0(true)
			end
		})
	else
		slot5(false)
	end
end

return class("AcceptFriendRequestCommand", pm.SimpleCommand)
