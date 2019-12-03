ys = ys or {}
ys.Battle.SkillState = class("SkillState", ys.Battle.IUnitState)
ys.Battle.SkillState.__name = "SkillState"

function ys.Battle.SkillState.Ctor(slot0)
	slot0.super.Ctor()
end

function ys.Battle.SkillState.AddIdleState(slot0, slot1, slot2)
	return
end

function ys.Battle.SkillState.AddMoveState(slot0, slot1, slot2)
	return
end

function ys.Battle.SkillState.AddMoveLeftState(slot0, slot1, slot2)
	return
end

function ys.Battle.SkillState.AddAttackState(slot0, slot1, slot2)
	slot1:OnAttackState(slot2)
end

function ys.Battle.SkillState.AddDeadState(slot0, slot1, slot2)
	slot1:OnDeadState()
end

function ys.Battle.SkillState.AddSpellState(slot0, slot1, slot2)
	slot1:OnSpellState()
end

function ys.Battle.SkillState.AddSkillState(slot0, slot1, slot2)
	return
end

function ys.Battle.SkillState.AddVictoryState(slot0, slot1, slot2)
	slot1:OnVictoryState()
end

function ys.Battle.SkillState.AddVictorySwimState(slot0, slot1, slot2)
	slot1:OnVictorySwimState()
end

function ys.Battle.SkillState.AddStandState(slot0, slot1, slot2)
	return
end

function ys.Battle.SkillState.AddDiveState(slot0, slot1, slot2)
	return
end

function ys.Battle.SkillState.AddDiveLeftState(slot0, slot1, slot2)
	return
end

function ys.Battle.SkillState.AddInterruptState(slot0, slot1, slot2)
	slot1:OnInterruptState()
end

function ys.Battle.SkillState.AddDivingState(slot0, slot1, slot2)
	return
end

function ys.Battle.SkillState.OnTrigger(slot0, slot1)
	return
end

function ys.Battle.SkillState.OnStart(slot0, slot1)
	return
end

function ys.Battle.SkillState.OnEnd(slot0, slot1)
	if slot1:GetTarget():IsMoving() then
		slot1:OnMoveState()
	else
		slot1:OnIdleState()
	end
end

function ys.Battle.SkillState.CacheWeapon(slot0)
	return true
end

return
