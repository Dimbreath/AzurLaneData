ys = ys or {}
ys.Battle.DiveLeftState = class("DiveLeftState", ys.Battle.IUnitState)
ys.Battle.DiveLeftState.__name = "DiveLeftState"

ys.Battle.DiveLeftState.Ctor = function (slot0)
	slot0.super.Ctor()
end

ys.Battle.DiveLeftState.AddIdleState = function (slot0, slot1, slot2)
	slot1:OnIdleState()
end

ys.Battle.DiveLeftState.AddMoveState = function (slot0, slot1, slot2)
	slot1:OnMoveState()
end

ys.Battle.DiveLeftState.AddMoveLeftState = function (slot0, slot1, slot2)
	slot1:OnMoveLeftState()
end

ys.Battle.DiveLeftState.AddAttackState = function (slot0, slot1, slot2)
	slot1:OnRaidLeftState(slot2)
end

ys.Battle.DiveLeftState.AddDeadState = function (slot0, slot1, slot2)
	slot1:OnDeadState()
end

ys.Battle.DiveLeftState.AddSkillState = function (slot0, slot1, slot2)
	return
end

ys.Battle.DiveLeftState.AddSpellState = function (slot0, slot1, slot2)
	slot1:OnSpellState()
end

ys.Battle.DiveLeftState.AddVictoryState = function (slot0, slot1, slot2)
	slot1:OnVictoryState()
end

ys.Battle.DiveLeftState.AddVictorySwimState = function (slot0, slot1, slot2)
	slot1:OnVictorySwimState()
end

ys.Battle.DiveLeftState.AddStandState = function (slot0, slot1, slot2)
	return
end

ys.Battle.DiveLeftState.AddDiveState = function (slot0, slot1, slot2)
	slot1:OnDiveState()
end

ys.Battle.DiveLeftState.AddDiveLeftState = function (slot0, slot1, slot2)
	return
end

ys.Battle.DiveLeftState.AddInterruptState = function (slot0, slot1, slot2)
	slot1:OnInterruptState()
end

ys.Battle.DiveLeftState.AddDivingState = function (slot0, slot1, slot2)
	return
end

ys.Battle.DiveLeftState.OnTrigger = function (slot0, slot1)
	return
end

ys.Battle.DiveLeftState.OnStart = function (slot0, slot1)
	return
end

ys.Battle.DiveLeftState.OnEnd = function (slot0, slot1)
	return
end

ys.Battle.DiveLeftState.CacheWeapon = function (slot0)
	return true
end

return
