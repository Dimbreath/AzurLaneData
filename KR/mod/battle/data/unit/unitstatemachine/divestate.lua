ys = ys or {}
ys.Battle.DiveState = class("DiveState", ys.Battle.IUnitState)
ys.Battle.DiveState.__name = "DiveState"

function ys.Battle.DiveState.Ctor(slot0)
	slot0.super.Ctor()
end

function ys.Battle.DiveState.AddIdleState(slot0, slot1, slot2)
	slot1:OnIdleState()
end

function ys.Battle.DiveState.AddMoveState(slot0, slot1, slot2)
	slot1:OnMoveState()
end

function ys.Battle.DiveState.AddMoveLeftState(slot0, slot1, slot2)
	slot1:OnMoveLeftState()
end

function ys.Battle.DiveState.AddAttackState(slot0, slot1, slot2)
	slot1:OnRaidState(slot2)
end

function ys.Battle.DiveState.AddDeadState(slot0, slot1, slot2)
	slot1:OnDeadState()
end

function ys.Battle.DiveState.AddSkillState(slot0, slot1, slot2)
	return
end

function ys.Battle.DiveState.AddSpellState(slot0, slot1, slot2)
	slot1:OnSpellState()
end

function ys.Battle.DiveState.AddVictoryState(slot0, slot1, slot2)
	slot1:OnVictoryState()
end

function ys.Battle.DiveState.AddVictorySwimState(slot0, slot1, slot2)
	slot1:OnVictorySwimState()
end

function ys.Battle.DiveState.AddStandState(slot0, slot1, slot2)
	return
end

function ys.Battle.DiveState.AddDiveState(slot0, slot1, slot2)
	return
end

function ys.Battle.DiveState.AddDiveLeftState(slot0, slot1, slot2)
	slot1:OnDiveLeftState()
end

function ys.Battle.DiveState.AddInterruptState(slot0, slot1, slot2)
	slot1:OnInterruptState()
end

function ys.Battle.DiveState.AddDivingState(slot0, slot1, slot2)
	return
end

function ys.Battle.DiveState.OnTrigger(slot0, slot1)
	return
end

function ys.Battle.DiveState.OnStart(slot0, slot1)
	return
end

function ys.Battle.DiveState.OnEnd(slot0, slot1)
	return
end

function ys.Battle.DiveState.CacheWeapon(slot0)
	return true
end

return
