ys = ys or {}
ys.Battle.InterruptState = class("InterruptState", ys.Battle.IUnitState)
ys.Battle.InterruptState.__name = "InterruptState"

function ys.Battle.InterruptState.Ctor(slot0)
	slot0.super.Ctor()
end

function ys.Battle.InterruptState.AddIdleState(slot0, slot1, slot2)
	return
end

function ys.Battle.InterruptState.AddMoveState(slot0, slot1, slot2)
	return
end

function ys.Battle.InterruptState.AddMoveLeftState(slot0, slot1, slot2)
	return
end

function ys.Battle.InterruptState.AddAttackState(slot0, slot1, slot2)
	return
end

function ys.Battle.InterruptState.AddDeadState(slot0, slot1, slot2)
	slot1:OnDeadState()
end

function ys.Battle.InterruptState.AddSkillState(slot0, slot1, slot2)
	return
end

function ys.Battle.InterruptState.AddSpellState(slot0, slot1, slot2)
	return
end

function ys.Battle.InterruptState.AddVictoryState(slot0, slot1, slot2)
	slot1:OnVictoryState()
end

function ys.Battle.InterruptState.AddVictorySwimState(slot0, slot1, slot2)
	slot1:OnVictorySwimState()
end

function ys.Battle.InterruptState.AddStandState(slot0, slot1, slot2)
	return
end

function ys.Battle.InterruptState.AddDiveState(slot0, slot1, slot2)
	return
end

function ys.Battle.InterruptState.AddDiveLeftState(slot0, slot1, slot2)
	return
end

function ys.Battle.InterruptState.AddInterruptState(slot0, slot1, slot2)
	return
end

function ys.Battle.InterruptState.AddDivingState(slot0, slot1, slot2)
	slot1:OnDivingState()
end

function ys.Battle.InterruptState.OnTrigger(slot0, slot1)
	slot1:GetTarget():SetInterruptSickness(true)
end

function ys.Battle.InterruptState.OnStart(slot0, slot1)
	return
end

function ys.Battle.InterruptState.OnEnd(slot0, slot1)
	slot1:GetTarget().SetInterruptSickness(slot2, false)
	slot1:ChangeToMoveState()
end

function ys.Battle.InterruptState.CacheWeapon(slot0)
	return true
end

return
