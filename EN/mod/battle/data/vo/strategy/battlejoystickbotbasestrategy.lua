ys = ys or {}
ys.Battle.BattleJoyStickBotBaseStrategy = class("BattleJoyStickBotBaseStrategy")
ys.Battle.BattleJoyStickBotBaseStrategy.__name = "BattleJoyStickBotBaseStrategy"

function ys.Battle.BattleJoyStickBotBaseStrategy.Ctor(slot0, slot1)
	slot0._hrz = 0
	slot0._vtc = 0
	slot0._fleetVO = slot1
	slot0._motionVO = slot1:GetMotion()
end

function ys.Battle.BattleJoyStickBotBaseStrategy.GetStrategyType(slot0)
	return nil
end

function ys.Battle.BattleJoyStickBotBaseStrategy.SetBoardBound(slot0, slot1, slot2, slot3, slot4)
	slot0._upperBound = slot1
	slot0._lowerBound = slot2
	slot0._leftBound = slot3
	slot0._rightBound = slot4
	slot0._totalWidth = slot4 - slot3
	slot0._totalHeight = slot1 - slot2
end

function ys.Battle.BattleJoyStickBotBaseStrategy.Input(slot0, slot1, slot2)
	slot0._foeShipList = slot1
	slot0._foeAircraftList = slot2
end

function ys.Battle.BattleJoyStickBotBaseStrategy.Output(slot0)
	slot0:analysis()

	return slot0._hrz, slot0._vtc
end

function ys.Battle.BattleJoyStickBotBaseStrategy.Dispose(slot0)
	slot0._foeShipList = nil
	slot0._foeAircraftList = nil
	slot0._motionVO = nil
end

function ys.Battle.BattleJoyStickBotBaseStrategy.analysis(slot0)
	return
end

function ys.Battle.BattleJoyStickBotBaseStrategy.getDirection(slot0, slot1)
	return slot1 - slot0.normalized.x, slot1 - slot0.normalized.z
end

return
