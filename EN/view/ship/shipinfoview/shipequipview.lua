slot0 = class("ShipEquipView", import("...base.BaseSubView"))
slot0.UNLOCK_EQUPMENT_SKIN_POS = {
	1,
	2,
	3
}

slot0.getUIName = function (slot0)
	return "ShipEquipView"
end

slot0.OnInit = function (slot0)
	slot0:InitEquipment()
end

slot0.SetShareData = function (slot0, slot1)
	slot0.shareData = slot1
end

slot0.GetShipVO = function (slot0)
	if slot0.shareData and slot0.shareData.shipVO then
		return slot0.shareData.shipVO
	end

	return nil
end

slot0.UpdateUI = function (slot0)
	slot0:UpdateEquipments(slot0:GetShipVO())
end

slot0.InitEquipment = function (slot0)
	slot0.mainPanel = slot0._parentTf.parent
	slot0.equipRCon = slot0._parentTf:Find("equipment_r_container")
	slot0.equipLCon = slot0._parentTf:Find("equipment_l_container")
	slot0.equipmentR = slot0:findTF("equipment_r")
	slot0.equipmentL = slot0:findTF("equipment_l")
	slot0.equipmentR1 = slot0.equipmentR:Find("equipment/equipment_r1")
	slot0.equipmentR2 = slot0.equipmentR:Find("equipment/equipment_r2")
	slot0.equipmentR3 = slot0.equipmentR:Find("equipment/equipment_r3")
	slot0.equipmentL1 = slot0.equipmentL:Find("equipment/equipment_l1")
	slot0.equipmentL2 = slot0.equipmentL:Find("equipment/equipment_l2")
	slot0.equipSkinBtn = slot0.equipmentR:Find("equipment_skin_btn")
	slot0.resource = slot0._tf:Find("resource")
	slot0.equipSkinLogicPanel = ShipEquipSkinLogicPanel.New(slot0._tf.gameObject)

	slot0.equipSkinLogicPanel:attach(slot0)
	slot0.equipSkinLogicPanel:setLabelResource(slot0.resource)
	setActive(slot0.equipSkinLogicPanel._go, true)
	setParent(slot0.equipmentR, slot0.equipRCon)
	setParent(slot0.equipmentL, slot0.equipLCon)
	setActive(slot0.equipmentR, true)
	setActive(slot0.equipmentL, true)
	setActive(slot0.equipSkinBtn, true)

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
			cloneTplTo((slot4 <= Ship.WEAPON_COUNT and slot0.infoTplR) or slot0.infoTplL, slot5, "info")
		end

		table.insert(slot0.equipmentNames, ScrollTxt.New(slot5:Find("info/cont/name_mask"), slot5:Find("info/cont/name_mask/name")))
	end

	slot0.onSelected = false
end

slot0.InitEvent = function (slot0)
	onButton(slot0, slot0.equipSkinBtn, function ()
		slot0, slot1 = Ship.canModifyShip(slot0:GetShipVO())

		if not slot0 then
			pg.TipsMgr.GetInstance():ShowTips(slot1)

			return
		end

		slot2 = slot0:GetShipVO().equipments

		if _.all(slot1.UNLOCK_EQUPMENT_SKIN_POS, function (slot0)
			return not slot0[slot0]
		end) and not slot0.contextData.isInEquipmentSkinPage then
			pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_skin_no_equipment_tip"))

			return
		end

		slot0:switch2EquipmentSkinPage()
	end)

	if slot0.contextData.isInEquipmentSkinPage then
		slot0.contextData.isInEquipmentSkinPage = nil

		triggerButton(slot0.equipSkinBtn)
	end
end

slot0.OnSelected = function (slot0, slot1)
	slot2 = pg.UIMgr.GetInstance()

	if slot1 then
		slot5(slot0.equipmentR:Find("skin"), slot4)
		slot5(slot0.equipmentR:Find("equipment"), slot4)
		slot5(slot0.equipmentL:Find("skin"), slot3)
		slot5(slot0.equipmentL:Find("equipment"), slot3)
		table.insert(slot3, slot0.equipmentL:Find("equipment/equipment_l1"))
		slot2:OverlayPanelPB(slot0.equipRCon, {
			pbList = {},
			groupName = LayerWeightConst.GROUP_SHIPINFOUI,
			overlayType = LayerWeightConst.OVERLAY_UI_ADAPT,
			weight = LayerWeightConst.LOWER_LAYER
		})
		slot2:OverlayPanelPB(slot0.equipLCon, {
			pbList = {},
			groupName = LayerWeightConst.GROUP_SHIPINFOUI,
			overlayType = LayerWeightConst.OVERLAY_UI_ADAPT,
			weight = LayerWeightConst.LOWER_LAYER
		})
	else
		slot2:UnOverlayPanel(slot0.equipRCon, slot0._parentTf)
		slot2:UnOverlayPanel(slot0.equipLCon, slot0._parentTf)
	end

	slot0.onSelected = slot1
end

slot0.UpdateEquipments = function (slot0, slot1)
	slot2 = slot1:getActiveEquipments()

	for slot6, slot7 in ipairs(slot1.equipments) do
		slot0:UpdateEquipmentPanel(slot6, slot7, slot2[slot6])
	end

	if slot0.equipSkinLogicPanel then
		slot0.equipSkinLogicPanel:updateAll(slot1)
	end
end

slot0.UpdateEquipmentPanel = function (slot0, slot1, slot2, slot3)
	slot7 = findTF(slot5, "efficiency")

	setActive(slot5, slot2)
	setActive(slot6, not slot2)

	slot8 = nil

	for slot12, slot13 in pairs(slot0:GetShipVO().skills) do
		if ys.Battle.BattleDataFunction.GetBuffTemplate(slot13.id, slot13.level).shipInfoScene and slot14.shipInfoScene.equip then
			slot8 = slot14.shipInfoScene.equip
		end
	end

	slot9 = findTF(slot4, "panel_title/type")

	if findTF(slot4, "skin_icon") then
		setActive(slot10, slot2 and slot2:hasSkin())
	end

	slot9:GetComponent(typeof(Text)).text = EquipType.LabelToName(slot11)

	if slot2 then
		setActive(slot7, not EquipType.isDevice(slot2.configId) and slot2.config.type ~= EquipType.AntiSubAircraft)

		if not EquipType.isDevice(slot2.configId) then
			slot13 = pg.ship_data_statistics[slot0:GetShipVO().configId]
			slot15 = (slot0:GetShipVO():getEquipProficiencyByPos(slot1) and slot14 * 100) or 0

			if slot8 then
				for slot19, slot20 in ipairs(slot8) do
					if slot0:equipmentCheck(slot20) and slot0.equipmentEnhance(slot20, slot2) then
						slot15 = slot15 + slot20.number
					end
				end
			end

			setButtonText(slot7, slot15 .. "%")
		end

		updateEquipment(slot13, slot2)

		slot14 = slot2.config.name

		if slot2.config.ammo_icon[1] then
			setActive(findTF(slot5, "cont/icon_ammo"), true)
			setImageSprite(findTF(slot5, "cont/icon_ammo"), GetSpriteFromAtlas("ammo", slot2.config.ammo_icon[1]))
		else
			setActive(findTF(slot5, "cont/icon_ammo"), false)
		end

		function slot15(slot0, slot1)
			slot2 = slot0:GetSkill()

			setActive(slot0, slot2)
			setActive(slot1, not slot2)

			if slot2 then
				setText(findTF(slot0, "values/value_1"), slot2.name)
				setText(findTF(slot0, "values/value"), "")
			end
		end

		if findTF(slot5, "attrs/attr_3_1") then
			setActive(slot16, EquipType.isDevice(slot2.configId) and slot1 <= 3)
		end

		slot0.equipmentNames[slot1]:setText(slot14)

		slot17 = slot2:GetProperties()
		slot18 = false

		for slot22 = 1, 4, 1 do
			if findTF(slot5, "attrs/attr_" .. slot22) then
				slot24 = findTF(slot23, "panel")
				slot25 = findTF(slot23, "lock")

				if EquipType.isDevice(slot2.configId) and slot1 <= 3 and slot22 == 3 then
					slot18 = true

					setActive(slot16, true)
					SetActive(slot23, false)
					slot15(findTF(slot16, "panel"), findTF(slot16, "lock"))
				elseif EquipType.isDevice(slot2.configId) and slot22 == 3 then
					SetActive(slot23, true)
					slot15(slot24, slot25)
				elseif slot18 == true and slot22 == 4 then
					SetActive(slot23, false)
				else
					SetActive(slot23, true)
					setActive(slot24, slot26)
					setActive(slot25, not slot17[slot22])

					if slot17[slot22] then
						slot27 = findTF(slot24, "tag")
						slot28 = findTF(slot24, "values/value")
						slot29 = findTF(slot24, "values/value_1")

						if not EquipType.isDevice(slot2.configId) and slot26.type == AttributeType.Reload and slot22 == 4 then
							setText(slot27, AttributeType.Type2Name(AttributeType.CD))
							setText(slot28, slot31)
							setText(slot29, i18n("word_secondseach"))
						else
							setText(slot27, AttributeType.Type2Name(slot26.type))

							if #string.split(tostring(slot26.value), "/") >= 2 then
								setText(slot28, slot30[1] .. "/")
								setText(slot29, slot30[2])
							else
								setText(slot28, slot26.value)
								setText(slot29, "")
							end
						end
					end
				end
			end
		end

		onButton(slot0, slot4, function ()
			slot0:emit(BaseUI.ON_EQUIPMENT, {
				type = EquipmentInfoMediator.TYPE_SHIP,
				shipId = slot0:GetShipVO().id,
				pos = slot0
			})
		end, SFX_UI_DOCKYARD_EQUIPADD)
	else
		onButton(slot0, slot4, function ()
			if slot0:GetShipVO() then
				slot0, slot1 = Ship.canModifyShip(slot0:GetShipVO())

				if not slot0 then
					pg.TipsMgr.GetInstance():ShowTips(slot1)

					return
				end

				slot0:emit(ShipMainMediator.ON_SELECT_EQUIPMENT, slot1)
			end
		end, SFX_UI_DOCKYARD_EQUIPADD)
	end
end

slot0.equipmentCheck = function (slot0, slot1)
	if not slot0:GetShipVO() then
		return false
	end

	slot3 = slot1.check_indexList

	if not slot1.check_type and not slot3 then
		return true
	end

	slot4 = false
	slot5 = {}
	slot6 = Clone(slot0:GetShipVO().equipments)

	if slot3 then
		slot7 = #slot6

		while slot7 > 0 do
			if not table.contains(slot3, slot7) then
				table.remove(slot6, slot7)
			end

			slot7 = slot7 - 1
		end
	end

	if slot2 then
		slot7 = #slot6

		while slot7 > 0 do
			if not slot6[slot7] or not table.contains(slot2, slot8.config.type) then
				table.remove(slot6, slot7)
			end

			slot7 = slot7 - 1
		end
	end

	return #slot6 > 0
end

slot0.equipmentEnhance = function (slot0, slot1)
	slot2 = 1
	slot3 = slot1.config.label

	if slot0.label then
		slot2 = 1

		for slot7, slot8 in ipairs(slot0.label) do
			if not table.contains(slot3, slot8) then
				slot2 = 0

				break
			end
		end
	end

	return slot2 == 1
end

slot0.switch2EquipmentSkinPage = function (slot0)
	if slot0.equipSkinLogicPanel:isTweening() then
		return
	end

	slot0.equipSkinLogicPanel:doSwitchAnim(slot0.contextData.isInEquipmentSkinPage)

	slot0.contextData.isInEquipmentSkinPage = not slot0.contextData.isInEquipmentSkinPage

	setActive(slot0.equipSkinBtn:Find("unsel"), not slot0.contextData.isInEquipmentSkinPage)
	setActive(slot0.equipSkinBtn:Find("sel"), slot0.contextData.isInEquipmentSkinPage)
	slot0.equipSkinLogicPanel:updateAll(slot0:GetShipVO())
end

slot0.OnDestroy = function (slot0)
	for slot4, slot5 in ipairs(slot0.equipmentNames) do
		slot5:destroy()
	end

	slot0.equipmentNames = nil

	setParent(slot0.equipmentR, slot0._tf)
	setParent(slot0.equipmentL, slot0._tf)

	slot0.shareData = nil
end

return slot0
