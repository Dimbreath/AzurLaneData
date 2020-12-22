slot0 = class("EquipmentItemTransformVer", import(".EquipmentItem"))

function slot0.updateSelected(slot0, slot1)
	slot0.selected = slot1

	setActive(slot0.selectedMask, slot1)
end

return slot0
