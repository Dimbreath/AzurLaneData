class("ChangeMailImpFlagCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(30010, {
		id = slot1:getBody().id,
		flag = slot1.getBody().flag
	}, 30011, function (slot0)
		if slot0.result == 0 then
			slot1 = getProxy(MailProxy)
			slot2 = slot1:getMailById(slot0.id)

			slot2:setImportantFlag(slot0.flag)
			slot1:updateMail(slot2)
			slot1:sendNotification(GAME.CHANGE_MAIL_IMP_FLAG_DONE)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("change_mail_imp_flag", slot0.result))
		end
	end)
end

return class("ChangeMailImpFlagCommand", pm.SimpleCommand)
