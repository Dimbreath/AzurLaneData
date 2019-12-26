slot0 = class("ProposeSceneUI", import("..base.BaseUI"))
slot1 = {
	1,
	2,
	3,
	4,
	4,
	5,
	5,
	7,
	7,
	7,
	7,
	6,
	7
}
slot0.nationSpriteIndex = {
	us = 1,
	de = 4,
	cm = 0,
	cn = 5,
	np = 9,
	um = 11,
	en = 2,
	jp = 3,
	mnf = 8,
	bili = 10,
	ff = 7,
	sn = 6
}

function slot0.getUIName(slot0)
	return "ProposeUI"
end

function slot0.setShip(slot0, slot1)
	slot0.shipVO = slot1

	slot0:setShipGroupID(slot0.shipVO:getGroupId())
end

function slot0.setShipGroupID(slot0, slot1)
	slot0.shipGroupID = slot1
end

function slot0.setWeddingReviewSkinID(slot0, slot1)
	slot0.reviewSkinID = slot1
end

function slot0.setBagProxy(slot0, slot1)
	slot0.bagProxy = slot1
end

function slot0.setPlayer(slot0, slot1)
	slot0.player = slot1
end

function slot0.init(slot0)
	slot0.storybg = slot0:findTF("close/bg")
	slot0.bgAdd = slot0:findTF("add")

	setActive(slot0.storybg, false)
	setActive(slot0.bgAdd, false)

	slot0.targetActorTF = slot0:findTF("actor_middle")
	slot0.maskTF = slot0:findTF("mask")
	slot0.skipBtn = slot0:findTF("skip_button")
	slot0.actorPainting = nil
	slot0.weddingReview = slot0.contextData.review
	slot0.commonTF = GameObject.Find("OverlayCamera/Overlay/UIMain/common")
end

function slot0.didEnter(slot0)
	if slot0.contextData.review then
	end

	if slot0.commonTF then
		setActive(slot0.commonTF, false)
	end

	slot0.weddingReview = slot0.contextData.review

	if slot0.weddingReview then
		slot0.bgName = Nation.Nation2BG(slot0.contextData.group:getNation())

		if not slot0.bgName then
			slot0.bgName = Nation.Nation2BG(0)
		end

		setActive(slot0.skipBtn, true)
		onButton(slot0, slot0.skipBtn, function ()
			LeanTween.cancelAll(false)
			LeanTween.cancelAll:emit(slot1.ON_CLOSE)
		end, SFX_CANCEL)
		slot0:setMask(true)
		slot0:showProposePanel()
		pg.UIMgr.GetInstance():BlurPanel(slot0._tf)
	else
		onButton(slot0, slot0:findTF("close0"), function ()
			if slot0.proposeEndFlag then
				slot0:DisplayRenamePanel()
			else
				slot0:emit(slot1.ON_CLOSE)
			end
		end, SFX_CANCEL)
		onButton(slot0, slot0:findTF("close_end"), function ()
			if slot0.proposeEndFlag then
				slot0:DisplayRenamePanel()
			else
				slot0:emit(slot1.ON_CLOSE)
			end
		end, SFX_CANCEL)

		slot0.bgName = Nation.Nation2BG(slot1)

		PoolMgr.GetInstance():GetUI("Propose" .. Nation.Nation2Side(slot1) .. "UI", true, function (slot0)
			pg.UIMgr.GetInstance():LoadingOff()

			if slot0.exited then
				PoolMgr.GetInstance():ReturnUI(PoolMgr.GetInstance().ReturnUI, slot0)

				return
			end

			slot0.window = tf(slot0)

			setParent(tf(slot0), slot0:findTF("window"))

			slot0.intimacyTF = slot0:findTF("intimacy/icon", slot0.window)
			slot0.intimacyValueTF = slot0:findTF("intimacy/value", slot0.window)
			slot0.button = slot0:findTF("button", slot0.window)
			slot0.intimacyDesc = slot0:findTF("desc", slot0.window)
			slot0.intimacydescTime = slot0:findTF("descPic/desc_time", slot0.window)
			slot0.intimacyDescPic = slot0:findTF("descPic", slot0.window)
			slot0.intimacyBuffDesc = slot0:findTF("desc_buff", slot0.window)
			slot0._paintingTF = slot0:findTF("paintMask/paint", slot0.window)
			slot0.intimacyAchieved = slot0:findTF("intimacy/achieved", slot0.window)
			slot0.intimacyNoAchieved = slot0:findTF("intimacy/no_achieved", slot0.window)
			slot0.ringAchieved = slot0:findTF("ringCount/achieved", slot0.window)
			slot0.ringNoAchieved = slot0:findTF("ringCount/no_achieved", slot0.window)
			slot0.ringValue = slot0:findTF("ringCount/value", slot0.window)
			slot0.nameTF = slot0:findTF("title1/Text", slot0.window)
			slot0.shipNameTF = slot0:findTF("title2/Text", slot0.window)
			slot0.campTF = slot0:findTF("Camp", slot0.window)
			slot0.doneTF = slot0:findTF("done", slot0.window)
			slot0.CampSprite = slot0:findTF("CampSprite", slot0.window)

			setActive(slot0.window, true)
			setText(slot0.nameTF, slot0.player.name)
			setText(slot0.shipNameTF, slot0.shipVO:getName())

			if slot0.CampSprite then
				if not getImageSprite(slot0:findTF(Nation.Nation2Print(slot2), slot0.CampSprite)) then
					warning("找不到印花, shipConfigId: " .. slot0.shipVO.configId)
					setActive(slot0.campTF, false)
				else
					setImageSprite(slot0.campTF, slot1, false)
					setActive(slot0.campTF, true)
				end
			end

			slot6, slot2, slot9 = slot0.shipVO:getIntimacyDetail()

			setImageSprite(slot0.intimacyTF, slot4, true)
			setActive(slot0.intimacyTF, true)
			setText(slot0.intimacyValueTF, i18n("propose_intimacy_tip", slot3))

			if slot3 >= 100 then
				setTextColor(slot0.intimacyValueTF, Color.white)
			else
				setTextColor(slot0.intimacyValueTF, Color.New(0.5843137254901961, 0.5215686274509804, 0.40784313725490196))
			end

			slot5 = not slot0.shipVO.propose and slot2 <= slot3

			setActive(slot0.button, not slot0.shipVO.propose)
			setActive(slot0.intimacyAchieved, slot0.shipVO.propose or slot3 >= 100)
			setActive(slot0.intimacyNoAchieved, slot3 < 100 and not slot0.shipVO.propose)
			setActive(slot0.ringAchieved, slot0.shipVO.propose or slot0.bagProxy:getItemCountById(ITEM_ID_FOR_PROPOSE) > 0)
			setActive(slot0.ringNoAchieved, slot0.bagProxy.getItemCountById(ITEM_ID_FOR_PROPOSE) <= 0 and not slot0.shipVO.propose)

			if slot0.shipVO.propose or slot6 > 0 then
				setTextColor(slot0.ringValue, Color.white)
			else
				setTextColor(slot0.ringValue, Color.New(0.5843137254901961, 0.5215686274509804, 0.40784313725490196))
			end

			setActive(slot0.doneTF, slot0.shipVO.propose)

			slot0.button:GetComponent(typeof(Button)).interactable = slot6 > 0 and slot5
			slot7, slot8 = slot0.shipVO:getInitmacyInfo()

			if slot0.shipVO.propose then
				if slot0.intimacyDescPic then
					setActive(slot0.intimacyDescPic, true)
					setActive(slot0.intimacyDesc, false)
					setText(slot0.intimacydescTime, pg.TimeMgr.GetInstance():STimeDescS(slot0.shipVO.proposeTime, "%B.%d,    %y"))
				elseif slot0.intimacyDesc then
					setActive(slot0.intimacyDesc, true)

					if not IsNil(GetComponent(slot0.intimacyDesc, "VerticalText")) then
						slot9.enabled = true

						setText(slot0.intimacyDesc, i18n("intimacy_desc_propose_vertical", pg.TimeMgr.GetInstance():ChieseDescTime(slot0.shipVO.proposeTime, true)))
					else
						setText(slot0.intimacyDesc, i18n("intimacy_desc_propose", pg.TimeMgr.GetInstance():STimeDescS(slot0.shipVO.proposeTime, "%Y年%m月%d日", true)))
					end
				end
			else
				if slot1 == "ProposeJpUI" and not IsNil(GetComponent(slot0.intimacyDesc, "VerticalText")) then
					slot9.enabled = false
				end

				if slot0.intimacyDescPic then
					setActive(slot0.intimacyDescPic, false)
				end

				if slot0.intimacyDesc then
					setActive(slot0.intimacyDesc, true)
					setText(slot0.intimacyDesc, i18n(slot8, slot0.shipVO.name))
				end
			end

			setText(slot0.intimacyBuffDesc, "*" .. i18n(slot8 .. "_buff"))
			slot0:loadChar()
			pg.UIMgr.GetInstance():BlurPanel(slot0._tf)
			onButton(slot0, slot0.button, function ()
				if slot0 then
					if slot1 < 1 then
						pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_item_1"))

						return
					end

					slot0, slot1 = Ship.canProposeShip(slot2.shipVO)

					if not slot0 then
						pg.TipsMgr.GetInstance():ShowTips(slot1)

						return
					end

					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = i18n("word_propose_cost_tip", slot1),
						onYes = function ()
							if slot0.intimacydescTime then
								setText(slot0.intimacydescTime, pg.TimeMgr.GetInstance():STimeDescS(pg.TimeMgr.GetInstance():GetServerTime(), "%B.%d,    %y"))
							end

							slot0:setMask(true)
							slot0.setMask:hideWindow()
							slot0.setMask.hideWindow:showProposePanel()
							setActive(slot0.window, false)
						end
					})
				else
					slot2:emit(slot3.ON_CLOSE)
				end
			end, SFX_PANEL)
		end)
	end
end

function slot0.onBackPressed(slot0)
	if isActive(slot0.window) then
		playSoundEffect(SFX_CANCEL)
		triggerButton(slot0:findTF("close_end"))
	end
end

function slot0.willExit(slot0)
	if slot0.delayTId then
		LeanTween.cancel(slot0.delayTId)
	end

	if slot0.commonTF then
		setActive(slot0.commonTF, true)
	end

	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf)

	if slot0.l2dChar then
		slot0.l2dChar:ClearPics()
		pg.Live2DMgr.GetInstance():TryReleaseLive2dRes(slot0.l2dChar.name)

		slot0.l2dChar = nil
	end

	if slot0._delayVoiceTweenID then
		LeanTween.cancel(slot0._delayVoiceTweenID)

		slot0._delayVoiceTweenID = nil
	end

	if not slot0.contextData.shipId then
		LeanTween.cancelAll()
	end

	pg.CriMgr.GetInstance():resumeNormalBGM()

	if slot0.contextData.callback then
		slot0.contextData.callback()
	end
end

function slot0.setMask(slot0, slot1)
	setActive(slot0.maskTF, slot1)
end

function slot0.bgAddAnimation(slot0, slot1)
	setActive(slot0.storybg, true)
	slot0:showbgAdd(true, slot1)
end

function slot0.showbgChurch(slot0)
	LeanTween.scale(slot0.storybg, Vector3(1, 1, 1), 6)
	setActive(slot0.churchLight, true)
	LeanTween.delayedCall(6, System.Action(function ()
		setActive(slot0.churchLight, false)
	end))
end

function slot0.showbgAdd(slot0, slot1, slot2)
	LeanTween.alphaCanvas(slot5, (slot1 and 0) or 1, slot2):setFrom((slot1 and 1) or 0)
	setActive(slot0.bgAdd, true)
end

function slot0.showBlackBG(slot0, slot1, slot2)
	LeanTween.alphaCanvas(slot5, (slot1 and 0) or 1, slot2):setFrom((slot1 and 1) or 0):setOnComplete(System.Action(function ()
		if slot0 then
			setActive(slot1.blackBG, false)
		end
	end))
	setActive(slot0.blackBG, true)
end

function slot0.showPainting(slot0, slot1, slot2)
	slot3 = false

	function slot4()
		if slot0 then
			return
		end

		slot0 = true

		LeanTween.alphaCanvas(slot2, (slot1 and 1) or 0, LeanTween.alphaCanvas):setFrom((slot1 and 0) or 1)
	end

	if slot1 then
		slot0:loadChar(slot0.targetActorTF, "duihua", function ()
			slot0()
		end)
	end

	slot4()
end

function slot0.showLive2D(slot0, slot1)
	setActive(slot0:findTF("fitter", slot0.targetActorTF), false)
	setActive(slot0:findTF("live2d", slot0.targetActorTF), true)
	LeanTween.alphaCanvas(slot2, 1, 2):setFrom(0):setOnComplete(System.Action(function ()
		slot0.l2dChar:SetAction(pg.AssistantInfo.action2Id[slot0.l2dChar])
	end))
end

function slot0.hideWindow(slot0)
	GetOrAddComponent(slot0.window, typeof(CanvasGroup)).interactable = false

	LeanTween.alphaCanvas(slot1, 0, 0.2):setFrom(1):setOnComplete(System.Action(function ()
		slot0.interactable = true
	end))
end

function slot0.stampWindow(slot0)
	slot0.proposeEndFlag = true

	slot0:loadChar()
	setActive(slot0.window, true)
	setActive(slot0.button, false)

	slot1 = nil

	if slot0.intimacyDescPic then
		setActive(slot0.intimacyDesc, false)
		setActive(slot0.intimacyDescPic, true)

		slot1 = GetOrAddComponent(slot0.intimacyDescPic, typeof(CanvasGroup))
	elseif slot0.intimacyDesc and GetComponent(slot0.intimacyDesc, typeof(Text)) then
		if GetComponent(slot0.intimacyDesc, "VerticalText") then
			setText(slot0.intimacyDesc, i18n("intimacy_desc_propose_vertical", pg.TimeMgr.GetInstance():ChieseDescTime(slot0.shipVO.proposeTime, true)))
		else
			setText(slot0.intimacyDesc, i18n("intimacy_desc_propose", pg.TimeMgr.GetInstance():STimeDescS(slot0.shipVO.proposeTime, "%Y年%m月%d日", true)))
		end

		slot1 = GetOrAddComponent(slot0.intimacyDesc, typeof(CanvasGroup))
	end

	setText(slot0.intimacyBuffDesc, "")
	setActive(slot0.doneTF, false)

	slot1.alpha = 0
	GetOrAddComponent(slot0.window, typeof(CanvasGroup)).interactable = false

	LeanTween.alphaCanvas(slot2, 1, 0.8):setFrom(0)
	LeanTween.delayedCall(1.5, System.Action(function ()
		LeanTween.alphaCanvas(LeanTween.alphaCanvas, 1, 2):setFrom(0)
	end))

	slot0.delayTId = LeanTween.delayedCall(5, System.Action(function ()
		if not slot0 then
			return
		end

		slot0.interactable = true

		setActive(true.doneTF, true)
		true.doneTF:setMask(false)
		setActive(true.doneTF:findTF("close_end"), true)
		playSoundEffect(SFX_UI_SEAL)
	end)).id
end

function slot0.showProposePanel(slot0)
	slot0.proposeSkin = ShipGroup.getProposeSkin(slot0.shipGroupID)

	if slot0.proposeSkin and slot0.actorPainting then
		PoolMgr.GetInstance():ReturnPainting(slot0.paintingName, slot0.actorPainting)

		slot0.actorPainting = nil
	end

	function slot1()
		LeanTween.scale(slot0.door, Vector3(2.1, 2.1, 2.1), 4)
		slot0.doorAni:SetActionCallBack(function (slot0)
			if slot0 == "FINISH" then
				slot0.doorAni:SetActionCallBack(nil)
				setActive(slot0.door, false)
				slot0:showBlackBG(true, 0.1)
				setActive(slot0.doorLightBG, false)
				setActive()
			end
		end)
		LeanTween.delayedCall(2, System.Action(function ()
			slot0:showbgAdd(false, 2)
		end))
		LeanTween.alpha(rtf(slot0.doorLightBG), 1, 2):setFrom(0)
		slot0:showBlackBG(false, 0.1)
		slot0.doorAni:SetAction("OPEN", 0)
		playSoundEffect(SFX_UI_DOOR)
	end

	pg.CriMgr.GetInstance():PlayBGM("wedding", true)

	if not slot0.proposePanel then
		PoolMgr.GetInstance():GetUI("ProposeRingUI", true, function (slot0)
			pg.UIMgr.GetInstance():LoadingOff()

			if slot0.exited then
				PoolMgr.GetInstance():ReturnUI(PoolMgr.GetInstance().ReturnUI, slot0)

				return
			end

			slot0.proposePanel = tf(slot0)
			slot0.handId = pg.ship_skin_template[(slot0.weddingReview and slot0.reviewSkinID) or slot0.shipVO.skinId].hand_id
			slot2 = pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y%m%d", true)

			if SPECIAL_PROPOSE and SPECIAL_PROPOSE[1] == slot2 then
				for slot6, slot7 in ipairs(SPECIAL_PROPOSE[2]) do
					if slot7[1] == slot1 then
						slot0.handId = slot7[2]
					end
				end
			end

			slot0.handName = "ProposeHand_" .. slot0.handId

			PoolMgr.GetInstance():GetUI(slot0.handName, true, function (slot0)
				slot0.transHand = tf(slot0)

				setParent(slot0.transHand, slot0.proposePanel)

				slot0.handTF = slot0:findTF("hand", slot0.transHand)
				slot0.ringTF = slot0:findTF("ring", slot0.transHand)
				slot0.ringAnim = slot0.ringTF:GetComponent(typeof(Animator))
				slot0.ringAnim.enabled = false
				slot0.ringLight = slot0:findTF("ring_light", slot0.ringTF)
				slot0.ringLightCG = GetOrAddComponent(slot0.ringLight, typeof(CanvasGroup))
				slot0.ringCG = GetOrAddComponent(slot0.ringTF, typeof(CanvasGroup))
			end)
			setParent(tf(slot0), slot0:findTF("contain"))

			slot0.ringBoxTF = slot0:findTF("ringBox", slot0.proposePanel)
			slot0.ringBoxFull = slot0:findTF("full", slot0.ringBoxTF)
			slot0.ringBoxCG = GetOrAddComponent(slot0.ringBoxTF, typeof(CanvasGroup))
			slot0.churchBefore = slot0:findTF("before", slot0.proposePanel)
			slot0.churchLight = slot0:findTF("light", slot0.churchBefore)

			setParent(slot0.churchLight, slot0._tf)
			slot0.churchLight:SetSiblingIndex(2)

			slot0.blackBG = slot0:findTF("blackbg", slot0.churchBefore)
			slot0.doorLightBG = slot0:findTF("door_light", slot0.churchBefore)
			slot0.door = slot0:findTF("door", slot0.churchBefore)
			slot0.doorAni = GetOrAddComponent(slot0.door, "SpineAnimUI")

			setParent(slot0.churchBefore, slot0:findTF("contain"))

			slot0.ringTipTF = slot0:findTF("tip", slot0.proposePanel)
			slot0.ringTipCG = GetOrAddComponent(slot0.ringTipTF, typeof(CanvasGroup))

			setText(slot0:findTF("Text", slot0.ringTipTF), i18n("word_propose_ring_tip"))
			setActive(slot0:findTF("finger", slot0.ringTipTF), false)
			onButton(slot0, slot0.ringBoxTF, function ()
				if slot0.ringBoxClicked then
					return
				end

				slot0.ringBoxClicked = true

				LeanTween.alpha(rtf(slot0.ringBoxFull), 0, 0.6):setOnComplete(System.Action(function ()
					LeanTween.delayedCall(0.1, System.Action(function ()
						slot0.ringAnim.enabled = true

						slot0.ringAnim.ringAnim:Play("movein")
						LeanTween.delayedCall(0.5, System.Action(function ()
							slot0.ringAnim:Play("blink")
							LeanTween.alphaCanvas(slot0.ringTipCG, 1, 1.5):setFrom(0):setOnComplete(System.Action(function ()
								setActive(slot0:findTF("finger", slot0.ringTipTF), true)
								setActive:enableRingDrag(true)
							end))
						end))
					end))
				end))
			end)
			LoadImageSpriteAsync(slot0.bgName, slot0.storybg)

			slot0.storybg.localScale = Vector3(1.2, 1.2, 1.2)

			onNextTick(function ()
				if slot0.exited then
					return
				end

				slot1()
			end)
		end)

		return
	end

	slot1()
end

function slot0.ringOn(slot0)
	if slot0.isRingOn then
		return
	end

	setActive(slot0.ringTipTF, false)

	slot0.isRingOn = true

	slot0.ringTF:GetComponent("DftAniEvent").SetEndEvent(slot1, function (slot0)
		slot0.ringAnim.enabled = false
		slot0.isRingOn = false

		if not slot0.weddingReview then
			slot0:emit(ProposeMediator.ON_PROPOSE, slot0.shipVO.id)
		else
			slot0:RingFadeout(function ()
				slot0:displayShipWord("propose")
			end)
		end
	end)

	slot0.ringAnim.enabled = true

	slot0.ringAnim:Play("wear")
end

function slot0.enableRingDrag(slot0, slot1)
	if not slot0.press then
		slot0:addRingDragListenter()
	end

	slot0.press.enabled = slot1
end

function slot0.addRingDragListenter(slot0)
	slot0.press = GetOrAddComponent(slot0.proposePanel, "EventTriggerListener")
	slot1 = nil

	slot0.press:AddBeginDragFunc(function ()
		return
	end)
	slot0.press:AddDragFunc(function (slot0, slot1)
		slot2 = slot1.position

		if not slot0 then
			slot0 = slot2
		end

		if slot2.y - slot0.y > 100 then
			slot1:setMask(true)
			slot1:ringOn()
			slot1:enableRingDrag(false)
		end
	end)
	slot0.press:AddDragEndFunc(function (slot0, slot1)
		return
	end)
end

function slot0.RingFadeout(slot0, slot1)
	LeanTween.alphaCanvas(slot0.ringLightCG, 0.7, 0.5):setFrom(0)
	LeanTween.scale(slot0.ringLight, Vector3(8, 8, 8), 1)
	LeanTween.rotate(slot0.ringLight, 90, 3)
	LeanTween.delayedCall(3.5, System.Action(function ()
		if slot0 then
			slot0()
		end
	end))
	LeanTween.delayedCall(1.2, System.Action(function ()
		slot0:showbgAdd(false, 1.8)
	end))
	LeanTween.delayedCall(3.2, System.Action(function ()
		setActive(slot0.proposePanel, false)
		setActive:showbgAdd(true, 2)
	end))
end

function slot0.displayShipWord(slot0, slot1)
	slot3, slot4, slot5 = ShipWordHelper.GetWordAndCV(ShipGroup.getDefaultSkin(slot0.shipGroupID).id, slot1)
	slot6 = nil
	slot7 = ShipWordHelper.GetL2dCvCalibrate((not slot0.reviewSkinID or slot0.reviewSkinID) and (not slot0.proposeSkin or slot0.proposeSkin.id) and slot0.shipVO.skinId, slot1)

	slot0:showStoryUI(slot5)

	if slot4 then
		function slot8()
			if slot0._currentVoice then
				slot0._currentVoice:Stop(true)
			end

			slot0._currentVoice = playSoundEffect(playSoundEffect)
		end

		if slot0.l2dChar and slot7 and slot7 ~= 0 then
			slot0._delayVoiceTweenID = LeanTween.delayedCall(slot7, System.Action(function ()
				slot0()

				slot1._delayVoiceTweenID = nil
			end)).id
		else
			slot8()
		end
	end
end

function slot0.showStoryUI(slot0, slot1)
	function slot2()
		if ResourceMgr.Inst:AssetExist("live2d/" .. string.lower(slot0.paintingName)) then
			slot0:showLive2D("wedding")
		else
			slot0:showPainting(true, 2)
		end

		slot0 = ShipGroup.getDefaultShipNameByGroupID(slot0.shipGroupID)

		setText(slot0.targetNameTF:Find("Text"), slot0)
		setText(slot0.storyContent, "")

		slot0.storyCG.alpha = 0

		setActive(slot0.storyTF, true)

		slot0.initStory = false

		LeanTween.alphaCanvas(slot0.storyCG, 1, 1):setFrom(0):setDelay(1):setOnComplete(System.Action(function ()
			if findTF(slot0.targetActorTF, "fitter").childCount > 0 then
				Ship.SetExpression(findTF(slot0.targetActorTF, "fitter"):GetChild(0), slot0.paintingName, "propose")
			end

			setText(slot0.storyContent, )

			setText.onWords = true

			setText:TypeWriter()

			setText.TypeWriter.initStory = true

			setText.TypeWriter:setMask(false)

			if not setText.TypeWriter.setMask.weddingReview then
				slot0:showTip()
			end
		end))
	end

	if not slot0.storyTF then
		PoolMgr.GetInstance():GetUI("ProposeStoryUI", true, function (slot0)
			pg.UIMgr.GetInstance():LoadingOff()

			if slot0.exited then
				PoolMgr.GetInstance():ReturnUI(PoolMgr.GetInstance().ReturnUI, slot0)

				return
			end

			slot0.storyTF = tf(slot0)

			setParent(tf(slot0), slot0:findTF("contain"))

			slot0.storyCG = GetOrAddComponent(slot0.storyTF, typeof(CanvasGroup))
			slot0.storyContent = slot0:findTF("dialogue/main/content", slot0.storyTF)
			slot0.typeWriter = slot0.storyContent:GetComponent(typeof(Typewriter))
			slot0.targetNameTF = slot0:findTF("dialogue/main/name_left", slot0.storyTF)
			slot0._renamePanel = slot0:findTF("changeName_panel", slot0.storyTF)

			setActive(slot0._renamePanel, false)
			onButton(slot0, slot0.storyTF, function ()
				if slot0.inTypeWritter then
					slot0.typeWriter:setSpeed(slot0.typeWritterSpeedUp)

					return
				end

				if not slot0.initStory then
					return
				end

				LeanTween.alphaCanvas(slot0.storyCG, 0, 1):setFrom(1):setOnComplete(System.Action(function ()
					setActive(slot0.storyTF, false)
				end))

				if LeanTween.alphaCanvas(slot0.storyCG, 0, 1).setFrom(1).setOnComplete._currentVoice then
					slot0._currentVoice:Stop(true)
				end

				slot0._currentVoice = nil

				slot0:setMask(true)
				LeanTween.delayedCall(0.5, System.Action(function ()
					if slot0.weddingReview then
						slot0:close()
					else
						slot0:initChangeNamePanel()
						slot0.initChangeNamePanel:stampWindow()
					end
				end))
			end)
			onNextTick(function ()
				if slot0.exited then
					return
				end

				slot1()
			end)

			slot0.loadFinish = true
		end)

		return
	end

	slot2()
end

function slot0.TypeWriter(slot0)
	slot0.inTypeWritter = true
	slot0.typeWritterSpeedUp = 0.01

	slot0.typeWriter:setSpeed(0.1)
	slot0.typeWriter:Play()

	function slot0.typeWriter.endFunc()
		slot0.inTypeWritter = false
		slot0.typeWritterSpeedUp = nil
	end
end

function slot0.loadChar(slot0, slot1, slot2, slot3)
	slot1 = slot1 or slot0._paintingTF
	slot2 = slot2 or "wedding"

	function slot4()
		if not IsNil(IsNil) then
			slot1 = GetOrAddComponent(slot0, "PaintingScaler")
			slot1.FrameName = slot1
			slot1.Tween = 1

			setParent(slot2.actorPainting, findTF(findTF, "fitter"))
		end
	end

	if not slot0.actorPainting then
		if slot0.reviewSkinID then
			slot0.paintingName = pg.ship_skin_template[slot0.reviewSkinID].painting
		elseif slot0.proposeSkin then
			slot0.paintingName = slot0.proposeSkin.painting
		else
			slot0.paintingName = slot0.shipVO:getPainting()
		end

		if PathMgr.FileExists(PathMgr.getAssetBundle("painting/" .. slot0.paintingName .. "_n")) and PlayerPrefs.GetInt("paint_hide_other_obj_" .. slot5, 0) ~= 0 then
			slot5 = slot5 .. "_n"
		end

		PoolMgr.GetInstance():GetPainting(slot5, true, function (slot0)
			if not IsNil(findTF(slot0, "Touch")) then
				setActive(slot1, false)
			end

			if findTF(slot0, "hx") then
				setActive(slot2, HXSet.isHx())
			end

			slot0.actorPainting = slot0

			Ship.SetExpression(slot0.actorPainting, slot0.paintingName)
			slot1()

			if slot2 then
				slot2()
			end
		end)

		if ResourceMgr.Inst:AssetExist("live2d/" .. string.lower(slot0.paintingName)) then
			slot0:createLive2D(slot0.paintingName)
		end
	else
		slot4()
	end
end

function slot0.createLive2D(slot0, slot1)
	pg.Live2DMgr.GetInstance():GetLive2DModelAsync(slot1, function (slot0)
		if slot0.exited then
			Destroy(slot0)

			return
		end

		UIUtil.SetLayerRecursively(slot0, LayerMask.NameToLayer("UI"))
		slot0.transform.SetParent(slot2, slot0:findTF("live2d", slot0.targetActorTF), true)

		slot3 = nil
		slot2.localPosition = BuildVector3(pg.ship_skin_template[(not slot0.reviewSkinID or slot0.reviewSkinID) and (not slot0.proposeSkin or slot0.proposeSkin.id) and slot0.shipVO.skinId].live2d_offset) + Vector3(0, 0, 100)
		slot2.localScale = Vector3.Scale(Vector3(1, 1, 10), slot2.localScale)
		slot0.l2dChar = GetComponent(slot0, "Live2dChar")
		slot0.l2dChar.name = slot1

		function slot0.l2dChar.FinishAction(slot0)
			if slot0 ~= slot0 then
				slot1.l2dChar:SetAction(slot0)
			end
		end

		slot0.l2dChar:SetAction(pg.AssistantInfo.action2Id.idle)

		if CSharpVersion > 18 then
			slot7 = pg.ship_skin_template[slot3].lip_smoothing

			if pg.ship_skin_template[slot3].lip_sync_gain and slot6 ~= 0 then
				slot1:GetChild(0):GetComponent("CubismCriSrcMouthInput").Gain = slot6
			end

			if slot7 and slot7 ~= 0 then
				slot1:GetChild(0):GetComponent("CubismCriSrcMouthInput").Smoothing = slot7
			end
		end
	end)
end

function slot0.showTip(slot0)
	if not slot0.proposeSkin then
		return
	end

	slot2 = slot0:findTF("tip", slot0.storyTF)

	setText(slot3, i18n("achieve_propose_tip", slot1.name))
	setActive(slot2, true)
	LeanTween.alphaCanvas(slot4, 1, 0.01):setFrom(0)
	LeanTween.alphaCanvas(slot4, 0, 1.5):setFrom(1):setDelay(4)
end

function slot0.initChangeNamePanel(slot0)
	setText(slot0._renamePanel:Find("frame/border/title"), i18n("word_propose_changename_title", slot0.shipVO:getName()))
	setText(slot0._renamePanel:Find("frame/setting_ship_name/text"), i18n("word_propose_changename_tip1"))
	setText(slot0._renamePanel:Find("frame/text"), i18n("word_propose_changename_tip2"))

	slot0._renameConfirmBtn = slot0._renamePanel:Find("frame/queren")
	slot0._renameCancelBtn = slot0._renamePanel:Find("frame/cancel")
	slot0._renameToggle = findTF(slot0._renamePanel, "frame/setting_ship_name"):GetComponent(typeof(Toggle))
	slot0._renameRevert = slot0._renamePanel:Find("frame/revert_button")
	slot0._closeBtn = slot0._renamePanel:Find("frame/close_btn")

	onButton(slot0, slot0._renameConfirmBtn, function ()
		slot0 = getInputText(findTF(slot0._renamePanel, "frame/name_field"))

		pg.PushNotificationMgr.GetInstance():setSwitchShipName(slot0._renameToggle.isOn)
		slot0:emit(ProposeMediator.RENAME_SHIP, slot0.shipVO.id, slot0)
	end, SFX_CONFIRM)
	onButton(slot0, slot0._renameRevert, function ()
		setInputText(findTF((slot0.shipVO:isRemoulded() and HXSet.hxLan(pg.ship_skin_template[slot0.shipVO:getRemouldSkinId()].name)) or pg.ship_data_statistics[slot0.shipVO.configId].name._renamePanel, "frame/name_field"), (slot0.shipVO.isRemoulded() and HXSet.hxLan(pg.ship_skin_template[slot0.shipVO.getRemouldSkinId()].name)) or pg.ship_data_statistics[slot0.shipVO.configId].name)
	end, SFX_PANEL)
	onButton(slot0, slot0._renameCancelBtn, function ()
		slot0:close()
	end, SFX_CANCEL)
	onButton(slot0, slot0._closeBtn, function ()
		slot0:close()
	end, SFX_CANCEL)
end

function slot0.close(slot0)
	slot0:emit(slot0.ON_CLOSE)
end

function slot0.DisplayRenamePanel(slot0)
	setParent(slot0._renamePanel, slot0._tf)
	setActive(slot0._renamePanel, true)
	setInputText(findTF(slot0._renamePanel, "frame/name_field"), slot0.shipVO:getName())
end

return slot0
