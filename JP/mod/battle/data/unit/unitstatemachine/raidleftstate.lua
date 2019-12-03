ys = ys or {}
ys.Battle.RaidLeftState = class("RaidLeftState", ys.Battle.IUnitState)
ys.Battle.RaidLeftState.__name = "RaidLeftState"

ys.Battle.RaidLeftState.Ctor = function (slot0)
	slot0.super.Ctor()
end

ys.Battle.RaidLeftState.AddIdleState = function (slot0, slot1, slot2)
	return
end

ys.Battle.RaidLeftState.AddMoveState = function (slot0, slot1, slot2)
	return
end

ys.Battle.RaidLeftState.AddMoveLeftState = function (slot0, slot1, slot2)
	return
end

ys.Battle.RaidLeftState.AddAttackState = function (slot0, slot1, slot2)
	return
end

ys.Battle.RaidLeftState.AddDeadState = function (slot0, slot1, slot2)
	slot1:OnDeadState()
end

ys.Battle.RaidLeftState.AddSkillState = function (slot0, slot1, slot2)
	return
end

ys.Battle.RaidLeftState.AddSpellState = function (slot0, slot1, slot2)
	slot1:OnSpellState()
end

ys.Battle.RaidLeftState.AddVictoryState = function (slot0, slot1, slot2)
	slot1:OnVictoryState()
end

ys.Battle.RaidLeftState.AddVictorySwimState = function (slot0, slot1, slot2)
	slot1:OnVictorySwimState()
end

ys.Battle.RaidLeftState.AddStandState = function (slot0, slot1, slot2)
	return
end

ys.Battle.RaidLeftState.AddDiveState = function (slot0, slot1, slot2)
	return
end

ys.Battle.RaidLeftState.AddDiveLeftState = function (slot0, slot1, slot2)
	return
end

ys.Battle.RaidLeftState.AddInterruptState = function (slot0, slot1, slot2)
	slot1:OnInterruptState()
end

ys.Battle.RaidLeftState.AddDivingState = function (slot0, slot1, slot2)
	return
end

ys.Battle.RaidLeftState.OnTrigger = function (slot0, slot1)
	slot1:GetTarget():SendAttackTrigger()
end

ys.Battle.RaidLeftState.OnStart = function (slot0, slot1)
	return
end

ys.Battle.RaidLeftState.OnEnd = function (slot0, slot1)
	slot1:ChangeToMoveState()
end

ys.Battle.RaidLeftState.CacheWeapon = function (slot0)
	return false
end

return
