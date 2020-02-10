slot0 = class("AutoBotCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = slot2.toggle

	if uv0.autoBotSatisfied() then
		if PlayerPrefs.GetInt("autoBotIsAcitve", 0) == not slot2.isActiveBot then
			-- Nothing
		else
			PlayerPrefs.SetInt("autoBotIsAcitve", not slot3 and 1 or 0)
			uv0.activeBotHelp(not slot3)
		end
	elseif not slot3 then
		if slot4 then
			onDelayTick(function ()
				GetComponent(uv0, typeof(Toggle)).isOn = false
			end, 0.1)
		end

		pg.TipsMgr.GetInstance():ShowTips(i18n("auto_battle_limit_tip"))
	end

	if slot3 then
		slot0:sendNotification(GAME.AUTO_SUB, {
			isActiveSub = true
		})
	end
end

function slot0.autoBotSatisfied()
	if getProxy(ChapterProxy) then
		slot1 = slot0:getChapterById(AUTO_ENABLE_CHAPTER):isClear()
	end

	return slot1
end

function slot0.activeBotHelp(slot0)
	slot1 = getProxy(PlayerProxy)

	if not slot0 then
		if uv0.autoBotHelp then
			pg.MsgboxMgr.GetInstance():hide()
		end

		return
	end

	if slot1.botHelp then
		return
	end

	uv0.autoBotHelp = true

	if getProxy(SettingsProxy):isTipAutoBattle() then
		slot4.type = MSGBOX_TYPE_HELP
		slot4.helps = i18n("help_battle_auto")
		slot6.sound = SFX_CANCEL

		function slot6.onCallback()
			if pg.MsgboxMgr.GetInstance().stopRemindToggle.isOn then
				getProxy(SettingsProxy):setAoutBattleTip()
			end
		end

		slot5[1] = {
			text = "text_iknow"
		}
		slot4.custom = {}

		function slot4.onClose()
			uv0.autoBotHelp = false

			if pg.MsgboxMgr.GetInstance().stopRemindToggle.isOn then
				getProxy(SettingsProxy):setAoutBattleTip()
			end
		end

		slot4.weight = LayerWeightConst.TOP_LAYER

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			showStopRemind = true
		})
	end

	slot1.botHelp = true
end

return slot0
