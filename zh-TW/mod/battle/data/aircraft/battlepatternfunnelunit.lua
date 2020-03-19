ys = ys or {}
slot1 = ys.Battle.BattleConfig
slot2 = ys.Battle.BattleTargetChoise
slot3 = ys.Battle.BattleDataFunction
slot4 = ys.Battle.BattleUnitEvent
ys.Battle.BattlePatternFunnelUnit = class("BattlePatternFunnelUnit", ys.Battle.BattleAircraftUnit)
ys.Battle.BattlePatternFunnelUnit.__name = "BattlePatternFunnelUnit"
ys.Battle.BattlePatternFunnelUnit.STOP_STATE = "STOP_STATE"
ys.Battle.BattlePatternFunnelUnit.MOVE_STATE = "MOVE_STATE"
ys.Battle.BattlePatternFunnelUnit.CRASH_STATE = "CRASH_STATE"

function ys.Battle.BattlePatternFunnelUnit.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1)

	slot0._untDir = slot1.Battle.BattleConst.UnitDir.LEFT
	slot0._type = slot1.Battle.BattleConst.UnitType.FUNNEL_UNIT
	slot0._move = slot1.Battle.MoveComponent.New()
end

function ys.Battle.BattlePatternFunnelUnit.Update(slot0, slot1)
	slot0:updatePatrol(slot1)
	slot0:UpdateWeapon()
	slot0:updatePosition()
end

function ys.Battle.BattlePatternFunnelUnit.OnMotherDead(slot0)
	slot0:onDead()
end

function ys.Battle.BattlePatternFunnelUnit.updateExist(slot0)
	if not slot0._existStartTime then
		return
	end

	if slot0._existStartTime + slot0._existDuration < pg.TimeMgr.GetInstance():GetCombatTime() then
		slot0:changePartolState(slot0.CRASH_STATE)
	end
end

function ys.Battle.BattlePatternFunnelUnit.UpdateWeapon(slot0)
	for slot4, slot5 in ipairs(slot0:GetWeapon()) do
		slot5:Update()
	end
end

function ys.Battle.BattlePatternFunnelUnit.SetMotherUnit(slot0, slot1)
	slot0.super.SetMotherUnit(slot0, slot1)

	slot0._upperBound, slot0._lowerBound, slot0._leftBound, slot0._rightBound = slot1.Battle.BattleDataProxy.GetInstance():GetFleetBoundByIFF(slot2)
end

function ys.Battle.BattlePatternFunnelUnit.SetTemplate(slot0, slot1)
	slot0.super.SetTemplate(slot0, slot1)

	slot0._existDuration = slot1.funnel_behavior.exist
end

function ys.Battle.BattlePatternFunnelUnit.changePartolState(slot0, slot1)
	if slot1 == slot0.MOVE_STATE then
		slot0:changeToMoveState()
	end

	slot0._portalState = slot1
end

function ys.Battle.BattlePatternFunnelUnit.AddCreateTimer(slot0, slot1, slot2)
	slot0._currentState = slot0.STATE_CREATE
	slot0._speedDir = slot1
	slot0._velocity = slot0.Battle.BattleFormulas.ConvertAircraftSpeed(30)
	slot0.updatePatrol = slot0._updateCreate
	slot0._createTimer = pg.TimeMgr.GetInstance():AddBattleTimer("AddCreateTimer", 0, 0.5, function ()
		slot0._existStartTime = pg.TimeMgr.GetInstance():GetCombatTime()
		slot0._velocity = pg.TimeMgr.GetInstance().GetCombatTime().Battle.BattleFormulas.ConvertAircraftSpeed(slot0._tmpData.speed)

		slot0:changePartolState(slot0._tmpData.speed.MOVE_STATE)
		pg.TimeMgr.GetInstance():RemoveBattleTimer(slot0._createTimer)

		pg.TimeMgr.GetInstance().RemoveBattleTimer._createTimer = nil
	end)
end

function ys.Battle.BattlePatternFunnelUnit.updatePosition(slot0)
	slot0._pos = slot0._pos + slot0._speed
end

function ys.Battle.BattlePatternFunnelUnit._updateCreate(slot0)
	slot0:UpdateSpeed()
	slot0:updatePosition()
end

function ys.Battle.BattlePatternFunnelUnit.changeToMoveState(slot0)
	slot0._currentState = slot0.MOVE_STATE

	slot0._move:ImmuneMaxAreaLimit(true)
	slot0._move:CancelFormationCtrl()

	slot0._autoPilotAI = slot0._tmpData.funnel_behavior.AI.Battle.AutoPilot.New(slot0, slot1)

	slot0._autoPilotAI:SetHiveUnit(slot0._motherUnit)

	slot0.updatePatrol = slot0._updateMove
end

function ys.Battle.BattlePatternFunnelUnit._updateMove(slot0, slot1)
	slot0._move:Update()
	slot0._speed:Copy(slot0._move:GetSpeed())
	slot0._speed:Mul(slot0._velocity * slot0:GetSpeedRatio())
	slot0:updatePosition()
end

return
