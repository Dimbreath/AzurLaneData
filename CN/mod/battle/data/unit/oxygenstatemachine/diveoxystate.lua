ys = ys or {}
slot1 = ys.Battle.BattleConst
ys.Battle.DiveOxyState = class("DiveOxyState", ys.Battle.IOxyState)
ys.Battle.DiveOxyState.__name = "DiveOxyState"

function ys.Battle.DiveOxyState.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function ys.Battle.DiveOxyState.GetWeaponUseableList(slot0)
	return {}
end

function ys.Battle.DiveOxyState.GetDiveState(slot0)
	return slot0.OXY_STATE.DIVE
end

function ys.Battle.DiveOxyState.GetBubbleFlag(slot0)
	return true
end

function ys.Battle.DiveOxyState.IsVisible(slot0)
	return false
end

function ys.Battle.DiveOxyState.GetBarVisible(slot0)
	return true
end

function ys.Battle.DiveOxyState.RunMode(slot0)
	return false
end

return
