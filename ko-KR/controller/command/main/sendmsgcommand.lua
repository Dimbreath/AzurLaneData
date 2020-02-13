class("SendMsgCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	print("send msg: " .. slot2)
	pg.ConnectionMgr.GetInstance():Send(50102, {
		type = 1,
		content = slot1:getBody()
	})
end

return class("SendMsgCommand", pm.SimpleCommand)
