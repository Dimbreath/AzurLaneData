ys = ys or {}
slot1 = ys.Battle.BattleConst
ys.Battle.DeepMineOxyState = class("DeepMineOxyState", ys.Battle.IOxyState)
ys.Battle.DeepMineOxyState.__name = "DeepMineOxyState"

ys.Battle.DeepMineOxyState.Ctor = function (slot0)
	slot0.super.Ctor(slot0)
end

ys.Battle.DeepMineOxyState.GetWeaponUseableList = function (slot0)
	return {
		slot0.OXY_STATE.DIVE
	}
end

ys.Battle.DeepMineOxyState.GetDiveState = function (slot0)
	return slot0.OXY_STATE.DIVE
end

ys.Battle.DeepMineOxyState.GetBubbleFlag = function (slot0)
	return false
end

ys.Battle.DeepMineOxyState.IsVisible = function (slot0)
	return false
end

ys.Battle.DeepMineOxyState.GetBarVisible = function (slot0)
	return true
end

ys.Battle.DeepMineOxyState.RunMode = function (slot0)
	return false
end

return
