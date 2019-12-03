ys = ys or {}
ys.Battle.SuspiciousAntiSubState = class("SuspiciousAntiSubState", ys.Battle.IAntiSubState)
ys.Battle.SuspiciousAntiSubState.__name = "SuspiciousAntiSubState"

ys.Battle.SuspiciousAntiSubState.Ctor = function (slot0)
	slot0.super.Ctor(slot0)
end

ys.Battle.SuspiciousAntiSubState.OnVigilantEngage = function (slot0, slot1)
	slot1:OnVigilantState()
end

ys.Battle.SuspiciousAntiSubState.OnMineExplode = function (slot0, slot1)
	slot1:OnVigilantState()
end

ys.Battle.SuspiciousAntiSubState.OnSubmarinFloat = function (slot0, slot1)
	slot1:OnVigilantState()
end

ys.Battle.SuspiciousAntiSubState.ToPreLevel = function (slot0, slot1)
	slot1:OnCalmState()
end

ys.Battle.SuspiciousAntiSubState.OnHateChain = function (slot0, slot1)
	slot1:OnVigilantState()
end

ys.Battle.SuspiciousAntiSubState.GetWeaponUseable = function (slot0)
	return {}
end

ys.Battle.SuspiciousAntiSubState.CanDecay = function (slot0)
	return true
end

ys.Battle.SuspiciousAntiSubState.GetWarnMark = function (slot0)
	return 1
end

ys.Battle.SuspiciousAntiSubState.GetMeterSpeed = function (slot0)
	return 1
end

ys.Battle.SuspiciousAntiSubState.DecayDuration = function (slot0)
	return 1
end

return
