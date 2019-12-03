ys = ys or {}
slot1 = ys.Battle.BattleConst
ys.Battle.FreeDiveOxyState = class("FreeDiveOxyState", ys.Battle.IOxyState)
ys.Battle.FreeDiveOxyState.__name = "FreeDiveOxyState"

ys.Battle.FreeDiveOxyState.Ctor = function (slot0)
	slot0.super.Ctor(slot0)
end

ys.Battle.FreeDiveOxyState.GetWeaponUseableList = function (slot0)
	return {
		slot0.OXY_STATE.DIVE
	}
end

ys.Battle.FreeDiveOxyState.GetDiveState = function (slot0)
	return slot0.OXY_STATE.DIVE
end

ys.Battle.FreeDiveOxyState.GetBubbleFlag = function (slot0)
	return true
end

ys.Battle.FreeDiveOxyState.DoUpdateOxy = function (slot0, slot1)
	slot1:OxyConsume()
end

ys.Battle.FreeDiveOxyState.IsVisible = function (slot0)
	return false
end

ys.Battle.FreeDiveOxyState.GetBarVisible = function (slot0)
	return true
end

ys.Battle.FreeDiveOxyState.RunMode = function (slot0)
	return true
end

return
