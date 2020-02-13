ys = ys or {}
ys.Battle.RaidLeftState = class("RaidLeftState", ys.Battle.IUnitState)
ys.Battle.RaidLeftState.__name = "RaidLeftState"

function ys.Battle.RaidLeftState.Ctor(slot0)
	slot0.super.Ctor()
end

function ys.Battle.RaidLeftState.AddIdleState(slot0, slot1, slot2)
	return
end

function ys.Battle.RaidLeftState.AddMoveState(slot0, slot1, slot2)
	return
end

function ys.Battle.RaidLeftState.AddMoveLeftState(slot0, slot1, slot2)
	return
end

function ys.Battle.RaidLeftState.AddAttackState(slot0, slot1, slot2)
	return
end

function ys.Battle.RaidLeftState.AddDeadState(slot0, slot1, slot2)
	slot1:OnDeadState()
end

function ys.Battle.RaidLeftState.AddSkillState(slot0, slot1, slot2)
	return
end

function ys.Battle.RaidLeftState.AddSpellState(slot0, slot1, slot2)
	slot1:OnSpellState()
end

function ys.Battle.RaidLeftState.AddVictoryState(slot0, slot1, slot2)
	slot1:OnVictoryState()
end

function ys.Battle.RaidLeftState.AddVictorySwimState(slot0, slot1, slot2)
	slot1:OnVictorySwimState()
end

function ys.Battle.RaidLeftState.AddStandState(slot0, slot1, slot2)
	return
end

function ys.Battle.RaidLeftState.AddDiveState(slot0, slot1, slot2)
	return
end

function ys.Battle.RaidLeftState.AddDiveLeftState(slot0, slot1, slot2)
	return
end

function ys.Battle.RaidLeftState.AddInterruptState(slot0, slot1, slot2)
	slot1:OnInterruptState()
end

function ys.Battle.RaidLeftState.AddDivingState(slot0, slot1, slot2)
	return
end

function ys.Battle.RaidLeftState.OnTrigger(slot0, slot1)
	slot1:GetTarget():SendAttackTrigger()
end

function ys.Battle.RaidLeftState.OnStart(slot0, slot1)
	return
end

function ys.Battle.RaidLeftState.OnEnd(slot0, slot1)
	slot1:ChangeToMoveState()
end

function ys.Battle.RaidLeftState.CacheWeapon(slot0)
	return false
end

return
