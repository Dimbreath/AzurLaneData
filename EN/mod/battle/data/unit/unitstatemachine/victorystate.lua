ys = ys or {}
ys.Battle.VictoryState = class("VictoryState", ys.Battle.IUnitState)
ys.Battle.VictoryState.__name = "VictoryState"

ys.Battle.VictoryState.Ctor = function (slot0)
	slot0.super.Ctor()
end

ys.Battle.VictoryState.AddIdleState = function (slot0, slot1, slot2)
	return
end

ys.Battle.VictoryState.AddMoveState = function (slot0, slot1, slot2)
	return
end

ys.Battle.VictoryState.AddMoveLeftState = function (slot0, slot1, slot2)
	return
end

ys.Battle.VictoryState.AddAttackState = function (slot0, slot1, slot2)
	return
end

ys.Battle.VictoryState.AddDeadState = function (slot0, slot1, slot2)
	return
end

ys.Battle.VictoryState.AddSkillState = function (slot0, slot1, slot2)
	return
end

ys.Battle.VictoryState.AddSpellState = function (slot0, slot1, slot2)
	return
end

ys.Battle.VictoryState.AddVictoryState = function (slot0, slot1, slot2)
	return
end

ys.Battle.VictoryState.AddVictorySwimState = function (slot0, slot1, slot2)
	return
end

ys.Battle.VictoryState.AddStandState = function (slot0, slot1, slot2)
	return
end

ys.Battle.VictoryState.AddDiveState = function (slot0, slot1, slot2)
	return
end

ys.Battle.VictoryState.AddDiveLeftState = function (slot0, slot1, slot2)
	return
end

ys.Battle.VictoryState.AddInterruptState = function (slot0, slot1, slot2)
	return
end

ys.Battle.VictoryState.AddDivingState = function (slot0, slot1, slot2)
	return
end

ys.Battle.VictoryState.OnTrigger = function (slot0, slot1)
	return
end

ys.Battle.VictoryState.OnStart = function (slot0, slot1)
	return
end

ys.Battle.VictoryState.OnEnd = function (slot0, slot1)
	slot1:OnStandState()
end

ys.Battle.VictoryState.CacheWeapon = function (slot0)
	return true
end

return
