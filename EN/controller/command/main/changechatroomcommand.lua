slot1 = 99

class("ChangeChatRoomCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()

	if not getProxy(PlayerProxy) then
		return
	end

	if not slot3:getData() then
		return
	end

	if not slot2 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("main_notificationLayer_not_roomId"))

		return
	end

	if slot0 < slot2 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("main_notificationLayer_roomId_invaild"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(11401, {
		room_id = slot2
	}, 11402, function (slot0)
		if slot0.result == 0 then
			slot0:changeChatRoom(slot0.room_id or slot0.changeChatRoom)
			slot0:updatePlayer(slot0)
			getProxy(ChatProxy).clearMsg(slot0.changeChatRoom)
			slot0.changeChatRoom:sendNotification(GAME.CHANGE_CHAT_ROOM_DONE, slot0)
		elseif slot0.result == 6 then
			slot3:sendNotification(GAME.CHAT_ROOM_MAX_NUMBER)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("player_change_chat_room_erro", slot0.result))
		end
	end)
end

return class("ChangeChatRoomCommand", pm.SimpleCommand)
