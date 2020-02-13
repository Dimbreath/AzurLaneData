class("SetSecondaryPasswordSettingsCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	pg.UIMgr.GetInstance():LoadingOn()
	pg.ConnectionMgr.GetInstance():Send(11607, {
		password = slot1:getBody().pwd,
		system_list = slot1.getBody().settings
	}, 11608, function (slot0)
		pg.UIMgr.GetInstance():LoadingOff()

		if slot0.result == 0 then
			getProxy(SecondaryPWDProxy):OnSettingsChange(slot0)
		end

		slot1:sendNotification(GAME.SET_PASSWORD_SETTINGS_DONE, slot0)
	end)
end

return class("SetSecondaryPasswordSettingsCommand", pm.SimpleCommand)
