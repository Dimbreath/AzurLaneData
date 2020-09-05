slot0 = class("GuildMainScene", import("..base.BaseUI"))

function slot0.getUIName(slot0)
	return "GuildMainUI"
end

function slot0.getGroupName(slot0)
	return "group_GuildMainUI"
end

function slot0.setGuildVO(slot0, slot1)
	slot0.guildVO = slot1
	slot0.logs = slot1.logInfo
end

function slot0.setPlayerVO(slot0, slot1)
	slot0.playerVO = slot1

	slot0._resPanel:setResources(slot1)
end

function slot0.setChatMsgs(slot0, slot1)
	slot0.chatMsgs = slot1
end

function slot0.setActivity(slot0, slot1)
	slot0.activity = slot1
end

function slot0.setGuildEvent(slot0, slot1)
	slot0.guildEvent = slot1
end

slot8 = {
	{
		"main",
		i18n("guild_word_home")
	},
	{
		"member",
		i18n("guild_word_member")
	},
	{
		"apply",
		i18n("guild_word_apply")
	},
	{
		"activity",
		i18n("word_activity")
	},
	{
		"boss_activity",
		i18n("word_urgency_event")
	},
	{
		"shop",
		i18n("word_shop")
	},
	{
		"facility",
		i18n("word_facility")
	}
}

function slot0.init(slot0)
	slot0._playerResOb = slot0:findTF("blur_panel/adapt/top/res")
	slot0._resPanel = PlayerResource.New()

	tf(slot0._resPanel._go):SetParent(tf(slot0._playerResOb), false)

	slot0.togglesRoot = slot0:findTF("blur_panel/adapt/left_length/frame/scroll_rect/tagRoot")
	slot0.applyTip = slot0:findTF("apply/tip", slot0.togglesRoot)
	slot0.back = slot0:findTF("blur_panel/adapt/top/back")
	slot0.blurPanel = slot0:findTF("blur_panel")
	slot0.overLay = pg.UIMgr.GetInstance().OverlayMain

	setActive(slot0:findTF("facility", slot0.togglesRoot), false)

	slot0._bg = slot0:findTF("bg")

	if slot0.bgSprite then
		setImageSprite(slot0._bg, slot0.bgSprite, false)
	end

	slot0._leftLength = findTF(slot0.blurPanel, "adapt/left_length")
	slot0._topPanel = findTF(slot0.blurPanel, "adapt/top")
	slot0.init = true
end

function slot0.preload(slot0, slot1)
	if GuildMainMediator.BG then
		GetSpriteFromAtlasAsync(GuildMainMediator.BG, "", function (slot0)
			uv0.bgSprite = slot0

			uv1()
		end)
	else
		slot1()
	end
end

function slot0.updateBg(slot0)
	slot1 = slot0.guildVO
	slot2 = slot0.guildVO:getBgName()

	if GuildMainMediator.BG and slot2 ~= GuildMainMediator.BG then
		GuildMainMediator.BG = slot2

		GetSpriteFromAtlasAsync(GuildMainMediator.BG, "", function (slot0)
			if not IsNil(uv0._bg) then
				setImageSprite(uv0._bg, slot0, false)
			end
		end)
	end
end

function slot0.didEnter(slot0)
	setParent(slot0.blurPanel, slot0.overLay)
	onButton(slot0, slot0.back, function ()
		if not uv0.loadFinish then
			return
		end

		LeanTween.delayedCall(0.31, System.Action(function ()
			uv0:emit(GuildMainMediator.ON_BACK)
		end))
	end, SOUND_BACK)
	slot0:initTheme()
end

function slot0.updateNotices(slot0, slot1)
	setActive(slot0.applyTip, slot1)
end

function slot0.enterPage(slot0)
	triggerToggle(slot0.toggles[slot0.contextData.page or uv0], true)
end

function slot0.initTheme(slot0)
	slot1 = slot0.guildVO:getFaction()
	slot2 = slot0.guildVO:getMainUIName()

	pg.UIMgr.GetInstance():LoadingOn()

	if not slot0.bgSprite then
		GuildMainMediator.BG = slot0.guildVO:getBgName()

		GetSpriteFromAtlasAsync(GuildMainMediator.BG, "", function (slot0)
			if not IsNil(uv0._bg) then
				setImageSprite(uv0._bg, slot0, false)
			end
		end)
	end

	if not slot0.curFaction or slot0.curFaction ~= slot2 then
		if slot0.themePanel then
			PoolMgr.GetInstance():ReturnUI(slot2, go(slot0.themePanel))
		end

		slot0.themePanel = nil

		PoolMgr.GetInstance():GetUI(slot2, true, function (slot0)
			pg.UIMgr.GetInstance():LoadingOff()

			if uv0.exited then
				PoolMgr.GetInstance():ReturnUI(uv1, slot0)

				return
			end

			uv0.themePanel = tf(slot0)

			setParent(tf(slot0), uv0:findTF("main"))
			uv0:updateTheme()
			uv0:updateGuildInfo(uv0.guildVO)
			uv0:initToggles()
			uv0:enterPage()
			uv0:updateAdmin()

			uv0.loadFinish = true
		end)
	else
		slot0:updateGuildInfo(slot0.guildVO)
		pg.UIMgr.GetInstance():LoadingOff()
		slot0:updateAdmin()
	end

	slot0.curFaction = slot2
end

function slot0.initToggles(slot0)
	slot0.toggles = {}

	for slot4, slot5 in ipairs(uv0) do
		slot6 = slot5[1]
		slot0.toggles[slot6] = slot0.togglesRoot:Find(slot6)

		setActive(slot0.toggles[slot6], slot4 <= 3)
		onToggle(slot0, slot0.toggles[slot6], function (slot0)
			if slot0 then
				uv0:openPage(uv1)
			else
				uv0:closePage(uv1)
			end
		end, SFX_PANEL)
	end

	slot0:updateEventBtn(getProxy(GuildProxy).eventTip)
	setActive(slot0.toggles[uv1], slot0.activity and not slot0.activity:isEnd())
end

function slot0.updateEventBtn(slot0, slot1)
	if slot0.toggles then
		setActive(slot0.toggles[uv0], slot0.guildEvent and not slot0.guildEvent:isEnd())
		setActive(slot0.toggles[uv0]:Find("tip"), slot1)
	end
end

function slot0.openPage(slot0, slot1)
	if slot0.contextData.page == slot1 and not slot0.init then
		return
	end

	slot0.init = nil

	if slot1 == uv0 then
		setActive(slot0.themePanel, true)
	elseif slot1 == uv1 then
		slot0:emit(GuildMainMediator.OPEN_MEMBER)
	elseif slot1 == uv2 then
		slot0:emit(GuildMainMediator.OPEN_APPLY)
	elseif slot1 == uv3 then
		slot0:emit(GuildMainMediator.OPEN_ACTIVITY)
	elseif slot1 == uv4 then
		slot0:emit(GuildMainMediator.OPEN_BOSS_ACTIVITY, slot0.guildVO.faction)
	elseif slot1 == uv5 then
		slot0:emit(GuildMainMediator.OPEN_SHOP)
	elseif slot1 == uv6 then
		slot0:emit(GuildMainMediator.OPEN_FACILITY)
	end

	if slot1 ~= uv5 then
		slot0.contextData.page = slot1
	end
end

function slot0.closePage(slot0, slot1)
	if slot1 == uv0 then
		setActive(slot0.themePanel, false)
		slot0:closeModifyPanel()
	elseif slot1 == uv1 then
		slot0:emit(GuildMainMediator.CLOSE_MEMBER)
	elseif slot1 == uv2 then
		slot0:emit(GuildMainMediator.CLOSE_APPLY)
	elseif slot1 == uv3 then
		slot0:emit(GuildMainMediator.CLOSE_ACTIVITY)
	elseif slot1 == uv4 then
		slot0:emit(GuildMainMediator.CLOSE_BOSS_ACTIVITY)
	elseif slot1 == uv5 then
		slot0:emit(GuildMainMediator.CLOSE_SHOP)
	elseif slot1 == uv6 then
		slot0:emit(GuildMainMediator.CLOSE_FACILITY)
	end
end

function slot0.updateTheme(slot0)
	slot0.nameTF = slot0:findTF("infoPanel/top/name", slot0.themePanel):GetComponent(typeof(Text))
	slot0.idTF = slot0:findTF("infoPanel/top/number/Text", slot0.themePanel):GetComponent(typeof(Text))
	slot0.LevelTF = slot0:findTF("infoPanel/top/level/Text", slot0.themePanel):GetComponent(typeof(Text))
	slot0.expTF = slot0:findTF("infoPanel/top/exp/Text", slot0.themePanel):GetComponent(typeof(Text))
	slot0.expSlider = slot0:findTF("infoPanel/top/exp/bar", slot0.themePanel)
	slot0.countTF = slot0:findTF("infoPanel/bottom/memberinfo/value/Text", slot0.themePanel):GetComponent(typeof(Text))
	slot0.polity = slot0:findTF("infoPanel/bottom/polityinfo/value/Text", slot0.themePanel):GetComponent(typeof(Text))
	slot0.courseinfo = slot0:findTF("infoPanel/top/polityinfo/Text", slot0.themePanel):GetComponent(typeof(Text))
	slot0.announce = slot0:findTF("infoPanel/bottom/announce/content/InputField", slot0.themePanel):GetComponent(typeof(InputField))
	slot0.manifesto = slot0:findTF("infoPanel/bottom/desc/content/Text", slot0.themePanel):GetComponent(typeof(Text))
	slot0.modifyBtn = slot0:findTF("infoPanel/top/modify", slot0.themePanel)
	slot0.chatContent = slot0:findTF("dialogPanel/frame/bottom/list/content", slot0.themePanel)
	slot0.prefabOthers = slot0:findTF("dialogPanel/frame/bottom/list/popo_other", slot0.themePanel)
	slot0.prefabSelf = slot0:findTF("dialogPanel/frame/bottom/list/popo_self", slot0.themePanel)
	slot0.logContent = slot0:findTF("dialogPanel/frame/top/content/viewport/list", slot0.themePanel)
	slot0.prefabPublic = slot0:getTpl("dialogPanel/frame/top/content/viewport/list/popo_public", slot0.themePanel)
	slot0.scroll = slot0:findTF("dialogPanel/frame/bottom/list", slot0.themePanel):GetComponent(typeof(ScrollRect))
	slot0.scrollChat = slot0:findTF("dialogPanel/frame/top/content", slot0.themePanel):GetComponent(typeof(ScrollRect))
	slot0.sendBtn = slot0:findTF("dialogPanel/frame/bottom/bottom/send", slot0.themePanel)
	slot0.emojiBtn = slot0:findTF("dialogPanel/frame/bottom/bottom/emoji", slot0.themePanel)
	slot0.msgInput = slot0:findTF("dialogPanel/frame/bottom/bottom/input", slot0.themePanel):GetComponent(typeof(InputField))
	slot0.infoPanel = slot0:findTF("infoPanel", slot0.themePanel)
	slot0.dialogPanel = slot0:findTF("dialogPanel", slot0.themePanel)

	setActive(slot0.infoPanel, true)
	setActive(slot0.dialogPanel, true)
	onInputEndEdit(slot0, slot0.announce.gameObject, function (slot0)
		if wordVer(slot0) > 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("playerinfo_mask_word"))
			setInputText(uv0.announce, uv0.guildVO.announce)

			return
		end

		if slot0 == "" then
			return
		end

		if slot0 == uv0.guildVO.announce then
			return
		end

		uv0:emit(GuildMainMediator.MODIFY, 5, 0, slot0)
	end)
	onButton(slot0, slot0.modifyBtn, function ()
		uv0:showModifyPanel()
	end, SFX_PANEL)
	onButton(slot0, slot0.sendBtn, function ()
		if wordVer(uv0.msgInput.text) > 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("playerinfo_mask_word"))

			return
		end

		if slot0 == "" then
			pg.TipsMgr.GetInstance():ShowTips(i18n("guild_msg_is_null"))

			return
		end

		if uv0.chatTimer and pg.TimeMgr.GetInstance():GetServerTime() - uv0.chatTimer < 5 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dont_send_message_frequently"))

			return
		end

		uv0.chatTimer = pg.TimeMgr.GetInstance():GetServerTime()

		uv0:emit(GuildMainMediator.SEND_MSG, slot0)

		uv0.msgInput.text = ""
	end, SFX_PANEL)
	onButton(slot0, slot0.emojiBtn, function ()
		slot0 = uv0.emojiBtn.position

		uv0:emit(GuildMainMediator.OPEN_EMOJI, Vector3(slot0.x, slot0.y, 0), function (slot0)
			uv0:emit(GuildMainMediator.SEND_MSG, string.gsub(ChatConst.EmojiCode, "code", slot0))
		end)
	end, SFX_PANEL)
	slot0:updateModifyPanel()
end

function slot0.updateAdmin(slot0)
	if IsNil(slot0.themePanel) then
		return
	end

	slot0.announce.interactable = slot0.guildVO:getDutyByMemberId(slot0.playerVO.id) == GuildMember.DUTY_COMMANDER or slot1 == GuildMember.DUTY_DEPUTY_COMMANDER

	setActive(slot0.toggles[uv0], slot1 == GuildMember.DUTY_COMMANDER or slot1 == GuildMember.DUTY_DEPUTY_COMMANDER)
	setActive(slot0.quitBtn, slot1 ~= GuildMember.DUTY_COMMANDER)
	setActive(slot0.dissolveBtn, slot1 == GuildMember.DUTY_COMMANDER)
end

function slot0.showModifyPanel(slot0)
	pg.UIMgr.GetInstance():BlurPanel(slot0.modifyPanel)

	slot0.isShowModify = true

	setActive(slot0.modifyPanel, true)
	setActive(slot0.infoPanel, false)
	setActive(slot0.dialogPanel, false)

	slot0.nameInput.text = slot0.guildVO:getName()
	slot0.manifestoInput.text = slot0.guildVO.manifesto
	slot1 = slot0.guildVO:getDutyByMemberId(slot0.playerVO.id) == GuildMember.DUTY_COMMANDER
	slot0.nameInput.interactable = slot1
	slot0.manifestoInput.interactable = slot1

	setActive(slot0.confirmBtn, slot1)
	setActive(slot0.cancelBtn, slot1)
	setActive(slot0.factionMask, slot0.guildVO:inChangefactionTime())

	if slot0.guildVO:inChangefactionTime() then
		setText(slot0:findTF("timer_container/Text", slot0.factionMask), slot0.guildVO:changeFactionLeftTime())
	end

	slot0.faction = slot0.guildVO:getFaction()

	onToggle(slot0, slot0.factionBLHXToggle, function (slot0)
		if slot0 then
			uv0.faction = Guild.FACTION_TYPE_BLHX
		end
	end, SFX_PANEL)
	onToggle(slot0, slot0.factionCSZZToggle, function (slot0)
		if slot0 then
			uv0.faction = Guild.FACTION_TYPE_CSZZ
		end
	end, SFX_PANEL)

	slot0.policy = slot0.guildVO:getPolicy()

	onToggle(slot0, slot0.policyRELAXToggle, function (slot0)
		if slot0 then
			uv0.policy = Guild.POLICY_TYPE_RELAXATION
		end
	end, SFX_PANEL)
	onToggle(slot0, slot0.policyPOWERToggle, function (slot0)
		if slot0 then
			uv0.policy = Guild.POLICY_TYPE_POWER
		end
	end, SFX_PANEL)

	if slot0.faction == Guild.FACTION_TYPE_BLHX then
		triggerToggle(slot0.factionBLHXToggle, true)
	elseif slot0.faction == Guild.FACTION_TYPE_CSZZ then
		triggerToggle(slot0.factionCSZZToggle, true)
	end

	if slot0.policy == Guild.POLICY_TYPE_RELAXATION then
		triggerToggle(slot0.policyRELAXToggle, true)
	elseif slot0.policy == Guild.POLICY_TYPE_POWER then
		triggerToggle(slot0.policyPOWERToggle, true)
	end

	slot0.policyPOWERToggle:GetComponent(typeof(Toggle)).interactable = slot1
	slot0.policyRELAXToggle:GetComponent(typeof(Toggle)).interactable = slot1
	slot0.factionCSZZToggle:GetComponent(typeof(Toggle)).interactable = slot1
	slot0.factionBLHXToggle:GetComponent(typeof(Toggle)).interactable = slot1
end

function slot0.updateModifyPanel(slot0)
	slot0.modifyPanel = findTF(slot0.themePanel, "modify_panel")
	slot0.nameInput = findTF(slot0.modifyPanel, "frame/name_bg/input"):GetComponent(typeof(InputField))
	slot0.factionBLHXToggle = findTF(slot0.modifyPanel, "frame/policy_container/faction/blhx")
	slot0.factionCSZZToggle = findTF(slot0.modifyPanel, "frame/policy_container/faction/cszz")
	slot0.policyRELAXToggle = findTF(slot0.modifyPanel, "frame/policy_container/policy/relax")
	slot0.policyPOWERToggle = findTF(slot0.modifyPanel, "frame/policy_container/policy/power")
	slot0.manifestoInput = findTF(slot0.modifyPanel, "frame/policy_container/input_frame/input"):GetComponent(typeof(InputField))
	slot0.confirmBtn = findTF(slot0.modifyPanel, "frame/confirm_btn")
	slot0.cancelBtn = findTF(slot0.modifyPanel, "frame/cancel_btn")
	slot0.quitBtn = findTF(slot0.modifyPanel, "frame/quit_btn")
	slot0.dissolveBtn = findTF(slot0.modifyPanel, "frame/dissolve_btn")
	slot0.factionMask = findTF(slot0.modifyPanel, "frame/policy_container/faction/mask")
	slot0.costTF = findTF(slot0.modifyPanel, "frame/confirm_btn/print_container/Text"):GetComponent(typeof(Text))
	slot1 = pg.gameset.modify_guild_cost.key_value or 0
	slot0.costTF.text = 0
	slot0.modifyBackBG = slot0:findTF("bg_decorations", slot0.modifyPanel)

	setActive(slot0.modifyPanel, false)
	onButton(slot0, slot0.cancelBtn, function ()
		uv0:closeModifyPanel()
	end, SFX_CANCEL)
	onButton(slot0, slot0.dissolveBtn, function ()
		if uv0.guildVO then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("guild_tip_dissolve"),
				onYes = function ()
					uv0:emit(GuildMainMediator.DISSOLVE, uv0.guildVO.id)
				end
			})
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.quitBtn, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("guild_tip_quit"),
			onYes = function ()
				uv0:emit(GuildMainMediator.QUIT, uv0.guildVO.id)
			end
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.modifyBackBG, function ()
		uv0:closeModifyPanel()
	end, SFX_PANEL)
	onButton(slot0, slot0.confirmBtn, function ()
		slot0 = Clone(uv0.guildVO)
		slot2 = uv0.manifestoInput.text

		if not uv0.nameInput.text or slot1 == "" then
			pg.TipsMgr.GetInstance():ShowTips(i18n("guild_create_error_noname"))

			return
		end

		if uv0.guildVO:getName() ~= slot1 and not nameValidityCheck(slot1, 0, 20, {
			"spece_illegal_tip",
			"login_newPlayerScene_name_tooShort",
			"login_newPlayerScene_name_tooLong",
			"err_name_existOtherChar"
		}) then
			return
		end

		if slot1 ~= uv0.guildVO:getName() and getProxy(PlayerProxy):getData():getTotalGem() < pg.gameset.modify_guild_cost.key_value then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_rmb"))

			return
		end

		if not slot2 or slot2 == "" then
			pg.TipsMgr.GetInstance():ShowTips(i18n("guild_create_error_nomanifesto"))

			return
		end

		slot0:setName(slot1)
		slot0:setPolicy(uv0.policy)
		slot0:setFaction(uv0.faction)
		slot0:setManifesto(slot2)

		function slot3()
			slot0 = false

			if uv0:getPolicy() ~= uv1.guildVO:getPolicy() then
				uv1:emit(GuildMainMediator.MODIFY, 3, uv0:getPolicy(), "")

				slot0 = true
			end

			if uv0:getManifesto() ~= uv1.guildVO:getManifesto() then
				uv1:emit(GuildMainMediator.MODIFY, 4, 0, uv0:getManifesto())

				slot0 = true
			end

			if uv0:getName() ~= uv1.guildVO:getName() then
				uv1:emit(GuildMainMediator.MODIFY, 1, 0, uv0:getName())

				slot0 = true
			end

			if not slot0 then
				uv1:closeModifyPanel()
			end
		end

		if slot0:getFaction() ~= uv0.guildVO:getFaction() then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("guild_faction_change_tip"),
				onYes = function ()
					uv0()
					uv1:emit(GuildMainMediator.MODIFY, 2, uv2:getFaction(), "")
				end
			})
		else
			slot3()
		end
	end, SFX_CONFIRM)

	function slot2(slot0)
		onInputChanged(uv0, slot0, function ()
			slot1, slot2 = wordVer(getInputText(uv0), {
				isReplace = true
			})

			if slot1 > 0 then
				setInputText(uv0, slot2)
			end

			if getInputText(uv1.nameInput) ~= uv1.guildVO:getName() then
				setText(uv1.costTF, uv2)
			else
				setText(uv1.costTF, 0)
			end
		end)
	end

	slot2(slot0.nameInput)
	slot2(slot0.manifestoInput)
	slot0:updateAllLog(slot0.logs)
	slot0:updateAllChat(slot0.chatMsgs)
end

function slot0.closeModifyPanel(slot0)
	if slot0.isShowModify then
		pg.UIMgr.GetInstance():UnblurPanel(slot0.modifyPanel, slot0.themePanel)

		slot0.isShowModify = nil

		setActive(slot0.modifyPanel, false)
		setActive(slot0.infoPanel, true)
		setActive(slot0.dialogPanel, true)
	end
end

function slot0.updateGuildInfo(slot0, slot1)
	if IsNil(slot0.themePanel) then
		return
	end

	slot0.nameTF.text = slot1:getName()
	slot0.idTF.text = slot1.id
	slot0.LevelTF.text = slot1.level <= 9 and "0" .. slot1.level or slot1.level
	slot0.expTF.text = slot1.exp .. "/" .. slot1:getLevelMaxExp()
	slot0.countTF.text = slot1.memberCount .. "/" .. slot1:getMaxMember()
	slot0.polity.text = slot1:getPolicyName()
	slot0.courseinfo.text = slot1:getFactionName()
	slot0.manifesto.text = slot1.manifesto
	slot0.announce.text = slot1.announce

	setFillAmount(slot0.expSlider, slot1.exp / math.max(slot1:getLevelMaxExp(), 1))
end

function slot0.updateAllChat(slot0, slot1)
	removeAllChildren(slot0.chatContent)

	slot3 = {}
	slot0.index = math.max(1, #(slot1 or {}) - Guild.CHAT_LOG_MAX_COUNT)

	for slot7 = slot0.index, #slot2 do
		table.insert(slot3, function (slot0)
			uv0:append(uv1[uv2], -1)
			slot0()
		end)
	end

	seriesAsync(slot3, function ()
		Timer.New(function ()
			if not IsNil(uv0.chatContent) then
				scrollToBottom(uv0.chatContent.parent)
			end
		end, 0.5, 1):Start()
	end)
end

function slot0.append(slot0, slot1, slot2, slot3)
	if IsNil(slot0.themePanel) then
		return
	end

	if slot0.chatContent.childCount >= Guild.CHAT_LOG_MAX_COUNT * 2 then
		slot0:emit(GuildMainMediator.REBUILD_ALL)
	else
		slot0:appendWorld(slot1, slot2)

		if slot3 then
			scrollToBottom(slot0.chatContent.parent)
		end
	end
end

function slot0.appendWorld(slot0, slot1, slot2)
	slot5 = slot0.prefabOthers

	if Clone(slot1).player.id == slot0.playerVO.id then
		slot5 = slot0.prefabSelf
		slot3.player = setmetatable(Clone(slot0.playerVO), {
			__index = slot3.player
		})
	end

	slot7 = GuildChatBubble.New(cloneTplTo(slot5, slot0.chatContent))

	if slot2 >= 0 then
		slot7.tf:SetSiblingIndex(slot2)
	end

	slot3.isSelf = slot4.id == slot0.playerVO.id

	slot7:update(slot3)
end

function slot0.updateAllLog(slot0, slot1)
	removeAllChildren(slot0.logContent)

	for slot5, slot6 in ipairs(slot1) do
		slot0:appendLog(slot6)
	end
end

function slot0.appendLog(slot0, slot1, slot2)
	if IsNil(slot0.themePanel) then
		return
	end

	if slot0.logContent.childCount >= 200 then
		slot0:emit(GuildMainMediator.ON_REBUILD_LOG_ALL)
	else
		slot3 = cloneTplTo(slot0.prefabPublic, slot0.logContent)

		if slot2 then
			slot3:SetAsFirstSibling()
		end

		slot5 = slot3:Find("content/time"):GetComponent(typeof(Text))
		slot6, slot7 = slot1:getConent()

		if slot1.cmd == GuildLogInfo.CMD_TYPE_GET_SHIP then
			ChatProxy.InjectPublic(slot3:Find("content/text"):GetComponent("RichText"), slot6)
		else
			slot4.text = slot6
		end

		slot5.text = slot7
	end
end

function slot0.willExit(slot0)
	if slot0.tweens then
		cancelTweens(slot0.tweens)
	end

	slot0:closeModifyPanel()

	if slot0.themePanel then
		PoolMgr.GetInstance():ReturnUI(slot0.guildVO:getMainUIName(), go(slot0.themePanel))
	end

	setParent(slot0.blurPanel, slot0._tf)
end

function slot0.insertEmojiToInputText(slot0, slot1)
	slot0.msgInput.text = slot0.msgInput.text .. string.gsub(ChatConst.EmojiIconCode, "code", slot1)
end

return slot0
