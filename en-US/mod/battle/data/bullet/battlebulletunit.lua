ys = ys or {}
slot0 = ys
slot1 = slot0.Battle.BattleBulletEvent
slot2 = slot0.Battle.BattleFormulas
slot3 = Vector3.up
slot4 = slot0.Battle.BattleVariable
slot6 = slot0.Battle.BattleTargetChoise
slot0.Battle.BattleBulletUnit = class("BattleBulletUnit")
slot0.Battle.BattleBulletUnit.__name = "BattleBulletUnit"
slot7 = slot0.Battle.BattleBulletUnit
slot7.ACC_INTERVAL = slot0.Battle.BattleConfig.calcInterval
slot7.TRACKER_ANGLE = math.cos(math.deg2Rad * 10)
slot7.MIRROR_RES = "_mirror"

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
	slot0._speedCross:Cross2(uv0)
end

function slot9(slot0)
	if slot0:getTrackingTarget() == nil and uv0.TargetHarmNearest(slot0)[1] ~= nil and slot0:GetDistance(slot1) <= slot0._trackRange then
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

	slot2 = slot1:GetCLDCenterPosition() - slot0:GetPosition()

	slot2:SetNormalize()

	slot4 = Vector3.Dot(Vector3.Normalize(slot0._speed), slot2)
	slot5, slot6 = nil
	slot9 = slot0:GetSpeedRatio()

	if slot2.x * slot2.z > 0 then
		slot5 = math.cos(slot0._negativeCosAngularSpeed * slot9)
		slot6 = math.sin(slot0._negativeSinAngularSpeed * slot9)
	else
		slot5 = math.cos(slot0._cosAngularSpeed * slot9)
		slot6 = math.sin(slot0._sinAngularSpeed * slot9)
	end

	if slot4 < uv1.TRACKER_ANGLE then
		slot0._speed:Set(slot0._speed.x * slot5 + slot0._speed.z * slot6, 0, slot0._speed.z * slot5 - slot0._speed.x * slot6)
	end
end

function slot10(slot0)
	slot1 = pg.Tool.FilterY(slot0._weapon:GetPosition())
	slot2 = pg.Tool.FilterY(slot0:GetPosition())
	slot4 = (slot1 - slot2).normalized
	slot5 = nil
	slot0._speed = ((slot2 - slot1).magnitude <= 10 or (slot4 + slot0._speed.normalized).normalized) and (Vector3(-slot4.z, 0, slot4.x) + slot0._speed.normalized).normalized
end

function slot11(slot0)
	if slot0._gravity ~= 0 then
		slot0._verticalSpeed = slot0._verticalSpeed + slot0._gravity * slot0:GetSpeedRatio()
	end
end

function slot7.Ctor(slot0, slot1, slot2)
	uv0.EventDispatcher.AttachEventDispatcher(slot0)

	slot0._battleProxy = uv0.Battle.BattleDataProxy.GetInstance()
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

function slot7.Update(slot0, slot1)
	slot2 = slot0:GetSpeedRatio()

	slot0:updateSpeed(slot1)
	slot0:updateBarrageTransform(slot1)
	slot0._position:Set(slot0._position.x + slot0._speed.x * slot2, slot0._position.y + slot0._speed.y * slot2, slot0._position.z + slot0._speed.z * slot2)

	if slot0._gravity == 0 then
		slot0._reachDestFlag = slot0._sqrRange < Vector3.SqrDistance(slot0._spawnPos, slot0._position)
	else
		slot0._position.y = slot0._position.y + slot0._verticalSpeed * slot2

		if slot0._fieldSwitchHeight ~= 0 and slot0._position.y <= slot0._fieldSwitchHeight then
			slot0._field = uv0.Battle.BattleConst.BulletField.SURFACE
		end

		slot0._reachDestFlag = slot0._position.y <= uv1.BombDetonateHeight
	end
end

function slot7.ActiveCldBox(slot0)
	slot0._cldComponent:SetActive(true)
end

function slot7.DeactiveCldBox(slot0)
	slot0._cldComponent:SetActive(false)
end

function slot7.SetStartTimeStamp(slot0, slot1)
	slot0._timeStamp = slot1
end

function slot7.Hit(slot0, slot1, slot2)
	slot0._collidedList[slot1] = true

	slot0:DispatchEvent(uv0.Event.New(uv1.HIT, {
		UID = slot1,
		type = slot2
	}))
end

function slot7.Intercepted(slot0)
	slot0:DispatchEvent(uv0.Event.New(uv1.INTERCEPTED, {}))
end

function slot7.Reflected(slot0)
	slot0._speed.x = -slot0._speed.x
end

function slot7.SetTemplateData(slot0, slot1)
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
		slot0._convertedVelocity = uv0.ConvertBulletSpeed(slot0._velocity)
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
	slot0._ignoreShield = slot0._tempData.extra_param.ignoreShield == true

	slot0:SetDiverFilter()
end

function slot7.GetModleID(slot0)
	if slot0:GetTemplate().extra_param.mirror == true and slot0._IFF == uv0.FOE_CODE then
		return slot0._modleID .. uv1.MIRROR_RES
	else
		return slot0._modleID
	end
end

function slot7.SetModleID(slot0, slot1)
	slot0._modleID = slot1
end

function slot7.SetShiftInfo(slot0, slot1, slot2)
	slot0._offsetX = slot1
	slot0._offsetZ = slot2
end

function slot7.SetRotateInfo(slot0, slot1, slot2, slot3)
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

function slot7.SetBarrageTransformTempate(slot0, slot1)
	if #slot1 > 0 then
		slot0._barrageTransData = slot1
	end
end

function slot7.SetAttr(slot0, slot1)
	uv0.Battle.BattleAttr.SetAttr(slot0, slot1)
end

function slot7.GetAttr(slot0)
	return uv0.Battle.BattleAttr.GetAttr(slot0)
end

function slot7.SetStandHostAttr(slot0, slot1)
	slot0._standUnit = {}

	uv0.Battle.BattleAttr.SetAttr(slot0._standUnit, slot1)
end

function slot7.GetWeaponHostAttr(slot0)
	if slot0._standUnit then
		return uv0.Battle.BattleAttr.GetAttr(slot0._standUnit)
	else
		return slot0:GetAttr()
	end
end

function slot7.SetDamageEnhance(slot0, slot1)
	slot0._dmgEnhanceRate = slot1
end

function slot7.GetDamageEnhance(slot0)
	return slot0._dmgEnhanceRate
end

function slot7.GetAttrByName(slot0, slot1)
	return uv0.Battle.BattleAttr.GetCurrent(slot0, slot1)
end

function slot7.GetVerticalSpeed(slot0)
	return slot0._verticalSpeed
end

function slot7.IsGravitate(slot0)
	return slot0._gravity ~= 0
end

function slot7.SetBuffTrigger(slot0, slot1)
	slot0._host = slot1
	slot0._buffTriggerFun = {}
end

function slot7.SetBuffFun(slot0, slot1, slot2)
	slot3 = slot0._buffTriggerFun[slot1] or {}
	slot3[#slot3 + 1] = slot2
	slot0._buffTriggerFun[slot1] = slot3
end

function slot7.BuffTrigger(slot0, slot1, slot2)
	if slot0._host and slot3:IsAlive() then
		slot0._host:TriggerBuff(slot1, slot2)

		if slot0._buffTriggerFun[slot1] then
			for slot8, slot9 in ipairs(slot4) do
				slot9(slot0._host, slot2)
			end
		end
	end
end

function slot7.SetIsCld(slot0, slot1)
	slot0._needCld = slot1
end

function slot7.GetIsCld(slot0)
	return slot0._needCld
end

function slot7.AppendDamageUnit(slot0, slot1)
	slot0._damageList[#slot0._damageList + 1] = slot1
end

function slot7.DamageUnitListWriteback(slot0)
	slot0._weapon:UpdateCombo(slot0._damageList)
end

function slot7.HasAcceleration(slot0)
	return #slot0._accTable ~= 0
end

function slot7.IsTracker(slot0)
	return slot0._accTable.tracker
end

function slot7.IsOrbit(slot0)
	return slot0._accTable.orbit
end

function slot7.GetAcceleration(slot0, slot1)
	slot0._lastAccTime = slot0._lastAccTime or slot0._timeStamp
	slot0._lastAccTime = slot0._lastAccTime + uv0.ACC_INTERVAL * math.modf((slot1 - slot0._lastAccTime) / uv0.ACC_INTERVAL)
	slot3 = slot1 - slot0._timeStamp
	slot4 = #slot0._accTable

	while slot4 > 0 do
		if slot3 + uv0.ACC_INTERVAL < slot0._accTable[slot4].t then
			slot4 = slot4 - 1
		else
			return slot5.u * slot2, slot5.v * slot2
		end
	end

	return 0, 0
end

function slot7.reverseAcceleration(slot0)
	for slot4, slot5 in ipairs(slot0._accTable) do
		slot5.u = slot5.u * -1
	end
end

function slot7.GetDistance(slot0, slot1)
	if slot0._frame ~= slot0._battleProxy.FrameIndex then
		slot0._distanceBackup = {}
		slot0._frame = slot2
	end

	if slot0._distanceBackup[slot1] == nil then
		slot3 = Vector3.Distance(slot0:GetPosition(), slot1:GetPosition())
		slot0._distanceBackup[slot1] = slot3

		slot1:backupDistance(slot0, slot3)
	end

	return slot3
end

function slot7.backupDistance(slot0, slot1, slot2)
	if slot0._frame ~= slot0._battleProxy.FrameIndex then
		slot0._distanceBackup = {}
		slot0._frame = slot3
	end

	slot0._distanceBackup[slot1] = slot2
end

function slot7.getTrackingTarget(slot0)
	return slot0._tarckingTarget
end

function slot7.setTrackingTarget(slot0, slot1)
	slot0._tarckingTarget = slot1
end

function slot7.SetWeapon(slot0, slot1)
	slot0._weapon = slot1

	if slot1 then
		slot0._correctedDMG = slot0._weapon:GetCorrectedDMG()
	end
end

function slot7.GetWeapon(slot0)
	return slot0._weapon
end

function slot7.GetCorrectedDMG(slot0)
	return slot0._correctedDMG
end

function slot7.OverrideCorrectedDMG(slot0, slot1)
	slot0._correctedDMG = uv0.WeaponDamagePreCorrection(slot0._weapon, slot1)
end

function slot7.GetWeaponTempData(slot0)
	return slot0._weapon:GetTemplateData()
end

function slot7.GetPosition(slot0)
	return slot0._position or Vector3.zero
end

function slot7.SetSpawnPosition(slot0, slot1)
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

function slot7.GetTemplate(slot0)
	return slot0._tempData
end

function slot7.GetType(slot0)
	return slot0._tempData.type
end

function slot7.GetOutBound(slot0)
	return slot0._tempData.out_bound == 0
end

function slot7.GetUniqueID(slot0)
	return slot0._uniqueID
end

function slot7.GetOffset(slot0)
	return slot0._offsetX, slot0._offsetZ, slot0._isOffsetPriority
end

function slot7.GetRotateInfo(slot0)
	return slot0._targetPos, slot0._baseAngle, slot0._barrageAngle
end

function slot7.IsOutRange(slot0)
	return slot0._reachDestFlag
end

function slot7.SetYAngle(slot0, slot1)
	slot0._yAngle = slot1
end

function slot7.SetOffsetPriority(slot0, slot1)
	slot0._isOffsetPriority = slot1 or false
end

function slot7.GetOffsetPriority(slot0)
	return slot0._isOffsetPriority
end

function slot7.GetYAngle(slot0)
	return slot0._yAngle
end

function slot7.GetIFF(slot0)
	return slot0._IFF
end

function slot7.GetHost(slot0)
	return slot0._host
end

function slot7.GetPierceCount(slot0)
	return slot0._pierceCount
end

function slot7.AppendAttachBuff(slot0, slot1)
	slot2 = Clone(slot0:GetTemplate().attach_buff)
	slot2[#slot2 + 1] = slot1
	slot0._attachBuffList = slot2
end

function slot7.GetAttachBuff(slot0)
	return slot0._attachBuffList or slot0:GetTemplate().attach_buff or {}
end

function slot7.GetEffectField(slot0)
	return slot0._field
end

function slot7.SetDiverFilter(slot0, slot1)
	if slot1 == nil then
		slot0._diveFilter = slot0._tempData.extra_param.diveFilter or {
			2
		}
	else
		slot0._diveFilter = slot1
	end
end

function slot7.GetDiveFilter(slot0)
	return slot0._diveFilter
end

function slot7.GetVelocity(slot0)
	return slot0._velocity
end

function slot7.GetConvertedVelocity(slot0)
	return slot0._convertedVelocity
end

function slot7.GetSpeedExemptKey(slot0)
	return slot0._speedExemptKey
end

function slot7.IsCollided(slot0, slot1)
	return slot0._collidedList[slot1]
end

function slot7.GetExist(slot0)
	return slot0._exist
end

function slot7.SetExist(slot0, slot1)
	slot0._exist = slot1
end

function slot7.GetIgnoreShield(slot0)
	return slot0._ignoreShield
end

function slot7.Dispose(slot0)
	slot0._dataProxy = nil

	uv0.EventDispatcher.DetachEventDispatcher(slot0)
end

function slot7.InitCldComponent(slot0)
	slot1 = slot0:GetTemplate().cld_box

	if slot0:GetIFF() == uv0.FOE_CODE then
		slot3 = slot0:GetTemplate().cld_offset[1] * -1
	end

	slot0._cldComponent = uv1.Battle.BattleCubeCldComponent.New(slot1[1], slot1[2], slot1[3], slot3, slot2[3])

	slot0._cldComponent:SetCldData({
		type = uv1.Battle.BattleConst.CldType.BULLET,
		IFF = slot0:GetIFF(),
		UID = slot0:GetUniqueID()
	})
end

function slot7.ResetCldSurface(slot0)
	if slot0:GetDiveFilter() and #slot1 == 0 then
		slot0:GetCldData().Surface = uv0.Battle.BattleConst.OXY_STATE.DIVE
	else
		slot0:GetCldData().Surface = uv0.Battle.BattleConst.OXY_STATE.FLOAT
	end
end

function slot7.GetBoxSize(slot0)
	return slot0._cldComponent:GetCldBoxSize()
end

function slot7.GetCldBox(slot0)
	return slot0._cldComponent:GetCldBox(slot0:GetPosition())
end

function slot7.GetCldData(slot0)
	return slot0._cldComponent:GetCldData()
end

function slot7.GetSpeed(slot0)
	return slot0._speed
end

function slot7.GetSpeedRatio(slot0)
	return uv0.GetSpeedRatio(slot0._speedExemptKey, slot0._IFF)
end

function slot7.InitSpeed(slot0, slot1)
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
		slot0._speedCross = Vector3.Cross(slot0._speedNormal, uv0)
		slot0.updateSpeed = uv1
	elseif slot0:IsTracker() then
		slot2 = slot0._accTable.tracker
		slot0._trackRange = slot2.range
		slot0._cosAngularSpeed = math.deg2Rad * slot2.angular
		slot0._sinAngularSpeed = math.deg2Rad * slot2.angular
		slot0._negativeCosAngularSpeed = math.deg2Rad * slot2.angular * -1
		slot0._negativeSinAngularSpeed = math.deg2Rad * slot2.angular * -1
		slot0.updateSpeed = uv2
	else
		slot0.updateSpeed = uv3
	end
end

function slot7.calcSpeed(slot0)
	slot2 = uv1.ConvertBulletSpeed(slot0._velocity * (1 + uv0.Battle.BattleAttr.GetCurrent(slot0, "bulletSpeedRatio")))
	slot3 = math.deg2Rad * slot0._yAngle
	slot0._speed = Vector3(slot2 * math.cos(slot3), 0, slot2 * math.sin(slot3))
end

function slot7.updateBarrageTransform(slot0, slot1)
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

function slot7.GetCurrentDistance(slot0)
	return Vector3.Distance(slot0._spawnPos, slot0._position)
end

function slot7.SetOutRangeCallback(slot0, slot1)
	slot0._outRangeFunc = slot1
end

function slot7.OutRange(slot0)
	slot0:DispatchEvent(uv0.Event.New(uv1.OUT_RANGE, {}))
	slot0:_outRangeFunc()
end

function slot7.FixRange(slot0, slot1)
	if slot0._tempData.range_offset == 0 then
		slot0._range = slot1 or slot0._tempData.range
	else
		slot0._range = slot1 + slot2 * (math.random() - 0.5)
	end

	slot0._sqrRange = slot0._range * slot0._range
end

function slot7.ImmuneCLS(slot0)
	return slot0._immuneCLS
end

function slot7.SetImmuneCLS(slot0, slot1)
	slot0._immuneCLS = slot1
end
