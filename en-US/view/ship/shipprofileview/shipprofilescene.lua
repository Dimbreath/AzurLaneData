slot0 = class("ShipProfileScene", import("...base.BaseUI"))
slot0.SHOW_SKILL_INFO = "event show skill info"
slot0.SHOW_EVALUATION = "event show evalution"
slot0.WEDDING_REVIEW = "event wedding review"
slot0.INDEX_DETAIL = 1
slot0.INDEX_PROFILE = 2
slot0.CHAT_ANIMATION_TIME = 0.3
slot0.CHAT_SHOW_TIME = 3
slot1 = 0.35

function slot0.getUIName(slot0)
	return "ShipProfileUI"
end

function slot0.preload(slot0, slot1)
	slot3 = getProxy(CollectionProxy).getShipGroup(slot2, slot0.contextData.groupId)

	GetSpriteFromAtlasAsync("bg/star_level_bg_" .. shipRarity2bgPrint(slot5, slot3:GetSkin(slot0.contextData.showTrans).id, slot3:isBluePrintGroup()), "", slot1)
end

function slot0.setShipGroup(slot0, slot1)
	slot0.shipGroup = slot1
	slot0.groupSkinList = slot1:getDisplayableSkinList()
	slot0.isBluePrintGroup = slot0.shipGroup:isBluePrintGroup()
end

function slot0.setShowTrans(slot0, slot1)
	slot0.showTrans = slot1
end

function slot0.setOwnedSkinList(slot0, slot1)
	slot0.ownedSkinList = slot1
end

function slot0.init(slot0)
	slot0.bg = slot0:findTF("bg")
	slot0.staticBg = slot0.bg:Find("static_bg")
	slot0.painting = slot0:findTF("paint")
	slot0.paintingFitter = findTF(slot0.painting, "fitter")
	slot0.paintingInitPos = slot0.painting.transform.localPosition
	slot0.chatTF = slot0:findTF("paint/chat")

	setActive(slot0.chatTF, false)

	slot0.commonPainting = slot0.painting:Find("fitter")
	slot0.l2dRoot = slot0:findTF("live2d", slot0.painting)
	slot0.chatBg = slot0:findTF("chatbgtop", slot0.chatTF)
	slot0.initChatBgH = slot0.chatBg.sizeDelta.y
	slot0.chatText = slot0:findTF("Text", slot0.chatBg)
	slot0.name = slot0:findTF("name")
	slot0.nameInitPos = slot0.name.transform.localPosition
	slot0.shipType = slot0:findTF("type", slot0.name)
	slot0.labelName = slot0:findTF("name_mask/Text", slot0.name):GetComponent(typeof(Text))
	slot0.labelEnName = slot0:findTF("english_name", slot0.name):GetComponent(typeof(Text))
	slot0.stars = slot0:findTF("stars", slot0.name)
	slot0.star = slot0:getTpl("star_tpl", slot0.stars)
	slot0.blurPanel = slot0:findTF("blur_panel")
	slot0.top = slot0:findTF("blur_panel/adapt/top")
	slot0.btnBack = slot0:findTF("back", slot0.top)
	slot0.bottomTF = slot0:findTF("bottom")
	slot0.labelHeart = slot0:findTF("adapt/detail_left_panel/heart/label", slot0.blurPanel)
	slot0.btnLike = slot0:findTF("adapt/detail_left_panel/heart/btnLike", slot0.blurPanel)
	slot0.btnLikeAct = slot0.btnLike:Find("like")
	slot0.btnLikeDisact = slot0.btnLike:Find("unlike")
	slot0.obtainBtn = slot0:findTF("bottom/obtain_btn")
	slot0.evaBtn = slot0:findTF("bottom/eva_btn")
	slot0.viewBtn = slot0:findTF("bottom/view_btn")
	slot0.shareBtn = slot0:findTF("bottom/share_btn")
	slot0.leftProfile = slot0:findTF("adapt/profile_left_panel", slot0.blurPanel)
	slot0.modelContainer = slot0:findTF("model", slot0.leftProfile)
	slot0.live2DBtn = ShipProfileLive2dBtn.New(slot0:findTF("L2D_btn", slot0.blurPanel))
	slot0.cvLoader = ShipProfileCVLoader.New()
	slot0.pageTFs = slot0:findTF("pages")
	slot0.paintingView = ShipProfilePaintingView.New(slot0._tf, slot0.painting)
	slot0.toggles = {
		slot0:findTF("bottom/detail"),
		slot0:findTF("bottom/profile")
	}
	slot1 = ShipProfileInformationPage.New(slot0.pageTFs, slot0.event)

	slot1:SetCvLoader(slot0.cvLoader)
	slot1:SetCallback(function (slot0)
		slot0:OnCVBtnClick(slot0)
	end)

	slot0.pages = {
		ShipProfileDetailPage.New(slot0.pageTFs, slot0.event),
		slot1
	}
	slot0.UISkinList = UIItemList.New(slot0.leftProfile:Find("scroll/Viewport/skin_container"), slot0.leftProfile:Find("scroll/Viewport/skin_container/skin_tpl"))
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.btnBack, function ()
		slot0:emit(slot1.ON_BACK)
	end, SFX_CANCEL)
	onButton(slot0, slot0.obtainBtn, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_OBTAIN,
			shipId = slot0.shipGroup:getShipConfigId(),
			list = slot0.shipGroup.groupConfig.description,
			mediatorName = ShipProfileMediator.__cname
		})
	end)
	onButton(slot0, slot0.evaBtn, function ()
		slot0:emit(slot1.SHOW_EVALUATION)
	end, SFX_PANEL)
	setActive(slot0.evaBtn, not slot0.contextData.showTrans)
	onButton(slot0, slot0.viewBtn, function ()
		slot0.paintingView:Start()
	end, SFX_PANEL)
	onButton(slot0, slot0.shareBtn, function ()
		pg.ShareMgr.GetInstance():Share(pg.ShareMgr.TypeShipProfile)
	end, SFX_PANEL)
	slot0.live2DBtn:AddListener(function (slot0)
		if slot0 then
			slot0:CreateLive2D()
		end

		setActive(slot0.viewBtn, not slot0)
		setActive(slot0.commonPainting, not slot0)
		setActive(slot0.l2dRoot, slot0)
		slot0:StopDailogue()

		slot0.l2dActioning = nil

		if slot0.skin then
			slot0.pages[slot1.INDEX_PROFILE]:ExecuteAction("Flush", slot0.skin, slot0)
		end
	end)

	for slot4, slot5 in ipairs(slot0.toggles) do
		onToggle(slot0, slot5, function (slot0)
			if slot0 == slot1.INDEX_DETAIL then
				slot2.live2DBtn:Update(slot2.paintingName, false)
			end

			if slot0 then
				slot2:SwitchPage(slot0)
			end
		end, SFX_PANEL)
	end

	slot0:InitCommon()
	slot0.live2DBtn:Update(slot0.paintingName, false)
	triggerToggle(slot0.toggles[slot0.INDEX_DETAIL], true)
	setActive(slot0.bottomTF, false)
end

function slot0.InitSkinList(slot0)
	slot0.skinBtns = {}

	slot0.UISkinList:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot4 = ShipProfileSkinBtn.New(slot2)

			table.insert(slot0.skinBtns, slot4)
			slot4:Update(slot3, slot0.shipGroup, table.contains(slot0.ownedSkinList, slot0.groupSkinList[slot1 + 1].id))
			onButton(slot0, slot4._tf, function ()
				if not slot0.unlock then
					pg.TipsMgr.GetInstance():ShowTips(i18n("ship_profile_skin_locked"))

					return
				end

				slot1.contextData.skinIndex = slot2 + 1

				slot2 + 1:ShiftSkin(slot3)

				if slot1.prevSkinBtn then
					slot1.prevSkinBtn:UnShift()
				end

				slot0:Shift()

				slot0.prevSkinBtn = slot0
			end, SFX_PANEL)
		end
	end)
	slot0.UISkinList:align(#slot0.groupSkinList)
end

function slot0.InitCommon(slot0)
	slot2 = slot0.shipGroup:getPainting(slot0.showTrans)

	slot0:LoadSkinBg(shipRarity2bgPrint(slot0.shipGroup:getRarity(slot0.showTrans), slot3, slot0.isBluePrintGroup))
	setImageSprite(slot0.shipType, GetSpriteFromAtlas("shiptype", slot0.shipGroup:getShipType(slot0.showTrans)))

	slot0.labelName.text = slot0.shipGroup:getName(slot0.showTrans)
	slot0.labelEnName.text = slot0.shipGroup.shipConfig.english_name

	for slot7 = 1, slot0.shipGroup.shipConfig.star, 1 do
		cloneTplTo(slot0.star, slot0.stars)
	end

	slot0:FlushHearts()
	slot0:SetPainting(slot3, slot0.showTrans)
end

function slot0.SetPainting(slot0, slot1, slot2)
	slot0:RecyclePainting()

	if slot2 and slot0.shipGroup.trans then
		slot1 = slot0.shipGroup.groupConfig.trans_skin
	end

	setPaintingPrefabAsync(slot0.painting, pg.ship_skin_template[slot1].painting, "chuanwu")

	slot0.paintingName = pg.ship_skin_template[slot1].painting
end

function slot0.RecyclePainting(slot0)
	if slot0.paintingName then
		retPaintingPrefab(slot0.painting, slot0.paintingName)
	end
end

function slot0.FlushHearts(slot0)
	setText(slot0.labelHeart, (slot0.shipGroup.hearts > 999 and "999+") or slot1)

	slot0.labelHeart:GetComponent("Text").color = (slot0.shipGroup.iheart and Color.New(1, 0.6, 0.6)) or Color.New(1, 1, 1)

	setActive(slot0.btnLikeDisact, not slot0.shipGroup.iheart)
	setActive(slot0.btnLikeAct, slot0.shipGroup.iheart)
end

function slot0.LoadSkinBg(slot0, slot1)
	slot0.bluePintBg = slot0.isBluePrintGroup and shipRarity2bgPrint(slot0.shipGroup:getRarity(slot0.showTrans), nil, true)

	if slot0.shipSkinBg ~= slot1 then
		slot0.shipSkinBg = slot1

		function slot3()
			PoolMgr.GetInstance():GetUI("raritydesign" .. slot0.shipGroup:getRarity(slot0.showTrans), true, function (slot0)
				slot0.designBg = slot0
				slot0.designName = "raritydesign" .. slot0.shipGroup:getRarity(slot0.showTrans)

				slot0.transform:SetParent(slot0.staticBg, false)

				slot0.transform.localPosition = Vector3(1, 1, 1)
				slot0.transform.localScale = Vector3(1, 1, 1)

				slot0.transform:SetSiblingIndex(1)
				setActive(slot0, true)
			end)
		end

		pg.DynamicBgMgr.GetInstance():LoadBg(slot0, slot1, slot0.bg, slot0.staticBg, function (slot0)
			rtf(slot0).localPosition = Vector3(0, 0, 200)
		end, function (slot0)
			if slot0.bluePintBg and slot1 == slot0.bluePintBg then
				if slot0.designBg and slot0.designName ~= "raritydesign" .. slot0.shipGroup:getRarity(slot0.showTrans) then
					PoolMgr.GetInstance():ReturnUI(slot0.designName, slot0.designBg)

					slot0.designBg = nil
				end

				if not slot0.designBg then
					slot2()
				else
					setActive(slot0.designBg, true)
				end
			elseif slot0.designBg then
				setActive(slot0.designBg, false)
			end
		end)
	end
end

function slot0.SwitchPage(slot0, slot1)
	if slot0.index ~= slot1 then
		seriesAsync({
			function (slot0)
				pg.UIMgr.GetInstance():OverlayPanel(slot0.blurPanel, {
					groupName = LayerWeightConst.GROUP_SHIP_PROFILE
				})
				slot0()
			end,
			function (slot0)
				slot2 = slot0.pages[] == slot2.INDEX_PROFILE and not slot1:GetLoaded()

				slot1:ExecuteAction("Update", slot0.shipGroup, slot0.showTrans, function ()
					if slot0 then
						slot1:InitSkinList()
					end

					slot2()
				end)
			end,
			function (slot0)
				if not slot0.index then
					slot0()

					return
				end

				slot0.pages[slot0.index]:ExecuteAction("ExistAnim", slot0.pages[slot0.index])
				slot0()
			end,
			function (slot0)
				SetParent(slot0.bottomTF, slot0.pages[]._tf)
				setActive(slot0.bottomTF, true)
				setAnchoredPosition(slot0.bottomTF, {
					z = 0,
					x = -7,
					y = 24
				})
				slot0.pages[].ExecuteAction(slot1, "EnterAnim", slot0.pages[].ExecuteAction)
				slot0:TweenPage(slot0.pages[])
				slot0()
			end,
			function (slot0)
				slot0.index = slot0

				if (slot0.contextData.skinIndex or 1) == slot2.INDEX_PROFILE and slot1 <= #slot0.skinBtns then
					triggerButton(slot0.skinBtns[slot1]._tf)
				end
			end
		})
	end
end

function slot0.TweenPage(slot0, slot1)
	if slot1 == slot0.INDEX_DETAIL then
		LeanTween.moveX(rtf(slot0.leftProfile), -500, slot1):setEase(LeanTweenType.easeInOutSine)
		LeanTween.moveY(rtf(slot0.live2DBtn._tf), -70, slot1):setEase(LeanTweenType.easeInOutSine)
		LeanTween.moveX(rtf(slot0.painting), slot0.paintingInitPos.x, slot1):setEase(LeanTweenType.easeInOutSine)
		LeanTween.moveX(rtf(slot0.name), slot0.nameInitPos.x, slot1):setEase(LeanTweenType.easeInOutSine)
	elseif slot1 == slot0.INDEX_PROFILE then
		LeanTween.moveX(rtf(slot0.leftProfile), 0, slot1):setEase(LeanTweenType.easeInOutSine)
		LeanTween.moveY(rtf(slot0.live2DBtn._tf), 60, slot1):setEase(LeanTweenType.easeInOutSine)
		LeanTween.moveX(rtf(slot0.painting), slot0.paintingInitPos.x + 50, slot1):setEase(LeanTweenType.easeInOutSine)
		LeanTween.moveX(rtf(slot0.name), slot0.nameInitPos.x + 50, slot1):setEase(LeanTweenType.easeInOutSine)
	end
end

function slot0.ShiftSkin(slot0, slot1)
	if slot0.index ~= slot0.INDEX_PROFILE or (slot0.skin and slot1.id == slot0.skin.id) then
		return
	end

	slot0.skin = slot1

	slot0:LoadModel(slot1)
	slot0:SetPainting(slot1.id, false)
	slot0.live2DBtn:Disable()
	slot0.live2DBtn:Update(slot0.paintingName, false)
	slot0.pages[slot0.INDEX_PROFILE].ExecuteAction(slot2, "Flush", slot1, false)

	slot3 = nil

	slot0:LoadSkinBg((not slot0.skin.bg_sp or slot0.skin.bg_sp == "" or not (PlayerPrefs.GetInt("paint_hide_other_obj_" .. slot0.skin.painting, 0) == 0) or slot0.skin.bg_sp) and (not slot0.skin.bg or slot0.skin.bg == "" or slot0.skin.bg) and shipRarity2bgPrint(slot0.shipGroup:getRarity(slot0.showTrans), slot0.skin.id, slot0.shipGroup:isBluePrintGroup()))
end

function slot0.LoadModel(slot0, slot1)
	if slot0.inLoading then
		return
	end

	slot0:ReturnModel()

	slot0.inLoading = true

	PoolMgr.GetInstance():GetSpineChar(slot1.prefab, true, function (slot0)
		slot0.inLoading = false
		slot0.name = slot0
		slot0.transform.localPosition = Vector3.zero
		slot0.transform.localScale = Vector3(0.8, 0.8, 1)

		slot0.transform:SetParent(slot0.modelContainer, false)
		slot0:GetComponent(typeof(SpineAnimUI)).SetAction(slot2, slot2.show_skin or "stand", true)

		slot0.characterModel = slot0
		slot0.modelName = slot0
	end)
end

function slot0.ReturnModel(slot0)
	if not IsNil(slot0.characterModel) then
		PoolMgr.GetInstance():ReturnSpineChar(slot0.modelName, slot0.characterModel)
	end
end

function slot0.CreateLive2D(slot0)
	slot0.live2DBtn:SetEnable(false)

	if slot0.l2dChar then
		slot0.l2dChar:Dispose()
	end

	slot0.l2dChar = Live2D.New(slot2, function ()
		slot0.live2DBtn:SetEnable(true)
	end)

	if isHalfBodyLive2D(slot0.skin.prefab) then
		setAnchoredPosition(slot0.l2dRoot, {
			y = -37 - (slot0.painting.rect.height - slot0.l2dRoot.rect.height * 1.5) / 2
		})
	else
		setAnchoredPosition(slot0.l2dRoot, {
			y = 0
		})
	end
end

function slot0.GetModelAction(slot0, slot1)
	slot2 = nil

	if not slot1.spine_action or slot1.spine_action == "" then
		return "stand"
	else
		return slot1.spine_action
	end
end

function slot0.OnCVBtnClick(slot0, slot1)
	if slot0.l2dActioning then
		return
	end

	slot2 = slot1.voice

	slot0:UpdatePaintingFace(slot1)

	if slot0.characterModel then
		slot0.characterModel:GetComponent(typeof(SpineAnimUI)):SetAction(slot0:GetModelAction(slot2), 0)
	end

	slot3 = {
		slot0.CHAT_SHOW_TIME
	}

	if slot0.live2DBtn.isOn and slot0.l2dChar then
		slot0.l2dActioning = true

		parallelAsync({
			function (slot0)
				slot0.l2dChar:TriggerAction(slot1.l2d_action, slot0)
			end,
			function (slot0)
				slot0:PlayVoice(slot0.PlayVoice, slot0)
				slot0:ShowDailogue(slot0.ShowDailogue, slot0, slot0)
			end
		}, function ()
			slot0.l2dActioning = false
		end)
	else
		slot0:PlayVoice(slot1, slot3)
		slot0:ShowDailogue(slot1, slot3)
	end
end

function slot0.UpdatePaintingFace(slot0, slot1)
	slot4 = slot1.voice.key

	if slot1.wordData.mainIndex ~= nil then
		slot4 = "main_" .. slot2.mainIndex
	end

	if slot0.paintingFitter.childCount > 0 then
		Ship.SetExpression(slot0.paintingFitter:GetChild(0), slot0.paintingName, slot4, slot2.matchFavor)
	end
end

function slot0.PlayVoice(slot0, slot1, slot2)
	slot4 = slot1.skin
	slot5 = slot1.words

	slot0:RemoveCvTimer()

	if not slot1.wordData.cvPath or slot3.cvPath == "" then
		return
	end

	if ShipWordHelper.CV_KEY_REPALCE <= slot5.voice_key or slot5.voice_key == ShipWordHelper.CV_KEY_BAN_NEW then
		slot6 = 0

		if slot1.isLive2d and slot0.l2dChar and slot3.voiceCalibrate then
			slot6 = slot3.voiceCalibrate
		end

		slot0.cvLoader:DelayPlaySound(slot3.cvPath, slot6, function (slot0)
			if slot0 then
				slot0[1] = long2int(slot0.length) * 0.001
			end
		end)
	end

	slot6 = slot3.se

	if slot1.isLive2d and slot0.l2dChar and slot6 then
		slot0.cvLoader:RawPlaySound("event:/ui/" .. slot6[1], slot6[2])
	end
end

function slot0.RemoveCvSeTimer(slot0)
	if slot0.cvSeTimer then
		slot0.cvSeTimer:Stop()

		slot0.cvSeTimer = nil
	end
end

function slot0.RemoveCvTimer(slot0)
	if slot0.cvTimer then
		slot0.cvTimer:Stop()

		slot0.cvTimer = nil
	end
end

function slot0.ShowDailogue(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-7, warpins: 2 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 16-33, warpins: 2 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 40-46, warpins: 2 ---
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 63-94, warpins: 2 ---
	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-3, warpins: 1 ---
		function slot3()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-1, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	if not slot1.wordData.textContent or slot4 == "" or slot4 == "nil" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-15, warpins: 3 ---
		slot3()

		return
		--- END OF BLOCK #0 ---



	end

	slot5 = slot1.wordData.voiceCalibrate

	setText(slot0.chatText, slot4)

	if CHAT_POP_STR_LEN >= #slot0.chatText:GetComponent(typeof(Text)).text or not TextAnchor.MiddleLeft then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 38-39, warpins: 2 ---
		slot7 = TextAnchor.MiddleCenter
		--- END OF BLOCK #0 ---



	end

	slot6.alignment = slot7
	slot8 = slot0.chatBg

	if slot0.initChatBgH >= slot6.preferredHeight + 120 or not Vector2.New(slot0.chatBg.sizeDelta.x, slot7) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 56-62, warpins: 2 ---
		slot9 = Vector2.New(slot0.chatBg.sizeDelta.x, slot0.initChatBgH)
		--- END OF BLOCK #0 ---



	end

	slot8.sizeDelta = slot9

	slot0:StopDailogue()
	setActive(slot0.chatTF, true)

	slot9 = LeanTween.scale(rtf(slot0.chatTF.gameObject), Vector3.New(1, 1, 1), slot0.CHAT_ANIMATION_TIME):setEase(LeanTweenType.easeOutBack)
	slot8 = LeanTween.scale(rtf(slot0.chatTF.gameObject), Vector3.New(1, 1, 1), slot0.CHAT_ANIMATION_TIME).setEase(LeanTweenType.easeOutBack).setDelay
	slot10 = (slot5 and slot5) or 0

	slot8(LeanTween.scale(rtf(slot0.chatTF.gameObject), Vector3.New(1, 1, 1), slot0.CHAT_ANIMATION_TIME).setEase(LeanTweenType.easeOutBack), slot10):setOnComplete(System.Action(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-37, warpins: 1 ---
		LeanTween.scale(rtf(slot0.chatTF.gameObject), Vector3.New(0, 0, 1), slot1.CHAT_ANIMATION_TIME):setEase(LeanTweenType.easeInBack):setDelay(slot1.CHAT_ANIMATION_TIME + slot2[1]):setOnComplete(System.Action(slot2[1]))

		return
		--- END OF BLOCK #0 ---



	end))

	return

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #5 95-96, warpins: 1 ---
	if not slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 97-97, warpins: 2 ---
		slot10 = 0
		--- END OF BLOCK #0 ---



	end
	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 98-107, warpins: 2 ---
	--- END OF BLOCK #6 ---



end

function slot0.StopDailogue(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	LeanTween.cancel(slot0.chatTF.gameObject)

	slot0.chatTF.localScale = Vector3(0, 0)

	return
	--- END OF BLOCK #0 ---



end

function slot0.onBackPressed(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0.paintingView.isPreview then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-10, warpins: 1 ---
		slot0.paintingView:Finish(true)

		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-14, warpins: 2 ---
	triggerButton(slot0.btnBack)

	return
	--- END OF BLOCK #1 ---



end

function slot0.willExit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-17, warpins: 1 ---
	SetParent(slot0.bottomTF, slot0._tf)
	pg.UIMgr.GetInstance():UnOverlayPanel(slot0.blurPanel, slot0._tf)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 18-22, warpins: 0 ---
	for slot4, slot5 in ipairs(slot0.pages) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 18-20, warpins: 1 ---
		slot5:Destroy()
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 21-22, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 23-25, warpins: 1 ---
	if slot0.l2dChar then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 26-29, warpins: 1 ---
		slot0.l2dChar:Dispose()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 30-52, warpins: 2 ---
	slot0.paintingView:Dispose()
	slot0.live2DBtn:Dispose()
	slot0.cvLoader:Dispose()
	slot0:ReturnModel()
	slot0:RecyclePainting()

	slot1 = _.each

	if not slot0.skinBtns then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 53-53, warpins: 1 ---
		slot2 = {}
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 54-62, warpins: 2 ---
	slot1(slot2, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		slot0:Dispose()

		return
		--- END OF BLOCK #0 ---



	end)
	slot0:RemoveCvTimer()
	slot0:RemoveCvSeTimer()

	return
	--- END OF BLOCK #4 ---



end

return slot0
