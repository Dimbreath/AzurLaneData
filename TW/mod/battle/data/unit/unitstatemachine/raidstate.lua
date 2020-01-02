ys = ys or {}
ys.Battle.RaidState = class("RaidState", ys.Battle.IUnitState)
ys.Battle.RaidState.__name = "RaidState"

function ys.Battle.RaidState.Ctor(slot0)
	slot0.super.Ctor()
end

function ys.Battle.RaidState.AddIdleState(slot0, slot1, slot2)
	return
end

function ys.Battle.RaidState.AddMoveState(slot0, slot1, slot2)
	return
end

function ys.Battle.RaidState.AddMoveLeftState(slot0, slot1, slot2)
	return
end

function ys.Battle.RaidState.AddAttackState(slot0, slot1, slot2)
	return
end

function ys.Battle.RaidState.AddDeadState(slot0, slot1, slot2)
	slot1:OnDeadState()
end

function ys.Battle.RaidState.AddSkillState(slot0, slot1, slot2)
	return
end

function ys.Battle.RaidState.AddSpellState(slot0, slot1, slot2)
	slot1:OnSpellState()
end

function ys.Battle.RaidState.AddVictoryState(slot0, slot1, slot2)
	slot1:OnVictoryState()
end

function ys.Battle.RaidState.AddVictorySwimState(slot0, slot1, slot2)
	slot1:OnVictorySwimState()
end

function ys.Battle.RaidState.AddStandState(slot0, slot1, slot2)
	return
end

function ys.Battle.RaidState.AddDiveState(slot0, slot1, slot2)
	return
end

function ys.Battle.RaidState.AddDiveLeftState(slot0, slot1, slot2)
	return
end

function ys.Battle.RaidState.AddInterruptState(slot0, slot1, slot2)
	slot1:OnInterruptState()
end

function ys.Battle.RaidState.AddDivingState(slot0, slot1, slot2)
	return
end

function ys.Battle.RaidState.OnTrigger(slot0, slot1)
	slot1:GetTarget():SendAttackTrigger()
end

function ys.Battle.RaidState.OnStart(slot0, slot1)
	return
end

function ys.Battle.RaidState.OnEnd(slot0, slot1)
	slot1:ChangeToMoveState()
end

function ys.Battle.RaidState.CacheWeapon(slot0)
	return false
end

return
