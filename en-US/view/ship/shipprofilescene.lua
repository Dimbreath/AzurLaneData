slot0 = class("ShipProfileScene", import("..base.BaseUI"))
slot0.SHOW_SKILL_INFO = "event show skill info"
slot0.SHOW_EVALUATION = "event show evalution"
slot0.WEDDING_REVIEW = "ShipProfileScene:WEDDING_REVIEW"
slot0.INDEX_DETAIL = 1
slot0.INDEX_PROFILE = 2
slot0.INDEX_ARCHIVE = 3
slot1 = 0.35
slot2 = 19.8
slot0.CHAT_SHOW_TIME = 3
slot0.CHAT_ANIMATION_TIME = 0.3
slot0.SKIN_LIST_ALPHA_CONSTANT = 1.4
slot3 = {}

for slot7, slot8 in pairs(pg.character_voice) do
	slot3[#slot3 + 1] = setmetatable({}, {
		__index = slot8
	})
end

table.sort(slot3, function (slot0, slot1)
	return slot0.profile_index < slot1.profile_index
end)

function slot0.getUIName(slot0)
	return "ShipProfileUI"
end

function slot0.preload(slot0, slot1)
	slot5 = getProxy(CollectionProxy).getShipGroup(slot2, slot0.contextData.groupId).groupConfig
	slot6 = getProxy(CollectionProxy).getShipGroup(slot2, slot0.contextData.groupId).shipConfig.rarity

	if slot0.contextData.showTrans and slot3.trans then
		slot6 = slot6 + 1
	end

	GetSpriteFromAtlasAsync("bg/star_level_bg_" .. shipRarity2bgPrint(slot6, slot0.contextData.groupId * 10 + ((slot0.contextData.showTrans and slot3.trans and 9) or 0), slot3:isBluePrintGroup()), "", slot1)
end

function slot0.reloadCVKey(slot0)
	slot0.currentSkin = slot0.currentSkin or slot0.groupSkinList[1]
	slot0.currentSkinWord = pg.ship_skin_words[slot0.currentSkin.id]
	slot0.currentSkinWordEx = pg.ship_skin_words_extra[slot0.currentSkin.id]
	slot0.origSkinConfig = pg.ship_skin_words_extra[slot0.currentSkin.id]

	if slot0.currentSkinWord.voice_key >= 0 then
		slot1 = Ship.getCVKeyID(slot0.currentSkin.id)

		function slot2()
			if slot1.exited then
				pg.CriMgr.UnloadCVBank(slot0)
				pg.CriMgr.UnloadCVBank(slot1)
			else
				slot1.loadedCVBankName = slot0
				slot1.loadedCVBattleBankName = slot1
			end
		end

		if slot0.loadedCVBankName then
			pg.CriMgr.UnloadCVBank(slot0.loadedCVBankName)

			slot0.loadedCVBankName = nil
		end

		if slot0.loadedCVBattleBankName then
			pg.CriMgr.UnloadCVBank(slot0.loadedCVBattleBankName)

			slot0.loadedCVBattleBankName = nil
		end

		pg.CriMgr:LoadCV(slot1, slot2)
		pg.CriMgr:LoadBattleCV(slot1, slot2)
	end
end

function slot0.setShipGroup(slot0, slot1)
	slot0.shipGroup = slot1
	slot0.groupSkinList = ShipGroup.getSkinList(slot0.shipGroup.id)

	for slot5 = #slot0.groupSkinList, 1, -1 do
		if slot0.groupSkinList[slot5].skin_type == ShipSkin.SKIN_TYPE_OLD or (slot6.skin_type == ShipSkin.SKIN_TYPE_NOT_HAVE_HIDE and not getProxy(ShipSkinProxy):hasSkin(slot6.id)) then
			table.remove(slot0.groupSkinList, slot5)
		end
	end
end

function slot0.setShowTrans(slot0, slot1)
	slot0.showTrans = slot1
end

function slot0.setOwnedSkinList(slot0, slot1)
	slot0.ownedSkinList = slot1
end

function slot0.flushHearts(slot0)
	setText(slot0.labelHeart, (slot0.shipGroup.hearts > 999 and "999+") or slot1)

	slot0.labelHeart:GetComponent("Text").color = (slot0.shipGroup.iheart and Color.New(1, 0.6, 0.6)) or Color.New(1, 1, 1)

	setActive(slot0:findTF("unlike", slot0.btnLike), not slot0.shipGroup.iheart)
	setActive(slot0:findTF("like", slot0.btnLike), slot0.shipGroup.iheart)
end

function slot0.init(slot0)
	slot0.maskTxts = {}
	slot0.bg = slot0:findTF("bg")
	slot0.staticBg = slot0.bg:Find("static_bg")
	slot0.painting = slot0:findTF("paint")
	slot0.paintingInitPos = slot0.painting.transform.localPosition
	slot0.chat = slot0:findTF("chat", slot0.painting)
	slot0.chatBg = slot0:findTF("chatbgtop", slot0.chat)
	slot0.initChatBgH = slot0.chatBg.sizeDelta.y
	slot0.chatText = slot0:findTF("Text", slot0.chatBg)
	slot0.chat.localScale = Vector3(0, 0)

	setActive(slot0.chat, false)

	slot0.name = slot0:findTF("name")
	slot0.nameInitPos = slot0.name.transform.localPosition
	slot0.labelName = slot0:findTF("name_mask/Text", slot0.name)
	slot0.labelEnName = slot0:findTF("english_name", slot0.name)
	slot0.shipType = slot0:findTF("type", slot0.name)
	slot0.stars = slot0:findTF("stars", slot0.name)
	slot0.star = slot0:findTF("star_tpl", slot0.stars)
	slot0.blurPanel = slot0:findTF("blur_panel")
	slot0.top = slot0:findTF("blur_panel/adapt/top")
	slot0.btnBack = slot0:findTF("back", slot0.top)
	slot0.leftProfile = slot0:findTF("blur_panel/adapt/profile_left_panel")
	slot0.profile = slot0:findTF("profile_panel")
	slot0.profileBlurRect = slot0:findTF("bg", slot0.profile)
	slot0.live2dBtn = slot0:findTF("L2D_btn", slot0.blurPanel)
	slot0.live2dToggle = slot0.live2dBtn:Find("toggle")
	slot0.live2dState = slot0.live2dBtn:Find("state")
	slot0.bottomTF = slot0:findTF("bottom")
	slot0.toggles = {
		slot0:findTF("bottom/detail"),
		slot0:findTF("bottom/profile"),
		slot0:findTF("bottom/archive")
	}
	slot0.toggleInits = {
		"initDetail",
		"initProfile",
		"initArchive"
	}

	setActive(slot0.star, false)

	slot0.skinTimers = {}
end

function slot0.uiStartAnimating(slot0)
	slot1 = 0

	LeanTween.alphaCanvas(slot3, 1, slot2):setFrom(0)
	LeanTween.alphaCanvas(slot4, 1, 0.3):setFrom(0)
end

function slot0.didEnter(slot0)
	slot0:uiStartAnimating()
	onButton(slot0, slot0.btnBack, function ()
		slot0:emit(slot1.ON_BACK)
	end, SFX_CANCEL)

	for slot4, slot5 in ipairs(slot0.toggles) do
		onToggle(slot0, slot5, function (slot0)
			if slot0 ~= 2 then
				slot1:switchLive2d(false)
			end

			if slot0 >= 3 and slot0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_systemClose"))
				triggerToggle(slot1.toggles[1], true)

				return
			end

			if slot0 then
				if slot1.toggleInits[slot0] then
					slot1[slot1.toggleInits[slot0]](slot1[slot1.toggleInits[slot0]])

					slot1[slot1.toggleInits[slot0]].toggleInits[slot0] = nil
				end

				slot1:switchTo(slot0)
			end
		end, SFX_PANEL)
	end

	slot0:initCommon()
	triggerToggle(slot0.toggles[1], true)
	slot0:switchLive2d(false)
	pg.UIMgr.GetInstance():OverlayPanel(slot0.blurPanel, {
		groupName = LayerWeightConst.GROUP_SHIP_PROFILE
	})
	slot0:reloadCVKey()
end

function slot0.onBackPressed(slot0)
	if isActive(GameObject.Find("OverlayCamera/Overlay/UIMain/DialogPanel")) then
		triggerButton(slot1.transform:Find("dialog/title/back"))

		return
	end

	if LeanTween.isTweening(go(slot0.painting)) then
		return
	end

	playSoundEffect(SFX_CANCEL)

	if slot0.paintPreview then
		slot0:hidePaintView(true)

		return
	end

	triggerButton(slot0.btnBack)
end

function slot0.switchLive2d(slot0, slot1)
	slot2 = false
	slot0.l2dIsOn = slot1

	setActive(slot0:findTF("view_btn", slot0.profile), true)

	slot3 = "live2d/" .. slot0.paintingName

	if Live2DUpdateMgr.Inst.state == DownloadState.None or slot5 == DownloadState.CheckFailure then
		slot4:CheckD()
	end

	if slot4:CheckF(slot3) == DownloadState.CheckToUpdate or slot6 == DownloadState.UpdateFailure then
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
		setActive(slot0.live2dBtn, PathMgr.FileExists(PathMgr.getAssetBundle(slot3)))

		if PathMgr.FileExists(PathMgr.getAssetBundle(slot3)) then
			slot0.live2dChecked = slot1

			setActive(slot0.live2dState, false)
			setActive(slot0.live2dToggle, true)
			setActive(slot0.live2dToggle:Find("on"), slot0.live2dChecked)
			setActive(slot0.live2dToggle:Find("off"), not slot0.live2dChecked)
			setActive(slot0:findTF("view_btn", slot0.profile), not slot0.live2dChecked)

			if slot0.live2dChecked then
				slot0:createLive2D(slot0.paintingName)

				slot2 = modelName == "biaoqiang" or modelName == "z23" or modelName == "lafei" or modelName == "lingbo" or modelName == "mingshi"
			else
				slot0:hideLive2D()
			end

			onButton(slot0, slot0.live2dBtn, function ()
				if slot0.l2dChar and slot0.l2dChar.state == Live2D.STATE_LOADING then
					return
				end

				slot0.chatFlag = false

				slot0:switchLive2d(not slot0.live2dChecked)
				slot0.switchLive2d:switchVoiceList(slot0.live2dChecked)
			end, SFX_PANEL)
		end
	end

	if slot0.live2dTimer then
		slot0.live2dTimer:Stop()

		slot0.live2dTimer = nil
	end

	if slot6 == DownloadState.CheckToUpdate or slot6 == DownloadState.UpdateFailure or slot6 == DownloadState.Updating then
		slot0.live2dTimer = Timer.New(function ()
			slot0:switchLive2d((slot0:CheckF(slot0) == DownloadState.UpdateSuccess and true) or slot3)
		end, 0.5, 1)

		slot0.live2dTimer:Start()
	end

	if not slot2 then
		rtf(slot0.painting).anchorMin = Vector2(0.5, 0.5)
		rtf(slot0.painting).anchorMax = Vector2(0.5, 0.5)
		rtf(slot0.painting).pivot = Vector2(0.5, 0.5)
	else
		rtf(slot0.painting).anchorMin = Vector2(0.5, 0)
		rtf(slot0.painting).anchorMax = Vector2(0.5, 0)
		rtf(slot0.painting).pivot = Vector2(0.5, 0)
	end
end

function slot0.switchTo(slot0, slot1)
	if slot0.index ~= slot1 then
		slot2 = pg.UIMgr.GetInstance()

		if slot1 == slot0.INDEX_DETAIL then
			pg.UIMgr.GetInstance():OverlayPanel(slot0.blurPanel, {
				groupName = LayerWeightConst.GROUP_SHIP_PROFILE
			})
			LeanTween.moveX(rtf(slot0.detailLeft), 0, slot1):setEase(LeanTweenType.easeInOutSine)
			LeanTween.moveX(rtf(slot0.detailRight), 0, slot1):setEase(LeanTweenType.easeInOutSine)
			LeanTween.moveX(rtf(slot0.profile), 1000, slot1):setEase(LeanTweenType.easeInOutSine)
			LeanTween.moveX(rtf(slot0.leftProfile), -500, slot1):setEase(LeanTweenType.easeInOutSine)
			LeanTween.moveY(rtf(slot0.live2dBtn), -70, slot1):setEase(LeanTweenType.easeInOutSine)
			LeanTween.moveX(rtf(slot0.painting), slot0.paintingInitPos.x, slot1):setEase(LeanTweenType.easeInOutSine)
			LeanTween.moveX(rtf(slot0.name), slot0.nameInitPos.x, slot1):setEase(LeanTweenType.easeInOutSine)
		end

		if slot1 == slot0.INDEX_PROFILE then
			pg.UIMgr.GetInstance():OverlayPanel(slot0.blurPanel, {
				groupName = LayerWeightConst.GROUP_SHIP_PROFILE
			})
			LeanTween.moveX(rtf(slot0.profile), 0, slot1):setEase(LeanTweenType.easeInOutSine)
			LeanTween.moveX(rtf(slot0.leftProfile), 0, slot1):setEase(LeanTweenType.easeInOutSine)
			LeanTween.moveX(rtf(slot0.detailRight), 1000, slot1):setEase(LeanTweenType.easeInOutSine)
			LeanTween.moveY(rtf(slot0.live2dBtn), 60, slot1):setEase(LeanTweenType.easeInOutSine)
			LeanTween.moveX(rtf(slot0.painting), slot0.paintingInitPos.x + 50, slot1):setEase(LeanTweenType.easeInOutSine)
			LeanTween.moveX(rtf(slot0.name), slot0.nameInitPos.x + 50, slot1):setEase(LeanTweenType.easeInOutSine)
		end

		LeanTween.moveX(rtf(slot0.bottomTF), 850, slot1):setEase(LeanTweenType.easeInOutSine):setOnComplete(System.Action(function ()
			LeanTween.moveX(rtf(slot0.bottomTF), -14, 0):setEase(LeanTweenType.easeInOutSine)
		end))

		slot0.index = slot1
	end
end

function slot0.initCommon(slot0)
	slot0:loadSkinBg(shipRarity2bgPrint(slot0.shipGroup:getRarity(slot0.showTrans), slot0.shipGroup.id * 10, slot0.shipGroup:isBluePrintGroup()))

	slot0.paintingName = slot0.shipGroup:getPainting(slot0.showTrans)
	slot0.live2dOffset = BuildVector3(pg.ship_skin_template[slot0.shipGroup.id * 10 + ((slot0.showTrans and 9) or 0)].live2d_offset)

	setPaintingPrefabAsync(slot0.painting, slot0.paintingName, "chuanwu")
	setImageSprite(slot0.shipType, GetSpriteFromAtlas("shiptype", slot0.shipGroup:getShipType(slot0.showTrans)))
	setText(slot0.labelName, slot0.shipGroup:getName(slot0.showTrans))
	setText(slot0.labelEnName, slot0.shipGroup.shipConfig.english_name)

	for slot7 = 1, slot1.star, 1 do
		cloneTplTo(slot0.star, slot0.stars)
	end
end

function slot0.initDetail(slot0)
	slot0.detailLeft = slot0:findTF("blur_panel/adapt/detail_left_panel")
	slot0.lockBtn = slot0:findTF("lock_btn", slot0.detailLeft)
	slot0.unlockBtn = slot0:findTF("unlock_btn", slot0.detailLeft)
	slot0.labelHeart = slot0:findTF("heart/label", slot0.detailLeft)
	slot0.btnLike = slot0:findTF("heart/btnLike", slot0.detailLeft)
	slot0.detailRight = slot0:findTF("detail_right_panel")
	slot0.detailRightBlurRect = slot0:findTF("bg", slot0.detailRight)
	slot0.viewBtn = slot0:findTF("view_btn", slot0.detailRight)
	slot0.evaBtn = slot0:findTF("eva_btn", slot0.detailRight)
	slot0.shareBtn = slot0:findTF("share_btn", slot0.detailRight)
	slot0.skillRect = slot0:findTF("bg/skill_panel/frame/skills_rect", slot0.detailRight)
	slot0.skillPanel = slot0:findTF("skills", slot0.skillRect)
	slot0.skillTpl = slot0:findTF("skilltpl", slot0.skillRect)
	slot0.skillArrLeft = slot0:findTF("bg/skill_panel/frame/arrow1", slot0.detailRight)
	slot0.skillArrRight = slot0:findTF("bg/skill_panel/frame/arrow2", slot0.detailRight)

	slot0:flushHearts()
	slot0:initSkills()

	slot0.propertyPanel = PropertyPanel.New(slot0.detailRight:Find("bg/property_panel/frame"))

	slot0.propertyPanel:initProperty(slot0.shipGroup.shipConfig.id)

	if slot0.showTrans and slot0.shipGroup.trans then
		slot0.propertyPanel:initRadar(slot0.shipGroup.groupConfig.trans_radar_chart)
	end

	setActive(slot0.evaBtn, not slot0.showTrans)
	onButton(slot0, slot0.viewBtn, function ()
		slot0:paintView()
	end, SFX_PANEL)
	onButton(slot0, slot0.evaBtn, function ()
		slot0:emit(slot1.SHOW_EVALUATION)
	end, SFX_PANEL)
	onButton(slot0, slot0.shareBtn, function ()
		pg.ShareMgr.GetInstance():Share(pg.ShareMgr.TypeShipProfile)
	end, SFX_PANEL)
end

function slot0.initSkills(slot0)
	slot2 = 0
	slot3 = Clone(pg.ship_data_template[slot0.shipGroup:getShipConfigId(slot0.showTrans)].buff_list_display)

	if not slot0.showTrans then
		_.each(slot0.shipGroup.groupConfig.trans_skill, function (slot0)
			table.removebyvalue(slot0, slot0)
		end)
	end

	slot4 = slot0.skillPanel.childCount
	slot5 = (#slot3 < 3 and 3) or #slot3

	for slot9 = slot4 + 1, slot5, 1 do
		cloneTplTo(slot0.skillTpl, slot0.skillPanel)
	end

	for slot9 = 1, slot0.skillPanel.childCount, 1 do
		slot11 = slot9 <= #slot3
		slot12 = findTF(slot0.skillPanel:GetChild(slot9 - 1), "icon")

		if slot11 then
			slot13 = slot3[slot9]

			if slot0.shipGroup:isBluePrintGroup() then
				for slot17, slot18 in ipairs(slot0.shipGroup:getBluePrintChangeSkillList()) do
					if slot18[1] == slot13 then
						slot13 = slot18[2]

						break
					end
				end
			end

			LoadImageSpriteAsync("skillicon/" .. getSkillConfig(slot13).icon, slot12)
			setActive(slot0:findTF("icon", slot10), true)
			setActive(slot0:findTF("add", slot10), false)
			onButton(slot0, slot10, function ()
				slot0:emit(slot1.SHOW_SKILL_INFO, slot2.id, {
					id = slot2.id,
					level = pg.skill_data_template[slot2.id].max_level
				})
			end, SFX_PANEL)
		else
			setActive(slot0:findTF("icon", slot10), false)
			setActive(slot0:findTF("add", slot10), true)
		end

		setActive(slot10, slot9 <= slot5)
	end

	setActive(slot0.skillArrLeft, #slot3 > 3)
	setActive(slot0.skillArrRight, #slot3 > 3)

	if #slot3 > 3 then
		onScroll(slot0, slot0.skillRect, function (slot0)
			setActive(slot0.skillArrLeft, slot0.x > 0.01)
			setActive(slot0.skillArrRight, slot0.x < 0.99)
		end)
	else
		GetComponent(slot0.skillRect, typeof(ScrollRect)).onValueChanged:RemoveAllListeners()
	end

	setAnchoredPosition(slot0.skillPanel, {
		x = 0
	})
end

function slot0.paintView(slot0)
	slot1 = {}
	slot2 = slot0._tf.childCount
	slot3 = 0

	while slot2 > slot3 do
		if slot0._tf:GetChild(slot3).gameObject.activeSelf and slot4 ~= slot0.painting and slot4 ~= slot0.bg then
			slot1[#slot1 + 1] = slot4

			setActive(slot4, false)
		end

		slot3 = slot3 + 1
	end

	for slot7, slot8 in ipairs({
		slot0.detailRight,
		slot0.profile,
		slot0.bottomTF,
		slot0.blurPanel
	}) do
		if slot8 and slot8.gameObject.activeSelf then
			slot1[#slot1 + 1] = slot8

			setActive(slot8, false)
		end
	end

	slot0.painting:GetComponent("CanvasGroup").blocksRaycasts = false
	slot5 = slot0.painting.anchoredPosition.x
	slot6 = slot0.painting.anchoredPosition.y
	slot9 = slot0._tf.rect.width / UnityEngine.Screen.width
	slot10 = slot0._tf.rect.height / UnityEngine.Screen.height
	slot11 = slot0.painting.rect.width / 2
	slot12 = slot0.painting.rect.height / 2
	slot14 = slot0.painting:Find("fitter"):GetChild(0)

	LeanTween.moveX(slot0.painting, 0, 0.3):setEase(LeanTweenType.easeInOutSine):setOnComplete(System.Action(function ()
		openPortrait()

		slot1 = false
		slot2, slot3 = nil
		slot4 = GetOrAddComponent(slot0.bg, "MultiTouchZoom")

		slot4:SetZoomTarget(slot0.painting)

		slot5 = GetOrAddComponent(slot0.bg, "EventTriggerListener")
		slot0.dragTrigger = slot5
		slot4.enabled = true
		slot5.enabled = true

		slot5:AddPointDownFunc(function (slot0)
			if Input.touchCount == 1 or Application.isEditor then
				slot0 = true
				slot1 = true
			elseif Input.touchCount >= 2 then
				slot1 = false
				slot0 = false
			end
		end)
		slot5:AddPointUpFunc(function (slot0)
			if Input.touchCount <= 2 then
				slot0 = true
			end
		end)
		slot5:AddBeginDragFunc(function (slot0, slot1)
			slot0 = false
			slot5 = slot1.position.x *  - slot1.position.x - tf(slot4.painting).localPosition.x.position.y * slot6 - slot7 - tf(slot4.painting.painting).localPosition.y
		end)
		slot5:AddDragFunc(function (slot0, slot1)
			if slot0 then
				tf(slot1.painting).localPosition = Vector3(slot1.position.x * slot2 - slot3 - slot4 - 150, slot1.position.y * slot5 -  - slot1.position.y * slot5, -22)
			end
		end)

		slot0.bg:GetComponent("Button").enabled = true

		onButton(slot0, slot0.bg, function ()
			slot0:hidePaintView()
		end, SFX_CANCEL)

		function slot5.hidePaintView(slot0, slot1)
			if not slot1 and not slot0 then
				return
			end

			slot1.enabled = false
			slot1.enabled = false

			for slot5, slot6 in ipairs(false) do
				setActive(slot6, true)
			end

			closePortrait()

			slot0.painting.localScale = Vector3(1, 1, 1)

			setAnchoredPosition(slot0.painting, {
				x = slot4,
				y = slot4
			})

			slot0.bg:GetComponent("Button").enabled = false
			slot6.blocksRaycasts = true
			slot0.paintPreview = false
		end
	end))

	slot0.paintPreview = true
end

function slot0.initProfile(slot0)
	slot0.authorPanel = slot0:findTF("bg/author_panel", slot0.profile)
	slot0.linesPanel = slot0:findTF("bg/lines_panel", slot0.profile)
	slot0.prototypePanel = slot0:findTF("bg/prototype_panel", slot0.profile)

	slot0:clearScrollTxt()
	setActive(slot0.chat, true)

	slot0.chat.localScale = Vector3(0, 0)
	slot0.voiceTpl = slot0:getTpl("lines_list/lines_tpl", slot0.linesPanel)
	slot0.voiceContainer = slot0:findTF("lines_list/Grid", slot0.linesPanel)
	slot0.voiceScroll = slot0:findTF("lines_list", slot0.linesPanel).gameObject:GetComponent(typeof(ScrollRect))
	slot1 = 1

	if slot0.showTrans then
		slot2 = ShipGroup.getModSkin(slot0.shipGroup.id).id

		for slot6, slot7 in ipairs(slot0.groupSkinList) do
			if slot7.id == slot2 then
				slot1 = slot6

				break
			end
		end
	end

	if HXSet.isHx() then
		for slot5 = #slot0.groupSkinList, 1, -1 do
			if pg.ship_skin_template[slot0.groupSkinList[slot5].id].isHX == 1 then
				table.remove(slot0.groupSkinList, slot5)
			end
		end
	end

	for slot5 = #slot0.groupSkinList, 1, -1 do
		if pg.ship_skin_template[slot0.groupSkinList[slot5].id].no_showing == "1" then
			table.remove(slot0.groupSkinList, slot5)
		end
	end

	slot3 = ScrollTxt.New(slot0:findTF("bg/author_panel/illustPanel/illustrator/label/mask", slot0.profile), slot0:findTF("bg/author_panel/illustPanel/illustrator/label/mask/Text", slot0.profile))

	slot3:setText(Nation.Nation2facionName(slot2) .. "-" .. Nation.Nation2Name(slot0.shipGroup.shipConfig.nationality))
	table.insert(slot0.maskTxts, slot3)
	slot0:shiftSkin(slot1)
	slot0:setProfileInfo()

	slot0.skinScroll = slot0:findTF("scroll", slot0.leftProfile)
	slot0.skinViewport = slot0:findTF("Viewport", slot0.skinScroll)
	slot0.skinList = slot0:findTF("skin_container", slot0.skinViewport)

	if #slot0.groupSkinList == 1 then
		setActive(slot0.skinList, false)
	else
		slot0.spaceY = GetComponent(slot0.skinList, typeof(GridLayoutGroup)).spacing.y
		slot0.skinTplHeight = GetComponent(slot4, typeof(RectTransform)).rect.height
		slot0.upY = slot0.skinScroll:TransformPoint(Vector3(slot0.skinScroll.anchoredPosition.x, slot0.skinScroll.anchoredPosition.y + slot0.skinTplHeight, 0))
		slot0.bottomY = slot0.skinScroll:TransformPoint(Vector3(slot0.skinScroll.anchoredPosition.x, -slot0.skinScroll.anchoredPosition.y - slot0.skinTplHeight, 0))
		slot0.skinCanvasGroup = {}

		GetComponent(slot0.skinScroll, typeof(ScrollRect)).onValueChanged.RemoveAllListeners(slot5)
		GetComponent(slot0.skinScroll, typeof(ScrollRect)).onValueChanged.AddListener(slot5, function (slot0)
			for slot4, slot5 in ipairs(slot0.skinCanvasGroup) do
				if slot0.upY.y < slot5.transform.position.y or slot5.transform.position.y < slot0.bottomY.y then
					slot5.alpha = 0.5
				else
					slot5.alpha = 1
				end
			end
		end)
		setActive(slot0.skinList, true)

		slot0.currSkin = nil

		for slot9, slot10 in ipairs(slot0.groupSkinList) do
			slot11 = cloneTplTo(slot4, slot0.skinList)

			table.insert(slot0.skinNameList, slot12)
			table.insert(slot0.skinCanvasGroup, GetOrAddComponent(slot11, typeof(CanvasGroup)))

			if slot10.skin_type == ShipSkin.SKIN_TYPE_DEFAULT or table.contains(slot0.ownedSkinList, slot10.id) or (slot10.skin_type == ShipSkin.SKIN_TYPE_REMAKE and slot0.shipGroup.trans) or (slot10.skin_type == ShipSkin.SKIN_TYPE_PROPOSE and slot0.shipGroup.married == 1) then
				slot12:setText(HXSet.hxLan(slot10.name))
				onButton(slot0, slot11, function ()
					if slot0.currSkin ~= slot1 then
						slot0:shiftSkin(slot0)

						slot0.shiftSkin.currSkin = slot0
					end

					if slot0.prevSelected then
						setActive(slot0.prevSelected, false)
					end

					slot0.prevSelected = slot2:Find("selected")

					setActive(slot0.prevSelected, true)

					setActive.chatFlag = false
				end)
			else
				slot12:setText(HXSet.hxLan(slot10.name))
				onButton(slot0, slot11, function ()
					pg.TipsMgr.GetInstance():ShowTips(i18n("ship_profile_skin_locked"))
				end)
				setActive(slot11:Find("lock"), true)
			end

			if slot9 == 1 then
				triggerButton(slot11, true)
			end

			setActive(slot11:Find("timelimit"), getProxy(ShipSkinProxy):getSkinById(slot10.id) and slot13:isExpireType() and not slot13:isExpired())

			if slot0.skinTimers[slot10.id] then
				slot0.skinTimers[slot10.id]:Stop()
			end

			if slot14 then
				slot0.skinTimers[slot13.id] = Timer.New(function ()
					setText(slot1:Find("timelimit/Text"), skinTimeStamp(slot0:getRemainTime()))
				end, 1, -1)

				slot0.skinTimers[slot13.id]:Start()
				slot0.skinTimers[slot13.id].func()
			end
		end
	end

	slot4 = slot0:findTF("bg/wedding", slot0.profile)

	if slot0.shipGroup.married == 1 then
		setActive(slot4, true)
		onButton(slot0, slot4, function ()
			if slot0._currentVoice then
				slot0._currentVoice:Stop(true)
			end

			slot0:emit(slot1.WEDDING_REVIEW, {
				group = slot0.shipGroup,
				skinID = slot0.currentSkin.id
			})
		end)
	elseif slot0.shipGroup.married == 0 then
		setActive(slot4, false)
	end

	onButton(slot0, slot0:findTF("view_btn", slot0.profile), function ()
		slot0:paintView()
	end, SFX_PANEL)

	if not slot0.showTrans then
		onButton(slot0, slot0:findTF("eva_btn", slot0.profile), function ()
			slot0:emit(slot1.SHOW_EVALUATION)
		end, SFX_PANEL)
	end

	setActive(slot0:findTF("eva_btn", slot0.profile), not slot0.showTrans)
	onButton(slot0, slot0:findTF("share_btn", slot0.profile), function ()
		pg.ShareMgr.GetInstance():Share(pg.ShareMgr.TypeShipProfile)
	end, SFX_PANEL)

	slot0.languageChangeTF = slot0:findTF("bg/language_change", slot0.profile)
	slot0.languageBtnCH = slot0:findTF("btn_ch", slot0.languageChangeTF)
	slot0.languageBtnJP = slot0:findTF("btn_jp", slot0.languageChangeTF)
	slot6 = pg.ship_skin_words[slot0.currentSkin.id / 10 * 10].voice_key

	if pg.ship_skin_words[slot0.currentSkin.id / 10 * 10].voice_key_2 >= 0 or slot5 == -2 then
		slot0.languageType = PlayerPrefs.GetInt("CV_LANGUAGE_" .. slot0.currentSkin.ship_group)

		if slot0.languageType == 0 and slot5 > 0 then
			slot0.languageType = pg.gameset.language_default.key_value

			PlayerPrefs.SetInt("CV_LANGUAGE_" .. slot0.currentSkin.ship_group, slot0.languageType)
		end

		setActive(slot0.languageBtnJP, slot0.languageType ~= 2)
		setActive(slot0.languageBtnCH, slot0.languageType == 2)
	else
		setActive(slot0.languageBtnCH, false)
		setActive(slot0.languageBtnJP, false)
	end

	onButton(slot0, slot0.languageBtnCH, function ()
		if slot0 < 0 then
			pg.TipsMgr.GetInstance():ShowTips("敬请期待！")

			return
		end

		PlayerPrefs.SetInt("CV_LANGUAGE_" .. slot1.currentSkin.ship_group, 1)

		"CV_LANGUAGE_" .. slot1.currentSkin.ship_group.languageType = 1

		setActive(1.languageBtnCH, false)
		setActive(1.languageBtnCH.languageBtnJP, true)
		1.languageBtnCH.languageBtnJP:reloadCVKey()
		1.languageBtnCH.languageBtnJP.setAuthorInfo(slot1, (slot1.languageType == 2 and slot1.currentSkin.voice_actor_2) or slot1.currentSkin.voice_actor, slot1.currentSkin.illustrator)
	end, SFX_PANEL)
	onButton(slot0, slot0.languageBtnJP, function ()
		if slot0 < 0 then
			pg.TipsMgr.GetInstance():ShowTips("敬请期待！")

			return
		end

		PlayerPrefs.SetInt("CV_LANGUAGE_" .. slot1.currentSkin.ship_group, 2)

		"CV_LANGUAGE_" .. slot1.currentSkin.ship_group.languageType = 2

		setActive(2.languageBtnCH, true)
		setActive(2.languageBtnCH.languageBtnJP, false)
		2.languageBtnCH.languageBtnJP:reloadCVKey()
		2.languageBtnCH.languageBtnJP.setAuthorInfo(slot1, (slot1.languageType == 2 and slot1.currentSkin.voice_actor_2) or slot1.currentSkin.voice_actor, slot1.currentSkin.illustrator)
	end, SFX_PANEL)
end

function slot0.shiftSkin(slot0, slot1)
	slot0.languageType = PlayerPrefs.GetInt("CV_LANGUAGE_" .. slot0.currentSkin.ship_group)

	slot0:hideLive2D()

	slot0.currentSkin = slot0.groupSkinList[slot1]
	slot0.currentSkinWord = pg.ship_skin_words[slot0.currentSkin.id]
	slot0.currentSkinWordEx = pg.ship_skin_words_extra[slot0.currentSkin.id]

	slot0:setAuthorInfo((slot0.languageType == 2 and slot0.currentSkin.voice_actor_2) or slot0.currentSkin.voice_actor, slot0.currentSkin.illustrator)
	slot0:switchVoiceList(false)
	slot0:loadModel()
	slot0:shiftPainting()

	slot3 = nil

	slot0:loadSkinBg((not slot0.currentSkin.bg_sp or slot0.currentSkin.bg_sp == "" or PlayerPrefs.GetInt("paint_hide_other_obj_" .. slot0.currentSkin.painting, 0) ~= 0 or slot0.currentSkin.bg_sp) and ((slot0.currentSkin.bg and #slot0.currentSkin.bg > 0 and slot0.currentSkin.bg) or shipRarity2bgPrint(slot0.shipGroup:getRarity(slot0.showTrans), slot0.currentSkin.id, slot0.shipGroup:isBluePrintGroup())))
	slot0:switchLive2d(false)
end

function slot0.switchVoiceList(slot0, slot1)
	removeAllChildren(slot0.voiceContainer)

	if slot0._currentVoice then
		slot0._currentVoice:Stop(true)
	end

	if slot1 then
		for slot5, slot6 in ipairs(pg.AssistantInfo.action2Words) do
			if pg.character_voice[slot6] and not pg.AssistantInfo.isDisableSpecialClick(slot6) then
				slot0:appendVoiceButton(pg.character_voice[slot6], true)
			end
		end
	else
		for slot5, slot6 in ipairs(slot0) do
			if not pg.AssistantInfo.isDisableSpecialClick(slot6.key) then
				slot0:appendVoiceButton(slot6, false)
			end
		end
	end

	slot0.voiceScroll.enabled = false
	slot0.voiceScroll.enabled = true

	LeanTween.cancel(slot0.chat.gameObject)

	slot0.chat.localScale = Vector3(0, 0)
end

function slot0.loadSkinBg(slot0, slot1)
	slot0.bluePintBg = slot0.shipGroup:isBluePrintGroup() and shipRarity2bgPrint(slot0.shipGroup:getRarity(slot0.showTrans), nil, true)

	if slot0.shipSkinBg ~= slot1 then
		slot0.shipSkinBg = slot1
		slot2 = "bg/star_level_bg_" .. slot1
		slot3 = "ui/star_level_bg_" .. slot1

		pg.DynamicBgMgr.GetInstance():LoadBg(slot0, slot1, slot0.bg, slot0.staticBg, function (slot0)
			rtf(slot0).localPosition = Vector3(0, 0, 200)
		end, function (slot0)
			if slot0.bluePintBg and slot1 == slot0.bluePintBg then
				if slot0.designBg and slot0.designName ~= "raritydesign" .. slot0.shipGroup:getRarity(slot0.showTrans) then
					PoolMgr.GetInstance():ReturnUI(slot0.designName, slot0.designBg)

					slot0.designBg = nil
				end

				if not slot0.designBg then
					PoolMgr.GetInstance():GetUI("raritydesign" .. slot0.shipGroup:getRarity(slot0.showTrans), true, function (slot0)
						slot0.designBg = slot0
						slot0.designName = "raritydesign" .. slot0.shipGroup:getRarity(slot0.showTrans)

						slot0.transform:SetParent(slot0.staticBg, false)

						slot0.transform.localPosition = Vector3(1, 1, 1)
						slot0.transform.localScale = Vector3(1, 1, 1)

						slot0.transform:SetSiblingIndex(1)
						setActive(slot0, true)
					end)
				else
					setActive(slot0.designBg, true)
				end
			elseif slot0.designBg then
				setActive(slot0.designBg, false)
			end
		end)
	end
end

function slot0.ClearDyBg(slot0)
	if slot0.dyBg ~= nil then
		slot0.dyBg:GetComponent(typeof(CriManaEffectUI)):Pause(true)
		PoolMgr.GetInstance():ReturnPrefab(slot0.dSourcePath, "", slot0.dyBg)

		slot0.dyBg = nil
	end
end

function slot0.shiftPainting(slot0)
	if slot0.currentSkin.painting == slot0.paintingName then
		return
	end

	if slot0.paintingName then
		retPaintingPrefab(slot0.painting, slot0.paintingName)
	end

	slot0.paintingName = slot0.currentSkin.painting
	slot0.live2dOffset = BuildVector3(slot0.currentSkin.live2d_offset)

	setPaintingPrefabAsync(slot0.painting, slot0.paintingName, "chuanwu")
end

function slot0.loadModel(slot0)
	if slot0.inLoading then
		return
	end

	slot1 = slot0:findTF("model", slot0.leftProfile)

	if not IsNil(slot0.characterModel) then
		PoolMgr.GetInstance():ReturnSpineChar(slot0.modelName, slot0.characterModel)
	end

	slot0.inLoading = true

	PoolMgr.GetInstance():GetSpineChar(slot0.currentSkin.prefab, true, function (slot0)
		slot0.inLoading = false
		slot0.name = slot0
		slot0.transform.localPosition = Vector3.zero
		slot0.transform.localScale = Vector3(0.8, 0.8, 1)

		slot0.transform:SetParent(slot0.transform, false)
		slot0:GetComponent(typeof(SpineAnimUI)):SetAction(slot0.currentSkin.show_skin or "stand", true)

		slot0.characterModel = slot0
		slot0.modelName = slot0
	end)
end

function slot0.setAuthorInfo(slot0, slot1, slot2, slot3)
	slot4 = nil
	slot5 = ScrollTxt.New(slot0:findTF("cvPanel/label/mask", slot0.authorPanel), slot0:findTF("cvPanel/label/mask/Text", slot0.authorPanel))

	slot5:setText((slot1 == -1 and "-") or pg.voice_actor_CN[slot1].actor_name)
	table.insert(slot0.maskTxts, slot5)
end

function slot0.setProfileInfo(slot0)
	slot5, slot2 = Ship.getWords(slot0.currentSkin.id, "profile")

	setTextEN(slot0:findTF("desc/scroll/Text", slot0.prototypePanel), slot1)

	slot3 = slot0:findTF("title/playButton", slot0.prototypePanel)

	if slot0.currentSkinWord.voice_key >= 0 then
		setActive(slot3, true)
		onButton(slot0, slot3, function ()
			if slot0._currentVoice then
				slot0._currentVoice:Stop(true)
			end

			slot2, slot4 = Ship.getWords(slot0.currentSkin.id, "profile")
			slot0._currentVoice = playSoundEffect(slot1)
		end)
	else
		setActive(slot3, false)
	end
end

slot0.CONDITION_FORBIDDEN = -1
slot0.CONDITION_CLEAR = 0
slot0.CONDITION_INTIMACY = 1
slot0.CONDITION_MARRIED = 2

function slot0.voiceReplayCodition(slot0, slot1)
	slot2 = true
	slot3 = ""

	if slot0.shipGroup:isBluePrintGroup() and not table.contains(getProxy(TechnologyProxy):getBluePrintById(slot0.shipGroup.id).getUnlockVoices(slot4), slot1.key) and slot4:getUnlockLevel(slot1.key) > 0 then
		return false, i18n("ship_profile_voice_locked_design", slot6)
	end

	if slot1.unlock_condition[1] == slot0.CONDITION_INTIMACY then
		if slot0.shipGroup.maxIntimacy < slot1.unlock_condition[2] then
			slot2 = false
			slot3 = i18n("ship_profile_voice_locked_intimacy", math.floor(slot1.unlock_condition[2] / 100))
		end
	elseif slot1.unlock_condition[1] == slot0.CONDITION_MARRIED and slot0.shipGroup.married == 0 then
		slot2 = false
		slot3 = i18n("ship_profile_voice_locked_propose")
	end

	return slot2, slot3
end

function slot0.appendVoiceButton(slot0, slot1, slot2)
	slot4 = Ship.getWords(slot0.currentSkin.id, slot3)

	if slot1.unlock_condition[1] < 0 then
		return
	end

	slot5 = Ship.getOriginalSkinId(slot0.currentSkin.id)
	slot6, slot7 = nil

	if string.find(slot3, "main") then
		if string.split(slot0.currentSkinWord.main, "|")[tonumber(string.split(slot3, "main")[1])] == nil then
			return
		end
	elseif slot4 == nil and not slot2 then
		return
	end

	setActive(slot8, true)

	slot9, slot10 = slot0:voiceReplayCodition(slot1)

	if slot9 then
		setText(slot0:findTF("Text", slot8), slot1.voice_name)
	else
		setText(slot0:findTF("Text", slot8), "Locked")
	end

	setActive(slot0:findTF("tag_common", slot8), true)

	slot11 = slot0:findTF("tag_diff", slot8)
	slot12 = false

	if slot5 ~= slot0.currentSkin.id and ((slot0.currentSkinWord[slot3] ~= "" and slot0.currentSkinWord[slot3] ~= nil) or (string.find(slot3, "main") and slot7 ~= "nil")) then
		slot12 = true

		setActive(slot11, true)
	else
		setActive(slot11, false)
	end

	onButton(slot0, slot8, function ()
		if slot0 then
			if slot1.l2dChar and slot1.live2dChecked and slot1.chatFlag then
				return
			end

			if slot1._currentVoice then
				slot1._currentVoice:Stop(true)
			end

			if slot2 == "headtouch" and slot3 == nil then
				LeanTween.cancel(slot1.chat.gameObject)

				slot1.chat.localScale = Vector3(0, 0)
			else
				slot1:showChat(slot2, slot4)
			end

			if slot1.characterModel then
				slot0 = nil

				slot1.characterModel:GetComponent(typeof(SpineAnimUI)):SetAction((slot5.spine_action == "" and "stand") or slot5.spine_action, 0)
			end

			if slot1.live2dChecked and slot1.l2dChar then
				slot1.l2dChar:TriggerAction(slot5.l2d_action, true)
			end
		else
			pg.TipsMgr.GetInstance():ShowTips(slot6)
		end
	end)
	slot0:appendVoiceExButton(slot1, slot6, slot12)
end

function slot0.appendVoiceExButton(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot4 = slot1.key
	slot5 = (slot2 and "main") or slot1.key
	slot7 = slot3 and slot0.currentSkinWordEx and slot0.currentSkinWordEx[(slot2 and "main") or slot1.key] and (slot0.currentSkinWordEx and slot0.currentSkinWordEx[(slot2 and "main") or slot1.key]) ~= ""
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-5, warpins: 1 ---
	slot5 = "main"

	if "main" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-6, warpins: 1 ---
		slot5 = slot4
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 7-9, warpins: 2 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #3 10-11, warpins: 1 ---
	slot6 = slot0.currentSkinWordEx[(slot2 and "main") or slot1.key]

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 12-13, warpins: 2 ---
	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #5 14-15, warpins: 1 ---
	if slot6 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-17, warpins: 1 ---
		if slot6 == "" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-19, warpins: 1 ---
			slot7 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 20-20, warpins: 1 ---
			slot7 = true
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 21-22, warpins: 4 ---
	if not slot6 or slot6 == "" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 25-26, warpins: 2 ---
		if not slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 27-29, warpins: 1 ---
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #1 30-31, warpins: 1 ---
			slot6 = slot0.origSkinConfig[slot5]
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 32-33, warpins: 2 ---
			--- END OF BLOCK #2 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 38-38, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 39-45, warpins: 3 ---
	slot8 = slot0.shipGroup.maxIntimacy / 100 + ((slot0.shipGroup.married and slot0.shipGroup.married * 1000) or 0)

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #8 46-50, warpins: 1 ---
	if not (slot0.shipGroup.married * 1000) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 51-51, warpins: 2 ---
		slot9 = 0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 52-56, warpins: 2 ---
	--- END OF BLOCK #9 ---

	FLOW; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #10 57-105, warpins: 0 ---
	for slot12, slot13 in ipairs(slot6) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 57-59, warpins: 1 ---
		if slot13[1] <= slot8 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 60-61, warpins: 1 ---
			if slot2 and slot2 > #string.split(slot13[2], "|") then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 70-70, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 71-102, warpins: 2 ---
			slot14 = cloneTplTo(slot0.voiceTpl, slot0.voiceContainer)

			setActive(slot14, true)
			setText(slot0:findTF("Text", slot14), slot1.voice_name .. "Ex")
			setActive(slot15, slot7)
			onButton(slot0, slot14, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-4, warpins: 1 ---
				if slot0.l2dChar and slot0.live2dChecked and slot0.chatFlag then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 13-13, warpins: 1 ---
					return
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 14-17, warpins: 4 ---
				if slot0._currentVoice then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 18-23, warpins: 1 ---
					slot0._currentVoice:Stop(true)
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 24-26, warpins: 2 ---
				if slot1 == "headtouch" and textContent == nil then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 30-43, warpins: 1 ---
					LeanTween.cancel(slot0.chat.gameObject)

					LeanTween.cancel.chat.localScale = Vector3(0, 0)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 44-51, warpins: 2 ---
					slot0:showChat(slot0, , slot3[1])
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #2 ---

				FLOW; TARGET BLOCK #3



				-- Decompilation error in this vicinity:
				--- BLOCK #3 52-55, warpins: 2 ---
				if slot0.characterModel then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 56-60, warpins: 1 ---
					slot0 = nil

					if slot4.spine_action == "" then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 61-62, warpins: 1 ---
						slot0 = "stand"
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 63-64, warpins: 1 ---
						slot0 = slot4.spine_action
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 65-77, warpins: 2 ---
					slot0.characterModel:GetComponent(typeof(SpineAnimUI)):SetAction(slot0, 0)
					--- END OF BLOCK #1 ---



				end

				--- END OF BLOCK #3 ---

				FLOW; TARGET BLOCK #4



				-- Decompilation error in this vicinity:
				--- BLOCK #4 78-81, warpins: 2 ---
				if slot0.live2dChecked and slot0.l2dChar then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 86-96, warpins: 1 ---
					slot0.l2dChar:SetAction(pg.AssistantInfo.action2Id[slot4.l2d_action])
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #4 ---

				FLOW; TARGET BLOCK #5



				-- Decompilation error in this vicinity:
				--- BLOCK #5 97-97, warpins: 3 ---
				return
				--- END OF BLOCK #5 ---



			end)
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 103-103, warpins: 2 ---
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 104-105, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #10 ---

	FLOW; TARGET BLOCK #11



	-- Decompilation error in this vicinity:
	--- BLOCK #11 106-107, warpins: 1 ---
	return
	--- END OF BLOCK #11 ---

	FLOW; TARGET BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #12 108-108, warpins: 2 ---
	--- END OF BLOCK #12 ---

	FLOW; TARGET BLOCK #13



	-- Decompilation error in this vicinity:
	--- BLOCK #13 109-109, warpins: 2 ---
	--- END OF BLOCK #13 ---

	FLOW; TARGET BLOCK #14



	-- Decompilation error in this vicinity:
	--- BLOCK #14 110-110, warpins: 2 ---
	--- END OF BLOCK #14 ---



end

function slot0.showChat(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.l2dChar and slot0.live2dChecked and slot0.chatFlag then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-10, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-15, warpins: 3 ---
	slot0.chatFlag = true
	slot4, slot5, slot6, slot7 = nil

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-23, warpins: 1 ---
		if findTF(slot0.painting, "fitter").childCount > 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 24-39, warpins: 1 ---
			Ship.SetExpression(findTF(slot0.painting, "fitter"):GetChild(0), slot0.paintingName, "main_" .. slot2, slot3)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 40-67, warpins: 2 ---
		slot4, slot5 = Ship.getWords(slot0.currentSkin.id, "main", slot2, nil, slot3)
		slot6 = Ship.getCVCalibrate(slot0.currentSkin.id, "main", slot2)
		slot7 = Ship.getL2dSoundEffect(slot0.currentSkin.id, "main", slot2)
		--- END OF BLOCK #1 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 68-75, warpins: 1 ---
		if findTF(slot0.painting, "fitter").childCount > 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 76-89, warpins: 1 ---
			Ship.SetExpression(findTF(slot0.painting, "fitter"):GetChild(0), slot0.paintingName, slot1, slot3)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 90-113, warpins: 2 ---
		slot4, slot5 = Ship.getWords(slot0.currentSkin.id, slot1, nil, nil, slot3)
		slot6 = Ship.getCVCalibrate(slot0.currentSkin.id, slot1)
		slot7 = Ship.getL2dSoundEffect(slot0.currentSkin.id, slot1)
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 114-117, warpins: 2 ---
	slot8 = slot0.CHAT_SHOW_TIME

	if not slot0.live2dChecked then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 118-118, warpins: 1 ---
		slot6 = 0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 119-123, warpins: 2 ---
	if slot0.currentSkinWord.voice_key >= 0 or slot0.currentSkinWord.voice_key == -2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 128-130, warpins: 2 ---
		if slot0._currentVoice then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 131-135, warpins: 1 ---
			slot0._currentVoice:Stop(true)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 136-139, warpins: 2 ---
		function slot9()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-9, warpins: 1 ---
			nil._currentVoice, slot0 = playSoundEffect(slot1)

			if slot3 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 10-14, warpins: 1 ---
				slot2 = long2int(slot0.length) * 0.001
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 15-15, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end

		if slot0._delayVoiceTweenID then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 140-145, warpins: 1 ---
			LeanTween.cancel(slot0._delayVoiceTweenID)

			slot0._delayVoiceTweenID = nil
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 146-148, warpins: 2 ---
		if slot0.l2dChar and slot6 and slot6 ~= 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 153-163, warpins: 1 ---
			slot0._delayVoiceTweenID = LeanTween.delayedCall(slot6, System.Action(function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-6, warpins: 1 ---
				slot0()

				slot1._delayVoiceTweenID = nil

				return
				--- END OF BLOCK #0 ---



			end)).id
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 164-165, warpins: 3 ---
			slot9()
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 166-166, warpins: 2 ---
		--- END OF BLOCK #3 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 167-169, warpins: 2 ---
	if slot0._delayL2dSeID then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 170-175, warpins: 1 ---
		LeanTween.cancel(slot0._delayL2dSeID)

		slot0._delayL2dSeID = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 176-178, warpins: 2 ---
	if slot0.l2dChar and slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 181-190, warpins: 1 ---
		slot0._delayL2dSeID = LeanTween.delayedCall(slot7[2], System.Action(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-10, warpins: 1 ---
			playSoundEffect("event:/ui/" .. slot0[1])

			"event:/ui/" .. slot0[1]._delayL2dSeID = nil

			return
			--- END OF BLOCK #0 ---



		end)).id
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 191-206, warpins: 3 ---
	setTextEN(slot0.chatText, slot4)

	if CHAT_POP_STR_LEN < #slot0.chatText:GetComponent(typeof(Text)).text then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 207-210, warpins: 1 ---
		slot9.alignment = TextAnchor.MiddleLeft
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 211-213, warpins: 1 ---
		slot9.alignment = TextAnchor.MiddleCenter
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 214-218, warpins: 2 ---
	if slot0.initChatBgH < slot9.preferredHeight + 120 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 219-228, warpins: 1 ---
		slot0.chatBg.sizeDelta = Vector2.New(slot0.chatBg.sizeDelta.x, slot10)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 229-237, warpins: 1 ---
		slot0.chatBg.sizeDelta = Vector2.New(slot0.chatBg.sizeDelta.x, slot0.initChatBgH)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 238-271, warpins: 2 ---
	LeanTween.cancel(slot0.chat.gameObject)

	slot0.chat.localScale = Vector3(0, 0)
	slot12 = LeanTween.scale(rtf(slot0.chat.gameObject), Vector3.New(1, 1, 1), slot0.CHAT_ANIMATION_TIME):setEase(LeanTweenType.easeOutBack)
	slot11 = LeanTween.scale(rtf(slot0.chat.gameObject), Vector3.New(1, 1, 1), slot0.CHAT_ANIMATION_TIME).setEase(LeanTweenType.easeOutBack).setDelay

	if not slot6 or not slot6 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 274-274, warpins: 2 ---
		slot13 = 0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 275-284, warpins: 2 ---
	slot11(slot12, slot13):setOnComplete(System.Action(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-36, warpins: 1 ---
		LeanTween.scale(rtf(slot0.chat.gameObject), Vector3.New(0, 0, 1), slot0.CHAT_ANIMATION_TIME):setEase(LeanTweenType.easeInBack):setDelay(slot0.CHAT_ANIMATION_TIME + LeanTween.scale(rtf(slot0.chat.gameObject), Vector3.New(0, 0, 1), slot0.CHAT_ANIMATION_TIME).setEase(LeanTweenType.easeInBack)):setOnComplete(System.Action(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-4, warpins: 1 ---
			slot0.chatFlag = false

			return
			--- END OF BLOCK #0 ---



		end))

		return
		--- END OF BLOCK #0 ---



	end))

	return
	--- END OF BLOCK #9 ---

	FLOW; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #10 285-285, warpins: 2 ---
	--- END OF BLOCK #10 ---



end

function slot0.createLive2D(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	setActive(slot0.painting:Find("fitter"), false)

	if slot0.l2dChar then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-15, warpins: 1 ---
		slot0.l2dChar:Dispose()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 16-62, warpins: 2 ---
	setActive(slot2, true)

	slot0.l2dChar = Live2D.New(Live2D.live2dData({
		ship = Ship.New({
			configId = slot0.shipGroup:getShipConfigId(),
			skin_id = slot0.currentSkin.id
		}),
		scale = Vector3(52, 52, 52),
		position = Vector3(0, -40, 100),
		parent = slot0:findTF("live2d", slot0.painting)
	}))

	if not slot0.l2dIsOn then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 63-65, warpins: 1 ---
		slot0:hideLive2D()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 66-66, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

function slot0.hideLive2D(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	setActive(slot0.painting:Find("fitter"), true)

	if slot0.l2dChar then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-19, warpins: 1 ---
		setActive(slot0:findTF("live2d", slot0.painting), false)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 20-20, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.clearScrollTxt(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.skinNameList ~= nil and #slot0.skinNameList > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-12, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 13-17, warpins: 0 ---
		for slot4, slot5 in ipairs(slot0.skinNameList) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-15, warpins: 1 ---
			slot5:destroy()
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 16-17, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 18-20, warpins: 3 ---
	slot0.skinNameList = {}

	return
	--- END OF BLOCK #1 ---



end

function slot0.willExit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.designBg then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-11, warpins: 1 ---
		PoolMgr.GetInstance():ReturnUI(slot0.designName, slot0.designBg)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-38, warpins: 2 ---
	slot1 = pg.UIMgr.GetInstance()

	slot1:UnOverlayPanel(slot0.blurPanel, slot0._tf)
	slot1:UnOverlayPanel(slot0.detailRight, slot0._tf)
	slot1:UnOverlayPanel(slot0.profile, slot0._tf)
	slot1:UnOverlayPanel(slot0.bottomTF, slot0._tf)

	if slot0._delayVoiceTweenID then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 39-44, warpins: 1 ---
		LeanTween.cancel(slot0._delayVoiceTweenID)

		slot0._delayVoiceTweenID = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 45-47, warpins: 2 ---
	if slot0._delayL2dSeID then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 48-53, warpins: 1 ---
		LeanTween.cancel(slot0._delayL2dSeID)

		slot0._delayL2dSeID = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 54-56, warpins: 2 ---
	if slot0.dragTrigger then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 57-61, warpins: 1 ---
		ClearEventTrigger(slot0.dragTrigger)

		slot0.dragTrigger = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 62-64, warpins: 2 ---
	if slot0.tweens then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 65-67, warpins: 1 ---
		cancelTweens(slot0.tweens)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 68-70, warpins: 2 ---
	if slot0.paintingName then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 71-78, warpins: 1 ---
		retPaintingPrefab(slot0.painting, slot0.paintingName)

		slot0.paintingName = nil
		slot0.live2dOffset = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 79-84, warpins: 2 ---
	cameraPaintViewAdjust(false)

	if slot0.loadedCVBankName then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 85-91, warpins: 1 ---
		pg.CriMgr.UnloadCVBank(slot0.loadedCVBankName)

		slot0.loadedCVBankName = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 92-94, warpins: 2 ---
	if slot0.loadedCVBattleBankName then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 95-101, warpins: 1 ---
		pg.CriMgr.UnloadCVBank(slot0.loadedCVBattleBankName)

		slot0.loadedCVBattleBankName = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 102-106, warpins: 2 ---
	if not IsNil(slot0.characterModel) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 107-114, warpins: 1 ---
		PoolMgr.GetInstance():ReturnSpineChar(slot0.modelName, slot0.characterModel)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 115-117, warpins: 2 ---
	if slot0.l2dChar then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 118-123, warpins: 1 ---
		slot0.l2dChar:Dispose()

		slot0.l2dChar = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #9 ---

	FLOW; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #10 124-126, warpins: 2 ---
	if slot0.live2dTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 127-132, warpins: 1 ---
		slot0.live2dTimer:Stop()

		slot0.live2dTimer = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #10 ---

	FLOW; TARGET BLOCK #11



	-- Decompilation error in this vicinity:
	--- BLOCK #11 133-136, warpins: 2 ---
	--- END OF BLOCK #11 ---

	FLOW; TARGET BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #12 137-141, warpins: 0 ---
	for slot5, slot6 in ipairs(slot0.maskTxts) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 137-139, warpins: 1 ---
		slot6:destroy()
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 140-141, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #12 ---

	FLOW; TARGET BLOCK #13



	-- Decompilation error in this vicinity:
	--- BLOCK #13 142-145, warpins: 1 ---
	--- END OF BLOCK #13 ---

	FLOW; TARGET BLOCK #14



	-- Decompilation error in this vicinity:
	--- BLOCK #14 146-150, warpins: 0 ---
	for slot5, slot6 in pairs(slot0.skinTimers) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 146-148, warpins: 1 ---
		slot6:Stop()
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 149-150, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #14 ---

	FLOW; TARGET BLOCK #15



	-- Decompilation error in this vicinity:
	--- BLOCK #15 151-156, warpins: 1 ---
	slot0.skinTimers = nil

	slot0:ClearDyBg()

	return
	--- END OF BLOCK #15 ---



end

return slot0
