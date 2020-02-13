class("DeleteMailCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	if getProxy(MailProxy):getMailById(slot1:getBody()) == nil then
		print("邮件不存在: " .. slot2)

		return
	end

	pg.ConnectionMgr.GetInstance():Send(30006, {
		id = slot2
	}, 30007, function (slot0)
		for slot4, slot5 in ipairs(slot0.id_list) do
			slot0:removeMailById(slot5)
		end

		slot1:sendNotification(GAME.DELETE_MAIL_DONE)
	end)
end

return class("DeleteMailCommand", pm.SimpleCommand)
