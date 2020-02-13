ys = ys or {}
ys.Battle.MoveState = class("MoveState", ys.Battle.IUnitState)
ys.Battle.MoveState.__name = "MoveState"

function ys.Battle.MoveState.Ctor(slot0)
	slot0.super.Ctor()
end

function ys.Battle.MoveState.AddIdleState(slot0, slot1, slot2)
	slot1:OnIdleState()
end

function ys.Battle.MoveState.AddMoveState(slot0, slot1, slot2)
	return
end

function ys.Battle.MoveState.AddMoveLeftState(slot0, slot1, slot2)
	slot1:OnMoveLeftState()
end

function ys.Battle.MoveState.AddAttackState(slot0, slot1, slot2)
	slot1:OnAttackState(slot2)
end

function ys.Battle.MoveState.AddDeadState(slot0, slot1, slot2)
	slot1:OnDeadState()
end

function ys.Battle.MoveState.AddSkillState(slot0, slot1, slot2)
	return
end

function ys.Battle.MoveState.AddSpellState(slot0, slot1, slot2)
	slot1:OnSpellState()
end

function ys.Battle.MoveState.AddVictoryState(slot0, slot1, slot2)
	slot1:OnVictoryState()
end

function ys.Battle.MoveState.AddVictorySwimState(slot0, slot1, slot2)
	slot1:OnVictorySwimState()
end

function ys.Battle.MoveState.AddStandState(slot0, slot1, slot2)
	return
end

function ys.Battle.MoveState.AddDiveState(slot0, slot1, slot2)
	slot1:OnDiveState()
end

function ys.Battle.MoveState.AddDiveLeftState(slot0, slot1, slot2)
	slot1:OnDiveLeftState()
end

function ys.Battle.MoveState.AddInterruptState(slot0, slot1, slot2)
	slot1:OnInterruptState()
end

function ys.Battle.MoveState.AddDivingState(slot0, slot1, slot2)
	slot1:OnDivingState()
end

function ys.Battle.MoveState.OnTrigger(slot0, slot1)
	return
end

function ys.Battle.MoveState.OnStart(slot0, slot1)
	return
end

function ys.Battle.MoveState.OnEnd(slot0, slot1)
	return
end

function ys.Battle.MoveState.CacheWeapon(slot0)
	return true
end

return
