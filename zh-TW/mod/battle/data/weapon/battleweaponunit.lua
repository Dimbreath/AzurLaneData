ys = ys or {}
slot0 = ys
slot1 = slot0.Battle.BattleConst
slot2 = slot0.Battle.BattleFormulas
slot3 = slot1.WeaponSuppressType
slot4 = slot1.WeaponSearchType
slot5 = slot0.Battle.BattleDataFunction
slot6 = class("BattleWeaponUnit")
slot0.Battle.BattleWeaponUnit = slot6
slot6.__name = "BattleWeaponUnit"
slot6.INTERNAL = "internal"
slot6.EXTERNAL = "external"
slot6.EMITTER_NORMAL = "BattleBulletEmitter"
slot6.EMITTER_SHOTGUN = "BattleShotgunEmitter"
slot6.STATE_DISABLE = "DISABLE"
slot6.STATE_READY = "READY"
slot6.STATE_PRECAST = "PRECAST"
slot6.STATE_PRECAST_FINISH = "STATE_PRECAST_FINISH"
slot6.STATE_ATTACK = "ATTACK"
slot6.STATE_OVER_HEAT = "OVER_HEAT"

function slot6.Ctor(slot0)
	uv0.EventDispatcher.AttachEventDispatcher(slot0)

	slot0._currentState = slot0.STATE_READY
	slot0._equipmentIndex = -1
	slot0._dataProxy = uv0.Battle.BattleDataProxy.GetInstance()
	slot0._tempEmittersList = {}
	slot0._reloadFacotrList = {}
	slot0._diveEnabled = true
	slot0._comboIDList = {}
	slot0._jammingTime = 0
end

function slot6.HostOnEnemy(slot0)
	slot0._hostOnEnemy = true
end

function slot6.SetPotentialFactor(slot0, slot1)
	slot0._potential = slot1

	if slot0._correctedDMG then
		slot0._correctedDMG = uv0.WeaponDamagePreCorrection(slot0)
	end
end

function slot6.GetEquipmentLabel(slot0)
	return slot0._equipmentLabelList or {}
end

function slot6.SetEquipmentLabel(slot0, slot1)
	slot0._equipmentLabelList = slot1
end

function slot6.SetTemplateData(slot0, slot1)
	slot0._potential = slot0._potential or 1
	slot0._tmpData = slot1
	slot0._maxRangeSqr = slot1.range
	slot0._minRangeSqr = slot1.min_range
	slot0._fireFXFlag = slot1.fire_fx_loop_type
	slot0._oxyList = slot1.oxy_type
	slot0._majorEmitterList = {}
	slot0._bulletList = slot1.bullet_ID

	for slot5, slot6 in ipairs(slot1.barrage_ID) do
		slot0:createMajorEmitter(slot6, slot5)
	end

	slot0._GCD = slot1.recover_time
	slot0._preCastInfo = slot1.precast_param
	slot0._correctedDMG = uv0.WeaponDamagePreCorrection(slot0)
	slot0._convertedAtkAttr = uv0.WeaponAtkAttrPreRatio(slot0)

	slot0:FlushReloadMax(1)
end

function slot6.createMajorEmitter(slot0, slot1, slot2, slot3, slot4, slot5)
	slot8 = uv2.Battle[slot3 or uv0.EMITTER_NORMAL].New(slot4 or function (slot0, slot1, slot2, slot3, slot4)
		slot6 = uv0:Spawn(uv0._bulletList[uv1], slot4, uv2.INTERNAL)

		slot6:SetOffsetPriority(slot3)
		slot6:SetShiftInfo(slot0, slot1)

		if uv0._tmpData.aim_type == uv3.WeaponAimType.AIM and slot4 ~= nil then
			slot6:SetRotateInfo(slot4:GetCLDZCenterPosition(), uv0:GetBaseAngle(), slot2)
		else
			slot6:SetRotateInfo(nil, uv0:GetBaseAngle(), slot2)
		end

		uv0:DispatchBulletEvent(slot6)

		return slot6
	end, slot5 or function ()
		for slot3, slot4 in ipairs(uv0._majorEmitterList) do
			if slot4:GetState() ~= slot4.STATE_STOP then
				return
			end
		end

		uv0:EnterCoolDown()
	end, slot1)
	slot0._majorEmitterList[#slot0._majorEmitterList + 1] = slot8

	return slot8
end

function slot6.cacheSectorData(slot0)
	slot0._upperEdge = math.deg2Rad * slot0:GetAttackAngle() / 2
	slot0._lowerEdge = -1 * slot0._upperEdge

	if slot0:GetDirection() == uv0.UnitDir.LEFT then
		slot0._normalizeOffset = math.pi - math.deg2Rad * slot0._tmpData.axis_angle
	elseif slot0:GetDirection() == uv0.UnitDir.RIGHT then
		slot0._normalizeOffset = slot2
	end

	slot0._wholeCircle = math.pi - slot0._normalizeOffset
	slot0._negativeCircle = -math.pi - slot0._normalizeOffset
	slot0._wholeCircleNormalizeOffset = slot0._normalizeOffset - math.pi * 2
	slot0._negativeCircleNormalizeOffset = slot0._normalizeOffset + math.pi * 2
end

function slot6.cacheSquareData(slot0)
	slot0._frontRange = slot0._tmpData.angle
	slot0._backRange = slot0._tmpData.axis_angle
	slot0._upperRange = slot0._tmpData.min_range
	slot0._lowerRange = slot0._tmpData.range
end

function slot6.SetModelID(slot0, slot1)
	slot0._modelID = slot1
end

function slot6.SetSkinData(slot0, slot1)
	slot0._skinID = slot1

	slot0:SetModelID(uv0.GetEquipSkin(slot0._skinID))
end

function slot6.SetDerivateSkin(slot0, slot1)
	slot0._derivateSkinID = slot1
	slot2, slot0._derivateBullet, slot0._derivateTorpedo, slot0._derivateBoom = uv0.GetEquipSkin(slot0._derivateSkinID)
end

function slot6.GetSkinID(slot0)
	return slot0._skinID
end

function slot6.setBulletSkin(slot0, slot1, slot2)
	if slot0._derivateSkinID then
		if uv0.GetBulletTmpDataFromID(slot2).type == uv1.BulletType.BOMB then
			slot1:SetModleID(slot0._derivateBoom)
		elseif slot3 == uv1.BulletType.TORPEDO then
			slot1:SetModleID(slot0._derivateTorpedo)
		else
			slot1:SetModleID(slot0._derivateBullet)
		end
	elseif slot0._modelID then
		slot1:SetModleID(slot0._modelID)
	end
end

function slot6.SetEquipmentIndex(slot0, slot1)
	slot0._equipmentIndex = slot1
end

function slot6.GetEquipmentIndex(slot0)
	return slot0._equipmentIndex
end

function slot6.SetHostData(slot0, slot1)
	slot0._host = slot1
	slot0._hostUnitType = slot0._host:GetUnitType()
	slot0._hostIFF = slot1:GetIFF()

	if slot0._tmpData.search_type == uv0.SECTOR then
		slot0:cacheSectorData()

		slot0.outOfFireRange = slot0.IsOutOfAngle
		slot0.IsOutOfFireArea = slot0.IsOutOfSector
	elseif slot0._tmpData.search_type == uv0.SQUARE then
		slot0:cacheSquareData()

		slot0.outOfFireRange = slot0.IsOutOfSquare
		slot0.IsOutOfFireArea = slot0.IsOutOfSquare
	end

	if slot0:GetDirection() == uv1.UnitDir.RIGHT then
		slot0._baseAngle = 0
	else
		slot0._baseAngle = 180
	end
end

function slot6.OverrideGCD(slot0, slot1)
	slot0._GCD = slot1
end

function slot6.updateMovementInfo(slot0)
	slot0._hostPos = slot0._host:GetPosition()
end

function slot6.GetWeaponId(slot0)
	return slot0._tmpData.id
end

function slot6.GetTemplateData(slot0)
	return slot0._tmpData
end

function slot6.GetType(slot0)
	return slot0._tmpData.type
end

function slot6.GetPotential(slot0)
	return slot0._potential or 1
end

function slot6.IsAttacking(slot0)
	return slot0._currentState == uv0.STATE_ATTACK or slot0._currentState == slot0.STATE_PRECAST
end

function slot6.Update(slot0)
	slot0:UpdateReload()

	if not slot0._diveEnabled then
		return
	end

	if slot0._currentState == slot0.STATE_READY then
		slot0:updateMovementInfo()

		if slot0._tmpData.suppress == uv0.SUPPRESSION or slot0:CheckPreCast() then
			if slot0._preCastInfo.time == nil or not slot0._hostOnEnemy then
				slot0._currentState = slot0.STATE_PRECAST_FINISH
			else
				slot0:PreCast()
			end
		end
	end

	if slot0._currentState == slot0.STATE_PRECAST_FINISH then
		slot0:updateMovementInfo()
		slot0:Fire(slot0:Tracking())
	end
end

function slot6.CheckReloadTimeStamp(slot0)
	return slot0._CDstartTime and slot0:GetReloadFinishTimeStamp() <= pg.TimeMgr.GetInstance():GetCombatTime()
end

function slot6.UpdateReload(slot0)
	if slot0._CDstartTime and not slot0._jammingStartTime then
		if slot0:GetReloadFinishTimeStamp() <= pg.TimeMgr.GetInstance():GetCombatTime() then
			slot0:handleCoolDown()
		else
			return
		end
	end
end

function slot6.CheckPreCast(slot0)
	for slot4, slot5 in pairs(slot0:GetFilteredList()) do
		return true
	end

	return false
end

function slot6.ChangeDiveState(slot0)
	if slot0._host:GetOxyState() then
		for slot5, slot6 in ipairs(slot0._oxyList) do
			if table.contains(slot0._host:GetOxyState():GetWeaponType(), slot6) then
				slot0._diveEnabled = true

				return
			end
		end

		slot0._diveEnabled = false
	end
end

function slot6.getTrackingHost(slot0)
	return slot0._host
end

function slot6.Tracking(slot0)
	if uv0.Battle.BattleAttr.GetCurrent(slot0._host, "TargetChoise") == "farthest" then
		return slot0:TrackingFarthest(slot0:GetFilteredList())
	elseif slot1 == "leastHP" then
		return slot0:TrackingLeastHP(slot0:GetFilteredList())
	elseif type(slot1) == "number" and slot1 > 0 then
		return slot0:TrackingModelID(slot0:GetFilteredList(), slot1)
	elseif slot1 == 0 then
		return slot0:TrackingNearest(slot0:GetFilteredList())
	else
		return slot0:TrackingTag(slot0:GetFilteredList(), slot1)
	end
end

function slot6.GetFilteredList(slot0)
	if slot0._tmpData.search_type == uv0.SECTOR then
		slot1 = slot0:FilterAngle(slot0:FilterRange(slot0:FilterTarget()))
	elseif slot0._tmpData.search_type == uv0.SQUARE then
		slot1 = slot0:FilterSquare(slot1)
	end

	return slot1
end

function slot6.FixWeaponRange(slot0, slot1, slot2, slot3)
	slot0._maxRangeSqr = slot1 or slot0._tmpData.range
	slot0._minRangeSqr = slot3 or slot0._tmpData.min_range
	slot0._fixBulletRange = slot2
end

function slot6.GetFixBulletRange(slot0)
	return slot0._fixBulletRange
end

function slot6.TrackingNearest(slot0, slot1)
	slot3 = nil

	for slot7, slot8 in ipairs(slot1) do
		if slot0:getTrackingHost():GetDistance(slot8) <= slot0._maxRangeSqr then
			slot2 = slot9
			slot3 = slot8
		end
	end

	return slot3
end

function slot6.TrackingFarthest(slot0, slot1)
	slot3 = nil

	for slot7, slot8 in ipairs(slot1) do
		if 0 < slot0:getTrackingHost():GetDistance(slot8) then
			slot2 = slot9
			slot3 = slot8
		end
	end

	return slot3
end

function slot6.TrackingLeastHP(slot0, slot1)
	slot3 = nil

	for slot7, slot8 in ipairs(slot1) do
		if slot8:GetCurrentHP() < math.huge then
			slot3 = slot8
			slot2 = slot9
		end
	end

	return slot3
end

function slot6.TrackingModelID(slot0, slot1, slot2)
	slot3 = nil

	for slot7, slot8 in ipairs(slot1) do
		if slot8:GetTemplateID() == slot2 then
			slot3 = slot8
		end
	end

	return slot3
end

function slot6.TrackingRandom(slot0, slot1)
	for slot6, slot7 in pairs(slot1) do
		table.insert({}, slot7)
	end

	slot3 = #slot2

	if #slot2 == 0 then
		return nil
	else
		return slot2[math.random(#slot2)]
	end
end

function slot6.TrackingTag(slot0, slot1, slot2)
	for slot7, slot8 in ipairs(slot1) do
		slot11[1] = slot2

		if slot8:ContainsLabelTag({}) then
			table.insert({}, slot8)
		end
	end

	if #slot3 == 0 then
		return slot0:TrackingNearest(slot1)
	else
		return slot3[math.random(#slot3)]
	end
end

function slot6.FilterTarget(slot0)
	slot1 = nil
	slot2 = {}
	slot3 = 1

	for slot8, slot9 in pairs((slot0._hostIFF ~= slot0._dataProxy:GetFriendlyCode() or slot0._dataProxy:GetFoeShipList()) and slot0._dataProxy:GetFriendlyShipList()) do
		if not table.contains(slot0._tmpData.search_condition, slot9:GetCurrentOxyState()) then
			-- Nothing
		else
			slot11 = true

			if slot10 == uv0.OXY_STATE.FLOAT then
				-- Nothing
			elseif slot10 == uv0.OXY_STATE.DIVE and not slot9:IsRunMode() and not slot9:GetDiveDetected() and slot9:GetDiveInvisible() then
				slot11 = false
			end

			if slot11 then
				slot2[slot3] = slot9
				slot3 = slot3 + 1
			end
		end
	end

	return slot2
end

function slot6.FilterAngle(slot0, slot1)
	if slot0:GetAttackAngle() >= 360 then
		return slot1
	end

	for slot5 = #slot1, 1, -1 do
		if slot0:IsOutOfAngle(slot1[slot5]) then
			table.remove(slot1, slot5)
		end
	end

	return slot1
end

function slot6.FilterRange(slot0, slot1)
	for slot5 = #slot1, 1, -1 do
		if slot0:IsOutOfRange(slot1[slot5]) then
			table.remove(slot1, slot5)
		end
	end

	return slot1
end

function slot6.FilterSquare(slot0, slot1)
	slot2 = slot0:GetDirection()
	slot4.lineX = slot0._host:GetPosition().x + slot0._backRange * slot2 * -1
	slot4.dir = slot2
	slot6 = uv0.Battle.BattleTargetChoise.TargetWeightiest(slot0._host, nil, uv0.Battle.BattleTargetChoise.TargetInsideArea(slot0._host, {}, slot1))

	for slot10 = #slot1, 1, -1 do
		if slot0:IsOutOfSquare(slot1[slot10]) then
			table.remove(slot1, slot10)
		end
	end

	for slot10 = #slot1, 1, -1 do
		if not table.contains(slot6, slot1[slot10]) then
			table.remove(slot1, slot10)
		end
	end

	return slot1
end

function slot6.GetAttackAngle(slot0)
	return slot0._tmpData.angle
end

function slot6.IsOutOfAngle(slot0, slot1)
	if slot0:GetAttackAngle() >= 360 then
		return false
	end

	slot2 = slot1:GetPosition()

	if slot0._lowerEdge < (slot0._wholeCircle < math.atan2(slot2.z - slot0._hostPos.z, slot2.x - slot0._hostPos.x) and slot3 + slot0._wholeCircleNormalizeOffset or slot3 < slot0._negativeCircle and slot3 + slot0._negativeCircleNormalizeOffset or slot3 + slot0._normalizeOffset) and slot3 < slot0._upperEdge then
		return false
	else
		return true
	end
end

function slot6.IsOutOfRange(slot0, slot1)
	return slot0._maxRangeSqr < slot0:getTrackingHost():GetDistance(slot1) or slot2 < slot0:GetMinimumRange()
end

function slot6.IsOutOfSector(slot0, slot1)
	return slot0:IsOutOfRange(slot1) or slot0:IsOutOfAngle(slot1)
end

function slot6.IsOutOfSquare(slot0, slot1)
	slot3 = false
	slot4 = (slot1:GetPosition().x - slot0._hostPos.x) * slot0:GetDirection()

	if slot0._backRange < 0 then
		if slot4 > 0 and slot4 <= slot0._frontRange and math.abs(slot0._backRange) <= slot4 then
			slot3 = true
		end
	elseif slot4 > 0 and slot4 <= slot0._frontRange or slot4 < 0 and math.abs(slot4) < slot0._backRange then
		slot3 = true
	end

	if not slot3 then
		return true
	else
		return false
	end
end

function slot6.LockUnit(slot0, slot1)
	slot1:Tag(slot0)
end

function slot6.UnlockUnit(slot0, slot1)
	slot1:UnTag(slot0)
end

function slot6.GetLockRequiredTime(slot0)
	return 0
end

function slot6.PreCast(slot0)
	slot0._currentState = slot0.STATE_PRECAST

	slot0:AddPreCastTimer()

	if slot0._preCastInfo.armor then
		slot0._precastArmor = slot0._preCastInfo.armor
	end

	slot0._host:SetWeaponPreCastBound(true)
	slot0:DispatchEvent(uv0.Event.New(uv0.Battle.BattleUnitEvent.WEAPON_PRE_CAST, slot0._preCastInfo))
end

function slot6.Fire(slot0, slot1)
	slot0:DispatchGCD()

	slot0._currentState = slot0.STATE_ATTACK

	if slot0._tmpData.action_index == "" then
		slot0:DoAttack(slot1)
	else
		slot0:DispatchFireEvent(slot1, slot0._tmpData.action_index)
	end

	return true
end

function slot6.DoAttack(slot0, slot1)
	if slot1 == nil or not slot1:IsAlive() or slot0:outOfFireRange(slot1) then
		slot1 = nil
	end

	slot2 = slot0:GetDirection()
	slot3 = slot0:GetAttackAngle()

	slot0:TriggerBuffOnSteday()

	for slot7, slot8 in ipairs(slot0._majorEmitterList) do
		slot8:Ready()
	end

	for slot7, slot8 in ipairs(slot0._majorEmitterList) do
		slot8:Fire(slot1, slot2, slot3)
	end

	uv0.Battle.PlayBattleSFX(slot0._tmpData.fire_sfx)
	slot0:TriggerBuffOnFire()
	slot0:CheckAndShake()
end

function slot6.TriggerBuffOnSteday(slot0)
	slot4.equipIndex = slot0._equipmentIndex

	slot0._host:TriggerBuff(uv0.BuffEffectType.ON_WEAPON_STEDAY, {})
end

function slot6.TriggerBuffOnFire(slot0)
	slot4.equipIndex = slot0._equipmentIndex

	slot0._host:TriggerBuff(uv0.BuffEffectType.ON_FIRE, {})
end

function slot6.TriggerBuffOnReady(slot0)
end

function slot6.UpdateCombo(slot0, slot1)
	if slot0._hostUnitType ~= uv0.UnitType.PLAYER_UNIT or not slot0._host:IsAlive() then
		return
	end

	if #slot1 > 0 then
		for slot6, slot7 in ipairs(slot1) do
			if table.contains(slot0._comboIDList, slot7) then
				slot2 = 0 + 1
			end

			slot11.equipIndex = slot0._equipmentIndex
			slot11.matchUnitCount = slot2

			slot0._host:TriggerBuff(uv0.BuffEffectType.ON_COMBO, {})

			break
		end

		slot0._comboIDList = slot1
	end
end

function slot6.SingleFire(slot0, slot1, slot2)
	slot0._tempEmittersList[#slot0._tempEmittersList + 1] = {}

	if slot1 and slot1:IsAlive() then
		-- Nothing
	else
		slot1 = nil
	end

	for slot7, slot8 in ipairs(slot0._tmpData.barrage_ID) do
		slot3[#slot3 + 1] = uv1.Battle[slot2 or uv0.EMITTER_NORMAL].New(function (slot0, slot1, slot2, slot3)
			slot5 = uv0:Spawn(uv0._bulletList[uv1], uv2, uv3.EXTERNAL)

			slot5:SetOffsetPriority(slot3)
			slot5:SetShiftInfo(slot0, slot1)

			if uv2 ~= nil then
				slot5:SetRotateInfo(uv2:GetCLDZCenterPosition(), uv0:GetBaseAngle(), slot2)
			else
				slot5:SetRotateInfo(nil, uv0:GetBaseAngle(), slot2)
			end

			uv0:DispatchBulletEvent(slot5)
		end, function ()
			for slot3, slot4 in ipairs(uv0) do
				if slot4:GetState() ~= slot4.STATE_STOP then
					return
				end
			end

			for slot3, slot4 in ipairs(uv0) do
				slot4:Destroy()
			end

			slot0 = nil

			for slot4, slot5 in ipairs(uv1._tempEmittersList) do
				if slot5 == uv0 then
					slot0 = slot4
				end
			end

			table.remove(uv1._tempEmittersList, slot0)

			uv0 = nil
			uv1._fireFXFlag = uv1._tmpData.fire_fx_loop_type
		end, slot8)
	end

	for slot7, slot8 in ipairs(slot3) do
		slot8:Ready()
		slot8:Fire(slot1, slot0:GetDirection(), slot0:GetAttackAngle())
	end

	slot0:CheckAndShake()
end

function slot6.SetModifyInitialCD(slot0)
	slot0._modInitCD = true
end

function slot6.GetModifyInitialCD(slot0)
	return slot0._modInitCD
end

function slot6.InitialCD(slot0)
	if slot0._tmpData.initial_over_heat == 1 then
		slot0:AddCDTimer(slot0:GetReloadTime())
	end
end

function slot6.EnterCoolDown(slot0)
	slot0._fireFXFlag = slot0._tmpData.fire_fx_loop_type

	slot0:AddCDTimer(slot0:GetReloadTime())
end

function slot6.UpdatePrecastArmor(slot0, slot1)
	if slot0._currentState ~= uv0.STATE_PRECAST or not slot0._precastArmor then
		return
	end

	slot0._precastArmor = slot0._precastArmor + slot1

	if slot0._precastArmor <= 0 then
		slot0:Interrupt()
	end
end

function slot6.Interrupt(slot0)
	slot1 = slot0._preCastInfo

	slot0:DispatchEvent(uv0.Event.New(uv0.Battle.BattleUnitEvent.WEAPON_PRE_CAST_FINISH, slot1))
	slot0:DispatchEvent(uv0.Event.New(uv0.Battle.BattleUnitEvent.WEAPON_INTERRUPT, slot1))
	slot0:RemovePrecastTimer()
	slot0:EnterCoolDown()
end

function slot6.DispatchGCD(slot0)
	if slot0._GCD > 0 then
		slot0._host:EnterGCD(slot0._GCD, slot0._tmpData.queue)
	end
end

function slot6.Clear(slot0)
	slot0:RemovePrecastTimer()

	if slot0._majorEmitterList then
		for slot4, slot5 in ipairs(slot0._majorEmitterList) do
			slot5:Destroy()
		end
	end

	for slot4, slot5 in ipairs(slot0._tempEmittersList) do
		for slot9, slot10 in ipairs(slot5) do
			slot10:Destroy()
		end
	end
end

function slot6.Dispose(slot0)
	uv0.EventDispatcher.DetachEventDispatcher(slot0)
	slot0:RemovePrecastTimer()

	slot0._dataProxy = nil
end

function slot6.AddCDTimer(slot0, slot1)
	slot0._currentState = slot0.STATE_OVER_HEAT
	slot0._CDstartTime = pg.TimeMgr.GetInstance():GetCombatTime()
	slot0._reloadRequire = slot1
end

function slot6.handleCoolDown(slot0)
	slot0._currentState = slot0.STATE_READY
	slot0._CDstartTime = nil
	slot0._jammingTime = 0
end

function slot6.OverHeat(slot0)
	slot0._currentState = slot0.STATE_OVER_HEAT
end

function slot6.RemovePrecastTimer(slot0)
	pg.TimeMgr.GetInstance():RemoveBattleTimer(slot0._precastTimer)
	slot0._host:SetWeaponPreCastBound(false)

	slot0._precastArmor = nil
	slot0._precastTimer = nil
end

function slot6.AddPreCastTimer(slot0)
	slot0._precastTimer = pg.TimeMgr.GetInstance():AddBattleTimer("weaponPrecastTimer", 0, slot0._preCastInfo.time, function ()
		uv0._currentState = uv0.STATE_PRECAST_FINISH

		uv0:RemovePrecastTimer()
		uv0:DispatchEvent(uv1.Event.New(uv1.Battle.BattleUnitEvent.WEAPON_PRE_CAST_FINISH, uv0._preCastInfo))
		uv0:Tracking()
	end, true)
end

function slot6.Spawn(slot0, slot1, slot2)
	slot3 = nil
	slot4 = slot0._dataProxy:CreateBulletUnit(slot1, slot0._host, slot0, (slot2 ~= nil or Vector3.zero) and slot2:GetPosition())

	slot0:setBulletSkin(slot4, slot1)
	slot0:TriggerBuffWhenSpawn(slot4)

	return slot4
end

function slot6.FixAmmo(slot0, slot1)
	slot0._fixedAmmo = slot1
end

function slot6.GetFixAmmo(slot0)
	return slot0._fixedAmmo
end

function slot6.ShiftBullet(slot0, slot1)
	slot2 = {}

	for slot6 = 1, #slot0._bulletList, 1 do
		slot2[slot6] = slot1
	end

	slot0._bulletList = slot2
end

function slot6.RevertBullet(slot0)
	slot0._bulletList = slot0._tmpData.bullet_ID
end

function slot6.GetPrimalAmmoType(slot0)
	return uv0.GetBulletTmpDataFromID(slot0._bulletList[1]).ammo_type
end

function slot6.TriggerBuffWhenSpawn(slot0, slot1, slot2)
	slot4._bullet = slot1
	slot4.equipIndex = slot0._equipmentIndex

	slot0._host:TriggerBuff(slot2 or uv0.BuffEffectType.ON_BULLET_CREATE, {})
end

function slot6.DispatchBulletEvent(slot0, slot1)
	slot3 = nil

	if slot0._fireFXFlag ~= 0 then
		slot3 = slot0._tmpData.fire_fx

		if slot0._fireFXFlag ~= -1 then
			slot0._fireFXFlag = slot0._fireFXFlag - 1
		end
	end

	slot4.spawnBound = slot2.spawn_bound
	slot4.bullet = slot1
	slot4.fireFxID = slot3

	slot0:DispatchEvent(uv0.Event.New(uv0.Battle.BattleUnitEvent.CREATE_BULLET, {}))
end

function slot6.DispatchFireEvent(slot0, slot1, slot2)
	slot3.target = slot1
	slot3.actionIndex = slot2

	slot0:DispatchEvent(uv0.Event.New(uv0.Battle.BattleUnitEvent.FIRE, {}))
end

function slot6.CheckAndShake(slot0)
	if slot0._tmpData.shakescreen == 1 then
		uv0.Battle.BattleCameraUtil.GetInstance():StartShake(pg.shake_template[uv1.ShakeType.FIRE])
	end
end

function slot6.GetBaseAngle(slot0)
	return slot0._baseAngle
end

function slot6.GetHost(slot0)
	return slot0._host
end

function slot6.GetPosition(slot0)
	return slot0._hostPos
end

function slot6.GetDirection(slot0)
	return slot0._host:GetDirection()
end

function slot6.GetCurrentState(slot0)
	return slot0._currentState
end

function slot6.GetReloadTime(slot0)
	if slot0._reloadMax ~= slot0._cacheReloadMax or slot0._host:GetAttr().loadSpeed ~= slot0._cacheHostReload then
		slot0._cacheReloadMax = slot0._reloadMax
		slot0._cacheHostReload = slot0._host:GetAttr().loadSpeed
		slot0._cacheReloadTime = uv0.ReloadTime(slot0._reloadMax, slot0._host:GetAttr())
	end

	return slot0._cacheReloadTime
end

function slot6.GetReloadFinishTimeStamp(slot0)
	return slot0._reloadRequire + slot0._CDstartTime + slot0._jammingTime
end

function slot6.StartJamming(slot0)
	slot0._jammingStartTime = pg.TimeMgr.GetInstance():GetCombatTime()
end

function slot6.JammingEliminate(slot0)
	if not slot0._jammingStartTime then
		return
	end

	slot0._jammingTime = pg.TimeMgr.GetInstance():GetCombatTime() - slot0._jammingStartTime
	slot0._jammingStartTime = nil
end

function slot6.FlushReloadMax(slot0, slot1)
	slot0._reloadMax = slot0._tmpData.reload_max * (slot1 or 1)
end

function slot6.AppendReloadFactor(slot0, slot1, slot2)
	slot0._reloadFacotrList[slot1] = slot2
end

function slot6.RemoveReloadFactor(slot0, slot1)
	if slot0._reloadFacotrList[slot1] then
		slot0._reloadFacotrList[slot1] = nil
	end
end

function slot6.GetReloadFactorList(slot0)
	return slot0._reloadFacotrList
end

function slot6.FlushReloadRequire(slot0)
	if not slot0._CDstartTime then
		return true
	end

	slot2 = pg.TimeMgr.GetInstance():GetCombatTime() - slot0._CDstartTime
	slot0._reloadRequire = slot2 + uv0.ReloadTime(slot0._reloadMax - uv0.CaclulateReloaded(slot2, uv0.CaclulateReloadAttr(slot0._reloadMax, slot0._reloadRequire)), slot0._host:GetAttr())
end

function slot6.GetMinimumRange(slot0)
	return slot0._minRangeSqr
end

function slot6.GetCorrectedDMG(slot0)
	return slot0._correctedDMG
end

function slot6.GetConvertedAtkAttr(slot0)
	return slot0._convertedAtkAttr
end

function slot6.IsReady(slot0)
	return slot0._currentState == slot0.STATE_READY
end
