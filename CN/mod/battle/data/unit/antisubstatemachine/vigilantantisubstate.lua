ys = ys or {}
ys.Battle.VigilantAntiSubState = class("VigilantAntiSubState", ys.Battle.IAntiSubState)
ys.Battle.VigilantAntiSubState.__name = "VigilantAntiSubState"

ys.Battle.VigilantAntiSubState.Ctor = function (slot0)
	slot0.super.Ctor(slot0)
end

ys.Battle.VigilantAntiSubState.OnVigilantEngage = function (slot0, slot1)
	return
end

ys.Battle.VigilantAntiSubState.OnMineExplode = function (slot0, slot1)
	return
end

ys.Battle.VigilantAntiSubState.OnSubmarinFloat = function (slot0, slot1)
	return
end

ys.Battle.VigilantAntiSubState.OnHateChain = function (slot0, slot1)
	slot1:OnEngageState(true)
end

ys.Battle.VigilantAntiSubState.ToPreLevel = function (slot0, slot1)
	slot1:OnSuspiciousState()
end

ys.Battle.VigilantAntiSubState.GetWeaponUseable = function (slot0)
	return {}
end

ys.Battle.VigilantAntiSubState.CanDecay = function (slot0)
	return true
end

ys.Battle.VigilantAntiSubState.GetWarnMark = function (slot0)
	return 2
end

ys.Battle.VigilantAntiSubState.GetMeterSpeed = function (slot0)
	return 1.3
end

ys.Battle.VigilantAntiSubState.DecayDuration = function (slot0)
	return 2
end

return
