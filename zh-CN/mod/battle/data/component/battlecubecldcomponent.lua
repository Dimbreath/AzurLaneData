ys = ys or {}
slot0 = ys
slot1 = class("BattleCubeCldComponent", slot0.Battle.BattleCldComponent)
slot0.Battle.BattleCubeCldComponent = slot1
slot1.__name = "BattleCubeCldComponent"

function slot1.Ctor(slot0, slot1, slot2, slot3, slot4, slot5)
	uv0.Battle.BattleCubeCldComponent.super.Ctor(slot0)

	slot6 = slot1 * 0.5
	slot7 = slot2 * 0.5
	slot8 = slot3 * 0.5
	slot0._boxSize = Vector3(slot6, slot7, slot8)
	slot0._offset = Vector3(slot4, 0, slot5)
	slot0._min = Vector3(slot4 - slot6, -slot7, slot5 - slot8)
	slot0._max = Vector3(slot4 + slot6, slot7, slot5 + slot8)
	slot0._box = pg.CldNode.New()
end

function slot1.GetCenterOffset(slot0, slot1)
	return slot0._offset
end

function slot1.GetCldBox(slot0, slot1)
	return slot0._box:UpdateBox(slot0._min, slot0._max, slot1)
end

function slot1.GetCldBoxSize(slot0)
	return slot0._boxSize
end
