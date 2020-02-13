ys = ys or {}
slot1 = ys.Battle.BattleConfig
slot2 = ys.Battle.BattleTargetChoise
slot3 = ys.Battle.BattleUnitEvent
ys.Battle.BattelUAVUnit = class("BattelUAVUnit", ys.Battle.BattleAircraftUnit)
ys.Battle.BattelUAVUnit.__name = "BattelUAVUnit"
ys.Battle.BattelUAVUnit.MOVE_STATE = "MOVE_STATE"
ys.Battle.BattelUAVUnit.HOVER_STATE = "HOVER_STATE"

function ys.Battle.BattelUAVUnit.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1)

	slot0._dir = slot1.Battle.BattleConst.UnitDir.LEFT
	slot0._type = slot1.Battle.BattleConst.UnitType.UAV_UNIT
end

function ys.Battle.BattelUAVUnit.Update(slot0, slot1)
	slot0:updatePatrol(slot1)
end

function ys.Battle.BattelUAVUnit.SetTemplate(slot0, slot1)
	slot0.super.SetTemplate(slot0, slot1)

	slot0._centerPos = BuildVector3(slot4) + Vector3(slot1.funnel_behavior.offsetX * slot0:GetIFF(), 0, slot1.funnel_behavior.offsetZ)
	slot0._range = slot1.funnel_behavior.hover_range
end

function ys.Battle.BattelUAVUnit.changePartolState(slot0, slot1)
	if slot1 == slot0.MOVE_STATE then
		slot0:changeToMoveState()
	elseif slot1 == slot0.HOVER_STATE then
		slot0:changeToHoverState()
	end

	slot0._portalState = slot1
end

function ys.Battle.BattelUAVUnit.AddCreateTimer(slot0, slot1, slot2)
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

function ys.Battle.BattelUAVUnit._updateCreate(slot0)
	slot0:UpdateSpeed()

	slot0._pos = slot0._pos + slot0._speed
end

function ys.Battle.BattelUAVUnit.changeToMoveState(slot0)
	slot0._cruiseLimit = slot0._centerPos.x
	slot0.updatePatrol = slot0._updateMove
end

function ys.Battle.BattelUAVUnit._updateMove(slot0, slot1)
	slot0:UpdateSpeed()

	slot0._pos = slot0._pos + slot0._speed

	if slot0._IFF == slot0.FRIENDLY_CODE then
		if slot0._cruiseLimit < slot0._pos.x then
			slot0:changePartolState(slot1.HOVER_STATE)
		end
	elseif slot0._IFF == slot0.FOE_CODE and slot0._pos.x < slot0._cruiseLimit then
		slot0:changePartolState(slot1.HOVER_STATE)
	end
end

function ys.Battle.BattelUAVUnit.changeToHoverState(slot0)
	slot0._hoverStartTime = pg.TimeMgr.GetInstance():GetCombatTime()
	slot0.updatePatrol = slot0._updateHover
end

function ys.Battle.BattelUAVUnit._updateHover(slot0, slot1)
	slot0._pos = Vector3(math.sin(slot2) * slot0._range, 15, math.cos(slot2) * slot0._range):Add(slot0._centerPos)
end

function ys.Battle.BattelUAVUnit.GetSize(slot0)
	if slot0._portalState == slot0.HOVER_STATE then
		if math.cos(slot1) > 0 and slot2 < 0.2 then
			slot2 = 0.2
		elseif slot2 <= 0 and slot2 > -0.2 then
			slot2 = -0.2
		end

		return slot2
	else
		slot0.super.GetSize(slot0)
	end
end

return
