ys = ys or {}
ys.Battle.StandState = class("StandState", ys.Battle.IUnitState)
ys.Battle.StandState.__name = "StandState"

function ys.Battle.StandState.Ctor(slot0)
	slot0.super.Ctor()
end

function ys.Battle.StandState.AddIdleState(slot0, slot1, slot2)
	return
end

function ys.Battle.StandState.AddMoveState(slot0, slot1, slot2)
	return
end

function ys.Battle.StandState.AddMoveLeftState(slot0, slot1, slot2)
	return
end

function ys.Battle.StandState.AddAttackState(slot0, slot1, slot2)
	return
end

function ys.Battle.StandState.AddDeadState(slot0, slot1, slot2)
	return
end

function ys.Battle.StandState.AddSkillState(slot0, slot1, slot2)
	return
end

function ys.Battle.StandState.AddSpellState(slot0, slot1, slot2)
	return
end

function ys.Battle.StandState.AddVictoryState(slot0, slot1, slot2)
	return
end

function ys.Battle.StandState.AddVictorySwimState(slot0, slot1, slot2)
	return
end

function ys.Battle.StandState.AddStandState(slot0, slot1, slot2)
	return
end

function ys.Battle.StandState.AddDiveState(slot0, slot1, slot2)
	return
end

function ys.Battle.StandState.AddDiveLeftState(slot0, slot1, slot2)
	return
end

function ys.Battle.StandState.AddInterruptState(slot0, slot1, slot2)
	slot1:OnInterruptState()
end

function ys.Battle.StandState.AddDivingState(slot0, slot1, slot2)
	slot1:OnDivingState()
end

function ys.Battle.StandState.OnTrigger(slot0, slot1)
	return
end

function ys.Battle.StandState.OnStart(slot0, slot1)
	return
end

function ys.Battle.StandState.OnEnd(slot0, slot1)
	slot1:OnVictoryState()
end

function ys.Battle.StandState.CacheWeapon(slot0)
	return true
end

return
