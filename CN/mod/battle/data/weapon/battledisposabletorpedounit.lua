ys = ys or {}
slot1 = ys.Battle.BattleUnitEvent
slot2 = class("BattleDisposableTorpedoUnit", ys.Battle.BattleManualTorpedoUnit)
ys.Battle.BattleDisposableTorpedoUnit = slot2
slot2.__name = "BattleDisposableTorpedoUnit"

slot2.Ctor = function (slot0)
	slot0.super.Ctor(slot0)
end

slot2.EnterCoolDown = function (slot0)
	return
end

slot2.OverHeat = function (slot0)
	slot0.super.OverHeat(slot0)
	slot0._playerTorpedoVO:DispatchOverLoadChange()
end

slot2.GetType = function (slot0)
	return slot0.Battle.BattleConst.EquipmentType.DISPOSABLE_TORPEDO
end

slot2.createMajorEmitter = function (slot0, slot1, slot2, slot3, slot4, slot5)
	return slot0.super.createMajorEmitter(slot0, 1, slot2, slot3, slot4, slot5)
end

return
