ys = ys or {}
ys.Battle.MoveLeftState = class("MoveLeftState", ys.Battle.IUnitState)
ys.Battle.MoveLeftState.__name = "MoveLeftState"

ys.Battle.MoveLeftState.Ctor = function (slot0)
	slot0.super.Ctor()
end

ys.Battle.MoveLeftState.AddIdleState = function (slot0, slot1, slot2)
	slot1:OnIdleState()
end

ys.Battle.MoveLeftState.AddMoveState = function (slot0, slot1, slot2)
	slot1:OnMoveState()
end

ys.Battle.MoveLeftState.AddMoveLeftState = function (slot0, slot1, slot2)
	return
end

ys.Battle.MoveLeftState.AddAttackState = function (slot0, slot1, slot2)
	slot1:OnAttackLeftState(slot2)
end

ys.Battle.MoveLeftState.AddDeadState = function (slot0, slot1, slot2)
	slot1:OnDeadState()
end

ys.Battle.MoveLeftState.AddSkillState = function (slot0, slot1, slot2)
	return
end

ys.Battle.MoveLeftState.AddSpellState = function (slot0, slot1, slot2)
	slot1:OnSpellState()
end

ys.Battle.MoveLeftState.AddVictoryState = function (slot0, slot1, slot2)
	slot1:OnVictoryState()
end

ys.Battle.MoveLeftState.AddVictorySwimState = function (slot0, slot1, slot2)
	slot1:OnVictorySwimState()
end

ys.Battle.MoveLeftState.AddStandState = function (slot0, slot1, slot2)
	return
end

ys.Battle.MoveLeftState.AddDiveState = function (slot0, slot1, slot2)
	slot1:OnDiveState()
end

ys.Battle.MoveLeftState.AddDiveLeftState = function (slot0, slot1, slot2)
	slot1:OnDiveLeftState()
end

ys.Battle.MoveLeftState.AddInterruptState = function (slot0, slot1, slot2)
	slot1:OnInterruptState()
end

ys.Battle.MoveLeftState.AddDivingState = function (slot0, slot1, slot2)
	slot1:OnDivingState()
end

ys.Battle.MoveLeftState.OnTrigger = function (slot0, slot1)
	return
end

ys.Battle.MoveLeftState.OnStart = function (slot0, slot1)
	return
end

ys.Battle.MoveLeftState.OnEnd = function (slot0, slot1)
	return
end

ys.Battle.MoveLeftState.CacheWeapon = function (slot0)
	return true
end

return
