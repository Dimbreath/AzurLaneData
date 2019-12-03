ys = ys or {}
ys.Battle.DiveState = class("DiveState", ys.Battle.IUnitState)
ys.Battle.DiveState.__name = "DiveState"

ys.Battle.DiveState.Ctor = function (slot0)
	slot0.super.Ctor()
end

ys.Battle.DiveState.AddIdleState = function (slot0, slot1, slot2)
	slot1:OnIdleState()
end

ys.Battle.DiveState.AddMoveState = function (slot0, slot1, slot2)
	slot1:OnMoveState()
end

ys.Battle.DiveState.AddMoveLeftState = function (slot0, slot1, slot2)
	slot1:OnMoveLeftState()
end

ys.Battle.DiveState.AddAttackState = function (slot0, slot1, slot2)
	slot1:OnRaidState(slot2)
end

ys.Battle.DiveState.AddDeadState = function (slot0, slot1, slot2)
	slot1:OnDeadState()
end

ys.Battle.DiveState.AddSkillState = function (slot0, slot1, slot2)
	return
end

ys.Battle.DiveState.AddSpellState = function (slot0, slot1, slot2)
	slot1:OnSpellState()
end

ys.Battle.DiveState.AddVictoryState = function (slot0, slot1, slot2)
	slot1:OnVictoryState()
end

ys.Battle.DiveState.AddVictorySwimState = function (slot0, slot1, slot2)
	slot1:OnVictorySwimState()
end

ys.Battle.DiveState.AddStandState = function (slot0, slot1, slot2)
	return
end

ys.Battle.DiveState.AddDiveState = function (slot0, slot1, slot2)
	return
end

ys.Battle.DiveState.AddDiveLeftState = function (slot0, slot1, slot2)
	slot1:OnDiveLeftState()
end

ys.Battle.DiveState.AddInterruptState = function (slot0, slot1, slot2)
	slot1:OnInterruptState()
end

ys.Battle.DiveState.AddDivingState = function (slot0, slot1, slot2)
	return
end

ys.Battle.DiveState.OnTrigger = function (slot0, slot1)
	return
end

ys.Battle.DiveState.OnStart = function (slot0, slot1)
	return
end

ys.Battle.DiveState.OnEnd = function (slot0, slot1)
	return
end

ys.Battle.DiveState.CacheWeapon = function (slot0)
	return true
end

return
