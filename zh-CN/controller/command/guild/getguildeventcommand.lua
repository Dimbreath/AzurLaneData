class("GetGuildEventCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	if not getProxy(GuildProxy):getData() then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(60042, {
		guild_id = slot3.id
	}, 60043, function (slot0)
		slot0:sendNotification(GAME.GET_GUILD_EVENT_DONE)
	end)
end

return class("GetGuildEventCommand", pm.SimpleCommand)
