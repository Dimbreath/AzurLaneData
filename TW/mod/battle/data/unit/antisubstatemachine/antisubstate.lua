ys = ys or {}
slot2 = ys.Battle.BattleConst.ActionName
ys.Battle.AntiSubState = class("AntiSubState")
ys.Battle.AntiSubState.__name = "AntiSubState"

ys.Battle.AntiSubState.Ctor = function (slot0, slot1)
	slot0._client = slot1
	slot0._calmState = slot0.Battle.CalmAntiSubState.New()
	slot0._suspiciousState = slot0.Battle.SuspiciousAntiSubState.New()
	slot0._vigilantState = slot0.Battle.VigilantAntiSubState.New()
	slot0._engageState = slot0.Battle.EngageAntiSubState.New()
	slot0._currentState = slot0._calmState
	slot0._vigilantValue = 0
	slot0._vigilantDecayTimeStamp = nil
	slot0._decayFlag = false
	slot0._engageRage = false
	slot0._lastSonarDected = false
end

ys.Battle.AntiSubState.Update = function (slot0, slot1, slot2)
	if slot2 > 0 and slot0:checkDecayRage() then
		slot0:OnEngageState()
	end

	if slot1 + slot2 > 0 then
		slot0:resetVigilantDecay()
	end

	slot3 = pg.TimeMgr.GetInstance():GetCombatTime()

	if slot0._vigilantDecayTimeStamp then
		slot0:updateVigilantDecay(slot3)
	elseif slot0._currentState:CanDecay() and slot1 + slot2 == 0 then
		slot0._vigilantDecayTimeStamp = slot3
	end

	slot4 = slot0._currentState:GetMeterSpeed()

	if slot0._decayFlag then
		slot4 = math.min(0, slot4)
	end

	slot0._vigilantValue = math.clamp(slot0._vigilantValue + slot4, 0, 100)

	if slot0._vigilantValue >= 100 and slot0._currentState ~= slot0._engageState then
		slot0:OnEngageState()
	end
end

ys.Battle.AntiSubState.updateVigilantDecay = function (slot0, slot1)
	if slot0._currentState:DecayDuration() <= slot1 - slot0._vigilantDecayTimeStamp then
		slot0._vigilantValue = slot0._vigilantValue - 0.01

		slot0._currentState:ToPreLevel(slot0)

		slot0._decayFlag = true
	end
end

ys.Battle.AntiSubState.resetVigilantDecay = function (slot0)
	slot0._vigilantDecayTimeStamp = nil
	slot0._decayFlag = false
end

ys.Battle.AntiSubState.checkDecayRage = function (slot0)
	return slot0._vigilantDecayTimeStamp and slot0._engageRage
end

ys.Battle.AntiSubState.HateChain = function (slot0)
	slot0:resetVigilantDecay()
	slot0._currentState:OnHateChain(slot0)
end

ys.Battle.AntiSubState.InitCheck = function (slot0, slot1)
	if slot1 > 0 then
		slot0:SubmarineFloat()
	end
end

ys.Battle.AntiSubState.MineExplode = function (slot0)
	if slot0:checkDecayRage() then
		slot0:OnEngageState()

		return
	end

	slot0:resetVigilantDecay()
	slot0._currentState:OnMineExplode(slot0)
end

ys.Battle.AntiSubState.SubmarineFloat = function (slot0)
	if slot0:checkDecayRage() then
		slot0:OnEngageState()

		return
	end

	slot0:resetVigilantDecay()
	slot0._currentState:OnSubmarinFloat(slot0)
end

ys.Battle.AntiSubState.VigilantAreaEngage = function (slot0)
	slot0:resetVigilantDecay()
	slot0._currentState:OnVigilantEngage(slot0)
end

ys.Battle.AntiSubState.SonarDetect = function (slot0, slot1)
	slot0:DispatchSonarCheck()

	slot2 = slot1 > 0

	if slot0._lastSonarDected and slot2 then
		slot0:OnEngageState()
	elseif slot2 then
		slot0:OnVigilantState()
	end

	slot0._lastSonarDected = slot2
end

ys.Battle.AntiSubState.OnCalmState = function (slot0)
	slot0:resetVigilantDecay()

	slot0._currentState = slot0._calmState
	slot0._engageRage = false

	slot0:DispatchStateChange()
end

ys.Battle.AntiSubState.OnSuspiciousState = function (slot0)
	slot0:resetVigilantDecay()

	slot0._currentState = slot0._suspiciousState

	slot0:DispatchStateChange()
end

ys.Battle.AntiSubState.OnVigilantState = function (slot0)
	slot0:resetVigilantDecay()

	slot0._currentState = slot0._vigilantState

	slot0:DispatchStateChange()
end

ys.Battle.AntiSubState.OnEngageState = function (slot0, slot1)
	slot0:resetVigilantDecay()

	slot0._currentState = slot0._engageState
	slot0._engageRage = true

	slot0:DispatchStateChange()

	if not slot1 then
		slot0:DispatchHateChain()
	end
end

ys.Battle.AntiSubState.IsWeaponUseable = function (slot0)
	return #slot0._currentState:GetWeaponUseable() > 0
end

ys.Battle.AntiSubState.GetVigilantRate = function (slot0)
	return slot0._vigilantValue * 0.01
end

ys.Battle.AntiSubState.DispatchStateChange = function (slot0)
	slot0._client:DispatchEvent(slot0.Event.New(slot0.Battle.BattleUnitEvent.CHANGE_ANTI_SUB_VIGILANCE))
end

ys.Battle.AntiSubState.DispatchSonarCheck = function (slot0)
	slot0._client:DispatchEvent(slot0.Event.New(slot0.Battle.BattleUnitEvent.ANTI_SUB_VIGILANCE_SONAR_CHECK))
end

ys.Battle.AntiSubState.DispatchHateChain = function (slot0)
	slot0._client:DispatchEvent(slot0.Event.New(slot0.Battle.BattleUnitEvent.ANTI_SUB_VIGILANCE_HATE_CHAIN))
end

ys.Battle.AntiSubState.GetVigilantMark = function (slot0)
	return slot0._currentState:GetWarnMark()
end

return
