slot0 = class("GuildSendMsgCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot6.chat = slot1:getBody()

	pg.ConnectionMgr.GetInstance():Send(60007, {})
end

return slot0
