ys = ys or {}
ys.Battle.AttackLeftState = class("AttackLeftState", ys.Battle.IUnitState)
ys.Battle.AttackLeftState.__name = "AttackLeftState"

ys.Battle.AttackLeftState.Ctor = function (slot0)
	slot0.super.Ctor()
end

ys.Battle.AttackLeftState.AddIdleState = function (slot0, slot1, slot2)
	return
end

ys.Battle.AttackLeftState.AddMoveState = function (slot0, slot1, slot2)
	return
end

ys.Battle.AttackLeftState.AddMoveLeftState = function (slot0, slot1, slot2)
	return
end

ys.Battle.AttackLeftState.AddAttackState = function (slot0, slot1, slot2)
	return
end

ys.Battle.AttackLeftState.AddDeadState = function (slot0, slot1, slot2)
	slot1:OnDeadState()
end

ys.Battle.AttackLeftState.AddSkillState = function (slot0, slot1, slot2)
	return
end

ys.Battle.AttackLeftState.AddSpellState = function (slot0, slot1, slot2)
	slot1:OnSpellState()
end

ys.Battle.AttackLeftState.AddVictoryState = function (slot0, slot1, slot2)
	slot1:OnVictoryState()
end

ys.Battle.AttackLeftState.AddVictorySwimState = function (slot0, slot1, slot2)
	slot1:OnVictorySwimState()
end

ys.Battle.AttackLeftState.AddStandState = function (slot0, slot1, slot2)
	return
end

ys.Battle.AttackLeftState.AddDiveState = function (slot0, slot1, slot2)
	return
end

ys.Battle.AttackLeftState.AddDiveLeftState = function (slot0, slot1, slot2)
	return
end

ys.Battle.AttackLeftState.AddInterruptState = function (slot0, slot1, slot2)
	slot0:OnTrigger(slot1)
	slot1:OnInterruptState()
end

ys.Battle.AttackLeftState.AddDivingState = function (slot0, slot1, slot2)
	slot0:OnTrigger(slot1)
	slot1:OnDivingState()
end

ys.Battle.AttackLeftState.OnTrigger = function (slot0, slot1)
	slot1:GetTarget():SendAttackTrigger()
end

ys.Battle.AttackLeftState.OnStart = function (slot0, slot1)
	return
end

ys.Battle.AttackLeftState.OnEnd = function (slot0, slot1)
	slot1:ChangeToMoveState()
end

ys.Battle.AttackLeftState.CacheWeapon = function (slot0)
	return false
end

return
