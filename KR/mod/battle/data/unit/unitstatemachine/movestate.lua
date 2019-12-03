ys = ys or {}
ys.Battle.MoveState = class("MoveState", ys.Battle.IUnitState)
ys.Battle.MoveState.__name = "MoveState"

ys.Battle.MoveState.Ctor = function (slot0)
	slot0.super.Ctor()
end

ys.Battle.MoveState.AddIdleState = function (slot0, slot1, slot2)
	slot1:OnIdleState()
end

ys.Battle.MoveState.AddMoveState = function (slot0, slot1, slot2)
	return
end

ys.Battle.MoveState.AddMoveLeftState = function (slot0, slot1, slot2)
	slot1:OnMoveLeftState()
end

ys.Battle.MoveState.AddAttackState = function (slot0, slot1, slot2)
	slot1:OnAttackState(slot2)
end

ys.Battle.MoveState.AddDeadState = function (slot0, slot1, slot2)
	slot1:OnDeadState()
end

ys.Battle.MoveState.AddSkillState = function (slot0, slot1, slot2)
	return
end

ys.Battle.MoveState.AddSpellState = function (slot0, slot1, slot2)
	slot1:OnSpellState()
end

ys.Battle.MoveState.AddVictoryState = function (slot0, slot1, slot2)
	slot1:OnVictoryState()
end

ys.Battle.MoveState.AddVictorySwimState = function (slot0, slot1, slot2)
	slot1:OnVictorySwimState()
end

ys.Battle.MoveState.AddStandState = function (slot0, slot1, slot2)
	return
end

ys.Battle.MoveState.AddDiveState = function (slot0, slot1, slot2)
	slot1:OnDiveState()
end

ys.Battle.MoveState.AddDiveLeftState = function (slot0, slot1, slot2)
	slot1:OnDiveLeftState()
end

ys.Battle.MoveState.AddInterruptState = function (slot0, slot1, slot2)
	slot1:OnInterruptState()
end

ys.Battle.MoveState.AddDivingState = function (slot0, slot1, slot2)
	slot1:OnDivingState()
end

ys.Battle.MoveState.OnTrigger = function (slot0, slot1)
	return
end

ys.Battle.MoveState.OnStart = function (slot0, slot1)
	return
end

ys.Battle.MoveState.OnEnd = function (slot0, slot1)
	return
end

ys.Battle.MoveState.CacheWeapon = function (slot0)
	return true
end

return
