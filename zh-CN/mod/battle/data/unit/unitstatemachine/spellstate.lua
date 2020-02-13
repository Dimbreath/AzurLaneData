ys = ys or {}
ys.Battle.SpellState = class("SpellState", ys.Battle.IUnitState)
ys.Battle.SpellState.__name = "SpellState"

function ys.Battle.SpellState.Ctor(slot0)
	slot0.super.Ctor()
end

function ys.Battle.SpellState.AddIdleState(slot0, slot1, slot2)
	slot1:OnIdleState()
end

function ys.Battle.SpellState.AddMoveState(slot0, slot1, slot2)
	return
end

function ys.Battle.SpellState.AddMoveLeftState(slot0, slot1, slot2)
	return
end

function ys.Battle.SpellState.AddAttackState(slot0, slot1, slot2)
	if slot1:GetTarget():GetSpeed().x >= 0 then
		slot1:OnAttackState(slot2)
	else
		slot1:OnAttackLeftState(slot2)
	end
end

function ys.Battle.SpellState.AddDeadState(slot0, slot1, slot2)
	slot1:OnDeadState()
end

function ys.Battle.SpellState.AddSkillState(slot0, slot1, slot2)
	return
end

function ys.Battle.SpellState.AddSpellState(slot0, slot1, slot2)
	return
end

function ys.Battle.SpellState.AddVictoryState(slot0, slot1, slot2)
	slot1:OnVictoryState()
end

function ys.Battle.SpellState.AddVictorySwimState(slot0, slot1, slot2)
	slot1:OnVictorySwimState()
end

function ys.Battle.SpellState.AddStandState(slot0, slot1, slot2)
	return
end

function ys.Battle.SpellState.AddDiveState(slot0, slot1, slot2)
	return
end

function ys.Battle.SpellState.AddDiveLeftState(slot0, slot1, slot2)
	return
end

function ys.Battle.SpellState.AddInterruptState(slot0, slot1, slot2)
	slot1:OnInterruptState()
end

function ys.Battle.SpellState.AddDivingState(slot0, slot1, slot2)
	return
end

function ys.Battle.SpellState.OnTrigger(slot0, slot1)
	return
end

function ys.Battle.SpellState.OnStart(slot0, slot1)
	return
end

function ys.Battle.SpellState.OnEnd(slot0, slot1)
	return
end

function ys.Battle.SpellState.CacheWeapon(slot0)
	return true
end

return
