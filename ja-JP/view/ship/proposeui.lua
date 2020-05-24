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
		-- Nothing
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
			uv0:emit(uv1.ON_CLOSE)
		end, SFX_CANCEL)
		slot0:setMask(true)
		slot0:showProposePanel()
		pg.UIMgr.GetInstance():BlurPanel(slot0._tf)
	else
		onButton(slot0, slot0:findTF("close0"), function ()
			if uv0.proposeEndFlag then
				uv0:DisplayRenamePanel()
			else
				uv0:emit(uv1.ON_CLOSE)
			end
		end, SFX_CANCEL)
		onButton(slot0, slot0:findTF("close_end"), function ()
			if uv0.proposeEndFlag then
				uv0:DisplayRenamePanel()
			else
				uv0:emit(uv1.ON_CLOSE)
			end
		end, SFX_CANCEL)

		slot1 = slot0.shipVO:getConfigTable().nationality
		slot0.bgName = Nation.Nation2BG(slot1)

		PoolMgr.GetInstance():GetUI("Propose" .. Nation.Nation2Side(slot1) .. "UI", true, function (slot0)
			pg.UIMgr.GetInstance():LoadingOff()

			if uv0.exited then
				PoolMgr.GetInstance():ReturnUI(uv1, slot0)

				return
			end

			uv0.window = tf(slot0)

			setParent(tf(slot0), uv0:findTF("window"))

			uv0.intimacyTF = uv0:findTF("intimacy/icon", uv0.window)
			uv0.intimacyValueTF = uv0:findTF("intimacy/value", uv0.window)
			uv0.button = uv0:findTF("button", uv0.window)
			uv0.intimacyDesc = uv0:findTF("desc", uv0.window)
			uv0.intimacydescTime = uv0:findTF("descPic/desc_time", uv0.window)
			uv0.intimacyDescPic = uv0:findTF("descPic", uv0.window)
			uv0.intimacyBuffDesc = uv0:findTF("desc_buff", uv0.window)
			uv0._paintingTF = uv0:findTF("paintMask/paint", uv0.window)
			uv0.intimacyAchieved = uv0:findTF("intimacy/achieved", uv0.window)
			uv0.intimacyNoAchieved = uv0:findTF("intimacy/no_achieved", uv0.window)
			uv0.ringAchieved = uv0:findTF("ringCount/achieved", uv0.window)
			uv0.ringNoAchieved = uv0:findTF("ringCount/no_achieved", uv0.window)
			uv0.ringValue = uv0:findTF("ringCount/value", uv0.window)
			uv0.nameTF = uv0:findTF("title1/Text", uv0.window)
			uv0.shipNameTF = uv0:findTF("title2/Text", uv0.window)
			uv0.campTF = uv0:findTF("Camp", uv0.window)
			uv0.doneTF = uv0:findTF("done", uv0.window)
			uv0.CampSprite = uv0:findTF("CampSprite", uv0.window)

			setActive(uv0.window, true)
			setText(uv0.nameTF, uv0.player.name)
			setText(uv0.shipNameTF, uv0.shipVO:getName())

			if uv0.CampSprite then
				if not getImageSprite(uv0:findTF(Nation.Nation2Print(uv2), uv0.CampSprite)) then
					warning("找不到印花, shipConfigId: " .. uv0.shipVO.configId)
					setActive(uv0.campTF, false)
				else
					setImageSprite(uv0.campTF, slot1, false)
					setActive(uv0.campTF, true)
				end
			end

			slot1, slot2, slot3 = uv0.shipVO:getIntimacyDetail()

			setImageSprite(uv0.intimacyTF, GetSpriteFromAtlas("energy", slot1), true)
			setActive(uv0.intimacyTF, true)
			setText(uv0.intimacyValueTF, i18n("propose_intimacy_tip", slot3))

			if slot3 >= 100 then
				setTextColor(uv0.intimacyValueTF, Color.white)
			else
				setTextColor(uv0.intimacyValueTF, Color.New(0.5843137254901961, 0.5215686274509804, 0.40784313725490196))
			end

			slot5 = not uv0.shipVO.propose and slot2 <= slot3

			setActive(uv0.button, not uv0.shipVO.propose)
			setActive(uv0.intimacyAchieved, uv0.shipVO.propose or slot3 >= 100)
			setActive(uv0.intimacyNoAchieved, slot3 < 100 and not uv0.shipVO.propose)

			slot6 = uv0.bagProxy:getItemCountById(ITEM_ID_FOR_PROPOSE)

			setActive(uv0.ringAchieved, uv0.shipVO.propose or slot6 > 0)
			setActive(uv0.ringNoAchieved, slot6 <= 0 and not uv0.shipVO.propose)

			if uv0.shipVO.propose or slot6 > 0 then
				setTextColor(uv0.ringValue, Color.white)
			else
				setTextColor(uv0.ringValue, Color.New(0.5843137254901961, 0.5215686274509804, 0.40784313725490196))
			end

			setActive(uv0.doneTF, uv0.shipVO.propose)

			uv0.button:GetComponent(typeof(Button)).interactable = slot5
			slot7, slot8 = uv0.shipVO:getInitmacyInfo()

			if uv0.shipVO.propose then
				if uv0.intimacyDescPic then
					setActive(uv0.intimacyDescPic, true)
					setActive(uv0.intimacyDesc, false)
					setText(uv0.intimacydescTime, pg.TimeMgr.GetInstance():STimeDescS(uv0.shipVO.proposeTime, "%B.%d,    %y"))
				elseif uv0.intimacyDesc then
					setActive(uv0.intimacyDesc, true)

					if not IsNil(GetComponent(uv0.intimacyDesc, "VerticalText")) then
						slot9.enabled = true

						setText(uv0.intimacyDesc, i18n("intimacy_desc_propose_vertical", pg.TimeMgr.GetInstance():ChieseDescTime(uv0.shipVO.proposeTime, true)))
					else
						setText(uv0.intimacyDesc, i18n("intimacy_desc_propose", pg.TimeMgr.GetInstance():STimeDescS(uv0.shipVO.proposeTime, "%Y年%m月%d日", true)))
					end
				end
			else
				if uv1 == "ProposeJpUI" and not IsNil(GetComponent(uv0.intimacyDesc, "VerticalText")) then
					slot9.enabled = false
				end

				if uv0.intimacyDescPic then
					setActive(uv0.intimacyDescPic, false)
				end

				if uv0.intimacyDesc then
					setActive(uv0.intimacyDesc, true)
					setText(uv0.intimacyDesc, i18n(slot8, uv0.shipVO.name))
				end
			end

			setText(uv0.intimacyBuffDesc, "*" .. i18n(slot8 .. "_buff"))
			uv0:loadChar()
			pg.UIMgr.GetInstance():BlurPanel(uv0._tf)
			onButton(uv0, uv0.button, function ()
				if uv0 then
					if uv1 < 1 then
						ItemTipPanel.ShowRingBuyTip()

						return
					end

					slot0, slot1 = Ship.canProposeShip(uv2.shipVO)

					if not slot0 then
						pg.TipsMgr.GetInstance():ShowTips(slot1)

						return
					end

					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = i18n("word_propose_cost_tip", uv1),
						onYes = function ()
							if uv0.intimacydescTime then
								setText(uv0.intimacydescTime, pg.TimeMgr.GetInstance():STimeDescS(pg.TimeMgr.GetInstance():GetServerTime(), "%B.%d,    %y"))
							end

							uv0:setMask(true)
							uv0:hideWindow()
							uv0:showProposePanel()
							setActive(uv0.window, false)
						end
					})
				else
					uv2:emit(uv3.ON_CLOSE)
				end
			end, SFX_PANEL)
		end)
	end
end

function slot0.onBackPressed(slot0)
	if isActive(slot0.window) then
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)
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
		setActive(uv0.churchLight, false)
	end))
end

function slot0.showbgAdd(slot0, slot1, slot2)
	LeanTween.alphaCanvas(GetOrAddComponent(slot0.bgAdd, typeof(CanvasGroup)), slot1 and 0 or 1, slot2):setFrom(slot1 and 1 or 0)
	setActive(slot0.bgAdd, true)
end

function slot0.showBlackBG(slot0, slot1, slot2)
	LeanTween.alphaCanvas(GetOrAddComponent(slot0.blackBG, typeof(CanvasGroup)), slot1 and 0 or 1, slot2):setFrom(slot1 and 1 or 0):setOnComplete(System.Action(function ()
		if uv0 then
			setActive(uv1.blackBG, false)
		end
	end))
	setActive(slot0.blackBG, true)
end

function slot0.showPainting(slot0, slot1, slot2)
	slot3 = false

	function slot4()
		if uv0 then
			return
		end

		uv0 = true

		LeanTween.alphaCanvas(GetOrAddComponent(uv2.targetActorTF, typeof(CanvasGroup)), uv1 and 1 or 0, uv3):setFrom(uv1 and 0 or 1)
	end

	if slot1 then
		slot0:loadChar(slot0.targetActorTF, "duihua", function ()
			uv0()
		end)
	end

	slot4()
end

slot0.Live2DProposeDelayTime = 2

function slot0.showLive2D(slot0, slot1)
	setActive(slot0:findTF("fitter", slot0.targetActorTF), false)
	setActive(slot0:findTF("live2d", slot0.targetActorTF), true)
	LeanTween.alphaCanvas(GetOrAddComponent(slot0.targetActorTF, typeof(CanvasGroup)), 1, uv0.Live2DProposeDelayTime):setFrom(0):setOnComplete(System.Action(function ()
		uv0.l2dChar:SetAction(pg.AssistantInfo.action2Id[uv1])
	end))
end

function slot0.hideWindow(slot0)
	slot1 = GetOrAddComponent(slot0.window, typeof(CanvasGroup))
	slot1.interactable = false

	LeanTween.alphaCanvas(slot1, 0, 0.2):setFrom(1):setOnComplete(System.Action(function ()
		uv0.interactable = true
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
	slot2 = GetOrAddComponent(slot0.window, typeof(CanvasGroup))
	slot2.interactable = false

	LeanTween.alphaCanvas(slot2, 1, 0.8):setFrom(0)
	LeanTween.delayedCall(1.5, System.Action(function ()
		LeanTween.alphaCanvas(uv0, 1, 2):setFrom(0)
	end))

	slot0.delayTId = LeanTween.delayedCall(5, System.Action(function ()
		if not uv0 then
			return
		end

		uv0.interactable = true

		setActive(uv1.doneTF, true)
		uv1:setMask(false)
		setActive(uv1:findTF("close_end"), true)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_SEAL)
	end)).id
end

function slot0.showProposePanel(slot0)
	slot0.proposeSkin = ShipGroup.getProposeSkin(slot0.shipGroupID)

	if slot0.proposeSkin and slot0.actorPainting then
		PoolMgr.GetInstance():ReturnPainting(slot0.paintingName, slot0.actorPainting)

		slot0.actorPainting = nil
	end

	function slot1()
		function slot0()
			uv0.handTF:GetComponent(typeof(Image)).color = Color.New(1, 1, 1, 0)

			uv0:bgAddAnimation(2)
			LeanTween.delayedCall(2, System.Action(function ()
				uv0:showPainting(true, 1.5)
			end))
			LeanTween.delayedCall(5, System.Action(function ()
				uv0:showPainting(false, 1)
			end))
			LeanTween.delayedCall(6, System.Action(function ()
				setAnchoredPosition(uv0.handTF, {
					y = uv0.handTF.rect.height
				})
				setAnchoredPosition(uv0.ringTF, {
					x = -195,
					y = 0
				})
				setActive(uv0.proposePanel, true)
				setActive(uv0.transHand, true)

				uv0.ringBoxCG.alpha = 0

				LeanTween.alpha(rtf(uv0.handTF), 1, 1.2)
				LeanTween.moveY(rtf(uv0.handTF), 0, 2):setOnComplete(System.Action(function ()
					LeanTween.alphaCanvas(uv0.ringBoxCG, 1, 1.5):setFrom(0):setOnComplete(System.Action(function ()
						uv0:setMask(false)
						triggerButton(uv0.ringBoxTF)
					end))
				end))
			end))
			LeanTween.delayedCall(5, System.Action(function ()
				uv0:showBlackBG(false, 1.2)
			end))
			LeanTween.delayedCall(6.2, System.Action(function ()
				uv0:showBlackBG(true, 1.2)
			end))
		end

		LeanTween.scale(uv0.door, Vector3(2.1, 2.1, 2.1), 4)
		uv0.doorAni:SetActionCallBack(function (slot0)
			if slot0 == "FINISH" then
				uv0.doorAni:SetActionCallBack(nil)
				setActive(uv0.door, false)
				uv0:showBlackBG(true, 0.1)
				setActive(uv0.doorLightBG, false)
				uv1()
			end
		end)
		LeanTween.delayedCall(2, System.Action(function ()
			uv0:showbgAdd(false, 2)
		end))
		LeanTween.alpha(rtf(uv0.doorLightBG), 1, 2):setFrom(0)
		uv0:showBlackBG(false, 0.1)
		uv0.doorAni:SetAction("OPEN", 0)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_DOOR)
	end

	pg.CriMgr.GetInstance():PlayBGM("wedding", true)

	if not slot0.proposePanel then
		PoolMgr.GetInstance():GetUI("ProposeRingUI", true, function (slot0)
			pg.UIMgr.GetInstance():LoadingOff()

			if uv0.exited then
				PoolMgr.GetInstance():ReturnUI(uv1, slot0)

				return
			end

			uv0.proposePanel = tf(slot0)
			uv0.handId = pg.ship_skin_template[uv0.weddingReview and uv0.reviewSkinID or uv0.shipVO.skinId].hand_id

			if SPECIAL_PROPOSE and SPECIAL_PROPOSE[1] == pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y%m%d", true) then
				for slot6, slot7 in ipairs(SPECIAL_PROPOSE[2]) do
					if slot7[1] == slot1 then
						uv0.handId = slot7[2]
					end
				end
			end

			uv0.handName = "ProposeHand_" .. uv0.handId

			PoolMgr.GetInstance():GetUI(uv0.handName, true, function (slot0)
				uv0.transHand = tf(slot0)

				setParent(uv0.transHand, uv0.proposePanel)
				uv0.transHand:SetAsFirstSibling()

				uv0.handTF = uv0:findTF("hand", uv0.transHand)
				uv0.ringTF = uv0:findTF("ring", uv0.transHand)
				uv0.ringAnim = uv0.ringTF:GetComponent(typeof(Animator))
				uv0.ringAnim.enabled = false
				uv0.ringLight = uv0:findTF("ring_light", uv0.ringTF)
				uv0.ringLightCG = GetOrAddComponent(uv0.ringLight, typeof(CanvasGroup))
				uv0.ringCG = GetOrAddComponent(uv0.ringTF, typeof(CanvasGroup))
			end)
			setParent(tf(slot0), uv0:findTF("contain"))

			uv0.ringBoxTF = uv0:findTF("ringBox", uv0.proposePanel)
			uv0.ringBoxFull = uv0:findTF("full", uv0.ringBoxTF)
			uv0.ringBoxCG = GetOrAddComponent(uv0.ringBoxTF, typeof(CanvasGroup))
			uv0.churchBefore = uv0:findTF("before", uv0.proposePanel)
			uv0.churchLight = uv0:findTF("light", uv0.churchBefore)

			setParent(uv0.churchLight, uv0._tf)
			uv0.churchLight:SetSiblingIndex(2)

			uv0.blackBG = uv0:findTF("blackbg", uv0.churchBefore)
			uv0.doorLightBG = uv0:findTF("door_light", uv0.churchBefore)
			uv0.door = uv0:findTF("door", uv0.churchBefore)
			uv0.doorAni = GetOrAddComponent(uv0.door, "SpineAnimUI")

			setParent(uv0.churchBefore, uv0:findTF("contain"))

			uv0.ringTipTF = uv0:findTF("tip", uv0.proposePanel)
			uv0.ringTipCG = GetOrAddComponent(uv0.ringTipTF, typeof(CanvasGroup))

			setText(uv0:findTF("Text", uv0.ringTipTF), i18n("word_propose_ring_tip"))
			setActive(uv0:findTF("finger", uv0.ringTipTF), false)
			onButton(uv0, uv0.ringBoxTF, function ()
				if uv0.ringBoxClicked then
					return
				end

				uv0.ringBoxClicked = true

				LeanTween.alpha(rtf(uv0.ringBoxFull), 0, 0.6):setOnComplete(System.Action(function ()
					LeanTween.delayedCall(0.1, System.Action(function ()
						uv0.ringAnim.enabled = true

						uv0.ringAnim:Play("movein")
						LeanTween.delayedCall(0.5, System.Action(function ()
							uv0.ringAnim:Play("blink")
							LeanTween.alphaCanvas(uv0.ringTipCG, 1, 1.5):setFrom(0):setOnComplete(System.Action(function ()
								setActive(uv0:findTF("finger", uv0.ringTipTF), true)
								uv0:enableRingDrag(true)
							end))
						end))
					end))
				end))
			end)
			LoadImageSpriteAsync(uv0.bgName, uv0.storybg)

			uv0.storybg.localScale = Vector3(1.2, 1.2, 1.2)

			onNextTick(function ()
				if uv0.exited then
					return
				end

				uv1()
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

	slot0.ringTF:GetComponent("DftAniEvent"):SetEndEvent(function (slot0)
		uv0.ringAnim.enabled = false
		uv0.isRingOn = false

		if not uv0.weddingReview then
			uv0:emit(ProposeMediator.ON_PROPOSE, uv0.shipVO.id)
		else
			uv0:RingFadeout(function ()
				uv0:displayShipWord("propose")
			end)
		end
	end)

	slot0.ringAnim.enabled = true

	slot0.ringAnim:Play("wear")

	if slot0.handId == "101" then
		LeanTween.alphaCanvas(GetOrAddComponent(slot0.handTF, typeof(CanvasGroup)), 0, 2)
	end
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
	end)
	slot0.press:AddDragFunc(function (slot0, slot1)
		slot2 = slot1.position

		if not uv0 then
			uv0 = slot2
		end

		if slot2.y - uv0.y > 100 then
			uv1:setMask(true)
			uv1:ringOn()
			uv1:enableRingDrag(false)
		end
	end)
	slot0.press:AddDragEndFunc(function (slot0, slot1)
	end)
end

function slot0.RingFadeout(slot0, slot1)
	LeanTween.alphaCanvas(slot0.ringLightCG, 0.7, 0.5):setFrom(0)
	LeanTween.scale(slot0.ringLight, Vector3(8, 8, 8), 1)
	LeanTween.rotate(slot0.ringLight, 90, 3)
	LeanTween.delayedCall(3.5, System.Action(function ()
		if uv0 then
			uv0()
		end
	end))
	LeanTween.delayedCall(1.2, System.Action(function ()
		uv0:showbgAdd(false, 1.8)
	end))
	LeanTween.delayedCall(3.2, System.Action(function ()
		setActive(uv0.proposePanel, false)
		uv0:showbgAdd(true, 2)
	end))
end

function slot0.displayShipWord(slot0, slot1)
	slot3, slot4, slot5 = ShipWordHelper.GetWordAndCV(ShipGroup.getDefaultSkin(slot0.shipGroupID).id, slot1)
	slot6 = nil
	slot7 = ShipWordHelper.GetL2dCvCalibrate((not slot0.reviewSkinID or slot0.reviewSkinID) and (not slot0.proposeSkin or slot0.proposeSkin.id) and slot0.shipVO.skinId, slot1)

	slot0:showStoryUI(slot5)

	if slot4 then
		function slot8()
			if uv0._currentVoice then
				uv0._currentVoice:PlaybackStop()
			end

			pg.CriMgr.GetInstance():PlaySoundEffect_V3(uv1, function (slot0)
				uv0._currentVoice = slot0
			end)
		end

		if slot0.l2dChar and slot7 and slot7 ~= 0 then
			slot0._delayVoiceTweenID = LeanTween.delayedCall(slot7, System.Action(function ()
				uv0()

				uv1._delayVoiceTweenID = nil
			end)).id
		else
			slot8()
		end
	end
end

function slot0.showStoryUI(slot0, slot1)
	function slot2()
		if PathMgr.FileExists(PathMgr.getAssetBundle("live2d/" .. string.lower(uv0.paintingName))) then
			uv0:showLive2D("wedding")
		else
			uv0:showPainting(true, 2)
		end

		setText(uv0.targetNameTF:Find("Text"), ShipGroup.getDefaultShipNameByGroupID(uv0.shipGroupID))
		setText(uv0.storyContent, "")

		uv0.storyCG.alpha = 0

		setActive(uv0.storyTF, true)

		uv0.initStory = false

		LeanTween.alphaCanvas(uv0.storyCG, 1, 1):setFrom(0):setDelay(1):setOnComplete(System.Action(function ()
			if findTF(uv0.targetActorTF, "fitter").childCount > 0 then
				Ship.SetExpression(findTF(uv0.targetActorTF, "fitter"):GetChild(0), uv0.paintingName, "propose")
			end

			setText(uv0.storyContent, uv1)

			uv0.onWords = true

			uv0:TypeWriter()

			uv0.initStory = true

			uv0:setMask(false)

			if not uv0.weddingReview then
				uv0:showTip()
			end
		end))
	end

	if not slot0.storyTF then
		PoolMgr.GetInstance():GetUI("ProposeStoryUI", true, function (slot0)
			pg.UIMgr.GetInstance():LoadingOff()

			if uv0.exited then
				PoolMgr.GetInstance():ReturnUI(uv1, slot0)

				return
			end

			uv0.storyTF = tf(slot0)

			setParent(tf(slot0), uv0:findTF("contain"))

			uv0.storyCG = GetOrAddComponent(uv0.storyTF, typeof(CanvasGroup))
			uv0.storyContent = uv0:findTF("dialogue/main/content", uv0.storyTF)
			uv0.typeWriter = uv0.storyContent:GetComponent(typeof(Typewriter))
			uv0.targetNameTF = uv0:findTF("dialogue/main/name_left", uv0.storyTF)
			uv0._renamePanel = uv0:findTF("changeName_panel", uv0.storyTF)

			setActive(uv0._renamePanel, false)
			onButton(uv0, uv0.storyTF, function ()
				if uv0.inTypeWritter then
					uv0.typeWriter:setSpeed(uv0.typeWritterSpeedUp)

					return
				end

				if not uv0.initStory then
					return
				end

				LeanTween.alphaCanvas(uv0.storyCG, 0, 1):setFrom(1):setOnComplete(System.Action(function ()
					setActive(uv0.storyTF, false)
				end))

				if uv0._currentVoice then
					uv0._currentVoice:PlaybackStop()
				end

				uv0._currentVoice = nil

				uv0:setMask(true)
				LeanTween.delayedCall(0.5, System.Action(function ()
					if uv0.weddingReview then
						uv0:close()
					else
						uv0:initChangeNamePanel()
						uv0:stampWindow()
					end
				end))
			end)
			onNextTick(function ()
				if uv0.exited then
					return
				end

				uv1()
			end)

			uv0.loadFinish = true
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
		uv0.inTypeWritter = false
		uv0.typeWritterSpeedUp = nil
	end
end

function slot0.loadChar(slot0, slot1, slot2, slot3)
	slot1 = slot1 or slot0._paintingTF
	slot2 = slot2 or "wedding"

	function slot4()
		if not IsNil(uv0) then
			slot0 = findTF(uv0, "fitter")
			slot1 = GetOrAddComponent(slot0, "PaintingScaler")
			slot1.FrameName = uv1
			slot1.Tween = 1

			setParent(uv2.actorPainting, slot0)
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

			uv0.actorPainting = slot0

			Ship.SetExpression(uv0.actorPainting, uv0.paintingName)
			uv1()

			if uv2 then
				uv2()
			end
		end)

		if PathMgr.FileExists(PathMgr.getAssetBundle("live2d/" .. string.lower(slot0.paintingName))) then
			slot0:createLive2D(slot0.paintingName)
		end
	else
		slot4()
	end
end

function slot0.createLive2D(slot0, slot1)
	pg.Live2DMgr.GetInstance():GetLive2DModelAsync(slot1, function (slot0)
		if uv0.exited then
			Destroy(slot0)

			return
		end

		UIUtil.SetLayerRecursively(slot0, LayerMask.NameToLayer("UI"))
		slot0.transform:SetParent(uv0:findTF("live2d", uv0.targetActorTF), true)

		slot3 = nil
		slot2.localPosition = BuildVector3(pg.ship_skin_template[(not uv0.reviewSkinID or uv0.reviewSkinID) and (not uv0.proposeSkin or uv0.proposeSkin.id) and uv0.shipVO.skinId].live2d_offset) + Vector3(0, 0, 100)
		slot2.localScale = Vector3.Scale(Vector3(1, 1, 10), slot2.localScale)
		uv0.l2dChar = GetComponent(slot0, "Live2dChar")
		uv0.l2dChar.name = uv1

		function uv0.l2dChar.FinishAction(slot0)
			if uv0 ~= slot0 then
				uv1.l2dChar:SetAction(uv0)
			end
		end

		uv0.l2dChar:SetAction(pg.AssistantInfo.action2Id.idle)

		if CSharpVersion > 18 then
			slot5 = pg.ship_skin_template[slot3]
			slot7 = slot5.lip_smoothing

			if slot5.lip_sync_gain and slot6 ~= 0 then
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

	setText(slot0:findTF("Image_bg/Text", slot2), i18n("achieve_propose_tip", slot1.name))

	slot4 = GetOrAddComponent(slot2, typeof(CanvasGroup))

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
		pg.PushNotificationMgr.GetInstance():setSwitchShipName(uv0._renameToggle.isOn)
		uv0:emit(ProposeMediator.RENAME_SHIP, uv0.shipVO.id, getInputText(findTF(uv0._renamePanel, "frame/name_field")))
	end, SFX_CONFIRM)
	onButton(slot0, slot0._renameRevert, function ()
		setInputText(findTF(uv0._renamePanel, "frame/name_field"), uv0.shipVO:isRemoulded() and HXSet.hxLan(pg.ship_skin_template[uv0.shipVO:getRemouldSkinId()].name) or pg.ship_data_statistics[uv0.shipVO.configId].name)
	end, SFX_PANEL)
	onButton(slot0, slot0._renameCancelBtn, function ()
		uv0:close()
	end, SFX_CANCEL)
	onButton(slot0, slot0._closeBtn, function ()
		uv0:close()
	end, SFX_CANCEL)
end

function slot0.close(slot0)
	slot0:emit(uv0.ON_CLOSE)
end

function slot0.DisplayRenamePanel(slot0)
	setParent(slot0._renamePanel, slot0._tf)
	setActive(slot0._renamePanel, true)
	setInputText(findTF(slot0._renamePanel, "frame/name_field"), slot0.shipVO:getName())
end

return slot0
