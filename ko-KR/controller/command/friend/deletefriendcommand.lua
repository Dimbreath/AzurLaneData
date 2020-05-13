slot0 = class("DeleteFriendCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(50011, {
		id = slot1:getBody()
	}, 50012, function (slot0)
		if slot0.result == 0 then
			uv0:sendNotification(GAME.FRIEND_DELETE_DONE, uv1)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("friend_deleteFriend", slot0.result))
		end
	end)
end

return slot0
