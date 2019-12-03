ys = ys or {}
ys.Battle.BattleJoyStickBotBaseStrategy = class("BattleJoyStickBotBaseStrategy")
ys.Battle.BattleJoyStickBotBaseStrategy.__name = "BattleJoyStickBotBaseStrategy"

ys.Battle.BattleJoyStickBotBaseStrategy.Ctor = function (slot0, slot1)
	slot0._hrz = 0
	slot0._vtc = 0
	slot0._fleetVO = slot1
	slot0._motionVO = slot1:GetMotion()
end

ys.Battle.BattleJoyStickBotBaseStrategy.GetStrategyType = function (slot0)
	return nil
end

ys.Battle.BattleJoyStickBotBaseStrategy.SetBoardBound = function (slot0, slot1, slot2, slot3, slot4)
	slot0._upperBound = slot1
	slot0._lowerBound = slot2
	slot0._leftBound = slot3
	slot0._rightBound = slot4
	slot0._totalWidth = slot4 - slot3
	slot0._totalHeight = slot1 - slot2
end

ys.Battle.BattleJoyStickBotBaseStrategy.Input = function (slot0, slot1, slot2)
	slot0._foeShipList = slot1
	slot0._foeAircraftList = slot2
end

ys.Battle.BattleJoyStickBotBaseStrategy.Output = function (slot0)
	slot0:analysis()

	return slot0._hrz, slot0._vtc
end

ys.Battle.BattleJoyStickBotBaseStrategy.Dispose = function (slot0)
	slot0._foeShipList = nil
	slot0._foeAircraftList = nil
	slot0._motionVO = nil
end

ys.Battle.BattleJoyStickBotBaseStrategy.analysis = function (slot0)
	return
end

ys.Battle.BattleJoyStickBotBaseStrategy.getDirection = function (slot0, slot1)
	return slot1 - slot0.normalized.x, slot1 - slot0.normalized.z
end

return
