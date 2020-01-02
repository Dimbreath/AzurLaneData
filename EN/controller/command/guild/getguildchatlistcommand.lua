class("GetGuildChatListCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()
	slot3 = Guild.CHAT_LOG_MAX_COUNT

	if not getProxy(GuildProxy):getData() then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(60100, {
		count = slot3
	}, 60101, function (slot0)
		slot0.isGetChatMsg = true
		slot1 = {}
		slot2 = ipairs
		slot3 = slot0.chat_list or {}

		for slot5, slot6 in slot2(slot3) do
			slot0:addMsg(slot1:warpChatInfo(slot6))
		end

		slot2:sendNotification(GAME.GET_GUILD_CHAT_LIST_DONE)
	end)
end

return class("GetGuildChatListCommand", pm.SimpleCommand)
