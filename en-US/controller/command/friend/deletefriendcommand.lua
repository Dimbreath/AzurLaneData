class("DeleteFriendCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(50011, {
		id = slot1:getBody()
	}, 50012, function (slot0)
		if slot0.result == 0 then
			slot0:sendNotification(GAME.FRIEND_DELETE_DONE, slot0.sendNotification)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("friend_deleteFriend", slot0.result))
		end
	end)
end

return class("DeleteFriendCommand", pm.SimpleCommand)
