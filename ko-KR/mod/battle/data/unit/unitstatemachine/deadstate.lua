ys = ys or {}
ys.Battle.DeadState = class("DeadState", ys.Battle.IUnitState)
ys.Battle.DeadState.__name = "DeadState"

function ys.Battle.DeadState.Ctor(slot0)
	slot0.super.Ctor()
end

function ys.Battle.DeadState.AddIdleState(slot0, slot1, slot2)
	return
end

function ys.Battle.DeadState.AddMoveState(slot0, slot1, slot2)
	return
end

function ys.Battle.DeadState.AddMoveLeftState(slot0, slot1, slot2)
	return
end

function ys.Battle.DeadState.AddAttackState(slot0, slot1, slot2)
	return
end

function ys.Battle.DeadState.AddDeadState(slot0, slot1, slot2)
	return
end

function ys.Battle.DeadState.AddSkillState(slot0, slot1, slot2)
	return
end

function ys.Battle.DeadState.AddSpellState(slot0, slot1, slot2)
	return
end

function ys.Battle.DeadState.AddVictoryState(slot0, slot1, slot2)
	return
end

function ys.Battle.DeadState.AddStandState(slot0, slot1, slot2)
	return
end

function ys.Battle.DeadState.AddDiveState(slot0, slot1, slot2)
	return
end

function ys.Battle.DeadState.AddDiveLeftState(slot0, slot1, slot2)
	return
end

function ys.Battle.DeadState.AddInterruptState(slot0, slot1, slot2)
	return
end

function ys.Battle.DeadState.AddDivingState(slot0, slot1, slot2)
	return
end

function ys.Battle.DeadState.OnTrigger(slot0, slot1)
	return
end

function ys.Battle.DeadState.OnStart(slot0, slot1)
	return
end

function ys.Battle.DeadState.OnEnd(slot0, slot1)
	slot1:GetTarget():SendDeadEvent()
end

function ys.Battle.DeadState.CacheWeapon(slot0)
	return true
end

return
