slot0 = class("GetGuildChatListCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot3 = Guild.CHAT_LOG_MAX_COUNT

	if not getProxy(GuildProxy):getData() then
		return
	end

	slot9.count = slot3

	pg.ConnectionMgr.GetInstance():Send(60100, {}, 60101, function (slot0)
		uv0.isGetChatMsg = true
		slot1 = {}

		for slot5, slot6 in ipairs(slot0.chat_list or {}) do
			uv0:addMsg(uv1:warpChatInfo(slot6))
		end

		uv2:sendNotification(GAME.GET_GUILD_CHAT_LIST_DONE)
	end)
end

return slot0
