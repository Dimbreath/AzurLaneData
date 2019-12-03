class("RenameCommanderCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = slot1:getBody().name

	if not getProxy(CommanderProxy):getCommanderById(slot1.getBody().commanderId) then
		return
	end

	if not slot6:canModifyName() then
		return
	end

	if not slot4 or slot4 == "" then
		return
	end

	if HXSet.hxLan(slot6:getName()) == slot4 then
		return
	end

	if not nameValidityCheck(slot4, 0, 12, {
		"spece_illegal_tip",
		"login_newPlayerScene_name_tooShort",
		"login_newPlayerScene_name_tooLong",
		"playerinfo_mask_word"
	}) then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(25020, {
		commanderid = slot3,
		name = slot4
	}, 25021, function (slot0)
		if slot0.result == 0 then
			slot0:setName(slot0.setName)
			slot0:setRenameTime(slot2)
			slot2:updateCommander(slot0)
			slot2.updateCommander:sendNotification(GAME.COMMANDER_RENAME_DONE)
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("rename_commander_erro", slot0.result))
		end
	end)
end

return class("RenameCommanderCommand", pm.SimpleCommand)
