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
	slot3 = getProxy(CollectionProxy):getShipGroup(slot0.contextData.groupId)
	slot5 = slot3.groupConfig

	if slot0.contextData.showTrans and slot3.trans then
		slot6 = slot3.shipConfig.rarity + 1
	end

	GetSpriteFromAtlasAsync("bg/star_level_bg_" .. shipRarity2bgPrint(slot6, slot0.contextData.groupId * 10 + (slot0.contextData.showTrans and slot3.trans and 9 or 0), slot3:isBluePrintGroup()), "", slot1)
end

function slot0.reloadCVKey(slot0)
	slot0.currentSkin = slot0.currentSkin or slot0.groupSkinList[1]
	slot0.currentSkinWord = pg.ship_skin_words[slot0.currentSkin.id]
	slot0.currentSkinWordEx = pg.ship_skin_words_extra[slot0.currentSkin.id]
	slot0.origSkinConfig = pg.ship_skin_words_extra[slot0.currentSkin.id]

	if slot0.currentSkinWord.voice_key >= 0 then
		slot1 = Ship.getCVKeyID(slot0.currentSkin.id)

		function slot2()
			if uv1.exited then
				pg.CriMgr.UnloadCVBank(pg.CriMgr.GetCVBankName(uv0))
				pg.CriMgr.UnloadCVBank(pg.CriMgr.GetBattleCVBankName(uv0))
			else
				uv1.loadedCVBankName = slot0
				uv1.loadedCVBattleBankName = slot1
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
		if slot0.groupSkinList[slot5].skin_type == ShipSkin.SKIN_TYPE_OLD or slot6.skin_type == ShipSkin.SKIN_TYPE_NOT_HAVE_HIDE and not getProxy(ShipSkinProxy):hasSkin(slot6.id) then
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
	setText(slot0.labelHeart, slot0.shipGroup.hearts > 999 and "999+" or slot1)

	slot0.labelHeart:GetComponent("Text").color = slot0.shipGroup.iheart and Color.New(1, 0.6, 0.6) or Color.New(1, 1, 1)

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
	slot2 = 0.3

	LeanTween.alphaCanvas(GetOrAddComponent(slot0.name, typeof(CanvasGroup)), 1, slot2):setFrom(0)
	LeanTween.alphaCanvas(GetOrAddComponent(slot0.bottomTF, typeof(CanvasGroup)), 1, slot2):setFrom(0)
end

function slot0.didEnter(slot0)
	slot0:uiStartAnimating()

	function slot4()
		uv0:emit(uv1.ON_BACK)
	end

	slot5 = SFX_CANCEL

	onButton(slot0, slot0.btnBack, slot4, slot5)

	for slot4, slot5 in ipairs(slot0.toggles) do
		onToggle(slot0, slot5, function (slot0)
			if uv0 ~= 2 then
				uv1:switchLive2d(false)
			end

			if uv0 >= 3 and slot0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_systemClose"))
				triggerToggle(uv1.toggles[1], true)

				return
			end

			if slot0 then
				if uv1.toggleInits[uv0] then
					uv1[uv1.toggleInits[uv0]](uv1)

					uv1.toggleInits[uv0] = nil
				end

				uv1:switchTo(uv0)
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
			uv0:UpdateF(uv1, true)
		end, SFX_PANEL)
	elseif slot6 == DownloadState.Updating then
		setActive(slot0.live2dBtn, true)
		setActive(slot0.live2dToggle, false)
		setActive(slot0.live2dState, true)
		removeOnButton(slot0.live2dBtn)
	else
		slot7 = PathMgr.FileExists(PathMgr.getAssetBundle(slot3))

		setActive(slot0.live2dBtn, slot7)

		if slot7 then
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
				if uv0.l2dChar and uv0.l2dChar.state == Live2D.STATE_LOADING then
					return
				end

				uv0.chatFlag = false

				uv0:switchLive2d(not uv0.live2dChecked)
				uv0:switchVoiceList(uv0.live2dChecked)
			end, SFX_PANEL)
		end
	end

	if slot0.live2dTimer then
		slot0.live2dTimer:Stop()

		slot0.live2dTimer = nil
	end

	if slot6 == DownloadState.CheckToUpdate or slot6 == DownloadState.UpdateFailure or slot6 == DownloadState.Updating then
		slot0.live2dTimer = Timer.New(function ()
			uv2:switchLive2d(uv0:CheckF(uv1) == DownloadState.UpdateSuccess and true or uv3)
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

		if slot1 == uv0.INDEX_DETAIL then
			pg.UIMgr.GetInstance():OverlayPanel(slot0.blurPanel, {
				groupName = LayerWeightConst.GROUP_SHIP_PROFILE
			})
			LeanTween.moveX(rtf(slot0.detailLeft), 0, uv1):setEase(LeanTweenType.easeInOutSine)
			LeanTween.moveX(rtf(slot0.detailRight), 0, uv1):setEase(LeanTweenType.easeInOutSine)
			LeanTween.moveX(rtf(slot0.profile), 1000, uv1):setEase(LeanTweenType.easeInOutSine)
			LeanTween.moveX(rtf(slot0.leftProfile), -500, uv1):setEase(LeanTweenType.easeInOutSine)
			LeanTween.moveY(rtf(slot0.live2dBtn), -70, uv1):setEase(LeanTweenType.easeInOutSine)
			LeanTween.moveX(rtf(slot0.painting), slot0.paintingInitPos.x, uv1):setEase(LeanTweenType.easeInOutSine)
			LeanTween.moveX(rtf(slot0.name), slot0.nameInitPos.x, uv1):setEase(LeanTweenType.easeInOutSine)
		end

		if slot1 == uv0.INDEX_PROFILE then
			pg.UIMgr.GetInstance():OverlayPanel(slot0.blurPanel, {
				groupName = LayerWeightConst.GROUP_SHIP_PROFILE
			})
			LeanTween.moveX(rtf(slot0.profile), 0, uv1):setEase(LeanTweenType.easeInOutSine)
			LeanTween.moveX(rtf(slot0.leftProfile), 0, uv1):setEase(LeanTweenType.easeInOutSine)
			LeanTween.moveX(rtf(slot0.detailRight), 1000, uv1):setEase(LeanTweenType.easeInOutSine)
			LeanTween.moveY(rtf(slot0.live2dBtn), 60, uv1):setEase(LeanTweenType.easeInOutSine)
			LeanTween.moveX(rtf(slot0.painting), slot0.paintingInitPos.x + 50, uv1):setEase(LeanTweenType.easeInOutSine)
			LeanTween.moveX(rtf(slot0.name), slot0.nameInitPos.x + 50, uv1):setEase(LeanTweenType.easeInOutSine)
		end

		LeanTween.moveX(rtf(slot0.bottomTF), 850, uv1):setEase(LeanTweenType.easeInOutSine):setOnComplete(System.Action(function ()
			LeanTween.moveX(rtf(uv0.bottomTF), -14, 0):setEase(LeanTweenType.easeInOutSine)
		end))

		slot0.index = slot1
	end
end

function slot0.initCommon(slot0)
	slot3 = slot0.shipGroup.id * 10 + (slot0.showTrans and 9 or 0)

	slot0:loadSkinBg(shipRarity2bgPrint(slot0.shipGroup:getRarity(slot0.showTrans), slot3, slot0.shipGroup:isBluePrintGroup()))

	slot0.paintingName = slot0.shipGroup:getPainting(slot0.showTrans)
	slot0.live2dOffset = BuildVector3(pg.ship_skin_template[slot3].live2d_offset)

	setPaintingPrefabAsync(slot0.painting, slot0.paintingName, "chuanwu")
	setImageSprite(slot0.shipType, GetSpriteFromAtlas("shiptype", slot0.shipGroup:getShipType(slot0.showTrans)))
	setText(slot0.labelName, slot0.shipGroup:getName(slot0.showTrans))
	setText(slot0.labelEnName, slot0.shipGroup.shipConfig.english_name)

	for slot7 = 1, slot1.star do
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
		uv0:paintView()
	end, SFX_PANEL)
	onButton(slot0, slot0.evaBtn, function ()
		uv0:emit(uv1.SHOW_EVALUATION)
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
			table.removebyvalue(uv0, slot0)
		end)
	end

	for slot9 = slot0.skillPanel.childCount + 1, #slot3 < 3 and 3 or #slot3 do
		cloneTplTo(slot0.skillTpl, slot0.skillPanel)
	end

	for slot9 = 1, slot0.skillPanel.childCount do
		slot12 = findTF(slot0.skillPanel:GetChild(slot9 - 1), "icon")

		if slot9 <= #slot3 then
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
				uv0:emit(uv1.SHOW_SKILL_INFO, uv2.id, {
					id = uv2.id,
					level = pg.skill_data_template[uv2.id].max_level
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
			setActive(uv0.skillArrLeft, slot0.x > 0.01)
			setActive(uv0.skillArrRight, slot0.x < 0.99)
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
	slot3 = 0

	while slot0._tf.childCount > slot3 do
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

		slot0 = true
		slot1 = false
		slot2, slot3 = nil
		slot4 = GetOrAddComponent(uv0.bg, "MultiTouchZoom")

		slot4:SetZoomTarget(uv0.painting)

		slot5 = GetOrAddComponent(uv0.bg, "EventTriggerListener")
		uv0.dragTrigger = slot5
		slot4.enabled = true
		slot5.enabled = true

		slot5:AddPointDownFunc(function (slot0)
			if Input.touchCount == 1 or Application.isEditor then
				uv0 = true
				uv1 = true
			elseif Input.touchCount >= 2 then
				uv1 = false
				uv0 = false
			end
		end)
		slot5:AddPointUpFunc(function (slot0)
			if Input.touchCount <= 2 then
				uv0 = true
			end
		end)
		slot5:AddBeginDragFunc(function (slot0, slot1)
			uv0 = false
			uv1 = slot1.position.x * uv2 - uv3 - tf(uv4.painting).localPosition.x
			uv5 = slot1.position.y * uv6 - uv7 - tf(uv4.painting).localPosition.y
		end)
		slot5:AddDragFunc(function (slot0, slot1)
			if uv0 then
				slot2 = tf(uv1.painting).localPosition
				tf(uv1.painting).localPosition = Vector3(slot1.position.x * uv2 - uv3 - uv4 - 150, slot1.position.y * uv5 - uv6 - uv7, -22)
			end
		end)

		uv0.bg:GetComponent("Button").enabled = true

		onButton(uv0, uv0.bg, function ()
			uv0:hidePaintView()
		end, SFX_CANCEL)

		function uv5.hidePaintView(slot0, slot1)
			if not slot1 and not uv0 then
				return
			end

			uv1.enabled = false
			uv2.enabled = false

			for slot5, slot6 in ipairs(uv3) do
				setActive(slot6, true)
			end

			closePortrait()

			slot0.painting.localScale = Vector3(1, 1, 1)

			setAnchoredPosition(slot0.painting, {
				x = uv4,
				y = uv5
			})

			slot0.bg:GetComponent("Button").enabled = false
			uv6.blocksRaycasts = true
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
		for slot6, slot7 in ipairs(slot0.groupSkinList) do
			if slot7.id == ShipGroup.getModSkin(slot0.shipGroup.id).id then
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

	slot2 = slot0.shipGroup.shipConfig.nationality
	slot3 = ScrollTxt.New(slot0:findTF("bg/author_panel/illustPanel/illustrator/label/mask", slot0.profile), slot0:findTF("bg/author_panel/illustPanel/illustrator/label/mask/Text", slot0.profile))

	slot3:setText(Nation.Nation2facionName(slot2) .. "-" .. Nation.Nation2Name(slot2))
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
		slot0.skinTplHeight = GetComponent(slot0:getTpl("skin_tpl", slot0.skinList), typeof(RectTransform)).rect.height
		slot0.upY = slot0.skinScroll:TransformPoint(Vector3(slot0.skinScroll.anchoredPosition.x, slot0.skinScroll.anchoredPosition.y + slot0.skinTplHeight, 0))
		slot9 = -slot0.skinScroll.anchoredPosition.y - slot0.skinTplHeight
		slot10 = 0
		slot0.bottomY = slot0.skinScroll:TransformPoint(Vector3(slot0.skinScroll.anchoredPosition.x, slot9, slot10))
		slot0.skinCanvasGroup = {}
		slot5 = GetComponent(slot0.skinScroll, typeof(ScrollRect)).onValueChanged

		slot5:RemoveAllListeners()
		slot5:AddListener(function (slot0)
			for slot4, slot5 in ipairs(uv0.skinCanvasGroup) do
				if uv0.upY.y < slot5.transform.position.y or slot5.transform.position.y < uv0.bottomY.y then
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

			table.insert(slot0.skinNameList, ScrollTxt.New(findTF(slot11, "mask"), findTF(slot11, "mask/Text")))
			table.insert(slot0.skinCanvasGroup, GetOrAddComponent(slot11, typeof(CanvasGroup)))

			if slot10.skin_type == ShipSkin.SKIN_TYPE_DEFAULT or table.contains(slot0.ownedSkinList, slot10.id) or slot10.skin_type == ShipSkin.SKIN_TYPE_REMAKE and slot0.shipGroup.trans or slot10.skin_type == ShipSkin.SKIN_TYPE_PROPOSE and slot0.shipGroup.married == 1 then
				slot12:setText(HXSet.hxLan(slot10.name))
				onButton(slot0, slot11, function ()
					if uv0.currSkin ~= uv1 then
						uv0:shiftSkin(uv1)

						uv0.currSkin = uv1
					end

					if uv0.prevSelected then
						setActive(uv0.prevSelected, false)
					end

					uv0.prevSelected = uv2:Find("selected")

					setActive(uv0.prevSelected, true)

					uv0.chatFlag = false
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
					setText(uv1:Find("timelimit/Text"), skinTimeStamp(uv0:getRemainTime()))
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
			if uv0._currentVoice then
				uv0._currentVoice:Stop(true)
			end

			uv0:emit(uv1.WEDDING_REVIEW, {
				group = uv0.shipGroup,
				skinID = uv0.currentSkin.id
			})
		end)
	elseif slot0.shipGroup.married == 0 then
		setActive(slot4, false)
	end

	onButton(slot0, slot0:findTF("view_btn", slot0.profile), function ()
		uv0:paintView()
	end, SFX_PANEL)

	if not slot0.showTrans then
		onButton(slot0, slot0:findTF("eva_btn", slot0.profile), function ()
			uv0:emit(uv1.SHOW_EVALUATION)
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
		if uv0 < 0 then
			pg.TipsMgr.GetInstance():ShowTips("敬请期待！")

			return
		end

		PlayerPrefs.SetInt("CV_LANGUAGE_" .. uv1.currentSkin.ship_group, 1)

		uv1.languageType = 1

		setActive(uv1.languageBtnCH, false)
		setActive(uv1.languageBtnJP, true)
		uv1:reloadCVKey()
		uv1:setAuthorInfo(uv1.languageType == 2 and uv1.currentSkin.voice_actor_2 or uv1.currentSkin.voice_actor, uv1.currentSkin.illustrator)
	end, SFX_PANEL)
	onButton(slot0, slot0.languageBtnJP, function ()
		if uv0 < 0 then
			pg.TipsMgr.GetInstance():ShowTips("敬请期待！")

			return
		end

		PlayerPrefs.SetInt("CV_LANGUAGE_" .. uv1.currentSkin.ship_group, 2)

		uv1.languageType = 2

		setActive(uv1.languageBtnCH, true)
		setActive(uv1.languageBtnJP, false)
		uv1:reloadCVKey()
		uv1:setAuthorInfo(uv1.languageType == 2 and uv1.currentSkin.voice_actor_2 or uv1.currentSkin.voice_actor, uv1.currentSkin.illustrator)
	end, SFX_PANEL)
end

function slot0.shiftSkin(slot0, slot1)
	slot0.languageType = PlayerPrefs.GetInt("CV_LANGUAGE_" .. slot0.currentSkin.ship_group)

	slot0:hideLive2D()

	slot0.currentSkin = slot0.groupSkinList[slot1]
	slot0.currentSkinWord = pg.ship_skin_words[slot0.currentSkin.id]
	slot0.currentSkinWordEx = pg.ship_skin_words_extra[slot0.currentSkin.id]

	slot0:setAuthorInfo(slot0.languageType == 2 and slot0.currentSkin.voice_actor_2 or slot0.currentSkin.voice_actor, slot0.currentSkin.illustrator)
	slot0:switchVoiceList(false)
	slot0:loadModel()
	slot0:shiftPainting()

	slot3 = nil

	slot0:loadSkinBg((not slot0.currentSkin.bg_sp or slot0.currentSkin.bg_sp == "" or PlayerPrefs.GetInt("paint_hide_other_obj_" .. slot0.currentSkin.painting, 0) ~= 0 or slot0.currentSkin.bg_sp) and (slot0.currentSkin.bg and #slot0.currentSkin.bg > 0 and slot0.currentSkin.bg or shipRarity2bgPrint(slot0.shipGroup:getRarity(slot0.showTrans), slot0.currentSkin.id, slot0.shipGroup:isBluePrintGroup())))
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
		for slot5, slot6 in ipairs(uv0) do
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
			if uv0.bluePintBg and uv1 == uv0.bluePintBg then
				if uv0.designBg and uv0.designName ~= "raritydesign" .. uv0.shipGroup:getRarity(uv0.showTrans) then
					PoolMgr.GetInstance():ReturnUI(uv0.designName, uv0.designBg)

					uv0.designBg = nil
				end

				if not uv0.designBg then
					PoolMgr.GetInstance():GetUI("raritydesign" .. uv0.shipGroup:getRarity(uv0.showTrans), true, function (slot0)
						uv0.designBg = slot0
						uv0.designName = "raritydesign" .. uv0.shipGroup:getRarity(uv0.showTrans)

						slot0.transform:SetParent(uv0.staticBg, false)

						slot0.transform.localPosition = Vector3(1, 1, 1)
						slot0.transform.localScale = Vector3(1, 1, 1)

						slot0.transform:SetSiblingIndex(1)
						setActive(slot0, true)
					end)
				else
					setActive(uv0.designBg, true)
				end
			elseif uv0.designBg then
				setActive(uv0.designBg, false)
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
		uv0.inLoading = false
		slot0.name = uv1
		slot0.transform.localPosition = Vector3.zero
		slot0.transform.localScale = Vector3(0.8, 0.8, 1)

		slot0.transform:SetParent(uv2, false)
		slot0:GetComponent(typeof(SpineAnimUI)):SetAction(uv0.currentSkin.show_skin or "stand", true)

		uv0.characterModel = slot0
		uv0.modelName = uv1
	end)
end

function slot0.setAuthorInfo(slot0, slot1, slot2, slot3)
	slot4 = nil
	slot5 = ScrollTxt.New(slot0:findTF("cvPanel/label/mask", slot0.authorPanel), slot0:findTF("cvPanel/label/mask/Text", slot0.authorPanel))

	slot5:setText(slot1 == -1 and "-" or pg.voice_actor_CN[slot1].actor_name)
	table.insert(slot0.maskTxts, slot5)
end

function slot0.setProfileInfo(slot0)
	slot1, slot2 = Ship.getWords(slot0.currentSkin.id, "profile")

	setTextEN(slot0:findTF("desc/scroll/Text", slot0.prototypePanel), slot1)

	slot3 = slot0:findTF("title/playButton", slot0.prototypePanel)

	if slot0.currentSkinWord.voice_key >= 0 then
		setActive(slot3, true)
		onButton(slot0, slot3, function ()
			if uv0._currentVoice then
				uv0._currentVoice:Stop(true)
			end

			slot0, slot1 = Ship.getWords(uv0.currentSkin.id, "profile")
			uv0._currentVoice = playSoundEffect(slot1)
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

	if slot0.shipGroup:isBluePrintGroup() and not table.contains(getProxy(TechnologyProxy):getBluePrintById(slot0.shipGroup.id):getUnlockVoices(), slot1.key) and slot4:getUnlockLevel(slot1.key) > 0 then
		return false, i18n("ship_profile_voice_locked_design", slot6)
	end

	if slot1.unlock_condition[1] == uv0.CONDITION_INTIMACY then
		if slot0.shipGroup.maxIntimacy < slot1.unlock_condition[2] then
			slot2 = false
			slot3 = i18n("ship_profile_voice_locked_intimacy", math.floor(slot1.unlock_condition[2] / 100))
		end
	elseif slot1.unlock_condition[1] == uv0.CONDITION_MARRIED and slot0.shipGroup.married == 0 then
		slot2 = false
		slot3 = i18n("ship_profile_voice_locked_propose")
	end

	return slot2, slot3
end

function slot0.appendVoiceButton(slot0, slot1, slot2)
	slot4 = Ship.getWords(slot0.currentSkin.id, slot1.key)

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

	setActive(cloneTplTo(slot0.voiceTpl, slot0.voiceContainer), true)

	slot9, slot10 = slot0:voiceReplayCodition(slot1)

	if slot9 then
		setText(slot0:findTF("Text", slot8), slot1.voice_name)
	else
		setText(slot0:findTF("Text", slot8), "Locked")
	end

	setActive(slot0:findTF("tag_common", slot8), true)

	slot12 = false

	if slot5 ~= slot0.currentSkin.id and (slot0.currentSkinWord[slot3] ~= "" and slot0.currentSkinWord[slot3] ~= nil or string.find(slot3, "main") and slot7 ~= "nil") then
		slot12 = true

		setActive(slot0:findTF("tag_diff", slot8), true)
	else
		setActive(slot11, false)
	end

	onButton(slot0, slot8, function ()
		if uv0 then
			if uv1.l2dChar and uv1.live2dChecked and uv1.chatFlag then
				return
			end

			if uv1._currentVoice then
				uv1._currentVoice:Stop(true)
			end

			if uv2 == "headtouch" and uv3 == nil then
				LeanTween.cancel(uv1.chat.gameObject)

				uv1.chat.localScale = Vector3(0, 0)
			else
				uv1:showChat(uv2, uv4)
			end

			if uv1.characterModel then
				slot0 = nil

				uv1.characterModel:GetComponent(typeof(SpineAnimUI)):SetAction(uv5.spine_action == "" and "stand" or uv5.spine_action, 0)
			end

			if uv1.live2dChecked and uv1.l2dChar then
				uv1.l2dChar:TriggerAction(uv5.l2d_action, true)
			end
		else
			pg.TipsMgr.GetInstance():ShowTips(uv6)
		end
	end)
	slot0:appendVoiceExButton(slot1, slot6, slot12)
end

function slot0.appendVoiceExButton(slot0, slot1, slot2, slot3)
	slot6 = slot0.currentSkinWordEx and slot0.currentSkinWordEx[slot2 and "main" or slot1.key]
	slot7 = slot3 and slot6 and slot6 ~= ""

	if not slot6 or slot6 == "" then
		if not slot3 then
			if not slot0.origSkinConfig or not slot0.origSkinConfig[slot5] or slot6 == "" then
				return
			end
		else
			return
		end
	end

	for slot12, slot13 in ipairs(slot6) do
		if slot13[1] <= slot0.shipGroup.maxIntimacy / 100 + (slot0.shipGroup.married and slot0.shipGroup.married * 1000 or 0) then
			if slot2 and slot2 > #string.split(slot13[2], "|") then
				return
			end

			slot14 = cloneTplTo(slot0.voiceTpl, slot0.voiceContainer)

			setActive(slot14, true)
			setText(slot0:findTF("Text", slot14), slot1.voice_name .. "Ex")
			setActive(slot0:findTF("tag_diff", slot14), slot7)
			onButton(slot0, slot14, function ()
				if uv0.l2dChar and uv0.live2dChecked and uv0.chatFlag then
					return
				end

				if uv0._currentVoice then
					uv0._currentVoice:Stop(true)
				end

				if uv1 == "headtouch" and textContent == nil then
					LeanTween.cancel(uv0.chat.gameObject)

					uv0.chat.localScale = Vector3(0, 0)
				else
					uv0:showChat(uv1, uv2, uv3[1])
				end

				if uv0.characterModel then
					slot0 = nil

					uv0.characterModel:GetComponent(typeof(SpineAnimUI)):SetAction(uv4.spine_action == "" and "stand" or uv4.spine_action, 0)
				end

				if uv0.live2dChecked and uv0.l2dChar then
					uv0.l2dChar:SetAction(pg.AssistantInfo.action2Id[uv4.l2d_action])
				end
			end)
		end
	end
end

function slot0.showChat(slot0, slot1, slot2, slot3)
	if slot0.l2dChar and slot0.live2dChecked and slot0.chatFlag then
		return
	end

	slot0.chatFlag = true
	slot4, slot5, slot6, slot7 = nil

	if slot2 then
		if findTF(slot0.painting, "fitter").childCount > 0 then
			Ship.SetExpression(findTF(slot0.painting, "fitter"):GetChild(0), slot0.paintingName, "main_" .. slot2, slot3)
		end

		slot4, slot5 = Ship.getWords(slot0.currentSkin.id, "main", slot2, nil, slot3)
		slot6 = Ship.getCVCalibrate(slot0.currentSkin.id, "main", slot2)
		slot7 = Ship.getL2dSoundEffect(slot0.currentSkin.id, "main", slot2)
	else
		if findTF(slot0.painting, "fitter").childCount > 0 then
			Ship.SetExpression(findTF(slot0.painting, "fitter"):GetChild(0), slot0.paintingName, slot1, slot3)
		end

		slot4, slot5 = Ship.getWords(slot0.currentSkin.id, slot1, nil, , slot3)
		slot6 = Ship.getCVCalibrate(slot0.currentSkin.id, slot1)
		slot7 = Ship.getL2dSoundEffect(slot0.currentSkin.id, slot1)
	end

	slot8 = slot0.CHAT_SHOW_TIME

	if not slot0.live2dChecked then
		slot6 = 0
	end

	if slot0.currentSkinWord.voice_key >= 0 or slot0.currentSkinWord.voice_key == -2 then
		if slot0._currentVoice then
			slot0._currentVoice:Stop(true)
		end

		function slot9()
			slot0 = nil
			uv0._currentVoice, slot3 = playSoundEffect(uv1)

			if slot3 then
				uv2 = long2int(slot0.length) * 0.001
			end
		end

		if slot0._delayVoiceTweenID then
			LeanTween.cancel(slot0._delayVoiceTweenID)

			slot0._delayVoiceTweenID = nil
		end

		if slot0.l2dChar and slot6 and slot6 ~= 0 then
			slot0._delayVoiceTweenID = LeanTween.delayedCall(slot6, System.Action(function ()
				uv0()

				uv1._delayVoiceTweenID = nil
			end)).id
		else
			slot9()
		end
	end

	if slot0._delayL2dSeID then
		LeanTween.cancel(slot0._delayL2dSeID)

		slot0._delayL2dSeID = nil
	end

	if slot0.l2dChar and slot7 then
		slot0._delayL2dSeID = LeanTween.delayedCall(slot7[2], System.Action(function ()
			playSoundEffect("event:/ui/" .. uv0[1])

			uv1._delayL2dSeID = nil
		end)).id
	end

	setTextEN(slot0.chatText, slot4)

	if CHAT_POP_STR_LEN < #slot0.chatText:GetComponent(typeof(Text)).text then
		slot9.alignment = TextAnchor.MiddleLeft
	else
		slot9.alignment = TextAnchor.MiddleCenter
	end

	if slot0.initChatBgH < slot9.preferredHeight + 120 then
		slot0.chatBg.sizeDelta = Vector2.New(slot0.chatBg.sizeDelta.x, slot10)
	else
		slot0.chatBg.sizeDelta = Vector2.New(slot0.chatBg.sizeDelta.x, slot0.initChatBgH)
	end

	LeanTween.cancel(slot0.chat.gameObject)

	slot0.chat.localScale = Vector3(0, 0)

	LeanTween.scale(rtf(slot0.chat.gameObject), Vector3.New(1, 1, 1), slot0.CHAT_ANIMATION_TIME):setEase(LeanTweenType.easeOutBack):setDelay(slot6 and slot6 or 0):setOnComplete(System.Action(function ()
		LeanTween.scale(rtf(uv0.chat.gameObject), Vector3.New(0, 0, 1), uv0.CHAT_ANIMATION_TIME):setEase(LeanTweenType.easeInBack):setDelay(uv0.CHAT_ANIMATION_TIME + uv1):setOnComplete(System.Action(function ()
			uv0.chatFlag = false
		end))
	end))
end

function slot0.createLive2D(slot0, slot1)
	setActive(slot0.painting:Find("fitter"), false)

	if slot0.l2dChar then
		slot0.l2dChar:Dispose()
	end

	slot2 = slot0:findTF("live2d", slot0.painting)

	setActive(slot2, true)

	slot0.l2dChar = Live2D.New(Live2D.live2dData({
		ship = Ship.New({
			configId = slot0.shipGroup:getShipConfigId(),
			skin_id = slot0.currentSkin.id
		}),
		scale = Vector3(52, 52, 52),
		position = Vector3(0, -40, 100),
		parent = slot2
	}))

	if not slot0.l2dIsOn then
		slot0:hideLive2D()
	end
end

function slot0.hideLive2D(slot0)
	setActive(slot0.painting:Find("fitter"), true)

	if slot0.l2dChar then
		setActive(slot0:findTF("live2d", slot0.painting), false)
	end
end

function slot0.clearScrollTxt(slot0)
	if slot0.skinNameList ~= nil and #slot0.skinNameList > 0 then
		for slot4, slot5 in ipairs(slot0.skinNameList) do
			slot5:destroy()
		end
	end

	slot0.skinNameList = {}
end

function slot0.willExit(slot0)
	if slot0.designBg then
		PoolMgr.GetInstance():ReturnUI(slot0.designName, slot0.designBg)
	end

	slot1 = pg.UIMgr.GetInstance()

	slot1:UnOverlayPanel(slot0.blurPanel, slot0._tf)
	slot1:UnOverlayPanel(slot0.detailRight, slot0._tf)
	slot1:UnOverlayPanel(slot0.profile, slot0._tf)
	slot1:UnOverlayPanel(slot0.bottomTF, slot0._tf)

	if slot0._delayVoiceTweenID then
		LeanTween.cancel(slot0._delayVoiceTweenID)

		slot0._delayVoiceTweenID = nil
	end

	if slot0._delayL2dSeID then
		LeanTween.cancel(slot0._delayL2dSeID)

		slot0._delayL2dSeID = nil
	end

	if slot0.dragTrigger then
		ClearEventTrigger(slot0.dragTrigger)

		slot0.dragTrigger = nil
	end

	if slot0.tweens then
		cancelTweens(slot0.tweens)
	end

	if slot0.paintingName then
		retPaintingPrefab(slot0.painting, slot0.paintingName)

		slot0.paintingName = nil
		slot0.live2dOffset = nil
	end

	cameraPaintViewAdjust(false)

	if slot0.loadedCVBankName then
		pg.CriMgr.UnloadCVBank(slot0.loadedCVBankName)

		slot0.loadedCVBankName = nil
	end

	if slot0.loadedCVBattleBankName then
		pg.CriMgr.UnloadCVBank(slot0.loadedCVBattleBankName)

		slot0.loadedCVBattleBankName = nil
	end

	if not IsNil(slot0.characterModel) then
		PoolMgr.GetInstance():ReturnSpineChar(slot0.modelName, slot0.characterModel)
	end

	if slot0.l2dChar then
		slot0.l2dChar:Dispose()

		slot0.l2dChar = nil
	end

	if slot0.live2dTimer then
		slot0.live2dTimer:Stop()

		slot0.live2dTimer = nil
	end

	for slot5, slot6 in ipairs(slot0.maskTxts) do
		slot6:destroy()
	end

	for slot5, slot6 in pairs(slot0.skinTimers) do
		slot6:Stop()
	end

	slot0.skinTimers = nil

	slot0:ClearDyBg()
end

return slot0
