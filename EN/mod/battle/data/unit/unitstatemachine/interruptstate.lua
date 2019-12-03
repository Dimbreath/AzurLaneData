ys = ys or {}
ys.Battle.InterruptState = class("InterruptState", ys.Battle.IUnitState)
ys.Battle.InterruptState.__name = "InterruptState"

ys.Battle.InterruptState.Ctor = function (slot0)
	slot0.super.Ctor()
end

ys.Battle.InterruptState.AddIdleState = function (slot0, slot1, slot2)
	return
end

ys.Battle.InterruptState.AddMoveState = function (slot0, slot1, slot2)
	return
end

ys.Battle.InterruptState.AddMoveLeftState = function (slot0, slot1, slot2)
	return
end

ys.Battle.InterruptState.AddAttackState = function (slot0, slot1, slot2)
	return
end

ys.Battle.InterruptState.AddDeadState = function (slot0, slot1, slot2)
	slot1:OnDeadState()
end

ys.Battle.InterruptState.AddSkillState = function (slot0, slot1, slot2)
	return
end

ys.Battle.InterruptState.AddSpellState = function (slot0, slot1, slot2)
	return
end

ys.Battle.InterruptState.AddVictoryState = function (slot0, slot1, slot2)
	slot1:OnVictoryState()
end

ys.Battle.InterruptState.AddVictorySwimState = function (slot0, slot1, slot2)
	slot1:OnVictorySwimState()
end

ys.Battle.InterruptState.AddStandState = function (slot0, slot1, slot2)
	return
end

ys.Battle.InterruptState.AddDiveState = function (slot0, slot1, slot2)
	return
end

ys.Battle.InterruptState.AddDiveLeftState = function (slot0, slot1, slot2)
	return
end

ys.Battle.InterruptState.AddInterruptState = function (slot0, slot1, slot2)
	return
end

ys.Battle.InterruptState.AddDivingState = function (slot0, slot1, slot2)
	slot1:OnDivingState()
end

ys.Battle.InterruptState.OnTrigger = function (slot0, slot1)
	slot1:GetTarget():SetInterruptSickness(true)
end

ys.Battle.InterruptState.OnStart = function (slot0, slot1)
	return
end

ys.Battle.InterruptState.OnEnd = function (slot0, slot1)
	slot1:GetTarget().SetInterruptSickness(slot2, false)
	slot1:ChangeToMoveState()
end

ys.Battle.InterruptState.CacheWeapon = function (slot0)
	return true
end

return
