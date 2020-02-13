ys = ys or {}
ys.Battle.AttackState = class("AttackState", ys.Battle.IUnitState)
ys.Battle.AttackState.__name = "AttackState"

function ys.Battle.AttackState.Ctor(slot0)
	slot0.super.Ctor()
end

function ys.Battle.AttackState.AddIdleState(slot0, slot1, slot2)
	return
end

function ys.Battle.AttackState.AddMoveState(slot0, slot1, slot2)
	return
end

function ys.Battle.AttackState.AddMoveLeftState(slot0, slot1, slot2)
	return
end

function ys.Battle.AttackState.AddAttackState(slot0, slot1, slot2)
	return
end

function ys.Battle.AttackState.AddDeadState(slot0, slot1, slot2)
	slot1:OnDeadState()
end

function ys.Battle.AttackState.AddSkillState(slot0, slot1, slot2)
	return
end

function ys.Battle.AttackState.AddSpellState(slot0, slot1, slot2)
	slot1:OnSpellState()
end

function ys.Battle.AttackState.AddVictoryState(slot0, slot1, slot2)
	slot1:OnVictoryState()
end

function ys.Battle.AttackState.AddVictorySwimState(slot0, slot1, slot2)
	slot1:OnVictorySwimState()
end

function ys.Battle.AttackState.AddStandState(slot0, slot1, slot2)
	return
end

function ys.Battle.AttackState.AddDiveState(slot0, slot1, slot2)
	return
end

function ys.Battle.AttackState.AddDiveLeftState(slot0, slot1, slot2)
	return
end

function ys.Battle.AttackState.AddInterruptState(slot0, slot1, slot2)
	slot0:OnTrigger(slot1)
	slot1:OnInterruptState()
end

function ys.Battle.AttackState.AddDivingState(slot0, slot1, slot2)
	slot0:OnTrigger(slot1)
	slot1:OnDivingState()
end

function ys.Battle.AttackState.OnTrigger(slot0, slot1)
	slot1:GetTarget():SendAttackTrigger()
end

function ys.Battle.AttackState.OnStart(slot0, slot1)
	return
end

function ys.Battle.AttackState.OnEnd(slot0, slot1)
	slot1:ChangeToMoveState()
end

function ys.Battle.AttackState.CacheWeapon(slot0)
	return false
end

return
