ys = ys or {}
ys.Battle.AttackState = class("AttackState", ys.Battle.IUnitState)
ys.Battle.AttackState.__name = "AttackState"

ys.Battle.AttackState.Ctor = function (slot0)
	slot0.super.Ctor()
end

ys.Battle.AttackState.AddIdleState = function (slot0, slot1, slot2)
	return
end

ys.Battle.AttackState.AddMoveState = function (slot0, slot1, slot2)
	return
end

ys.Battle.AttackState.AddMoveLeftState = function (slot0, slot1, slot2)
	return
end

ys.Battle.AttackState.AddAttackState = function (slot0, slot1, slot2)
	return
end

ys.Battle.AttackState.AddDeadState = function (slot0, slot1, slot2)
	slot1:OnDeadState()
end

ys.Battle.AttackState.AddSkillState = function (slot0, slot1, slot2)
	return
end

ys.Battle.AttackState.AddSpellState = function (slot0, slot1, slot2)
	slot1:OnSpellState()
end

ys.Battle.AttackState.AddVictoryState = function (slot0, slot1, slot2)
	slot1:OnVictoryState()
end

ys.Battle.AttackState.AddVictorySwimState = function (slot0, slot1, slot2)
	slot1:OnVictorySwimState()
end

ys.Battle.AttackState.AddStandState = function (slot0, slot1, slot2)
	return
end

ys.Battle.AttackState.AddDiveState = function (slot0, slot1, slot2)
	return
end

ys.Battle.AttackState.AddDiveLeftState = function (slot0, slot1, slot2)
	return
end

ys.Battle.AttackState.AddInterruptState = function (slot0, slot1, slot2)
	slot0:OnTrigger(slot1)
	slot1:OnInterruptState()
end

ys.Battle.AttackState.AddDivingState = function (slot0, slot1, slot2)
	slot0:OnTrigger(slot1)
	slot1:OnDivingState()
end

ys.Battle.AttackState.OnTrigger = function (slot0, slot1)
	slot1:GetTarget():SendAttackTrigger()
end

ys.Battle.AttackState.OnStart = function (slot0, slot1)
	return
end

ys.Battle.AttackState.OnEnd = function (slot0, slot1)
	slot1:ChangeToMoveState()
end

ys.Battle.AttackState.CacheWeapon = function (slot0)
	return false
end

return
