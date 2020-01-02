ys = ys or {}
slot1 = ys.Battle.BattleConst
ys.Battle.EngageAntiSubState = class("EngageAntiSubState", ys.Battle.IAntiSubState)
ys.Battle.EngageAntiSubState.__name = "EngageAntiSubState"

function ys.Battle.EngageAntiSubState.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function ys.Battle.EngageAntiSubState.OnVigilantEngage(slot0, slot1)
	return
end

function ys.Battle.EngageAntiSubState.OnMineExplode(slot0, slot1)
	return
end

function ys.Battle.EngageAntiSubState.OnSubmarinFloat(slot0, slot1)
	return
end

function ys.Battle.EngageAntiSubState.ToPreLevel(slot0, slot1)
	slot1:OnVigilantState()
end

function ys.Battle.EngageAntiSubState.OnHateChain(slot0)
	return
end

function ys.Battle.EngageAntiSubState.GetWeaponUseable(slot0)
	return {
		slot0.OXY_STATE.FLOAT
	}
end

function ys.Battle.EngageAntiSubState.CanDecay(slot0)
	return true
end

function ys.Battle.EngageAntiSubState.GetWarnMark(slot0)
	return 3
end

function ys.Battle.EngageAntiSubState.GetMeterSpeed(slot0)
	return 5
end

function ys.Battle.EngageAntiSubState.DecayDuration(slot0)
	return 3
end

return
