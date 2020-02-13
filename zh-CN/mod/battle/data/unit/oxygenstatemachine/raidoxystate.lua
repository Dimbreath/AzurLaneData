ys = ys or {}
slot1 = ys.Battle.BattleConst
ys.Battle.RaidOxyState = class("RaidOxyState", ys.Battle.IOxyState)
ys.Battle.RaidOxyState.__name = "RaidOxyState"

function ys.Battle.RaidOxyState.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function ys.Battle.RaidOxyState.GetWeaponUseableList(slot0)
	return {
		slot0.OXY_STATE.DIVE
	}
end

function ys.Battle.RaidOxyState.GetDiveState(slot0)
	return slot0.OXY_STATE.DIVE
end

function ys.Battle.RaidOxyState.GetBubbleFlag(slot0)
	return true
end

function ys.Battle.RaidOxyState.IsVisible(slot0)
	return false
end

function ys.Battle.RaidOxyState.GetBarVisible(slot0)
	return true
end

function ys.Battle.RaidOxyState.RunMode(slot0)
	return false
end

return
