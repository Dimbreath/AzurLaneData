class("FleetRenameCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = slot1:getBody().name

	if not getProxy(FleetProxy):getFleetById(slot1.getBody().id) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("fleet_error_no_fleet"))

		return
	end

	if not nameValidityCheck(slot4, 2, 24, {
		"spece_illegal_tip",
		"login_newPlayerScene_name_tooShort",
		"login_newPlayerScene_name_tooLong",
		"playerinfo_mask_word"
	}) then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(12104, {
		id = slot3,
		name = slot4
	}, 12105, function (slot0)
		if slot0.result == 0 then
			slot0:renameFleet(slot0.renameFleet, slot0)
			slot3:sendNotification(GAME.RENAME_FLEET_DONE)
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[slot0.result])
		end
	end)
end

return class("FleetRenameCommand", pm.SimpleCommand)
