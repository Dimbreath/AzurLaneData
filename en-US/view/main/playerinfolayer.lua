slot0 = class("PlayerInfoLayer", import("..base.BaseUI"))
slot0.MAX_MEDAL_DISPLAY = 5
slot0.SECRETARY_MAX = 1

function slot0.getUIName(slot0)
	return "AdmiralUI"
end

function slot0.GetBGM(slot0)
	slot2 = getProxy(SettingsProxy):IsBGMEnable()

	if slot0.flagShip:IsBgmSkin() and slot2 then
		return slot1:GetSkinBgm()
	else
		return "main"
	end
end

function slot0.setPlayer(slot0, slot1)
	slot0:updatePlayerInfo(slot1)
end

function slot0.updatePlayerInfo(slot0, slot1)
	slot0.player = slot1
end

function slot0.setShipCount(slot0, slot1)
	slot0.shipCount = slot1 or 0
end

function slot0.setFleetGearScore(slot0, slot1)
	slot0.fleetGS = slot1
end

function slot0.setCurrentFlagship(slot0, slot1)
	slot0.flagShip = slot1

	slot0:updatePainting(slot1)
	slot0:updateLive2DState()
	slot0:updateBGState()
	slot0:updateBGMState()
	slot0:updateSwichSkinBtn(slot1)
end

function slot0.setCollectionRate(slot0, slot1)
	slot0.collectionRate = slot1
end

function slot0.setMilitaryExercise(slot0, slot1)
	slot0.seasonInfo = slot1
end

function slot0.setTrophyList(slot0, slot1)
	slot0.trophyList = slot1
end

function slot0.OffsetSource(slot0, slot1, slot2)
	slot5 = GetComponent(GetComponent(slot3, "Image").canvas, "RectTransform").rect.width
	slot6 = GetComponent(GetComponent(slot3, "Image").canvas, "RectTransform").rect.height
	slot8 = 0

	if GetComponent(slot0.rightPanel.parent, "AspectRatioFitter") and slot5 > slot7.aspectRatio * slot6 then
		slot8 = (slot5 - slot10) / slot9
	end

	setAnchoredPosition(slot1, {
		x = -(slot3.rect.width * slot0.rightPanel.localScale.x + slot2 + slot8)
	})
end

function slot0.init(slot0)
	slot0.eventTriggers = {}
	slot0.topPanel = slot0:findTF("blur_panel/adapt/top")
	slot0.rightPanel = slot0:findTF("blur_panel/adapt/right_panel")
	slot0.leftPanel = slot0:findTF("blur_panel/adapt/left_panel")
	slot0.bottomPanel = slot0:findTF("blur_panel/adapt/bottom_panel")
	slot0.characters = slot0:findTF("blur_panel/adapt/characters")
	slot0.backBtn = slot0:findTF("title/back", slot0.topPanel)
	slot0.helpBtn = slot0:findTF("blur_panel/adapt/help_btn")
	slot0.paintContain = slot0:findTF("paint", slot0.leftPanel)
	slot0.replaceBtn = slot0:findTF("replace_btn", slot0.leftPanel)
	slot0.swichSkinBtn = slot0:findTF("swichSkin_btn", slot0.leftPanel)
	slot0.hzszBtn = slot0:findTF("hzsz", slot0.leftPanel)
	slot0.live2dBtn = slot0:findTF("content/L2D_btn", slot0.bottomPanel)
	slot0.live2dToggle = slot0.live2dBtn:Find("toggle")
	slot0.live2dState = slot0.live2dBtn:Find("state")
	slot0.showBgBtn = slot0:findTF("content/BG_btn", slot0.bottomPanel)
	slot0.showBgToggle = slot0.showBgBtn:Find("toggle")
	slot0.bgmBtn = slot0:findTF("content/BGM_btn", slot0.bottomPanel)
	slot0.addMedalBtn = slot0:findTF("medalList/appendBtn", slot0.rightPanel)
	slot0.writeBtn = slot0:findTF("greet/write_btn", slot0.rightPanel)
	slot0.inputField = slot0:findTF("greet/InputField", slot0.rightPanel)
	slot0.medalList = slot0:findTF("medalList/container", slot0.rightPanel)
	slot0.medalTpl = slot0:findTF("medal_tpl", slot0.rightPanel)
	slot0.shareBtn = slot0:findTF("btn_share", slot0.rightPanel)
	slot0.modifyNameBtn = slot0:findTF("info_panel/title/name_bg/modify_btn", slot0.rightPanel)
	slot0.attireBtn = slot0:findTF("btn_attire", slot0.rightPanel)
end

function slot0.didEnter(slot0)
	slot0:uiStartAnimating()
	onButton(slot0, slot0.backBtn, function ()
		if slot0._currentDragDelegate then
			slot0._forceDropCharacter = true

			LuaHelper.triggerEndDrag(slot0._currentDragDelegate)
		end

		if isActive(slot0.characters) then
			slot0:hideCharacters()
		else
			slot0:uiExitAnimating()
			slot0.uiExitAnimating:emit(slot1.ON_BACK, nil, 0.5)
		end
	end, SFX_CANCEL)
	onButton(slot0, slot0.attireBtn, function ()
		slot0:emit(PlayerInfoMediator.ON_ATTIRE)
	end, SFX_PANEL)
	onButton(slot0, slot0.replaceBtn, function ()
		if isActive(slot0.characters) then
			slot0:hideCharacters()
		else
			slot0:showCharacters()
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.swichSkinBtn, function ()
		slot0:emit(PlayerInfoMediator.CHANGE_SKIN, slot0.flagShip)
	end)
	onButton(slot0, slot0.writeBtn, function ()
		activateInputField(slot0.inputField)
	end, SFX_PANEL)
	onButton(slot0, slot0.shareBtn, function ()
		pg.ShareMgr.GetInstance():Share(pg.ShareMgr.TypeAdmira)
	end, SFX_PANEL)
	onInputEndEdit(slot0, slot0.inputField, function (slot0)
		if wordVer(slot0) > 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("playerinfo_mask_word"))
			activateInputField(slot0.inputField)

			return
		end

		if not slot0 or slot0.manifesto == slot0 then
			return
		end

		slot0.manifesto = slot0

		slot0:emit(PlayerInfoMediator.CHANGE_MANIFESTO, slot0)
	end)
	onButton(slot0, slot0.helpBtn, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("secretary_help")
		})
	end)
	onButton(slot0, slot0.modifyNameBtn, function ()
		slot0, slot1 = slot0.player:canModifyName()

		if not slot0 then
			pg.TipsMgr.GetInstance():ShowTips(slot1)

			return
		end

		slot0:openChangePlayerNamePanel()
	end, SFX_PANEL)

	slot0.medalList = slot0:findTF("medalList/container", slot0.rightPanel)

	slot0:initPlayerInfo()
	slot0:updateManifesto()

	slot0.manifesto = slot0.player.manifesto

	slot0:updateSecretaryMax()
end

function slot0.updateSecretaryMax(slot0)
	slot0.secretary_max = 1
	slot1 = getProxy(ChapterProxy)

	for slot5, slot6 in pairs(pg.gameset.secretary_group_unlock.description) do
		if pg.chapter_template[slot6[1]] then
			slot0.SECRETARY_MAX = slot6[2]

			if slot1:isClear(slot6[1]) then
				slot0.secretary_max = slot6[2]
			end
		end
	end

	slot0.secretary_max = math.min(slot0.secretary_max, slot0.SECRETARY_MAX)
end

function slot0.showCharacters(slot0)
	slot0:updateSecretaryMax()
	slot0:initCharacters()
	setActive(slot0.characters, true)
	setActive(slot0.hzszBtn, true)
	setActive(slot0.replaceBtn, false)
	setActive(slot0.helpBtn, true)
	setActive(slot0.rightPanel, false)
	setActive(slot0.bottomPanel, false)
	setActive(slot0.swichSkinBtn, false)
	setActive(slot0.paintContain, false)
	onToggle(slot0, slot0.hzszBtn, function (slot0)
		setActive(slot0:findTF("setting_on", slot0.hzszBtn), slot0)
		setActive(slot0:findTF("setting_off", slot0.hzszBtn), not slot0)

		for slot4, slot5 in ipairs(slot0.cards) do
			if slot5.state == STATE_INFO then
				setActive(slot5.tr:Find("mask"), slot0)
			end
		end

		if slot0 then
			for slot4 = 1, 5, 1 do
				slot0:detachOnCardButton(slot0.cards[slot4])
			end
		else
			for slot4 = 1, slot0.secretary_max, 1 do
				slot0:attachOnCardButton(slot0.cards[slot4])
			end
		end
	end)
	triggerToggle(slot0.hzszBtn, false)
end

function slot0.hideCharacters(slot0)
	setActive(slot0.characters, false)
	setActive(slot0.hzszBtn, false)
	setActive(slot0.replaceBtn, true)
	setActive(slot0.helpBtn, false)
	setActive(slot0.rightPanel, true)
	setActive(slot0.bottomPanel, true)
	setActive(slot0.swichSkinBtn, slot0.isExistSkin)
	slot0:updateLive2DState()
	slot0:updateBGState()
	setActive(slot0.paintContain, true)
end

function slot0.initChangePlayerNamePanel(slot0, slot1)
	PoolMgr.GetInstance():GetUI("AdmiralUIChangeNamePanel", true, function (slot0)
		slot0.name = "changeName_panel"
		slot0.changeNamePanel = rtf(slot0)

		setParent(slot0.changeNamePanel, slot0._tf)
		setActive(slot0.changeNamePanel, false)

		slot0.changeNameTip = slot0:findTF("frame/border/tip", slot0.changeNamePanel):GetComponent(typeof(Text))
		slot0.changeNameConfirmBtn = slot0:findTF("frame/queren", slot0.changeNamePanel)
		slot0.changeNameCancelBtn = slot0:findTF("frame/cancel", slot0.changeNamePanel)
		slot0.changeNameInputField = slot0:findTF("frame/name_field", slot0.changeNamePanel)

		SetActive(slot0.changeNamePanel, false)
		onButton(slot0, slot0.changeNameConfirmBtn, function ()
			slot0 = getInputText(slot0.changeNameInputField)

			slot0:emit(PlayerInfoMediator.ON_CHANGE_PLAYER_NAME, slot0)
			setInputText(slot0.changeNameInputField, "")
		end, SFX_PANEL)
		onButton(slot0, slot0.changeNameCancelBtn, function ()
			slot0:closeChangePlayerNamePanel()
		end, SFX_PANEL)
		onButton(slot0, slot0.changeNamePanel, function ()
			slot0:closeChangePlayerNamePanel()
		end, SFX_PANEL)

		slot0.isInitChangeNamePanel = true

		slot0()
	end)
end

function slot0.openChangePlayerNamePanel(slot0)
	function slot1()
		slot0.isOpenChangeNamePanel = true

		SetActive(slot0.changeNamePanel, true)

		slot1 = nil
		slot2 = 0

		if SetActive.player:getModifyNameComsume()[1] == DROP_TYPE_RESOURCE then
			slot1 = Item.New({
				id = id2ItemId(slot0[2]),
				type = DROP_TYPE_ITEM,
				count = slot0[3]
			})
			slot2 = slot0.player:getResById(slot0[2])
		elseif slot0[1] == DROP_TYPE_ITEM then
			slot1 = Item.New({
				id = slot0[2],
				type = DROP_TYPE_ITEM,
				count = slot0[3]
			})
			slot2 = getProxy(BagProxy):getItemCountById(slot0[2])
		end

		slot0.changeNameTip.text = i18n("player_name_change_windows_tip", slot1:getConfig("name"), slot2 .. "/" .. slot0[3])
	end

	if not slot0.changeNamePanel then
		slot0:initChangePlayerNamePanel(slot1)
	else
		slot1()
	end
end

function slot0.closeChangePlayerNamePanel(slot0)
	slot0.isOpenChangeNamePanel = nil

	SetActive(slot0.changeNamePanel, false)
end

function slot0.onBackPressed(slot0)
	if isActive(GameObject.Find("OverlayCamera/Overlay/UIMain/DialogPanel")) then
		triggerButton(slot1.transform:Find("dialog/title/back"))

		return
	end

	if slot0.isOpenChangeNamePanel then
		slot0:closeChangePlayerNamePanel()
	else
		playSoundEffect(SFX_CANCEL)
		triggerButton(slot0.backBtn)
	end
end

function slot0.updateAttireBtn(slot0, slot1)
	setActive(slot0.attireBtn:Find("tip"), slot1)
end

function slot0.uiStartAnimating(slot0)
	setAnchoredPosition(slot0.topPanel, {
		y = 100
	})
	setAnchoredPosition(slot0.leftPanel, {
		x = -1280
	})
	setAnchoredPosition(slot0.bottomPanel, {
		y = -248
	})
	shiftPanel(slot0.topPanel, nil, 0, nil, 0.3, true, true)
	shiftPanel(slot0.leftPanel, 0, nil, nil, 0.3, true, true)
	shiftPanel(slot0.bottomPanel, nil, 0, nil, 0.3, true, true)
	setAnchoredPosition(slot1, {
		x = 1000
	})
	setAnchoredPosition(slot2, {
		x = 1000
	})
	setAnchoredPosition(slot3, {
		x = 1000
	})
	setAnchoredPosition(slot4, {
		x = 1000
	})
	shiftPanel(slot2, 0, nil, nil, 0.2, true, true)
	shiftPanel(slot1, 0, nil, nil, 0.25, true, true)
	shiftPanel(slot3, 0, nil, nil, 0.3, true, true)
	shiftPanel(slot0:findTF("greet", slot0.rightPanel), 0, nil, nil, 0.35, true, true)
end

function slot0.uiExitAnimating(slot0)
	shiftPanel(slot0.leftPanel, -1280, nil, 0.4, 0.08, true, true)
	shiftPanel(slot0.rightPanel, 1280, nil, 0.4, 0.08, true, true)
	shiftPanel(slot0.topPanel, nil, 100, 0.2, 0.2, true, true)
	shiftPanel(slot0.bottomPanel, nil, -248, nil, 0.1, true, true)
end

function slot0.updateManifesto(slot0)
	setInputText(slot0.inputField, slot0.player.manifesto)
end

function slot0.updatePainting(slot0, slot1)
	setPaintingPrefabAsync(slot0.paintContain, slot1:getPainting(), "kanban")
end

function slot0.updateFashion(slot0)
	setPaintingPrefabAsync(slot0.paintContain, slot0.skin.painting, "kanban")
	slot0:updateLive2DState()
	slot0:updateBGState()
end

function slot0.updateBGMState(slot0)
	slot1(slot3)

	if slot0.flagShip:IsBgmSkin() then
		setActive(slot0.bgmBtn, true)
		removeOnButton(slot0.bgmBtn)
		onButton(slot0, slot0.bgmBtn, function ()
			slot0 = not slot0

			slot1:SetBgmFlag(slot1.SetBgmFlag)
			slot1.SetBgmFlag(slot1.SetBgmFlag)
		end, SFX_PANEL)
	else
		removeOnButton(slot0.bgmBtn)
		setActive(slot0.bgmBtn, false)
	end
end

function slot0.updateLive2DState(slot0)
	slot1 = "live2d/" .. string.lower(slot0.flagShip:getPainting())
	slot3 = getProxy(SettingsProxy).getCharacterSetting(slot2, slot0.flagShip.id, "l2d")

	if Live2DUpdateMgr.Inst.state == DownloadState.None or slot5 == DownloadState.CheckFailure then
		slot4:CheckD()
	end

	if slot4:CheckF(slot1) == DownloadState.CheckToUpdate or slot6 == DownloadState.UpdateFailure then
		setActive(slot0.live2dBtn, true)
		setActive(slot0.live2dState, false)
		setActive(slot0.live2dToggle, true)
		setActive(slot0.live2dToggle:Find("on"), false)
		setActive(slot0.live2dToggle:Find("off"), true)
		onButton(slot0, slot0.live2dBtn, function ()
			slot0:UpdateF(slot0, true)
		end, SFX_PANEL)
	elseif slot6 == DownloadState.Updating then
		setActive(slot0.live2dBtn, true)
		setActive(slot0.live2dToggle, false)
		setActive(slot0.live2dState, true)
		removeOnButton(slot0.live2dBtn)
	else
		setActive(slot0.live2dBtn, PathMgr.FileExists(PathMgr.getAssetBundle(slot1)))

		if PathMgr.FileExists(PathMgr.getAssetBundle(slot1)) then
			setActive(slot0.live2dState, false)
			setActive(slot0.live2dToggle, true)
			setActive(slot0.live2dToggle:Find("on"), slot8)
			setActive(slot0.live2dToggle:Find("off"), not slot3)
			onButton(slot0, slot0.live2dBtn, function ()
				slot0:setCharacterSetting(slot1.flagShip.id, "l2d", not slot2)
				slot0:updateLive2DState()
			end, SFX_PANEL)
		end
	end

	if slot0.live2dTimer then
		slot0.live2dTimer:Stop()

		slot0.live2dTimer = nil
	end

	if slot6 == DownloadState.CheckToUpdate or slot6 == DownloadState.UpdateFailure or slot6 == DownloadState.Updating then
		slot0.live2dTimer = Timer.New(function ()
			slot0:updateLive2DState()
		end, 0.5, 1)

		slot0.live2dTimer:Start()
	end
end

function slot0.updateSwichSkinBtn(slot0, slot1)
	slot0.isExistSkin = slot0:isCurrentShipExistSkin(slot1)

	setActive(slot0.swichSkinBtn, slot0.isExistSkin and not isActive(slot0.characters))
end

function slot0.isCurrentShipExistSkin(slot0, slot1)
	if slot1 then
		if #slot0:getGroupSkinList(slot1) > 1 then
			return true
		elseif #slot2 == 1 then
			return false
		end
	end
end

function slot0.getGroupSkinList(slot0, slot1)
	return getProxy(ShipSkinProxy):GetAllSkinForShip(slot1)
end

function slot0.updateBGState(slot0)
	slot2 = getProxy(SettingsProxy).getCharacterSetting(slot1, slot0.flagShip.id, "bg")

	if slot0.flagShip:getShipBgPrint() ~= slot0.flagShip:rarity2bgPrintForGet() then
		setActive(slot0.showBgBtn, true)
		setActive(slot0.showBgToggle:Find("on"), slot2)
		setActive(slot0.showBgToggle:Find("off"), not slot2)
		removeOnButton(slot0.showBgBtn)
		onButton(slot0, slot0.showBgBtn, function ()
			slot0 = not slot0

			slot1:setCharacterSetting(slot2.flagShip.id, "bg", slot1.setCharacterSetting)
			setActive(slot2.showBgToggle:Find("on"), setActive)
			setActive(slot2.showBgToggle:Find("off"), not slot0)
		end, SFX_PANEL)
	else
		setActive(slot0.showBgBtn, false)
	end
end

function slot0.updateFleetGSView(slot0)
	setText(slot0:findTF("basic/info_list/score/value", slot0.rightPanel), slot0.fleetGS)
end

function slot0.initPlayerInfo(slot0)
	if math.max(slot0.player.maxRank, 1) > 14 then
		slot2 = 14
	end

	slot6 = {
		slot1.shipCount,
		slot1.attackCount,
		string.format("%0.1f", slot1.winCount / math.max(slot1.attackCount, 1) * 100) .. "%",
		slot1.collect_attack_count,
		slot1.pvp_attack_count,
		string.format("%0.1f", slot1.pvp_win_count / math.max(slot1.pvp_attack_count, 1) * 100) .. "%"
	}
	slot7 = slot0:findTF("info_panel", slot0.rightPanel)
	slot8 = slot0:findTF("statistics/exp_panel", slot0.rightPanel)

	setText(findTF(slot7, "title/name_bg/Text"), slot1.name)
	setText(findTF(slot7, "title/name_bg/uid"), slot1.id)
	setText(findTF(slot7, "title/lv_bg/Text"), "LV." .. slot1.level)
	setText(findTF(slot7, "title/exp"), slot0.player.exp .. "/" .. slot9)

	slot10 = slot0:findTF("basic/info_list", slot0.rightPanel)

	for slot14, slot15 in ipairs(slot5) do
		setText(findTF(slot10:GetChild(slot14 - 1), "value"), slot15 or 0)
	end

	LoadImageSpriteAsync("emblem/" .. slot13, slot11, true)
	LoadImageSpriteAsync("emblem/n_" .. slot13, slot12, true)

	if SeasonInfo.getMilitaryRank(slot0.seasonInfo.score, slot0.seasonInfo.rank) then
		slot15 = slot0:findTF("basic/medal/Text", slot0.rightPanel)
	end

	for slot18, slot19 in ipairs(slot6) do
		setText(findTF(slot8:GetChild(slot18 - 1), "value"), slot19 or 0)
	end

	slot0:updateMedalDisplay()
	slot0:setLanguages()
end

function slot0.updateMedalDisplay(slot0, slot1)
	slot0.selectedMedalList = slot0.player.displayTrophyList

	removeAllChildren(slot0.medalList)

	for slot6 = 1, math.min(#slot0.selectedMedalList, slot0.MAX_MEDAL_DISPLAY), 1 do
		LoadImageSpriteAsync("medal/s_" .. pg.medal_template[slot0.selectedMedalList[slot6]].icon, slot0:findTF("icon", cloneTplTo(slot0.medalTpl, slot0.medalList)), true)
	end

	setActive(slot0.addMedalBtn, false)
end

function slot0.updatePlayerName(slot0)
	slot0.selectedMedalList = Clone(slot0.player.displayTrophyList)

	setText(findTF(slot1, "title/name_bg/Text"), slot0.player.name)
end

function slot0.setLanguages(slot0)
	setText(slot0:findTF("info_panel/bg1/title_name", slot0.rightPanel), i18n("friend_resume_title"))
	setText(slot0:findTF("statistics/bg2/title_name", slot0.rightPanel), i18n("friend_resume_data_title"))
	setText(slot0:findTF("statistics/exp_panel/ship_count/name", slot0.rightPanel), i18n("friend_resume_ship_count"))
	setText(slot0:findTF("statistics/exp_panel/combat_count/name", slot0.rightPanel), i18n("friend_resume_attack_count"))
	setText(slot0:findTF("statistics/exp_panel/succeed_rate/name", slot0.rightPanel), i18n("friend_resume_attack_win_rate"))
	setText(slot0:findTF("statistics/exp_panel/action_count/name", slot0.rightPanel), i18n("friend_event_count"))
	setText(slot0:findTF("statistics/exp_panel/exercise_count/name", slot0.rightPanel), i18n("friend_resume_manoeuvre_count"))
	setText(slot0:findTF("statistics/exp_panel/exercise_rate/name", slot0.rightPanel), i18n("friend_resume_manoeuvre_win_rate"))
	setText(slot0:findTF("basic/info_list/collection_rate/name", slot0.rightPanel), i18n("friend_resume_collection_rate"))
	setText(slot0:findTF("basic/info_list/score/name", slot0.rightPanel), i18n("friend_resume_fleet_gs"))
end

function slot0.updateLive2DBtn(slot0, slot1, slot2)
	slot3 = slot2:Find("state")
	slot4 = "live2d/" .. string.lower(slot1:getPainting())

	if Live2DUpdateMgr.Inst.state == DownloadState.None or slot6 == DownloadState.CheckFailure then
		slot5:CheckD()
	end

	if slot5:CheckF(slot4) == DownloadState.CheckToUpdate or slot7 == DownloadState.UpdateFailure then
		setActive(slot2, true)
		setActive(slot3, false)
		setActive(slot2:Find("on"), false)
		setActive(slot2:Find("off"), true)
		onToggle(slot0, slot2, function (slot0)
			setActive(slot0:Find("on"), slot0)
			setActive(slot0:Find("off"), not slot0)

			if slot0 then
				slot1:UpdateF(slot1, true)
			end
		end, SFX_PANEL)
		triggerToggle(slot2, false)
	elseif slot7 == DownloadState.Updating then
		setActive(slot2, true)
		setActive(slot3, true)
		setActive(slot2:Find("on"), false)
		setActive(slot2:Find("off"), false)

		slot2:GetComponent(typeof(Toggle)).interactable = true
	else
		setActive(slot2, PathMgr.FileExists(PathMgr.getAssetBundle(slot4)))

		if PathMgr.FileExists(PathMgr.getAssetBundle(slot4)) then
			setActive(slot3, false)
			onToggle(slot0, slot2, function (slot0)
				setActive(slot0:Find("on"), slot0)
				setActive(slot0:Find("off"), not slot0)
				getProxy(SettingsProxy):setCharacterSetting(slot1.id, "l2d", slot0)
			end, SFX_PANEL)
			triggerToggle(slot2, getProxy(SettingsProxy):getCharacterSetting(slot1.id, "l2d"))
		end
	end

	if slot0.live2dTimer then
		slot0.live2dTimer:Stop()

		slot0.live2dTimer = nil
	end

	if slot7 == DownloadState.CheckToUpdate or slot7 == DownloadState.UpdateFailure or slot7 == DownloadState.Updating then
		slot0.live2dTimer = Timer.New(function ()
			slot0:updateLive2DBtn(slot0, )
		end, 0.5, 1)

		slot0.live2dTimer:Start()
	end
end

function slot0.updateCardByShip(slot0, slot1)
	if isActive(slot0.characters) then
		for slot5 = 1, 5, 1 do
			if slot1.id == slot0.player.characters[slot5] then
				slot0:updateCard(slot5)
			end
		end
	end
end

function slot0.updateCard(slot0, slot1)
	slot2 = slot0.player.characters[slot1]

	if slot0.secretary_max < slot1 and slot1 <= slot0.SECRETARY_MAX then
		setText(slot0.cards[slot1].tr:Find("lock/Text"), i18n("secretary_unlock" .. slot1))
	elseif slot0.SECRETARY_MAX < slot1 then
		setText(slot0.cards[slot1].tr:Find("lock/Text"), i18n("secretary_closed"))
	end

	if slot0.secretary_max < slot1 then
		slot0.cards[slot1]:update(nil, true)
	elseif slot2 then
		slot3 = getProxy(BayProxy):getShipById(slot2)

		slot0.cards[slot1]:update(slot3, false)
		slot0.cards[slot1]:updateProps(slot0:getCardAttrProps(slot3))
		slot0:updateLive2DBtn(slot3, slot5)

		slot6 = slot0.cards[slot1].tr:Find("mask/settings/bg")

		onToggle(slot0, slot6, function (slot0)
			setActive(slot0:Find("on"), slot0)
			setActive(slot0:Find("off"), not slot0)
			getProxy(SettingsProxy):setCharacterSetting(getProxy(SettingsProxy).setCharacterSetting, "bg", slot0)
		end)
		triggerToggle(slot6, getProxy(SettingsProxy):getCharacterSetting(slot2, "bg"))
		setActive(slot6, slot3:getShipBgPrint() ~= slot3:rarity2bgPrintForGet())

		slot7 = slot4.tr:Find("mask/settings/bgm")

		onToggle(slot0, slot7, function (slot0)
			setActive(slot0:Find("on"), slot0)
			setActive(slot0:Find("off"), not slot0)
			getProxy(SettingsProxy):setCharacterSetting(getProxy(SettingsProxy).setCharacterSetting, "bgm", slot0)
		end)
		triggerToggle(slot7, getProxy(SettingsProxy):getCharacterSetting(slot2, "bgm"))
		setActive(slot7, false)
		onButton(slot0, slot6, function ()
			slot0:emit(PlayerInfoMediator.CHANGE_SKIN, slot0)
		end)
		setActive(slot4.tr:Find("mask/skin"), slot0:isCurrentShipExistSkin(slot3))
	else
		slot0.cards[slot1]:update(nil, false)
	end

	slot0:detachOnCardButton(slot0.cards[slot1])

	if slot1 <= slot0.secretary_max then
		slot0:attachOnCardButton(slot0.cards[slot1])
	end
end

function slot0.initCharacters(slot0)
	if not slot0.cards then
		slot0.cards = {}

		for slot4 = 1, 5, 1 do
			table.insert(slot0.cards, FormationDetailCard.New(slot0.characters:GetChild(slot4 - 1).gameObject))
		end
	end

	for slot4 = 1, 5, 1 do
		slot0:updateCard(slot4)
	end
end

function slot0.getCardAttrProps(slot0, slot1)
	slot3, slot4, slot7[2] = slot1:getIntimacyDetail()

	return {
		{
			i18n("word_lv"),
			slot1.level
		},
		{
			i18n("attribute_intimacy"),
			slot5
		},
		{
			i18n("word_synthesize_power"),
			"<color=#ffff00>" .. math.floor(slot2) .. "</color>"
		}
	}
end

function slot0.detachOnCardButton(slot0, slot1)
	slot2 = GetOrAddComponent(slot1.go, "EventTriggerListener")

	slot2:RemovePointClickFunc()
	slot2:RemoveBeginDragFunc()
	slot2:RemoveDragFunc()
	slot2:RemoveDragEndFunc()
end

function slot0.change2ScrPos(slot0, slot1, slot2)
	return LuaHelper.ScreenToLocal(slot1, slot2, GameObject.Find("OverlayCamera"):GetComponent("Camera"))
end

function slot0.shift(slot0, slot1, slot2)
	if #slot0.cards > 0 then
		slot3[slot2] = slot3[slot1]
		slot3[slot1] = slot3[slot2]
	end

	slot0._shiftIndex = slot2
end

function slot0.attachOnCardButton(slot0, slot1)
	slot2 = GetOrAddComponent(slot1.go, "EventTriggerListener")
	slot0.eventTriggers[slot2] = true

	slot2:AddPointClickFunc(function (slot0, slot1)
		if not slot0.carddrag and slot0 == slot1.go then
			slot0:emit(PlayerInfoMediator.CHANGE_PAINT, slot1.shipVO)
			playSoundEffect(SFX_PANEL)
		end
	end)

	if slot1.shipVO then
		slot3 = slot0.cards
		slot4 = slot1.tr.parent:GetComponent("HorizontalLayoutGroup")
		slot5 = slot1.tr.rect.width * 0.5
		slot6 = nil
		slot7 = 0
		slot8 = {}

		function slot10()
			for slot3 = 1, #slot0, 1 do
				slot0[slot3].tr.anchoredPosition = slot1[slot3]
			end
		end

		slot11 = Timer.New(slot9, 0.03333333333333333, -1)

		slot2:AddBeginDragFunc(function ()
			if slot0.carddrag then
				return
			end

			slot0._currentDragDelegate = slot1
			slot0.carddrag = slot2
			slot3.enabled = false

			slot2.tr:SetSiblingIndex(#slot4 - 1)

			for slot3 = 1, #slot4, 1 do
				if slot4[slot3] == slot2 then
					slot0._shiftIndex = slot3
				end

				slot5[slot3] = slot4[slot3].tr.anchoredPosition
			end

			slot6:Start()
			LeanTween.scale(slot2.paintingTr, Vector3(1.1, 1.1, 0), 0.3)
		end)
		slot2:AddDragFunc(function (slot0, slot1)
			if slot0.carddrag ~= slot1 then
				return
			end

			slot1.tr.localPosition.x = slot0:change2ScrPos(slot1.tr.parent, slot1.position).x
			slot1.tr.localPosition = slot1.tr.localPosition

			if Time.realtimeSinceStartup < slot1.tr.localPosition then
				slot3 = slot1

				return
			end

			slot3 = 1

			for slot7 = 1, #slot4, 1 do
				if slot4[slot7] ~= slot1 and slot4[slot7].shipVO and slot1.tr.localPosition.x > slot4[slot7].tr.localPosition.x + ((slot3 < slot0._shiftIndex and 1.1) or -1.1) * slot5 then
					slot3 = slot3 + 1
				end
			end

			if slot0._shiftIndex ~= slot3 then
				slot0:shift(slot0._shiftIndex, slot3)

				slot2 = Time.realtimeSinceStartup + 0.15
			end
		end)
		slot2:AddDragEndFunc(function (slot0, slot1)
			if slot0.carddrag ~= slot1 then
				return
			end

			function resetCard()
				slot0()

				slot1.enabled = true
				slot2._shiftIndex = nil

				slot3:Stop()

				slot0 = {}

				for slot4 = 1, #slot2.cards, 1 do
					slot2.cards[slot4].tr:SetSiblingIndex(slot4 - 1)

					slot0[slot4] = slot4[slot4].shipVO and slot4[slot4].shipVO.id
				end

				slot2:emit(PlayerInfoMediator.CHANGE_PAINTS, slot0)

				slot5.enabled = true
				true.carddrag = nil
			end

			slot0._forceDropCharacter = nil
			slot0._currentDragDelegate = nil
			slot6.enabled = false

			if slot0._forceDropCharacter then
				resetCard()

				slot1.paintingTr.localScale = Vector3(1, 1, 0)
			else
				LeanTween.value(slot1.go, slot1.tr.anchoredPosition.x, slot0._shiftIndex[slot0._shiftIndex].x, math.min(math.abs(slot1.tr.anchoredPosition.x - slot7[slot0._shiftIndex].x) / 200, 1) * 0.3):setEase(LeanTweenType.easeOutCubic):setOnUpdate(System.Action_float(function (slot0)
					slot0.tr.anchoredPosition.x = slot0
					slot0.tr.anchoredPosition = slot0.tr.anchoredPosition
				end)):setOnComplete(System.Action(function ()
					resetCard()
					LeanTween.scale(slot0.paintingTr, Vector3(1, 1, 0), 0.3)
				end))
			end
		end)
	end
end

function slot0.willExit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.tweens then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-6, warpins: 1 ---
		cancelTweens(slot0.tweens)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-9, warpins: 2 ---
	if slot0.live2dTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-15, warpins: 1 ---
		slot0.live2dTimer:Stop()

		slot0.live2dTimer = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 16-18, warpins: 2 ---
	if slot0.eventTriggers then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-22, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 23-27, warpins: 0 ---
		for slot4, slot5 in pairs(slot0.eventTriggers) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 23-25, warpins: 1 ---
			ClearEventTrigger(slot4)
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 26-27, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 28-29, warpins: 1 ---
		slot0.eventTriggers = nil
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 30-30, warpins: 2 ---
	return
	--- END OF BLOCK #3 ---



end

return slot0
