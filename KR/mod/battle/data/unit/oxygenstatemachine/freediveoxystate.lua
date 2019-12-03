ys = ys or {}
slot1 = ys.Battle.BattleConst
ys.Battle.FreeDiveOxyState = class("FreeDiveOxyState", ys.Battle.IOxyState)
ys.Battle.FreeDiveOxyState.__name = "FreeDiveOxyState"

function ys.Battle.FreeDiveOxyState.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function ys.Battle.FreeDiveOxyState.GetWeaponUseableList(slot0)
	return {
		slot0.OXY_STATE.DIVE
	}
end

function ys.Battle.FreeDiveOxyState.GetDiveState(slot0)
	return slot0.OXY_STATE.DIVE
end

function ys.Battle.FreeDiveOxyState.GetBubbleFlag(slot0)
	return true
end

function ys.Battle.FreeDiveOxyState.DoUpdateOxy(slot0, slot1)
	slot1:OxyConsume()
end

function ys.Battle.FreeDiveOxyState.IsVisible(slot0)
	return false
end

function ys.Battle.FreeDiveOxyState.GetBarVisible(slot0)
	return true
end

function ys.Battle.FreeDiveOxyState.RunMode(slot0)
	return true
end

return
