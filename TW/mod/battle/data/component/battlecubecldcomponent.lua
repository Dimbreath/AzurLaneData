ys = ys or {}
slot1 = class("BattleCubeCldComponent", ys.Battle.BattleCldComponent)
ys.Battle.BattleCubeCldComponent = slot1
slot1.__name = "BattleCubeCldComponent"

slot1.Ctor = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.Battle.BattleCubeCldComponent.super.Ctor(slot0)

	slot0._boxSize = Vector3(slot6, slot7, slot8)
	slot0._offset = Vector3(slot4, 0, slot5)
	slot0._min = Vector3(slot4 - slot1 * 0.5, -(slot2 * 0.5), slot5 - slot3 * 0.5)
	slot0._max = Vector3(slot4 + slot1 * 0.5, slot2 * 0.5, slot5 + slot3 * 0.5)
	slot0._box = pg.CldNode.New()
end

slot1.GetCenterOffset = function (slot0, slot1)
	return slot0._offset
end

slot1.GetCldBox = function (slot0, slot1)
	return slot0._box:UpdateBox(slot0._min, slot0._max, slot1)
end

slot1.GetCldBoxSize = function (slot0)
	return slot0._boxSize
end

return
