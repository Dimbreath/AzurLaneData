ys = ys or {}
slot1 = ys.Battle.BattleConst
ys.Battle.RaidOxyState = class("RaidOxyState", ys.Battle.IOxyState)
ys.Battle.RaidOxyState.__name = "RaidOxyState"

ys.Battle.RaidOxyState.Ctor = function (slot0)
	slot0.super.Ctor(slot0)
end

ys.Battle.RaidOxyState.GetWeaponUseableList = function (slot0)
	return {
		slot0.OXY_STATE.DIVE
	}
end

ys.Battle.RaidOxyState.GetDiveState = function (slot0)
	return slot0.OXY_STATE.DIVE
end

ys.Battle.RaidOxyState.GetBubbleFlag = function (slot0)
	return true
end

ys.Battle.RaidOxyState.IsVisible = function (slot0)
	return false
end

ys.Battle.RaidOxyState.GetBarVisible = function (slot0)
	return true
end

ys.Battle.RaidOxyState.RunMode = function (slot0)
	return false
end

return
