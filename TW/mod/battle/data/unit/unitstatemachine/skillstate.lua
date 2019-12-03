ys = ys or {}
ys.Battle.SkillState = class("SkillState", ys.Battle.IUnitState)
ys.Battle.SkillState.__name = "SkillState"

ys.Battle.SkillState.Ctor = function (slot0)
	slot0.super.Ctor()
end

ys.Battle.SkillState.AddIdleState = function (slot0, slot1, slot2)
	return
end

ys.Battle.SkillState.AddMoveState = function (slot0, slot1, slot2)
	return
end

ys.Battle.SkillState.AddMoveLeftState = function (slot0, slot1, slot2)
	return
end

ys.Battle.SkillState.AddAttackState = function (slot0, slot1, slot2)
	slot1:OnAttackState(slot2)
end

ys.Battle.SkillState.AddDeadState = function (slot0, slot1, slot2)
	slot1:OnDeadState()
end

ys.Battle.SkillState.AddSpellState = function (slot0, slot1, slot2)
	slot1:OnSpellState()
end

ys.Battle.SkillState.AddSkillState = function (slot0, slot1, slot2)
	return
end

ys.Battle.SkillState.AddVictoryState = function (slot0, slot1, slot2)
	slot1:OnVictoryState()
end

ys.Battle.SkillState.AddVictorySwimState = function (slot0, slot1, slot2)
	slot1:OnVictorySwimState()
end

ys.Battle.SkillState.AddStandState = function (slot0, slot1, slot2)
	return
end

ys.Battle.SkillState.AddDiveState = function (slot0, slot1, slot2)
	return
end

ys.Battle.SkillState.AddDiveLeftState = function (slot0, slot1, slot2)
	return
end

ys.Battle.SkillState.AddInterruptState = function (slot0, slot1, slot2)
	slot1:OnInterruptState()
end

ys.Battle.SkillState.AddDivingState = function (slot0, slot1, slot2)
	return
end

ys.Battle.SkillState.OnTrigger = function (slot0, slot1)
	return
end

ys.Battle.SkillState.OnStart = function (slot0, slot1)
	return
end

ys.Battle.SkillState.OnEnd = function (slot0, slot1)
	if slot1:GetTarget():IsMoving() then
		slot1:OnMoveState()
	else
		slot1:OnIdleState()
	end
end

ys.Battle.SkillState.CacheWeapon = function (slot0)
	return true
end

return
