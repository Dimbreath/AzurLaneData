ys = ys or {}
ys.Battle.SpellState = class("SpellState", ys.Battle.IUnitState)
ys.Battle.SpellState.__name = "SpellState"

ys.Battle.SpellState.Ctor = function (slot0)
	slot0.super.Ctor()
end

ys.Battle.SpellState.AddIdleState = function (slot0, slot1, slot2)
	slot1:OnIdleState()
end

ys.Battle.SpellState.AddMoveState = function (slot0, slot1, slot2)
	return
end

ys.Battle.SpellState.AddMoveLeftState = function (slot0, slot1, slot2)
	return
end

ys.Battle.SpellState.AddAttackState = function (slot0, slot1, slot2)
	if slot1:GetTarget():GetSpeed().x >= 0 then
		slot1:OnAttackState(slot2)
	else
		slot1:OnAttackLeftState(slot2)
	end
end

ys.Battle.SpellState.AddDeadState = function (slot0, slot1, slot2)
	slot1:OnDeadState()
end

ys.Battle.SpellState.AddSkillState = function (slot0, slot1, slot2)
	return
end

ys.Battle.SpellState.AddSpellState = function (slot0, slot1, slot2)
	return
end

ys.Battle.SpellState.AddVictoryState = function (slot0, slot1, slot2)
	slot1:OnVictoryState()
end

ys.Battle.SpellState.AddVictorySwimState = function (slot0, slot1, slot2)
	slot1:OnVictorySwimState()
end

ys.Battle.SpellState.AddStandState = function (slot0, slot1, slot2)
	return
end

ys.Battle.SpellState.AddDiveState = function (slot0, slot1, slot2)
	return
end

ys.Battle.SpellState.AddDiveLeftState = function (slot0, slot1, slot2)
	return
end

ys.Battle.SpellState.AddInterruptState = function (slot0, slot1, slot2)
	slot1:OnInterruptState()
end

ys.Battle.SpellState.AddDivingState = function (slot0, slot1, slot2)
	return
end

ys.Battle.SpellState.OnTrigger = function (slot0, slot1)
	return
end

ys.Battle.SpellState.OnStart = function (slot0, slot1)
	return
end

ys.Battle.SpellState.OnEnd = function (slot0, slot1)
	return
end

ys.Battle.SpellState.CacheWeapon = function (slot0)
	return true
end

return
