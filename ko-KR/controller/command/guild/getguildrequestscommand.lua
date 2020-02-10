slot0 = class("GetGuildRequestsCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot6.id = slot1:getBody()

	pg.ConnectionMgr.GetInstance():Send(60003, {}, 60004, function (slot0)
		slot1 = {}

		for slot6, slot7 in ipairs(slot0.request_list) do
			slot10.player = Player.New(slot7.player)
			slot10.content = slot7.content
			slot10.timestamp = slot7.timestamp
			slot8 = ChatMsg.New(ChatConst.ChannelGuild, {})
			slot1[slot8.player.id] = slot8

			table.insert({}, slot8)
		end

		getProxy(GuildProxy):setRequestList(slot1)
		uv0:sendNotification(GAME.GUILD_GET_REQUEST_LIST_DONE, slot2)
	end)
end

return slot0
