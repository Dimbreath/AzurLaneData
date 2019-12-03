ys = ys or {}
slot1 = ys.Battle.BattleConst
ys.Battle.DiveOxyState = class("DiveOxyState", ys.Battle.IOxyState)
ys.Battle.DiveOxyState.__name = "DiveOxyState"

ys.Battle.DiveOxyState.Ctor = function (slot0)
	slot0.super.Ctor(slot0)
end

ys.Battle.DiveOxyState.GetWeaponUseableList = function (slot0)
	return {}
end

ys.Battle.DiveOxyState.GetDiveState = function (slot0)
	return slot0.OXY_STATE.DIVE
end

ys.Battle.DiveOxyState.GetBubbleFlag = function (slot0)
	return true
end

ys.Battle.DiveOxyState.IsVisible = function (slot0)
	return false
end

ys.Battle.DiveOxyState.GetBarVisible = function (slot0)
	return true
end

ys.Battle.DiveOxyState.RunMode = function (slot0)
	return false
end

return
