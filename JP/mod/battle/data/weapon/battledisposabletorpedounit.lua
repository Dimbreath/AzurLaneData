ys = ys or {}
slot1 = ys.Battle.BattleUnitEvent
slot2 = class("BattleDisposableTorpedoUnit", ys.Battle.BattleManualTorpedoUnit)
ys.Battle.BattleDisposableTorpedoUnit = slot2
slot2.__name = "BattleDisposableTorpedoUnit"

function slot2.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function slot2.EnterCoolDown(slot0)
	return
end

function slot2.Fire(slot0)
	slot0.super.Fire(slot0)
	slot0._playerTorpedoVO:Deduct(slot0)
	slot0._playerTorpedoVO:DispatchOverLoadChange()

	return true
end

function slot2.OverHeat(slot0)
	slot0._currentState = slot0.STATE_OVER_HEAT
end

function slot2.GetType(slot0)
	return slot0.Battle.BattleConst.EquipmentType.DISPOSABLE_TORPEDO
end

function slot2.createMajorEmitter(slot0, slot1, slot2, slot3, slot4, slot5)
	return slot0.super.createMajorEmitter(slot0, 1, slot2, slot3, slot4, slot5)
end

return
