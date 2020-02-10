slot0 = class("SnapshotScene", import("..base.BaseUI"))
slot0.SELECT_CHAR_PANEL = "SnapshotScene.SELECT_CHAR_PANEL"
slot0.SHARE_PANEL = "SnapshotScene.SHARE_PANEL"
slot0.SHOW_PAINT = 0
slot0.SHOW_LIVE2D = 1
slot0.SHOW_SPINE = 2
slot0.STATE_TAKE_PHOTO = 0
slot0.STATE_TAKE_VIDEO = 1

function slot0.getUIName(slot0)
	return "snapshot"
end

function slot0.init(slot0)
	setActive(pg.UIMgr.GetInstance().OverlayEffect, false)

	slot0.dummy = slot0:findTF("SnapshotInvisible")

	slot0:SetDummyForIOS(true)

	slot0.ui = slot0:findTF("ui")
	slot0.backBtn = slot0:findTF("ui/back")
	slot0.switchDirBtn = slot0:findTF("ui/switchDir")
	slot0.takeBtn = slot0:findTF("ui/bg/take")
	slot0.videoTakeImg = slot0:findTF("ui/bg/take/videoTakeImg")

	SetActive(slot0.videoTakeImg, false)

	slot0.switchCamBtn = slot0:findTF("ui/bg/switchCam")
	slot0.selectCharBtn = slot0:findTF("ui/bg/selectChar")
	slot0.l2dCtrlPanl = slot0:findTF("ui/bg/l2dBgImg")
	slot0.l2dStopBtnGo = slot0:findTF("ui/bg/l2dBgImg/stopBtn")
	slot0.l2dPlayBtnGo = slot0:findTF("ui/bg/l2dBgImg/playBtn")

	SetActive(slot0.l2dPlayBtnGo, false)

	slot0.l2dAnimationBtnGo = slot0:findTF("ui/bg/l2dBgImg/animationsBtn").gameObject
	slot0.l2dAnimations = slot0:findTF("ui/bg/animationsBg")
	slot0.l2dAnimationBackBtnTrans = slot0:findTF("animationsBackBtn", slot0.l2dAnimations)

	SetActive(slot0.l2dAnimations, false)

	slot0.selectedID = 1
	slot0.scrollItems = {}
	slot0.isPause = false
	slot0.animTpl = slot0:findTF("animation_tpl", slot0.l2dAnimations)

	SetActive(slot0.animTpl, false)

	slot0.animLayout = slot0:findTF("animation_container/animations", slot0.l2dAnimations)
	slot1 = slot0:findTF("animation_container", slot0.l2dAnimations)
	slot0.animContainer = slot1:GetComponent("LScrollRect")
	slot0.animContainer.decelerationRate = 0.1

	function slot0.animContainer.onInitItem(slot0)
		slot1 = uv0

		slot1:onInitItem(slot0)
	end

	function slot0.animContainer.onUpdateItem(slot0, slot1)
		slot2 = uv0

		slot2:onUpdateItem(slot0, slot1)
	end

	function slot0.animContainer.onReturnItem(slot0, slot1)
		slot2 = uv0

		slot2:onReturnItem(slot0, slot1)
	end

	function slot0.animContainer.onStart()
		slot0 = uv0

		slot0:updateSelectedItem()
	end

	slot0.paintBtn = slot0:findTF("ui/bg/paintBtn")
	slot0.live2dBtn = slot0:findTF("ui/bg/l2dBgImg/live2dBtn")
	slot0.spineBtn = slot0:findTF("ui/bg/spineBtn")
	slot0.modePnlTF = slot0:findTF("ui/bg/modePnl")
	slot0.takePhotoBtn = slot0:findTF("ui/bg/modePnl/takePhotoBtn")
	slot0.takeVideoBtn = slot0:findTF("ui/bg/modePnl/takeVideoBtn")
	slot0.stopRecBtn = slot0:findTF("stopRec")
	slot0.snapshot = slot0:findTF("snapshot")
	slot1 = slot0.snapshot
	slot0.webcam = slot1:GetComponent(typeof(WebCam))
	slot0.paint = slot0:findTF("container/paint")
	slot0.live2d = slot0:findTF("live2d", slot0.paint)
	slot0.spine = slot0:findTF("spine", slot0.paint)
	slot0.paintSkin = nil
	slot0.showLive2d = false
	slot0.showType = uv0.SHOW_PAINT
	slot0.state = uv0.STATE_TAKE_PHOTO

	slot0:setSkinAndLive2d(slot0.contextData.skinId, slot0.contextData.live2d)

	slot0.verticalEulerAngle = 90
	slot0.horizontalEulerAngle = 0
	slot0.rotateUseTime = 0.2
	slot0.isVertical = false
	slot0.backBtnImg = slot0:findTF("ui/back/Image")
	slot0.selectCharBtnImg = slot0:findTF("ui/bg/selectChar/Image")
	slot0.switchCamBtnImg = slot0:findTF("ui/bg/switchCam/Image")
	slot0.l2dBtnImg = slot0:findTF("ui/bg/paintBtn/Image")
	slot0.l2dStopBtnImg = slot0:findTF("ui/bg/l2dBgImg/stopBtn/Image")
	slot0.l2dPlayBtnImg = slot0:findTF("ui/bg/l2dBgImg/playBtn/Image")
	slot0.l2d2PaintBtnImg = slot0:findTF("ui/bg/l2dBgImg/live2dBtn/Image")
	slot0.takePhotoVerticalText = slot0:findTF("ui/bg/modePnl/takePhotoBtn/verticalText")
	slot0.takePhotoHorizontalText = slot0:findTF("ui/bg/modePnl/takePhotoBtn/horizontalText")
	slot1 = slot0.takePhotoVerticalText
	slot1:GetComponent("Text").text = i18n("word_photo_mode")
	slot1 = slot0.takePhotoHorizontalText
	slot1:GetComponent("Text").text = i18n("word_photo_mode")

	SetActive(slot0.takePhotoHorizontalText, false)

	slot0.takeVideoVerticalText = slot0:findTF("ui/bg/modePnl/takeVideoBtn/verticalText")
	slot0.takeVideoHorizontalText = slot0:findTF("ui/bg/modePnl/takeVideoBtn/horizontalText")
	slot1 = slot0.takeVideoVerticalText
	slot1:GetComponent("Text").text = i18n("word_video_mode")
	slot1 = slot0.takeVideoHorizontalText
	slot1:GetComponent("Text").text = i18n("word_video_mode")

	SetActive(slot0.takeVideoHorizontalText, false)

	slot0.isFlipping = false
	slot0.videoTipPanel = slot0:findTF("videoTipPanel")

	setActive(slot0.videoTipPanel, false)
end

function slot0.back(slot0)
	if slot0.exited then
		return
	end

	slot0:emit(uv0.ON_BACK)
end

function slot0.saveVideo(slot0)
	slot1 = pg.MsgboxMgr.GetInstance()
	slot3.content = i18n("word_save_video")

	function slot3.onYes()
		slot0 = YARecorder.Inst

		slot0:DiscardVideo()
	end

	slot1:ShowMsgBox({})
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.backBtn, function ()
		slot0 = uv0

		slot0:back()
	end)
	onButton(slot0, slot0.switchDirBtn, function ()
		uv0.isVertical = not uv0.isVertical
		slot0 = uv0

		slot0:updateUIDirection()

		slot0 = uv0

		slot0:updateCameraCanvas()
	end)
	onButton(slot0, slot0.takeBtn, function ()
		if uv0.state == uv1.STATE_TAKE_PHOTO then
			setActive(uv0.ui, false)

			slot0 = uv0.webcam

			slot0:Take(function (slot0)
				slot1 = UnityEngine.Texture2D.New(Screen.width, Screen.height)

				Tex2DExtension.LoadImage(slot1, slot0)

				slot2 = uv0

				slot2:emit(uv1.SHARE_PANEL, slot1, slot0)

				if PLATFORM_CODE == PLATFORM_JP then
					slot2 = pg.SdkMgr.GetInstance()

					if slot2:GetChannelUID() == "2" then
						print("start photo : play sound")

						slot2 = NotificationMgr.Inst

						slot2:PlayShutterSound()
					end
				end
			end)
		elseif uv0.state == uv1.STATE_TAKE_VIDEO then
			slot0 = pg.TimeMgr.GetInstance()
			slot2 = pg.TimeMgr.GetInstance()
			slot0 = slot0:STimeDescS(slot2:GetServerTime(), "*t")
			slot1 = "azur" .. slot0.year .. slot0.month .. slot0.day .. slot0.hour .. slot0.min .. slot0.sec

			setActive(uv0.ui, false)

			if not PlayerPrefs.GetInt("hadShowForVideoTip") or slot2 <= 0 then
				PlayerPrefs.SetInt("hadShowForVideoTip", 1)

				slot3 = uv0
				slot3 = slot3:findTF("Text", uv0.videoTipPanel)
				slot3:GetComponent("Text").text = i18n("word_take_video_tip")

				onButton(uv0, uv0.videoTipPanel, function ()
					setActive(uv0.videoTipPanel, false)
					setActive(uv0.stopRecBtn, true)

					slot0 = LeanTween.moveX(uv0.stopRecBtn, 0, 0.15)

					slot0:setOnComplete(System.Action(function ()
						slot0 = uv0

						slot0:SetMute(true)

						slot0 = YARecorder.Inst

						slot0:SetVideoFilename(uv1)

						slot0 = YARecorder.Inst

						slot0:StartRecording()
					end))

					if PLATFORM_CODE == PLATFORM_JP then
						slot0 = pg.SdkMgr.GetInstance()

						if slot0:GetChannelUID() == "2" then
							print("start recording : play sound")

							slot0 = NotificationMgr.Inst

							slot0:PlayStartRecordSound()
						end
					end
				end)
				setActive(uv0.videoTipPanel, true)
			else
				setActive(uv0.stopRecBtn, true)

				slot3 = LeanTween.moveX(uv0.stopRecBtn, 0, 0.15)

				slot3:setOnComplete(System.Action(function ()
					slot0 = uv0

					slot0:SetMute(true)

					slot0 = YARecorder.Inst

					slot0:SetVideoFilename(uv1)

					slot0 = YARecorder.Inst

					slot0:StartRecording()
				end))
			end
		end
	end)
	onButton(slot0, slot0.paintBtn, function ()
		if uv0.showType == uv1.SHOW_PAINT then
			slot0 = uv0

			slot0:clearSkin()

			uv0.showType = uv1.SHOW_LIVE2D
			slot0 = uv0

			slot0:updateShowType()

			slot0 = uv0

			slot0:updateSkin()

			slot0 = uv0

			slot0:ResetL2dPanel()
		end
	end)
	onButton(slot0, slot0.live2dBtn, function ()
		if uv0.showType == uv1.SHOW_LIVE2D then
			slot0 = uv0

			slot0:clearSkin()

			uv0.showType = uv1.SHOW_PAINT
			slot0 = uv0

			slot0:updateShowType()

			slot0 = uv0

			slot0:updateSkin()
		end
	end)
	onButton(slot0, slot0.spineBtn, function ()
		if uv0.showType == uv1.SHOW_SPINE then
			slot0 = uv0

			slot0:clearSkin()

			uv0.showType = uv1.SHOW_PAINT
			slot0 = uv0

			slot0:updateShowType()

			slot0 = uv0

			slot0:updateSkin()
		end
	end)

	function slot1()
		if uv0.state == uv1.STATE_TAKE_PHOTO then
			return
		end

		uv0.state = uv1.STATE_TAKE_PHOTO

		LeanTween.moveY(rtf(uv0.modePnlTF), 56, 0.1)
		SetActive(uv0.videoTakeImg, false)
	end

	onButton(slot0, slot0.takePhotoBtn, slot1)
	onButton(slot0, slot0.takeVideoBtn, function ()
		if CheckPermissionGranted(ANDROID_RECORD_AUDIO_PERMISSION) and CheckPermissionGranted(ANDROID_WRITE_EXTERNAL_PERMISSION) then
			slot0 = uv0

			slot0:changeToTakeVideo()
		else
			slot0 = pg.MsgboxMgr.GetInstance()
			slot2.content = i18n("apply_permission_record_audio_tip1")

			function slot2.onYes()
				slot1[1] = ANDROID_RECORD_AUDIO_PERMISSION
				slot1[2] = ANDROID_WRITE_EXTERNAL_PERMISSION

				ApplyPermission({})
			end

			slot0:ShowMsgBox({})
		end
	end)
	slot1()
	onButton(slot0, slot0.stopRecBtn, function ()
		if not LeanTween.isTweening(go(uv0.stopRecBtn)) then
			slot0 = LeanTween.moveX(uv0.stopRecBtn, uv0.stopRecBtn.rect.width, 0.15)

			slot0:setOnComplete(System.Action(function ()
				setActive(uv0.ui, true)
				setActive(uv0.stopRecBtn, false)

				slot0 = YARecorder.Inst

				slot0:StopRecording()

				if PLATFORM == PLATFORM_ANDROID then
					slot0 = pg.MsgboxMgr.GetInstance()
					slot2.content = i18n("word_save_video")

					function slot2.onNo()
						slot0 = YARecorder.Inst

						slot0:DiscardVideo()
					end

					slot0:ShowMsgBox({})
				end

				slot0 = uv0

				slot0:SetMute(false)
			end))
		end
	end)
	setActive(slot0.stopRecBtn, false)
	onButton(slot0, slot0.switchCamBtn, function ()
		uv0.isFlipping = not uv0.isFlipping
		slot0 = uv0.webcam

		slot0:SwitchCam()

		slot0 = uv0

		slot0:updateCameraCanvas()
	end)
	onButton(slot0, slot0.selectCharBtn, function ()
		slot0 = uv0

		slot0:emit(uv1.SELECT_CHAR_PANEL)
	end)

	function slot0.webcam.takeCallback(slot0)
		setActive(uv0.ui, true)
	end

	onButton(slot0, slot0.l2dStopBtnGo, function ()
		uv0.isPause = true
		slot0 = uv0

		slot0:UpdateL2dPlayState()
	end)
	onButton(slot0, slot0.l2dPlayBtnGo, function ()
		uv0.isPause = false
		slot0 = uv0

		slot0:UpdateL2dPlayState()
	end)
	onButton(slot0, slot0.l2dAnimationBtnGo, function ()
		slot0 = uv0

		slot0:setLive2dAnimsPanelState(true)
	end)
	onButton(slot0, slot0.l2dAnimationBackBtnTrans, function ()
		slot0 = uv0

		slot0:setLive2dAnimsPanelState(false)
	end)
	cameraPaintViewAdjust(true)
	slot0:updateCameraCanvas()
	slot0:updateShowType()
end

function slot0.changeToTakeVideo(slot0)
	if slot0.state == uv0.STATE_TAKE_VIDEO then
		return
	end

	slot0.state = uv0.STATE_TAKE_VIDEO

	LeanTween.moveY(rtf(slot0.modePnlTF), -56, 0.1)
	SetActive(slot0.videoTakeImg, true)
end

function slot0.willExit(slot0)
	slot0:SetDummyForIOS(false)
	cameraPaintViewAdjust(false)
	slot0:clearSkin()

	if slot0.live2dCom then
		Destroy(slot0.live2dCom.gameObject)

		slot2 = pg.Live2DMgr.GetInstance()

		slot2:TryReleaseLive2dRes(slot0.live2dCom.name)

		slot0.live2dCom = nil
	end

	setActive(pg.UIMgr.GetInstance().OverlayEffect, PlayerPrefs.GetInt(SHOW_TOUCH_EFFECT, 1) > 0)
end

function slot0.clearSkin(slot0)
	if slot0.paintSkin and slot0.showType == uv0.SHOW_PAINT then
		retPaintingPrefab(slot0.paint, slot0.paintSkin)
	end

	if slot0.spineSkin and slot0.showType == uv0.SHOW_SPINE then
		slot1 = PoolMgr.GetInstance()

		slot1:ReturnSpineChar(slot0.spineSkin, go(slot0:findTF("model", slot0.spine)))
	end

	if slot0.live2dCom and slot0.showType == uv0.SHOW_LIVE2D then
		Destroy(slot0.live2dCom.gameObject)

		slot2 = pg.Live2DMgr.GetInstance()

		slot2:TryReleaseLive2dRes(slot0.live2dCom.name)

		slot0.live2dCom = nil
	end
end

function slot0.checkSkin(slot0, slot1)
	slot2 = pg.ship_skin_template[slot1]
	slot0.skin = slot2
	slot3 = false

	if slot0.paintSkin ~= slot2.painting or slot2.spineSkin ~= slot2.prefab then
		slot0:clearSkin()

		slot0.paintSkin = slot2.painting
		slot0.spineSkin = slot2.prefab
		slot0.l2dAnims = slot2.l2d_animations

		if slot0.l2dAnims == "" then
			slot0.l2dAnims = {
				"idle"
			}
		end

		slot4 = slot0.animContainer

		slot4:SetTotalCount(#slot0.l2dAnims, 0)

		slot3 = true
	end

	return slot3
end

function slot0.setSkinAndLive2d(slot0, slot1, slot2)
	slot3 = slot0:checkSkin(slot1)

	if slot0.showType ~= uv0.SHOW_LIVE2D and slot2 then
		slot0.showType = uv0.SHOW_LIVE2D

		slot0:updateShowType()

		slot3 = true
	end

	if slot3 then
		slot0:updateSkin()
	end
end

function slot0.setSkin(slot0, slot1)
	if slot0:checkSkin(slot1) then
		slot0:updateSkin()
	end
end

function slot0.setLive2d(slot0, slot1)
	if slot0.showType ~= uv0.SHOW_LIVE2D and slot1 then
		slot0:clearSkin()

		slot0.showType = uv0.SHOW_LIVE2D

		slot0:updateShowType()
		slot0:updateSkin()
	end
end

function slot0.updateShowType(slot0)
	setActive(slot0.paintBtn, false)
	slot0:setLive2dAnimsPanelState(false)
	setActive(slot0.live2dBtn, false)
	setActive(slot0.l2dCtrlPanl, false)
	setActive(slot0.spineBtn, false)

	if slot0.showType == uv0.SHOW_PAINT then
		setActive(slot0.paintBtn, true)
	elseif slot0.showType == uv0.SHOW_LIVE2D then
		setActive(slot0.live2dBtn, true)
		SetActive(slot0.l2dCtrlPanl, true)
	elseif slot0.showType == uv0.SHOW_SPINE then
		setActive(slot0.spineBtn, true)
	end
end

function slot1(slot0)
	if slot0 == uv0.SHOW_PAINT then
		return 0.5, 2
	elseif slot0 == uv0.SHOW_LIVE2D then
		return 0.5, 2
	elseif slot0 == uv0.SHOW_SPINE then
		return 0.5, 4
	end
end

function slot0.updateSkin(slot0)
	if slot0.showType == uv0.SHOW_LIVE2D then
		slot1 = ResourceMgr.Inst

		if not slot1:AssetExist("live2d/" .. slot0.paintSkin) or not PathMgr.FileExists(PathMgr.getAssetBundle("live2d/" .. slot0.paintSkin)) then
			slot0.showType = uv0.SHOW_PAINT

			slot0:updateShowType()
		end
	end

	slot1 = slot0.paint
	slot1 = slot1:GetComponent(typeof(Zoom))
	slot2 = 0
	slot3 = 0
	slot2, slot3 = uv1(slot0.showType)
	slot1.maxZoom = slot3
	slot1.minZoom = slot4

	if slot3 < slot0.paint.localScale.x then
		slot0.paint.localScale = Vector3(slot3, slot3, slot3)
	elseif slot0.paint.localScale.x < slot2 then
		slot0.paint.localScale = Vector3(slot2, slot2, slot2)
	end

	if slot0.showType == uv0.SHOW_LIVE2D then
		slot4 = pg.UIMgr.GetInstance()

		slot4:LoadingOn()

		slot4 = pg.Live2DMgr.GetInstance()

		slot4:GetLive2DModelAsync(slot0.paintSkin, function (slot0)
			if uv0.exited then
				Destory(slot0)

				slot1 = pg.Live2DMgr.GetInstance()

				slot1:TryReleaseLive2dRes(uv0.paintSkin)

				return
			end

			UIUtil.SetLayerRecursively(slot0, LayerMask.NameToLayer("UI"))

			slot1 = slot0.transform

			slot1:SetParent(uv0.live2d, true)

			slot1.localScale = Vector3(52, 52, 52)
			slot1.localPosition = BuildVector3(uv0.skin.live2d_offset) + Vector3(0, 0, 100)
			slot2 = slot0:GetComponent(typeof(Live2dChar))

			slot2:SetAction(pg.AssistantInfo.action2Id.idle)

			function slot2.FinishAction(slot0)
				if slot0 ~= pg.AssistantInfo.action2Id.idle then
					slot1 = uv0.live2dCom

					slot1:SetAction(uv0.selectedID)
				end
			end

			uv0.live2dCom = slot2
			uv0.live2dCom.name = uv0.paintSkin
			uv0.live2dAnimator = slot0:GetComponent(typeof(Animator))
			slot4 = uv0

			slot4:ResetL2dPanel()

			slot4 = uv0

			slot4:setLive2dAnimsPanelState(true)
			SetActive(uv0.spine, false)
			SetActive(uv0.live2d, true)

			slot4 = pg.UIMgr.GetInstance()

			slot4:LoadingOff()

			if CSharpVersion > 18 then
				slot5 = uv0.skin.lip_smoothing

				if uv0.skin.lip_sync_gain and slot4 ~= 0 then
					slot6 = uv0.live2d
					slot6 = slot6:GetChild(0)
					slot6:GetComponent("CubismCriSrcMouthInput").Gain = slot4
				end

				if slot5 and slot5 ~= 0 then
					slot6 = uv0.live2d
					slot6 = slot6:GetChild(0)
					slot6:GetComponent("CubismCriSrcMouthInput").Smoothing = slot5
				end
			end
		end)
	elseif slot0.showType == uv0.SHOW_PAINT then
		SetActive(slot0.live2d, false)
		SetActive(slot0.spine, false)
		setPaintingPrefabAsync(slot0.paint, slot0.paintSkin, "mainNormal")
	elseif slot0.showType == uv0.SHOW_SPINE then
		SetActive(slot0.live2d, false)
		SetActive(slot0.spine, true)

		slot4 = PoolMgr.GetInstance()

		slot4:GetSpineChar(slot0.spineSkin, true, function (slot0)
			slot0.name = "model"
			slot1 = slot0.transform

			slot1:SetParent(uv0.spine, true)

			slot1.localScale = Vector3(0.5, 0.5, 0.5)
			slot1.localPosition = Vector3.zero
			slot2 = uv0

			slot2:playAction("normal")
		end)
	end
end

function slot0.playAction(slot0, slot1)
	if slot0.showType ~= uv0.SHOW_SPINE then
		return
	end

	slot2 = GetOrAddComponent(slot0:findTF("model", slot0.spine), typeof(SpineAnimUI))

	slot2:SetAction(slot1, 0)
end

function slot0.ResetL2dPanel(slot0)
	slot0.selectedID = pg.AssistantInfo.action2Id.idle
	slot0.isPause = false

	slot0:UpdateL2dPlayState(true)
	slot0:updateSelectedItem()
end

function slot0.UpdateL2dPlayState(slot0, slot1)
	if slot0.showType ~= uv0.SHOW_LIVE2D then
		return
	end

	if slot0.isPause then
		SetActive(slot0.l2dStopBtnGo, false)
		SetActive(slot0.l2dPlayBtnGo, true)
	else
		SetActive(slot0.l2dStopBtnGo, true)
		SetActive(slot0.l2dPlayBtnGo, false)
	end

	if not slot1 then
		slot0:L2dAnimationState()
	end
end

function slot0.L2dAnimationState(slot0)
	if slot0.showType ~= uv0.SHOW_LIVE2D then
		return
	end

	if slot0.isPause then
		slot0.live2dAnimator.speed = 0
	else
		slot0.live2dAnimator.speed = 1
	end
end

function slot0.updateLive2dAnimationPanel(slot0)
	SetActive(slot0.l2dAnimations, slot0.isShowL2dAnims)
	SetActive(slot0.l2dAnimationBtnGo, not slot0.isShowL2dAnims)
end

function slot0.setLive2dAnimsPanelState(slot0, slot1)
	slot0.isShowL2dAnims = slot1

	slot0:updateLive2dAnimationPanel()
end

function slot0.onInitItem(slot0, slot1)
	slot2 = SnapshotItem.New(slot1, false)

	onButton(slot0, slot2.go, function ()
		slot1 = uv1
		uv0.selectedID = slot1:GetID()
		slot0 = uv0

		slot0:updateSelectedItem()

		slot0 = uv0.live2dCom

		slot0:SetAction(uv0.selectedID)
	end)

	slot0.scrollItems[slot1] = slot2
end

function slot0.onUpdateItem(slot0, slot1, slot2)
	slot1 = slot1 + 1

	if not slot0.scrollItems[slot2] then
		slot0:onInitItem(slot2)

		slot3 = slot0.scrollItems[slot2]
	end

	slot4 = slot0.l2dAnims[slot1]
	slot6.id = pg.AssistantInfo.action2Id[slot4]
	slot6.name = i18n(slot4)

	slot3:Update({})

	if slot0.isVertical then
		slot3:SetEulerAngle(slot0.verticalEulerAngle)
	else
		slot3:SetEulerAngle(slot0.horizontalEulerAngle)
	end

	if slot3:GetID() == slot0.selectedID then
		slot3:UpdateSelected(true)
	else
		slot3:UpdateSelected(false)
	end
end

function slot0.onReturnItem(slot0, slot1, slot2)
end

function slot0.updateSelectedItem(slot0)
	for slot4, slot5 in pairs(slot0.scrollItems) do
		if slot5:HasInfo() then
			if slot5:GetID() == slot0.selectedID then
				slot5:UpdateSelected(true)
			else
				slot5:UpdateSelected(false)
			end
		end
	end
end

function slot0.updateUIDirection(slot0)
	if slot0.isVertical then
		slot1 = slot0.verticalEulerAngle
		slot2 = slot0.rotateUseTime

		LeanTween.rotateZ(go(slot0.backBtnImg), slot1, slot2)
		LeanTween.rotateZ(go(slot0.selectCharBtnImg), slot1, slot2)
		LeanTween.rotateZ(go(slot0.switchCamBtnImg), slot1, slot2)
		LeanTween.rotateZ(go(slot0.l2dBtnImg), slot1, slot2)
		LeanTween.rotateZ(go(slot0.l2dStopBtnImg), slot1, slot2)
		LeanTween.rotateZ(go(slot0.l2dPlayBtnImg), slot1, slot2)
		LeanTween.rotateZ(go(slot0.l2d2PaintBtnImg), slot1, slot2)
		SetActive(slot0.takePhotoVerticalText, false)
		SetActive(slot0.takePhotoHorizontalText, true)
		SetActive(slot0.takeVideoVerticalText, false)
		SetActive(slot0.takeVideoHorizontalText, true)
		LeanTween.rotateZ(go(slot0.paint), slot1, slot2)
		slot0:updateListItemRotate(slot1, slot2)
	else
		slot1 = slot0.horizontalEulerAngle
		slot2 = slot0.rotateUseTime

		LeanTween.rotateZ(go(slot0.backBtnImg), slot1, slot2)
		LeanTween.rotateZ(go(slot0.selectCharBtnImg), slot1, slot2)
		LeanTween.rotateZ(go(slot0.switchCamBtnImg), slot1, slot2)
		LeanTween.rotateZ(go(slot0.l2dBtnImg), slot1, slot2)
		LeanTween.rotateZ(go(slot0.l2dStopBtnImg), slot1, slot2)
		LeanTween.rotateZ(go(slot0.l2dPlayBtnImg), slot1, slot2)
		LeanTween.rotateZ(go(slot0.l2d2PaintBtnImg), slot1, slot2)
		SetActive(slot0.takePhotoVerticalText, true)
		SetActive(slot0.takePhotoHorizontalText, false)
		SetActive(slot0.takeVideoVerticalText, true)
		SetActive(slot0.takeVideoHorizontalText, false)
		LeanTween.rotateZ(go(slot0.paint), slot1, slot2)
		slot0:updateListItemRotate(slot1, slot2)
	end
end

function slot0.updateListItemRotate(slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot0.scrollItems) do
		slot7:RotateUI(slot1, slot2)
	end
end

function slot0.updateCameraCanvas(slot0)
	slot4 = 1

	if CameraUtil.AspectRatio > UnityEngine.Screen.width / UnityEngine.Screen.height then
		slot4 = slot1 / slot5
	elseif slot1 < slot5 then
		slot4 = slot5 / slot1
	end

	if slot0.isFlipping then
		slot0.snapshot.localScale = Vector3(-slot4, slot4, 1)
	else
		slot0.snapshot.localScale = Vector3(slot4, slot4, 1)
	end
end

function slot0.SetDummyForIOS(slot0, slot1)
	if PLATFORM ~= PLATFORM_IPHONEPLAYER then
		setActive(slot0.dummy, false)

		return
	end

	slot2 = GameObject.Find("MainCamera")
	slot2 = slot2:GetComponent(typeof(Camera))

	if slot1 then
		slot2.nearClipPlane = 0
		slot3 = slot0.dummy

		slot3:SetParent(GameObject.Find("MainCamera").transform)

		slot0.dummy.localPosition = Vector3(0, 0, 3)
		slot0.dummy.localRotation = Vector3(0, 0, 0)
		slot0.dummy.localScale = Vector3(1, 1, 1)

		setActive(slot0.dummy, true)
	else
		slot2.nearClipPlane = -100
		slot3 = slot0.dummy

		slot3:SetParent(slot0._tf)

		slot0.dummy.localPosition = Vector3(0, 0, 0)
		slot0.dummy.localRotation = Vector3(0, 0, 0)
		slot0.dummy.localScale = Vector3(1, 1, 1)
	end
end

function slot0.SetMute(slot0, slot1)
	if slot1 then
		CriAtom.SetCategoryVolume("Category_CV", 0)
		CriAtom.SetCategoryVolume("Category_BGM", 0)
		CriAtom.SetCategoryVolume("Category_SE", 0)
	else
		slot4 = pg.CriMgr.GetInstance()

		CriAtom.SetCategoryVolume("Category_CV", slot4:getCVVolume())

		slot4 = pg.CriMgr.GetInstance()

		CriAtom.SetCategoryVolume("Category_BGM", slot4:getBGMVolume())

		slot4 = pg.CriMgr.GetInstance()

		CriAtom.SetCategoryVolume("Category_SE", slot4:getSEVolume())
	end
end

return slot0
