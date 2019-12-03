ys = ys or {}
slot1 = ys.Battle.BattleConst
ys.Battle.IdleOxyState = class("IdleOxyState", ys.Battle.IOxyState)
ys.Battle.IdleOxyState.__name = "IdleOxyState"

function ys.Battle.IdleOxyState.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function ys.Battle.IdleOxyState.GetWeaponUseableList(slot0)
	return {}
end

function ys.Battle.IdleOxyState.GetDiveState(slot0)
	return slot0.OXY_STATE.FLOAT
end

function ys.Battle.IdleOxyState.GetBubbleFlag(slot0)
	return false
end

function ys.Battle.IdleOxyState.IsVisible(slot0)
	return false
end

function ys.Battle.IdleOxyState.GetBarVisible(slot0)
	return true
end

function ys.Battle.IdleOxyState.RunMode(slot0)
	return false
end

return
