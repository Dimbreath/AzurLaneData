slot0 = class("StoreHouseSceneTransformVer", import(".StoreHouseScene"))
slot1 = require("view.equipment.EquipmentSortCfg")

function slot0.getUIName(slot0)
	return "StoreHouseUI"
end

function slot0.init(slot0)
	uv0.super.init(slot0)
	setText(slot0.selectTransformPanel:Find("cancel_button/Image"), i18n("msgbox_text_cancel"))
	setText(slot0.selectTransformPanel:Find("confirm_button/Image"), i18n("msgbox_text_confirm"))
end

function slot0.didEnter(slot0)
	uv0.super.didEnter(slot0)
	setActive(slot0.bottomBack, false)
	setActive(slot0.selectTransformPanel, true)
	setActive(slot0.filterBusyToggle, false)
	setActive(slot0.indexBtn, false)
	setActive(slot0.sortBtn, false)
	setActive(slot0.equipSkinFilteBtn, false)
	onButton(slot0, slot0.helpBtn, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_equipment.tip
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.selectTransformPanel:Find("cancel_button"), function ()
		uv0:emit(uv1.ON_BACK)
	end, SFX_CANCEL)
	onButton(slot0, slot0.selectTransformPanel:Find("confirm_button"), function ()
		if uv0.contextData.onConfirm(_.map(uv0.selectedIds, function (slot0)
			return slot0[1]
		end)) then
			uv0:closeView()
		end
	end, SFX_PANEL)
end

function slot0.SelectTransformEquip(slot0, slot1, slot2)
	slot3 = false

	if slot0.selectedIds[1] and slot0.SameEquip(slot0.selectedIds[1][1], slot1) then
		slot3 = true
	end

	if not slot3 then
		if slot0.contextData.OnSelect and not slot0.contextData.onSelect(slot1) then
			return
		end

		table.clean(slot0.selectedIds)
		table.insert(slot0.selectedIds, {
			slot1,
			1
		})
	else
		table.clean(slot0.selectedIds)
	end

	slot0:updateSelected()
end

function slot0.initEquipment(slot0, slot1)
	slot2 = EquipmentItemTransformVer.New(slot1)

	onButton(slot0, slot2.go, function ()
		if uv0.equipmentVO == nil or uv0.equipmentVO.mask then
			return
		end

		uv1:SelectTransformEquip(uv0.equipmentVO, uv0.equipmentVO.count)
	end, SFX_PANEL)

	slot0.equipmetItems[slot1] = slot2
end

function slot0.updateEquipment(slot0, slot1, slot2)
	if not slot0.equipmetItems[slot2] then
		slot0:initEquipment(slot2)

		slot3 = slot0.equipmetItems[slot2]
	end

	slot4 = slot0.loadEquipmentVOs[slot1 + 1]

	slot3:update(slot4)

	slot5 = false
	slot6 = 0

	if slot4 then
		for slot10, slot11 in ipairs(slot0.selectedIds) do
			if slot0.SameEquip(slot4, slot11[1]) then
				slot5 = true
				slot6 = slot11[2]

				break
			end
		end
	end

	slot3:updateSelected(slot5, slot6)
end

function slot0.updateSelected(slot0)
	for slot4, slot5 in pairs(slot0.equipmetItems) do
		if slot5.equipmentVO then
			slot6 = false
			slot7 = 0

			for slot11, slot12 in pairs(slot0.selectedIds) do
				if slot0.SameEquip(slot5.equipmentVO, slot12[1]) then
					slot6 = true
					slot7 = slot12[2]

					break
				end
			end

			slot5:updateSelected(slot6, slot7)
		end
	end
end

function slot0.SameEquip(slot0, slot1)
	return slot0.id == slot1.id and slot0.shipId == slot1.shipId and slot0.shipPos == slot1.shipPos
end

function slot0.filterEquipment(slot0)
	slot1 = slot0.contextData.sortData
	slot2 = slot0.page
	slot3 = {}
	slot0.loadEquipmentVOs = {}

	for slot7, slot8 in pairs(slot0.equipmentVOs) do
		if not slot8.isSkin then
			table.insert(slot3, slot8)
		end
	end

	for slot7, slot8 in pairs(slot3) do
		if (slot8.count > 0 or slot8.shipId) and slot0:checkFitBusyCondition(slot8) then
			table.insert(slot0.loadEquipmentVOs, slot8)
		end
	end

	if slot0.filterImportance ~= nil then
		for slot7 = #slot0.loadEquipmentVOs, 1, -1 do
			if slot0.loadEquipmentVOs[slot7].isSkin or not slot8.isSkin and slot8:isImportance() then
				table.remove(slot0.loadEquipmentVOs, slot7)
			end
		end
	end

	if slot1 then
		slot4 = slot0.asc

		table.sort(slot0.loadEquipmentVOs, function (slot0, slot1)
			if (slot0.shipId or -1) ~= (slot1.shipId or -1) then
				return (uv0 and {
					slot2 < slot3
				} or {
					slot3 < slot2
				})[1]
			else
				return uv1.sortFunc(slot0, slot1, uv2, uv0)
			end
		end)
	end

	if slot0.contextData.qiutBtn then
		table.insert(slot0.loadEquipmentVOs, 1, nil)

		if #slot0.loadEquipmentVOs == 0 then
			slot0:updateEquipmentCount(1)

			return
		end
	end

	slot0:updateSelected()
	slot0:updateEquipmentCount()
	setActive(slot0.sortImgAsc, slot0.asc)
	setActive(slot0.sortImgDec, not slot0.asc)
end

function slot0.checkFitBusyCondition(slot0, slot1)
	return true
end

return slot0
