ys = ys or {}
ys.Battle.VictoryState = class("VictoryState", ys.Battle.IUnitState)
ys.Battle.VictoryState.__name = "VictoryState"

function ys.Battle.VictoryState.Ctor(slot0)
	slot0.super.Ctor()
end

function ys.Battle.VictoryState.AddIdleState(slot0, slot1, slot2)
	return
end

function ys.Battle.VictoryState.AddMoveState(slot0, slot1, slot2)
	return
end

function ys.Battle.VictoryState.AddMoveLeftState(slot0, slot1, slot2)
	return
end

function ys.Battle.VictoryState.AddAttackState(slot0, slot1, slot2)
	return
end

function ys.Battle.VictoryState.AddDeadState(slot0, slot1, slot2)
	return
end

function ys.Battle.VictoryState.AddSkillState(slot0, slot1, slot2)
	return
end

function ys.Battle.VictoryState.AddSpellState(slot0, slot1, slot2)
	return
end

function ys.Battle.VictoryState.AddVictoryState(slot0, slot1, slot2)
	return
end

function ys.Battle.VictoryState.AddVictorySwimState(slot0, slot1, slot2)
	return
end

function ys.Battle.VictoryState.AddStandState(slot0, slot1, slot2)
	return
end

function ys.Battle.VictoryState.AddDiveState(slot0, slot1, slot2)
	return
end

function ys.Battle.VictoryState.AddDiveLeftState(slot0, slot1, slot2)
	return
end

function ys.Battle.VictoryState.AddInterruptState(slot0, slot1, slot2)
	return
end

function ys.Battle.VictoryState.AddDivingState(slot0, slot1, slot2)
	return
end

function ys.Battle.VictoryState.OnTrigger(slot0, slot1)
	return
end

function ys.Battle.VictoryState.OnStart(slot0, slot1)
	return
end

function ys.Battle.VictoryState.OnEnd(slot0, slot1)
	slot1:OnStandState()
end

function ys.Battle.VictoryState.CacheWeapon(slot0)
	return true
end

return
