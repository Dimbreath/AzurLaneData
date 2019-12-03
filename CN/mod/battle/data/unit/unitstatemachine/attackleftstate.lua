ys = ys or {}
ys.Battle.AttackLeftState = class("AttackLeftState", ys.Battle.IUnitState)
ys.Battle.AttackLeftState.__name = "AttackLeftState"

function ys.Battle.AttackLeftState.Ctor(slot0)
	slot0.super.Ctor()
end

function ys.Battle.AttackLeftState.AddIdleState(slot0, slot1, slot2)
	return
end

function ys.Battle.AttackLeftState.AddMoveState(slot0, slot1, slot2)
	return
end

function ys.Battle.AttackLeftState.AddMoveLeftState(slot0, slot1, slot2)
	return
end

function ys.Battle.AttackLeftState.AddAttackState(slot0, slot1, slot2)
	return
end

function ys.Battle.AttackLeftState.AddDeadState(slot0, slot1, slot2)
	slot1:OnDeadState()
end

function ys.Battle.AttackLeftState.AddSkillState(slot0, slot1, slot2)
	return
end

function ys.Battle.AttackLeftState.AddSpellState(slot0, slot1, slot2)
	slot1:OnSpellState()
end

function ys.Battle.AttackLeftState.AddVictoryState(slot0, slot1, slot2)
	slot1:OnVictoryState()
end

function ys.Battle.AttackLeftState.AddVictorySwimState(slot0, slot1, slot2)
	slot1:OnVictorySwimState()
end

function ys.Battle.AttackLeftState.AddStandState(slot0, slot1, slot2)
	return
end

function ys.Battle.AttackLeftState.AddDiveState(slot0, slot1, slot2)
	return
end

function ys.Battle.AttackLeftState.AddDiveLeftState(slot0, slot1, slot2)
	return
end

function ys.Battle.AttackLeftState.AddInterruptState(slot0, slot1, slot2)
	slot0:OnTrigger(slot1)
	slot1:OnInterruptState()
end

function ys.Battle.AttackLeftState.AddDivingState(slot0, slot1, slot2)
	slot0:OnTrigger(slot1)
	slot1:OnDivingState()
end

function ys.Battle.AttackLeftState.OnTrigger(slot0, slot1)
	slot1:GetTarget():SendAttackTrigger()
end

function ys.Battle.AttackLeftState.OnStart(slot0, slot1)
	return
end

function ys.Battle.AttackLeftState.OnEnd(slot0, slot1)
	slot1:ChangeToMoveState()
end

function ys.Battle.AttackLeftState.CacheWeapon(slot0)
	return false
end

return
