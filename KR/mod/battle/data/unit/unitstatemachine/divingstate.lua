ys = ys or {}
ys.Battle.DivingState = class("DivingState", ys.Battle.IUnitState)
ys.Battle.DivingState.__name = "DivingState"

function ys.Battle.DivingState.Ctor(slot0)
	slot0.super.Ctor()
end

function ys.Battle.DivingState.AddIdleState(slot0, slot1, slot2)
	return
end

function ys.Battle.DivingState.AddMoveState(slot0, slot1, slot2)
	return
end

function ys.Battle.DivingState.AddMoveLeftState(slot0, slot1, slot2)
	return
end

function ys.Battle.DivingState.AddAttackState(slot0, slot1, slot2)
	return
end

function ys.Battle.DivingState.AddDeadState(slot0, slot1, slot2)
	slot1:OnDeadState()
end

function ys.Battle.DivingState.AddSkillState(slot0, slot1, slot2)
	return
end

function ys.Battle.DivingState.AddSpellState(slot0, slot1, slot2)
	return
end

function ys.Battle.DivingState.AddVictoryState(slot0, slot1, slot2)
	slot1:OnVictoryState()
end

function ys.Battle.DivingState.AddVictorySwimState(slot0, slot1, slot2)
	slot1:OnVictorySwimState()
end

function ys.Battle.DivingState.AddStandState(slot0, slot1, slot2)
	return
end

function ys.Battle.DivingState.AddDiveState(slot0, slot1, slot2)
	return
end

function ys.Battle.DivingState.AddDiveLeftState(slot0, slot1, slot2)
	return
end

function ys.Battle.DivingState.AddInterruptState(slot0, slot1, slot2)
	return
end

function ys.Battle.DivingState.AddDivingState(slot0, slot1, slot2)
	return
end

function ys.Battle.DivingState.OnTrigger(slot0, slot1)
	return
end

function ys.Battle.DivingState.OnStart(slot0, slot1)
	return
end

function ys.Battle.DivingState.OnEnd(slot0, slot1)
	slot1:ChangeOxyState(slot0.Battle.OxyState.STATE_DIVE)
	slot1:ChangeToMoveState()
end

function ys.Battle.DivingState.CacheWeapon(slot0)
	return false
end

return
