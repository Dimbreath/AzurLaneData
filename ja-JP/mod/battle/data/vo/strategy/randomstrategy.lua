ys = ys or {}
slot1 = ys.Battle.BattleFormulas
slot2 = ys.Battle.BattleConfig
ys.Battle.RandomStrategy = class("RandomStrategy", ys.Battle.BattleJoyStickBotBaseStrategy)
ys.Battle.RandomStrategy.__name = "RandomStrategy"
ys.Battle.RandomStrategy.STOP_DURATION_MAX = 20
ys.Battle.RandomStrategy.STOP_DURATION_MIN = 10
ys.Battle.RandomStrategy.MOVE_DURATION_MAX = 60
ys.Battle.RandomStrategy.MOVE_DURATION_MIN = 20

function ys.Battle.RandomStrategy.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1)

	slot0._stopCount = 0
	slot0._moveCount = 0
	slot0._speed = Vector3.zero
	slot0._speedCross = Vector3.zero
end

function ys.Battle.RandomStrategy.GetStrategyType(slot0)
	return slot0.Battle.BattleJoyStickAutoBot.RANDOM
end

function ys.Battle.RandomStrategy.Input(slot0, slot1, slot2)
	slot0.super.Input(slot0, slot1, slot2)
	slot0:shiftTick(0, 10)
end

slot4 = Vector3.up

function ys.Battle.RandomStrategy._moveTick(slot0)
	if slot0._moveCount <= 0 then
		slot0:shiftTick(-1)
	else
		slot0._moveCount = slot0._moveCount - 1
		slot0._speedCross = slot0._speedCross:Copy(slot0):Cross2(slot0._speed):Mul(slot0._crossAcc / slot0._speed:Magnitude())
		slot0._speed = slot0._speed:Add(slot0._speedCross)
		slot0._hrz = slot0._speed.x
		slot0._vtc = slot0._speed.z
	end
end

function ys.Battle.RandomStrategy._stopTick(slot0)
	if slot0._stopCount <= 0 then
		slot0:shiftTick(0, 10)
	else
		slot0._stopCount = slot0._stopCount - 1
	end
end

function ys.Battle.RandomStrategy.shiftTick(slot0, slot1, slot2)
	slot0._stopWeight = slot1 or slot0._stopWeight
	slot0._moveWeight = slot2 or slot0._moveWeight

	if math.random(slot0._stopWeight, slot0._moveWeight) >= 0 then
		slot0._moveWeight = slot0._moveWeight - 1
		slot0._moveCount = math.random(slot0.MOVE_DURATION_MIN, slot0.MOVE_DURATION_MAX)
		slot0._targetPoint = slot0:generateTargetPoint()
		slot0._speed.x, slot0._speed.z = slot0.getDirection(slot4, slot0._targetPoint)
		slot0._crossAcc = math.random(-100, 100) / 10000
		slot0.analysis = slot0._moveTick
	else
		slot0._stopCount = math.random(slot0.STOP_DURATION_MIN, slot0.STOP_DURATION_MAX)
		slot0.analysis = slot0._stopTick
		slot0._hrz = 0
		slot0._vtc = 0
	end
end

function ys.Battle.RandomStrategy.generateTargetPoint(slot0)
	slot2 = slot0._fleetVO:GetLeaderPersonality().front_rate
	slot3 = slot0._fleetVO.GetLeaderPersonality().rear_rate

	if slot0._fleetVO:GetIFF() == slot0.FRIENDLY_CODE then
		slot2 = 1 - slot2
		slot3 = 1 - slot3
	end

	slot8 = nil

	return Vector3(math.random(slot5, slot4), 0, math.random(slot7, slot6))
end

return
