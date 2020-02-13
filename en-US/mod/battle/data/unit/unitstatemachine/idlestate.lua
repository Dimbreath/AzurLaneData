ys = ys or {}
ys.Battle.IdleState = class("IdleState", ys.Battle.IUnitState)
ys.Battle.IdleState.__name = "IdleState"

function ys.Battle.IdleState.Ctor(slot0)
	slot0.super.Ctor()
end

function ys.Battle.IdleState.AddIdleState(slot0, slot1, slot2)
	return
end

function ys.Battle.IdleState.AddMoveState(slot0, slot1, slot2)
	slot1:OnMoveState()
end

function ys.Battle.IdleState.AddMoveLeftState(slot0, slot1, slot2)
	slot1:OnMoveLeftState()
end

function ys.Battle.IdleState.AddAttackState(slot0, slot1, slot2)
	slot1:OnAttackState(slot2)
end

function ys.Battle.IdleState.AddDeadState(slot0, slot1, slot2)
	slot1:OnDeadState()
end

function ys.Battle.IdleState.AddSkillState(slot0, slot1, slot2)
	return
end

function ys.Battle.IdleState.AddSpellState(slot0, slot1, slot2)
	slot1:OnSpellState()
end

function ys.Battle.IdleState.AddVictoryState(slot0, slot1, slot2)
	slot1:OnVictoryState()
end

function ys.Battle.IdleState.AddVictorySwimState(slot0, slot1, slot2)
	slot1:OnVictorySwimState()
end

function ys.Battle.IdleState.AddStandState(slot0, slot1, slot2)
	slot1:OnDiveState()
end

function ys.Battle.IdleState.AddDiveState(slot0, slot1, slot2)
	slot1:OnDiveState()
end

function ys.Battle.IdleState.AddDiveLeftState(slot0, slot1, slot2)
	slot1:OnDiveLeftState()
end

function ys.Battle.IdleState.AddInterruptState(slot0, slot1, slot2)
	slot1:OnInterruptState()
end

function ys.Battle.IdleState.AddDivingState(slot0, slot1, slot2)
	slot1:OnDivingState()
end

function ys.Battle.IdleState.OnTrigger(slot0, slot1)
	return
end

function ys.Battle.IdleState.OnStart(slot0, slot1)
	return
end

function ys.Battle.IdleState.OnEnd(slot0, slot1)
	return
end

function ys.Battle.IdleState.CacheWeapon(slot0)
	return true
end

return
