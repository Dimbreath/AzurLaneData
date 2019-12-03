ys = ys or {}
slot1 = ys.Battle.BattleConfig
slot2 = ys.Battle.BattleTargetChoise
slot3 = ys.Battle.BattleUnitEvent
ys.Battle.BattleFunnelUnit = class("BattleFunnelUnit", ys.Battle.BattleAircraftUnit)
ys.Battle.BattleFunnelUnit.__name = "BattleFunnelUnit"
ys.Battle.BattleFunnelUnit.STOP_STATE = "STOP_STATE"
ys.Battle.BattleFunnelUnit.MOVE_STATE = "MOVE_STATE"
ys.Battle.BattleFunnelUnit.CRASH_STATE = "CRASH_STATE"

ys.Battle.BattleFunnelUnit.Ctor = function (slot0, slot1)
	slot0.super.Ctor(slot0, slot1)

	slot0._dir = slot1.Battle.BattleConst.UnitDir.LEFT
	slot0._type = slot1.Battle.BattleConst.UnitType.FUNNEL_UNIT
end

ys.Battle.BattleFunnelUnit.Update = function (slot0, slot1)
	slot0:updateExist()
	slot0:updatePatrol(slot1)
end

ys.Battle.BattleFunnelUnit.updateExist = function (slot0)
	if not slot0._existStartTime then
		return
	end

	if slot0._existStartTime + slot0._existDuration < pg.TimeMgr.GetInstance():GetCombatTime() then
		slot0:changePartolState(slot0.CRASH_STATE)
	end
end

ys.Battle.BattleFunnelUnit.UpdateWeapon = function (slot0)
	for slot4, slot5 in ipairs(slot0:GetWeapon()) do
		slot5:Update()
	end
end

ys.Battle.BattleFunnelUnit.SetMotherUnit = function (slot0, slot1)
	slot0.super.SetMotherUnit(slot0, slot1)

	slot0._upperBound, slot0._lowerBound, slot0._leftBound, slot0._rightBound = slot1.Battle.BattleDataProxy.GetInstance():GetFleetBoundByIFF(slot2)
end

ys.Battle.BattleFunnelUnit.SetTemplate = function (slot0, slot1)
	slot0.super.SetTemplate(slot0, slot1)

	slot0._existDuration = slot1.funnel_behavior.exist
	slot0._stayDuration = slot1.funnel_behavior.stay
	slot0._frontOffset = slot1.funnel_behavior.front or 0
	slot0._rearOffset = slot1.funnel_behavior.rear or 0

	if slot0:GetWeapon()[1] then
		slot0.changeToStopState = slot0.stopState
	else
		slot0.changeToStopState = slot0.nonWeaponStopState
	end

	if slot0:GetIFF() == slot1.FRIENDLY_CODE then
		slot0._leftBound = slot0._leftBound + slot0._rearOffset
		slot0._rightBound = slot0._rightBound + slot0._frontOffset
	else
		slot0._leftBound = slot0._leftBound - slot0._frontOffset
		slot0._rightBound = slot0._rightBound - slot0._rearOffset
	end
end

ys.Battle.BattleFunnelUnit.changePartolState = function (slot0, slot1)
	if slot1 == slot0.MOVE_STATE then
		slot0:changeToMoveState()
	elseif slot1 == slot0.STOP_STATE then
		slot0:changeToStopState()
	elseif slot1 == slot0.CRASH_STATE then
		slot0:changeToCrashState()
	end

	slot0._portalState = slot1
end

ys.Battle.BattleFunnelUnit.AddCreateTimer = function (slot0, slot1, slot2)
	slot0._currentState = slot0.STATE_CREATE
	slot0._speedDir = slot1
	slot0._velocity = slot0.Battle.BattleFormulas.ConvertAircraftSpeed(20)
	slot0.updatePatrol = slot0._updateCreate
	slot0._createTimer = pg.TimeMgr.GetInstance():AddBattleTimer("AddCreateTimer", 0, slot2 or 1.5, function ()
		slot0._existStartTime = pg.TimeMgr.GetInstance():GetCombatTime()
		slot0._velocity = pg.TimeMgr.GetInstance().GetCombatTime().Battle.BattleFormulas.ConvertAircraftSpeed(slot0._tmpData.speed)

		slot0:changePartolState(slot0._tmpData.speed.MOVE_STATE)
		pg.TimeMgr.GetInstance():RemoveBattleTimer(slot0._createTimer)

		pg.TimeMgr.GetInstance().RemoveBattleTimer._createTimer = nil
	end)
end

ys.Battle.BattleFunnelUnit.updatePosition = function (slot0)
	slot0._pos = slot0._pos + slot0._speed
end

ys.Battle.BattleFunnelUnit._updateCreate = function (slot0)
	slot0:UpdateSpeed()
	slot0:updatePosition()
end

ys.Battle.BattleFunnelUnit.nonWeaponStopState = function (slot0)
	slot0._stopStartTime = pg.TimeMgr.GetInstance():GetCombatTime()
	slot0.updatePatrol = slot0._updateStop
end

ys.Battle.BattleFunnelUnit.stopState = function (slot0)
	slot0._stopStartTime = pg.TimeMgr.GetInstance():GetCombatTime()

	slot0:GetWeapon()[1]:updateMovementInfo()

	if slot0:TargetHarmNearest()[1] == nil then
		slot0:changePartolState(slot1.CRASH_STATE)
	elseif slot2:IsOutOfFireArea(slot1) then
		slot0:changePartolState(slot1.MOVE_STATE)
	else
		slot0.updatePatrol = slot0._updateStop
	end
end

ys.Battle.BattleFunnelUnit._updateStop = function (slot0, slot1)
	if slot0:getStopDuration() < pg.TimeMgr.GetInstance():GetCombatTime() then
		slot0:changePartolState(slot0.MOVE_STATE)
	else
		slot0:UpdateWeapon(slot0.MOVE_STATE)
	end
end

ys.Battle.BattleFunnelUnit.getStopDuration = function (slot0)
	return slot0._stopStartTime + slot0._stayDuration
end

ys.Battle.BattleFunnelUnit.changeToMoveState = function (slot0)
	slot0:generateMoveTargetPoint()

	slot0.updatePatrol = slot0._updateMove
end

ys.Battle.BattleFunnelUnit._updateMove = function (slot0, slot1)
	slot0._speed = slot0._direction * slot0:GetSpeedRatio()

	slot0:updatePosition()

	if Vector3.Distance(slot0:GetPosition(), slot0._moveTargetPosition) < 1 then
		slot0:changePartolState(slot0.STOP_STATE)
	end
end

ys.Battle.BattleFunnelUnit.generateMoveTargetPoint = function (slot0)
	slot0._moveTargetPosition = Vector3(slot1, slot0:GetPosition().y, slot2)
	slot0._moveTargetPosition - slot0._pos.normalized.y = 0

	slot0._moveTargetPosition - slot0._pos.normalized:Mul(slot0._velocity)

	slot0._direction = slot0._moveTargetPosition - slot0._pos.normalized
end

ys.Battle.BattleFunnelUnit.changeToCrashState = function (slot0)
	slot0._existStartTime = nil

	if slot0:GetIFF() == slot0.FOE_CODE then
		slot0._speedDir = Vector3.left
	elseif slot0:GetIFF() == slot0.FRIENDLY_CODE then
		slot0._speedDir = Vector3.right
	end

	slot0.updatePatrol = slot0._updateCrash
end

ys.Battle.BattleFunnelUnit._updateCrash = function (slot0)
	slot0:UpdateSpeed()
	slot0:updatePosition()
end

return
