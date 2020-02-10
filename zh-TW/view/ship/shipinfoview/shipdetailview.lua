slot0 = class("ShipDetailView", import("...base.BaseSubView"))

function slot0.getUIName(slot0)
	return "ShipDetailView"
end

function slot0.OnInit(slot0)
	slot0:InitDetail()
	slot0:InitEvent()
end

function slot0.InitDetail(slot0)
	slot0.mainPanel = slot0._parentTf.parent
	slot0.detailPanel = slot0._tf
	slot0.attrs = slot0.detailPanel:Find("attrs")
	slot0.shipDetailLogicPanel = ShipDetailLogicPanel.New(slot0.attrs)

	slot0.shipDetailLogicPanel:attach(slot0)

	slot0.equipments = slot0.detailPanel:Find("equipments")
	slot0.equipmentsGrid = slot0.equipments:Find("equipments")
	slot0.detailEqupimentTpl = slot0.equipments:Find("equipment_tpl")
	slot0.emptyGridTpl = slot0.equipments:Find("empty_tpl")
	slot0.lockGridTpl = slot0.equipments:Find("lock_tpl")
	slot0.showRecordBtn = slot0.equipments:Find("unload_all")
	slot0.lockBtn = slot0.detailPanel:Find("lock_btn")
	slot0.unlockBtn = slot0.detailPanel:Find("unlock_btn")
	slot0.viewBtn = slot0.detailPanel:Find("view_btn")
	slot0.evaluationBtn = slot0.detailPanel:Find("evaluation_btn")
	slot0.profileBtn = slot0.detailPanel:Find("profile_btn")
	slot0.fashionToggle = slot0.detailPanel:Find("fashion_toggle")
	slot0.commonTagToggle = slot0.detailPanel:Find("common_toggle")
	slot0.propertyIcons = slot0.detailPanel:Find("attrs/attrs/property/icons")
	slot0.intimacyTF = slot0:findTF("intimacy")
	slot0.intimacyHeart = slot0.intimacyTF:Find("heart")
	slot0.equipmentProxy = getProxy(EquipmentProxy)
	slot0.recordPanel = slot0.detailPanel:Find("record_panel")
	slot1 = slot0.recordPanel
	slot0.unloadAllBtn = slot1:Find("frame/unload_all")
	slot1[1] = slot0.recordPanel:Find("frame/container/record_1/record_btn")
	slot1[2] = slot0.recordPanel:Find("frame/container/record_2/record_btn")
	slot1[MULTRES] = slot0.recordPanel:Find("frame/container/record_3/record_btn")
	slot0.recordBtns = {}
	slot1[1] = slot0.recordPanel:Find("frame/container/record_1/equipments")
	slot1[2] = slot0.recordPanel:Find("frame/container/record_2/equipments")
	slot1[MULTRES] = slot0.recordPanel:Find("frame/container/record_3/equipments")
	slot0.recordEquipmentsTFs = {}
	slot1[1] = slot0.recordPanel:Find("frame/container/record_1/equip_btn")
	slot1[2] = slot0.recordPanel:Find("frame/container/record_2/equip_btn")
	slot1[MULTRES] = slot0.recordPanel:Find("frame/container/record_3/equip_btn")
	slot0.equipRecordBtns = {}

	setActive(slot0.detailPanel, true)
	setActive(slot0.attrs, true)
	setActive(slot0.recordPanel, false)
	setActive(slot0.detailEqupimentTpl, false)
	setActive(slot0.emptyGridTpl, false)
	setActive(slot0.lockGridTpl, false)
	setActive(slot0.detailPanel, true)

	slot0.onSelected = false
end

function slot0.InitEvent(slot0)
	onButton(slot0, slot0.fashionToggle, function (slot0)
		uv0:emit(ShipViewConst.SWITCH_TO_PAGE, ShipViewConst.PAGE.FASHION)
	end, SFX_PANEL)
	onButton(slot0, slot0.propertyIcons, function ()
		slot2.type = MSGBOX_TYPE_HELP
		slot2.helps = pg.gametip.help_shipinfo_attr.tip

		function slot2.onClose()
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({})
	end)
	onToggle(slot0, slot0.commonTagToggle, function (slot0)
		if uv0:GetShipVO().preferenceTag == Ship.PREFERENCE_TAG_COMMON ~= slot0 then
			uv0:emit(ShipMainMediator.ON_TAG, uv0:GetShipVO().id, (slot1 ~= Ship.PREFERENCE_TAG_COMMON or Ship.PREFERENCE_TAG_NONE) and Ship.PREFERENCE_TAG_COMMON)
		end
	end)
	onButton(slot0, slot0.lockBtn, function ()
		slot3[1] = uv0:GetShipVO().id

		uv0:emit(ShipMainMediator.ON_LOCK, {}, uv0:GetShipVO().LOCK_STATE_LOCK)
	end, SFX_PANEL)
	onButton(slot0, slot0.unlockBtn, function ()
		slot3[1] = uv0:GetShipVO().id

		uv0:emit(ShipMainMediator.ON_LOCK, {}, uv0:GetShipVO().LOCK_STATE_UNLOCK)
	end, SFX_PANEL)
	onButton(slot0, slot0.viewBtn, function ()
		Input.multiTouchEnabled = true

		uv0:emit(ShipViewConst.PAINT_VIEW, true)
	end, SFX_PANEL)
	onButton(slot0, slot0.evaluationBtn, function ()
		uv0:emit(ShipMainMediator.OPEN_EVALUATION, uv0:GetShipVO():getGroupId(), uv0:GetShipVO():isActivityNpc())
	end, SFX_PANEL)
	onButton(slot0, slot0.profileBtn, function ()
		uv0:emit(ShipMainMediator.OPEN_SHIPPROFILE, uv0:GetShipVO():getGroupId(), uv0:GetShipVO():isRemoulded())
	end, SFX_PANEL)
	onButton(slot0, slot0.intimacyTF, function ()
		if uv0:GetShipVO():isActivityNpc() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("npc_propse_tip"))

			return
		end

		if LOCK_PROPOSE then
			return
		end

		uv0:emit(ShipViewConst.HIDE_SHIP_WORD)
		uv0:emit(ShipMainMediator.PROPOSE, uv0:GetShipVO().id, function ()
		end)
	end)
	onButton(slot0, slot0.equipments, function ()
		uv0:emit(ShipViewConst.SWITCH_TO_PAGE, ShipViewConst.PAGE.EQUIPMENT)
	end, SFX_PANEL)
	onButton(slot0, slot0.showRecordBtn, function ()
		if not uv0.isShowRecord then
			uv0:displayRecordPanel()
		else
			uv0:CloseRecordPanel()
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.unloadAllBtn, function ()
		slot0, slot1 = Ship.canModifyShip(uv0:GetShipVO())

		if not slot0 then
			pg.TipsMgr.GetInstance():ShowTips(slot1)
		else
			slot4.content = i18n("ship_unequip_all_tip")

			function slot4.onYes()
				uv0:emit(ShipMainMediator.UNEQUIP_FROM_SHIP_ALL, uv0:GetShipVO().id)
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox({})
		end
	end, SFX_PANEL)
end

function slot0.SetShareData(slot0, slot1)
	slot0.shareData = slot1
end

function slot0.GetShipVO(slot0)
	if slot0.shareData and slot0.shareData.shipVO then
		return slot0.shareData.shipVO
	end

	return nil
end

function slot0.OnSelected(slot0, slot1)
	if slot1 then
		slot7[1] = slot0.detailPanel:Find("attrs")
		slot7[MULTRES] = slot0.detailPanel:Find("equipments")
		slot6.pbList = {}
		slot6.groupName = LayerWeightConst.GROUP_SHIPINFOUI
		slot6.overlayType = LayerWeightConst.OVERLAY_UI_ADAPT

		pg.UIMgr.GetInstance():OverlayPanelPB(slot0._parentTf, {})
	else
		slot2:UnOverlayPanel(slot0._parentTf, slot0.mainPanel)
	end

	slot0.onSelected = slot1
end

function slot0.UpdateUI(slot0)
	slot1 = slot0:GetShipVO()

	slot0:UpdateIntimacy(slot1)
	slot0:UpdateDetail(slot1)
	slot0:UpdateEquipments(slot1)
	slot0:UpdateLock()
	slot0:UpdatePreferenceTag()
end

function slot0.UpdateIntimacy(slot0, slot1)
	slot7, slot3, slot4 = slot1:getIntimacyDetail()

	setImageSprite(slot0.intimacyTF, GetSpriteFromAtlas("energy", slot2), true)
	setActive(slot0.intimacyTF, not LOCK_PROPOSE)

	slot6 = 1

	if slot3 <= slot4 and not slot1.propose then
		setActive(slot0.intimacyHeart, true)

		slot6 = 0
	else
		setActive(slot0.intimacyHeart, false)
	end

	slot0.intimacyTF:GetComponent(typeof(Image)).color = Color.New(1, 1, 1, slot6)
end

function slot0.UpdateDetail(slot0, slot1)
	slot0.shipDetailLogicPanel:flush(slot1)

	slot2 = slot0.shipDetailLogicPanel.attrs

	removeOnButton(slot2:Find("icons/hunting_range/bg"))

	if table.contains(TeamType.SubShipType, slot1:getShipType()) then
		onButton(slot0, slot2, function ()
			uv0:emit(ShipViewConst.DISPLAY_HUNTING_RANGE, true)
		end, SFX_PANEL)
	end

	setActive(slot0.fashionToggle, #slot0.shareData:GetCurGroupSkinList() > 1)
	setActive(slot0.profileBtn, not slot1:isActivityNpc())
end

function slot0.UpdateEquipments(slot0, slot1)
	removeAllChildren(slot0.equipmentsGrid)

	for slot6, slot7 in ipairs(slot1.equipments) do
		slot8 = slot1:getActiveEquipments()[slot6]
		slot9 = nil

		if slot7 then
			slot9 = cloneTplTo(slot0.detailEqupimentTpl, slot0.equipmentsGrid)

			updateEquipment(slot0:findTF("IconTpl", slot9), slot7)
			onButton(slot0, slot9, function ()
				slot3.type = EquipmentInfoMediator.TYPE_SHIP
				slot3.shipId = uv0:GetShipVO().id
				slot3.pos = uv1

				uv0:emit(BaseUI.ON_EQUIPMENT, {})
			end, SFX_UI_DOCKYARD_EQUIPADD)
		else
			onButton(slot0, cloneTplTo(slot0.emptyGridTpl, slot0.equipmentsGrid), function ()
				uv0:emit(ShipViewConst.SWITCH_TO_PAGE, ShipViewConst.PAGE.EQUIPMENT)
			end, SFX_UI_DOCKYARD_EQUIPADD)
		end
	end
end

function slot0.UpdateLock(slot0)
	if slot0:GetShipVO():GetLockState() == slot0:GetShipVO().LOCK_STATE_UNLOCK then
		setActive(slot0.lockBtn, true)
		setActive(slot0.unlockBtn, false)
	elseif slot1 == slot0:GetShipVO().LOCK_STATE_LOCK then
		setActive(slot0.lockBtn, false)
		setActive(slot0.unlockBtn, true)
	end
end

slot1 = 0.2

function slot0.displayRecordPanel(slot0)
	if not slot0:GetShipVO() then
		return
	end

	slot0.isShowRecord = true

	setActive(slot0.recordPanel, true)
	setActive(slot0.attrs, false)

	for slot4, slot5 in ipairs(slot0.recordBtns) do
		onButton(slot0, slot5, function ()
			uv0:emit(ShipMainMediator.ON_RECORD_EQUIPMENT, uv0:GetShipVO().id, uv1, 1)
		end, SFX_PANEL)
	end

	for slot4, slot5 in ipairs(slot0.equipRecordBtns) do
		onButton(slot0, slot5, function ()
			uv0:emit(ShipMainMediator.ON_RECORD_EQUIPMENT, uv0:GetShipVO().id, uv1, 2)
		end, SFX_PANEL)
	end

	for slot4, slot5 in ipairs(slot0.recordEquipmentsTFs) do
		slot0:UpdateRecordEquipments(slot4)
	end
end

function slot0.CloseRecordPanel(slot0)
	if slot0.isShowRecord then
		slot0.isShowRecord = nil

		setActive(slot0.recordPanel, false)
		setActive(slot0.attrs, true)
	end
end

function slot0.UpdateRecordEquipments(slot0, slot1)
	for slot8 = 1, 5, 1 do
		slot10 = tonumber(slot0:GetShipVO():getEquipmentRecord(slot0.shareData.player.id)[slot1] or {}[slot8]) and slot9 ~= -1
		slot11 = slot0.recordEquipmentsTFs[slot1]:Find("equipment_" .. slot8)

		setActive(slot11:Find("info"), slot10)
		setActive(slot11:Find("empty"), not slot10)

		if slot10 then
			slot14 = slot0.equipmentProxy:getEquipmentById(slot9)
			slot17 = not (slot0:GetShipVO().equipments[slot8] and slot15.id == slot9 or false) and (not slot14 or slot14.count <= 0)

			setActive(slot13:Find("tip"), slot17)

			slot21.id = slot9

			updateEquipment(slot0:findTF("IconTpl", slot13), Equipment.New({}))

			if slot17 then
				onButton(slot0, slot13, function ()
					pg.TipsMgr.GetInstance():ShowTips(i18n("ship_quick_change_nofreeequip"))
				end, SFX_PANEL)
			end
		else
			removeOnButton(slot13)
		end
	end
end

function slot0.UpdatePreferenceTag(slot0)
	triggerToggle(slot0.commonTagToggle, slot0:GetShipVO().preferenceTag == Ship.PREFERENCE_TAG_COMMON)
end

function slot0.DoLeveUpAnim(slot0, slot1, slot2, slot3)
	slot0.shipDetailLogicPanel:doLeveUpAnim(slot1, slot2, slot3)
end

function slot0.OnDestroy(slot0)
	removeAllChildren(slot0.equipmentsGrid)

	if slot0.recordPanel then
		if LeanTween.isTweening(go(slot0.recordPanel)) then
			LeanTween.cancel(go(slot0.recordPanel))
		end

		slot0.recordPanel = nil
	end

	slot0.shipDetailLogicPanel:clear()
	slot0.shipDetailLogicPanel:detach()

	slot0.shareData = nil
end

return slot0
