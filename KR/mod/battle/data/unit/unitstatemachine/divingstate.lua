ys = ys or {}
ys.Battle.DivingState = class("DivingState", ys.Battle.IUnitState)
ys.Battle.DivingState.__name = "DivingState"

ys.Battle.DivingState.Ctor = function (slot0)
	slot0.super.Ctor()
end

ys.Battle.DivingState.AddIdleState = function (slot0, slot1, slot2)
	return
end

ys.Battle.DivingState.AddMoveState = function (slot0, slot1, slot2)
	return
end

ys.Battle.DivingState.AddMoveLeftState = function (slot0, slot1, slot2)
	return
end

ys.Battle.DivingState.AddAttackState = function (slot0, slot1, slot2)
	return
end

ys.Battle.DivingState.AddDeadState = function (slot0, slot1, slot2)
	slot1:OnDeadState()
end

ys.Battle.DivingState.AddSkillState = function (slot0, slot1, slot2)
	return
end

ys.Battle.DivingState.AddSpellState = function (slot0, slot1, slot2)
	return
end

ys.Battle.DivingState.AddVictoryState = function (slot0, slot1, slot2)
	slot1:OnVictoryState()
end

ys.Battle.DivingState.AddVictorySwimState = function (slot0, slot1, slot2)
	slot1:OnVictorySwimState()
end

ys.Battle.DivingState.AddStandState = function (slot0, slot1, slot2)
	return
end

ys.Battle.DivingState.AddDiveState = function (slot0, slot1, slot2)
	return
end

ys.Battle.DivingState.AddDiveLeftState = function (slot0, slot1, slot2)
	return
end

ys.Battle.DivingState.AddInterruptState = function (slot0, slot1, slot2)
	return
end

ys.Battle.DivingState.AddDivingState = function (slot0, slot1, slot2)
	return
end

ys.Battle.DivingState.OnTrigger = function (slot0, slot1)
	return
end

ys.Battle.DivingState.OnStart = function (slot0, slot1)
	return
end

ys.Battle.DivingState.OnEnd = function (slot0, slot1)
	slot1:ChangeOxyState(slot0.Battle.OxyState.STATE_DIVE)
	slot1:ChangeToMoveState()
end

ys.Battle.DivingState.CacheWeapon = function (slot0)
	return false
end

return
