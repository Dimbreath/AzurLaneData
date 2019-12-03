ys = ys or {}
slot1 = ys.Battle.BattleConst
ys.Battle.FreeFloatOxyState = class("FreeFloatOxyState", ys.Battle.IOxyState)
ys.Battle.FreeFloatOxyState.__name = "FreeFloatOxyState"

ys.Battle.FreeFloatOxyState.Ctor = function (slot0)
	slot0.super.Ctor(slot0)
end

ys.Battle.FreeFloatOxyState.GetWeaponUseableList = function (slot0)
	return {
		slot0.OXY_STATE.DIVE,
		slot0.OXY_STATE.FLOAT
	}
end

ys.Battle.FreeFloatOxyState.GetDiveState = function (slot0)
	return slot0.OXY_STATE.FLOAT
end

ys.Battle.FreeFloatOxyState.GetBubbleFlag = function (slot0)
	return false
end

ys.Battle.FreeFloatOxyState.DoUpdateOxy = function (slot0, slot1)
	slot1:OxyRecover()
end

ys.Battle.FreeFloatOxyState.IsVisible = function (slot0)
	return true
end

ys.Battle.FreeFloatOxyState.GetBarVisible = function (slot0)
	return true
end

ys.Battle.FreeFloatOxyState.RunMode = function (slot0)
	return true
end

return
