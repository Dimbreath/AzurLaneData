ys = ys or {}
ys.Battle.SuspiciousAntiSubState = class("SuspiciousAntiSubState", ys.Battle.IAntiSubState)
ys.Battle.SuspiciousAntiSubState.__name = "SuspiciousAntiSubState"

function ys.Battle.SuspiciousAntiSubState.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function ys.Battle.SuspiciousAntiSubState.OnVigilantEngage(slot0, slot1)
	slot1:OnVigilantState()
end

function ys.Battle.SuspiciousAntiSubState.OnMineExplode(slot0, slot1)
	slot1:OnVigilantState()
end

function ys.Battle.SuspiciousAntiSubState.OnSubmarinFloat(slot0, slot1)
	slot1:OnVigilantState()
end

function ys.Battle.SuspiciousAntiSubState.ToPreLevel(slot0, slot1)
	slot1:OnCalmState()
end

function ys.Battle.SuspiciousAntiSubState.OnHateChain(slot0, slot1)
	slot1:OnVigilantState()
end

function ys.Battle.SuspiciousAntiSubState.GetWeaponUseable(slot0)
	return {}
end

function ys.Battle.SuspiciousAntiSubState.CanDecay(slot0)
	return true
end

function ys.Battle.SuspiciousAntiSubState.GetWarnMark(slot0)
	return 1
end

function ys.Battle.SuspiciousAntiSubState.GetMeterSpeed(slot0)
	return 1
end

function ys.Battle.SuspiciousAntiSubState.DecayDuration(slot0)
	return 1
end

return
