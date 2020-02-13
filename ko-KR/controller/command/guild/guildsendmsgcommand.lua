class("GuildSendMsgCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(60007, {
		chat = slot1:getBody()
	})
end

return class("GuildSendMsgCommand", pm.SimpleCommand)
