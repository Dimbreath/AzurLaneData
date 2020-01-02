ys = ys or {}
ys.Battle.MoveLeftState = class("MoveLeftState", ys.Battle.IUnitState)
ys.Battle.MoveLeftState.__name = "MoveLeftState"

function ys.Battle.MoveLeftState.Ctor(slot0)
	slot0.super.Ctor()
end

function ys.Battle.MoveLeftState.AddIdleState(slot0, slot1, slot2)
	slot1:OnIdleState()
end

function ys.Battle.MoveLeftState.AddMoveState(slot0, slot1, slot2)
	slot1:OnMoveState()
end

function ys.Battle.MoveLeftState.AddMoveLeftState(slot0, slot1, slot2)
	return
end

function ys.Battle.MoveLeftState.AddAttackState(slot0, slot1, slot2)
	slot1:OnAttackLeftState(slot2)
end

function ys.Battle.MoveLeftState.AddDeadState(slot0, slot1, slot2)
	slot1:OnDeadState()
end

function ys.Battle.MoveLeftState.AddSkillState(slot0, slot1, slot2)
	return
end

function ys.Battle.MoveLeftState.AddSpellState(slot0, slot1, slot2)
	slot1:OnSpellState()
end

function ys.Battle.MoveLeftState.AddVictoryState(slot0, slot1, slot2)
	slot1:OnVictoryState()
end

function ys.Battle.MoveLeftState.AddVictorySwimState(slot0, slot1, slot2)
	slot1:OnVictorySwimState()
end

function ys.Battle.MoveLeftState.AddStandState(slot0, slot1, slot2)
	return
end

function ys.Battle.MoveLeftState.AddDiveState(slot0, slot1, slot2)
	slot1:OnDiveState()
end

function ys.Battle.MoveLeftState.AddDiveLeftState(slot0, slot1, slot2)
	slot1:OnDiveLeftState()
end

function ys.Battle.MoveLeftState.AddInterruptState(slot0, slot1, slot2)
	slot1:OnInterruptState()
end

function ys.Battle.MoveLeftState.AddDivingState(slot0, slot1, slot2)
	slot1:OnDivingState()
end

function ys.Battle.MoveLeftState.OnTrigger(slot0, slot1)
	return
end

function ys.Battle.MoveLeftState.OnStart(slot0, slot1)
	return
end

function ys.Battle.MoveLeftState.OnEnd(slot0, slot1)
	return
end

function ys.Battle.MoveLeftState.CacheWeapon(slot0)
	return true
end

return
