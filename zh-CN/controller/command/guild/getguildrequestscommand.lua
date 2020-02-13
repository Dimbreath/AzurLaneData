class("GetGuildRequestsCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(60003, {
		id = slot1:getBody()
	}, 60004, function (slot0)
		slot1 = {}
		slot2 = {}

		for slot6, slot7 in ipairs(slot0.request_list) do
			slot8 = ChatMsg.New(ChatConst.ChannelGuild, {
				player = Player.New(slot7.player),
				content = slot7.content,
				timestamp = slot7.timestamp
			})
			slot1[slot8.player.id] = slot8

			table.insert(slot2, slot8)
		end

		getProxy(GuildProxy).setRequestList(slot3, slot1)
		slot0:sendNotification(GAME.GUILD_GET_REQUEST_LIST_DONE, slot2)
	end)
end

return class("GetGuildRequestsCommand", pm.SimpleCommand)
