ys = ys or {}
ys.Battle.BattleSubmarineAidVO = class("BattleSubmarineAidVO", ys.Battle.BattlePlayerWeaponVO)
ys.Battle.BattleSubmarineAidVO.__name = "BattleSubmarineAidVO"
ys.Battle.BattleSubmarineAidVO.GCD = ys.Battle.BattleConfig.AirAssistCFG.GCD

ys.Battle.BattleSubmarineAidVO.Ctor = function (slot0)
	slot0.super.Ctor(slot0, slot0.GCD)
end

ys.Battle.BattleSubmarineAidVO.SetUseable = function (slot0, slot1)
	slot0._useable = slot1
	slot0._current = (slot1 and 1) or 0
	slot0._max = 1

	slot0:DispatchOverLoadChange()
	slot0:DispatchCountChange()
end

ys.Battle.BattleSubmarineAidVO.GetUseable = function (slot0)
	return slot0._useable
end

ys.Battle.BattleSubmarineAidVO.IsOverLoad = function (slot0)
	return slot0._current < slot0._max or slot0._count < 1
end

ys.Battle.BattleSubmarineAidVO.Cast = function (slot0)
	slot0._count = slot0._count - 1

	slot0:resetCurrent()
	slot0:DispatchOverLoadChange()
	slot0:DispatchCountChange()
end

return
