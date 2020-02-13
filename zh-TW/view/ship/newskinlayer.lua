slot0 = class("NewSkinLayer", import("..base.BaseUI"))
slot0.PAINT_DURATION = 0.35
slot0.STAR_DURATION = 0.5
slot1 = 19

function slot0.getUIName(slot0)
	return "NewSkinUI"
end

function slot0.preload(slot0, slot1)
	slot6 = pg.ship_data_statistics[pg.ship_skin_template[slot0.contextData.skinId].ship_group * 10 + 1]
	slot7 = nil
	slot7 = (not pg.ship_skin_template[slot0.contextData.skinId].bg_sp or slot3.bg_sp == "" or slot3.bg_sp) and ((slot3.bg and #slot3.bg > 0 and slot3.bg) or (slot3.rarity_bg and #slot3.rarity_bg > 0 and slot3.rarity_bg))

	if not slot7 or not ("bg/star_level_bg_" .. slot7) then
		slot7 = "newshipbg/bg_" .. ((ShipGroup.IsBluePrintGroup(slot4) and "0") or "") .. ShipRarity.Rarity2Print(slot6.rarity)
	end

	GetSpriteFromAtlasAsync(slot7, "", slot1)
end

function slot0.setShipVOs(slot0, slot1)
	slot0.shipVOs = slot1
	slot0.sameShipVOs = slot0:getSameGroupShips()
end

function slot0.init(slot0)
	slot0._shake = slot0:findTF("shake_panel")
	slot0._shade = slot0:findTF("shade")
	slot0._bg = slot0._shake:Find("bg")
	slot0._staticBg = slot0._bg:Find("static_bg")
	slot0._paintingTF = slot0._shake:Find("paint")
	slot0._dialogue = slot0._shake:Find("dialogue")
	slot0._skinName = slot0._dialogue:Find("name"):GetComponent(typeof(Text))
	slot0._left = slot0._shake:Find("left_panel")
	slot0._viewBtn = slot0._left:Find("view_btn")
	slot0._shareBtn = slot0._left:Find("share_btn")
	slot0.clickTF = slot0._shake:Find("click")
	slot0.newTF = slot0._shake:Find("New")
	slot0.timelimit = slot0._shake:Find("timelimit")

	setActive(slot0.newTF, false)

	slot0.changeSkinBtn = slot0:findTF("set_skin_btn", slot0._shake)
	slot0.selectPanel = slot0:findTF("select_ship_panel")
	slot0.selectPanelCloseBtn = slot0:findTF("window/top/btnBack", slot0.selectPanel)
	slot0.shipContent = slot0:findTF("window/sliders/scroll_rect/content", slot0.selectPanel)
	slot0.shipCardTpl = slot0._tf:GetComponent("ItemList").prefabItem[0]
	slot0.confirmChangeBtn = slot0:findTF("window/exchange_btn", slot0.selectPanel)
	slot0.flagShipToggle = slot0:findTF("window/flag_ship", slot0.selectPanel)

	setActive(slot0.selectPanel, false)

	slot0.isTimeLimit = slot0.contextData.timeLimit

	setActive(slot0.timelimit, slot0.isTimeLimit)
	pg.UIMgr.GetInstance():OverlayPanel(slot0._tf)

	slot0.isLoadBg = false
end

function slot0.voice(slot0, slot1)
	if not slot1 then
		return
	end

	function slot2()
		if slot0._currentVoice then
			slot0._currentVoice:Stop(true)
		end

		slot0._currentVoice = playSoundEffect(playSoundEffect)
	end

	if slot0.loadedCVBankName then
		slot2()
	else
		pg.CriMgr:LoadCV(ShipWordHelper.RawGetCVKey(slot0._skinConfig.id), function ()
			slot0 = pg.CriMgr.GetCVBankName(pg.CriMgr.GetCVBankName)

			if pg.CriMgr.GetCVBankName.exited then
				pg.CriMgr.UnloadCVBank(slot0)
			else
				slot1.loadedCVBankName = slot0

				slot2()
			end

			slot1.loadedCVBankName = slot0

			slot2()
		end)
	end
end

function slot0.setSkin(slot0, slot1)
	slot0:recyclePainting()

	slot0._skinConfig = pg.ship_skin_template[slot1]
	slot2 = pg.ship_skin_template[slot1].ship_group
	slot3 = pg.ship_data_statistics[slot0._skinConfig.ship_group * 10 + 1]
	slot4 = nil
	slot4 = (not slot0._skinConfig.bg_sp or slot0._skinConfig.bg_sp == "" or slot0._skinConfig.bg_sp) and ((slot0._skinConfig.bg and #slot0._skinConfig.bg > 0 and slot0._skinConfig.bg) or (slot0._skinConfig.rarity_bg and #slot0._skinConfig.rarity_bg > 0 and slot0._skinConfig.rarity_bg))

	if slot4 then
		pg.DynamicBgMgr.GetInstance():LoadBg(slot0, slot4, slot0._bg, slot0._staticBg, function (slot0)
			slot0.isLoadBg = true
		end, function (slot0)
			slot0.isLoadBg = true
		end)
	else
		GetSpriteFromAtlasAsync("newshipbg/bg_" .. ((ShipGroup.IsBluePrintGroup(slot2) and "0") or "") .. ShipRarity.Rarity2Print(slot3.rarity), "", function (slot0)
			setImageSprite(slot0._staticBg, slot0, true)

			slot0.isLoadBg = true
		end)
	end

	setPaintingPrefabAsync(slot0._paintingTF, slot0._skinConfig.painting, "huode")

	slot0._skinName.text = i18n("ship_newSkin_name", HXSet.hxLan(slot0._skinConfig.name))
	slot5 = nil
	slot6 = ""
	slot7 = nil

	if ShipWordHelper.RawGetWord(slot1, ShipWordHelper.WORD_TYPE_UNLOCK) == "" then
		slot5, slot7, slot6 = ShipWordHelper.GetWordAndCV(slot1, ShipWordHelper.WORD_TYPE_DROP)
	else
		slot5, slot7, slot6 = ShipWordHelper.GetWordAndCV(slot1, ShipWordHelper.WORD_TYPE_UNLOCK)
	end

	setWidgetText(slot0._dialogue, slot6, "desc/Text")

	slot0._dialogue.transform.localScale = Vector3(0, 1, 1)

	SetActive(slot0._dialogue, false)
	SetActive(slot0._dialogue, true)
	LeanTween.scale(slot0._dialogue, Vector3(1, 1, 1), 0.1):setOnComplete(System.Action(function ()
		setActive(slot0._shade, false)
		setActive(slot0.clickTF, true)
		setActive:voice(setActive)
	end))
end

function slot0.showExitTip(slot0)
	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = i18n("give_up_cloth_change"),
		onYes = function ()
			slot0:emit(slot1.ON_CLOSE)
		end
	})
end

function slot0.didEnter(slot0)
	slot0.shipName = HXSet.hxLan(pg.ship_skin_template[ShipWordHelper.GetDefaultSkin(slot0.contextData.skinId)].name)

	onButton(slot0, slot0._viewBtn, function ()
		slot0.isInView = true

		slot0:paintView()
		setActive(slot0.clickTF, false)
	end, SFX_PANEL)
	onButton(slot0, slot0._shareBtn, function ()
		pg.ShareMgr.GetInstance():Share(pg.ShareMgr.TypeNewSkin)
	end, SFX_PANEL)
	onButton(slot0, slot0.clickTF, function ()
		if slot0.isInView or not slot0.isLoadBg then
			return
		end

		slot0:showExitTip()
	end, SFX_CANCEL)
	onButton(slot0, slot0.selectPanel, function ()
		slot0:closeSelectPanel()
	end, SFX_PANEL)
	onToggle(slot0, slot0.flagShipToggle, function (slot0)
		slot0.flagShipMark = slot0
	end, SFX_PANEL)
	triggerToggle(slot0.flagShipToggle, slot2)
	slot0:onSwitch(slot0.changeSkinBtn, table.getCount(slot0.sameShipVOs) > 0)

	slot3 = slot0:loadUISync("getrole")
	slot3.layer = LayerMask.NameToLayer("UI")
	slot3.transform.localPosition = Vector3(0, 0, -10)

	setParent(slot3, slot0._tf, false)
	playSoundEffect(SFX_UI_DOCKYARD_CHARGET)
end

function slot0.onBackPressed(slot0)
	playSoundEffect(SFX_CANCEL)

	if slot0.isInView then
		slot0:hidePaintView(true)

		return
	end

	if isActive(slot0.selectPanel) then
		slot0:closeSelectPanel()

		return
	end

	if isActive(slot0.clickTF) then
		triggerButton(slot0.clickTF)
	end
end

function slot0.onSwitch(slot0, slot1, slot2)
	onButton(slot0, slot1, function ()
		if slot0 then
			slot1:openSelectPanel()
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("err_cloth_change_noship", slot1.shipName))
		end
	end)
end

function slot0.getSameGroupShips(slot0)
	slot1 = {}
	slot3 = pg.ship_skin_template[slot0.contextData.skinId].ship_group

	for slot7, slot8 in pairs(slot0.shipVOs) do
		if slot8.groupId == slot3 then
			slot1[slot8.id] = slot8
		end
	end

	return slot1
end

function slot0.paintView(slot0)
	slot1 = {}
	slot2 = slot0._shake.childCount
	slot3 = 0

	while slot2 > slot3 do
		if slot0._shake:GetChild(slot3).gameObject.activeSelf and slot4 ~= slot0._paintingTF and slot4 ~= slot0._bg then
			slot1[#slot1 + 1] = slot4

			setActive(slot4, false)
		end

		slot3 = slot3 + 1
	end

	openPortrait()

	slot5 = slot0._paintingTF.anchoredPosition.x
	slot6 = slot0._paintingTF.anchoredPosition.y
	slot9 = slot0._tf.rect.width / UnityEngine.Screen.width
	slot10 = slot0._tf.rect.height / UnityEngine.Screen.height
	slot11 = slot0._paintingTF.rect.width / 2
	slot12 = slot0._paintingTF.rect.height / 2
	slot13, slot14 = nil

	if not LeanTween.isTweening(go(slot0._paintingTF)) then
		LeanTween.moveX(rtf(slot4), 150, 0.5):setEase(LeanTweenType.easeInOutSine)
	end

	slot15 = GetOrAddComponent(slot0._bg, "MultiTouchZoom")

	slot15:SetZoomTarget(slot0._paintingTF)

	slot16 = GetOrAddComponent(slot0._bg, "EventTriggerListener")
	slot17 = true
	slot15.enabled = true
	slot16.enabled = true
	slot18 = false

	slot16:AddPointDownFunc(function (slot0)
		if Input.touchCount == 1 or Application.isEditor then
			slot0 = true
			slot1 = true
		elseif Input.touchCount >= 2 then
			slot1 = false
			slot0 = false
		end
	end)
	slot16:AddPointUpFunc(function (slot0)
		if Input.touchCount <= 2 then
			slot0 = true
		end
	end)
	slot16:AddBeginDragFunc(function (slot0, slot1)
		slot0 = false
		slot5 = slot1.position.x *  - slot1.position.x - tf(slot4._paintingTF).localPosition.x.position.y * slot6 - slot7 - tf(slot4._paintingTF._paintingTF).localPosition.y
	end)
	slot16:AddDragFunc(function (slot0, slot1)
		if slot0 then
			tf(slot1._paintingTF).localPosition = Vector3(slot1.position.x * slot2 - slot3 - slot4, slot1.position.y * slot5 -  - slot1.position.y * slot5, -22)
		end
	end)
	onButton(slot0, slot0._bg, function ()
		slot0:hidePaintView()
	end, SFX_CANCEL)

	function slot0.hidePaintView(slot0, slot1)
		if not slot1 and not slot0 then
			return
		end

		slot1.enabled = false
		slot1.enabled = false

		RemoveComponent(slot0._bg, "Button")

		for slot5, slot6 in ipairs(slot0._bg) do
			setActive(slot6, true)
		end

		closePortrait()
		LeanTween.cancel(go(slot0._paintingTF))

		slot0._paintingTF.localScale = Vector3(1, 1, 1)

		setAnchoredPosition(slot0._paintingTF, {
			x = slot4,
			y = slot4
		})

		slot0.isInView = false

		setActive(slot0.clickTF, true)
	end
end

function slot0.recyclePainting(slot0)
	if slot0._shipVO then
		retPaintingPrefab(slot0._paintingTF, slot0._shipVO:getPainting())
	end
end

function slot0.openSelectPanel(slot0)
	removeAllChildren(slot0.shipContent)

	slot0.isOpenSelPanel = true
	slot0.selectIds = {}

	setActive(slot0.selectPanel, true)
	pg.UIMgr.GetInstance():BlurPanel(slot0.selectPanel)

	slot0.shipCards = {}
	slot1 = {}

	for slot5, slot6 in pairs(slot0.sameShipVOs) do
		table.insert(slot1, slot6)
	end

	table.sort(slot1, function (slot0, slot1)
		if slot0.level == slot1.level then
			if slot0:getStar() == slot1:getStar() then
				if ((slot0.inFleet and 1) or 0) == ((slot1.inFleet and 1) or 0) then
					return slot0.createTime < slot1.createTime
				else
					return slot5 < slot4
				end
			else
				return slot3 < slot2
			end
		else
			return slot1.level < slot0.level
		end
	end)

	for slot5, slot6 in ipairs(slot1) do
		slot8 = ShipDetailCard.New(cloneTplTo(slot0.shipCardTpl, slot0.shipContent).gameObject)

		slot8:update(slot6, slot0.contextData.skinId)

		slot0.shipCards[slot6.id] = slot8

		onToggle(slot0, slot8.tr, function (slot0)
			slot0:updateSelected(slot0)

			if slot0 then
				table.insert(slot1.selectIds, slot0.shipVO.id)
			else
				for slot4, slot5 in pairs(slot1.selectIds) do
					if slot5 == slot0.shipVO.id then
						table.remove(slot1.selectIds, slot4)

						break
					end
				end
			end
		end)
	end

	onButton(slot0, slot0.confirmChangeBtn, function ()
		if not slot0.selectIds or #slot0.selectIds <= 0 then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("new_skin_no_choose"),
				onYes = function ()
					slot0:emit(slot1.ON_CLOSE)
				end
			})

			return
		end

		slot0:emit(NewSkinMediator.SET_SKIN, slot0.selectIds, slot0.flagShipMark)
	end)
	onButton(slot0, slot0.selectPanelCloseBtn, function ()
		slot0:closeSelectPanel()
	end)
end

function slot0.updateShipCards(slot0)
	slot1 = pairs
	slot2 = slot0.shipCards or {}

	for slot4, slot5 in slot1(slot2) do
		if slot0.sameShipVOs[slot4] then
			slot5:update(slot6, slot0.contextData.skinId)
		end
	end
end

function slot0.closeSelectPanel(slot0)
	if slot0.isOpenSelPanel then
		slot0.isOpenSelPanel = nil

		setActive(slot0.selectPanel, false)
		pg.UIMgr.GetInstance():UnblurPanel(slot0.selectPanel, slot0._tf)
	end
end

function slot0.willExit(slot0)
	pg.TipsMgr.GetInstance():ShowTips(i18n("ship_newSkinLayer_get", pg.ship_data_statistics[slot0._skinConfig.ship_group * 10 + 1].name, HXSet.hxLan(slot0._skinConfig.name)), COLOR_GREEN)
	slot0:recyclePainting()
	pg.UIMgr.GetInstance():UnOverlayPanel(slot0._tf)

	if slot0._currentVoice then
		slot0._currentVoice:Stop(true)
	end

	slot0._currentVoice = nil

	if slot0.loadedCVBankName then
		pg.CriMgr.UnloadCVBank(slot0.loadedCVBankName)

		slot0.loadedCVBankName = nil
	end

	slot0:closeSelectPanel()
	cameraPaintViewAdjust(false)
end

return slot0
