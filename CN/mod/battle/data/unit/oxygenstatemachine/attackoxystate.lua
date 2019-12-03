ys = ys or {}
slot1 = ys.Battle.BattleConst
ys.Battle.AttackOxyState = class("AttackOxyState", ys.Battle.IOxyState)
ys.Battle.AttackOxyState.__name = "AttackOxyState"

ys.Battle.AttackOxyState.Ctor = function (slot0)
	slot0.super.Ctor(slot0)
end

ys.Battle.AttackOxyState.GetWeaponUseableList = function (slot0)
	return {
		slot0.OXY_STATE.DIVE,
		slot0.OXY_STATE.FLOAT
	}
end

ys.Battle.AttackOxyState.GetDiveState = function (slot0)
	return slot0.OXY_STATE.FLOAT
end

ys.Battle.AttackOxyState.GetBubbleFlag = function (slot0)
	return false
end

ys.Battle.AttackOxyState.IsVisible = function (slot0)
	return true
end

return
