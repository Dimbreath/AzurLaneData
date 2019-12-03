ys = ys or {}
slot1 = ys.Battle.BattleConst
ys.Battle.FloatOxyState = class("FloatOxyState", ys.Battle.IOxyState)
ys.Battle.FloatOxyState.__name = "FloatOxyState"

ys.Battle.FloatOxyState.Ctor = function (slot0)
	slot0.super.Ctor(slot0)
end

ys.Battle.FloatOxyState.GetWeaponUseableList = function (slot0)
	return {
		slot0.OXY_STATE.DIVE,
		slot0.OXY_STATE.FLOAT
	}
end

ys.Battle.FloatOxyState.GetDiveState = function (slot0)
	return slot0.OXY_STATE.FLOAT
end

ys.Battle.FloatOxyState.GetBubbleFlag = function (slot0)
	return false
end

ys.Battle.FloatOxyState.IsVisible = function (slot0)
	return true
end

ys.Battle.FloatOxyState.GetBarVisible = function (slot0)
	return false
end

ys.Battle.FloatOxyState.RunMode = function (slot0)
	return false
end

return
