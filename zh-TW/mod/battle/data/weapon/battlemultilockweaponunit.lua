ys = ys or {}
slot1 = ys.Battle.BattleConst
slot2 = class("BattleMultiLockWeaponUnit", ys.Battle.BattleWeaponUnit)
ys.Battle.BattleMultiLockWeaponUnit = slot2
slot2.__name = "BattleMultiLockWeaponUnit"

function slot2.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function slot2.DispatchBlink(slot0, slot1)
	slot0:DispatchEvent(slot0.Event.New(slot0.Battle.BattleUnitEvent.CHARGE_WEAPON_FINISH, slot2))
end

function slot2.RemoveAllLock(slot0)
	for slot4, slot5 in ipairs(slot0._lockList) do
		slot0:UnlockUnit(slot5)
	end

	slot0._lockList = {}

	if slot0._currentLockUnit ~= nil then
		slot0:UnlockUnit(slot0._currentLockUnit)
	end

	slot0._currentLockUnit = nil
end

function slot2.SetTemplateData(slot0, slot1)
	slot0.super.SetTemplateData(slot0, slot1)

	slot0._maxLock = slot0._tmpData.charge_param.maxLock
	slot0._lockRequiredTime = slot0._tmpData.charge_param.lockTime
end

function slot2.SetHostData(slot0, slot1)
	slot0.super.SetHostData(slot0, slot1)

	slot0._calibrationHost = slot0._host
end

function slot2.createMajorEmitter(slot0, slot1, slot2)
	slot1.super.createMajorEmitter(slot0, slot1, slot2, slot1.EMITTER_NORMAL, function (slot0, slot1, slot2, slot3)
		slot0._lockList[#slot0._lockList] = nil

		if slot0._lockList[#slot0._lockList] == nil then
			return
		end

		slot6 = slot0:Spawn(slot5, slot4)

		slot6:SetOffsetPriority(slot3)
		slot6:SetShiftInfo(slot0, slot1)
		slot6:SetRotateInfo(slot4:GetPosition(), 0, 0)
		slot2.Battle.BattleVariable.AddExempt(slot6:GetSpeedExemptKey(), slot6:GetIFF(), slot2.Battle.BattleConfig.SPEED_FACTOR_FOCUS_CHARACTER)
		slot0:UnlockUnit(slot4)
		slot0:DispatchBulletEvent(slot6)
	end, function ()
		slot0:RemoveAllLock()
	end)
end

function slot2.SetPlayerChargeWeaponVO(slot0, slot1)
	slot0._playerChargeWeaponVo = slot1
end

function slot2.Charge(slot0)
	slot0._currentState = slot0.STATE_PRECAST
	slot0._lockList = {}

	slot0:DispatchEvent(slot0.Event.New(slot0.Battle.BattleUnitEvent.CHARGE_WEAPON_CHARGE, slot1))
end

function slot2.CancelCharge(slot0)
	if slot0._currentState ~= slot0.STATE_PRECAST then
		return
	end

	slot0:RemoveAllLock()

	slot0._currentState = slot0.STATE_READY

	slot0:DispatchEvent(slot0.Event.New(slot0.Battle.BattleUnitEvent.CHARGE_WEAPON_CANCEL, slot1))
end

function slot2.QuickTag(slot0)
	slot0._lockList = {}

	slot0:updateMovementInfo()

	slot1 = slot0:Tracking()

	while #slot0._lockList < slot0._maxLock and slot1 ~= nil do
		slot0._lockList[#slot0._lockList + 1] = slot1
		slot1 = slot0:Tracking()
	end
end

function slot2.CancelQuickTag(slot0)
	slot0._lockList = {}
end

function slot2.Update(slot0, slot1)
	if slot0._currentState ~= slot0.STATE_PRECAST then
		return
	end

	slot0:updateMovementInfo()
	slot0:UpdateLockList()

	if #slot0._lockList < slot0._maxLock then
		if slot0._currentLockUnit ~= nil then
			if slot0:IsOutOfAngle(slot0._currentLockUnit) or slot0:IsOutOfRange(slot0._currentLockUnit) or not slot0._currentLockUnit:IsAlive() then
				slot0:UnlockUnit(slot0._currentLockUnit)

				slot0._currentLockUnit = nil
				slot0._lockStartTime = nil
			elseif slot0._lockRequiredTime <= slot1 - slot0._lockStartTime then
				slot0._lockStartTime = nil
				slot0._lockList[#slot0._lockList + 1] = slot0._currentLockUnit
				slot0._currentLockUnit = nil
			end
		else
			if slot0:Tracking() == nil then
				return
			end

			slot0._currentLockUnit = slot2

			slot0:LockUnit(slot2)

			slot0._lockStartTime = slot1
		end
	end
end

function slot2.UpdateLockList(slot0)
	for slot4, slot5 in ipairs(slot0._lockList) do
		if not slot5:IsAlive() then
			slot0:UnlockUnit(slot5)
			slot0.Battle.BattlePlayerWeaponVO.deleteElementFromArray(slot5, slot0._lockList)
		end
	end
end

function slot2.DoAttack(slot0, slot1)
	slot0.Battle.PlayBattleSFX(slot0._tmpData.fire_sfx)
	slot0:DispatchEvent(slot0.Event.New(slot0.Battle.BattleUnitEvent.CHARGE_WEAPON_FIRE, {
		weapon = slot0
	}))

	slot3 = {}
	slot4 = #slot0._lockList

	while slot4 > 0 do
		slot3[#slot3 + 1] = slot0._lockList[slot4]
		slot4 = slot4 - 1
	end

	slot0._lockList = slot3

	for slot8, slot9 in ipairs(slot0._majorEmitterList) do
		slot9:Ready()
	end

	for slot8, slot9 in ipairs(slot0._majorEmitterList) do
		slot9:Fire(slot1, slot0:GetDirection(), slot0:GetAttackAngle())
		slot9:SetTimeScale(false)
	end

	slot0:EnterCoolDown()
	slot0:TriggerBuffOnFire()
	slot0.Battle.BattleCameraUtil.GetInstance():StartShake(pg.shake_template[slot1.ShakeType.FIRE])
end

function slot2.Spawn(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot3 = nil
	slot3 = (slot2 ~= nil or ((slot0:TrackingRandom(slot0:GetFilteredList()) ~= nil or Vector3.zero) and slot2:GetPosition())) and slot2:GetPosition()

	slot0:TriggerBuffWhenSpawn(slot0._dataProxy:CreateBulletUnit(slot1, slot0._host, slot0, (slot2 ~= nil or ((slot0.TrackingRandom(slot0.GetFilteredList()) ~= nil or Vector3.zero) and slot2.GetPosition())) and slot2.GetPosition()))

	return slot0._dataProxy.CreateBulletUnit(slot1, slot0._host, slot0, (slot2 ~= nil or ((slot0.TrackingRandom(slot0.GetFilteredList()) ~= nil or Vector3.zero) and slot2.GetPosition())) and slot2.GetPosition())

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-12, warpins: 1 ---
	if slot0:TrackingRandom(slot0:GetFilteredList()) == nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-15, warpins: 1 ---
		slot3 = Vector3.zero
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-20, warpins: 1 ---
		slot3 = slot2.GetPosition()

		if slot2.GetPosition() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 21-24, warpins: 1 ---
			slot3 = slot2.GetPosition()
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 25-37, warpins: 3 ---
	--- END OF BLOCK #2 ---



end

function slot2.TriggerBuffOnFire(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	slot0._host:TriggerBuff(slot0.BuffEffectType.ON_CHARGE_FIRE, {})

	return
	--- END OF BLOCK #0 ---



end

function slot2.InitialCD(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot0.super.InitialCD(slot0)
	slot0._playerChargeWeaponVo:Deduct(slot0)

	return
	--- END OF BLOCK #0 ---



end

function slot2.EnterCoolDown(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot0.super.EnterCoolDown(slot0)
	slot0._playerChargeWeaponVo:Deduct(slot0)

	return
	--- END OF BLOCK #0 ---



end

function slot2.GetLockRequiredTime(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return slot0._lockRequiredTime
	--- END OF BLOCK #0 ---



end

function slot2.GetMinAngle(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	return slot0:GetAttackAngle()
	--- END OF BLOCK #0 ---



end

function slot2.GetLockList(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return slot0._lockList
	--- END OF BLOCK #0 ---



end

function slot2.GetFilteredList(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-16, warpins: 1 ---
	return slot0:filterEnemyUnitType(slot0:filterTagCount(slot0.super.GetFilteredList(slot0)))
	--- END OF BLOCK #0 ---



end

function slot2.filterTagCount(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot2 = {}
	slot3 = slot0._maxLock

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-25, warpins: 0 ---
	for slot7, slot8 in ipairs(slot1) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-12, warpins: 1 ---
		if slot8:GetSingleWeaponTagCount(slot0) < slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-18, warpins: 1 ---
			slot3 = slot9
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 19-20, warpins: 1 ---
			if slot9 == slot3 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 21-23, warpins: 1 ---
				slot2[#slot2 + 1] = slot8
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 24-25, warpins: 4 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 26-26, warpins: 1 ---
	return slot2
	--- END OF BLOCK #2 ---



end

function slot2.filterEnemyUnitType(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot2 = {}
	slot3 = {}
	slot4 = 0

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-32, warpins: 0 ---
	for slot8, slot9 in ipairs(slot1) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-13, warpins: 1 ---
		if slot9:GetTemplate().battle_unit_type == nil then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-17, warpins: 1 ---
			slot3[#slot3 + 1] = slot9
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-19, warpins: 1 ---
			if slot4 < slot10 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 20-25, warpins: 1 ---
				slot4 = slot10
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 26-27, warpins: 1 ---
				if slot4 == slot10 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 28-30, warpins: 1 ---
					slot2[#slot2 + 1] = slot9
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 31-32, warpins: 5 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 33-36, warpins: 1 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 37-41, warpins: 0 ---
	for slot8, slot9 in ipairs(slot3) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 37-39, warpins: 1 ---
		slot2[#slot2 + 1] = slot9
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 40-41, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 42-42, warpins: 1 ---
	return slot2
	--- END OF BLOCK #4 ---



end

function slot2.AddCDTimer(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-30, warpins: 1 ---
	slot0:RemoveCDTimer()

	slot0._currentState = slot0.STATE_OVER_HEAT
	slot0._cdTimer = pg.TimeMgr.GetInstance():AddBattleTimer("weaponTimer", 0, slot1, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-18, warpins: 1 ---
		slot0._currentState = slot0.STATE_READY

		slot0._playerChargeWeaponVo:Plus(slot0._playerChargeWeaponVo.Plus)
		slot0._playerChargeWeaponVo.Plus:RemoveCDTimer()

		slot0._playerChargeWeaponVo.Plus.RemoveCDTimer._CDstartTime = nil

		return
		--- END OF BLOCK #0 ---



	end, true)
	slot0._CDstartTime = pg.TimeMgr.GetInstance():GetCombatTime()
	slot0._CDReloadTime = slot1

	return
	--- END OF BLOCK #0 ---



end

function slot2.QuickCoolDown(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0._currentState == slot0.STATE_OVER_HEAT then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-16, warpins: 1 ---
		slot0._currentState = slot0.STATE_READY

		slot0._playerChargeWeaponVo:PlusAndFirst(slot0)
		slot0:RemoveCDTimer()

		slot0._CDstartTime = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 17-17, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot2.getTrackingHost(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return slot0._calibrationHost
	--- END OF BLOCK #0 ---



end

function slot2.SetCalibrationHost(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	slot0._calibrationHost = slot1

	return
	--- END OF BLOCK #0 ---



end

function slot2.updateMovementInfo(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot0._hostPos = slot0._calibrationHost:GetPosition()

	return
	--- END OF BLOCK #0 ---



end

function slot2.GetMinimumRange(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0._calibrationHost ~= slot0._host then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-7, warpins: 1 ---
		return 0
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-12, warpins: 1 ---
		return slot0.super.GetMinimumRange(slot0)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 13-13, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

return
