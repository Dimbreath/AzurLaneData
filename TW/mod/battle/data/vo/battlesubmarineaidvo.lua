ys = ys or {}
ys.Battle.BattleSubmarineAidVO = class("BattleSubmarineAidVO", ys.Battle.BattlePlayerWeaponVO)
ys.Battle.BattleSubmarineAidVO.__name = "BattleSubmarineAidVO"
ys.Battle.BattleSubmarineAidVO.GCD = ys.Battle.BattleConfig.AirAssistCFG.GCD

function ys.Battle.BattleSubmarineAidVO.Ctor(slot0)
	slot0.super.Ctor(slot0, slot0.GCD)
end

function ys.Battle.BattleSubmarineAidVO.SetUseable(slot0, slot1)
	slot0._useable = slot1
	slot0._current = (slot1 and 1) or 0
	slot0._max = 1

	slot0:DispatchOverLoadChange()
	slot0:DispatchCountChange()
end

function ys.Battle.BattleSubmarineAidVO.GetUseable(slot0)
	return slot0._useable
end

function ys.Battle.BattleSubmarineAidVO.IsOverLoad(slot0)
	return slot0._current < slot0._max or slot0._count < 1
end

function ys.Battle.BattleSubmarineAidVO.Cast(slot0)
	slot0._count = slot0._count - 1

	slot0:resetCurrent()
	slot0:DispatchOverLoadChange()
	slot0:DispatchCountChange()
end

return
