slot0 = class("GetGuildEventCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	if not getProxy(GuildProxy):getData() then
		return
	end

	slot7.guild_id = slot3.id

	pg.ConnectionMgr.GetInstance():Send(60042, {}, 60043, function (slot0)
		uv0:sendNotification(GAME.GET_GUILD_EVENT_DONE)
	end)
end

return slot0
