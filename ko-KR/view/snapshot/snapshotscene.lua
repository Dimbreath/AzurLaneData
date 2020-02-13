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
	slot0.animContainer = slot0:findTF("animation_container", slot0.l2dAnimations):GetComponent("LScrollRect")
	slot0.animContainer.decelerationRate = 0.1

	function slot0.animContainer.onInitItem(slot0)
		slot0:onInitItem(slot0)
	end

	function slot0.animContainer.onUpdateItem(slot0, slot1)
		slot0:onUpdateItem(slot0, slot1)
	end

	function slot0.animContainer.onReturnItem(slot0, slot1)
		slot0:onReturnItem(slot0, slot1)
	end

	function slot0.animContainer.onStart()
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
	slot0.webcam = slot0.snapshot:GetComponent(typeof(WebCam))
	slot0.paint = slot0:findTF("container/paint")
	slot0.live2d = slot0:findTF("live2d", slot0.paint)
	slot0.spine = slot0:findTF("spine", slot0.paint)
	slot0.paintSkin = nil
	slot0.showLive2d = false
	slot0.showType = slot0.SHOW_PAINT
	slot0.state = slot0.STATE_TAKE_PHOTO

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
	slot0.takePhotoVerticalText:GetComponent("Text").text = i18n("word_photo_mode")
	slot0.takePhotoHorizontalText:GetComponent("Text").text = i18n("word_photo_mode")

	SetActive(slot0.takePhotoHorizontalText, false)

	slot0.takeVideoVerticalText = slot0:findTF("ui/bg/modePnl/takeVideoBtn/verticalText")
	slot0.takeVideoHorizontalText = slot0:findTF("ui/bg/modePnl/takeVideoBtn/horizontalText")
	slot0.takeVideoVerticalText:GetComponent("Text").text = i18n("word_video_mode")
	slot0.takeVideoHorizontalText:GetComponent("Text").text = i18n("word_video_mode")

	SetActive(slot0.takeVideoHorizontalText, false)

	slot0.isFlipping = false
	slot0.videoTipPanel = slot0:findTF("videoTipPanel")

	setActive(slot0.videoTipPanel, false)
end

function slot0.back(slot0)
	if slot0.exited then
		return
	end

	slot0:emit(slot0.ON_BACK)
end

function slot0.saveVideo(slot0)
	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = i18n("word_save_video"),
		onYes = function ()
			YARecorder.Inst:DiscardVideo()
		end
	})
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.backBtn, function ()
		slot0:back()
	end)
	onButton(slot0, slot0.switchDirBtn, function ()
		slot0.isVertical = not slot0.isVertical

		slot0:updateUIDirection()
		slot0.updateUIDirection:updateCameraCanvas()
	end)
	onButton(slot0, slot0.takeBtn, function ()
		if slot0.state == slot1.STATE_TAKE_PHOTO then
			setActive(slot0.ui, false)
			setActive.webcam:Take(function (slot0)
				slot1 = UnityEngine.Texture2D.New(Screen.width, Screen.height)

				Tex2DExtension.LoadImage(slot1, slot0)
				slot0:emit(slot1.SHARE_PANEL, slot1, slot0)

				if PLATFORM_CODE == PLATFORM_JP and pg.SdkMgr.GetInstance():GetChannelUID() == "2" then
					print("start photo : play sound")
					NotificationMgr.Inst:PlayShutterSound()
				end
			end)
		elseif slot0.state == slot1.STATE_TAKE_VIDEO then
			slot0 = pg.TimeMgr.GetInstance():STimeDescS(pg.TimeMgr.GetInstance():GetServerTime(), "*t")
			slot1 = "azur" .. slot0.year .. slot0.month .. slot0.day .. slot0.hour .. slot0.min .. slot0.sec

			setActive(slot0.ui, false)

			if not PlayerPrefs.GetInt("hadShowForVideoTip") or slot2 <= 0 then
				PlayerPrefs.SetInt("hadShowForVideoTip", 1)

				slot0:findTF("Text", slot0.videoTipPanel):GetComponent("Text").text = i18n("word_take_video_tip")

				onButton(slot0, slot0.videoTipPanel, function ()
					setActive(slot0.videoTipPanel, false)
					setActive(slot0.stopRecBtn, true)
					LeanTween.moveX(slot0.stopRecBtn, 0, 0.15):setOnComplete(System.Action(function ()
						slot0:SetMute(true)
						YARecorder.Inst:SetVideoFilename(YARecorder.Inst)
						YARecorder.Inst:StartRecording()
					end))

					if PLATFORM_CODE == PLATFORM_JP and pg.SdkMgr.GetInstance():GetChannelUID() == "2" then
						print("start recording : play sound")
						NotificationMgr.Inst:PlayStartRecordSound()
					end
				end)
				setActive(slot0.videoTipPanel, true)
			else
				setActive(slot0.stopRecBtn, true)
				LeanTween.moveX(slot0.stopRecBtn, 0, 0.15):setOnComplete(System.Action(function ()
					slot0:SetMute(true)
					YARecorder.Inst:SetVideoFilename(YARecorder.Inst)
					YARecorder.Inst:StartRecording()
				end))
			end
		end
	end)
	onButton(slot0, slot0.paintBtn, function ()
		if slot0.showType == slot1.SHOW_PAINT then
			slot0:clearSkin()

			slot0.clearSkin.showType = slot0.SHOW_LIVE2D

			slot0.clearSkin:updateShowType()
			slot0.clearSkin.updateShowType:updateSkin()
			slot0.clearSkin.updateShowType.updateSkin:ResetL2dPanel()
		end
	end)
	onButton(slot0, slot0.live2dBtn, function ()
		if slot0.showType == slot1.SHOW_LIVE2D then
			slot0:clearSkin()

			slot0.clearSkin.showType = slot0.SHOW_PAINT

			slot0.clearSkin:updateShowType()
			slot0.clearSkin.updateShowType:updateSkin()
		end
	end)
	onButton(slot0, slot0.spineBtn, function ()
		if slot0.showType == slot1.SHOW_SPINE then
			slot0:clearSkin()

			slot0.clearSkin.showType = slot0.SHOW_PAINT

			slot0.clearSkin:updateShowType()
			slot0.clearSkin.updateShowType:updateSkin()
		end
	end)
	onButton(slot0, slot0.takePhotoBtn, slot1)
	onButton(slot0, slot0.takeVideoBtn, function ()
		if CheckPermissionGranted(ANDROID_RECORD_AUDIO_PERMISSION) and CheckPermissionGranted(ANDROID_WRITE_EXTERNAL_PERMISSION) then
			slot0:changeToTakeVideo()
		else
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("apply_permission_record_audio_tip1"),
				onYes = function ()
					ApplyPermission({
						ANDROID_RECORD_AUDIO_PERMISSION,
						ANDROID_WRITE_EXTERNAL_PERMISSION
					})
				end
			})
		end
	end)
	slot1()
	onButton(slot0, slot0.stopRecBtn, function ()
		if not LeanTween.isTweening(go(slot0.stopRecBtn)) then
			LeanTween.moveX(slot0.stopRecBtn, slot0.stopRecBtn.rect.width, 0.15):setOnComplete(System.Action(function ()
				setActive(slot0.ui, true)
				setActive(slot0.stopRecBtn, false)
				YARecorder.Inst:StopRecording()

				if PLATFORM == PLATFORM_ANDROID then
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = i18n("word_save_video"),
						onNo = function ()
							YARecorder.Inst:DiscardVideo()
						end
					})
				end

				slot0:SetMute(false)
			end))
		end
	end)
	setActive(slot0.stopRecBtn, false)
	onButton(slot0, slot0.switchCamBtn, function ()
		slot0.isFlipping = not slot0.isFlipping

		slot0.webcam:SwitchCam()
		slot0.webcam.SwitchCam:updateCameraCanvas()
	end)
	onButton(slot0, slot0.selectCharBtn, function ()
		slot0:emit(slot1.SELECT_CHAR_PANEL)
	end)

	function slot0.webcam.takeCallback(slot0)
		setActive(slot0.ui, true)
	end

	onButton(slot0, slot0.l2dStopBtnGo, function ()
		slot0.isPause = true

		slot0:UpdateL2dPlayState()
	end)
	onButton(slot0, slot0.l2dPlayBtnGo, function ()
		slot0.isPause = false

		slot0:UpdateL2dPlayState()
	end)
	onButton(slot0, slot0.l2dAnimationBtnGo, function ()
		slot0:setLive2dAnimsPanelState(true)
	end)
	onButton(slot0, slot0.l2dAnimationBackBtnTrans, function ()
		slot0:setLive2dAnimsPanelState(false)
	end)
	cameraPaintViewAdjust(true)
	slot0:updateCameraCanvas()
	slot0:updateShowType()
end

function slot0.changeToTakeVideo(slot0)
	if slot0.state == slot0.STATE_TAKE_VIDEO then
		return
	end

	slot0.state = slot0.STATE_TAKE_VIDEO

	LeanTween.moveY(rtf(slot0.modePnlTF), -56, 0.1)
	SetActive(slot0.videoTakeImg, true)
end

function slot0.willExit(slot0)
	slot0:SetDummyForIOS(false)
	cameraPaintViewAdjust(false)
	slot0:clearSkin()

	if slot0.live2dCom then
		Destroy(slot0.live2dCom.gameObject)
		pg.Live2DMgr.GetInstance():TryReleaseLive2dRes(slot0.live2dCom.name)

		slot0.live2dCom = nil
	end

	setActive(pg.UIMgr.GetInstance().OverlayEffect, PlayerPrefs.GetInt(SHOW_TOUCH_EFFECT, 1) > 0)
end

function slot0.clearSkin(slot0)
	if slot0.paintSkin and slot0.showType == slot0.SHOW_PAINT then
		retPaintingPrefab(slot0.paint, slot0.paintSkin)
	end

	if slot0.spineSkin and slot0.showType == slot0.SHOW_SPINE then
		PoolMgr.GetInstance():ReturnSpineChar(slot0.spineSkin, go(slot0:findTF("model", slot0.spine)))
	end

	if slot0.live2dCom and slot0.showType == slot0.SHOW_LIVE2D then
		Destroy(slot0.live2dCom.gameObject)
		pg.Live2DMgr.GetInstance():TryReleaseLive2dRes(slot0.live2dCom.name)

		slot0.live2dCom = nil
	end
end

function slot0.checkSkin(slot0, slot1)
	slot0.skin = pg.ship_skin_template[slot1]
	slot3 = false

	if slot0.paintSkin ~= pg.ship_skin_template[slot1].painting or slot2.spineSkin ~= slot2.prefab then
		slot0:clearSkin()

		slot0.paintSkin = slot2.painting
		slot0.spineSkin = slot2.prefab
		slot0.l2dAnims = slot2.l2d_animations

		if slot0.l2dAnims == "" then
			slot0.l2dAnims = {
				"idle"
			}
		end

		slot0.animContainer:SetTotalCount(#slot0.l2dAnims, 0)

		slot3 = true
	end

	return slot3
end

function slot0.setSkinAndLive2d(slot0, slot1, slot2)
	slot3 = slot0:checkSkin(slot1)

	if slot0.showType ~= slot0.SHOW_LIVE2D and slot2 then
		slot0.showType = slot0.SHOW_LIVE2D

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
	if slot0.showType ~= slot0.SHOW_LIVE2D and slot1 then
		slot0:clearSkin()

		slot0.showType = slot0.SHOW_LIVE2D

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

	if slot0.showType == slot0.SHOW_PAINT then
		setActive(slot0.paintBtn, true)
	elseif slot0.showType == slot0.SHOW_LIVE2D then
		setActive(slot0.live2dBtn, true)
		SetActive(slot0.l2dCtrlPanl, true)
	elseif slot0.showType == slot0.SHOW_SPINE then
		setActive(slot0.spineBtn, true)
	end
end

function slot1(slot0)
	if slot0 == slot0.SHOW_PAINT then
		return 0.5, 2
	elseif slot0 == slot0.SHOW_LIVE2D then
		return 0.5, 2
	elseif slot0 == slot0.SHOW_SPINE then
		return 0.5, 4
	end
end

function slot0.updateSkin(slot0)
	if slot0.showType == slot0.SHOW_LIVE2D and (not ResourceMgr.Inst:AssetExist("live2d/" .. slot0.paintSkin) or not PathMgr.FileExists(PathMgr.getAssetBundle("live2d/" .. slot0.paintSkin))) then
		slot0.showType = slot0.SHOW_PAINT

		slot0:updateShowType()
	end

	slot1 = slot0.paint:GetComponent(typeof(Zoom))
	slot2 = 0
	slot3 = 0
	slot2, slot3 = slot1(slot0.showType)
	slot1.maxZoom = slot5
	slot1.minZoom = slot2

	if slot5 < slot0.paint.localScale.x then
		slot0.paint.localScale = Vector3(slot3, slot3, slot3)
	elseif slot0.paint.localScale.x < slot2 then
		slot0.paint.localScale = Vector3(slot2, slot2, slot2)
	end

	if slot0.showType == slot0.SHOW_LIVE2D then
		pg.UIMgr.GetInstance():LoadingOn()
		pg.Live2DMgr.GetInstance():GetLive2DModelAsync(slot0.paintSkin, function (slot0)
			if slot0.exited then
				Destory(slot0)
				pg.Live2DMgr.GetInstance():TryReleaseLive2dRes(slot0.paintSkin)

				return
			end

			UIUtil.SetLayerRecursively(slot0, LayerMask.NameToLayer("UI"))
			slot0.transform.SetParent(slot1, slot0.live2d, true)

			slot0.transform.localScale = Vector3(52, 52, 52)
			slot0.transform.localPosition = BuildVector3(slot0.skin.live2d_offset) + Vector3(0, 0, 100)
			slot2 = slot0:GetComponent(typeof(Live2dChar))

			slot2:SetAction(slot3)

			function slot2.FinishAction(slot0)
				if slot0 ~= pg.AssistantInfo.action2Id.idle then
					slot0.live2dCom:SetAction(slot0.selectedID)
				end
			end

			slot0.live2dCom = slot2
			slot0.live2dCom.name = slot0.paintSkin
			slot0.live2dAnimator = slot0:GetComponent(typeof(Animator))

			slot0:ResetL2dPanel()
			slot0:setLive2dAnimsPanelState(true)
			SetActive(slot0.spine, false)
			SetActive(slot0.live2d, true)
			pg.UIMgr.GetInstance():LoadingOff()

			if CSharpVersion > 18 then
				slot5 = slot0.skin.lip_smoothing

				if slot0.skin.lip_sync_gain and slot4 ~= 0 then
					slot0.live2d:GetChild(0):GetComponent("CubismCriSrcMouthInput").Gain = slot4
				end

				if slot5 and slot5 ~= 0 then
					slot0.live2d:GetChild(0):GetComponent("CubismCriSrcMouthInput").Smoothing = slot5
				end
			end
		end)
	elseif slot0.showType == slot0.SHOW_PAINT then
		SetActive(slot0.live2d, false)
		SetActive(slot0.spine, false)
		setPaintingPrefabAsync(slot0.paint, slot0.paintSkin, "mainNormal")
	elseif slot0.showType == slot0.SHOW_SPINE then
		SetActive(slot0.live2d, false)
		SetActive(slot0.spine, true)
		PoolMgr.GetInstance():GetSpineChar(slot0.spineSkin, true, function (slot0)
			slot0.name = "model"

			slot0.transform.SetParent(slot1, slot0.spine, true)

			slot0.transform.localScale = Vector3(0.5, 0.5, 0.5)
			slot0.transform.localPosition = Vector3.zero

			slot0:playAction("normal")
		end)
	end
end

function slot0.playAction(slot0, slot1)
	if slot0.showType ~= slot0.SHOW_SPINE then
		return
	end

	GetOrAddComponent(slot0:findTF("model", slot0.spine), typeof(SpineAnimUI)):SetAction(slot1, 0)
end

function slot0.ResetL2dPanel(slot0)
	slot0.selectedID = pg.AssistantInfo.action2Id.idle
	slot0.isPause = false

	slot0:UpdateL2dPlayState(true)
	slot0:updateSelectedItem()
end

function slot0.UpdateL2dPlayState(slot0, slot1)
	if slot0.showType ~= slot0.SHOW_LIVE2D then
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
	if slot0.showType ~= slot0.SHOW_LIVE2D then
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
	onButton(slot0, SnapshotItem.New(slot1, false).go, function ()
		slot0.selectedID = slot1:GetID()

		slot0:updateSelectedItem()
		slot0.updateSelectedItem.live2dCom:SetAction(slot0.selectedID)
	end)

	slot0.scrollItems[slot1] = SnapshotItem.New(slot1, false)
end

function slot0.onUpdateItem(slot0, slot1, slot2)
	slot1 = slot1 + 1

	if not slot0.scrollItems[slot2] then
		slot0:onInitItem(slot2)

		slot3 = slot0.scrollItems[slot2]
	end

	slot3:Update({
		id = pg.AssistantInfo.action2Id[slot0.l2dAnims[slot1]],
		name = i18n(slot4)
	})

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
	return
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
		slot0:updateListItemRotate(slot0.verticalEulerAngle, slot0.rotateUseTime)
	else
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
		slot0:updateListItemRotate(slot0.horizontalEulerAngle, slot0.rotateUseTime)
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

	slot2 = GameObject.Find("MainCamera"):GetComponent(typeof(Camera))

	if slot1 then
		slot2.nearClipPlane = 0

		slot0.dummy:SetParent(GameObject.Find("MainCamera").transform)

		slot0.dummy.localPosition = Vector3(0, 0, 3)
		slot0.dummy.localRotation = Vector3(0, 0, 0)
		slot0.dummy.localScale = Vector3(1, 1, 1)

		setActive(slot0.dummy, true)
	else
		slot2.nearClipPlane = -100

		slot0.dummy:SetParent(slot0._tf)

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
		CriAtom.SetCategoryVolume("Category_CV", pg.CriMgr.GetInstance():getCVVolume())
		CriAtom.SetCategoryVolume("Category_BGM", pg.CriMgr.GetInstance():getBGMVolume())
		CriAtom.SetCategoryVolume("Category_SE", pg.CriMgr.GetInstance():getSEVolume())
	end
end

return slot0
