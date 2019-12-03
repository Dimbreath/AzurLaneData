ys = ys or {}
ys.Battle.StandState = class("StandState", ys.Battle.IUnitState)
ys.Battle.StandState.__name = "StandState"

ys.Battle.StandState.Ctor = function (slot0)
	slot0.super.Ctor()
end

ys.Battle.StandState.AddIdleState = function (slot0, slot1, slot2)
	return
end

ys.Battle.StandState.AddMoveState = function (slot0, slot1, slot2)
	return
end

ys.Battle.StandState.AddMoveLeftState = function (slot0, slot1, slot2)
	return
end

ys.Battle.StandState.AddAttackState = function (slot0, slot1, slot2)
	return
end

ys.Battle.StandState.AddDeadState = function (slot0, slot1, slot2)
	return
end

ys.Battle.StandState.AddSkillState = function (slot0, slot1, slot2)
	return
end

ys.Battle.StandState.AddSpellState = function (slot0, slot1, slot2)
	return
end

ys.Battle.StandState.AddVictoryState = function (slot0, slot1, slot2)
	return
end

ys.Battle.StandState.AddVictorySwimState = function (slot0, slot1, slot2)
	return
end

ys.Battle.StandState.AddStandState = function (slot0, slot1, slot2)
	return
end

ys.Battle.StandState.AddDiveState = function (slot0, slot1, slot2)
	return
end

ys.Battle.StandState.AddDiveLeftState = function (slot0, slot1, slot2)
	return
end

ys.Battle.StandState.AddInterruptState = function (slot0, slot1, slot2)
	slot1:OnInterruptState()
end

ys.Battle.StandState.AddDivingState = function (slot0, slot1, slot2)
	slot1:OnDivingState()
end

ys.Battle.StandState.OnTrigger = function (slot0, slot1)
	return
end

ys.Battle.StandState.OnStart = function (slot0, slot1)
	return
end

ys.Battle.StandState.OnEnd = function (slot0, slot1)
	slot1:OnVictoryState()
end

ys.Battle.StandState.CacheWeapon = function (slot0)
	return true
end

return
