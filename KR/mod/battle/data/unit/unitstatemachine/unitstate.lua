ys = ys or {}
slot2 = ys.Battle.BattleConst.ActionName
ys.Battle.UnitState = class("UnitState")
ys.Battle.UnitState.__name = "UnitState"
ys.Battle.UnitState.STATE_IDLE = "STATE_IDLE"
ys.Battle.UnitState.STATE_MOVE = "STATE_MOVE"
ys.Battle.UnitState.STATE_ATTACK = "STATE_ATTACK"
ys.Battle.UnitState.STATE_ATTACKLEFT = "STATE_ATTACKLEFT"
ys.Battle.UnitState.STATE_DEAD = "STATE_DEAD"
ys.Battle.UnitState.STATE_MOVELEFT = "STATE_MOVELEFT"
ys.Battle.UnitState.STATE_SKILL = "STATE_SKILL"
ys.Battle.UnitState.STATE_VICTORY = "STATE_VICTORY"
ys.Battle.UnitState.STATE_STAND = "STATE_STAND"
ys.Battle.UnitState.STATE_INTERRUPT = "STATE_INTERRUPT"
ys.Battle.UnitState.STATE_DIVING = "STATE_DIVING"
ys.Battle.UnitState.STATE_DIVE = "STATE_DIVE"
ys.Battle.UnitState.STATE_DIVELEFT = "STATE_DIVELEFT"
ys.Battle.UnitState.STATE_RAID = "STATE_RAID"
ys.Battle.UnitState.STATE_RAIDLEFT = "STATE_RAIDLEFT"

ys.Battle.UnitState.Ctor = function (slot0, slot1)
	slot0._target = slot1
	slot0._idleState = slot0.Battle.IdleState.New()
	slot0._moveState = slot0.Battle.MoveState.New()
	slot0._attackState = slot0.Battle.AttackState.New()
	slot0._attackLeftState = slot0.Battle.AttackLeftState.New()
	slot0._deadState = slot0.Battle.DeadState.New()
	slot0._moveLeftState = slot0.Battle.MoveLeftState.New()
	slot0._victoryState = slot0.Battle.VictoryState.New()
	slot0._victorySwimState = slot0.Battle.VictorySwimState.New()
	slot0._standState = slot0.Battle.StandState.New()
	slot0._spellState = slot0.Battle.SpellState.New()
	slot0._interruptState = slot0.Battle.InterruptState.New()
	slot0._divingState = slot0.Battle.DivingState.New()
	slot0._diveState = slot0.Battle.DiveState.New()
	slot0._diveLeftState = slot0.Battle.DiveLeftState.New()
	slot0._raidState = slot0.Battle.RaidState.New()
	slot0._raidLeftState = slot0.Battle.RaidLeftState.New()

	slot0:OnIdleState()
end

ys.Battle.UnitState.ChangeState = function (slot0, slot1, slot2)
	if slot1 == slot0.STATE_IDLE then
		slot0._currentState:AddIdleState(slot0)
	elseif slot1 == slot0.STATE_MOVE then
		slot0._currentState:AddMoveState(slot0)
	elseif slot1 == slot0.STATE_MOVE then
		slot0._currentState:AddMoveState(slot0)
	elseif slot1 == slot0.STATE_ATTACK then
		slot0._currentState:AddAttackState(slot0, slot2)
	elseif slot1 == slot0.STATE_DEAD then
		slot0._currentState:AddDeadState(slot0)
	elseif slot1 == slot0.STATE_MOVELEFT then
		slot0._currentState:AddMoveLeftState(slot0)
	elseif slot1 == slot0.STATE_VICTORY then
		if slot0:GetTarget():GetOxyState() and slot3:GetCurrentDiveState() == slot0.OXY_STATE.DIVE then
			slot0._currentState:AddVictorySwimState(slot0)
		else
			slot0._currentState:AddVictoryState(slot0)
		end
	elseif slot1 == slot0.STATE_INTERRUPT then
		slot0._currentState:AddInterruptState(slot0)
	elseif slot1 == slot0.STATE_STAND then
		slot0._currentState:AddStandState(slot0)
	elseif slot1 == slot0.STATE_DIVING then
		slot0._currentState:AddDivingState(slot0)
	elseif slot1 == slot0.STATE_DIVE then
		slot0._currentState:AddDiveState(slot0)
	elseif slot1 == slot0.STATE_DIVELEFT then
		slot0._currentState:AddDiveLeftState(slot0)
	end
end

ys.Battle.UnitState.OnMoveState = function (slot0)
	slot0._currentState = slot0._moveState

	slot0:SendAction(slot0.MOVE)
end

ys.Battle.UnitState.OnMoveLeftState = function (slot0)
	slot0._currentState = slot0._moveLeftState

	slot0:SendAction(slot0.MOVELEFT)
end

ys.Battle.UnitState.OnIdleState = function (slot0)
	slot0._currentState = slot0._idleState

	slot0:SendAction(slot0.IDLE)
end

ys.Battle.UnitState.OnAttackState = function (slot0, slot1)
	slot0._currentState = slot0._attackState

	slot0:SendAction(slot1)
end

ys.Battle.UnitState.OnAttackLeftState = function (slot0, slot1)
	slot0._currentState = slot0._attackLeftState

	slot0:SendAction(slot1 .. "_left")
end

ys.Battle.UnitState.OnDivingState = function (slot0)
	slot0._currentState = slot0._divingState

	slot0:SendAction(slot0.DIVING)
end

ys.Battle.UnitState.OnDiveState = function (slot0)
	slot0._currentState = slot0._diveState

	slot0:SendAction(slot0.DIVE)
end

ys.Battle.UnitState.OnDiveLeftState = function (slot0)
	slot0._currentState = slot0._diveLeftState

	slot0:SendAction(slot0.DIVELEFT)
end

ys.Battle.UnitState.OnRaidState = function (slot0, slot1)
	slot0._currentState = slot0._raidState

	slot0:SendAction(slot0.RAID)
end

ys.Battle.UnitState.OnRaidLeftState = function (slot0, slot1)
	slot0._currentState = slot0._raidLeftState

	slot0:SendAction(slot0.RAIDLEFT)
end

ys.Battle.UnitState.OnDeadState = function (slot0)
	slot0._currentState = slot0._deadState

	if slot0:GetTarget():GetOxyState() and slot1:GetCurrentDiveState() == slot0.OXY_STATE.DIVE then
		slot0:SendAction(slot1.DEAD_SWIM)
	else
		slot0:SendAction(slot1.DEAD)
	end
end

ys.Battle.UnitState.OnVictoryState = function (slot0)
	slot0._currentState = slot0._victoryState

	slot0:SendAction(slot0.VICTORY)
end

ys.Battle.UnitState.OnVictorySwimState = function (slot0)
	slot0._currentState = slot0._victorySwimState

	slot0:SendAction(slot0.VICTORY_SWIM)
end

ys.Battle.UnitState.OnStandState = function (slot0)
	slot0._currentState = slot0._standState

	slot0:SendAction(slot0.STAND)
end

ys.Battle.UnitState.OnInterruptState = function (slot0)
	slot0._currentState = slot0._interruptState

	slot0:SendAction(slot0.INTERRUPT)
end

ys.Battle.UnitState.ChangeToMoveState = function (slot0)
	slot1 = slot0:GetTarget():GetSpeed().x

	if slot0:GetTarget():GetOxyState() and slot2:GetCurrentDiveState() == slot0.OXY_STATE.DIVE then
		if slot1 >= 0 then
			slot0:OnDiveState()
		else
			slot0:OnDiveLeftState()
		end
	elseif slot1 >= 0 then
		slot0:OnMoveState()
	else
		slot0:OnMoveLeftState()
	end
end

ys.Battle.UnitState.SendAction = function (slot0, slot1)
	slot0._target:DispatchEvent(slot0.Event.New(slot0.Battle.BattleUnitEvent.CHANGE_ACTION, {
		actionType = slot1
	}))
end

ys.Battle.UnitState.ChangeOxyState = function (slot0, slot1)
	slot0._target:ChangeOxygenState(slot1)
end

ys.Battle.UnitState.GetTarget = function (slot0)
	return slot0._target
end

ys.Battle.UnitState.GetCurrentStateName = function (slot0)
	return slot0._currentState.__name
end

ys.Battle.UnitState.NeedWeaponCache = function (slot0)
	return slot0._currentState:CacheWeapon()
end

ys.Battle.UnitState.OnActionStart = function (slot0)
	slot0._currentState:OnStart(slot0)
end

ys.Battle.UnitState.OnActionTrigger = function (slot0)
	slot0._currentState:OnTrigger(slot0)
end

ys.Battle.UnitState.OnActionEnd = function (slot0)
	slot0._currentState:OnEnd(slot0)
end

return
