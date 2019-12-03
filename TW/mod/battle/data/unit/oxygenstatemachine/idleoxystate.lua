ys = ys or {}
slot1 = ys.Battle.BattleConst
ys.Battle.IdleOxyState = class("IdleOxyState", ys.Battle.IOxyState)
ys.Battle.IdleOxyState.__name = "IdleOxyState"

ys.Battle.IdleOxyState.Ctor = function (slot0)
	slot0.super.Ctor(slot0)
end

ys.Battle.IdleOxyState.GetWeaponUseableList = function (slot0)
	return {}
end

ys.Battle.IdleOxyState.GetDiveState = function (slot0)
	return slot0.OXY_STATE.FLOAT
end

ys.Battle.IdleOxyState.GetBubbleFlag = function (slot0)
	return false
end

ys.Battle.IdleOxyState.IsVisible = function (slot0)
	return false
end

ys.Battle.IdleOxyState.GetBarVisible = function (slot0)
	return true
end

ys.Battle.IdleOxyState.RunMode = function (slot0)
	return false
end

return
