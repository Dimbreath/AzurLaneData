class("GetMailListCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(30002, {
		type = slot1:getBody().type,
		split_id = slot1.getBody().splitId
	}, 30003, function (slot0)
		slot1 = getProxy(MailProxy)

		if #slot0.mail_list > 0 then
			for slot5, slot6 in ipairs(slot0.mail_list) do
				slot1:addMail(Mail.New(slot6))
			end
		elseif slot1.init then
			pg.TipsMgr.GetInstance():ShowTips(i18n("mail_getMailList_error_noNewMail"))
		end

		slot1.dirty = false
		slot1.init = true
	end)
end

return class("GetMailListCommand", pm.SimpleCommand)
