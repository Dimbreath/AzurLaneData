ys = ys or {}
slot1 = ys.Battle.BattleConst
ys.Battle.DivingOxyState = class("DivingOxyState", ys.Battle.IOxyState)
ys.Battle.DivingOxyState.__name = "DivingOxyState"

ys.Battle.DivingOxyState.Ctor = function (slot0)
	slot0.super.Ctor(slot0)
end

ys.Battle.DivingOxyState.GetWeaponUseableList = function (slot0)
	return {}
end

ys.Battle.DivingOxyState.GetDiveState = function (slot0)
	return slot0.OXY_STATE.DIVE
end

ys.Battle.DivingOxyState.GetBubbleFlag = function (slot0)
	return false
end

ys.Battle.DivingOxyState.IsVisible = function (slot0)
	return true
end

ys.Battle.DivingOxyState.GetBarVisible = function (slot0)
	return true
end

ys.Battle.DivingOxyState.RunMode = function (slot0)
	return false
end

return
