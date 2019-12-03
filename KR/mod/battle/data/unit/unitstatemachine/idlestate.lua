ys = ys or {}
ys.Battle.IdleState = class("IdleState", ys.Battle.IUnitState)
ys.Battle.IdleState.__name = "IdleState"

ys.Battle.IdleState.Ctor = function (slot0)
	slot0.super.Ctor()
end

ys.Battle.IdleState.AddIdleState = function (slot0, slot1, slot2)
	return
end

ys.Battle.IdleState.AddMoveState = function (slot0, slot1, slot2)
	slot1:OnMoveState()
end

ys.Battle.IdleState.AddMoveLeftState = function (slot0, slot1, slot2)
	slot1:OnMoveLeftState()
end

ys.Battle.IdleState.AddAttackState = function (slot0, slot1, slot2)
	slot1:OnAttackState(slot2)
end

ys.Battle.IdleState.AddDeadState = function (slot0, slot1, slot2)
	slot1:OnDeadState()
end

ys.Battle.IdleState.AddSkillState = function (slot0, slot1, slot2)
	return
end

ys.Battle.IdleState.AddSpellState = function (slot0, slot1, slot2)
	slot1:OnSpellState()
end

ys.Battle.IdleState.AddVictoryState = function (slot0, slot1, slot2)
	slot1:OnVictoryState()
end

ys.Battle.IdleState.AddVictorySwimState = function (slot0, slot1, slot2)
	slot1:OnVictorySwimState()
end

ys.Battle.IdleState.AddStandState = function (slot0, slot1, slot2)
	slot1:OnDiveState()
end

ys.Battle.IdleState.AddDiveState = function (slot0, slot1, slot2)
	slot1:OnDiveState()
end

ys.Battle.IdleState.AddDiveLeftState = function (slot0, slot1, slot2)
	slot1:OnDiveLeftState()
end

ys.Battle.IdleState.AddInterruptState = function (slot0, slot1, slot2)
	slot1:OnInterruptState()
end

ys.Battle.IdleState.AddDivingState = function (slot0, slot1, slot2)
	slot1:OnDivingState()
end

ys.Battle.IdleState.OnTrigger = function (slot0, slot1)
	return
end

ys.Battle.IdleState.OnStart = function (slot0, slot1)
	return
end

ys.Battle.IdleState.OnEnd = function (slot0, slot1)
	return
end

ys.Battle.IdleState.CacheWeapon = function (slot0)
	return true
end

return
