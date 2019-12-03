slot0 = class("ShipEquipSkinLogicPanel", import("...base.BasePanel"))
slot1 = 0.2

function slot0.init(slot0)
	slot0.equipmentTFs = {
		slot0:findTF("equipment_r/skin/equipment_r1"),
		slot0:findTF("equipment_r/skin/equipment_r2"),
		slot0:findTF("equipment_r/skin/equipment_r3"),
		slot0:findTF("equipment_l/skin/equipment_l1"),
		slot0:findTF("equipment_l/skin/equipment_l2")
	}
	slot0.equipmentNormalTFs = {
		slot0:findTF("equipment_r/equipment/equipment_r1"),
		slot0:findTF("equipment_r/equipment/equipment_r2"),
		slot0:findTF("equipment_r/equipment/equipment_r3"),
		slot0:findTF("equipment_l/equipment/equipment_l1"),
		slot0:findTF("equipment_l/equipment/equipment_l2")
	}
	slot0.equipmentR = slot0:findTF("equipment_r/equipment")
	slot0.equipmentL = slot0:findTF("equipment_l/equipment")
	slot0.skinR = slot0:findTF("equipment_r/skin")
	slot0.skinL = slot0:findTF("equipment_l/skin")
	slot0.infoPanel = slot0:findTF("info", slot0.equipmentTFs[1])
	slot0.inSkinPage = true
end

function slot0.setLabelResource(slot0, slot1)
	slot0.resource = slot1
end

function slot0.doSwitchAnim(slot0, slot1)
	if slot0:isTweening() then
		return
	end

	slot0.inSkinPage = slot1

	slot0:doAnim(slot0.equipmentR, slot0.skinR)
	slot0:doAnim(slot0.equipmentL, slot0.skinL)
end

function slot0.isTweening(slot0)
	if LeanTween.isTweening(go(slot0.equipmentR)) or LeanTween.isTweening(go(slot0.skinR)) or LeanTween.isTweening(go(slot0.equipmentL)) or LeanTween.isTweening(go(slot0.skinL)) then
		return true
	end

	return false
end

function slot0.doAnim(slot0, slot1, slot2)
	slot5 = slot1:GetComponent(typeof(CanvasGroup))
	slot6 = slot2:GetComponent(typeof(CanvasGroup))

	LeanTween.moveLocal(go(slot1), slot3, slot0)
	LeanTween.moveLocal(go(slot2), slot4, slot0)

	slot7 = 0.8
	slot8 = 1

	if not slot0.inSkinPage then
		slot8 = 0.8
		slot7 = 1
	end

	LeanTween.value(go(slot1), slot7, slot8, slot0):setOnUpdate(System.Action_float(function (slot0)
		slot0.alpha = slot0
	end))
	LeanTween.value(go(slot2), slot8, slot7, slot0):setOnUpdate(System.Action_float(function (slot0)
		slot0.alpha = slot0
	end))

	slot6.blocksRaycasts = not slot0.inSkinPage
	slot5.blocksRaycasts = slot0.inSkinPage

	(not slot0.inSkinPage and slot2) or slot1:SetAsLastSibling()
end

function slot0.updateAll(slot0, slot1)
	if slot1 then
		for slot5, slot6 in ipairs(slot0.equipmentTFs) do
			if not not table.contains(ShipEquipView.UNLOCK_EQUPMENT_SKIN_POS, slot5) then
				slot0:updateEquipmentTF(slot1, slot5)
			end

			if slot0:findTF("shadow", slot6) then
				setActive(slot8, slot0.inSkinPage)
			end
		end

		for slot5, slot6 in ipairs(slot0.equipmentNormalTFs) do
			if slot0:findTF("shadow", slot6) then
				setActive(slot7, not slot0.inSkinPage)
			end
		end
	end
end

function slot0.updateEquipmentTF(slot0, slot1, slot2)
	slot0.shipVO = slot1

	if slot1 then
		removeOnButton(slot3)

		slot4 = slot1:getEquip(slot2)

		if IsNil(slot0.equipmentTFs[slot2].Find(slot3, "info")) then
			slot5 = cloneTplTo(slot0.infoPanel, slot3, "info")
		end

		slot0:findTF("panel_title/type", slot3).GetComponent(slot6, typeof(Text)).text = EquipType.LabelToName(slot7)

		setActive(slot5, slot4)
		setActive(slot3:Find("unequip"), not slot4)

		if slot4 then
			slot9 = slot4:canEquipSkin()

			setActive(slot5:Find("forbid"), not slot9)
			setActive(slot5:Find("equip"), slot9)

			if slot9 then
				slot0:updateEquipmentPanel(slot10, slot2)
			end
		end
	end
end

function slot0.updateEquipmentPanel(slot0, slot1, slot2)
	slot3 = slot0.shipVO:getEquip(slot2)
	slot4 = slot3.skinId
	slot5 = slot3:hasSkin()

	setActive(slot7, slot5)
	setActive(slot1:Find("add"), not slot5)

	if slot5 then
		slot0:updateSkinInfo(slot7, slot4)
		onButton(slot0, slot0.equipmentTFs[slot2], function ()
			slot0:emit(ShipMainMediator.ON_SELECT_EQUIPMENT_SKIN, slot0)
		end, SFX_PANEL)
	else
		onButton(slot0, slot6:Find("icon"), function ()
			slot0:emit(ShipMainMediator.ON_SELECT_EQUIPMENT_SKIN, slot0)
		end, SFX_PANEL)
	end
end

function slot0.updateSkinInfo(slot0, slot1, slot2)
	setText(slot1:Find("desc"), pg.equip_skin_template[slot2].desc)
	setText(slot1:Find("cont/name_mask/name"), shortenString(pg.equip_skin_template[slot2].name, 10))
	updateDrop(slot1:Find("IconTpl"), {
		type = DROP_TYPE_EQUIPMENT_SKIN,
		id = slot2
	})
end

return slot0
