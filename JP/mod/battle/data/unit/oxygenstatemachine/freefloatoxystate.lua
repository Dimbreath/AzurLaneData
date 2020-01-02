ys = ys or {}
slot1 = ys.Battle.BattleConst
ys.Battle.FreeFloatOxyState = class("FreeFloatOxyState", ys.Battle.IOxyState)
ys.Battle.FreeFloatOxyState.__name = "FreeFloatOxyState"

function ys.Battle.FreeFloatOxyState.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function ys.Battle.FreeFloatOxyState.GetWeaponUseableList(slot0)
	return {
		slot0.OXY_STATE.DIVE,
		slot0.OXY_STATE.FLOAT
	}
end

function ys.Battle.FreeFloatOxyState.GetDiveState(slot0)
	return slot0.OXY_STATE.FLOAT
end

function ys.Battle.FreeFloatOxyState.GetBubbleFlag(slot0)
	return false
end

function ys.Battle.FreeFloatOxyState.DoUpdateOxy(slot0, slot1)
	slot1:OxyRecover()
end

function ys.Battle.FreeFloatOxyState.IsVisible(slot0)
	return true
end

function ys.Battle.FreeFloatOxyState.GetBarVisible(slot0)
	return true
end

function ys.Battle.FreeFloatOxyState.RunMode(slot0)
	return true
end

return
