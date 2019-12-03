ys = ys or {}
ys.Battle.DeadState = class("DeadState", ys.Battle.IUnitState)
ys.Battle.DeadState.__name = "DeadState"

ys.Battle.DeadState.Ctor = function (slot0)
	slot0.super.Ctor()
end

ys.Battle.DeadState.AddIdleState = function (slot0, slot1, slot2)
	return
end

ys.Battle.DeadState.AddMoveState = function (slot0, slot1, slot2)
	return
end

ys.Battle.DeadState.AddMoveLeftState = function (slot0, slot1, slot2)
	return
end

ys.Battle.DeadState.AddAttackState = function (slot0, slot1, slot2)
	return
end

ys.Battle.DeadState.AddDeadState = function (slot0, slot1, slot2)
	return
end

ys.Battle.DeadState.AddSkillState = function (slot0, slot1, slot2)
	return
end

ys.Battle.DeadState.AddSpellState = function (slot0, slot1, slot2)
	return
end

ys.Battle.DeadState.AddVictoryState = function (slot0, slot1, slot2)
	return
end

ys.Battle.DeadState.AddStandState = function (slot0, slot1, slot2)
	return
end

ys.Battle.DeadState.AddDiveState = function (slot0, slot1, slot2)
	return
end

ys.Battle.DeadState.AddDiveLeftState = function (slot0, slot1, slot2)
	return
end

ys.Battle.DeadState.AddInterruptState = function (slot0, slot1, slot2)
	return
end

ys.Battle.DeadState.AddDivingState = function (slot0, slot1, slot2)
	return
end

ys.Battle.DeadState.OnTrigger = function (slot0, slot1)
	return
end

ys.Battle.DeadState.OnStart = function (slot0, slot1)
	return
end

ys.Battle.DeadState.OnEnd = function (slot0, slot1)
	slot1:GetTarget():SendDeadEvent()
end

ys.Battle.DeadState.CacheWeapon = function (slot0)
	return true
end

return
