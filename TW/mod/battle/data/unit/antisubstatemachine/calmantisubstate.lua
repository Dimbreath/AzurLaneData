ys = ys or {}
ys.Battle.CalmAntiSubState = class("CalmAntiSubState", ys.Battle.IAntiSubState)
ys.Battle.CalmAntiSubState.__name = "CalmAntiSubState"

function ys.Battle.CalmAntiSubState.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function ys.Battle.CalmAntiSubState.OnVigilantEngage(slot0, slot1)
	slot1:OnVigilantState()
end

function ys.Battle.CalmAntiSubState.OnMineExplode(slot0, slot1)
	slot1:OnSuspiciousState()
end

function ys.Battle.CalmAntiSubState.OnSubmarinFloat(slot0, slot1)
	slot1:OnSuspiciousState()
end

function ys.Battle.CalmAntiSubState.OnHateChain(slot0, slot1)
	slot1:OnSuspiciousState()
end

function ys.Battle.CalmAntiSubState.ToPreLevel(slot0, slot1)
	return
end

function ys.Battle.CalmAntiSubState.GetWeaponUseable(slot0)
	return {}
end

function ys.Battle.CalmAntiSubState.CanDecay(slot0)
	return false
end

function ys.Battle.CalmAntiSubState.GetWarnMark(slot0)
	return 0
end

function ys.Battle.CalmAntiSubState.GetMeterSpeed(slot0)
	return -1
end

function ys.Battle.CalmAntiSubState.DecayDuration(slot0)
	return 0
end

return
