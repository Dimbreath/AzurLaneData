class("DeleteAllMailCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(30006, {
		id = 0
	}, 30007, function (slot0)
		slot1 = getProxy(MailProxy)

		for slot5, slot6 in ipairs(slot0.id_list) do
			if slot1:hasMailById(slot6) then
				slot1:removeMailById(slot6)
			end
		end

		slot0:sendNotification(GAME.DELETE_ALL_MAIL_DONE)
	end)
end

return class("DeleteAllMailCommand", pm.SimpleCommand)
