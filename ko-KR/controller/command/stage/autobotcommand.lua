slot0 = class("AutoBotCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot3 = slot1:getBody().isActiveBot
	slot4 = slot1.getBody().toggle

	if slot0.autoBotSatisfied() then
		if PlayerPrefs.GetInt("autoBotIsAcitve", 0) == not slot3 then
		else
			PlayerPrefs.SetInt("autoBotIsAcitve", (not slot3 and 1) or 0)
			slot0.activeBotHelp(not slot3)
		end
	elseif not slot3 then
		if slot4 then
			onDelayTick(function ()
				GetComponent(GetComponent, typeof(Toggle)).isOn = false
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
	return getProxy(ChapterProxy) and slot0:getChapterById(AUTO_ENABLE_CHAPTER):isClear()
end

function slot0.activeBotHelp(slot0)
	slot1 = getProxy(PlayerProxy)

	if not slot0 then
		if slot0.autoBotHelp then
			pg.MsgboxMgr.GetInstance():hide()
		end

		return
	end

	if slot1.botHelp then
		return
	end

	slot0.autoBotHelp = true

	if getProxy(SettingsProxy):isTipAutoBattle() then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			showStopRemind = true,
			type = MSGBOX_TYPE_HELP,
			helps = i18n("help_battle_auto"),
			custom = {
				{
					text = "text_iknow",
					sound = SFX_CANCEL,
					onCallback = function ()
						if pg.MsgboxMgr.GetInstance().stopRemindToggle.isOn then
							getProxy(SettingsProxy):setAoutBattleTip()
						end
					end
				}
			},
			onClose = function ()
				slot0.autoBotHelp = false

				if pg.MsgboxMgr.GetInstance().stopRemindToggle.isOn then
					getProxy(SettingsProxy):setAoutBattleTip()
				end
			end,
			weight = LayerWeightConst.TOP_LAYER
		})
	end

	slot1.botHelp = true
end

return slot0
