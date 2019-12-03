ys = ys or {}
slot1 = ys.Battle.BattleConst
ys.Battle.EngageAntiSubState = class("EngageAntiSubState", ys.Battle.IAntiSubState)
ys.Battle.EngageAntiSubState.__name = "EngageAntiSubState"

ys.Battle.EngageAntiSubState.Ctor = function (slot0)
	slot0.super.Ctor(slot0)
end

ys.Battle.EngageAntiSubState.OnVigilantEngage = function (slot0, slot1)
	return
end

ys.Battle.EngageAntiSubState.OnMineExplode = function (slot0, slot1)
	return
end

ys.Battle.EngageAntiSubState.OnSubmarinFloat = function (slot0, slot1)
	return
end

ys.Battle.EngageAntiSubState.ToPreLevel = function (slot0, slot1)
	slot1:OnVigilantState()
end

ys.Battle.EngageAntiSubState.OnHateChain = function (slot0)
	return
end

ys.Battle.EngageAntiSubState.GetWeaponUseable = function (slot0)
	return {
		slot0.OXY_STATE.FLOAT
	}
end

ys.Battle.EngageAntiSubState.CanDecay = function (slot0)
	return true
end

ys.Battle.EngageAntiSubState.GetWarnMark = function (slot0)
	return 3
end

ys.Battle.EngageAntiSubState.GetMeterSpeed = function (slot0)
	return 5
end

ys.Battle.EngageAntiSubState.DecayDuration = function (slot0)
	return 3
end

return
