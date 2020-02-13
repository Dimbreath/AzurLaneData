class("CreateNewPlayerCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = slot1:getBody().shipId

	if slot1.getBody().nickname == "" then
		pg.TipsMgr.GetInstance():ShowTips(i18n("login_createNewPlayer_error_nameNull"))
	end

	pg.ConnectionMgr.GetInstance():Send(10024, {
		nick_name = slot3,
		ship_id = slot4,
		device_id = pg.SdkMgr.GetInstance():GetDeviceId()
	}, 10025, function (slot0)
		if slot0.result == 0 then
			print("created new player: " .. slot0.user_id)
			pg.TrackerMgr.GetInstance():Tracking(TRACKING_ROLE_CREATE, nil, slot0.user_id)

			slot1 = getProxy(SettingsProxy)

			slot1:SetSelectedShipId(slot0)
			slot1:sendNotification(GAME.CREATE_NEW_PLAYER_DONE, slot0.user_id)
			pg.TipsMgr.GetInstance():ShowTips(i18n("create_player_success"))
		elseif slot0.result == 6 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("login_createNewPlayer_full"))
		elseif slot0.result == 18 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("system_database_busy"))
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[slot0.result])
		end
	end, false)
end

return class("CreateNewPlayerCommand", pm.SimpleCommand)
