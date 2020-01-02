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

function ys.Battle.UnitState.Ctor(slot0, slot1)
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

function ys.Battle.UnitState.ChangeState(slot0, slot1, slot2)
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

function ys.Battle.UnitState.OnMoveState(slot0)
	slot0._currentState = slot0._moveState

	slot0:SendAction(slot0.MOVE)
end

function ys.Battle.UnitState.OnMoveLeftState(slot0)
	slot0._currentState = slot0._moveLeftState

	slot0:SendAction(slot0.MOVELEFT)
end

function ys.Battle.UnitState.OnIdleState(slot0)
	slot0._currentState = slot0._idleState

	slot0:SendAction(slot0.IDLE)
end

function ys.Battle.UnitState.OnAttackState(slot0, slot1)
	slot0._currentState = slot0._attackState

	slot0:SendAction(slot1)
end

function ys.Battle.UnitState.OnAttackLeftState(slot0, slot1)
	slot0._currentState = slot0._attackLeftState

	slot0:SendAction(slot1 .. "_left")
end

function ys.Battle.UnitState.OnDivingState(slot0)
	slot0._currentState = slot0._divingState

	slot0:SendAction(slot0.DIVING)
end

function ys.Battle.UnitState.OnDiveState(slot0)
	slot0._currentState = slot0._diveState

	slot0:SendAction(slot0.DIVE)
end

function ys.Battle.UnitState.OnDiveLeftState(slot0)
	slot0._currentState = slot0._diveLeftState

	slot0:SendAction(slot0.DIVELEFT)
end

function ys.Battle.UnitState.OnRaidState(slot0, slot1)
	slot0._currentState = slot0._raidState

	slot0:SendAction(slot0.RAID)
end

function ys.Battle.UnitState.OnRaidLeftState(slot0, slot1)
	slot0._currentState = slot0._raidLeftState

	slot0:SendAction(slot0.RAIDLEFT)
end

function ys.Battle.UnitState.OnDeadState(slot0)
	slot0._currentState = slot0._deadState

	if slot0:GetTarget():GetOxyState() and slot1:GetCurrentDiveState() == slot0.OXY_STATE.DIVE then
		slot0:SendAction(slot1.DEAD_SWIM)
	else
		slot0:SendAction(slot1.DEAD)
	end
end

function ys.Battle.UnitState.OnVictoryState(slot0)
	slot0._currentState = slot0._victoryState

	slot0:SendAction(slot0.VICTORY)
end

function ys.Battle.UnitState.OnVictorySwimState(slot0)
	slot0._currentState = slot0._victorySwimState

	slot0:SendAction(slot0.VICTORY_SWIM)
end

function ys.Battle.UnitState.OnStandState(slot0)
	slot0._currentState = slot0._standState

	slot0:SendAction(slot0.STAND)
end

function ys.Battle.UnitState.OnInterruptState(slot0)
	slot0._currentState = slot0._interruptState

	slot0:SendAction(slot0.INTERRUPT)
end

function ys.Battle.UnitState.ChangeToMoveState(slot0)
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

function ys.Battle.UnitState.SendAction(slot0, slot1)
	slot0._target:DispatchEvent(slot0.Event.New(slot0.Battle.BattleUnitEvent.CHANGE_ACTION, {
		actionType = slot1
	}))
end

function ys.Battle.UnitState.ChangeOxyState(slot0, slot1)
	slot0._target:ChangeOxygenState(slot1)
end

function ys.Battle.UnitState.GetTarget(slot0)
	return slot0._target
end

function ys.Battle.UnitState.GetCurrentStateName(slot0)
	return slot0._currentState.__name
end

function ys.Battle.UnitState.NeedWeaponCache(slot0)
	return slot0._currentState:CacheWeapon()
end

function ys.Battle.UnitState.OnActionStart(slot0)
	slot0._currentState:OnStart(slot0)
end

function ys.Battle.UnitState.OnActionTrigger(slot0)
	slot0._currentState:OnTrigger(slot0)
end

function ys.Battle.UnitState.OnActionEnd(slot0)
	slot0._currentState:OnEnd(slot0)
end

return
