ys = ys or {}
slot1 = ys.Battle.BattleConst
ys.Battle.FreeBenchOxyState = class("FreeBenchOxyState", ys.Battle.IOxyState)
ys.Battle.FreeBenchOxyState.__name = "FreeBenchOxyState"

function ys.Battle.FreeBenchOxyState.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function ys.Battle.FreeBenchOxyState.GetWeaponUseableList(slot0)
	return {}
end

function ys.Battle.FreeBenchOxyState.GetDiveState(slot0)
	return slot0.OXY_STATE.FLOAT
end

function ys.Battle.FreeBenchOxyState.GetBubbleFlag(slot0)
	return true
end

function ys.Battle.FreeBenchOxyState.DoUpdateOxy(slot0, slot1)
	slot1:OxyRecover(true)
end

function ys.Battle.FreeBenchOxyState.IsVisible(slot0)
	return false
end

function ys.Battle.FreeBenchOxyState.GetBarVisible(slot0)
	return true
end

function ys.Battle.FreeBenchOxyState.RunMode(slot0)
	return true
end

return
