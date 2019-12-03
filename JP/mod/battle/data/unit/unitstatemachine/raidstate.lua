ys = ys or {}
ys.Battle.RaidState = class("RaidState", ys.Battle.IUnitState)
ys.Battle.RaidState.__name = "RaidState"

ys.Battle.RaidState.Ctor = function (slot0)
	slot0.super.Ctor()
end

ys.Battle.RaidState.AddIdleState = function (slot0, slot1, slot2)
	return
end

ys.Battle.RaidState.AddMoveState = function (slot0, slot1, slot2)
	return
end

ys.Battle.RaidState.AddMoveLeftState = function (slot0, slot1, slot2)
	return
end

ys.Battle.RaidState.AddAttackState = function (slot0, slot1, slot2)
	return
end

ys.Battle.RaidState.AddDeadState = function (slot0, slot1, slot2)
	slot1:OnDeadState()
end

ys.Battle.RaidState.AddSkillState = function (slot0, slot1, slot2)
	return
end

ys.Battle.RaidState.AddSpellState = function (slot0, slot1, slot2)
	slot1:OnSpellState()
end

ys.Battle.RaidState.AddVictoryState = function (slot0, slot1, slot2)
	slot1:OnVictoryState()
end

ys.Battle.RaidState.AddVictorySwimState = function (slot0, slot1, slot2)
	slot1:OnVictorySwimState()
end

ys.Battle.RaidState.AddStandState = function (slot0, slot1, slot2)
	return
end

ys.Battle.RaidState.AddDiveState = function (slot0, slot1, slot2)
	return
end

ys.Battle.RaidState.AddDiveLeftState = function (slot0, slot1, slot2)
	return
end

ys.Battle.RaidState.AddInterruptState = function (slot0, slot1, slot2)
	slot1:OnInterruptState()
end

ys.Battle.RaidState.AddDivingState = function (slot0, slot1, slot2)
	return
end

ys.Battle.RaidState.OnTrigger = function (slot0, slot1)
	slot1:GetTarget():SendAttackTrigger()
end

ys.Battle.RaidState.OnStart = function (slot0, slot1)
	return
end

ys.Battle.RaidState.OnEnd = function (slot0, slot1)
	slot1:ChangeToMoveState()
end

ys.Battle.RaidState.CacheWeapon = function (slot0)
	return false
end

return
