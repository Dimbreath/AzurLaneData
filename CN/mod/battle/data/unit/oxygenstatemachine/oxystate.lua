ys = ys or {}
slot1 = ys.Battle.BattleConfig
slot2 = ys.Battle.BattleConst
ys.Battle.OxyState = class("OxyState")
ys.Battle.OxyState.__name = "OxyState"
ys.Battle.OxyState.STATE_IDLE = "STATE_IDLE"
ys.Battle.OxyState.STATE_DIVE = "STATE_DIVE"
ys.Battle.OxyState.STATE_DIVING = "STATE_DIVING"
ys.Battle.OxyState.STATE_FLOAT = "STATE_FLOAT"
ys.Battle.OxyState.STATE_RAID = "STATE_RAID"
ys.Battle.OxyState.STATE_RETREAT = "STATE_RETREAT"
ys.Battle.OxyState.STATE_FREE_DIVE = "STATE_FREE_DIVE"
ys.Battle.OxyState.STATE_FREE_FLOAT = "STATE_FREE_FLOAT"
ys.Battle.OxyState.STATE_FREE_BENCH = "STATE_FREE_BENCH"
ys.Battle.OxyState.STATE_DEEP_MINE = "STATE_DEEP_MINE"

ys.Battle.OxyState.Ctor = function (slot0, slot1)
	slot0._target = slot1
	slot0._idleState = slot0.Battle.IdleOxyState.New()
	slot0._diveState = slot0.Battle.DiveOxyState.New()
	slot0._divingState = slot0.Battle.DivingOxyState.New()
	slot0._floatState = slot0.Battle.FloatOxyState.New()
	slot0._raidState = slot0.Battle.RaidOxyState.New()
	slot0._retreatState = slot0.Battle.RetreatOxyState.New()
	slot0._freeDiveState = slot0.Battle.FreeDiveOxyState.New()
	slot0._freeFloatState = slot0.Battle.FreeFloatOxyState.New()
	slot0._freeBenchState = slot0.Battle.FreeBenchOxyState.New()
	slot0._deepMineState = slot0.Battle.DeepMineOxyState.New()

	slot0._target:AddBuff(slot0.Battle.BattleBuffUnit.New(8520))
	slot0:OnIdleState()
end

ys.Battle.OxyState.SetRecycle = function (slot0, slot1)
	slot0._recycle = slot1
end

ys.Battle.OxyState.SetBubbleTemplate = function (slot0, slot1, slot2)
	slot0._bubbleInitial = slot1
	slot0._bubbleInterval = slot2
	slot0._bubbleTimpStamp = nil
end

ys.Battle.OxyState.UpdateOxygen = function (slot0)
	slot0._currentState:DoUpdateOxy(slot0)
end

ys.Battle.OxyState.GetNextBubbleStamp = function (slot0)
	if slot0._currentState:GetBubbleFlag() then
		if slot0._target:GetPosition().x < slot0._bubbleInitial and slot0._bubbleTimpStamp == nil then
			slot0._bubbleTimpStamp = 0
		end

		return slot0._bubbleTimpStamp
	else
		return nil
	end
end

ys.Battle.OxyState.FlashBubbleStamp = function (slot0, slot1)
	slot0._bubbleTimpStamp = slot1 + slot0._bubbleInterval
end

ys.Battle.OxyState.ChangeState = function (slot0, slot1, slot2)
	if slot1 == slot0.STATE_IDLE then
		slot0:OnIdleState()
	elseif slot1 == slot0.STATE_DIVE then
		slot0:OnDiveState()
	elseif slot1 == slot0.STATE_FLOAT then
		slot0:OnFloatState()
	elseif slot1 == slot0.STATE_RAID then
		slot0:OnRaidState()
	elseif slot1 == slot0.STATE_RETREAT then
		slot0:OnRetreatState()
	elseif slot1 == slot0.STATE_DIVING then
		slot0:OnDivingState()
	elseif slot1 == slot0.STATE_FREE_DIVE then
		slot0:OnFreeDiveState()
	elseif slot1 == slot0.STATE_FREE_FLOAT then
		slot0:OnFreeFloatState()
	elseif slot1 == slot0.STATE_FREE_BENCH then
		slot0:OnFreeBenchState()
	elseif slot1 == slot0.STATE_DEEP_MINE then
		slot0:OnDeepMineState()
	end

	slot0._target:GetCldData().Surface = slot0._currentState:GetDiveState()
end

ys.Battle.OxyState.OxyConsume = function (slot0)
	slot0._target:OxyConsume()
end

ys.Battle.OxyState.OxyRecover = function (slot0, slot1)
	slot0._target:OxyRecover(slot1)
end

ys.Battle.OxyState.OnIdleState = function (slot0)
	slot0._currentState = slot0._idleState
end

ys.Battle.OxyState.OnDivingState = function (slot0)
	slot0._currentState = slot0._divingState
	slot0._target:GetCldData().Surface = slot0._currentState:GetDiveState()

	slot0._target:ChangeWeaponDiveState()
	slot0._target:SetCrash(false)
	slot0._target:SetAI(slot0.SUB_DEFAULT_STAY_AI)
	slot0._target:SetDiveInvisible(false)
	slot0._target:StateChange(slot1.Battle.UnitState.STATE_DIVING)
	slot0._target:RemoveBuff(slot0.SUB_FLOAT_DISIMMUNE_IGNITE_BUFF)
	slot0._target:AddBuff(slot1.Battle.BattleBuffUnit.New(slot0.SUB_DIVE_IMMUNE_IGNITE_BUFF))
end

ys.Battle.OxyState.OnDiveState = function (slot0)
	slot0._currentState = slot0._diveState
	slot0._target:GetCldData().Surface = slot0._currentState:GetDiveState()

	slot0._target:ChangeWeaponDiveState()
	slot0._target:SetCrash(false)
	slot0._target:SetAI(slot0.SUB_DEFAULT_ENGAGE_AI)
	slot0._target:SetDiveInvisible(true)
	slot0._target:StateChange(slot1.Battle.UnitState.STATE_DIVE)
	slot0._target:TriggerBuff(slot2.BuffEffectType.ON_SUBMARINE_DIVE, {})
	slot0._target:RemoveBuff(slot0.SUB_FLOAT_DISIMMUNE_IGNITE_BUFF)
	slot0._target:AddBuff(slot1.Battle.BattleBuffUnit.New(slot0.SUB_DIVE_IMMUNE_IGNITE_BUFF))
end

ys.Battle.OxyState.OnFloatState = function (slot0)
	slot0._currentState = slot0._floatState
	slot0._target:GetCldData().Surface = slot0._currentState:GetDiveState()

	slot0._target:ChangeWeaponDiveState()
	slot0._target:SetDiveInvisible(false)
	slot0._target:StateChange(slot0.Battle.UnitState.STATE_MOVE)
	slot0._target:PlayFX("qianting_chushui", false)
	slot0._target:TriggerBuff(slot1.BuffEffectType.ON_SUBMARINE_FLOAT, {})
	slot0._target:RemoveBuff(slot2.SUB_DIVE_IMMUNE_IGNITE_BUFF)
	slot0._target:AddBuff(slot0.Battle.BattleBuffUnit.New(slot2.SUB_FLOAT_DISIMMUNE_IGNITE_BUFF))
end

ys.Battle.OxyState.OnRaidState = function (slot0)
	slot0._currentState = slot0._raidState
	slot0._target:GetCldData().Surface = slot0._currentState:GetDiveState()

	slot0._target:ChangeWeaponDiveState()
	slot0._target:SetDiveInvisible(true)
	slot0._target:SetAI(slot0.SUB_DEFAULT_STAY_AI)
	slot0._target:TriggerBuff(slot1.BuffEffectType.ON_SUBMARINE_RAID, {})
	slot0._target:RemoveBuff(slot0.SUB_FLOAT_DISIMMUNE_IGNITE_BUFF)
	slot0._target:AddBuff(slot2.Battle.BattleBuffUnit.New(slot0.SUB_DIVE_IMMUNE_IGNITE_BUFF))
end

ys.Battle.OxyState.OnRetreatState = function (slot0)
	slot0._currentState = slot0._retreatState
	slot0._target:GetCldData().Surface = slot0._currentState:GetDiveState()

	slot0._target:ChangeWeaponDiveState()
	slot0._target:SetDiveInvisible(false)
	slot0._target:SetAI(slot0.SUB_DEFAULT_RETREAT_AI)
	slot0._target:TriggerBuff(slot1.BuffEffectType.ON_SUBMARINE_RETREAT, {})
	slot0._target:RemoveBuff(slot0.SUB_DIVE_IMMUNE_IGNITE_BUFF)
	slot0._target:AddBuff(slot2.Battle.BattleBuffUnit.New(slot0.SUB_FLOAT_DISIMMUNE_IGNITE_BUFF))
end

ys.Battle.OxyState.OnFreeDiveState = function (slot0)
	slot0._currentState = slot0._freeDiveState
	slot0._target:GetCldData().Surface = slot0._currentState:GetDiveState()

	slot0._target:ChangeWeaponDiveState()
	slot0._target:SetCrash(false)
	slot0._target:SetDiveInvisible(true)
	slot0._target:StateChange(slot0.Battle.UnitState.STATE_DIVE)
	slot0._target:PlayFX("qianting_rushui", false)
	slot0._target:TriggerBuff(slot1.BuffEffectType.ON_SUBMARINE_DIVE, {})
	slot0._target:RemoveBuff(slot2.SUB_FLOAT_DISIMMUNE_IGNITE_BUFF)
	slot0._target:AddBuff(slot0.Battle.BattleBuffUnit.New(slot2.SUB_DIVE_IMMUNE_IGNITE_BUFF))
end

ys.Battle.OxyState.OnFreeFloatState = function (slot0)
	slot0._currentState = slot0._freeFloatState
	slot0._target:GetCldData().Surface = slot0._currentState:GetDiveState()

	slot0._target:ChangeWeaponDiveState()
	slot0._target:SetDiveInvisible(false)
	slot0._target:StateChange(slot0.Battle.UnitState.STATE_MOVE)
	slot0._target:PlayFX("qianting_chushui", false)
	slot0._target:TriggerBuff(slot1.BuffEffectType.ON_SUBMARINE_FLOAT, {})
	slot0._target:RemoveBuff(slot2.SUB_DIVE_IMMUNE_IGNITE_BUFF)
	slot0._target:AddBuff(slot0.Battle.BattleBuffUnit.New(slot2.SUB_FLOAT_DISIMMUNE_IGNITE_BUFF))
end

ys.Battle.OxyState.OnFreeBenchState = function (slot0)
	slot0._currentState = slot0._freeBenchState
	slot0._target:GetCldData().Surface = slot0._currentState:GetDiveState()

	slot0._target:ChangeWeaponDiveState()
	slot0._target:SetDiveInvisible(false)
	slot0._target:StateChange(slot0.Battle.UnitState.STATE_MOVE)
	slot0._target:PlayFX("qianting_chushui", false)
	slot0._target:RemoveBuff(slot1.SUB_DIVE_IMMUNE_IGNITE_BUFF)
	slot0._target:AddBuff(slot0.Battle.BattleBuffUnit.New(slot1.SUB_FLOAT_DISIMMUNE_IGNITE_BUFF))
end

ys.Battle.OxyState.OnDeepMineState = function (slot0)
	slot0._currentState = slot0._deepMineState
	slot0._target:GetCldData().Surface = slot0._currentState:GetDiveState()

	slot0._target:SetDiveInvisible(false)
	slot0._target:ChangeWeaponDiveState()
	slot0._target:SetAI(20005)
end

ys.Battle.OxyState.GetRecycle = function (slot0)
	return false
end

ys.Battle.OxyState.GetTarget = function (slot0)
	return slot0._target
end

ys.Battle.OxyState.GetCurrentStateName = function (slot0)
	return slot0._currentState.__name
end

ys.Battle.OxyState.GetWeaponType = function (slot0)
	return slot0._currentState:GetWeaponUseableList()
end

ys.Battle.OxyState.GetBarVisible = function (slot0)
	return slot0._currentState:GetBarVisible()
end

ys.Battle.OxyState.GetRundMode = function (slot0)
	return slot0._currentState:RunMode()
end

ys.Battle.OxyState.GetCurrentDiveState = function (slot0)
	return slot0._currentState:GetDiveState()
end

return
