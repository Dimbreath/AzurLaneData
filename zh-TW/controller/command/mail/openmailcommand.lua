class("OpenMailCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	if getProxy(MailProxy):getMailById(slot1:getBody()) == nil then
		print("邮件不存在: " .. slot2)

		return
	end

	if slot4.openned then
		slot0:sendNotification(GAME.OPEN_MAIL_DONE, slot4)

		return
	end

	pg.ConnectionMgr.GetInstance():Send(30008, {
		id = slot4.id
	}, 30009, function (slot0)
		if slot0.readFlag ~= 0 then
			slot0.readFlag = 2
		end

		slot0:extend(slot0.detail_info)
		slot0.extend:updateMail(slot0)
		slot0.extend:sendNotification(GAME.OPEN_MAIL_DONE, slot0)
	end)
end

return class("OpenMailCommand", pm.SimpleCommand)
