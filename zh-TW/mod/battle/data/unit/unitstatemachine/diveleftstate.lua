ys = ys or {}
ys.Battle.DiveLeftState = class("DiveLeftState", ys.Battle.IUnitState)
ys.Battle.DiveLeftState.__name = "DiveLeftState"

function ys.Battle.DiveLeftState.Ctor(slot0)
	slot0.super.Ctor()
end

function ys.Battle.DiveLeftState.AddIdleState(slot0, slot1, slot2)
	slot1:OnIdleState()
end

function ys.Battle.DiveLeftState.AddMoveState(slot0, slot1, slot2)
	slot1:OnMoveState()
end

function ys.Battle.DiveLeftState.AddMoveLeftState(slot0, slot1, slot2)
	slot1:OnMoveLeftState()
end

function ys.Battle.DiveLeftState.AddAttackState(slot0, slot1, slot2)
	slot1:OnRaidLeftState(slot2)
end

function ys.Battle.DiveLeftState.AddDeadState(slot0, slot1, slot2)
	slot1:OnDeadState()
end

function ys.Battle.DiveLeftState.AddSkillState(slot0, slot1, slot2)
	return
end

function ys.Battle.DiveLeftState.AddSpellState(slot0, slot1, slot2)
	slot1:OnSpellState()
end

function ys.Battle.DiveLeftState.AddVictoryState(slot0, slot1, slot2)
	slot1:OnVictoryState()
end

function ys.Battle.DiveLeftState.AddVictorySwimState(slot0, slot1, slot2)
	slot1:OnVictorySwimState()
end

function ys.Battle.DiveLeftState.AddStandState(slot0, slot1, slot2)
	return
end

function ys.Battle.DiveLeftState.AddDiveState(slot0, slot1, slot2)
	slot1:OnDiveState()
end

function ys.Battle.DiveLeftState.AddDiveLeftState(slot0, slot1, slot2)
	return
end

function ys.Battle.DiveLeftState.AddInterruptState(slot0, slot1, slot2)
	slot1:OnInterruptState()
end

function ys.Battle.DiveLeftState.AddDivingState(slot0, slot1, slot2)
	return
end

function ys.Battle.DiveLeftState.OnTrigger(slot0, slot1)
	return
end

function ys.Battle.DiveLeftState.OnStart(slot0, slot1)
	return
end

function ys.Battle.DiveLeftState.OnEnd(slot0, slot1)
	return
end

function ys.Battle.DiveLeftState.CacheWeapon(slot0)
	return true
end

return
