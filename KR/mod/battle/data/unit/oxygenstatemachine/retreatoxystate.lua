ys = ys or {}
slot1 = ys.Battle.BattleConst
ys.Battle.RetreatOxyState = class("RetreatOxyState", ys.Battle.IOxyState)
ys.Battle.RetreatOxyState.__name = "RetreatOxyState"

function ys.Battle.RetreatOxyState.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function ys.Battle.RetreatOxyState.GetWeaponUseableList(slot0)
	return {}
end

function ys.Battle.RetreatOxyState.GetDiveState(slot0)
	return slot0.OXY_STATE.FLOAT
end

function ys.Battle.RetreatOxyState.GetBubbleFlag(slot0)
	return false
end

function ys.Battle.RetreatOxyState.IsVisible(slot0)
	return true
end

function ys.Battle.RetreatOxyState.GetBarVisible(slot0)
	return false
end

function ys.Battle.RetreatOxyState.RunMode(slot0)
	return false
end

return
