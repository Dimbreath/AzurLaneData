ys = ys or {}
slot2 = ys.Battle.BattleConst.ActionName
ys.Battle.AntiSubState = class("AntiSubState")
ys.Battle.AntiSubState.__name = "AntiSubState"

function ys.Battle.AntiSubState.Ctor(slot0, slot1)
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

function ys.Battle.AntiSubState.Update(slot0, slot1, slot2)
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

function ys.Battle.AntiSubState.updateVigilantDecay(slot0, slot1)
	if slot0._currentState:DecayDuration() <= slot1 - slot0._vigilantDecayTimeStamp then
		slot0._vigilantValue = slot0._vigilantValue - 0.01

		slot0._currentState:ToPreLevel(slot0)

		slot0._decayFlag = true
	end
end

function ys.Battle.AntiSubState.resetVigilantDecay(slot0)
	slot0._vigilantDecayTimeStamp = nil
	slot0._decayFlag = false
end

function ys.Battle.AntiSubState.checkDecayRage(slot0)
	return slot0._vigilantDecayTimeStamp and slot0._engageRage
end

function ys.Battle.AntiSubState.HateChain(slot0)
	slot0:resetVigilantDecay()
	slot0._currentState:OnHateChain(slot0)
end

function ys.Battle.AntiSubState.InitCheck(slot0, slot1)
	if slot1 > 0 then
		slot0:SubmarineFloat()
	end
end

function ys.Battle.AntiSubState.MineExplode(slot0)
	if slot0:checkDecayRage() then
		slot0:OnEngageState()

		return
	end

	slot0:resetVigilantDecay()
	slot0._currentState:OnMineExplode(slot0)
end

function ys.Battle.AntiSubState.SubmarineFloat(slot0)
	if slot0:checkDecayRage() then
		slot0:OnEngageState()

		return
	end

	slot0:resetVigilantDecay()
	slot0._currentState:OnSubmarinFloat(slot0)
end

function ys.Battle.AntiSubState.VigilantAreaEngage(slot0)
	slot0:resetVigilantDecay()
	slot0._currentState:OnVigilantEngage(slot0)
end

function ys.Battle.AntiSubState.SonarDetect(slot0, slot1)
	slot0:DispatchSonarCheck()

	slot2 = slot1 > 0

	if slot0._lastSonarDected and slot2 then
		slot0:OnEngageState()
	elseif slot2 then
		slot0:OnVigilantState()
	end

	slot0._lastSonarDected = slot2
end

function ys.Battle.AntiSubState.OnCalmState(slot0)
	slot0:resetVigilantDecay()

	slot0._currentState = slot0._calmState
	slot0._engageRage = false

	slot0:DispatchStateChange()
end

function ys.Battle.AntiSubState.OnSuspiciousState(slot0)
	slot0:resetVigilantDecay()

	slot0._currentState = slot0._suspiciousState

	slot0:DispatchStateChange()
end

function ys.Battle.AntiSubState.OnVigilantState(slot0)
	slot0:resetVigilantDecay()

	slot0._currentState = slot0._vigilantState

	slot0:DispatchStateChange()
end

function ys.Battle.AntiSubState.OnEngageState(slot0, slot1)
	slot0:resetVigilantDecay()

	slot0._currentState = slot0._engageState
	slot0._engageRage = true

	slot0:DispatchStateChange()

	if not slot1 then
		slot0:DispatchHateChain()
	end
end

function ys.Battle.AntiSubState.IsWeaponUseable(slot0)
	return #slot0._currentState:GetWeaponUseable() > 0
end

function ys.Battle.AntiSubState.GetVigilantRate(slot0)
	return slot0._vigilantValue * 0.01
end

function ys.Battle.AntiSubState.DispatchStateChange(slot0)
	slot0._client:DispatchEvent(slot0.Event.New(slot0.Battle.BattleUnitEvent.CHANGE_ANTI_SUB_VIGILANCE))
end

function ys.Battle.AntiSubState.DispatchSonarCheck(slot0)
	slot0._client:DispatchEvent(slot0.Event.New(slot0.Battle.BattleUnitEvent.ANTI_SUB_VIGILANCE_SONAR_CHECK))
end

function ys.Battle.AntiSubState.DispatchHateChain(slot0)
	slot0._client:DispatchEvent(slot0.Event.New(slot0.Battle.BattleUnitEvent.ANTI_SUB_VIGILANCE_HATE_CHAIN))
end

function ys.Battle.AntiSubState.GetVigilantMark(slot0)
	return slot0._currentState:GetWarnMark()
end

return
