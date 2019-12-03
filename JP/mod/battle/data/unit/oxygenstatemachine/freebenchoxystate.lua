ys = ys or {}
slot1 = ys.Battle.BattleConst
ys.Battle.FreeBenchOxyState = class("FreeBenchOxyState", ys.Battle.IOxyState)
ys.Battle.FreeBenchOxyState.__name = "FreeBenchOxyState"

ys.Battle.FreeBenchOxyState.Ctor = function (slot0)
	slot0.super.Ctor(slot0)
end

ys.Battle.FreeBenchOxyState.GetWeaponUseableList = function (slot0)
	return {}
end

ys.Battle.FreeBenchOxyState.GetDiveState = function (slot0)
	return slot0.OXY_STATE.FLOAT
end

ys.Battle.FreeBenchOxyState.GetBubbleFlag = function (slot0)
	return true
end

ys.Battle.FreeBenchOxyState.DoUpdateOxy = function (slot0, slot1)
	slot1:OxyRecover(true)
end

ys.Battle.FreeBenchOxyState.IsVisible = function (slot0)
	return false
end

ys.Battle.FreeBenchOxyState.GetBarVisible = function (slot0)
	return true
end

ys.Battle.FreeBenchOxyState.RunMode = function (slot0)
	return true
end

return
