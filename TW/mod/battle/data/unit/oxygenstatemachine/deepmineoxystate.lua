ys = ys or {}
slot1 = ys.Battle.BattleConst
ys.Battle.DeepMineOxyState = class("DeepMineOxyState", ys.Battle.IOxyState)
ys.Battle.DeepMineOxyState.__name = "DeepMineOxyState"

function ys.Battle.DeepMineOxyState.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function ys.Battle.DeepMineOxyState.GetWeaponUseableList(slot0)
	return {
		slot0.OXY_STATE.DIVE
	}
end

function ys.Battle.DeepMineOxyState.GetDiveState(slot0)
	return slot0.OXY_STATE.DIVE
end

function ys.Battle.DeepMineOxyState.GetBubbleFlag(slot0)
	return false
end

function ys.Battle.DeepMineOxyState.IsVisible(slot0)
	return false
end

function ys.Battle.DeepMineOxyState.GetBarVisible(slot0)
	return true
end

function ys.Battle.DeepMineOxyState.RunMode(slot0)
	return false
end

return
