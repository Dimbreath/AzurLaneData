class("RenameShipCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = slot1:getBody().name

	if not getProxy(BayProxy):getShipById(slot1.getBody().shipId) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("ship_error_noShip", slot3))

		return
	end

	slot7 = (slot6:isRemoulded() and HXSet.hxLan(pg.ship_skin_template[slot6:getRemouldSkinId()].name)) or pg.ship_data_statistics[slot6.configId].name

	if HXSet.hxLan(slot6:getName()) == slot4 then
		slot0:sendNotification(GAME.RENAME_SHIP_DONE, {
			ship = slot6
		})

		return
	end

	if slot4 == "" then
		pg.TipsMgr.GetInstance():ShowTips(i18n("login_createNewPlayer_error_nameNull"))

		return
	end

	if slot4 ~= slot7 and not nameValidityCheck(slot4, 0, 40, {
		"spece_illegal_tip",
		"login_newPlayerScene_name_tooShort",
		"ship_renameShip_error_2011",
		"playerinfo_mask_word"
	}) then
		return
	end

	function slot8()
		slot0(slot1, slot2, {
			ship_id = slot0,
			name = (pg.ConnectionMgr.GetInstance() == 12034 and "") or slot1
		}, 12035, function (slot0)
			if slot0.result == 0 then
				slot0.name = slot0
				slot0.renameTime = pg.TimeMgr.GetInstance():GetServerTime()

				pg.TimeMgr.GetInstance().GetServerTime():updateShip(slot0)
				slot3:sendNotification(BayProxy.SHIP_UPDATED, slot0)
				slot3:sendNotification(GAME.RENAME_SHIP_DONE, {
					ship = slot0
				})
			else
				pg.TipsMgr.GetInstance():ShowTips(errorTip("ship_renameShip", slot0.result))
			end
		end)
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = i18n("word_rename_time_warning", HXSet.hxLan(slot6:getName()), slot4),
		onYes = function ()
			slot0()
		end
	})
end

return class("RenameShipCommand", pm.SimpleCommand)
