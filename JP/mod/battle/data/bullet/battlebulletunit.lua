ys = ys or {}
slot1 = ys.Battle.BattleBulletEvent
slot2 = ys.Battle.BattleFormulas
slot3 = Vector3.up
slot4 = ys.Battle.BattleVariable
slot6 = ys.Battle.BattleTargetChoise
ys.Battle.BattleBulletUnit = class("BattleBulletUnit")
ys.Battle.BattleBulletUnit.__name = "BattleBulletUnit"
ys.Battle.BattleBulletUnit.ACC_INTERVAL = ys.Battle.BattleConfig.calcInterval
ys.Battle.BattleBulletUnit.TRACKER_ANGLE = math.cos(math.deg2Rad * 10)

function slot8(slot0, slot1)
	slot2, slot3 = slot0:GetAcceleration(slot1)

	if slot2 == 0 and slot3 == 0 then
		return
	end

	if slot2 < 0 and slot0._speedLength + slot2 < 0 then
		slot0:reverseAcceleration()
	end

	slot0._speed:Set(slot0._speed.x + slot0._speedNormal.x * slot2 + slot0._speedCross.x * slot3, slot0._speed.y + slot0._speedNormal.y * slot2 + slot0._speedCross.y * slot3, slot0._speed.z + slot0._speedNormal.z * slot2 + slot0._speedCross.z * slot3)

	slot0._speedLength = slot0._speed:Magnitude()

	if slot0._speedLength ~= 0 then
		slot0._speedNormal:Copy(slot0._speed)
		slot0._speedNormal:Div(slot0._speedLength)
	end

	slot0._speedCross:Copy(slot0._speedNormal)
	slot0._speedCross:Cross2(slot0)
end

function slot9(slot0)
	if slot0:getTrackingTarget() == nil and slot0:TargetHarmNearest()[1] ~= nil and slot0:GetDistance(slot1) <= slot0._trackRange then
		slot0:setTrackingTarget(slot1)
	end

	if slot0:getTrackingTarget() == nil or slot1 == -1 then
		return
	elseif not slot1:IsAlive() then
		slot0:setTrackingTarget(-1)

		return
	elseif slot0._trackRange < slot0:GetDistance(slot1) then
		slot0:setTrackingTarget(-1)

		return
	end

	slot1:GetCLDCenterPosition() - slot0:GetPosition().SetNormalize(slot2)

	slot4 = Vector3.Dot(slot3, slot2)
	slot5, slot6 = nil
	slot9 = slot0:GetSpeedRatio()

	if slot1.GetCLDCenterPosition() - slot0.GetPosition().x * slot1.GetCLDCenterPosition() - slot0.GetPosition().z > 0 then
		slot5 = math.cos(slot0._negativeCosAngularSpeed * slot9)
		slot6 = math.sin(slot0._negativeSinAngularSpeed * slot9)
	else
		slot5 = math.cos(slot0._cosAngularSpeed * slot9)
		slot6 = math.sin(slot0._sinAngularSpeed * slot9)
	end

	if slot4 < slot1.TRACKER_ANGLE then
		slot0._speed:Set(slot0._speed.x * slot5 + slot0._speed.z * slot6, 0, slot0._speed.z * slot5 - slot0._speed.x * slot6)
	end
end

function slot10(slot0)
	slot5 = nil
	slot0._speed = (pg.Tool.FilterY(slot0:GetPosition()) - pg.Tool.FilterY(slot0._weapon:GetPosition()).magnitude <= 10 or pg.Tool.FilterY(slot0._weapon:GetPosition()) - pg.Tool.FilterY(slot0:GetPosition()).normalized + slot0._speed.normalized.normalized) and Vector3(-pg.Tool.FilterY(slot0._weapon.GetPosition()) - pg.Tool.FilterY(slot0.GetPosition()).normalized.z, 0, pg.Tool.FilterY(slot0._weapon.GetPosition()) - pg.Tool.FilterY(slot0.GetPosition()).normalized.x) + slot0._speed.normalized.normalized
end

function slot11(slot0)
	if slot0._gravity ~= 0 then
		slot0._verticalSpeed = slot0._verticalSpeed + slot0._gravity * slot0:GetSpeedRatio()
	end
end

function ys.Battle.BattleBulletUnit.Ctor(slot0, slot1, slot2)
	slot0.EventDispatcher.AttachEventDispatcher(slot0)

	slot0._battleProxy = slot0.Battle.BattleDataProxy.GetInstance()
	slot0._uniqueID = slot1
	slot0._speedExemptKey = "bullet_" .. slot1
	slot0._IFF = slot2
	slot0._collidedList = {}
	slot0._speed = Vector3.zero
	slot0._exist = true
	slot0._timeStamp = 0
	slot0._dmgEnhanceRate = 1
	slot0._frame = 0
	slot0._reachDestFlag = false
	slot0._verticalSpeed = 0
	slot0._damageList = {}
end

function ys.Battle.BattleBulletUnit.Update(slot0, slot1)
	slot2 = slot0:GetSpeedRatio()

	slot0:updateSpeed(slot1)
	slot0:updateBarrageTransform(slot1)
	slot0._position:Set(slot0._position.x + slot0._speed.x * slot2, slot0._position.y + slot0._speed.y * slot2, slot0._position.z + slot0._speed.z * slot2)

	if slot0._gravity == 0 then
		slot0._reachDestFlag = slot0._sqrRange < Vector3.SqrDistance(slot0._spawnPos, slot0._position)
	else
		slot0._position.y = slot0._position.y + slot0._verticalSpeed * slot2

		if slot0._fieldSwitchHeight ~= 0 and slot0._position.y <= slot0._fieldSwitchHeight then
			slot0._field = slot0.Battle.BattleConst.BulletField.SURFACE
		end

		slot0._reachDestFlag = slot0._position.y <= slot1.BombDetonateHeight
	end
end

function ys.Battle.BattleBulletUnit.ActiveCldBox(slot0)
	slot0._cldComponent:SetActive(true)
end

function ys.Battle.BattleBulletUnit.DeactiveCldBox(slot0)
	slot0._cldComponent:SetActive(false)
end

function ys.Battle.BattleBulletUnit.SetStartTimeStamp(slot0, slot1)
	slot0._timeStamp = slot1
end

function ys.Battle.BattleBulletUnit.Hit(slot0, slot1, slot2)
	slot0._collidedList[slot1] = true

	slot0:DispatchEvent(slot0.Event.New(slot1.HIT, {
		UID = slot1,
		type = slot2
	}))
end

function ys.Battle.BattleBulletUnit.Intercepted(slot0)
	slot0:DispatchEvent(slot0.Event.New(slot1.INTERCEPTED, {}))
end

function ys.Battle.BattleBulletUnit.Reflected(slot0)
	slot0._speed.x = -slot0._speed.x
end

function ys.Battle.BattleBulletUnit.SetTemplateData(slot0, slot1)
	slot0._tempData = setmetatable({}, {
		__index = slot1
	})

	slot0:SetModleID(slot1.modle_ID)

	slot0._velocity = slot1.velocity

	if slot0:GetTemplate().extra_param.velocity_offset then
		slot0._velocity = math.random(slot0._velocity - slot2.velocity_offset, slot0._velocity + slot2.velocity_offset)
	end

	if slot0._velocity == 0 then
		slot0._convertedVelocity = 0
	else
		slot0._convertedVelocity = slot0.ConvertBulletSpeed(slot0._velocity)
	end

	slot0._pierceCount = slot1.pierce_count

	slot0:FixRange()
	slot0:InitCldComponent()

	slot0._accTable = Clone(slot0._tempData.acceleration)

	table.sort(slot0._accTable, function (slot0, slot1)
		return slot0.t < slot1.t
	end)

	slot0._field = slot1.effect_type
	slot0._gravity = slot2.gravity or 0
	slot0._fieldSwitchHeight = slot2.effectSwitchHeight or 0

	slot0:SetDiverFilter()
end

function ys.Battle.BattleBulletUnit.GetModleID(slot0)
	return slot0._modleID
end

function ys.Battle.BattleBulletUnit.SetModleID(slot0, slot1)
	slot0._modleID = slot1
end

function ys.Battle.BattleBulletUnit.SetShiftInfo(slot0, slot1, slot2)
	slot0._offsetX = slot1
	slot0._offsetZ = slot2
end

function ys.Battle.BattleBulletUnit.SetRotateInfo(slot0, slot1, slot2, slot3)
	slot0._targetPos = slot1
	slot0._baseAngle = slot2
	slot0._barrageAngle = slot3

	if slot0._barrageAngle % 360 > 0 and slot4 < 180 then
		for slot8, slot9 in ipairs(slot0._accTable) do
			if slot9.flip then
				slot9.v = slot9.v * -1
			end
		end
	end
end

function ys.Battle.BattleBulletUnit.SetBarrageTransformTempate(slot0, slot1)
	if #slot1 > 0 then
		slot0._barrageTransData = slot1
	end
end

function ys.Battle.BattleBulletUnit.SetAttr(slot0, slot1)
	slot0.Battle.BattleAttr.SetAttr(slot0, slot1)
end

function ys.Battle.BattleBulletUnit.GetAttr(slot0)
	return slot0.Battle.BattleAttr.GetAttr(slot0)
end

function ys.Battle.BattleBulletUnit.SetDamageEnhance(slot0, slot1)
	slot0._dmgEnhanceRate = slot1
end

function ys.Battle.BattleBulletUnit.GetDamageEnhance(slot0)
	return slot0._dmgEnhanceRate
end

function ys.Battle.BattleBulletUnit.GetAttrByName(slot0, slot1)
	return slot0.Battle.BattleAttr.GetCurrent(slot0, slot1)
end

function ys.Battle.BattleBulletUnit.GetVerticalSpeed(slot0)
	return slot0._verticalSpeed
end

function ys.Battle.BattleBulletUnit.IsGravitate(slot0)
	return slot0._gravity ~= 0
end

function ys.Battle.BattleBulletUnit.SetBuffTrigger(slot0, slot1)
	slot0._host = slot1
	slot0._buffTriggerFun = {}
end

function ys.Battle.BattleBulletUnit.SetBuffFun(slot0, slot1, slot2)
	slot0._buffTriggerFun[slot1] or {}[#(slot0._buffTriggerFun[slot1] or ) + 1] = slot2
	slot0._buffTriggerFun[slot1] = slot0._buffTriggerFun[slot1] or 
end

function ys.Battle.BattleBulletUnit.BuffTrigger(slot0, slot1, slot2)
	if slot0._host and slot3:IsAlive() then
		slot0._host:TriggerBuff(slot1, slot2)

		if slot0._buffTriggerFun[slot1] then
			for slot8, slot9 in ipairs(slot4) do
				slot9(slot0._host, slot2)
			end
		end
	end
end

function ys.Battle.BattleBulletUnit.SetIsCld(slot0, slot1)
	slot0._needCld = slot1
end

function ys.Battle.BattleBulletUnit.GetIsCld(slot0)
	return slot0._needCld
end

function ys.Battle.BattleBulletUnit.AppendDamageUnit(slot0, slot1)
	slot0._damageList[#slot0._damageList + 1] = slot1
end

function ys.Battle.BattleBulletUnit.DamageUnitListWriteback(slot0)
	slot0._weapon:UpdateCombo(slot0._damageList)
end

function ys.Battle.BattleBulletUnit.HasAcceleration(slot0)
	return #slot0._accTable ~= 0
end

function ys.Battle.BattleBulletUnit.IsTracker(slot0)
	return slot0._accTable.tracker
end

function ys.Battle.BattleBulletUnit.IsOrbit(slot0)
	return slot0._accTable.orbit
end

function ys.Battle.BattleBulletUnit.GetAcceleration(slot0, slot1)
	slot0._lastAccTime = slot0._lastAccTime or slot0._timeStamp
	slot0._lastAccTime = slot0._lastAccTime + slot0.ACC_INTERVAL * math.modf((slot1 - slot0._lastAccTime) / slot0.ACC_INTERVAL)
	slot3 = slot1 - slot0._timeStamp
	slot4 = #slot0._accTable

	while slot4 > 0 do
		if slot3 + slot0.ACC_INTERVAL < slot0._accTable[slot4].t then
			slot4 = slot4 - 1
		else
			return slot5.u * slot2, slot5.v * slot2
		end
	end

	return 0, 0
end

function ys.Battle.BattleBulletUnit.reverseAcceleration(slot0)
	for slot4, slot5 in ipairs(slot0._accTable) do
		slot5.u = slot5.u * -1
	end
end

function ys.Battle.BattleBulletUnit.GetDistance(slot0, slot1)
	if slot0._frame ~= slot0._battleProxy.FrameIndex then
		slot0._distanceBackup = {}
		slot0._frame = slot2
	end

	if slot0._distanceBackup[slot1] == nil then
		slot0._distanceBackup[slot1] = Vector3.Distance(slot0:GetPosition(), slot1:GetPosition())

		slot1:backupDistance(slot0, Vector3.Distance(slot0.GetPosition(), slot1.GetPosition()))
	end

	return slot3
end

function ys.Battle.BattleBulletUnit.backupDistance(slot0, slot1, slot2)
	if slot0._frame ~= slot0._battleProxy.FrameIndex then
		slot0._distanceBackup = {}
		slot0._frame = slot3
	end

	slot0._distanceBackup[slot1] = slot2
end

function ys.Battle.BattleBulletUnit.getTrackingTarget(slot0)
	return slot0._tarckingTarget
end

function ys.Battle.BattleBulletUnit.setTrackingTarget(slot0, slot1)
	slot0._tarckingTarget = slot1
end

function ys.Battle.BattleBulletUnit.SetWeapon(slot0, slot1)
	slot0._weapon = slot1

	if slot1 then
		slot0._correctedDMG = slot0._weapon:GetCorrectedDMG()
	end
end

function ys.Battle.BattleBulletUnit.GetWeapon(slot0)
	return slot0._weapon
end

function ys.Battle.BattleBulletUnit.GetCorrectedDMG(slot0)
	return slot0._correctedDMG
end

function ys.Battle.BattleBulletUnit.OverrideCorrectedDMG(slot0, slot1)
	slot0._correctedDMG = slot0.WeaponDamagePreCorrection(slot0._weapon, slot1)
end

function ys.Battle.BattleBulletUnit.GetWeaponTempData(slot0)
	return slot0._weapon:GetTemplateData()
end

function ys.Battle.BattleBulletUnit.GetPosition(slot0)
	return slot0._position or Vector3.zero
end

function ys.Battle.BattleBulletUnit.SetSpawnPosition(slot0, slot1)
	slot0._spawnPos = slot1
	slot0._position = slot1:Clone()

	if slot0._gravity ~= 0 then
		if math.atan2(slot0._speed.x, slot0._speed.z) == 0 then
			slot0._verticalSpeed = 0
		else
			slot3 = Vector3(math.cos(slot2) * 60, math.sin(slot2) * 60)
			slot0._verticalSpeed = -0.5 * slot0._gravity * 60 / slot0._convertedVelocity
		end
	end
end

function ys.Battle.BattleBulletUnit.GetTemplate(slot0)
	return slot0._tempData
end

function ys.Battle.BattleBulletUnit.GetType(slot0)
	return slot0._tempData.type
end

function ys.Battle.BattleBulletUnit.GetOutBound(slot0)
	return slot0._tempData.out_bound == 0
end

function ys.Battle.BattleBulletUnit.GetUniqueID(slot0)
	return slot0._uniqueID
end

function ys.Battle.BattleBulletUnit.GetOffset(slot0)
	return slot0._offsetX, slot0._offsetZ, slot0._isOffsetPriority
end

function ys.Battle.BattleBulletUnit.GetRotateInfo(slot0)
	return slot0._targetPos, slot0._baseAngle, slot0._barrageAngle
end

function ys.Battle.BattleBulletUnit.IsOutRange(slot0)
	return slot0._reachDestFlag
end

function ys.Battle.BattleBulletUnit.SetYAngle(slot0, slot1)
	slot0._yAngle = slot1
end

function ys.Battle.BattleBulletUnit.SetOffsetPriority(slot0, slot1)
	slot0._isOffsetPriority = slot1 or false
end

function ys.Battle.BattleBulletUnit.GetOffsetPriority(slot0)
	return slot0._isOffsetPriority
end

function ys.Battle.BattleBulletUnit.GetYAngle(slot0)
	return slot0._yAngle
end

function ys.Battle.BattleBulletUnit.GetIFF(slot0)
	return slot0._IFF
end

function ys.Battle.BattleBulletUnit.GetHost(slot0)
	return slot0._host
end

function ys.Battle.BattleBulletUnit.GetPierceCount(slot0)
	return slot0._pierceCount
end

function ys.Battle.BattleBulletUnit.AppendAttachBuff(slot0, slot1)
	slot2 = Clone(slot0:GetTemplate().attach_buff)
	slot2[#slot2 + 1] = slot1
	slot0._attachBuffList = slot2
end

function ys.Battle.BattleBulletUnit.GetAttachBuff(slot0)
	return slot0._attachBuffList or slot0:GetTemplate().attach_buff or {}
end

function ys.Battle.BattleBulletUnit.GetEffectField(slot0)
	return slot0._field
end

function ys.Battle.BattleBulletUnit.GetPushPower(slot0)
	if slot0:GetTemplate().push_power == "" then
		return nil
	else
		return slot1
	end
end

function ys.Battle.BattleBulletUnit.SetDiverFilter(slot0, slot1)
	if slot1 == nil then
		slot0._diveFilter = slot0._tempData.extra_param.diveFilter or {
			2
		}
	else
		slot0._diveFilter = slot1
	end
end

function ys.Battle.BattleBulletUnit.GetDiveFilter(slot0)
	return slot0._diveFilter
end

function ys.Battle.BattleBulletUnit.GetVelocity(slot0)
	return slot0._velocity
end

function ys.Battle.BattleBulletUnit.GetConvertedVelocity(slot0)
	return slot0._convertedVelocity
end

function ys.Battle.BattleBulletUnit.GetSpeedExemptKey(slot0)
	return slot0._speedExemptKey
end

function ys.Battle.BattleBulletUnit.IsCollided(slot0, slot1)
	return slot0._collidedList[slot1]
end

function ys.Battle.BattleBulletUnit.GetExist(slot0)
	return slot0._exist
end

function ys.Battle.BattleBulletUnit.SetExist(slot0, slot1)
	slot0._exist = slot1
end

function ys.Battle.BattleBulletUnit.Dispose(slot0)
	slot0._dataProxy = nil

	slot0.EventDispatcher.DetachEventDispatcher(slot0)
end

function ys.Battle.BattleBulletUnit.InitCldComponent(slot0)
	slot1 = slot0:GetTemplate().cld_box
	slot3 = slot0:GetTemplate().cld_offset[1]

	if slot0:GetIFF() == slot0.Battle.BattleConst.FOE_CODE then
		slot3 = slot3 * -1
	end

	slot0._cldComponent = slot0.Battle.BattleCubeCldComponent.New(slot1[1], slot1[2], slot1[3], slot3, slot2[3])

	slot0._cldComponent:SetCldData({
		type = slot0.Battle.BattleConst.CldType.BULLET,
		IFF = slot0:GetIFF(),
		UID = slot0:GetUniqueID()
	})
end

function ys.Battle.BattleBulletUnit.ResetCldSurface(slot0)
	if slot0:GetDiveFilter() and #slot1 == 0 then
		slot0:GetCldData().Surface = slot0.Battle.BattleConst.OXY_STATE.DIVE
	else
		slot0:GetCldData().Surface = slot0.Battle.BattleConst.OXY_STATE.FLOAT
	end
end

function ys.Battle.BattleBulletUnit.GetBoxSize(slot0)
	return slot0._cldComponent:GetCldBoxSize()
end

function ys.Battle.BattleBulletUnit.GetCldBox(slot0)
	return slot0._cldComponent:GetCldBox(slot0:GetPosition())
end

function ys.Battle.BattleBulletUnit.GetCldData(slot0)
	return slot0._cldComponent:GetCldData()
end

function ys.Battle.BattleBulletUnit.GetSpeed(slot0)
	return slot0._speed
end

function ys.Battle.BattleBulletUnit.GetSpeedRatio(slot0)
	return slot0.GetSpeedRatio(slot0._speedExemptKey, slot0._IFF)
end

function ys.Battle.BattleBulletUnit.InitSpeed(slot0, slot1)
	if slot0._yAngle == nil then
		if slot0._targetPos ~= nil then
			slot0._yAngle = slot1 + slot0._barrageAngle
		else
			slot0._yAngle = slot0._baseAngle + slot0._barrageAngle
		end
	end

	slot0:calcSpeed()

	if slot0:HasAcceleration() then
		slot0._speedLength = slot0._speed:Magnitude()
		slot0._speedNormal = slot0._speed / slot0._speedLength
		slot0._speedCross = Vector3.Cross(slot0._speedNormal, slot0)
		slot0.updateSpeed = slot1
	elseif slot0:IsTracker() then
		slot0._trackRange = slot0._accTable.tracker.range
		slot0._cosAngularSpeed = math.deg2Rad * slot0._accTable.tracker.angular
		slot0._sinAngularSpeed = math.deg2Rad * slot0._accTable.tracker.angular
		slot0._negativeCosAngularSpeed = math.deg2Rad * slot0._accTable.tracker.angular * -1
		slot0._negativeSinAngularSpeed = math.deg2Rad * slot0._accTable.tracker.angular * -1
		slot0.updateSpeed = slot0._accTable.tracker
	else
		slot0.updateSpeed = slot3
	end
end

function ys.Battle.BattleBulletUnit.calcSpeed(slot0)
	slot0._speed = Vector3(slot1.ConvertBulletSpeed(slot0._velocity * (1 + slot0.Battle.BattleAttr.GetCurrent(slot0, "bulletSpeedRatio"))) * math.cos(slot3), 0, slot1.ConvertBulletSpeed(slot0._velocity * (1 + slot0.Battle.BattleAttr.GetCurrent(slot0, "bulletSpeedRatio"))) * math.sin(math.deg2Rad * slot0._yAngle))
end

function ys.Battle.BattleBulletUnit.updateBarrageTransform(slot0, slot1)
	if not slot0._barrageTransData or #slot0._barrageTransData == 0 then
		return
	end

	if slot0._barrageTransData[1].transStartDelay <= slot1 - slot0._timeStamp then
		if slot3.transAimAngle then
			slot0._yAngle = slot3.transAimAngle
		else
			slot0._yAngle = math.rad2Deg * math.atan2(slot3.transAimPosZ - slot0._position.z, slot3.transAimPosX - slot0._position.x)
		end

		slot0:calcSpeed()
		table.remove(slot0._barrageTransData, 1)

		if slot0._barrageTransData[1] then
			slot4.transStartDelay = slot4.transStartDelay + slot3.transStartDelay
		end
	end
end

function ys.Battle.BattleBulletUnit.GetCurrentDistance(slot0)
	return Vector3.Distance(slot0._spawnPos, slot0._position)
end

function ys.Battle.BattleBulletUnit.SetOutRangeCallback(slot0, slot1)
	slot0._outRangeFunc = slot1
end

function ys.Battle.BattleBulletUnit.OutRange(slot0)
	slot0:DispatchEvent(slot0.Event.New(slot1.OUT_RANGE, {}))
	slot0:_outRangeFunc()
end

function ys.Battle.BattleBulletUnit.FixRange(slot0, slot1)
	slot1 = slot1 or slot0._tempData.range

	if slot0._tempData.range_offset == 0 then
		slot0._range = slot1
	else
		slot0._range = slot1 + slot2 * (math.random() - 0.5)
	end

	slot0._sqrRange = slot0._range * slot0._range
end

function ys.Battle.BattleBulletUnit.ImmuneCLS(slot0)
	return slot0._immuneCLS
end

function ys.Battle.BattleBulletUnit.SetImmuneCLS(slot0, slot1)
	slot0._immuneCLS = slot1
end

return
