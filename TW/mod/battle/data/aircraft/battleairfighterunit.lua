ys = ys or {}
slot1 = ys.Battle.BattleConfig
slot2 = ys.Battle.BattleUnitEvent
ys.Battle.BattleAirFighterUnit = class("BattleAirFighterUnit", ys.Battle.BattleAircraftUnit)
ys.Battle.BattleAirFighterUnit.__name = "BattleAirFighterUnit"
ys.Battle.BattleAirFighterUnit.AIRFIGHTER_ENTER_POINT = Vector3(Screen.width * -0.5, Screen.height * 0.5, 15)
ys.Battle.BattleAirFighterUnit.SPEED_FLY = Vector3(3, 0, 0)
ys.Battle.BattleAirFighterUnit.BACK_X = 100
ys.Battle.BattleAirFighterUnit.DOWN_X = 30
ys.Battle.BattleAirFighterUnit.ATTACK_X = -23
ys.Battle.BattleAirFighterUnit.UP_X = -70
ys.Battle.BattleAirFighterUnit.FREE_X = -75
ys.Battle.BattleAirFighterUnit.HEIGHT = ys.Battle.BattleConfig.AirFighterHeight
ys.Battle.BattleAirFighterUnit.STRIKE_STATE_FLY = 0
ys.Battle.BattleAirFighterUnit.STRIKE_STATE_BACK = 1
ys.Battle.BattleAirFighterUnit.STRIKE_STATE_DOWN = 2
ys.Battle.BattleAirFighterUnit.STRIKE_STATE_ATTACK = 3
ys.Battle.BattleAirFighterUnit.STRIKE_STATE_UP = 4
ys.Battle.BattleAirFighterUnit.STRIKE_STATE_FREE = 5

function ys.Battle.BattleAirFighterUnit.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1)

	slot0._dir = slot1.Battle.BattleConst.UnitDir.LEFT
	slot0._type = slot1.Battle.BattleConst.UnitType.AIRFIGHTER_UNIT

	slot0:changeState(slot0.STRIKE_STATE_FLY)
	slot0:calcYShakeMin()
	slot0:calcYShakeMax()

	slot0._speedDir = Vector3(1, 0, 0)
end

function ys.Battle.BattleAirFighterUnit.Update(slot0, slot1)
	slot0:UpdateSpeed()
	slot0:updateStrike()
end

function ys.Battle.BattleAirFighterUnit.UpdateWeapon(slot0)
	for slot4, slot5 in ipairs(slot0:GetWeapon()) do
		slot5:Update()
	end
end

function ys.Battle.BattleAirFighterUnit.CreateWeapon(slot0)
	slot1 = {}

	if type(slot0._weaponTemplateID) == "table" then
		for slot5, slot6 in ipairs(slot0._weaponTemplateID) do
			slot1[slot5] = slot0.Battle.BattleDataFunction.CreateAirFighterWeaponUnit(slot6, slot0, slot5)
		end
	else
		slot1[1] = slot0.Battle.BattleDataFunction.CreateAirFighterWeaponUnit(slot0._weaponTemplateID, slot0, 1)
	end

	return slot1
end

function ys.Battle.BattleAirFighterUnit.SetWeaponTemplateID(slot0, slot1)
	slot0._weaponTemplateID = slot1
end

function ys.Battle.BattleAirFighterUnit.SetTemplate(slot0, slot1)
	slot0:SetAttr(slot1)
	slot0.super.SetTemplate(slot0, slot1)
end

function ys.Battle.BattleAirFighterUnit.SetAttr(slot0, slot1)
	slot0.Battle.BattleAttr.SetAirFighterAttr(slot0, slot1)
	slot0:SetIFF(-1)
end

function ys.Battle.BattleAirFighterUnit.UpdateSpeed(slot0)
	slot0._speed:Copy(slot0._speedDir)
	slot0._speed:Mul(slot0._velocity * slot0:GetSpeedRatio())
end

function ys.Battle.BattleAirFighterUnit.Free(slot0)
	slot0._undefeated = true

	slot0:LiveCallBack()

	slot0._aliveState = false
end

function ys.Battle.BattleAirFighterUnit.onDead(slot0)
	slot0._currentState = slot0.STATE_DESTORY

	slot0:DeadCallBack()

	slot0._aliveState = false
end

function ys.Battle.BattleAirFighterUnit.GetPosition(slot0)
	return slot0._viewPos
end

function ys.Battle.BattleAirFighterUnit.SetFormationIndex(slot0, slot1)
	slot0._formationIndex = slot1
	slot0._flyStateScale = 12 / (slot1 + 3) + 1

	slot0:DispatchStrikeStateChange()
end

function ys.Battle.BattleAirFighterUnit.GetFormationIndex(slot0)
	return slot0._formationIndex
end

function ys.Battle.BattleAirFighterUnit.SetFormationOffset(slot0, slot1)
	slot0._formationOffset = Vector3(slot1.x, slot1.y, slot1.z)
	slot0._formationOffsetOppo = Vector3(slot1.x * -1, slot1.y, slot1.z)
end

function ys.Battle.BattleAirFighterUnit.SetDeadCallBack(slot0, slot1)
	slot0._deadCallBack = slot1
end

function ys.Battle.BattleAirFighterUnit.DeadCallBack(slot0)
	slot0._deadCallBack()
end

function ys.Battle.BattleAirFighterUnit.SetLiveCallBack(slot0, slot1)
	slot0._liveCallBack = slot1
end

function ys.Battle.BattleAirFighterUnit.LiveCallBack(slot0)
	slot0._liveCallBack()
end

function ys.Battle.BattleAirFighterUnit.getYShake(slot0)
	slot1 = slot0._YShakeCurrent or 0
	slot0._YShakeDir = slot0._YShakeDir or 1

	if slot0._YShakeMax < slot1 + (0.04 * math.random() + 0.01) * slot0._YShakeDir then
		slot0._YShakeDir = -1

		slot0:calcYShakeMin()
	elseif slot1 < slot0._YShakeMin then
		slot0._YShakeDir = 1

		slot0:calcYShakeMax()
	end

	slot0._YShakeCurrent = slot1

	return slot1
end

function ys.Battle.BattleAirFighterUnit.calcYShakeMin(slot0)
	slot0._YShakeMin = -0.5 - math.random()
end

function ys.Battle.BattleAirFighterUnit.calcYShakeMax(slot0)
	slot0._YShakeMax = 0.5 + math.random()
end

function ys.Battle.BattleAirFighterUnit.DispatchStrikeStateChange(slot0)
	slot0:DispatchEvent(slot0.Event.New(slot1.AIR_STRIKE_STATE_CHANGE, {}))
end

function ys.Battle.BattleAirFighterUnit.GetStrikeState(slot0)
	return slot0._strikeState
end

function ys.Battle.BattleAirFighterUnit.GetSize(slot0)
	return slot0._scale
end

function ys.Battle.BattleAirFighterUnit.changeState(slot0, slot1)
	if slot0._strikeState == slot1 then
		return
	end

	slot0._strikeState = slot1

	if slot1 == slot0.STRIKE_STATE_FLY then
		slot0:changeToFlyState()

		slot0.updateStrike = slot0._updatePosFly
	elseif slot1 == slot0.STRIKE_STATE_BACK then
		slot0.updateStrike = slot0._updatePosBack

		slot0:changeToBackState()
	elseif slot1 == slot0.STRIKE_STATE_DOWN then
		slot0.updateStrike = slot0._updatePosDown

		slot0:changeToDownState()
	elseif slot1 == slot0.STRIKE_STATE_ATTACK then
		slot0.updateStrike = slot0._updatePosAttack

		slot0:changeToAttackState()
	elseif slot1 == slot0.STRIKE_STATE_UP then
		slot0.updateStrike = slot0._updatePosUp

		slot0:changeToUpState()
	elseif slot1 == slot0.STRIKE_STATE_FREE then
		slot0.updateStrike = slot0._updateFree
	end

	slot0:DispatchStrikeStateChange()
end

function ys.Battle.BattleAirFighterUnit.changeToFlyState(slot0)
	slot0._pos = slot0.Battle.BattleCameraUtil.GetInstance():GetS2WPoint(slot1.AIRFIGHTER_ENTER_POINT)
	slot0._viewPos = slot0._pos

	slot0.Battle.PlayBattleSFX("battle/plane")
end

function ys.Battle.BattleAirFighterUnit._updatePosFly(slot0)
	slot0._pos:Add(slot0.SPEED_FLY)

	slot0._viewPos = Vector3(slot0._formationOffset.x * slot0._flyStateScale, (slot0._formationOffset.z / 1.7 + slot0:getYShake()) * slot0._flyStateScale, 0).Add(slot1, slot0._pos)

	if slot0.BACK_X < slot0._pos.x then
		slot0:changeState(slot0.STRIKE_STATE_BACK)
	end
end

function ys.Battle.BattleAirFighterUnit.changeToBackState(slot0)
	slot0._pos = Vector3(slot0._pos.x, 15, (not slot0.Battle.BattleDataProxy.GetInstance():GetFleetByIFF(slot1.FRIENDLY_CODE):GetMotion() or slot2:GetPos().z) and 45)
end

function ys.Battle.BattleAirFighterUnit._updatePosBack(slot0)
	slot0._pos:Sub(slot0._speed)
	slot0._viewPos:Copy(slot0._pos)
	slot0._viewPos:Sub(slot0._formationOffset)

	if slot0._pos.x < slot0.DOWN_X then
		slot0:changeState(slot0.STRIKE_STATE_DOWN)
	end
end

function ys.Battle.BattleAirFighterUnit.changeToDownState(slot0)
	slot0._ySpeed = 0.5

	slot0:SetVisitable()
end

function ys.Battle.BattleAirFighterUnit._updatePosDown(slot0)
	slot0._pos:Sub(slot0._speed)

	slot0._pos.y = math.max(slot0.HEIGHT, slot0._pos.y - slot0._ySpeed)
	slot0._viewPos = slot0._pos + slot0._formationOffsetOppo
	slot0._ySpeed = math.max(0.02, slot0._ySpeed - 0.005)

	if slot0._pos.x < slot0.ATTACK_X then
		slot0:changeState(slot0.STRIKE_STATE_ATTACK)
	end
end

function ys.Battle.BattleAirFighterUnit.changeToAttackState(slot0)
	slot0.Battle.PlayBattleSFX("battle/air-atk")
end

function ys.Battle.BattleAirFighterUnit._updatePosAttack(slot0)
	slot0._pos:Sub(slot0._speed)

	slot0._pos.y = math.max(slot0.HEIGHT, slot0._pos.y - 0.04)
	slot0._formationOffsetOppo.y = slot0:getYShake()
	slot0._viewPos = slot0._pos + slot0._formationOffsetOppo

	slot0:UpdateWeapon()

	if slot0._pos.x < slot0.UP_X then
		slot0:changeState(slot0.STRIKE_STATE_UP)
	end
end

function ys.Battle.BattleAirFighterUnit.changeToUpState(slot0)
	slot0._ySpeed = 0.1
end

function ys.Battle.BattleAirFighterUnit._updatePosUp(slot0)
	slot0._pos:Sub(slot0._speed)

	slot0._pos.y = slot0._pos.y + slot0._ySpeed
	slot0._ySpeed = math.min(0.7, slot0._ySpeed + 0.02)
	slot0._viewPos = slot0._pos + slot0._formationOffsetOppo

	if slot0._pos.x < slot0.FREE_X then
		slot0:changeState(slot0.STRIKE_STATE_FREE)
	end
end

function ys.Battle.BattleAirFighterUnit._updateFree(slot0)
	slot0:Free()
end

return
