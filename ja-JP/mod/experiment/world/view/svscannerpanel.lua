slot0 = class("SVScannerPanel", import("view.base.BaseSubView"))
slot0.ShowView = "SVScannerPanel.ShowView"
slot0.HideView = "SVScannerPanel.HideView"

function slot0.getUIName(slot0)
	return "SVScannerPanel"
end

function slot0.OnLoaded(slot0)
end

function slot0.OnInit(slot0)
	slot0.camera = GameObject.Find("OverlayCamera"):GetComponent(typeof(Camera))
	slot1 = slot0._tf
	slot0.canvas = GetOrAddComponent(slot1, "CanvasGroup")
	slot0.rtExit = slot1:Find("adapt/exit")
	slot0.rtPanel = slot1:Find("adapt/selected_panel")

	setActive(slot0.rtPanel, false)

	slot0.rtWindow = slot0.rtPanel:Find("window")
	slot0.rtTitle = slot0.rtWindow:Find("base_info/title")
	slot0.rtMark = slot0.rtWindow:Find("base_info/mark")
	slot0.rtBuffContent = slot0.rtWindow:Find("base_info/content")
	slot0.rtInfo = slot0.rtWindow:Find("base_info/info")
	slot0.rtWeaknessContent = slot0.rtWindow:Find("weakness_info/content")
	slot0.rtAnim = slot1:Find("adapt/anim")
	slot0.buffUIItemList = UIItemList.New(slot0.rtBuffContent, slot0.rtBuffContent:Find("buff"))

	slot0.buffUIItemList:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			if #WorldBuff.GetTemplate(uv0.buffList[slot1 + 1]).icon > 0 then
				GetImageSpriteFromAtlasAsync("world/buff/" .. slot3.icon, "", slot2:Find("icon"))
			else
				setImageSprite(slot2:Find("icon"), nil)
			end

			setText(slot2:Find("Text"), slot3.desc)
		end
	end)

	slot0.weaknessUIItemList = UIItemList.New(slot0.rtWeaknessContent, slot0.rtWeaknessContent:Find("buff"))

	slot0.weaknessUIItemList:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			setText(slot2:Find("Text"), WorldBuff.GetTemplate(uv0.weaknessList[slot1 + 1]).desc)
		end
	end)
	onButton(slot0, slot0.rtExit, function ()
		if LeanTween.isTweening(uv0.alphaLT) then
			return
		end

		uv0:Hide()
	end, SFX_UI_CANCEL)
end

function slot0.OnDestroy(slot0)
end

function slot0.Show(slot0, slot1, slot2)
	slot0:emit(uv0.ShowView)

	if slot1 then
		slot0:DisplayWindow(slot1, slot2)
	else
		slot0:HideWindow()
	end

	function slot0.wsDragProxy.onDragFunction()
		if isActive(uv0.rtPanel) then
			uv0:HideWindow()
		end
	end

	pg.UIMgr.GetInstance():OverlayPanel(slot0._tf)
	setActive(slot0._tf, true)
	pg.CriMgr.GetInstance():PlayBGM("echo-loop", "sub_view")
	slot0:EaseInOut(true)
end

function slot0.Hide(slot0)
	if LeanTween.isTweening(slot0.alphaLT) then
		return
	end

	slot0:EaseInOut(false, function ()
		uv0.wsDragProxy.onDragFunction = nil

		pg.UIMgr.GetInstance():UnOverlayPanel(uv0._tf, uv0._parentTf)
		setActive(uv0._tf, false)
		pg.CriMgr.GetInstance():ResumeLastNormalBGM()
		uv0:emit(uv1.HideView)
	end)
end

function slot0.Setup(slot0, slot1, slot2)
	slot0.map = slot1
	slot0.wsDragProxy = slot2
end

function slot0.DisplayWindow(slot0, slot1, slot2)
	if isActive(slot0.rtPanel) and slot0.attachment == slot1 then
		slot0:HideWindow()
	else
		slot0:Update(slot1)

		slot0.rtPanel.position = slot0.camera:ScreenToWorldPoint(slot2)
		slot0.rtPanel.anchoredPosition3D = Vector3.New(slot0.rtPanel.anchoredPosition.x, slot0.rtPanel.anchoredPosition.y, 0)
		slot0.rtAnim.anchoredPosition = slot0.rtPanel.anchoredPosition
		slot0.rtWindow.anchorMin = Vector2.New(slot0.rtPanel.anchoredPosition.x > 0 and 0 or 1, slot0.rtPanel.anchoredPosition.y > 0 and 1 or 0)
		slot0.rtWindow.anchorMax = slot0.rtWindow.anchorMin
		slot0.rtWindow.pivot = Vector2.New(slot0.rtPanel.anchoredPosition.x > 0 and 1 or 0, slot0.rtPanel.anchoredPosition.y > 0 and 1 or 0)
		slot0.rtWindow.anchoredPosition = Vector2.zero

		setActive(slot0.rtPanel, true)
	end
end

function slot0.HideWindow(slot0)
	setAnchoredPosition(slot0.rtAnim, Vector2.zero)
	setActive(slot0.rtPanel, false)
end

function slot0.EaseInOut(slot0, slot1, slot2)
	if slot0.alphaLT then
		LeanTween.cancel(slot0.alphaLT)
	end

	slot0.canvas.alpha = slot1 and 0 or 1
	slot0.alphaLT = LeanTween.alphaCanvas(slot0.canvas, slot1 and 1 or 0, 1):setOnComplete(System.Action(slot2 or function ()
	end)).uniqueId
end

function slot0.Update(slot0, slot1)
	if slot0.attachment ~= slot1 then
		slot0.attachment = slot1

		slot0:OnUpdate()
	end
end

function slot0.OnUpdate(slot0)
	slot3 = slot0.rtTitle:Find("Text")
	slot4 = {}
	slot5 = false
	slot6 = false

	if WorldMapAttachment.IsEnemyType(slot2.type) then
		slot5 = true
		slot6 = false
		slot4 = slot2:GetBuffList()

		if slot2.config.difficulty == ys.Battle.BattleConst.Difficulty.WORLD then
			slot7 = (slot0.attachment.config.name or "") .. " LV." .. WorldConst.WorldLevelCorrect(slot0.map.config.expedition_level, slot2.config.type)
		else
			slot7 = slot7 .. " LV." .. slot2.config.level
		end
	elseif slot2.type == WorldMapAttachment.TypeTrap then
		slot5 = true
		slot6 = true

		setActive(slot0.rtInfo:Find("Image"), true)
		GetImageSpriteFromAtlasAsync("world/buff/" .. WorldBuff.GetTemplate(slot2.config.buff_id).icon, "", slot0.rtInfo:Find("Image"))
		setText(slot0.rtInfo:Find("Text"), HXSet.hxLan(slot2.config.desc))
	elseif slot2.type == WorldMapAttachment.TypePort then
		slot5 = slot2.config.port_camp > 0 and slot8 ~= nowWorld.realm
		slot6 = true

		setActive(slot0.rtInfo:Find("Image"), false)
		setText(slot0.rtInfo:Find("Text"), HXSet.hxLan(slot2.config.scan_desc))
	elseif slot2.type == WorldMapAttachment.TypeEvent then
		slot4 = slot2:GetBuffList()

		if slot2.config.is_scanevent == 1 or slot8 == 3 then
			slot5 = slot8 == 3
			slot6 = true

			setActive(slot0.rtInfo:Find("Image"), false)
			setText(slot0.rtInfo:Find("Text"), HXSet.hxLan(slot2.config.scan_desc))
		elseif slot8 == 2 or slot8 == 4 then
			slot5 = slot8 == 4
			slot6 = true

			setActive(slot0.rtInfo:Find("Image"), true)
			GetImageSpriteFromAtlasAsync("icondesc/" .. slot2.config.icon, "", slot0.rtInfo:Find("Image"))
			setText(slot0.rtInfo:Find("Text"), HXSet.hxLan(slot2.config.scan_desc))
		end
	end

	setText(slot3, HXSet.hxLan(slot7))

	slot8 = slot2:GetWeaknessBuff()
	slot0.buffList = {}
	slot0.weaknessList = {}

	table.foreachi(slot4, function (slot0, slot1)
		if slot1 == uv0 then
			table.insert(uv1.weaknessList, slot1)
		else
			table.insert(uv1.buffList, slot1)
		end
	end)
	slot0.buffUIItemList:align(#slot0.buffList)
	slot0.weaknessUIItemList:align(#slot0.weaknessList)
	setActive(slot0.rtInfo, slot6)
	setActive(slot0.rtMark, slot6 and slot5)
	setActive(slot0.rtTitle:Find("red"), slot5)
	setActive(slot0.rtTitle:Find("yellow"), not slot5)
end

return slot0
