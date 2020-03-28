ys = ys or {}
ys.Battle.VigilantAntiSubState = class("VigilantAntiSubState", ys.Battle.IAntiSubState)
ys.Battle.VigilantAntiSubState.__name = "VigilantAntiSubState"

function ys.Battle.VigilantAntiSubState.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function ys.Battle.VigilantAntiSubState.OnVigilantEngage(slot0, slot1)
	return
end

function ys.Battle.VigilantAntiSubState.OnMineExplode(slot0, slot1)
	return
end

function ys.Battle.VigilantAntiSubState.OnSubmarinFloat(slot0, slot1)
	return
end

function ys.Battle.VigilantAntiSubState.OnHateChain(slot0, slot1)
	slot1:OnEngageState(true)
end

function ys.Battle.VigilantAntiSubState.ToPreLevel(slot0, slot1)
	slot1:OnSuspiciousState()
end

function ys.Battle.VigilantAntiSubState.GetWeaponUseable(slot0)
	return {}
end

function ys.Battle.VigilantAntiSubState.CanDecay(slot0)
	return true
end

function ys.Battle.VigilantAntiSubState.GetWarnMark(slot0)
	return 2
end

function ys.Battle.VigilantAntiSubState.GetMeterSpeed(slot0)
	return 1.3
end

function ys.Battle.VigilantAntiSubState.DecayDuration(slot0)
	return 2
end

return
