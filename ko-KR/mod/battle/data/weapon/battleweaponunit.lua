ys = ys or {}
slot2 = ys.Battle.BattleFormulas
slot3 = ys.Battle.BattleConst.WeaponSuppressType
slot4 = ys.Battle.BattleConst.WeaponSearchType
slot5 = ys.Battle.BattleDataFunction
slot6 = class("BattleWeaponUnit")
ys.Battle.BattleWeaponUnit = slot6
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
	slot0.EventDispatcher.AttachEventDispatcher(slot0)

	slot0._currentState = slot0.STATE_READY
	slot0._equipmentIndex = -1
	slot0._dataProxy = slot0.Battle.BattleDataProxy.GetInstance()
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
		slot0._correctedDMG = slot0:WeaponDamagePreCorrection()
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
	slot0._correctedDMG = slot0:WeaponDamagePreCorrection()
	slot0._convertedAtkAttr = slot0:WeaponAtkAttrPreRatio()

	slot0:FlushReloadMax(1)
end

function slot6.createMajorEmitter(slot0, slot1, slot2, slot3, slot4, slot5)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-12, warpins: 2 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 14-15, warpins: 2 ---
	function slot6(slot0, slot1, slot2, slot3, slot4)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-29, warpins: 1 ---
		slot6 = slot0:Spawn(slot5, slot4, slot2.INTERNAL)

		slot6:SetOffsetPriority(slot3)
		slot6:SetShiftInfo(slot0, slot1)

		if slot0._tmpData.aim_type == slot3.WeaponAimType.AIM and slot4 ~= nil then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 32-43, warpins: 1 ---
			slot6:SetRotateInfo(slot4:GetCLDZCenterPosition(), slot0:GetBaseAngle(), slot2)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 44-52, warpins: 2 ---
			slot6:SetRotateInfo(nil, slot0:GetBaseAngle(), slot2)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 53-58, warpins: 2 ---
		slot0:DispatchBulletEvent(slot6)

		return slot6
		--- END OF BLOCK #1 ---



	end

	function slot7()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 6-14, warpins: 0 ---
		for slot3, slot4 in ipairs(slot0._majorEmitterList) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-11, warpins: 1 ---
			if slot4:GetState() ~= slot4.STATE_STOP then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 12-12, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 13-14, warpins: 3 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 15-19, warpins: 1 ---
		slot0:EnterCoolDown()

		return
		--- END OF BLOCK #2 ---



	end

	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-6, warpins: 1 ---
		slot3 = slot0.EMITTER_NORMAL
		--- END OF BLOCK #0 ---



	end

	slot8 = slot2.Battle[slot3].New

	if not slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-13, warpins: 1 ---
		slot9 = slot6
		--- END OF BLOCK #0 ---



	end

	slot10 = slot5 or slot7
	slot0._majorEmitterList[#slot0._majorEmitterList + 1] = slot8(slot9, slot5 or slot7, slot1)

	return slot8(slot9, slot5 or slot7, slot1)

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #3 16-16, warpins: 1 ---
	slot10 = slot7
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 17-25, warpins: 2 ---
	--- END OF BLOCK #4 ---



end

function slot6.cacheSectorData(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-24, warpins: 1 ---
	slot0._upperEdge = math.deg2Rad * slot0:GetAttackAngle() / 2
	slot0._lowerEdge = -1 * slot0._upperEdge
	slot2 = math.deg2Rad * slot0._tmpData.axis_angle

	if slot0:GetDirection() == slot0.UnitDir.LEFT then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 25-29, warpins: 1 ---
		slot0._normalizeOffset = math.pi - slot2
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 30-37, warpins: 1 ---
		if slot0:GetDirection() == slot0.UnitDir.RIGHT then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 38-38, warpins: 1 ---
			slot0._normalizeOffset = slot2
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 39-62, warpins: 3 ---
	slot0._wholeCircle = math.pi - slot0._normalizeOffset
	slot0._negativeCircle = -math.pi - slot0._normalizeOffset
	slot0._wholeCircleNormalizeOffset = slot0._normalizeOffset - math.pi * 2
	slot0._negativeCircleNormalizeOffset = slot0._normalizeOffset + math.pi * 2

	return
	--- END OF BLOCK #1 ---



end

function slot6.cacheSquareData(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	slot0._frontRange = slot0._tmpData.angle
	slot0._backRange = slot0._tmpData.axis_angle
	slot0._upperRange = slot0._tmpData.min_range
	slot0._lowerRange = slot0._tmpData.range

	return
	--- END OF BLOCK #0 ---



end

function slot6.SetModelID(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	slot0._modelID = slot1

	return
	--- END OF BLOCK #0 ---



end

function slot6.SetSkinData(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	slot0._skinID = slot1

	slot0:SetModelID(slot0.GetEquipSkin(slot0._skinID))

	return
	--- END OF BLOCK #0 ---



end

function slot6.SetDerivateSkin(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	slot0._derivateSkinID = slot1
	slot2, slot0._derivateBullet, slot0._derivateTorpedo, slot0._derivateBoom = slot0.GetEquipSkin(slot0._derivateSkinID)

	return
	--- END OF BLOCK #0 ---



end

function slot6.GetSkinID(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return slot0._skinID
	--- END OF BLOCK #0 ---



end

function slot6.setBulletSkin(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0._derivateSkinID then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-13, warpins: 1 ---
		if slot0.GetBulletTmpDataFromID(slot2).type == slot1.BulletType.BOMB then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-18, warpins: 1 ---
			slot1:SetModleID(slot0._derivateBoom)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 19-23, warpins: 1 ---
			if slot3 == slot1.BulletType.TORPEDO then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 24-28, warpins: 1 ---
				slot1:SetModleID(slot0._derivateTorpedo)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 29-33, warpins: 1 ---
				slot1:SetModleID(slot0._derivateBullet)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 34-36, warpins: 1 ---
		if slot0._modelID then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 37-40, warpins: 1 ---
			slot1:SetModleID(slot0._modelID)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 41-41, warpins: 5 ---
	return
	--- END OF BLOCK #1 ---



end

function slot6.SetEquipmentIndex(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	slot0._equipmentIndex = slot1

	return
	--- END OF BLOCK #0 ---



end

function slot6.GetEquipmentIndex(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return slot0._equipmentIndex
	--- END OF BLOCK #0 ---



end

function slot6.SetHostData(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-16, warpins: 1 ---
	slot0._host = slot1
	slot0._hostUnitType = slot0._host:GetUnitType()
	slot0._hostIFF = slot1:GetIFF()

	if slot0._tmpData.search_type == slot0.SECTOR then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-24, warpins: 1 ---
		slot0:cacheSectorData()

		slot0.outOfFireRange = slot0.IsOutOfAngle
		slot0.IsOutOfFireArea = slot0.IsOutOfSector
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 25-30, warpins: 1 ---
		if slot0._tmpData.search_type == slot0.SQUARE then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 31-37, warpins: 1 ---
			slot0:cacheSquareData()

			slot0.outOfFireRange = slot0.IsOutOfSquare
			slot0.IsOutOfFireArea = slot0.IsOutOfSquare
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 38-45, warpins: 3 ---
	if slot0:GetDirection() == slot1.UnitDir.RIGHT then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 46-48, warpins: 1 ---
		slot0._baseAngle = 0
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 49-50, warpins: 1 ---
		slot0._baseAngle = 180
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 51-51, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

function slot6.OverrideGCD(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	slot0._GCD = slot1

	return
	--- END OF BLOCK #0 ---



end

function slot6.updateMovementInfo(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot0._hostPos = slot0._host:GetPosition()

	return
	--- END OF BLOCK #0 ---



end

function slot6.GetWeaponId(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	return slot0._tmpData.id
	--- END OF BLOCK #0 ---



end

function slot6.GetTemplateData(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return slot0._tmpData
	--- END OF BLOCK #0 ---



end

function slot6.GetType(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	return slot0._tmpData.type
	--- END OF BLOCK #0 ---



end

function slot6.GetPotential(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if not slot0._potential then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		slot1 = 1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-5, warpins: 2 ---
	return slot1
	--- END OF BLOCK #1 ---



end

function slot6.IsAttacking(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	if slot0._currentState ~= slot0.STATE_ATTACK and slot0._currentState ~= slot0.STATE_PRECAST then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-11, warpins: 1 ---
		slot1 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-12, warpins: 2 ---
		slot1 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 13-13, warpins: 2 ---
	return slot1
	--- END OF BLOCK #1 ---



end

function slot6.Update(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot0:UpdateReload()

	if not slot0._diveEnabled then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-7, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-11, warpins: 2 ---
	if slot0._currentState == slot0.STATE_READY then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-20, warpins: 1 ---
		slot0:updateMovementInfo()

		if slot0._tmpData.suppress == slot0.SUPPRESSION or slot0:CheckPreCast() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 26-29, warpins: 2 ---
			if slot0._preCastInfo.time == nil or not slot0._hostOnEnemy then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 33-35, warpins: 2 ---
				slot0._currentState = slot0.STATE_PRECAST_FINISH
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 36-38, warpins: 1 ---
				slot0:PreCast()
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 39-42, warpins: 4 ---
	if slot0._currentState == slot0.STATE_PRECAST_FINISH then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 43-51, warpins: 1 ---
		slot0:updateMovementInfo()
		slot0:Fire(slot0:Tracking())
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 52-52, warpins: 2 ---
	return
	--- END OF BLOCK #3 ---



end

function slot6.CheckReloadTimeStamp(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0._CDstartTime then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-15, warpins: 1 ---
		if slot0:GetReloadFinishTimeStamp() > pg.TimeMgr.GetInstance():GetCombatTime() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-17, warpins: 1 ---
			slot1 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-18, warpins: 1 ---
			slot1 = true
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 19-19, warpins: 3 ---
	return slot1
	--- END OF BLOCK #1 ---



end

function slot6.UpdateReload(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0._CDstartTime and not slot0._jammingStartTime then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-18, warpins: 1 ---
		if slot0:GetReloadFinishTimeStamp() <= pg.TimeMgr.GetInstance():GetCombatTime() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 19-22, warpins: 1 ---
			slot0:handleCoolDown()
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 23-23, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 24-24, warpins: 4 ---
	return
	--- END OF BLOCK #1 ---



end

function slot6.CheckPreCast(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-10, warpins: 0 ---
	for slot4, slot5 in pairs(slot0:GetFilteredList()) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-8, warpins: 1 ---
		return true
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 9-10, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 11-12, warpins: 1 ---
	return false
	--- END OF BLOCK #2 ---



end

function slot6.ChangeDiveState(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	if slot0._host:GetOxyState() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-17, warpins: 1 ---
		slot1 = slot0._host:GetOxyState():GetWeaponType()

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 18-29, warpins: 0 ---
		for slot5, slot6 in ipairs(slot0._oxyList) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-24, warpins: 1 ---
			if table.contains(slot1, slot6) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 25-27, warpins: 1 ---
				slot0._diveEnabled = true

				return
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 28-29, warpins: 3 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 30-31, warpins: 1 ---
		slot0._diveEnabled = false
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 32-32, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot6.getTrackingHost(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return slot0._host
	--- END OF BLOCK #0 ---



end

function slot6.Tracking(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	if slot0.Battle.BattleAttr.GetCurrent(slot0._host, "TargetChoise") == "farthest" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-16, warpins: 1 ---
		return slot0:TrackingFarthest(slot0:GetFilteredList())
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-18, warpins: 1 ---
		if slot1 == "leastHP" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 19-25, warpins: 1 ---
			return slot0:TrackingLeastHP(slot0:GetFilteredList())
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 26-30, warpins: 1 ---
			if type(slot1) == "number" and slot1 > 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 34-41, warpins: 1 ---
				return slot0:TrackingModelID(slot0:GetFilteredList(), slot1)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 42-43, warpins: 2 ---
				if slot1 == 0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 44-50, warpins: 1 ---
					return slot0:TrackingNearest(slot0:GetFilteredList())
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 51-57, warpins: 1 ---
					return slot0:TrackingTag(slot0:GetFilteredList(), slot1)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 58-58, warpins: 5 ---
	return
	--- END OF BLOCK #1 ---



end

function slot6.GetFilteredList(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	slot1 = slot0:FilterTarget()

	if slot0._tmpData.search_type == slot0.SECTOR then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-20, warpins: 1 ---
		slot1 = slot0:FilterAngle(slot0:FilterRange(slot1))
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 21-26, warpins: 1 ---
		if slot0._tmpData.search_type == slot0.SQUARE then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 27-31, warpins: 1 ---
			slot1 = slot0:FilterSquare(slot1)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 32-32, warpins: 3 ---
	return slot1
	--- END OF BLOCK #1 ---



end

function slot6.FixWeaponRange(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-4, warpins: 1 ---
		slot4 = slot0._tmpData.range
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-7, warpins: 2 ---
	slot0._maxRangeSqr = slot4

	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-9, warpins: 1 ---
		slot4 = slot0._tmpData.min_range
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 10-12, warpins: 2 ---
	slot0._minRangeSqr = slot4
	slot0._fixBulletRange = slot2

	return
	--- END OF BLOCK #2 ---



end

function slot6.GetFixBulletRange(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return slot0._fixBulletRange
	--- END OF BLOCK #0 ---



end

function slot6.TrackingNearest(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot2 = slot0._maxRangeSqr
	slot3 = nil

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-19, warpins: 0 ---
	for slot7, slot8 in ipairs(slot1) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-15, warpins: 1 ---
		if slot0:getTrackingHost():GetDistance(slot8) <= slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-17, warpins: 1 ---
			slot2 = slot9
			slot3 = slot8
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 18-19, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 20-20, warpins: 1 ---
	return slot3
	--- END OF BLOCK #2 ---



end

function slot6.TrackingFarthest(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot2 = 0
	slot3 = nil

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-19, warpins: 0 ---
	for slot7, slot8 in ipairs(slot1) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-15, warpins: 1 ---
		if slot2 < slot0:getTrackingHost():GetDistance(slot8) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-17, warpins: 1 ---
			slot2 = slot9
			slot3 = slot8
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 18-19, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 20-20, warpins: 1 ---
	return slot3
	--- END OF BLOCK #2 ---



end

function slot6.TrackingLeastHP(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot2 = math.huge
	slot3 = nil

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-16, warpins: 0 ---
	for slot7, slot8 in ipairs(slot1) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-12, warpins: 1 ---
		if slot8:GetCurrentHP() < slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-14, warpins: 1 ---
			slot3 = slot8
			slot2 = slot9
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 15-16, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 17-17, warpins: 1 ---
	return slot3
	--- END OF BLOCK #2 ---



end

function slot6.TrackingModelID(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot3 = nil

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-13, warpins: 0 ---
	for slot7, slot8 in ipairs(slot1) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-10, warpins: 1 ---
		if slot8:GetTemplateID() == slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 11-11, warpins: 1 ---
			slot3 = slot8
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 12-13, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 14-14, warpins: 1 ---
	return slot3
	--- END OF BLOCK #2 ---



end

function slot6.TrackingRandom(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot2 = {}

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-12, warpins: 0 ---
	for slot6, slot7 in pairs(slot1) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-10, warpins: 1 ---
		table.insert(slot2, slot7)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 11-12, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 13-16, warpins: 1 ---
	slot3 = #slot2

	if #slot2 == 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-19, warpins: 1 ---
		return nil
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 20-25, warpins: 1 ---
		return slot2[math.random(#slot2)]
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 26-26, warpins: 2 ---
	return
	--- END OF BLOCK #3 ---



end

function slot6.TrackingTag(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot3 = {}

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-19, warpins: 0 ---
	for slot7, slot8 in ipairs(slot1) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-12, warpins: 1 ---
		if slot8:ContainsLabelTag({
			slot2
		}) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-17, warpins: 1 ---
			table.insert(slot3, slot8)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 18-19, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 20-22, warpins: 1 ---
	if #slot3 == 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 23-27, warpins: 1 ---
		return slot0:TrackingNearest(slot1)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 28-33, warpins: 1 ---
		return slot3[math.random(#slot3)]
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 34-34, warpins: 2 ---
	return
	--- END OF BLOCK #3 ---



end

function slot6.FilterTarget(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot1 = nil

	if slot0._hostIFF == slot0._dataProxy:GetFriendlyCode() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-14, warpins: 1 ---
		slot1 = slot0._dataProxy:GetFoeShipList()
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-19, warpins: 1 ---
		slot1 = slot0._dataProxy:GetFriendlyShipList()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 20-27, warpins: 2 ---
	slot2 = {}
	slot3 = 1
	slot4 = slot0._tmpData.search_condition

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 28-72, warpins: 0 ---
	for slot8, slot9 in pairs(slot1) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 28-37, warpins: 1 ---
		if not table.contains(slot4, slot9:GetCurrentOxyState()) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 38-38, warpins: 1 ---
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 39-44, warpins: 1 ---
			slot11 = true

			if slot10 == slot0.OXY_STATE.FLOAT then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 45-45, warpins: 1 ---
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 46-50, warpins: 1 ---
				if slot10 == slot0.OXY_STATE.DIVE and not slot9:IsRunMode() and not slot9:GetDiveDetected() and slot9:GetDiveInvisible() then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 66-66, warpins: 1 ---
					slot11 = false
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 67-68, warpins: 6 ---
			if slot11 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 69-70, warpins: 1 ---
				slot2[slot3] = slot9
				slot3 = slot3 + 1
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 71-72, warpins: 4 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 73-73, warpins: 1 ---
	return slot2
	--- END OF BLOCK #3 ---



end

function slot6.FilterAngle(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	if slot0:GetAttackAngle() >= 360 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-7, warpins: 1 ---
		return slot1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-11, warpins: 2 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 12-23, warpins: 0 ---
	for slot5 = #slot1, 1, -1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-17, warpins: 2 ---
		if slot0:IsOutOfAngle(slot1[slot5]) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-22, warpins: 1 ---
			table.remove(slot1, slot5)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 23-23, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 24-24, warpins: 1 ---
	return slot1
	--- END OF BLOCK #3 ---



end

function slot6.FilterRange(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-16, warpins: 0 ---
	for slot5 = #slot1, 1, -1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-10, warpins: 2 ---
		if slot0:IsOutOfRange(slot1[slot5]) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 11-15, warpins: 1 ---
			table.remove(slot1, slot5)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 16-16, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 17-17, warpins: 1 ---
	return slot1
	--- END OF BLOCK #2 ---



end

function slot6.FilterSquare(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-35, warpins: 1 ---
	slot6 = slot0.Battle.BattleTargetChoise.TargetWeightiest(slot0._host, nil, slot5)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 36-47, warpins: 0 ---
	for slot10 = #slot1, 1, -1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 36-41, warpins: 2 ---
		if slot0:IsOutOfSquare(slot1[slot10]) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 42-46, warpins: 1 ---
			table.remove(slot1, slot10)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 47-47, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 48-51, warpins: 1 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 52-64, warpins: 0 ---
	for slot10 = #slot1, 1, -1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 52-58, warpins: 2 ---
		if not table.contains(slot6, slot1[slot10]) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 59-63, warpins: 1 ---
			table.remove(slot1, slot10)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 64-64, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 65-65, warpins: 1 ---
	return slot1
	--- END OF BLOCK #4 ---



end

function slot6.GetAttackAngle(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	return slot0._tmpData.angle
	--- END OF BLOCK #0 ---



end

function slot6.IsOutOfAngle(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	if slot0:GetAttackAngle() >= 360 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-8, warpins: 1 ---
		return false
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-25, warpins: 2 ---
	if slot0._wholeCircle < math.atan2(slot1:GetPosition().z - slot0._hostPos.z, slot1.GetPosition().x - slot0._hostPos.x) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 26-28, warpins: 1 ---
		slot3 = slot3 + slot0._wholeCircleNormalizeOffset
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 29-31, warpins: 1 ---
		if slot3 < slot0._negativeCircle then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 32-34, warpins: 1 ---
			slot3 = slot3 + slot0._negativeCircleNormalizeOffset
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 35-36, warpins: 1 ---
			slot3 = slot3 + slot0._normalizeOffset
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 37-39, warpins: 3 ---
	if slot0._lowerEdge < slot3 and slot3 < slot0._upperEdge then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 43-45, warpins: 1 ---
		return false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 46-47, warpins: 2 ---
		return true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 48-48, warpins: 2 ---
	return
	--- END OF BLOCK #3 ---



end

function slot6.IsOutOfRange(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	if slot0._maxRangeSqr >= slot0:getTrackingHost():GetDistance(slot1) and slot2 >= slot0:GetMinimumRange() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-17, warpins: 1 ---
		slot3 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 18-18, warpins: 2 ---
		slot3 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 19-19, warpins: 2 ---
	return slot3
	--- END OF BLOCK #1 ---



end

function slot6.IsOutOfSector(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	if not slot0:IsOutOfRange(slot1) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-10, warpins: 1 ---
		slot2 = slot0:IsOutOfAngle(slot1)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-11, warpins: 2 ---
	return slot2
	--- END OF BLOCK #1 ---



end

function slot6.IsOutOfSquare(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-16, warpins: 1 ---
	slot3 = false
	slot4 = (slot1:GetPosition().x - slot0._hostPos.x) * slot0:GetDirection()

	if slot0._backRange < 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-19, warpins: 1 ---
		if slot4 > 0 and slot4 <= slot0._frontRange and math.abs(slot0._backRange) <= slot4 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 29-30, warpins: 1 ---
			slot3 = true
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 31-33, warpins: 1 ---
		if (slot4 > 0 and slot4 <= slot0._frontRange) or (slot4 < 0 and math.abs(slot4) < slot0._backRange) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 47-47, warpins: 2 ---
			slot3 = true
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 48-49, warpins: 7 ---
	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 50-52, warpins: 1 ---
		return true
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 53-54, warpins: 1 ---
		return false
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 55-55, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

function slot6.LockUnit(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot1:Tag(slot0)

	return
	--- END OF BLOCK #0 ---



end

function slot6.UnlockUnit(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot1:UnTag(slot0)

	return
	--- END OF BLOCK #0 ---



end

function slot6.GetLockRequiredTime(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return 0
	--- END OF BLOCK #0 ---



end

function slot6.PreCast(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	slot0._currentState = slot0.STATE_PRECAST

	slot0:AddPreCastTimer()

	if slot0._preCastInfo.armor then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-12, warpins: 1 ---
		slot0._precastArmor = slot0._preCastInfo.armor
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 13-32, warpins: 2 ---
	slot0._host:SetWeaponPreCastBound(true)
	slot0:DispatchEvent(slot0.Event.New(slot0.Battle.BattleUnitEvent.WEAPON_PRE_CAST, slot1))

	return
	--- END OF BLOCK #1 ---



end

function slot6.Fire(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	slot0:DispatchGCD()

	slot0._currentState = slot0.STATE_ATTACK

	if slot0._tmpData.action_index == "" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-14, warpins: 1 ---
		slot0:DoAttack(slot1)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-20, warpins: 1 ---
		slot0:DispatchFireEvent(slot1, slot0._tmpData.action_index)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 21-22, warpins: 2 ---
	return true
	--- END OF BLOCK #1 ---



end

function slot6.DoAttack(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if slot1 == nil or not slot1:IsAlive() or slot0:outOfFireRange(slot1) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-14, warpins: 3 ---
		slot1 = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 15-27, warpins: 2 ---
	slot2 = slot0:GetDirection()
	slot3 = slot0:GetAttackAngle()

	slot0:TriggerBuffOnSteday()

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 28-32, warpins: 0 ---
	for slot7, slot8 in ipairs(slot0._majorEmitterList) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 28-30, warpins: 1 ---
		slot8:Ready()
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 31-32, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 33-36, warpins: 1 ---
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 37-44, warpins: 0 ---
	for slot7, slot8 in ipairs(slot0._majorEmitterList) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 37-42, warpins: 1 ---
		slot8:Fire(slot1, slot2, slot3)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 43-44, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 45-57, warpins: 1 ---
	slot0.Battle.PlayBattleSFX(slot0._tmpData.fire_sfx)
	slot0:TriggerBuffOnFire()
	slot0:CheckAndShake()

	return
	--- END OF BLOCK #5 ---



end

function slot6.TriggerBuffOnSteday(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot0._host:TriggerBuff(slot0.BuffEffectType.ON_WEAPON_STEDAY, {
		equipIndex = slot0._equipmentIndex
	})

	return
	--- END OF BLOCK #0 ---



end

function slot6.TriggerBuffOnFire(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot0._host:TriggerBuff(slot0.BuffEffectType.ON_FIRE, {
		equipIndex = slot0._equipmentIndex
	})

	return
	--- END OF BLOCK #0 ---



end

function slot6.TriggerBuffOnReady(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-1, warpins: 1 ---
	return
	--- END OF BLOCK #0 ---



end

function slot6.UpdateCombo(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	if slot0._hostUnitType ~= slot0.UnitType.PLAYER_UNIT or not slot0._host:IsAlive() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-13, warpins: 2 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 14-17, warpins: 2 ---
	if #slot1 > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 18-22, warpins: 1 ---
		slot2 = 0

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 23-44, warpins: 0 ---
		for slot6, slot7 in ipairs(slot1) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 23-29, warpins: 1 ---
			if table.contains(slot0._comboIDList, slot7) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 30-30, warpins: 1 ---
				slot2 = slot2 + 1
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 31-42, warpins: 2 ---
			slot0._host:TriggerBuff(slot0.BuffEffectType.ON_COMBO, {
				equipIndex = slot0._equipmentIndex,
				matchUnitCount = slot2
			})

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 43-43, warpins: 2 ---
			break
			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 43-44, warpins: 1 ---
			--- END OF BLOCK #3 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 45-45, warpins: 2 ---
		slot0._comboIDList = slot1
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 46-46, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

function slot6.SingleFire(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot0._tempEmittersList[#slot0._tempEmittersList + 1] = {}

	if slot1 and slot1:IsAlive() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-14, warpins: 1 ---
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-15, warpins: 2 ---
		slot1 = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 16-17, warpins: 2 ---
	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 18-19, warpins: 1 ---
		slot2 = slot0.EMITTER_NORMAL
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 20-24, warpins: 2 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 25-40, warpins: 0 ---
	for slot7, slot8 in ipairs(slot0._tmpData.barrage_ID) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 25-38, warpins: 1 ---
		slot3[#slot3 + 1] = slot1.Battle[slot2].New(slot9, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-4, warpins: 1 ---
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 5-13, warpins: 0 ---
			for slot3, slot4 in ipairs(ipairs) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-10, warpins: 1 ---
				if slot4:GetState() ~= slot4.STATE_STOP then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 11-11, warpins: 1 ---
					return
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 12-13, warpins: 3 ---
				--- END OF BLOCK #1 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 14-17, warpins: 1 ---
			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 18-22, warpins: 0 ---
			for slot3, slot4 in ipairs(ipairs) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 18-20, warpins: 1 ---
				slot4:Destroy()
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 21-22, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end

			--- END OF BLOCK #3 ---

			FLOW; TARGET BLOCK #4



			-- Decompilation error in this vicinity:
			--- BLOCK #4 23-28, warpins: 1 ---
			slot0 = nil

			--- END OF BLOCK #4 ---

			FLOW; TARGET BLOCK #5



			-- Decompilation error in this vicinity:
			--- BLOCK #5 29-34, warpins: 0 ---
			for slot4, slot5 in ipairs(slot1._tempEmittersList) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 29-31, warpins: 1 ---
				if slot5 == slot0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 32-32, warpins: 1 ---
					slot0 = slot4
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 33-34, warpins: 3 ---
				--- END OF BLOCK #1 ---



			end

			--- END OF BLOCK #5 ---

			FLOW; TARGET BLOCK #6



			-- Decompilation error in this vicinity:
			--- BLOCK #6 35-47, warpins: 1 ---
			table.remove(slot1._tempEmittersList, slot0)

			slot0 = nil
			table.remove._fireFXFlag = slot1._tmpData.fire_fx_loop_type

			return
			--- END OF BLOCK #6 ---



		end, slot8)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 39-40, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 41-44, warpins: 1 ---
	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 45-59, warpins: 0 ---
	for slot7, slot8 in ipairs(slot3) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 45-57, warpins: 1 ---
		slot8:Ready()
		slot8:Fire(slot1, slot0:GetDirection(), slot0:GetAttackAngle())
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 58-59, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 60-64, warpins: 1 ---
	slot0:CheckAndShake()

	return
	--- END OF BLOCK #6 ---



end

function slot6.SetModifyInitialCD(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot0._modInitCD = true

	return
	--- END OF BLOCK #0 ---



end

function slot6.GetModifyInitialCD(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return slot0._modInitCD
	--- END OF BLOCK #0 ---



end

function slot6.InitialCD(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0._tmpData.initial_over_heat == 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-10, warpins: 1 ---
		slot0:AddCDTimer(slot0:GetReloadTime())
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-11, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot6.EnterCoolDown(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot0._fireFXFlag = slot0._tmpData.fire_fx_loop_type

	slot0:AddCDTimer(slot0:GetReloadTime())

	return
	--- END OF BLOCK #0 ---



end

function slot6.UpdatePrecastArmor(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	if slot0._currentState ~= slot0.STATE_PRECAST or not slot0._precastArmor then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-9, warpins: 2 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-16, warpins: 2 ---
	slot0._precastArmor = slot0._precastArmor + slot1

	if slot0._precastArmor <= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-19, warpins: 1 ---
		slot0:Interrupt()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 20-20, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

function slot6.Interrupt(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-34, warpins: 1 ---
	slot0:DispatchEvent(slot2)
	slot0:DispatchEvent(slot0.Event.New(slot0.Battle.BattleUnitEvent.WEAPON_INTERRUPT, slot1))
	slot0:RemovePrecastTimer()
	slot0:EnterCoolDown()

	return
	--- END OF BLOCK #0 ---



end

function slot6.DispatchGCD(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0._GCD > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-11, warpins: 1 ---
		slot0._host:EnterGCD(slot0._GCD, slot0._tmpData.queue)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-12, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot6.Clear(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot0:RemovePrecastTimer()

	if slot0._majorEmitterList then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-10, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 11-15, warpins: 0 ---
		for slot4, slot5 in ipairs(slot0._majorEmitterList) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 11-13, warpins: 1 ---
			slot5:Destroy()
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 14-15, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 16-19, warpins: 2 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 20-30, warpins: 0 ---
	for slot4, slot5 in ipairs(slot0._tempEmittersList) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 20-23, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 24-28, warpins: 0 ---
		for slot9, slot10 in ipairs(slot5) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 24-26, warpins: 1 ---
			slot10:Destroy()
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 27-28, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 29-30, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 31-31, warpins: 1 ---
	return
	--- END OF BLOCK #3 ---



end

function slot6.Dispose(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot0.EventDispatcher.DetachEventDispatcher(slot0)
	slot0:RemovePrecastTimer()

	slot0._dataProxy = nil

	return
	--- END OF BLOCK #0 ---



end

function slot6.AddCDTimer(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	slot0._currentState = slot0.STATE_OVER_HEAT
	slot0._CDstartTime = pg.TimeMgr.GetInstance():GetCombatTime()
	slot0._reloadRequire = slot1

	return
	--- END OF BLOCK #0 ---



end

function slot6.handleCoolDown(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot0._currentState = slot0.STATE_READY
	slot0._CDstartTime = nil
	slot0._jammingTime = 0

	return
	--- END OF BLOCK #0 ---



end

function slot6.OverHeat(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot0._currentState = slot0.STATE_OVER_HEAT

	return
	--- END OF BLOCK #0 ---



end

function slot6.RemovePrecastTimer(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-18, warpins: 1 ---
	pg.TimeMgr.GetInstance():RemoveBattleTimer(slot0._precastTimer)
	slot0._host:SetWeaponPreCastBound(false)

	slot0._precastArmor = nil
	slot0._precastTimer = nil

	return
	--- END OF BLOCK #0 ---



end

function slot6.AddPreCastTimer(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-17, warpins: 1 ---
	slot0._precastTimer = pg.TimeMgr.GetInstance():AddBattleTimer("weaponPrecastTimer", 0, slot0._preCastInfo.time, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-29, warpins: 1 ---
		slot0._currentState = slot0.STATE_PRECAST_FINISH

		slot0:RemovePrecastTimer()
		slot0:DispatchEvent(slot0.Event.New(slot1.Battle.BattleUnitEvent.WEAPON_PRE_CAST_FINISH, slot0))
		slot0:Tracking()

		return
		--- END OF BLOCK #0 ---



	end, true)

	return
	--- END OF BLOCK #0 ---



end

function slot6.Spawn(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot3 = nil

	if slot2 == nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-6, warpins: 1 ---
		slot3 = Vector3.zero
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-10, warpins: 1 ---
		slot3 = slot2:GetPosition()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-28, warpins: 2 ---
	slot4 = slot0._dataProxy:CreateBulletUnit(slot1, slot0._host, slot0, slot3)

	slot0:setBulletSkin(slot4, slot1)
	slot0:TriggerBuffWhenSpawn(slot4)

	return slot4
	--- END OF BLOCK #1 ---



end

function slot6.FixAmmo(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	slot0._fixedAmmo = slot1

	return
	--- END OF BLOCK #0 ---



end

function slot6.GetFixAmmo(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return slot0._fixedAmmo
	--- END OF BLOCK #0 ---



end

function slot6.ShiftBullet(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot2 = {}

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-8, warpins: 0 ---
	for slot6 = 1, #slot0._bulletList, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-8, warpins: 2 ---
		slot2[slot6] = slot1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 9-10, warpins: 1 ---
	slot0._bulletList = slot2

	return
	--- END OF BLOCK #2 ---



end

function slot6.RevertBullet(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot0._bulletList = slot0._tmpData.bullet_ID

	return
	--- END OF BLOCK #0 ---



end

function slot6.GetPrimalAmmoType(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	return slot0.GetBulletTmpDataFromID(slot0._bulletList[1]).ammo_type
	--- END OF BLOCK #0 ---



end

function slot6.TriggerBuffWhenSpawn(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-5, warpins: 1 ---
		slot3 = slot0.BuffEffectType.ON_BULLET_CREATE
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-16, warpins: 2 ---
	slot0._host:TriggerBuff(slot3, {
		_bullet = slot1,
		equipIndex = slot0._equipmentIndex
	})

	return
	--- END OF BLOCK #1 ---



end

function slot6.DispatchBulletEvent(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot2 = slot0._tmpData
	slot3 = nil

	if slot0._fireFXFlag ~= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-9, warpins: 1 ---
		slot3 = slot2.fire_fx

		if slot0._fireFXFlag ~= -1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-12, warpins: 1 ---
			slot0._fireFXFlag = slot0._fireFXFlag - 1
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 13-31, warpins: 3 ---
	slot0:DispatchEvent(slot0.Event.New(slot0.Battle.BattleUnitEvent.CREATE_BULLET, slot4))

	return
	--- END OF BLOCK #1 ---



end

function slot6.DispatchFireEvent(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-17, warpins: 1 ---
	slot0:DispatchEvent(slot0.Event.New(slot0.Battle.BattleUnitEvent.FIRE, slot3))

	return
	--- END OF BLOCK #0 ---



end

function slot6.CheckAndShake(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0._tmpData.shakescreen == 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-18, warpins: 1 ---
		slot0.Battle.BattleCameraUtil.GetInstance():StartShake(pg.shake_template[slot1.ShakeType.FIRE])
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 19-19, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot6.GetBaseAngle(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return slot0._baseAngle
	--- END OF BLOCK #0 ---



end

function slot6.GetHost(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return slot0._host
	--- END OF BLOCK #0 ---



end

function slot6.GetPosition(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return slot0._hostPos
	--- END OF BLOCK #0 ---



end

function slot6.GetDirection(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	return slot0._host:GetDirection()
	--- END OF BLOCK #0 ---



end

function slot6.GetCurrentState(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return slot0._currentState
	--- END OF BLOCK #0 ---



end

function slot6.GetReloadTime(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0._reloadMax ~= slot0._cacheReloadMax or slot0._host:GetAttr().loadSpeed ~= slot0._cacheHostReload then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-29, warpins: 2 ---
		slot0._cacheReloadMax = slot0._reloadMax
		slot0._cacheHostReload = slot0._host:GetAttr().loadSpeed
		slot0._cacheReloadTime = slot0.ReloadTime(slot0._reloadMax, slot0._host:GetAttr())
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 30-31, warpins: 2 ---
	return slot0._cacheReloadTime
	--- END OF BLOCK #1 ---



end

function slot6.GetReloadFinishTimeStamp(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	return slot0._reloadRequire + slot0._CDstartTime + slot0._jammingTime
	--- END OF BLOCK #0 ---



end

function slot6.StartJamming(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	slot0._jammingStartTime = pg.TimeMgr.GetInstance():GetCombatTime()

	return
	--- END OF BLOCK #0 ---



end

function slot6.JammingEliminate(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if not slot0._jammingStartTime then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-17, warpins: 2 ---
	slot0._jammingTime = pg.TimeMgr.GetInstance():GetCombatTime() - slot0._jammingStartTime
	slot0._jammingStartTime = nil

	return
	--- END OF BLOCK #1 ---



end

function slot6.FlushReloadMax(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot2 = slot0._tmpData.reload_max

	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-5, warpins: 1 ---
		slot1 = 1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-8, warpins: 2 ---
	slot0._reloadMax = slot2 * slot1

	return
	--- END OF BLOCK #1 ---



end

function slot6.AppendReloadFactor(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot0._reloadFacotrList[slot1] = slot2

	return
	--- END OF BLOCK #0 ---



end

function slot6.RemoveReloadFactor(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0._reloadFacotrList[slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-7, warpins: 1 ---
		slot0._reloadFacotrList[slot1] = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-8, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot6.GetReloadFactorList(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return slot0._reloadFacotrList
	--- END OF BLOCK #0 ---



end

function slot6.FlushReloadRequire(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if not slot0._CDstartTime then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-5, warpins: 1 ---
		return true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-37, warpins: 2 ---
	slot0._reloadRequire = pg.TimeMgr.GetInstance():GetCombatTime() - slot0._CDstartTime + slot0.ReloadTime(slot4, slot0._host:GetAttr())

	return
	--- END OF BLOCK #1 ---



end

function slot6.GetMinimumRange(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return slot0._minRangeSqr
	--- END OF BLOCK #0 ---



end

function slot6.GetCorrectedDMG(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return slot0._correctedDMG
	--- END OF BLOCK #0 ---



end

function slot6.GetConvertedAtkAttr(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return slot0._convertedAtkAttr
	--- END OF BLOCK #0 ---



end

function slot6.IsReady(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0._currentState ~= slot0.STATE_READY then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-6, warpins: 1 ---
		slot1 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-7, warpins: 1 ---
		slot1 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-8, warpins: 2 ---
	return slot1
	--- END OF BLOCK #1 ---



end

return
