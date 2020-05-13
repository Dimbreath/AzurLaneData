slot0 = class("ShipInfoScene", import("..base.BaseUI"))
slot1 = nil
slot2 = 0.2
slot3 = 0.3
slot4 = 3
slot5 = 0.5
slot6 = 11
slot0.UNLOCK_EQUPMENT_SKIN_POS = {
	1,
	2,
	3
}
slot0.PAGE = {
	EQUIPMENT = 2,
	DETAIL = 1,
	INTENSIFY = 3,
	REMOULD = 6,
	UPGRADE = 4,
	FASHION = 5
}

function slot0.getUIName(slot0)
	return "ShipInfoUI"
end

function slot0.preload(slot0, slot1)
	GetSpriteFromAtlasAsync("bg/star_level_bg_" .. getProxy(BayProxy):getShipById(slot0.contextData.shipId):getShipBgPrint(), "", slot1)
end

function slot0.setPlayer(slot0, slot1)
	slot0.player = slot1
end

function slot0.setShipList(slot0, slot1)
	slot0.shipList = slot1
end

function slot0.setEquipments(slot0, slot1)
	slot0.equipmentProxy = slot1
end

function slot0.setMaxLevelHelpFlag(slot0, slot1)
	slot0.maxLevelHelpFlag = slot1
end

function slot0.setShip(slot0, slot1)
	slot2 = false

	if slot0.shipVO and slot0.shipVO.id ~= slot1.id then
		if slot0._currentVoice then
			slot0._currentVoice:Stop(true)
		end

		slot0._currentVoice = nil

		if slot0.loadedCVBankName then
			pg.CriMgr.UnloadCVBank(slot0.loadedCVBankName)

			slot0.loadedCVBankName = nil
		end

		slot2 = true
	end

	slot0.shipVO = slot1

	slot0:updatePreference(slot1)
	slot0:updateDetail(slot1)
	slot0:updateEquipments(slot1)
	slot0:updateLock()
	slot0:updateFashion()

	if slot0.equipmentSkinPanel then
		slot0.equipmentSkinPanel:updateAll(slot0.shipVO)
	end

	if slot2 then
		if slot0.page == uv0.PAGE.INTENSIFY and slot0.intensifyToggle.gameObject.activeSelf and slot0.shipVO:isTestShip() then
			triggerToggle(slot0.detailToggle, true)
		end

		if slot0.page == uv0.PAGE.UPGRADE and slot0.upgradeToggle.gameObject.activeSelf and slot0.shipVO:isTestShip() then
			triggerToggle(slot0.detailToggle, true)
		end

		if slot0.page == uv0.PAGE.FASHION and not slot0.fashionToggle.gameObject.activeSelf then
			triggerToggle(slot0.fashionToggle, false)
			triggerToggle(slot0.detailToggle, true)
		end
	end

	setActive(slot0.npcFlagTF, slot1:isActivityNpc() and slot0.page ~= uv0.PAGE.UPGRADE)
	slot0:setToggleEnable()
end

function slot0.setToggleEnable(slot0)
	SetActive(slot0.detailToggle, true)
	SetActive(slot0.equipmentToggle, true)
	SetActive(slot0.upgradeToggle, not slot0.shipVO:isTestShip() and not slot0.shipVO:isBluePrintShip())
	SetActive(slot0.intensifyToggle, not slot0.shipVO:isTestShip() and not slot0.shipVO:isBluePrintShip())
	SetActive(slot0.remouldToggle, not slot0.shipVO:isTestShip() and not slot0.shipVO:isBluePrintShip() and pg.ship_data_trans[slot0.shipVO.groupId])
	SetActive(slot0.technologyToggle, slot0.shipVO:isBluePrintShip())
end

function slot0.setSkinList(slot0, slot1)
	slot0.skinList = slot1
end

function slot0.updateLock(slot0)
	if slot0.shipVO:GetLockState() == slot0.shipVO.LOCK_STATE_UNLOCK then
		setActive(slot0.lockBtn, true)
		setActive(slot0.unlockBtn, false)
	elseif slot1 == slot0.shipVO.LOCK_STATE_LOCK then
		setActive(slot0.lockBtn, false)
		setActive(slot0.unlockBtn, true)
	end
end

function slot0.updatePreferenceTag(slot0)
	triggerToggle(slot0.commonTagToggle, slot0.shipVO.preferenceTag == Ship.PREFERENCE_TAG_COMMON)
end

function slot0.setModPanel(slot0, slot1)
	slot0.modPanel = slot1
end

function slot0.init(slot0)
	slot0:initShip()
	slot0:initPages()

	slot0.topPanel = slot0.common:Find("top")
	slot1 = slot0:findTF("main")
	slot0.resource = slot1:Find("resource")
	slot0.mainPanel = slot1
	slot0.equipmentSkinPanel = EquipmentSkinPanel.New(slot1.gameObject, slot0.resource)

	slot0.equipmentSkinPanel:attach(slot0)
	slot0.equipmentSkinPanel:setLabelResource(slot0.resource)
	setActive(slot0.equipmentSkinPanel._go, true)

	slot0.customMsgbox = slot0:findTF("custom_msgbox")
	slot0.msgBoxItemPanel = slot0.customMsgbox:Find("frame/bg/item_panel")
	slot0.msgboxItemContains = slot0.customMsgbox:Find("frame/bg/item_panel/items")
	slot0.msgBoxItemTpl = slot0.msgboxItemContains:Find("equipmenttpl")
	slot0.msgBoxItemContent = slot0.customMsgbox:Find("frame/bg/item_panel/content")
	slot0.msgBoxItemContent1 = slot0.customMsgbox:Find("frame/bg/item_panel/content_num")
	slot0.msgBoxCancelBtn = slot0.customMsgbox:Find("frame/btns/cancel_btn")
	slot0.msgBoxConfirmBtn = slot0.customMsgbox:Find("frame/btns/confirm_btn")
	slot0.msgBoxContent = slot0.customMsgbox:Find("frame/bg/content")
	slot0.msgBtnBack = slot0.customMsgbox:Find("frame/top/btnBack")

	SetActive(slot0.customMsgbox, false)

	slot0.huntingRange = slot0:findTF("hunting_range")

	setActive(slot0.huntingRange, false)

	slot0.mainCanvasGroup = slot0._tf:GetComponent(typeof(CanvasGroup))
	slot0.commonCanvasGroup = slot0:findTF("blur_panel/adapt"):GetComponent(typeof(CanvasGroup))
	Input.multiTouchEnabled = false
end

function slot0.showAwakenCompleteAni(slot0, slot1)
	function slot2()
		uv0.awakenAni:SetActive(true)

		uv0.awakenPlay = true

		onButton(uv0, uv0.awakenAni, function ()
			uv0.awakenAni:GetComponent("Animator"):SetBool("endFlag", true)
		end)

		slot0 = tf(uv0.awakenAni)

		pg.UIMgr.GetInstance():BlurPanel(slot0)
		setText(uv0:findTF("window/desc", uv0.awakenAni), uv1)
		slot0:GetComponent("DftAniEvent"):SetEndEvent(function (slot0)
			uv0.awakenAni:GetComponent("Animator"):SetBool("endFlag", false)
			pg.UIMgr.GetInstance():UnblurPanel(uv1, uv0.common)
			uv0.awakenAni:SetActive(false)

			uv0.awakenPlay = false
		end)
	end

	if slot0:findTF("AwakenCompleteWindows(Clone)") then
		slot0.awakenAni = go(slot3)
	end

	if not slot0.awakenAni then
		PoolMgr.GetInstance():GetUI("AwakenCompleteWindows", true, function (slot0)
			slot0:SetActive(true)

			uv0.awakenAni = slot0

			uv1()
		end)
	else
		slot2()
	end
end

function slot0.showCustomMsgBox(slot0, slot1)
	slot0.isShowCustomMsgBox = true

	setActive(slot0.customMsgbox, true)
	pg.UIMgr.GetInstance():OverlayPanel(slot0.customMsgbox, {
		groupName = LayerWeightConst.GROUP_SHIPINFOUI
	})

	slot2 = slot1.items and #slot1.items > 0

	setActive(slot0.msgBoxItemPanel, slot2)
	setActive(slot0.msgBoxContent, not slot2)

	if slot2 then
		for slot8 = slot0.msgboxItemContains.childCount + 1, #slot1.items do
			cloneTplTo(slot0.msgBoxItemTpl, slot0.msgboxItemContains)
		end

		for slot8 = 1, slot0.msgboxItemContains.childCount do
			SetActive(slot0.msgboxItemContains:GetChild(slot8 - 1), slot8 <= #slot3)

			if slot8 <= #slot3 then
				slot10 = slot3[slot8]

				updateDrop(slot9, slot10)

				slot11 = 0

				if slot10.type == DROP_TYPE_RESOURCE then
					slot11 = slot0.player:getResById(slot10.id)
				elseif slot10.type == DROP_TYPE_ITEM then
					slot11 = getProxy(BagProxy):getItemCountById(slot10.id)
				end

				setText(slot9:Find("icon_bg/count"), slot11 .. "/" .. (slot11 < slot10.count and "<color=#ff5c5c>" .. slot10.count .. "</color>" or "<color=#92fc63FF>" .. slot10.count .. "</color>"))
			end
		end

		setText(slot0.msgBoxItemContent, slot1.content or "")
		setText(slot0.msgBoxItemContent1, slot1.content1 or "")
	else
		setText(slot0.msgBoxContent, slot1.content or "")
	end

	onButton(slot0, slot0.msgBoxConfirmBtn, function ()
		if uv0.onYes then
			uv0.onYes()
		else
			uv1:hideCustomMsgBox()
		end
	end, SFX_PANEL)
	SetActive(slot0.msgBoxCancelBtn, not defaultValue(slot1.hideNO, false))
	onButton(slot0, slot0.msgBoxCancelBtn, function ()
		if uv0.onCancel then
			uv0.onCancel()
		else
			uv1:hideCustomMsgBox()
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.customMsgbox, function ()
		uv0:hideCustomMsgBox()
	end, SFX_PANEL)
	onButton(slot0, slot0.msgBtnBack, function ()
		uv0:hideCustomMsgBox()
	end, SFX_CANCEL)
end

function slot0.hideCustomMsgBox(slot0)
	slot0.isShowCustomMsgBox = nil

	SetActive(slot0.customMsgbox, false)
end

function slot0.initShip(slot0)
	slot0.shipInfo = slot0:findTF("main/character")

	setActive(slot0.shipInfo, true)

	uv0 = rtf(slot0.shipInfo.parent).rect.width / 2 - 55
	slot0.painting = slot0:findTF("painting", slot0.shipInfo)
	slot0.painting2 = slot0:findTF("painting2", slot0.shipInfo)
	slot0.tablePainting = {
		slot0.painting,
		slot0.painting2
	}
	slot0.isRight = true
	slot0.blurPanel = slot0:findTF("blur_panel")
	slot0.common = slot0.blurPanel:Find("adapt")
	slot0.npcFlagTF = slot0.common:Find("name/npc")
	slot0.shipName = slot0.common:Find("name")

	setActive(slot0.shipName, true)

	slot0.shipInfoStarTpl = slot0.shipName:Find("star_tpl")

	setActive(slot0.shipInfoStarTpl, false)

	slot0.nameEditFlag = slot0.shipName:Find("nameRect/editFlag")

	setActive(slot0.nameEditFlag, false)

	slot0.energyTF = slot0.shipName:Find("energy")
	slot0.energyDescTF = slot0.energyTF:Find("desc")
	slot0.energyText = slot0.energyTF:Find("desc/desc")

	setActive(slot0.energyDescTF, false)

	slot0.intimacyTF = slot0:findTF("main/detail_panel/intimacy")

	if not slot0.intimacyTF then
		slot0.intimacyTF = slot0.shipName:Find("intimacy")
	end

	slot0.intimacyDescTF = slot0.intimacyTF:Find("desc")
	slot0.intimacyText = slot0.intimacyTF:Find("desc/desc")

	setActive(slot0.intimacyDescTF, false)

	slot0.intimacyHeart = slot0.intimacyTF:Find("heart")
	slot0.character = slot0:findTF("main/character")
	slot0.chat = slot0:findTF("main/character/chat")
	slot0.chatBg = slot0:findTF("main/character/chat/chatbgtop")
	slot0.chatText = slot0:findTF("main/character/chat/Text")
	rtf(slot0.chat).localScale = Vector3.New(0, 0, 1)
	slot0.initChatBgH = slot0.chatBg.sizeDelta.y

	pg.UIMgr.GetInstance():OverlayPanel(slot0.chat, {
		groupName = LayerWeightConst.GROUP_SHIPINFOUI
	})
end

function slot0.initPages(slot0)
	slot0.background = slot0:findTF("background")

	setActive(slot0.background, true)

	slot0.main = slot0:findTF("main")
	slot0.mainMask = slot0.main:GetComponent(typeof(RectMask2D))
	slot0.toggles = slot0:findTF("left_length/frame/root", slot0.common)
	slot0.detailToggle = slot0.toggles:Find("detail_toggle")
	slot0.equipmentToggle = slot0.toggles:Find("equpiment_toggle")
	slot0.upgradeToggle = slot0.toggles:Find("upgrade_toggle")
	slot0.intensifyToggle = slot0.toggles:Find("intensify_toggle")
	slot0.remouldToggle = slot0.toggles:Find("remould_toggle")
	slot0.technologyToggle = slot0.toggles:Find("technology_toggle")

	slot0:initDetail()
	slot0:initEquipment()
	slot0:initFashion()
end

function slot0.initDetail(slot0)
	slot0.detailPanel = slot0:findTF("main/detail_panel")

	setAnchoredPosition(slot0.detailPanel, {
		x = 1300
	})
	setActive(slot0.detailPanel, true)

	slot0.attrs = slot0.detailPanel:Find("attrs")

	setActive(slot0.attrs, true)

	slot0.shipDetailPanel = ShipDetailPanel.New(slot0.attrs, slot0)
	slot0.equipments = slot0.detailPanel:Find("equipments")
	slot0.equipmentsGrid = slot0.equipments:Find("equipments")
	slot0.detailEqupimentTpl = slot0.equipments:Find("equipment_tpl")
	slot0.emptyGridTpl = slot0.equipments:Find("empty_tpl")
	slot0.lockGridTpl = slot0.equipments:Find("lock_tpl")
	slot0.lockBtn = slot0.detailPanel:Find("lock_btn")
	slot0.unlockBtn = slot0.detailPanel:Find("unlock_btn")
	slot0.viewBtn = slot0.detailPanel:Find("view_btn")
	slot0.evaluationBtn = slot0.detailPanel:Find("evaluation_btn")
	slot0.profileBtn = slot0.detailPanel:Find("profile_btn")
	slot0.fashionToggle = slot0.detailPanel:Find("fashion_toggle")
	slot0.commonTagToggle = slot0.detailPanel:Find("common_toggle")
	slot0._renamePanel = slot0:findTF("changeName_panel")
	slot0._renameConfirmBtn = slot0._renamePanel:Find("frame/queren")
	slot0._renameCancelBtn = slot0._renamePanel:Find("frame/cancel")
	slot0._renameRevert = slot0._renamePanel:Find("frame/revert_button")
	slot0._renameCloseBtn = slot0._renamePanel:Find("frame/close_btn")
	slot0._tagBtn = slot0.detailPanel:Find("preference_btn")
	slot0._untagBtn = slot0.detailPanel:Find("unpreference_btn")
	slot0.showRecordBtn = slot0.equipments:Find("unload_all")
	slot0.recordPanel = slot0.detailPanel:Find("record_panel")
	slot0.recordBtns = {
		slot0.recordPanel:Find("frame/container/record_1/record_btn"),
		slot0.recordPanel:Find("frame/container/record_2/record_btn"),
		slot0.recordPanel:Find("frame/container/record_3/record_btn")
	}
	slot0.recordEquipmentsTFs = {
		slot0.recordPanel:Find("frame/container/record_1/equipments"),
		slot0.recordPanel:Find("frame/container/record_2/equipments"),
		slot0.recordPanel:Find("frame/container/record_3/equipments")
	}
	slot0.equipRecordBtns = {
		slot0.recordPanel:Find("frame/container/record_1/equip_btn"),
		slot0.recordPanel:Find("frame/container/record_2/equip_btn"),
		slot0.recordPanel:Find("frame/container/record_3/equip_btn")
	}

	setActive(slot0.recordPanel, false)
	setActive(slot0.detailEqupimentTpl, false)
	setActive(slot0.emptyGridTpl, false)
	setActive(slot0.lockGridTpl, false)
	setActive(slot0.detailPanel, true)
	onButton(slot0, slot0.equipments, function ()
		triggerToggle(uv0.equipmentToggle, true)
	end, SFX_PANEL)
	onButton(slot0, slot0.showRecordBtn, function ()
		if not uv0.isShowRecord then
			uv0:displayRecordPanel()
		else
			uv0:closeRecordPanel()
		end
	end, SFX_PANEL)
	onButton(slot0, slot0:findTF("frame/unload_all", slot0.recordPanel), function ()
		slot0, slot1 = Ship.canModifyShip(uv0.shipVO)

		if not slot0 then
			pg.TipsMgr:GetInstance():ShowTips(slot1)
		else
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("ship_unequip_all_tip"),
				onYes = function ()
					uv0:emit(ShipInfoMediator.UNEQUIP_FROM_SHIP_ALL, uv0.shipVO.id)
				end
			})
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.shipName, function ()
		if not uv0.shipVO.propose then
			return
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.shipName, function ()
		if uv0.shipVO.propose then
			if not pg.PushNotificationMgr.GetInstance():isEnableShipName() then
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_rename_switch_tip"))

				return
			end

			if uv0.shipVO.renameTime + 2592000 - pg.TimeMgr.GetInstance():GetServerTime() > 0 then
				if math.floor(slot0 / 60 / 60 / 24) < 1 then
					slot1 = 1
				end

				pg.TipsMgr.GetInstance():ShowTips(i18n("word_rename_time_tip", slot1))
			else
				uv0:DisplayRenamePanel(true)
			end
		end
	end, SFX_PANEL)
	onButton(slot0, slot0._renameConfirmBtn, function ()
		uv0:emit(ShipInfoMediator.RENAME_SHIP, uv0.shipVO.id, getInputText(findTF(uv0._renamePanel, "frame/name_field")))
	end, SFX_CONFIRM)
	onButton(slot0, slot0._renameRevert, function ()
		setInputText(findTF(uv0._renamePanel, "frame/name_field"), uv0.shipVO:isRemoulded() and HXSet.hxLan(pg.ship_skin_template[uv0.shipVO:getRemouldSkinId()].name) or pg.ship_data_statistics[uv0.shipVO.configId].name)
	end, SFX_PANEL)
	onButton(slot0, slot0._renameCloseBtn, function ()
		uv0:DisplayRenamePanel(false)
	end, SFX_PANEL)
	onButton(slot0, slot0._renameCancelBtn, function ()
		uv0:DisplayRenamePanel(false)
	end, SFX_CANCEL)
end

function slot0.DisplayRenamePanel(slot0, slot1)
	slot0.isOpenRenamePanel = slot1

	SetActive(slot0._renamePanel, slot1)

	if slot1 then
		pg.UIMgr.GetInstance():BlurPanel(slot0._renamePanel, false)
		setInputText(findTF(slot0._renamePanel, "frame/name_field"), getText(slot0:findTF("nameRect/name_mask/Text", slot0.shipName)))
	else
		pg.UIMgr.GetInstance():UnblurPanel(slot0._renamePanel, slot0._tf)
	end
end

function slot0.initEquipment(slot0)
	slot0.equipmentR = slot0:findTF("main/equipment_r")
	slot0.equipmentL = slot0:findTF("main/equipment_l")
	slot0.equipmentR1 = slot0.equipmentR:Find("equipment/equipment_r1")
	slot0.equipmentR2 = slot0.equipmentR:Find("equipment/equipment_r2")
	slot0.equipmentR3 = slot0.equipmentR:Find("equipment/equipment_r3")
	slot0.equipmentL1 = slot0.equipmentL:Find("equipment/equipment_l1")
	slot0.equipmentL2 = slot0.equipmentL:Find("equipment/equipment_l2")

	setAnchoredPosition(slot0.equipmentR, {
		x = 750
	})
	setActive(slot0.equipmentR, true)
	setAnchoredPosition(slot0.equipmentL, {
		x = -700
	})
	setActive(slot0.equipmentL, true)

	slot0.infoTplR = slot0.equipmentR1:Find("info")
	slot0.infoTplL = slot0.equipmentL1:Find("info")
	slot0.equipmentPanels = {
		slot0.equipmentR1,
		slot0.equipmentR2,
		slot0.equipmentR3,
		slot0.equipmentL1,
		slot0.equipmentL2
	}
	slot0.equipmentNames = {}

	for slot4, slot5 in ipairs(slot0.equipmentPanels) do
		if IsNil(slot5:Find("info")) then
			cloneTplTo(slot4 <= Ship.WEAPON_COUNT and slot0.infoTplR or slot0.infoTplL, slot5, "info")
		end

		table.insert(slot0.equipmentNames, ScrollTxt.New(slot5:Find("info/cont/name_mask"), slot5:Find("info/cont/name_mask/name")))
	end
end

function slot0.initFashion(slot0)
	slot0.stylePanel = slot0:findTF("main/style_display")

	setAnchoredPosition(slot0.stylePanel, {
		x = 900
	})
	setActive(slot0.stylePanel, true)

	slot0.styleScroll = slot0:findTF("style_scroll", slot0.stylePanel)
	slot0.styleContainer = slot0:findTF("view_port", slot0.styleScroll)
	slot0.styleCard = slot0:findTF("style_card", slot0.styleScroll)

	setActive(slot0.styleCard, false)

	slot0.fashionSkins = {}
	slot0.fashionCellMap = {}
	slot0.fashionGroup = 0
	slot0.fashionSkinId = 0
end

function slot0.updatePreference(slot0, slot1)
	slot0.scrollTxt = ScrollTxt.New(slot0.shipName:Find("nameRect/name_mask"), slot0.shipName:Find("nameRect/name_mask/Text"))

	slot0.scrollTxt:setText(slot0.shipVO:getName())
	setText(slot0:findTF("english_name", slot0.shipName), slot1:getConfigTable().english_name)
	setActive(slot0.nameEditFlag, slot1.propose)

	if not GetSpriteFromAtlas("energy", slot1:getEnergyPrint()) then
		warning("找不到疲劳")
	end

	setImageSprite(slot0.energyTF, slot4, true)
	setActive(slot0.energyTF, true)

	slot5, slot6, slot7 = slot1:getIntimacyDetail()

	setImageSprite(slot0.intimacyTF, GetSpriteFromAtlas("energy", slot5), true)
	setActive(slot0.intimacyTF, true)

	slot9 = 1

	if not LOCK_PROPOSE and slot6 <= slot7 and not slot0.shipVO.propose then
		setActive(slot0.intimacyHeart, true)

		slot9 = 0
	else
		setActive(slot0.intimacyHeart, false)
	end

	slot0.intimacyTF:GetComponent(typeof(Image)).color = Color.New(1, 1, 1, slot9)

	removeAllChildren(slot0:findTF("stars", slot0.shipName))

	slot11 = slot1:getStar()

	for slot16 = 1, slot1:getMaxStar() do
		cloneTplTo(slot0.shipInfoStarTpl, slot10, "star_" .. slot16)
	end

	for slot17 = 1, slot12 - slot11 do
		slot18 = slot10:GetChild(slot17 - 1)

		setActive(slot18:Find("star_tpl"), false)
		setActive(slot18:Find("empty_star_tpl"), true)
	end

	if slot0.page ~= uv0.PAGE.FASHION then
		slot0:loadPainting(slot0.shipVO:getPainting())
		slot0:loadSkinBg(slot0.shipVO:rarity2bgPrintForGet(), slot0.shipVO:isBluePrintShip())
	end

	if not GetSpriteFromAtlas("shiptype", slot1:getShipType()) then
		warning("找不到船形, shipConfigId: " .. slot1.configId)
	end

	setImageSprite(slot0:findTF("type", slot0.shipName), slot14, true)
end

function slot0.updateDetail(slot0, slot1)
	slot0.shipDetailPanel:flush(slot1)
	removeOnButton(slot0.shipDetailPanel.attrs:Find("icons/hunting_range/bg"))

	if table.contains(TeamType.SubShipType, slot1:getShipType()) then
		onButton(slot0, slot2, function ()
			uv0:displayHuntingRange(uv1)
		end, SFX_PANEL)
	end
end

function slot0.displayHuntingRange(slot0, slot1)
	setActive(slot0.huntingRange, true)
	slot0:updateHuntingRange(slot1, slot1:getHuntingLv())
	setText(slot0.huntingRange:Find("frame/current_level"), "Lv." .. slot1:getHuntingLv())
	setText(slot0.huntingRange:Find("frame/tips"), i18n("ship_hunting_level_tips"))
	onButton(slot0, slot0.huntingRange:Find("frame/close_btn"), function ()
		uv0:hideHuntingRange()
	end, SFX_CANCEL)
	onButton(slot0, slot0.huntingRange:Find("frame/help"), function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_shipinfo_hunting.tip
		})
	end, SFX_PANEL)
	pg.UIMgr.GetInstance():BlurPanel(slot0.huntingRange)
end

function slot0.updateHuntingRange(slot0, slot1, slot2)
	for slot7 = 0, slot0.huntingRange:Find("frame/range").childCount - 1 do
		setActive(slot0:findTF("activate", slot3:GetChild(slot7)), false)
	end

	_.each(slot1:getHuntingRange(slot2), function (slot0)
		if uv0:GetChild(slot0[1] * 7 + slot0[2] + math.floor(24.5)) and slot3 ~= 24 then
			setActive(uv1:findTF("activate", slot4), true)
		end
	end)

	slot6 = slot0.huntingRange:Find("frame/next")

	setActive(slot0.huntingRange:Find("frame/last"), slot2 > 1)
	setActive(slot6, slot2 < #slot1:getConfig("hunting_range"))
	setText(slot0.huntingRange:Find("frame/level/Text"), "Lv." .. slot2)
	onButton(slot0, slot5, function ()
		if uv0 - 1 == 0 then
			slot0 = #uv1:getConfig("hunting_range")
		end

		uv2:updateHuntingRange(uv1, slot0)
	end, SFX_PANEL)
	onButton(slot0, slot6, function ()
		if uv0 + 1 == #uv1:getConfig("hunting_range") + 1 then
			slot0 = 1
		end

		uv2:updateHuntingRange(uv1, slot0)
	end, SFX_PANEL)
end

function slot0.hideHuntingRange(slot0)
	setActive(slot0.huntingRange, false)
	pg.UIMgr.GetInstance():UnblurPanel(slot0.huntingRange, slot0._tf)
end

function slot0.doUpgradeMaxLeveAnim(slot0, slot1, slot2, slot3)
	slot0.inUpgradeAnim = true

	slot0.shipDetailPanel:doLeveUpAnim(slot1, slot2, function ()
		if uv0 then
			uv0()
		end

		uv1.inUpgradeAnim = nil
	end)
end

function slot0.updateEquipments(slot0, slot1)
	removeAllChildren(slot0.equipmentsGrid)

	for slot6, slot7 in ipairs(slot1.equipments) do
		slot8 = slot1:getActiveEquipments()[slot6]
		slot9 = nil

		if slot7 then
			slot9 = cloneTplTo(slot0.detailEqupimentTpl, slot0.equipmentsGrid)

			updateEquipment(slot0:findTF("IconTpl", slot9), slot7)
			onButton(slot0, slot9, function ()
				uv0:emit(uv1.ON_EQUIPMENT, {
					type = EquipmentInfoMediator.TYPE_SHIP,
					shipId = uv0.shipVO.id,
					pos = uv2
				})
			end, SFX_UI_DOCKYARD_EQUIPADD)
		else
			onButton(slot0, cloneTplTo(slot0.emptyGridTpl, slot0.equipmentsGrid), function ()
				triggerToggle(uv0.equipmentToggle, true)
			end, SFX_UI_DOCKYARD_EQUIPADD)
		end

		slot0:updateEquipmentPanel(slot6, slot7, slot8)
	end
end

function slot0.updateEquipmentPanel(slot0, slot1, slot2, slot3)
	slot4 = slot0.equipmentPanels[slot1]
	slot5 = findTF(slot4, "info")
	slot7 = findTF(slot5, "efficiency")

	setActive(slot5, slot2)
	setActive(findTF(slot4, "empty"), not slot2)

	slot8 = nil

	for slot12, slot13 in pairs(slot0.shipVO.skills) do
		if ys.Battle.BattleDataFunction.GetBuffTemplate(slot13.id, slot13.level).shipInfoScene and slot14.shipInfoScene.equip then
			slot8 = slot14.shipInfoScene.equip
		end
	end

	slot9 = findTF(slot4, "panel_title/type")

	if findTF(slot4, "skin_icon") then
		setActive(slot10, slot2 and slot2:hasSkin())
	end

	slot9:GetComponent(typeof(Image)).sprite = slot0:findTF(EquipType.Types2Title(slot1, slot0.shipVO.configId), slot0.resource):GetComponent(typeof(Image)).sprite

	slot9:GetComponent(typeof(Image)):SetNativeSize()

	if slot2 then
		setActive(slot7, slot2.config.type ~= EquipType.Equipment and slot2.config.type ~= EquipType.Sonar and slot2.config.type ~= EquipType.AntiSubAircraft)

		if slot2.config.type ~= EquipType.Equipment then
			slot13 = pg.ship_data_statistics[slot0.shipVO.configId]
			slot15 = slot0.shipVO:getEquipProficiencyByPos(slot1) and slot14 * 100 or 0

			if slot8 then
				if slot8.type and not table.contains(slot8.type, slot2.config.type) then
					slot16 = 1 * 0
				end

				if slot8.nationality and not table.contains(slot8.nationality, slot2.config.nationality) then
					slot16 = slot16 * 0
				end

				if slot16 == 1 then
					slot15 = slot15 + slot8.number
				end
			end

			setButtonText(slot7, slot15 .. "%")
		end

		updateEquipment(slot0:findTF("IconTpl", slot5), slot2)

		slot14 = slot2.config.name

		if slot2.config.ammo_icon[1] then
			setActive(findTF(slot5, "cont/icon_ammo"), true)
			setImageSprite(findTF(slot5, "cont/icon_ammo"), GetSpriteFromAtlas("ammo", slot2.config.ammo_icon[1]))
		else
			setActive(findTF(slot5, "cont/icon_ammo"), false)
		end

		function slot15(slot0, slot1)
			slot2 = uv0:GetSkill()

			setActive(slot0, slot2)
			setActive(slot1, not slot2)

			if slot2 then
				setText(findTF(slot0, "values/value"), slot2.name)
				setText(findTF(slot0, "values/value_1"), "")
			end
		end

		if findTF(slot5, "attrs/attr_3_1") then
			setActive(slot16, slot2.config.type == EquipType.Equipment and slot1 <= 3)
		end

		slot0.equipmentNames[slot1]:setText(slot14)

		slot17 = slot2:GetProperties()
		slot18 = false

		for slot22 = 1, 4 do
			if findTF(slot5, "attrs/attr_" .. slot22) then
				slot24 = findTF(slot23, "panel")
				slot25 = findTF(slot23, "lock")

				if slot2.config.type == EquipType.Equipment and slot1 <= 3 and slot22 == 3 then
					slot18 = true

					setActive(slot16, true)
					SetActive(slot23, false)
					slot15(findTF(slot16, "panel"), findTF(slot16, "lock"))
				elseif slot2.config.type == EquipType.Equipment and slot22 == 3 then
					SetActive(slot23, true)
					slot15(slot24, slot25)
				elseif slot18 == true and slot22 == 4 then
					SetActive(slot23, false)
				else
					SetActive(slot23, true)

					slot26 = slot17[slot22]

					setActive(slot24, slot26)
					setActive(slot25, not slot26)

					if slot26 then
						if slot2.config.type ~= EquipType.Equipment and slot26.type == AttributeType.Reload and slot22 == 4 then
							setText(findTF(slot24, "tag"), AttributeType.Type2Name(AttributeType.CD))
							setText(findTF(slot24, "values/value"), setColorStr(slot0.shipVO:getWeaponCD(slot1) .. "s", COLOR_YELLOW))
							setText(findTF(slot24, "values/value_1"), i18n("word_secondseach"))
						else
							setText(slot27, AttributeType.Type2Name(slot26.type))
							setText(slot28, slot26.value)
							setText(slot29, "")
						end
					end
				end
			end
		end

		onButton(slot0, slot4, function ()
			uv0:emit(uv1.ON_EQUIPMENT, {
				type = EquipmentInfoMediator.TYPE_SHIP,
				shipId = uv0.shipVO.id,
				pos = uv2
			})
		end, SFX_UI_DOCKYARD_EQUIPADD)
	else
		onButton(slot0, slot4, function ()
			if uv0.shipVO then
				slot0, slot1 = Ship.canModifyShip(uv0.shipVO)

				if not slot0 then
					pg.TipsMgr:GetInstance():ShowTips(slot1)

					return
				end

				uv0:emit(ShipInfoMediator.ON_SELECT_EQUIPMENT, uv1)
			end
		end, SFX_UI_DOCKYARD_EQUIPADD)
	end
end

function slot0.getGroupSkinList(slot0, slot1)
	slot2 = ShipGroup.getSkinList(slot1)

	if pg.ship_data_trans[slot1] and not slot0.shipVO:isRemoulded() then
		for slot7 = #slot2, 1, -1 do
			if slot2[slot7].id == ShipGroup.GetGroupConfig(slot1).trans_skin then
				table.remove(slot2, slot7)

				break
			end
		end
	end

	for slot6 = #slot2, 1, -1 do
		if slot2[slot6].show_time and (type(slot7.show_time) == "string" and slot7.show_time == "stop" or type(slot7.show_time) == "table" and not pg.TimeMgr:GetInstance():inTime(slot7.show_time)) then
			table.remove(slot2, slot6)
		end
	end

	if PLATFORM_CODE == PLATFORM_CH then
		for slot7 = #slot2, 1, -1 do
			if slot2[slot7].skin_type == 3 and pg.gameset.big_seven_old_skin_timestamp.key_value < slot0.shipVO.createTime then
				table.remove(slot2, slot7)
			end
		end
	end

	if HXSet.isHx() then
		for slot6 = #slot2, 1, -1 do
			if pg.ship_skin_template[slot2[slot6].id].isHX == 1 then
				table.remove(slot2, slot6)
			end
		end
	end

	return slot2
end

function slot0.updateFashion(slot0)
	setActive(slot0.fashionToggle, #slot0:getGroupSkinList(slot0.shipVO.groupId) > 1)

	if slot0.page ~= uv0.PAGE.FASHION or #slot2 <= 1 then
		return
	end

	if true or slot0.fashionGroup ~= slot1 then
		slot0.fashionGroup = slot1
		slot0.fashionSkins = slot2

		for slot6 = slot0.styleContainer.childCount, #slot0.fashionSkins - 1 do
			cloneTplTo(slot0.styleCard, slot0.styleContainer)
		end

		for slot6 = #slot0.fashionSkins, slot0.styleContainer.childCount - 1 do
			setActive(slot0.styleContainer:GetChild(slot6), false)
		end

		for slot6, slot7 in ipairs(slot0.fashionSkins) do
			slot8 = slot0.fashionSkins[slot6]

			if not slot0.fashionCellMap[slot0.styleContainer:GetChild(slot6 - 1)] then
				slot0.fashionCellMap[slot9] = ShipSkinCard.New(slot9.gameObject)
			end

			slot10:updateData(slot0.shipVO, slot8, slot0.shipVO:proposeSkinOwned(slot8) or table.contains(slot0.skinList, slot8.id) or slot0.shipVO:getRemouldSkinId() == slot8.id and slot0.shipVO:isRemoulded() or slot8.skin_type == 3)
			slot10:updateUsing(slot0.shipVO.skinId == slot8.id)
			onButton(slot0, slot9, function ()
				if uv0.page ~= uv1.PAGE.FASHION then
					return
				end

				uv0.fashionSkinId = uv2.id

				uv0:updateFashionDetail(uv2)

				if not HXSet.isHx() then
					uv0:loadPainting(uv2.painting)
					uv0:loadSkinBg(uv0.shipVO:rarity2bgPrintForGet(), uv0.shipVO:isBluePrintShip())
				elseif uv2.isSwimsuit ~= 1 then
					uv0:loadPainting(uv2.painting_hx ~= "" and uv2.painting_hx or uv2.painting)
					uv0:loadSkinBg(uv0.shipVO:rarity2bgPrintForGet(), uv0.shipVO:isBluePrintShip())
				end

				for slot3, slot4 in ipairs(uv0.fashionSkins) do
					slot6 = uv0.fashionCellMap[uv0.styleContainer:GetChild(slot3 - 1)]

					slot6:updateSelected(slot4.id == uv0.fashionSkinId)
					slot6:updateUsing(uv0.shipVO.skinId == slot4.id)
				end
			end)
			setActive(slot9, true)
		end
	end

	if slot0.fashionSkinId == 0 then
		slot0.fashionSkinId = slot0.shipVO.skinId
	end

	slot3 = slot0.styleContainer:GetChild(0)

	for slot7, slot8 in ipairs(slot0.fashionSkins) do
		if slot8.id == slot0.fashionSkinId then
			slot3 = slot0.styleContainer:GetChild(slot7 - 1)

			break
		end
	end

	triggerButton(slot3)
end

function slot0.resetFashion(slot0)
	slot0.fashionSkinId = 0
end

function slot0.updateFashionDetail(slot0, slot1)
	if not slot0.fashionDetailWrapper then
		slot2 = {
			name = findTF(slot0.stylePanel, "style_desc/name_bg/name"),
			descTxt = findTF(slot0.stylePanel, "style_desc/desc_frame/desc/Text"),
			character = findTF(slot0.stylePanel, "style_desc/character"),
			confirm = findTF(slot0.stylePanel, "confirm_button"),
			cancel = findTF(slot0.stylePanel, "cancel_button")
		}
		slot2.diamond = findTF(slot2.confirm, "diamond")
		slot2.using = findTF(slot2.confirm, "using")
		slot2.change = findTF(slot2.confirm, "change")
		slot2.buy = findTF(slot2.confirm, "buy")
		slot2.activity = findTF(slot2.confirm, "activity")
		slot2.cantbuy = findTF(slot2.confirm, "cantbuy")
		slot2.prefab = "unknown"
		slot0.fashionDetailWrapper = slot2
	end

	setText(slot2.name, HXSet.hxLan(slot1.name))
	setText(slot2.descTxt, HXSet.hxLan(slot1.desc))

	if #slot2.descTxt:GetComponent(typeof(Text)).text > 50 then
		slot3.alignment = TextAnchor.MiddleLeft
	else
		slot3.alignment = TextAnchor.MiddleCenter
	end

	if slot2.prefab ~= slot1.prefab then
		if not IsNil(slot2.character:Find(slot2.prefab)) then
			PoolMgr.GetInstance():ReturnSpineChar(slot2.prefab, slot4.gameObject)
		end

		slot2.prefab = slot1.prefab

		PoolMgr.GetInstance():GetSpineChar(slot2.prefab, true, function (slot0)
			if uv0.prefab ~= uv1 then
				PoolMgr.GetInstance():ReturnSpineChar(uv1, slot0)
			else
				slot0.name = uv1
				slot0.transform.localPosition = Vector3.zero
				slot0.transform.localScale = Vector3(0.5, 0.5, 1)

				slot0.transform:SetParent(uv0.character, false)
				slot0:GetComponent(typeof(SpineAnimUI)):SetAction(uv2.show_skin or "stand", true)
			end
		end)
	end

	slot5 = (slot0.shipVO:proposeSkinOwned(slot1) or table.contains(slot0.skinList, slot1.id) or slot0.shipVO:getRemouldSkinId() == slot1.id and slot0.shipVO:isRemoulded()) and 1 or 0
	slot6 = slot1.shop_id > 0 and pg.shop_template[slot1.shop_id] or nil
	slot7 = false

	if HXSet.isHx() and slot6 then
		slot7 = pg.shop_template[slot6.id].isHX == 1
	end

	slot8 = slot6 and not pg.TimeMgr.GetInstance():inTime(slot6.time)
	slot10 = slot1.id == slot0.shipVO:getConfig("skin_id") or slot5 >= 1 or slot1.skin_type == 3

	setGray(slot2.confirm, false)
	setActive(slot2.using, false)
	setActive(slot2.change, false)
	setActive(slot2.buy, false)

	if slot1.id == slot0.shipVO.skinId then
		setActive(slot2.using, true)
	elseif slot10 then
		setActive(slot2.change, true)
	elseif slot6 then
		setActive(slot2.buy, true)
		setGray(slot2.confirm, slot8 or slot7)
	else
		setActive(slot2.change, true)
		setGray(slot2.confirm, true)
	end

	onButton(slot0, slot2.confirm, function ()
		if uv0 then
			-- Nothing
		elseif uv1 then
			if HXSet.isHx() and uv2.isSwimsuit == 1 then
				uv3:loadPainting(uv2.painting_hx ~= "" and uv2.painting_hx or uv2.painting)
				uv3:loadSkinBg(uv3.shipVO:rarity2bgPrintForGet(), uv3.shipVO:isBluePrintShip())

				for slot3, slot4 in ipairs(uv3.fashionSkins) do
					slot6 = uv3.fashionCellMap[uv3.styleContainer:GetChild(slot3 - 1)]

					slot6:updateSelected(slot4.id == uv3.fashionSkinId)
					slot6:updateUsing(uv3.shipVO.skinId == slot4.id)
				end
			end

			uv3:emit(ShipInfoMediator.CHANGE_SKIN, uv3.shipVO.id, uv2.id == uv3.shipVO:getConfig("skin_id") and 0 or uv2.id)
		elseif uv4 then
			if uv5 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_skin_out_of_stock"))
			else
				slot0 = true

				if HXSet.isHx() then
					slot0 = pg.shop_template[uv4.id].isHX ~= 1
				end

				if slot0 then
					slot1 = Goods.New({
						shop_id = uv4.id
					}, Goods.TYPE_SKIN)

					if slot1:isDisCount() then
						slot2 = slot1:getConfig("resource_num") * (100 - slot1:getConfig("discount")) / 100
					end

					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = i18n("text_buy_fashion_tip", slot2, HXSet.hxLan(uv2.name)),
						onYes = function ()
							uv0:emit(ShipInfoMediator.BUY_ITEM, uv1.id, 1)
						end
					})
				end
			end
		end
	end)
	onButton(slot0, slot2.cancel, function ()
		triggerToggle(uv0.detailToggle, true)
	end)
end

function slot0.clearFashion(slot0)
	if slot0.fashionDetailWrapper then
		slot1 = slot0.fashionDetailWrapper

		if not IsNil(slot1.character:Find(slot1.prefab)) then
			PoolMgr.GetInstance():ReturnSpineChar(slot1.prefab, slot2.gameObject)
		end
	end

	slot0.fashionDetailWrapper = nil

	for slot4, slot5 in pairs(slot0.fashionCellMap) do
		slot5:clear()
	end

	slot0.fashionCellMap = {}
	slot0.fashionSkins = {}
	slot0.fashionGroup = 0
	slot0.fashionSkinId = 0
end

function slot0.addRingDragListenter(slot0)
	slot1 = GetOrAddComponent(slot0._tf, "EventTriggerListener")
	slot2 = nil
	slot3 = 0
	slot4 = nil

	slot1:AddBeginDragFunc(function ()
		uv0 = 0
		uv1 = nil
	end)
	slot1:AddDragFunc(function (slot0, slot1)
		if not uv0.inPaintingView then
			slot2 = slot1.position

			if not uv1 then
				uv1 = slot2
			end

			uv2 = slot2.x - uv1.x
		end
	end)
	slot1:AddDragEndFunc(function (slot0, slot1)
		if not uv0.inPaintingView then
			if uv1 < -50 then
				if not uv0.isLoading then
					uv0:emit(ShipInfoMediator.NEXTSHIP, -1)
				end
			elseif uv1 > 50 and not uv0.isLoading then
				uv0:emit(ShipInfoMediator.NEXTSHIP)
			end
		end
	end)
end

function slot0.didEnter(slot0)
	slot0:addRingDragListenter()
	onButton(slot0, slot0:findTF("top/back_btn", slot0.common), function ()
		GetOrAddComponent(uv0._tf, typeof(CanvasGroup)).interactable = false

		LeanTween.delayedCall(0.3, System.Action(function ()
			uv0:emit(uv1.ON_BACK)
		end))
	end, SFX_CANCEL)
	onButton(slot0, slot0:findTF("main/detail_panel/attrs/attrs/property/icons"), function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_shipinfo_attr.tip,
			onClose = function ()
			end
		})
	end)
	onButton(slot0, slot0.npcFlagTF, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_shipinfo_actnpc.tip
		})
	end, SFX_PANEL)

	slot0.helpBtn = slot0:findTF("help_btn", slot0.common)

	onButton(slot0, slot0.helpBtn, function ()
		if uv0.page == uv1.PAGE.EQUIPMENT then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_HELP,
				helps = pg.gametip.help_shipinfo_equip.tip
			})
		elseif uv0.page == uv1.PAGE.DETAIL then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_HELP,
				helps = pg.gametip.help_shipinfo_detail.tip
			})
		elseif uv0.page == uv1.PAGE.INTENSIFY then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_HELP,
				helps = pg.gametip.help_shipinfo_intensify.tip
			})
		elseif uv0.page == uv1.PAGE.UPGRADE then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_HELP,
				helps = pg.gametip.help_shipinfo_upgrate.tip
			})
		elseif uv0.page == uv1.PAGE.FASHION then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_HELP,
				helps = pg.gametip.help_shipinfo_fashion.tip
			})
		end
	end, SFX_PANEL)

	slot0.equipSkinBtn = slot0:findTF("main/equipment_r/equipment_skin_btn")

	setActive(slot0.equipSkinBtn, not LOCK_EQUIP_SKIN)
	onButton(slot0, slot0.equipSkinBtn, function ()
		slot0, slot1 = Ship.canModifyShip(uv0.shipVO)

		if not slot0 then
			pg.TipsMgr:GetInstance():ShowTips(slot1)

			return
		end

		slot2 = uv0.shipVO.equipments

		if _.all(uv1.UNLOCK_EQUPMENT_SKIN_POS, function (slot0)
			return not uv0[slot0]
		end) then
			pg.TipsMgr:GetInstance():ShowTips(i18n("equipment_skin_no_equipment_tip"))

			return
		end

		uv0:switch2EquipmentSkinPage()
	end)

	if slot0.contextData.isInEquipmentSkinPage then
		slot0.contextData.isInEquipmentSkinPage = nil

		triggerButton(slot0.equipSkinBtn)
	end

	slot0.togglesList = {
		slot0.detailToggle,
		slot0.equipmentToggle,
		slot0.intensifyToggle,
		slot0.upgradeToggle,
		slot0.fashionToggle,
		slot0.remouldToggle
	}
	slot1 = {
		uv0.PAGE.DETAIL,
		uv0.PAGE.EQUIPMENT,
		uv0.PAGE.INTENSIFY,
		uv0.PAGE.UPGRADE,
		uv0.PAGE.FASHION,
		uv0.PAGE.REMOULD
	}

	for slot5, slot6 in ipairs(slot0.togglesList) do
		if slot6 == slot0.upgradeToggle or slot6 == slot0.remouldToggle then
			onToggle(slot0, slot6, function (slot0)
				if slot0 then
					if LeanTween.isTweening(go(uv0.chat)) then
						LeanTween.cancel(go(uv0.chat))
					end

					rtf(uv0.chat).localScale = Vector3.New(0, 0, 1)
					uv0.chatFlag = false

					uv0:switchToPage(uv1[uv2])
				end
			end, SFX_PANEL)
		else
			onToggle(slot0, slot6, function (slot0)
				if slot0 then
					uv0:switchToPage(uv1[uv2])
				end
			end, SFX_PANEL)
		end
	end

	onButton(slot0, slot0.technologyToggle, function ()
		uv0:emit(ShipInfoMediator.ON_TECHNOLOGY, uv0.shipVO)
	end, SFX_PANEL)
	onToggle(slot0, slot0.commonTagToggle, function (slot0)
		if uv0.shipVO.preferenceTag == Ship.PREFERENCE_TAG_COMMON ~= slot0 then
			uv0:emit(ShipInfoMediator.ON_TAG, uv0.shipVO.id, (slot1 ~= Ship.PREFERENCE_TAG_COMMON or Ship.PREFERENCE_TAG_NONE) and Ship.PREFERENCE_TAG_COMMON)
		end
	end)
	slot0:updatePreferenceTag()
	onButton(slot0, slot0.lockBtn, function ()
		uv0:emit(ShipInfoMediator.ON_LOCK, {
			uv0.shipVO.id
		}, uv0.shipVO.LOCK_STATE_LOCK)
	end, SFX_PANEL)
	onButton(slot0, slot0.unlockBtn, function ()
		uv0:emit(ShipInfoMediator.ON_LOCK, {
			uv0.shipVO.id
		}, uv0.shipVO.LOCK_STATE_UNLOCK)
	end, SFX_PANEL)
	onButton(slot0, slot0.viewBtn, function ()
		Input.multiTouchEnabled = true

		uv0:paintView()
	end, SFX_PANEL)
	onButton(slot0, tf(slot0.character), function ()
		if uv0.page ~= uv1.PAGE.FASHION then
			uv0:displayShipWord("detail")
		end
	end)
	onButton(slot0, slot0.evaluationBtn, function ()
		uv0:emit(ShipInfoMediator.OPEN_EVALUATION, uv0.shipVO:getGroupId(), uv0.shipVO:isActivityNpc())
	end, SFX_PANEL)
	onButton(slot0, slot0.profileBtn, function ()
		uv0:emit(ShipInfoMediator.OPEN_SHIPPROFILE, uv0.shipVO:getGroupId(), uv0.shipVO:isActivityNpc())
	end, SFX_PANEL)
	onButton(slot0, slot0.energyTF, function ()
		uv0:showEnergyDesc()
	end)
	onButton(slot0, slot0.intimacyTF, function ()
		if uv0.shipVO:isActivityNpc() then
			pg.TipsMgr:GetInstance():ShowTips(i18n("npc_propse_tip"))

			return
		end

		if uv0.chatFlag then
			if uv0.chatani1Id then
				LeanTween.cancel(uv0.chatani1Id)
			end

			if uv0.chatani2Id then
				LeanTween.cancel(uv0.chatani2Id)
			end

			LeanTween.scale(rtf(uv0.chat.gameObject), Vector3.New(0, 0, 1), uv1):setEase(LeanTweenType.easeInBack):setOnComplete(System.Action(function ()
				uv0.chatFlag = nil
			end))
		end

		if uv0._currentVoice then
			uv0._currentVoice:Stop(true)
		end

		if uv0.chatFlag then
			if uv0.chatani1Id then
				LeanTween.cancel(uv0.chatani1Id)
			end

			if uv0.chatani2Id then
				LeanTween.cancel(uv0.chatani2Id)
			end

			LeanTween.scale(rtf(uv0.chat.gameObject), Vector3.New(0, 0, 1), uv1):setEase(LeanTweenType.easeInBack):setOnComplete(System.Action(function ()
				uv0.chatFlag = nil
			end))
		end

		uv0:emit(ShipInfoMediator.PROPOSE, uv0.shipVO.id, function ()
		end)
	end)
	pg.UIMgr.GetInstance():OverlayPanel(slot0.blurPanel, {
		groupName = LayerWeightConst.GROUP_SHIPINFOUI
	})

	if not slot0.togglesList[defaultValue(slot0.contextData.page, uv0.PAGE.DETAIL)].gameObject.activeSelf then
		slot2 = uv0.PAGE.DETAIL
	end

	triggerToggle(slot0.togglesList[slot2], true)

	if slot0.page == uv0.PAGE.DETAIL then
		slot0:displayShipWord(slot0:getInitmacyWords())
		slot0:checkMaxLevelHelp()
	end
end

function slot0.onBackPressed(slot0)
	if slot0.inUpgradeAnim then
		return
	end

	if slot0.awakenPlay then
		return
	end

	if slot0.isOpenRenamePanel then
		slot0:DisplayRenamePanel(false)

		return
	end

	if slot0.isShowCustomMsgBox then
		slot0:hideCustomMsgBox()

		return
	end

	if isActive(slot0.huntingRange) then
		slot0:hideHuntingRange()

		return
	end

	if slot0.inPaintingView then
		slot0:hidePaintView(true)

		return
	end

	playSoundEffect(SFX_CANCEL)
	triggerButton(slot0:findTF("top/back_btn", slot0.common))
end

function slot0.showEnergyDesc(slot0)
	if slot0.energyTimer then
		return
	end

	setActive(slot0.energyDescTF, true)

	if slot0.intimacyTimer then
		slot0.intimacyTimer:Stop()

		slot0.intimacyTimer = nil
	end

	setActive(slot0.intimacyDescTF, false)

	slot1, slot2 = slot0.shipVO:getEnergyPrint()

	setText(slot0.energyText, i18n(slot2))

	slot0.energyTimer = Timer.New(function ()
		setActive(uv0.energyDescTF, false)
		uv0.energyTimer:Stop()

		uv0.energyTimer = nil
	end, 2, 1)

	slot0.energyTimer:Start()
end

function slot0.showIntimacyDesc(slot0)
	if slot0.intimacyTimer then
		return
	end

	setActive(slot0.intimacyDescTF, true)

	if slot0.energyTimer then
		slot0.energyTimer:Stop()

		slot0.energyTimer = nil
	end

	setActive(slot0.energyDescTF, false)

	slot1, slot2 = slot0.shipVO:getInitmacyInfo()

	setText(slot0.intimacyText, i18n(slot2, slot0.shipVO:getConfigTable().name))

	slot0.intimacyTimer = Timer.New(function ()
		setActive(uv0.intimacyDescTF, false)
		uv0.intimacyTimer:Stop()

		uv0.intimacyTimer = nil
	end, 2, 1)

	slot0.intimacyTimer:Start()
end

function slot0.displayShipWord(slot0, slot1, slot2)
	if slot0.page == uv0.PAGE.EQUIPMENT then
		rtf(slot0.chat).localScale = Vector3.New(0, 0, 1)

		return
	end

	if slot2 or not slot0.chatFlag then
		slot0.chatFlag = true
		slot0.chat.localScale = Vector3.zero

		setActive(slot0.chat, true)

		slot0.chat.localPosition = Vector3(slot0.character.localPosition.x, slot0.chat.localPosition.y, 0)

		slot0.chat:SetAsLastSibling()

		if findTF(slot0.painting, "fitter").childCount > 0 then
			Ship.SetExpression(findTF(slot0.painting, "fitter"):GetChild(0), slot0.paintingCode, slot1)
		end

		slot3, slot4 = Ship.getWords(slot0.shipVO.skinId, slot1)

		setText(slot0.chatText, slot3)

		slot5 = uv1

		function slot6()
			if uv0.chatFlag then
				if uv0.chatani1Id then
					LeanTween.cancel(uv0.chatani1Id)
				end

				if uv0.chatani2Id then
					LeanTween.cancel(uv0.chatani2Id)
				end
			end

			uv0.chatani1Id = LeanTween.scale(rtf(uv0.chat.gameObject), Vector3.New(1, 1, 1), uv1):setEase(LeanTweenType.easeOutBack):setOnComplete(System.Action(function ()
				uv0.chatani2Id = LeanTween.scale(rtf(uv0.chat.gameObject), Vector3.New(0, 0, 1), uv1):setEase(LeanTweenType.easeInBack):setDelay(uv1 + uv2):setOnComplete(System.Action(function ()
					uv0.chatFlag = nil
				end)).uniqueId
			end)).uniqueId
		end

		if slot4 then
			if slot0.loadedCVBankName then
				function ()
					if uv0._currentVoice then
						uv0._currentVoice:Stop(true)
					end

					slot0 = nil
					uv0._currentVoice, slot3 = playSoundEffect(uv1)

					if slot3 then
						uv2 = long2int(slot0.length) * 0.001
					end

					uv3()
				end()
			else
				pg.CriMgr:LoadCV(Ship.getCVKeyID(slot0.shipVO.skinId), function ()
					if uv1.exited then
						pg.CriMgr.UnloadCVBank(pg.CriMgr.GetCVBankName(uv0))
					else
						uv2()

						if uv1._currentVoice then
							uv1.loadedCVBankName = slot0
						end
					end
				end)
			end
		else
			slot6()
		end
	end
end

function slot0.startChatTimer(slot0)
	if slot0.chatFlag then
		return
	end

	if slot0.chatTimer then
		slot0.chatTimer:Stop()

		slot0.chatTimer = nil
	end

	slot0.chatTimer = Timer.New(function ()
		uv0:displayShipWord(uv0:getInitmacyWords())
	end, uv0, 1)

	slot0.chatTimer:Start()
end

function slot0.blurPage(slot0, slot1, slot2)
	if slot1 == uv0.PAGE.DETAIL then
		if slot2 then
			pg.UIMgr.GetInstance():OverlayPanelPB(slot0.detailPanel, {
				pbList = {
					slot0.detailPanel:Find("attrs"),
					slot0.detailPanel:Find("equipments")
				},
				groupName = LayerWeightConst.GROUP_SHIPINFOUI,
				overlayType = LayerWeightConst.OVERLAY_UI_ADAPT
			})
		else
			pg.UIMgr.GetInstance():UnOverlayPanel(slot0.detailPanel, slot0.mainPanel)
		end
	elseif slot1 == uv0.PAGE.EQUIPMENT then
		if slot2 then
			rtf(slot0.chat).localScale = Vector3.New(0, 0, 1)
			slot4 = {}
			slot5 = {}

			function slot6(slot0, slot1)
				eachChild(slot0, function (slot0)
					table.insert(uv0, slot0)
				end)
			end

			slot6(slot0.equipmentR:Find("skin"), slot5)
			slot6(slot0.equipmentR:Find("equipment"), slot5)
			slot6(slot0.equipmentL:Find("skin"), slot4)
			slot6(slot0.equipmentL:Find("equipment"), slot4)
			table.insert(slot4, slot0.equipmentL:Find("equipment/equipment_l1"))
			slot3:OverlayPanelPB(slot0.equipmentR, {
				pbList = slot5,
				groupName = LayerWeightConst.GROUP_SHIPINFOUI,
				overlayType = LayerWeightConst.OVERLAY_UI_ADAPT
			})
			slot3:OverlayPanelPB(slot0.equipmentL, {
				pbList = slot4,
				groupName = LayerWeightConst.GROUP_SHIPINFOUI,
				overlayType = LayerWeightConst.OVERLAY_UI_ADAPT
			})
		else
			slot3:UnOverlayPanel(slot0.equipmentR, slot0.mainPanel)
			slot3:UnOverlayPanel(slot0.equipmentL, slot0.mainPanel)
		end
	elseif slot1 == uv0.PAGE.FASHION then
		if slot2 then
			slot3:OverlayPanelPB(slot0.stylePanel, {
				pbList = {
					slot0.stylePanel:Find("style_desc"),
					slot0.stylePanel:Find("frame")
				},
				groupName = LayerWeightConst.GROUP_SHIPINFOUI,
				overlayType = LayerWeightConst.OVERLAY_UI_ADAPT
			})
		else
			slot3:UnOverlayPanel(slot0.stylePanel, slot0.mainPanel)
		end
	elseif slot1 == uv0.PAGE.INTENSIFY then
		-- Nothing
	elseif slot1 == uv0.PAGE.UPGRADE then
		-- Nothing
	elseif slot1 == uv0.PAGE.REMOULD then
		-- Nothing
	end
end

function slot0.switchToPage(slot0, slot1, slot2)
	if slot1 == slot0.page and slot2 then
		function (slot0, slot1)
			if slot0 == uv0.PAGE.DETAIL then
				slot2 = slot1 and {
					uv1.detailPanel.rect.width + 200,
					0
				} or {
					0,
					uv1.detailPanel.rect.width + 200
				}

				shiftPanel(uv1.detailPanel, slot2[2], 0, uv2, 0):setFrom(slot2[1])
			elseif slot0 == uv0.PAGE.EQUIPMENT then
				slot2 = slot1 and {
					-(uv1.equipmentL.rect.width + 190),
					190
				} or {
					190,
					-(uv1.equipmentL.rect.width + 190)
				}
				slot3 = slot1 and {
					uv1.equipmentR.rect.width,
					10
				} or {
					10,
					uv1.equipmentR.rect.width
				}

				shiftPanel(uv1.equipmentL, slot2[2], 0, uv2, 0):setFrom(slot2[1])
				shiftPanel(uv1.equipmentR, slot3[2], 0, uv2, 0):setFrom(slot3[1])
			elseif slot0 == uv0.PAGE.FASHION then
				slot2 = slot1 and {
					uv1.stylePanel.rect.width + 150,
					0
				} or {
					0,
					uv1.stylePanel.rect.width + 150
				}

				shiftPanel(uv1.stylePanel, slot2[2], 0, uv2, 0):setFrom(slot2[1])
				uv1:updateFashion()
			elseif slot0 == uv0.PAGE.INTENSIFY then
				if slot1 then
					uv1:emit(ShipInfoMediator.OPEN_INTENSIFY)
				else
					uv1:emit(ShipInfoMediator.CLOSE_INTENSIFY)
				end
			elseif slot0 == uv0.PAGE.UPGRADE then
				if slot1 then
					uv1:emit(ShipInfoMediator.ON_UPGRADE)
				else
					uv1:emit(ShipInfoMediator.CLOSE_UPGRADE)
				end
			elseif slot0 == uv0.PAGE.REMOULD then
				if slot1 then
					uv1:emit(ShipInfoMediator.OPEN_REMOULD)
				else
					uv1:emit(ShipInfoMediator.CLOSE_REMOULD)
				end
			end

			uv1:blurPage(slot0, slot1)

			if slot0 ~= uv0.PAGE.FASHION then
				uv1.fashionSkinId = uv1.shipVO.skinId

				uv1:loadPainting(uv1.shipVO:getPainting())
			end

			if uv1.bgEffect[uv1.shipVO:getRarity()] then
				setActive(slot2, slot0 ~= uv0.PAGE.REMOULD)
			end

			setActive(uv1.helpBtn, slot0 ~= uv0.PAGE.REMOULD)
		end(slot1, true)
	elseif slot1 ~= slot0.page then
		if slot0.page then
			slot3(slot0.page, false)
		end

		slot0.page = slot1
		slot0.contextData.page = slot1

		slot3(slot1, true)
		slot0:switchPainting()
	end
end

function slot0.switchPainting(slot0)
	setActive(slot0.shipInfo, slot0.page ~= uv0.PAGE.REMOULD)
	setActive(slot0.shipName, slot0.page ~= uv0.PAGE.REMOULD)

	if slot0.page == uv0.PAGE.EQUIPMENT then
		shiftPanel(slot0.shipInfo, -20, 0, uv1, 0)

		slot0.paintingFrameName = "zhuangbei"
	else
		shiftPanel(slot0.shipInfo, -460, 0, uv1, 0)

		slot0.paintingFrameName = "chuanwu"
	end

	slot1 = GetOrAddComponent(findTF(slot0.painting, "fitter"), "PaintingScaler")

	slot1:Snapshoot()

	slot1.FrameName = slot0.paintingFrameName
	slot2 = LeanTween.value(go(slot0.painting), 0, 1, uv1):setOnUpdate(System.Action_float(function (slot0)
		uv0.Tween = slot0
		uv1.chat.localPosition = Vector3(uv1.character.localPosition.x, uv1.chat.localPosition.y, 0)
	end)):setEase(LeanTweenType.easeInOutSine)
end

function slot0.checkMaxLevelHelp(slot0)
	if not slot0.maxLevelHelpFlag and slot0.shipVO and slot0.shipVO:isReachNextMaxLevel() then
		triggerButton(slot0.helpBtn, true)
		slot0:emit(ShipInfoMediator.MARK_MAXLEVELHELP_FLAG)
	end
end

function slot0.setPreOrNext(slot0, slot1)
	if slot1 then
		slot0.isRight = true
	else
		slot0.isRight = false
	end
end

function slot0.loadPainting(slot0, slot1)
	if slot0.isLoading == true then
		return
	end

	if slot0.LoadShipVOId and slot0.LoadShipVOId == slot0.shipVO.id and slot0.LoadPaintingCode == slot1 then
		return
	end

	slot2 = 0
	slot0.isLoading = true
	slot4 = slot0.paintingCode

	if slot0:getPaintingFromTable(false) then
		slot6 = slot3:GetComponent(typeof(CanvasGroup))

		LeanTween.cancel(go(slot6))
		LeanTween.alphaCanvas(slot6, 0, 0.3):setFrom(1):setUseEstimatedTime(true)
		LeanTween.moveX(slot3:GetComponent(typeof(RectTransform)), -(slot0.isRight and 1800 or -1800), 0.3):setFrom(0):setOnComplete(System.Action(function ()
			retPaintingPrefab(uv0, uv1)

			uv2.isLoading = false
		end))
	end

	slot5 = slot0:getPaintingFromTable(true)
	slot0.paintingCode = slot1

	if slot0.paintingCode and slot5 then
		slot6 = slot5:GetComponent(typeof(RectTransform))

		setPaintingPrefabAsync(slot5, slot0.paintingCode, slot0.paintingFrameName or "chuanwu", function ()
			Ship.SetExpression(findTF(uv0, "fitter"):GetChild(0), uv1.paintingCode)
		end)
		LeanTween.cancel(go(slot6))
		LeanTween.moveX(slot6, 0, 0.3):setFrom(slot2):setOnComplete(System.Action(function ()
			uv0.isLoading = false
		end))
		LeanTween.alphaCanvas(slot5:GetComponent(typeof(CanvasGroup)), 1, 0.3):setFrom(0):setUseEstimatedTime(true)
	end

	slot0.LoadShipVOId = slot0.shipVO.id
	slot0.LoadPaintingCode = slot1
end

function slot0.getPaintingFromTable(slot0, slot1)
	if slot0.tablePainting == nil then
		print("self.tablePainting为空")

		return
	end

	for slot5 = 1, #slot0.tablePainting do
		if findTF(slot0.tablePainting[slot5], "fitter").childCount == 0 then
			if slot1 == true and slot0.tablePainting[slot5] then
				return slot0.tablePainting[slot5]
			end
		elseif slot1 == false and slot0.tablePainting[slot5] then
			return slot0.tablePainting[slot5]
		end
	end
end

function slot0.loadSkinBg(slot0, slot1, slot2)
	if not slot0.bgEffect then
		slot0.bgEffect = {}
	end

	if slot0.shipSkinBg ~= slot1 or slot0.isDesign ~= slot2 then
		slot0.shipSkinBg = slot1
		slot0.isDesign = slot2

		if slot0.isDesign then
			if slot0.designBg and slot0.designName ~= "raritydesign" .. slot0.shipVO:getRarity() then
				PoolMgr.GetInstance():ReturnUI(slot0.designName, slot0.designBg)

				slot0.designBg = nil
			end

			if not slot0.designBg then
				PoolMgr.GetInstance():GetUI("raritydesign" .. slot0.shipVO:getRarity(), true, function (slot0)
					uv0.designBg = slot0
					uv0.designName = "raritydesign" .. uv0.shipVO:getRarity()

					slot0.transform:SetParent(uv0._tf, false)

					slot0.transform.localPosition = Vector3(1, 1, 1)
					slot0.transform.localScale = Vector3(1, 1, 1)

					slot0.transform:SetSiblingIndex(1)
					setActive(slot0, true)
				end)
			else
				setActive(slot0.designBg, true)
			end
		else
			if slot0.designBg then
				setActive(slot0.designBg, false)
			end

			for slot6 = 1, 5 do
				if slot0.bgEffect[slot6] then
					setActive(slot0.bgEffect[slot6], slot6 == slot0.shipVO:getRarity() and slot0.page ~= uv0.PAGE.REMOULD)
				elseif slot7 > 2 and slot7 == slot6 then
					PoolMgr.GetInstance():GetUI("al_bg02_" .. slot7 - 1, true, function (slot0)
						uv0.bgEffect[uv1] = slot0

						slot0.transform:SetParent(uv0._tf, false)

						slot0.transform.localPosition = Vector3(0, 0, 0)
						slot0.transform.localScale = Vector3(1, 1, 1)

						slot0.transform:SetSiblingIndex(1)
						setActive(slot0, uv0.page ~= uv2.PAGE.REMOULD)
					end)
				end
			end
		end

		GetSpriteFromAtlasAsync("bg/star_level_bg_" .. slot1, "", function (slot0)
			if not uv0.exited and uv0.shipSkinBg == uv1 then
				setImageSprite(uv0.background, slot0)
			end
		end)
	end
end

function slot0.getInitmacyWords(slot0)
	return "feeling" .. Mathf.Clamp(slot0.shipVO:getIntimacyLevel(), 1, 5)
end

function slot0.paintView(slot0)
	slot0.character:GetComponent("Image").enabled = false
	slot0.inPaintingView = true
	slot1 = {}
	slot3 = 0

	while slot0._tf.childCount > slot3 do
		if slot0._tf:GetChild(slot3).gameObject.activeSelf and slot4 ~= slot0.main and slot4 ~= slot0.background then
			slot1[#slot1 + 1] = slot4

			setActive(slot4, false)
		end

		slot3 = slot3 + 1
	end

	slot3 = 0

	while slot0.main.childCount > slot3 do
		if slot0.main:GetChild(slot3).gameObject.activeSelf and slot4 ~= slot0.shipInfo then
			slot1[#slot1 + 1] = slot4

			setActive(slot4, false)
		end

		slot3 = slot3 + 1
	end

	for slot8 = 1, tf(pg.UIMgr:GetInstance().OverlayMain).childCount do
		if slot4:GetChild(slot8 - 1).gameObject.activeSelf then
			slot1[#slot1 + 1] = slot9

			setActive(slot9, false)
		end
	end

	slot1[#slot1 + 1] = slot0.chat

	openPortrait()
	setActive(slot0.common, false)

	slot0.mainMask.enabled = false

	slot0.mainMask:PerformClipping()

	slot5 = slot0:getPaintingFromTable(false)
	slot6 = slot5.anchoredPosition.x
	slot7 = slot5.anchoredPosition.y
	slot10 = slot0._tf.rect.width / UnityEngine.Screen.width
	slot11 = slot0._tf.rect.height / UnityEngine.Screen.height
	slot12 = slot5.rect.width / 2
	slot13 = slot5.rect.height / 2
	slot14, slot15 = nil

	GetOrAddComponent(slot0.background, "MultiTouchZoom"):SetZoomTarget(slot0.painting)

	slot17 = GetOrAddComponent(slot0.background, "EventTriggerListener")
	slot18 = true
	slot19 = false

	slot17:AddPointDownFunc(function (slot0)
		if Input.touchCount == 1 or Application.isEditor then
			uv0 = true
			uv1 = true
		elseif Input.touchCount >= 2 then
			uv1 = false
			uv0 = false
		end
	end)
	slot17:AddPointUpFunc(function (slot0)
		if Input.touchCount <= 2 then
			uv0 = true
		end
	end)
	slot17:AddBeginDragFunc(function (slot0, slot1)
		uv0 = false
		uv1 = slot1.position.x * uv2 - uv3 - tf(uv4:getPaintingFromTable(false)).localPosition.x
		uv5 = slot1.position.y * uv6 - uv7 - tf(uv4:getPaintingFromTable(false)).localPosition.y
	end)
	slot17:AddDragFunc(function (slot0, slot1)
		if uv0 then
			slot2 = tf(uv1:getPaintingFromTable(false)).localPosition
			tf(uv1:getPaintingFromTable(false)).localPosition = Vector3(slot1.position.x * uv2 - uv3 - uv4, slot1.position.y * uv5 - uv6 - uv7, -22)
		end
	end)
	onButton(slot0, slot0.background, function ()
		uv0:hidePaintView()
	end, SFX_CANCEL)

	function uv0.hidePaintView(slot0, slot1)
		if not slot1 and not uv0 then
			return
		end

		slot0.character:GetComponent("Image").enabled = true
		Input.multiTouchEnabled = false

		setActive(slot0.common, true)

		slot5 = nil
		slot6 = uv1 * 2

		SwitchPanel(slot0.shipInfo, -460, slot5, slot6)

		uv2.enabled = false
		uv3.enabled = false

		for slot5, slot6 in ipairs(uv4) do
			setActive(slot6, true)
		end

		closePortrait()

		slot0:getPaintingFromTable(false).localScale = Vector3(1, 1, 1)

		setAnchoredPosition(slot0:getPaintingFromTable(false), {
			x = uv5,
			y = uv6
		})

		slot0.background:GetComponent("Button").enabled = false
		slot0:getPaintingFromTable(false):GetComponent("CanvasGroup").blocksRaycasts = true
		slot0.mainMask.enabled = true

		slot0.mainMask:PerformClipping()

		slot0.inPaintingView = false
	end

	SwitchPanel(slot0.shipInfo, uv2, nil, uv1 * 2):setOnComplete(System.Action(function ()
		uv0.enabled = true
		uv1.enabled = true
		uv2.background:GetComponent("Button").enabled = true
		uv2:getPaintingFromTable(false):GetComponent("CanvasGroup").blocksRaycasts = false
	end))
end

slot7 = 0.2

function slot0.displayRecordPanel(slot0)
	if not slot0.shipVO then
		return
	end

	slot0.isShowRecord = true

	setActive(slot0.recordPanel, true)
	setActive(slot0.attrs, false)

	for slot4, slot5 in ipairs(slot0.recordBtns) do
		onButton(slot0, slot5, function ()
			uv0:emit(ShipInfoMediator.ON_RECORD_EQUIPMENT, uv0.shipVO.id, uv1, 1)
		end, SFX_PANEL)
	end

	for slot4, slot5 in ipairs(slot0.equipRecordBtns) do
		onButton(slot0, slot5, function ()
			uv0:emit(ShipInfoMediator.ON_RECORD_EQUIPMENT, uv0.shipVO.id, uv1, 2)
		end, SFX_PANEL)
	end

	for slot4, slot5 in ipairs(slot0.recordEquipmentsTFs) do
		slot0:updateRecordEquipments(slot4)
	end
end

function slot0.closeRecordPanel(slot0)
	if slot0.isShowRecord then
		slot0.isShowRecord = nil

		setActive(slot0.recordPanel, false)
		setActive(slot0.attrs, true)
	end
end

function slot0.updateRecordEquipments(slot0, slot1)
	for slot8 = 1, 5 do
		slot10 = tonumber((slot0.shipVO:getEquipmentRecord(slot0.player.id)[slot1] or {})[slot8]) and slot9 ~= -1
		slot11 = slot0.recordEquipmentsTFs[slot1]:Find("equipment_" .. slot8)

		setActive(slot11:Find("info"), slot10)
		setActive(slot11:Find("empty"), not slot10)

		if slot10 then
			slot14 = slot0.equipmentProxy:getEquipmentById(slot9)
			slot17 = not (slot0.shipVO.equipments[slot8] and slot15.id == slot9 or false) and (not slot14 or slot14.count <= 0)

			setActive(slot13:Find("tip"), slot17)
			updateEquipment(slot0:findTF("IconTpl", slot13), Equipment.New({
				id = slot9
			}))

			if slot17 then
				onButton(slot0, slot13, function ()
					pg.TipsMgr:GetInstance():ShowTips(i18n("ship_quick_change_nofreeequip"))
				end, SFX_PANEL)
			end
		else
			removeOnButton(slot13)
		end
	end
end

function slot0.switch2EquipmentSkinPage(slot0)
	if slot0.equipmentSkinPanel:isTweening() then
		return
	end

	slot0.equipmentSkinPanel:doSwitchAnim(slot0.contextData.isInEquipmentSkinPage)

	slot0.contextData.isInEquipmentSkinPage = not slot0.contextData.isInEquipmentSkinPage

	setActive(slot0.equipSkinBtn:Find("unsel"), not slot0.contextData.isInEquipmentSkinPage)
	setActive(slot0.equipSkinBtn:Find("sel"), slot0.contextData.isInEquipmentSkinPage)
	slot0.equipmentSkinPanel:updateAll(slot0.shipVO)
end

function slot0.willExit(slot0)
	Input.multiTouchEnabled = true

	pg.UIMgr.GetInstance():UnOverlayPanel(slot0.customMsgbox, slot0._tf)
	pg.UIMgr.GetInstance():UnOverlayPanel(slot0.chat, slot0.character)
	slot0:blurPage(slot0.page)
	setActive(slot0.background, false)

	if slot0.designBg then
		PoolMgr.GetInstance():ReturnUI(slot0.designName, slot0.designBg)
	end

	slot0.intensifyToggle:GetComponent("Toggle").onValueChanged:RemoveAllListeners()
	slot0.upgradeToggle:GetComponent("Toggle").onValueChanged:RemoveAllListeners()
	LeanTween.cancel(slot0.chat.gameObject)

	if slot0.paintingCode then
		for slot4 = 1, #slot0.tablePainting do
			if LeanTween.isTweening(go(slot0.tablePainting[slot4])) then
				LeanTween.cancel(go(slot5))
			end
		end

		retPaintingPrefab(slot0:getPaintingFromTable(false), slot0.paintingCode)
	end

	removeAllChildren(slot0.equipmentsGrid)
	clearImageSprite(slot0.background)

	if slot0.recordPanel then
		if LeanTween.isTweening(go(slot0.recordPanel)) then
			LeanTween.cancel(go(slot0.recordPanel))
		end

		slot0.recordPanel = nil
	end

	if slot0.equipmentSkinPanel then
		slot0.equipmentSkinPanel:detach()
	end

	if slot0.energyTimer then
		slot0.energyTimer:Stop()

		slot0.energyTimer = nil
	end

	if slot0.intimacyTimer then
		slot0.intimacyTimer:Stop()

		slot0.intimacyTimer = nil
	end

	if slot0.chatTimer then
		slot0.chatTimer:Stop()

		slot0.chatTimer = nil
	end

	if slot0._currentVoice then
		slot0._currentVoice:Stop(true)
	end

	slot0._currentVoice = nil

	if slot0.loadedCVBankName then
		pg.CriMgr.UnloadCVBank(slot0.loadedCVBankName)

		slot0.loadedCVBankName = nil
	end

	slot0:clearFashion()
	slot0:hideHuntingRange()
	cameraPaintViewAdjust(false)

	if slot0.tweens then
		cancelTweens(slot0.tweens)
	end

	for slot4, slot5 in ipairs(slot0.equipmentNames) do
		slot5:destroy()
	end

	slot0.equipmentNames = nil

	slot0.shipDetailPanel:clear()

	if slot0.scrollTxt then
		slot0.scrollTxt:destroy()
	end

	pg.UIMgr.GetInstance():UnOverlayPanel(slot0.blurPanel, slot0._tf)
end

return slot0
