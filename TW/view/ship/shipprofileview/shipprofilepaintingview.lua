slot0 = class("ShipProfilePaintingView")

function slot0.Ctor(slot0, slot1, slot2)
	pg.DelegateInfo.New(slot0)

	slot0.prefab = slot1
	slot0.painting = slot2
	slot0.cg = slot0.painting:GetComponent("CanvasGroup")
	slot0.bg = slot0.prefab:Find("bg")
	slot0.bgBtn = slot0.bg:GetComponent("Button")
	slot0.recorder = {}
	slot0.hideObjList = {}
	slot0.isPreview = false
	slot0.zoomDelegate = GetOrAddComponent(slot0.bg, "MultiTouchZoom")
	slot0.dragTrigger = GetOrAddComponent(slot0.bg, "EventTriggerListener")

	slot0:SetHideObject()
end

function slot0.SetHideObject(slot0)
	slot1 = slot0.prefab.childCount
	slot2 = 0

	while slot1 > slot2 do
		if slot0.prefab:GetChild(slot2).gameObject.activeSelf and slot3 ~= slot0.painting and slot3 ~= slot0.bg then
			slot0.hideObjList[#slot0.hideObjList + 1] = slot3
		end

		slot2 = slot2 + 1
	end
end

function slot0.Start(slot0)
	slot0.cg.blocksRaycasts = false

	slot0:EnableObjects(false)
	slot0:RecodObjectInfo()
	LeanTween.moveX(slot0.painting, 0, 0.3):setEase(LeanTweenType.easeInOutSine):setOnComplete(System.Action(function ()
		slot0:TweenObjects()
	end))

	slot0.isPreview = true
end

function slot0.EnableObjects(slot0, slot1)
	_.each(slot0.hideObjList, function (slot0)
		setActive(slot0, slot0)
	end)
end

function slot0.TweenObjects(slot0)
	openPortrait(slot0.prefab)

	slot1 = true
	slot0.exitFlag = false
	slot2, slot3 = nil

	slot0.zoomDelegate:SetZoomTarget(slot0.painting)

	slot0.zoomDelegate.enabled = true
	slot0.dragTrigger.enabled = true

	slot0.dragTrigger.AddPointDownFunc(slot4, function (slot0)
		if Input.touchCount == 1 or Application.isEditor then
			slot0.exitFlag = true
			slot1 = true
		elseif Input.touchCount >= 2 then
			slot1 = false
			slot0.exitFlag = false
		end
	end)
	slot0.dragTrigger.AddPointUpFunc(slot4, function (slot0)
		if Input.touchCount <= 2 then
			slot0 = true
		end
	end)
	slot0.dragTrigger.AddBeginDragFunc(slot4, function (slot0, slot1)
		slot0.exitFlag = false
		slot2 = slot1.position.x * slot0.recorder.widthRate - slot0.recorder.halfWidth - tf(slot0.painting).localPosition.x.position.y * slot0.recorder.heightRate - slot0.recorder.halfHeight - tf(slot0.painting).localPosition.y
	end)
	slot0.dragTrigger.AddDragFunc(slot4, function (slot0, slot1)
		if slot0 then
			tf(slot1.painting).localPosition = Vector3(slot1.position.x * slot1.recorder.widthRate - slot1.recorder.halfWidth - slot2 - 150, slot1.position.y * slot1.recorder.heightRate - slot1.recorder.halfHeight - slot3, -22)
		end
	end)

	slot0.bgBtn.enabled = true

	onButton(slot0, slot0.bg, function ()
		slot0:Finish()
	end, SFX_CANCEL)
end

function slot0.RecodObjectInfo(slot0)
	slot0.recorder.srcPosX = slot0.painting.anchoredPosition.x
	slot0.recorder.srcPosY = slot0.painting.anchoredPosition.y
	slot0.recorder.srcWidth = slot0.painting.rect.width
	slot0.recorder.srcHeight = slot0.painting.rect.height
	slot0.recorder.widthRate = slot0.prefab.rect.width / UnityEngine.Screen.width
	slot0.recorder.heightRate = slot0.prefab.rect.height / UnityEngine.Screen.height
	slot0.recorder.halfWidth = slot0.recorder.srcWidth / 2
	slot0.recorder.halfHeight = slot0.recorder.srcHeight / 2
end

function slot0.Finish(slot0, slot1)
	if not slot1 and not slot0.exitFlag then
		return
	end

	slot0.dragTrigger.enabled = false
	slot0.zoomDelegate.enabled = false

	_.each(slot0.hideObjList, function (slot0)
		setActive(slot0, true)
	end)
	closePortrait(slot0.prefab)
	slot0:EnableObjects(true)

	slot0.painting.localScale = Vector3(1, 1, 1)

	setAnchoredPosition(slot0.painting, {
		x = slot0.recorder.srcPosX,
		y = slot0.recorder.srcPosY
	})

	slot0.bgBtn.enabled = false
	slot0.cg.blocksRaycasts = true
	slot0.isPreview = false
	slot0.exitFlag = false
	slot0.recorder = {}
end

function slot0.Dispose(slot0)
	if slot0.isPreview then
		slot0:Finish(true)
	end

	if slot0.dragTrigger then
		ClearEventTrigger(slot0.dragTrigger)

		slot0.dragTrigger = nil
	end

	slot0.exitFlag = nil
	slot0.recorder = nil
	slot0.isPreview = nil

	pg.DelegateInfo.Dispose(slot0)
end

return slot0
