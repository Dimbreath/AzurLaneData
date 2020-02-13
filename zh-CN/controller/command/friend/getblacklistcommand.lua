class("GetBlackListCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()

	pg.ConnectionMgr.GetInstance():Send(50016, {
		type = 0
	}, 50017, function (slot0)
		slot1 = {}

		for slot5, slot6 in ipairs(slot0.black_list) do
			slot1[Player.New(slot6).id] = Player.New(slot6)
		end

		getProxy(FriendProxy).setBlackList(slot2, slot1)
		slot0:sendNotification(GAME.GET_BLACK_LIST_DONE)
	end)
end

return class("GetBlackListCommand", pm.SimpleCommand)
