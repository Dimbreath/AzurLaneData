ys = ys or {}
ys.Battle.CalmAntiSubState = class("CalmAntiSubState", ys.Battle.IAntiSubState)
ys.Battle.CalmAntiSubState.__name = "CalmAntiSubState"

ys.Battle.CalmAntiSubState.Ctor = function (slot0)
	slot0.super.Ctor(slot0)
end

ys.Battle.CalmAntiSubState.OnVigilantEngage = function (slot0, slot1)
	slot1:OnVigilantState()
end

ys.Battle.CalmAntiSubState.OnMineExplode = function (slot0, slot1)
	slot1:OnSuspiciousState()
end

ys.Battle.CalmAntiSubState.OnSubmarinFloat = function (slot0, slot1)
	slot1:OnSuspiciousState()
end

ys.Battle.CalmAntiSubState.OnHateChain = function (slot0, slot1)
	slot1:OnSuspiciousState()
end

ys.Battle.CalmAntiSubState.ToPreLevel = function (slot0, slot1)
	return
end

ys.Battle.CalmAntiSubState.GetWeaponUseable = function (slot0)
	return {}
end

ys.Battle.CalmAntiSubState.CanDecay = function (slot0)
	return false
end

ys.Battle.CalmAntiSubState.GetWarnMark = function (slot0)
	return 0
end

ys.Battle.CalmAntiSubState.GetMeterSpeed = function (slot0)
	return -1
end

ys.Battle.CalmAntiSubState.DecayDuration = function (slot0)
	return 0
end

return
