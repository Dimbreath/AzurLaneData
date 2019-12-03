ys = ys or {}
slot1 = ys.Battle.BattleConst
ys.Battle.RetreatOxyState = class("RetreatOxyState", ys.Battle.IOxyState)
ys.Battle.RetreatOxyState.__name = "RetreatOxyState"

ys.Battle.RetreatOxyState.Ctor = function (slot0)
	slot0.super.Ctor(slot0)
end

ys.Battle.RetreatOxyState.GetWeaponUseableList = function (slot0)
	return {}
end

ys.Battle.RetreatOxyState.GetDiveState = function (slot0)
	return slot0.OXY_STATE.FLOAT
end

ys.Battle.RetreatOxyState.GetBubbleFlag = function (slot0)
	return false
end

ys.Battle.RetreatOxyState.IsVisible = function (slot0)
	return true
end

ys.Battle.RetreatOxyState.GetBarVisible = function (slot0)
	return false
end

ys.Battle.RetreatOxyState.RunMode = function (slot0)
	return false
end

return
