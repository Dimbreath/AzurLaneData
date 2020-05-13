ys = ys or {}
slot0 = ys
slot1 = slot0.Battle.BattleEvent
slot2 = slot0.Battle.BattleFormulas
slot3 = slot0.Battle.BattleConst
slot4 = slot0.Battle.BattleConfig
slot5 = slot0.Battle.BattleDataFunction
slot6 = slot0.Battle.BattleAttr
slot7 = slot0.Battle.BattleVariable
slot8 = singletonClass("BattleDataProxy", slot0.MVC.Proxy)
slot0.Battle.BattleDataProxy = slot8
slot8.__name = "BattleDataProxy"

function slot8.Ctor(slot0)
	uv0.super.Ctor(slot0)
end

function slot8.InitBattle(slot0, slot1)
	slot0.Update = slot0.updateInit

	slot0:SetupCalculateDamage()
	slot0:SetupDamageKamikazeAir()
	slot0:SetupDamageKamikazeShip()
	slot0:SetupDamageCrush()
	uv0.Init()
	slot0:InitData(slot1)
	slot0:DispatchEvent(uv1.Event.New(uv2.STAGE_DATA_INIT_FINISH))
	slot0._cameraUtil:Initialize()
	slot0._cameraUtil:SetMapData(slot0:GetTotalBounds())
	slot0:InitUserShipsData(slot0._battleInitData.MainUnitList, slot0._battleInitData.VanguardUnitList, uv3.FRIENDLY_CODE, slot0._battleInitData.SubUnitList)
	slot0:InitUserAidData()
	slot0:SetSubmarinAidData()
	slot0._cameraUtil:SetFocusFleet(slot0:GetFleetByIFF(uv3.FRIENDLY_CODE))
	slot0:StatisticsInit(slot0._fleetList[uv3.FRIENDLY_CODE]:GetUnitList())
	slot0:SetFlagShipID(slot0:GetFleetByIFF(uv3.FRIENDLY_CODE):GetFlagShip())
	slot0:DispatchEvent(uv1.Event.New(uv2.COMMON_DATA_INIT_FINISH, {}))
end

function slot8.Start(slot0)
	slot0._startTimeStamp = pg.TimeMgr.GetInstance():GetCombatTime()
end

function slot8.TriggerBattleInitBuffs(slot0)
	for slot4, slot5 in pairs(slot0._fleetList) do
		for slot10, slot11 in ipairs(slot5:GetUnitList()) do
			slot11:TriggerBuff(uv0.BuffEffectType.ON_INIT_GAME)
		end
	end
end

function slot8.TirggerBattleStartBuffs(slot0)
	for slot4, slot5 in pairs(slot0._fleetList) do
		slot7 = slot5:GetScoutList()
		slot8 = slot7[1]
		slot9 = #slot7 > 1 and slot7[#slot7] or nil
		slot10 = #slot7 == 3 and slot7[2] or nil
		slot11 = slot5:GetMainList()
		slot12 = slot11[1]
		slot13 = slot11[2]
		slot14 = slot11[3]

		for slot18, slot19 in ipairs(slot5:GetUnitList()) do
			underscore.each(slot0._battleInitData.ChapterBuffIDs or {}, function (slot0)
				uv1:AddBuff(uv0.Battle.BattleBuffUnit.New(slot0))
			end)
			underscore.each(slot0._battleInitData.GlobalBuffIDs or {}, function (slot0)
				uv1:AddBuff(uv0.Battle.BattleBuffUnit.New(slot0))
			end)

			if slot0._battleInitData.MapAuraSkills then
				for slot23, slot24 in ipairs(slot0._battleInitData.MapAuraSkills) do
					slot19:AddBuff(uv0.Battle.BattleBuffUnit.New(slot24.id, slot24.level))
				end
			end

			if slot0._battleInitData.MapAidSkills then
				for slot23, slot24 in ipairs(slot0._battleInitData.MapAidSkills) do
					slot19:AddBuff(uv0.Battle.BattleBuffUnit.New(slot24.id, slot24.level))
				end
			end

			slot19:TriggerBuff(uv1.BuffEffectType.ON_START_GAME)

			if slot19 == slot12 then
				slot19:TriggerBuff(uv1.BuffEffectType.ON_FLAG_SHIP)
			elseif slot19 == slot13 then
				slot19:TriggerBuff(uv1.BuffEffectType.ON_UPPER_CONSORT)
			elseif slot19 == slot14 then
				slot19:TriggerBuff(uv1.BuffEffectType.ON_LOWER_CONSORT)
			elseif slot19 == slot8 then
				slot19:TriggerBuff(uv1.BuffEffectType.ON_LEADER)
			elseif slot19 == slot10 then
				slot19:TriggerBuff(uv1.BuffEffectType.ON_CENTER)
			elseif slot19 == slot9 then
				slot19:TriggerBuff(uv1.BuffEffectType.ON_REAR)
			end
		end
	end
end

function slot8.InitAllFleetUnitsWeaponCD(slot0)
	for slot4, slot5 in pairs(slot0._fleetList) do
		for slot10, slot11 in ipairs(slot5:GetUnitList()) do
			uv0.InitUnitWeaponCD(slot11)
		end
	end
end

function slot8.InitUnitWeaponCD(slot0)
	slot0:CheckWeaponInitial()
end

function slot8.GetInitData(slot0)
	return slot0._battleInitData
end

function slot8.GetDungeonData(slot0)
	return slot0._dungeonInfo
end

function slot8.InitData(slot0, slot1)
	slot0.FrameIndex = 1
	slot0._friendlyCode = 1
	slot0._foeCode = -1
	uv0.FRIENDLY_CODE = 1
	uv0.FOE_CODE = -1
	slot0._completelyRepress = false
	slot0._repressReduce = 1
	slot0._repressLevel = 0
	slot0._repressEnemyHpRant = 1
	slot0._friendlyShipList = {}
	slot0._foeShipList = {}
	slot0._friendlyAircraftList = {}
	slot0._foeAircraftList = {}
	slot0._fleetList = {}
	slot0._freeShipList = {}
	slot0._teamList = {}
	slot0._aidUnitList = {}
	slot0._unitList = {}
	slot0._unitCount = 0
	slot0._bulletList = {}
	slot0._bulletCount = 0
	slot0._aircraftList = {}
	slot0._aircraftCount = 0
	slot0._AOEList = {}
	slot0._AOECount = 0
	slot0._wallList = {}
	slot0._wallIndex = 0
	slot0._shelterList = {}
	slot0._shelterIndex = 0
	slot0._environmentList = {}
	slot0._environmentIndex = 0
	slot0._enemySubmarineCount = 0
	slot0._airFighterList = {}
	slot0._currentStageIndex = 1
	slot0._battleInitData = slot1
	slot0._expeditionID = slot1.StageTmpId
	slot0._expeditionTmp = pg.expedition_data_template[slot0._expeditionID]

	slot0:SetDungeonLevel(slot0._expeditionTmp.level)

	slot0._dungeonID = slot0._expeditionTmp.dungeon_id
	slot0._dungeonInfo = uv1.GetDungeonTmpDataByID(slot0._dungeonID)
	slot0._mapId = slot0._expeditionTmp.map_id
	slot0._commander = slot1.CommanderList or {}
	slot0._subCommander = slot1.SubCommanderList or {}
	slot0._commanderBuff = slot0.initCommanderBuff(slot0._commander)
	slot0._subCommanderBuff = slot0.initCommanderBuff(slot0._subCommander)

	if slot0._battleInitData.battleType == SYSTEM_SCENARIO and slot0._battleInitData.RepressInfo then
		slot2 = slot0._battleInitData.RepressInfo

		if slot2.repressMax <= slot2.repressCount then
			slot0._completelyRepress = true
		end

		slot0:SetRepressReduce(uv2.ChapterRepressReduce(slot2.repressReduce))

		slot0._repressLevel = slot2.repressLevel
		slot0._repressEnemyHpRant = slot2.repressEnemyHpRant
	end

	slot0._chapterWinningStreak = slot0._battleInitData.DefeatCount or 0

	slot0:InitStageData()

	slot0._cldSystem = uv3.Battle.BattleCldSystem.New(slot0)
	slot0._cameraUtil = uv3.Battle.BattleCameraUtil.GetInstance()

	slot0:initBGM()
end

function slot8.initBGM(slot0)
	slot0._initBGMList = {}
	slot0._otherBGMList = {}
	slot1 = {}
	slot2 = {}

	function slot3(slot0)
		for slot4, slot5 in ipairs(slot0) do
			slot6 = {}

			if slot5.skills then
				for slot10, slot11 in ipairs(slot5.skills) do
					table.insert(slot6, slot11)
				end
			end

			if slot5.equipment then
				for slot11, slot12 in ipairs(uv0.GetEquipSkill(slot5.equipment)) do
					slot6[slot12] = {
						level = 1,
						id = slot12
					}
				end
			end

			for slot11, slot12 in pairs(uv0.GetSongList(slot6).initList) do
				uv1[slot11] = true
			end

			for slot11, slot12 in pairs(slot7.otherList) do
				uv2[slot11] = true
			end
		end
	end

	slot3(slot0._battleInitData.MainUnitList)
	slot3(slot0._battleInitData.VanguardUnitList)
	slot3(slot0._battleInitData.SubUnitList)

	if slot0._battleInitData.RivalMainUnitList then
		slot3(slot0._battleInitData.RivalMainUnitList)
	end

	if slot0._battleInitData.RivalVanguardUnitList then
		slot3(slot0._battleInitData.RivalVanguardUnitList)
	end

	for slot7, slot8 in pairs(slot1) do
		table.insert(slot0._initBGMList, slot7)
	end

	for slot7, slot8 in pairs(slot2) do
		table.insert(slot0._otherBGMList, slot7)
	end
end

function slot8.initCommanderBuff(slot0)
	slot1 = {}

	for slot5, slot6 in ipairs(slot0) do
		for slot12, slot13 in ipairs(slot6[2]) do
			table.insert(slot1, {
				id = slot13,
				level = slot6[1]:getSkills()[1]:getLevel(),
				commander = slot7
			})
		end
	end

	return slot1
end

function slot8.InitStageData(slot0)
	slot0._currentStageData = slot0._dungeonInfo.stages[slot0._currentStageIndex]
	slot0._countDown = slot0._currentStageData.timeCount
	slot1 = slot0._currentStageData.totalArea
	slot0._totalLeftBound = slot1[1]
	slot0._totalRightBound = slot1[1] + slot1[3]
	slot0._totalUpperBound = slot1[2] + slot1[4]
	slot0._totalLowerBound = slot1[2]
	slot2 = slot0._currentStageData.playerArea
	slot0._leftZoneLeftBound = slot2[1]
	slot0._leftZoneRightBound = slot2[1] + slot2[3]
	slot0._leftZoneUpperBound = slot2[2] + slot2[4]
	slot0._leftZoneLowerBound = slot2[2]
	slot0._rightZoneLeftBound = slot0._leftZoneRightBound
	slot0._rightZoneRightBound = slot0._totalRightBound
	slot0._rightZoneUpperBound = slot0._leftZoneUpperBound
	slot0._rightZoneLowerBound = slot0._leftZoneLowerBound
	slot0._bulletUpperBound = slot0._totalUpperBound + 3
	slot0._bulletLowerBound = slot0._totalLowerBound - 10
	slot0._bulletLeftBound = slot0._totalLeftBound - 10
	slot0._bulletRightBound = slot0._totalRightBound + 10
end

function slot8.Clear(slot0)
	for slot4, slot5 in pairs(slot0._teamList) do
		slot0:KillNPCTeam(slot5)
	end

	slot0._teamList = nil

	for slot4, slot5 in pairs(slot0._bulletList) do
		slot0:RemoveBulletUnit(slot4)
	end

	slot0._bulletList = nil

	for slot4, slot5 in pairs(slot0._unitList) do
		slot0:KillUnit(slot4)
	end

	slot0._unitList = nil

	for slot4, slot5 in pairs(slot0._aircraftList) do
		slot0:KillAircraft(slot4)
	end

	slot0._aircraftList = nil

	for slot4, slot5 in pairs(slot0._fleetList) do
		slot5:Dispose()

		slot0._fleetList[slot4] = nil
	end

	slot0._fleetList = nil

	for slot4, slot5 in pairs(slot0._aidUnitList) do
		slot5:Dispose()
	end

	slot0._aidUnitList = nil

	for slot4, slot5 in pairs(slot0._environmentList) do
		slot0:RemoveEnvironment(slot5:GetUniqueID())
	end

	slot0._environmentList = nil

	for slot4, slot5 in pairs(slot0._AOEList) do
		slot0:RemoveAreaOfEffect(slot4)
	end

	slot0._AOEList = nil

	slot0._cldSystem:Dispose()

	slot0._cldSystem = nil
	slot0._dungeonInfo = nil
	slot0._flagShipUnit = nil
	slot0._friendlyShipList = nil
	slot0._foeShipList = nil
	slot0._friendlyAircraftList = nil
	slot0._foeAircraftList = nil
	slot0._fleetList = nil
	slot0._freeShipList = nil
	slot0._countDown = nil
	slot0._lastUpdateTime = nil
	slot0._statistics = nil
	slot0._battleInitData = nil
	slot0._currentStageData = nil

	slot0:ClearFormulas()
	uv0.ClearDungeonCfg(slot0._dungeonID)
end

function slot8.DeactiveProxy(slot0)
	slot0._state = nil

	slot0:Clear()
	uv0.Battle.BattleDataProxy.super.DeactiveProxy(slot0)
end

function slot8.InitUserShipsData(slot0, slot1, slot2, slot3, slot4)
	for slot8, slot9 in ipairs(slot2) do
		slot10 = slot0:SpawnVanguard(slot9, slot3)
	end

	for slot8, slot9 in ipairs(slot1) do
		slot10 = slot0:SpawnMain(slot9, slot3)
	end

	slot5 = slot0:GetFleetByIFF(slot3)

	if slot0._battleInitData.battleType == SYSTEM_SUBMARINE_RUN or slot6 == SYSTEM_SUB_ROUTINE then
		for slot10, slot11 in ipairs(slot4) do
			slot0:SpawnManualSub(slot11, slot3)
		end

		slot5:ShiftManualSub()
	else
		slot5:SetSubUnitData(slot4)
	end
end

function slot8.InitUserAidData(slot0)
	for slot4, slot5 in ipairs(slot0._battleInitData.AidUnitList) do
		slot7 = slot5.properties
		slot7.level = slot5.level
		slot7.formationID = uv0.FORMATION_ID
		slot7.id = slot5.id

		uv1.AttrFixer(slot0._battleInitData.battleType, slot7)

		slot9 = uv2.CreateBattleUnitData(slot0:GenerateUnitID(), uv3.UnitType.PLAYER_UNIT, uv0.FRIENDLY_CODE, slot5.tmpID, slot5.skinId, slot5.equipment, slot7, slot5.proficiency or {
			1,
			1,
			1
		}, slot0._completelyRepress, slot0._repressReduce, nil, slot5.baseList, slot5.preloasList)
		slot0._aidUnitList[slot9:GetUniqueID()] = slot9
	end
end

function slot8.SetSubmarinAidData(slot0)
	slot0:GetFleetByIFF(uv0.FRIENDLY_CODE):SetSubAidData(slot0._battleInitData.TotalSubAmmo, slot0._battleInitData.SubFlag)
end

function slot8.CelebrateVictory(slot0, slot1)
	slot2 = nil

	for slot6, slot7 in pairs((slot1 ~= slot0:GetFoeCode() or slot0._foeShipList) and slot0._friendlyShipList) do
		slot7:StateChange(uv0.Battle.UnitState.STATE_VICTORY)
	end
end

function slot8.GetVanguardBornCoordinate(slot0, slot1)
	if slot1 == uv0.FRIENDLY_CODE then
		return slot0._currentStageData.fleetCorrdinate
	elseif slot1 == uv0.FOE_CODE then
		return slot0._currentStageData.rivalCorrdinate
	end
end

function slot8.GetTotalBounds(slot0)
	return slot0._totalUpperBound, slot0._totalLowerBound, slot0._totalLeftBound, slot0._totalRightBound
end

function slot8.GetTotalRightBound(slot0)
	return slot0._totalRightBound
end

function slot8.GetTotalLowerBound(slot0)
	return slot0._totalLowerBound
end

function slot8.GetUnitBoundByIFF(slot0, slot1)
	if slot1 == uv0.FRIENDLY_CODE then
		return slot0._leftZoneUpperBound, slot0._leftZoneLowerBound, slot0._leftZoneLeftBound, uv0.MaxRight, uv0.MaxLeft, slot0._leftZoneRightBound
	elseif slot1 == uv0.FOE_CODE then
		return slot0._rightZoneUpperBound, slot0._rightZoneLowerBound, slot0._rightZoneLeftBound, slot0._rightZoneRightBound, slot0._rightZoneLeftBound, uv0.MaxRight
	end
end

function slot8.GetFleetBoundByIFF(slot0, slot1)
	if slot1 == uv0.FRIENDLY_CODE then
		return slot0._leftZoneUpperBound, slot0._leftZoneLowerBound, slot0._leftZoneLeftBound, slot0._leftZoneRightBound
	elseif slot1 == uv0.FOE_CODE then
		return slot0._rightZoneUpperBound, slot0._rightZoneLowerBound, slot0._rightZoneLeftBound, slot0._rightZoneRightBound
	end
end

function slot8.ShiftFleetBound(slot0, slot1, slot2)
	slot1:SetBound(slot0:GetFleetBoundByIFF(slot2))

	slot3, slot4, slot5, slot6, slot7, slot8 = slot0:GetUnitBoundByIFF(slot2)

	for slot13, slot14 in ipairs(slot1:GetScoutList()) do
		slot14:SetBound(slot3, slot4, slot5, slot6, slot7, slot8)
	end
end

function slot8.GetFleetByIFF(slot0, slot1)
	if slot0._fleetList[slot1] == nil then
		slot2 = uv0.Battle.BattleFleetVO.New(slot1)
		slot0._fleetList[slot1] = slot2

		slot2:SetBound(slot0:GetFleetBoundByIFF(slot1))
		slot2:SetTotalBound(slot0:GetTotalBounds())
		slot2:CalcSubmarineBaseLine(slot0._battleInitData.battleType)
	end

	return slot0._fleetList[slot1]
end

function slot8.GetAidUnit(slot0)
	return slot0._aidUnitList
end

function slot8.GetFleetList(slot0)
	return slot0._fleetList
end

function slot8.GetCommander(slot0)
	return slot0._commander
end

function slot8.GetStageInfo(slot0)
	return slot0._currentStageData
end

function slot8.GetWinningStreak(slot0)
	return slot0._chapterWinningStreak
end

function slot8.GetBGMList(slot0, slot1)
	if not slot1 then
		return slot0._initBGMList
	else
		return slot0._otherBGMList
	end
end

function slot8.GetDungeonLevel(slot0)
	return slot0._dungeonLevel
end

function slot8.SetDungeonLevel(slot0, slot1)
	slot0._dungeonLevel = slot1
end

function slot8.IsCompletelyRepress(slot0)
	return slot0._completelyRepress
end

function slot8.SetRepressReduce(slot0, slot1)
	slot0._repressReduce = slot1
end

function slot8.GetRepressLevel(slot0)
	return slot0._repressLevel
end

function slot8.updateInit(slot0, slot1)
	slot0:TriggerBattleInitBuffs()

	slot0.checkCld = true

	slot0:updateLoop(slot1)

	slot0.Update = slot0.updateLoop
end

function slot8.updateLoop(slot0, slot1)
	slot0.FrameIndex = slot0.FrameIndex + 1

	slot0:UpdateCountDown(slot1)

	for slot5, slot6 in pairs(slot0._fleetList) do
		slot6:UpdateMotion()
	end

	slot0.checkCld = not slot0.checkCld

	for slot5, slot6 in pairs(slot0._unitList) do
		if slot0.checkCld then
			slot0._cldSystem:UpdateShipCldTree(slot6)
		end

		if slot6:IsAlive() then
			slot6:Update(slot1)
		end
	end

	for slot5, slot6 in pairs(slot0._bulletList) do
		slot7 = slot6:GetSpeed()
		slot8 = slot6:GetPosition()
		slot9 = slot6:GetType()

		if slot6:GetOutBound() and (slot0._bulletRightBound < slot8.x and slot7.x > 0 or slot8.z < slot0._bulletLowerBound and slot7.z < 0) then
			slot0:RemoveBulletUnit(slot6:GetUniqueID())
		elseif slot8.x < slot0._bulletLeftBound and slot7.x < 0 and slot9 ~= uv0.BulletType.BOMB then
			slot0:RemoveBulletUnit(slot6:GetUniqueID())
		else
			slot6:Update(slot1)

			if slot6.GetCurrentState and slot6:GetCurrentState() == uv1.Battle.BattleShrapnelBulletUnit.STATE_SPLIT then
				-- Nothing
			elseif slot10 and slot0._bulletUpperBound < slot8.z and slot7.z > 0 or slot6:IsOutRange(slot1) then
				if slot6:GetExist() then
					slot6:OutRange()
				else
					slot0:RemoveBulletUnit(slot6:GetUniqueID())
				end
			elseif slot0.checkCld then
				slot0._cldSystem:UpdateBulletCld(slot6)
			end
		end
	end

	for slot5, slot6 in pairs(slot0._aircraftList) do
		slot6:Update(slot1)

		slot7, slot8 = slot6:GetIFF()

		if slot7 == uv2.FRIENDLY_CODE then
			slot8 = slot0._totalRightBound
		elseif slot7 == uv2.FOE_CODE then
			slot8 = slot0._totalLeftBound
		end

		if math.abs(slot8) < slot6:GetPosition().x * slot7 and slot6:GetSpeed().x * slot7 > 0 then
			slot6:OutBound()
		else
			slot0._cldSystem:UpdateAircraftCld(slot6)
		end

		if not slot6:IsAlive() then
			slot0:KillAircraft(slot6:GetUniqueID())
		end
	end

	for slot5, slot6 in pairs(slot0._AOEList) do
		slot0._cldSystem:UpdateAOECld(slot6)
		slot6:Settle()

		if slot6:GetActiveFlag() == false then
			slot6:SettleFinale()
			slot0:RemoveAreaOfEffect(slot6:GetUniqueID())
		end
	end

	for slot5, slot6 in pairs(slot0._environmentList) do
		slot6:Update()

		if slot6:IsExpire(slot1) then
			slot0:RemoveEnvironment(slot6:GetUniqueID())
		end
	end

	if slot0.checkCld then
		for slot5, slot6 in pairs(slot0._shelterList) do
			if not slot6:IsWallActive() then
				slot0:RemoveShelter(slot6:GetUniqueID())
			else
				slot6:Update(slot1)
			end
		end

		for slot5, slot6 in pairs(slot0._wallList) do
			if slot6:IsActive() then
				slot0._cldSystem:UpdateWallCld(slot6)
			end
		end
	end

	for slot5, slot6 in pairs(slot0._foeShipList) do
		if slot6:GetPosition().x + slot6:GetBoxSize().x < slot0._leftZoneLeftBound then
			slot6:SetDeathReason(uv0.UnitDeathReason.TOUCHDOWN)
			slot6:DeadAction()
			slot0:KillUnit(slot6:GetUniqueID())
			slot0:HandleShipMissDamage(slot6, slot0._fleetList[uv2.FRIENDLY_CODE])
		end
	end
end

function slot8.UpdateAutoComponent(slot0, slot1)
	for slot5, slot6 in pairs(slot0._fleetList) do
		slot6:UpdateAutoComponent(slot1)
	end

	for slot5, slot6 in pairs(slot0._teamList) do
		if slot6:IsFatalDamage() then
			slot0:KillNPCTeam(slot5)
		else
			slot6:UpdateMotion()
		end
	end

	for slot5, slot6 in pairs(slot0._freeShipList) do
		slot6:UpdateOxygen(slot1)
		slot6:UpdateWeapon(slot1)
		slot6:UpdatePhaseSwitcher()
	end
end

function slot8.UpdateEscapeOnly(slot0, slot1)
	for slot5, slot6 in pairs(slot0._foeShipList) do
		slot6:Update(slot1)
	end
end

function slot8.UpdateCountDown(slot0, slot1)
	slot0._lastUpdateTime = slot0._lastUpdateTime or slot1

	if slot0._countDown - (slot1 - slot0._lastUpdateTime) <= 0 then
		slot2 = 0
	end

	if math.floor(slot0._countDown - slot2) == 0 or slot2 == 0 then
		slot0:DispatchEvent(uv0.Event.New(uv1.UPDATE_COUNT_DOWN, {}))
	end

	slot0._countDown = slot2
	slot0._totalTime = slot1 - slot0._startTimeStamp
	slot0._lastUpdateTime = slot1
end

function slot8.SpawnMonster(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = slot0:GenerateUnitID()
	slot8 = {}

	for slot12, slot13 in ipairs(uv0.GetMonsterTmpDataFromID(slot1.monsterTemplateID).equipment_list) do
		slot8[#slot8 + 1] = {
			id = slot13
		}
	end

	slot10 = slot7.random_equipment_list

	if slot7.random_nub ~= nil and slot10 ~= nil then
		if slot9 > #slot10 then
			for slot14, slot15 in ipairs(slot10) do
				slot8[#slot8 + 1] = {
					id = slot15
				}
			end
		else
			for slot14 = 1, slot9 do
				slot15 = math.random(1, #slot10)
				slot8[#slot8 + 1] = {
					id = slot10[slot15]
				}

				table.remove(slot10, slot15)
			end
		end
	end

	slot11 = uv0.CreateBattleUnitData(slot6, slot3, slot4, slot1.monsterTemplateID, nil, slot8, slot1.extraInfo, nil, slot0._completelyRepress, slot0._repressReduce, slot0._repressEnemyHpRant, nil, )

	slot11:SetPosition(uv1.RandomPos(slot1.corrdinate))
	slot11:SetAI(slot1.pilotAITemplateID or slot7.pilot_ai_template_id)
	slot0:setShipUnitBound(slot11)

	if table.contains(TeamType.SubShipType, slot7.type) then
		slot11:InitOxygen()
		slot0:UpdateHostileSubmarine(true)
	end

	slot0._freeShipList[slot6] = slot11
	slot0._unitList[slot6] = slot11

	slot0._cldSystem:InitShipCld(slot11)
	slot11:SummonSickness(uv2.SUMMONING_SICKNESS_DURATION)
	slot11:SetMoveCast(slot1.moveCast == true)

	if slot11:GetIFF() == uv3.FRIENDLY_CODE then
		slot0._friendlyShipList[slot6] = slot11
	else
		slot0._foeShipList[slot6] = slot11

		slot11:SetWaveIndex(slot2)
	end

	if slot1.reinforce then
		slot11:Reinforce()
	end

	if slot1.reinforceDelay then
		slot11:SetReinforceCastTime(slot1.reinforceDelay)
	end

	if slot1.team then
		slot0:GetNPCTeam(slot1.team):AppendUnit(slot11)
	end

	if slot1.phase then
		uv4.Battle.BattleUnitPhaseSwitcher.New(slot11):SetTemplateData(slot1.phase)
	end

	if slot5 then
		slot5(slot11)
	end

	slot0:DispatchEvent(uv4.Event.New(uv5.ADD_UNIT, {
		type = slot3,
		unit = slot11,
		bossData = slot1.bossData,
		extraInfo = slot1.extraInfo
	}))

	for slot18, slot19 in ipairs(slot1.buffList or {}) do
		slot11:AddBuff(uv4.Battle.BattleBuffUnit.New(slot19))
	end

	slot15 = slot0._battleInitData.AffixBuffList or {}

	if slot1.affix then
		for slot19, slot20 in ipairs(slot15) do
			slot11:AddBuff(uv4.Battle.BattleBuffUnit.New(slot20))
		end
	end

	slot11:CheckWeaponInitial()
end

function slot8.UpdateHostileSubmarine(slot0, slot1)
	if slot1 then
		slot0._enemySubmarineCount = slot0._enemySubmarineCount + 1
	else
		slot0._enemySubmarineCount = slot0._enemySubmarineCount - 1
	end

	slot0:DispatchEvent(uv0.Event.New(uv1.UPDATE_HOSTILE_SUBMARINE, {
		count = slot0._enemySubmarineCount
	}))
end

function slot8.EnemyEscape(slot0)
	for slot4, slot5 in pairs(slot0._foeShipList) do
		slot5:SetAI(uv0.COUNT_DOWN_ESCAPE_AI_ID)
	end
end

function slot8.GetNPCTeam(slot0, slot1)
	if not slot0._teamList[slot1] then
		slot0._teamList[slot1] = uv0.Battle.BattleTeamVO.New(slot1)
	end

	return slot0._teamList[slot1]
end

function slot8.KillNPCTeam(slot0, slot1)
	if slot0._teamList[slot1] then
		slot2:Dispose()

		slot0._teamList[slot1] = nil
	end
end

function slot8.SpawnVanguard(slot0, slot1, slot2)
	slot4 = slot0:generatePlayerUnit(slot1, slot2, BuildVector3(slot0:GetVanguardBornCoordinate(slot2)), slot0._commanderBuff)

	slot0:GetFleetByIFF(slot2):AppendPlayerUnit(slot4)
	slot0._cldSystem:InitShipCld(slot4)
	slot0:DispatchEvent(uv1.Event.New(uv2.ADD_UNIT, {
		type = uv0.UnitType.PLAYER_UNIT,
		unit = slot4
	}))

	return slot4
end

function slot8.SpawnMain(slot0, slot1, slot2)
	slot3 = nil
	slot5 = #slot0:GetFleetByIFF(slot2):GetMainList() + 1
	slot6 = slot0:generatePlayerUnit(slot1, slot2, (not slot0._currentStageData.mainUnitPosition or not slot0._currentStageData.mainUnitPosition[slot2] or Clone(slot0._currentStageData.mainUnitPosition[slot2][slot5])) and Clone(uv0.MAIN_UNIT_POS[slot2][slot5]), slot0._commanderBuff)

	slot6:SetMainFleetUnit()
	slot4:AppendPlayerUnit(slot6)
	slot0._cldSystem:InitShipCld(slot6)
	slot0:DispatchEvent(uv2.Event.New(uv3.ADD_UNIT, {
		type = uv1.UnitType.PLAYER_UNIT,
		unit = slot6
	}))

	return slot6
end

function slot8.SpawnSub(slot0, slot1, slot2)
	slot3 = nil
	slot5 = #slot0:GetFleetByIFF(slot2):GetSubList() + 1
	slot6 = uv0.SUB_UNIT_OFFSET_X + (uv1.GetPlayerShipTmpDataFromID(slot1.tmpID).summon_offset or 0)
	slot7 = slot0:generatePlayerUnit(slot1, slot2, (slot2 ~= uv0.FRIENDLY_CODE or Vector3(slot6 + slot0._totalLeftBound, 0, uv0.SUB_UNIT_POS_Z[slot5])) and Vector3(slot0._totalRightBound - slot6, 0, uv0.SUB_UNIT_POS_Z[slot5]), slot0._subCommanderBuff)

	slot4:AddSubMarine(slot7)
	slot0._cldSystem:InitShipCld(slot7)
	slot0:DispatchEvent(uv3.Event.New(uv4.ADD_UNIT, {
		type = uv2.UnitType.PLAYER_UNIT,
		unit = slot7
	}))

	return slot7
end

function slot8.SpawnManualSub(slot0, slot1, slot2)
	slot4 = slot0:generatePlayerUnit(slot1, slot2, BuildVector3(slot0:GetVanguardBornCoordinate(slot2)), slot0._commanderBuff)

	slot0:GetFleetByIFF(slot2):AddManualSubmarine(slot4)
	slot0._cldSystem:InitShipCld(slot4)
	slot0:DispatchEvent(uv1.Event.New(uv2.ADD_UNIT, {
		type = uv0.UnitType.SUB_UNIT,
		unit = slot4
	}))

	return slot4
end

function slot8.ShutdownPlayerUnit(slot0, slot1)
	slot2 = slot0._unitList[slot1]
	slot4 = slot0:GetFleetByIFF(slot2:GetIFF())

	slot4:RemovePlayerUnit(slot2)

	if slot4:GetFleetAntiAirWeapon():GetRange() == 0 then
		-- Nothing
	end

	slot0:DispatchEvent(uv0.Event.New(uv1.ANTI_AIR_AREA, {
		isShow = false
	}))
	slot0:DispatchEvent(uv0.Event.New(uv1.SHUT_DOWN_PLAYER, {
		unit = slot2
	}))
end

function slot8.KillUnit(slot0, slot1)
	if slot0._unitList[slot1] == nil then
		return
	end

	slot3 = slot2:GetUnitType()

	slot0._cldSystem:DeleteShipCld(slot2)
	slot2:Clear()

	slot0._unitList[slot1] = nil

	if slot0._freeShipList[slot1] then
		slot0._freeShipList[slot1] = nil
	end

	slot5 = slot2:GetDeathReason()

	if slot2:GetIFF() == uv0.FOE_CODE then
		slot0._foeShipList[slot1] = nil

		if slot3 == uv1.UnitType.ENEMY_UNIT or slot3 == uv1.UnitType.BOSS_UNIT or slot3 == uv1.UnitType.NPC_UNIT then
			if slot2:GetTeam() then
				slot2:GetTeam():RemoveUnit(slot2)
			end

			if table.contains(TeamType.SubShipType, slot2:GetTemplate().type) then
				slot0:UpdateHostileSubmarine(false)
			end
		end
	elseif slot4 == uv0.FRIENDLY_CODE then
		slot0._friendlyShipList[slot1] = nil
	end

	slot0:DispatchEvent(uv2.Event.New(uv3.REMOVE_UNIT, {
		UID = slot1,
		type = slot3,
		deadReason = slot5,
		unit = slot2
	}))
	slot2:Dispose()
end

function slot8.KillAllEnemy(slot0)
	for slot4, slot5 in pairs(slot0._unitList) do
		if slot5:GetIFF() == uv0.FOE_CODE and slot5:IsAlive() and not slot5:IsBoss() then
			slot5:DeadAction()
		end
	end
end

function slot8.KillSubmarineByIFF(slot0, slot1)
	for slot5, slot6 in pairs(slot0._unitList) do
		if slot6:GetIFF() == slot1 and slot6:IsAlive() and table.contains(TeamType.SubShipType, slot6:GetTemplate().type) and not slot6:IsBoss() then
			slot6:DeadAction()
		end
	end
end

function slot8.KillAllAircraft(slot0)
	for slot4, slot5 in pairs(slot0._aircraftList) do
		slot5:Clear()
		slot0:DispatchEvent(uv0.Event.New(uv1.REMOVE_AIR_CRAFT, {
			UID = slot4
		}))

		slot0._aircraftList[slot4] = nil
	end
end

function slot8.IsThereBoss(slot0)
	for slot4, slot5 in pairs(slot0:GetUnitList()) do
		if slot5:IsBoss() and slot5:IsAlive() then
			return true
		end
	end

	return false
end

function slot8.setShipUnitBound(slot0, slot1)
	slot1:SetBound(slot0:GetUnitBoundByIFF(slot1:GetIFF()))
end

function slot8.generatePlayerUnit(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot0:GenerateUnitID()
	slot6 = slot1.properties
	slot6.level = slot1.level
	slot6.formationID = uv0.FORMATION_ID
	slot6.id = slot1.id

	uv1.AttrFixer(slot0._battleInitData.battleType, slot6)

	slot7 = slot1.proficiency or {
		1,
		1,
		1
	}
	slot8 = uv2.UnitType.PLAYER_UNIT

	if slot0._battleInitData.battleType == SYSTEM_SUBMARINE_RUN or slot9 == SYSTEM_SUB_ROUTINE then
		slot8 = uv2.UnitType.SUB_UNIT
	end

	slot10 = uv3.CreateBattleUnitData(slot5, slot8, slot2, slot1.tmpID, slot1.skinId, slot1.equipment, slot6, slot7, slot0._completelyRepress, slot0._repressReduce, nil, slot1.baseList, slot1.preloasList)

	slot10:InitCurrentHP(slot1.initHPRate or 1)
	slot10:SetRarity(slot1.rarity)
	slot10:SetIntimacy(slot1.intimacy)
	slot10:SetShipName(slot1.name)

	slot0._unitList[slot5] = slot10

	slot0:setShipUnitBound(slot10)

	if slot10:GetIFF() == uv0.FRIENDLY_CODE then
		slot0._friendlyShipList[slot5] = slot10
	elseif slot10:GetIFF() == uv0.FOE_CODE then
		slot0._foeShipList[slot5] = slot10
	end

	slot10:SetPosition(slot3)
	uv3.InitUnitSkill(slot1, slot10)
	uv3.InitEquipSkill(slot1.equipment, slot10)
	uv3.InitCommanderSkill(slot4, slot10)
	slot10:SetGearScore(slot1.shipGS)

	return slot10
end

function slot8.GetUnitList(slot0)
	return slot0._unitList
end

function slot8.GetFriendlyShipList(slot0)
	return slot0._friendlyShipList
end

function slot8.GetFoeShipList(slot0)
	return slot0._foeShipList
end

function slot8.GetFoeAircraftList(slot0)
	return slot0._foeAircraftList
end

function slot8.GetFreeShipList(slot0)
	return slot0._freeShipList
end

function slot8.GenerateUnitID(slot0)
	slot0._unitCount = slot0._unitCount + 1

	return slot0._unitCount
end

function slot8.GetCountDown(slot0)
	return slot0._countDown
end

function slot8.SpawnAirFighter(slot0, slot1)
	slot2 = #slot0._airFighterList + 1
	slot3 = uv0.GetFormationTmpDataFromID(slot1.formation).pos_offset
	slot4 = {
		currentNumber = 0,
		templateID = slot1.templateID,
		totalNumber = slot1.totalNumber or 0,
		onceNumber = slot1.onceNumber,
		timeDelay = slot1.interval or 3,
		maxTotalNumber = slot1.maxTotalNumber or 15
	}

	function slot5(slot0)
		if uv0.currentNumber < uv0.totalNumber then
			uv0.currentNumber = slot1 + 1
			slot2 = uv1:CreateAirFighter(uv2)

			slot2:SetFormationOffset(uv3[slot0])
			slot2:SetFormationIndex(slot0)
			slot2:SetDeadCallBack(function ()
				uv0.totalNumber = uv0.totalNumber - 1
				uv0.currentNumber = uv0.currentNumber - 1

				uv1:DispatchEvent(uv2.Event.New(uv3.REMOVE_AIR_FIGHTER_ICON, {
					index = uv4
				}))
			end)
			slot2:SetLiveCallBack(function ()
				uv0.currentNumber = uv0.currentNumber - 1
			end)
		end
	end

	slot0._airFighterList[slot2] = slot4

	slot0:DispatchEvent(uv1.Event.New(uv2.ADD_AIR_FIGHTER_ICON, {
		index = slot2
	}))

	slot4.timer = pg.TimeMgr.GetInstance():AddBattleTimer("striker", -1, slot1.interval, function ()
		slot0 = uv0.onceNumber

		if uv0.totalNumber > 0 then
			for slot4 = 1, slot0 do
				uv1(slot4)
			end
		else
			pg.TimeMgr.GetInstance():RemoveBattleTimer(uv0.timer)

			uv0.timer = nil
		end
	end)
end

function slot8.ClearAirFighterTimer(slot0)
	for slot4, slot5 in ipairs(slot0._airFighterList) do
		pg.TimeMgr.GetInstance():RemoveBattleTimer(slot5.timer)

		slot5.timer = nil
	end

	slot0._airFighterList = {}
end

function slot8.KillAllAirStrike(slot0)
	for slot4, slot5 in pairs(slot0._aircraftList) do
		if slot5.__name == uv0.Battle.BattleAirFighterUnit.__name then
			slot0._cldSystem:DeleteAircraftCld(slot5)

			slot5._aliveState = false
			slot0._aircraftList[slot4] = nil
			slot0._foeAircraftList[slot4] = nil

			slot0:DispatchEvent(uv0.Event.New(uv1.REMOVE_AIR_CRAFT, {
				UID = slot4
			}))
		end
	end

	slot1 = true

	for slot5, slot6 in pairs(slot0._foeAircraftList) do
		slot1 = false

		break
	end

	if slot1 then
		slot0:DispatchEvent(uv0.Event.New(uv1.ANTI_AIR_AREA, {
			isShow = false
		}))
	end

	for slot5, slot6 in ipairs(slot0._airFighterList) do
		slot6.totalNumber = 0

		slot0:DispatchEvent(uv0.Event.New(uv1.REMOVE_AIR_FIGHTER_ICON, {
			index = slot5
		}))
		pg.TimeMgr.GetInstance():RemoveBattleTimer(slot6.timer)

		slot6.timer = nil
	end

	slot0._airFighterList = {}
end

function slot8.GetAirFighterInfo(slot0, slot1)
	return slot0._airFighterList[slot1]
end

function slot8.CreateAircraft(slot0, slot1, slot2, slot3, slot4)
	slot6 = uv0.CreateAircraftUnit(slot0:GenerateAircraftID(), slot2, slot1, slot3)

	if slot4 then
		slot6:SetSkinID(slot4)
	end

	slot7 = nil

	slot0:doCreateAirUnit(slot5, slot6, uv2.UnitType.AIRCRAFT_UNIT, (slot1:GetIFF() ~= uv1.FRIENDLY_CODE or false) and true)

	return slot6
end

function slot8.CreateAirFighter(slot0, slot1)
	slot2 = slot0:GenerateAircraftID()
	slot3 = uv0.CreateAirFighterUnit(slot2, slot1)

	slot0:doCreateAirUnit(slot2, slot3, uv1.UnitType.AIRFIGHTER_UNIT, true)

	return slot3
end

function slot8.doCreateAirUnit(slot0, slot1, slot2, slot3, slot4)
	slot0._aircraftList[slot1] = slot2

	slot0._cldSystem:InitAircraftCld(slot2)
	slot2:SetBound(slot0._leftZoneUpperBound, slot0._leftZoneLowerBound)
	slot0:DispatchEvent(uv0.Event.New(uv1.ADD_UNIT, {
		unit = slot2,
		type = slot3
	}))

	if slot4 or false then
		slot0._foeAircraftList[slot1] = slot2

		slot0:DispatchEvent(uv0.Event.New(uv1.ANTI_AIR_AREA, {
			isShow = true
		}))
	end
end

function slot8.KillAircraft(slot0, slot1)
	if slot0._aircraftList[slot1] == nil then
		return
	end

	slot2:Clear()
	slot0._cldSystem:DeleteAircraftCld(slot2)

	if slot2:IsUndefeated() then
		slot0:HandleAircraftMissDamage(slot2, slot0._fleetList[slot2:GetIFF() * -1])
	end

	slot2._aliveState = false
	slot0._aircraftList[slot1] = nil
	slot0._foeAircraftList[slot1] = nil
	slot3 = true

	for slot7, slot8 in pairs(slot0._foeAircraftList) do
		slot3 = false

		break
	end

	if slot3 then
		slot0:DispatchEvent(uv0.Event.New(uv1.ANTI_AIR_AREA, {
			isShow = false
		}))
	end

	slot0:DispatchEvent(uv0.Event.New(uv1.REMOVE_AIR_CRAFT, {
		UID = slot1
	}))
end

function slot8.GetAircraftList(slot0)
	return slot0._aircraftList
end

function slot8.GenerateAircraftID(slot0)
	slot0._aircraftCount = slot0._aircraftCount + 1

	return slot0._aircraftCount
end

function slot8.CreateBulletUnit(slot0, slot1, slot2, slot3, slot4)
	slot6, slot7 = uv0.CreateBattleBulletData(slot0:GenerateBulletID(), slot1, slot2, slot3, slot4)

	if slot7 then
		slot0._cldSystem:InitBulletCld(slot6)
	end

	if slot3:GetFixBulletRange() then
		slot6:FixRange(slot8)
	end

	slot0._bulletList[slot5] = slot6

	return slot6
end

function slot8.RemoveBulletUnit(slot0, slot1)
	if slot0._bulletList[slot1] == nil then
		return
	end

	slot2:DamageUnitListWriteback()

	if slot2:GetIsCld() then
		slot0._cldSystem:DeleteBulletCld(slot2)
	end

	slot0._bulletList[slot1] = nil

	slot0:DispatchEvent(uv0.Event.New(uv1.REMOVE_BULLET, {
		UID = slot1
	}))
	slot2:Dispose()
end

function slot8.GetBulletList(slot0)
	return slot0._bulletList
end

function slot8.GenerateBulletID(slot0)
	slot1 = slot0._bulletCount + 1
	slot0._bulletCount = slot1

	return slot1
end

function slot8.CLSBullet(slot0, slot1)
	slot2 = true

	if slot0._battleInitData.battleType == SYSTEM_DUEL or slot3 == SYSTEM_SHAM and slot1 == uv0.FRIENDLY_CODE then
		slot2 = false
	end

	if slot2 then
		for slot7, slot8 in pairs(slot0._bulletList) do
			if slot8:GetIFF() == slot1 and slot8:GetExist() and not slot8:ImmuneCLS() then
				slot0:RemoveBulletUnit(slot7)
			end
		end
	end
end

function slot8.SpawnColumnArea(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
	slot10 = uv0.Battle.BattleAOEData.New(slot0:GenerateAreaID(), slot2, slot6, slot8)

	slot10:SetPosition(slot3)
	slot10:SetRange(slot4)
	slot10:SetAreaType(uv1.AreaType.COLUMN)
	slot10:SetLifeTime(slot5)
	slot10:SetFieldType(slot1)
	slot10:SetOpponentAffected(not (slot7 or false))
	slot0:CreateAreaOfEffect(slot10)
end

function slot8.SpawnCubeArea(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	slot11 = uv0.Battle.BattleAOEData.New(slot0:GenerateAreaID(), slot2, slot7, slot9)

	slot11:SetPosition(slot3)
	slot11:SetWidth(slot4)
	slot11:SetHeight(slot5)
	slot11:SetAreaType(uv1.AreaType.CUBE)
	slot11:SetLifeTime(slot6)
	slot11:SetFieldType(slot1)
	slot11:SetOpponentAffected(not (slot8 or false))
	slot0:CreateAreaOfEffect(slot11)
end

function slot8.SpawnLastingColumnArea(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10)
	slot12 = uv0.Battle.BattleLastingAOEData.New(slot0:GenerateAreaID(), slot2, slot6, slot7, slot10)

	slot12:SetPosition(slot3)
	slot12:SetRange(slot4)
	slot12:SetAreaType(uv1.AreaType.COLUMN)
	slot12:SetLifeTime(slot5)
	slot12:SetFieldType(slot1)
	slot12:SetOpponentAffected(not (slot8 or false))
	slot0:CreateAreaOfEffect(slot12)

	if slot9 and slot9 ~= "" then
		slot0:DispatchEvent(uv0.Event.New(uv2.ADD_AREA, {
			area = slot12,
			FXID = slot9
		}))
	end

	return slot12
end

function slot8.SpawnLastingCubeArea(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11)
	slot13 = uv0.Battle.BattleLastingAOEData.New(slot0:GenerateAreaID(), slot2, slot7, slot8, slot11)

	slot13:SetPosition(slot3)
	slot13:SetWidth(slot4)
	slot13:SetHeight(slot5)
	slot13:SetAreaType(uv1.AreaType.CUBE)
	slot13:SetLifeTime(slot6)
	slot13:SetFieldType(slot1)
	slot13:SetOpponentAffected(not (slot9 or false))
	slot0:CreateAreaOfEffect(slot13)

	if slot10 and slot10 ~= "" then
		slot0:DispatchEvent(uv0.Event.New(uv2.ADD_AREA, {
			area = slot13,
			FXID = slot10
		}))
	end

	return slot13
end

function slot8.SpawnAura(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot10 = uv0.Battle.BattleMobileAOEData.New(slot0:GenerateAreaID(), slot1:GetIFF(), slot4, slot5, slot6, slot1)

	slot10:SetPosition(slot1:GetPosition())
	slot10:SetRange(slot3)
	slot10:SetAreaType(uv1.AreaType.COLUMN)
	slot10:SetLifeTime(0)
	slot10:SetFieldType(slot2)
	slot10:SetOpponentAffected(true)
	slot0:CreateAreaOfEffect(slot10)

	return slot10
end

function slot8.CreateAreaOfEffect(slot0, slot1)
	slot0._AOEList[slot1:GetUniqueID()] = slot1

	slot0._cldSystem:InitAOECld(slot1)
	slot1:StartTimer()
end

function slot8.RemoveAreaOfEffect(slot0, slot1)
	if not slot0._AOEList[slot1] then
		return
	end

	slot2:Dispose()

	slot0._AOEList[slot1] = nil

	slot0._cldSystem:DeleteAOECld(slot2)
	slot0:DispatchEvent(uv0.Event.New(uv1.REMOVE_AREA, {
		id = slot1
	}))
end

function slot8.GetAOEList(slot0)
	return slot0._AOEList
end

function slot8.GenerateAreaID(slot0)
	slot0._AOECount = slot0._AOECount + 1

	return slot0._AOECount
end

function slot8.SpawnWall(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot0:GenerateWallID()
	slot6 = uv0.Battle.BattleWallData.New(slot5, slot1, slot2, slot3, slot4)
	slot0._wallList[slot5] = slot6

	slot0._cldSystem:InitWallCld(slot6)

	return slot6
end

function slot8.RemoveWall(slot0, slot1)
	slot0._wallList[slot1] = nil

	slot0._cldSystem:DeleteWallCld(slot0._wallList[slot1])
end

function slot8.SpawnShelter(slot0, slot1, slot2)
	slot3 = slot0:GernerateShelterID()
	slot4 = uv0.Battle.BattleShelterData.New(slot3)
	slot0._shelterList[slot3] = slot4

	return slot4
end

function slot8.RemoveShelter(slot0, slot1)
	slot0:DispatchEvent(uv0.Event.New(uv1.REMOVE_SHELTER, {
		uid = slot1
	}))
	slot0._shelterList[slot1]:Deactive()

	slot0._shelterList[slot1] = nil
end

function slot8.GetWallList(slot0)
	return slot0._wallList
end

function slot8.GenerateWallID(slot0)
	slot0._wallIndex = slot0._wallIndex + 1

	return slot0._wallIndex
end

function slot8.GernerateShelterID(slot0)
	slot0._shelterIndex = slot0._shelterIndex + 1

	return slot0._shelterIndex
end

function slot8.SpawnEnvironment(slot0, slot1)
	slot3 = uv0.Battle.BattleEnvironmentUnit.New(slot0:GernerateEnvironmentID(), uv1.FOE_CODE)

	slot3:SetTemplate(slot1)

	slot4 = slot3:GetBehaviours()
	slot5 = Vector3(slot1.coordinate[1], slot1.coordinate[2], slot1.coordinate[3])

	function slot6(slot0)
		slot1 = {}

		for slot5, slot6 in ipairs(slot0) do
			if slot6.Active then
				table.insert(slot1, uv0._unitList[slot6.UID])
			end
		end

		uv1:UpdateFrequentlyCollide(slot1)
	end

	function slot7()
	end

	function slot8()
	end

	slot9 = slot1.field_type or uv2.BulletField.SURFACE
	slot10 = slot1.IFF or uv1.FOE_CODE
	slot11 = 0
	slot12 = nil

	slot3:SetAOEData((#slot1.cld_data ~= 1 or slot0:SpawnLastingColumnArea(slot9, slot10, slot5, slot1.cld_data[1], slot11, slot6, slot7, false, slot1.prefab, slot8)) and slot0:SpawnLastingCubeArea(slot9, slot10, slot5, slot1.cld_data[1], slot1.cld_data[2], slot11, slot6, slot7, false, slot1.prefab, slot8))

	slot0._environmentList[slot2] = slot3
end

function slot8.RemoveEnvironment(slot0, slot1)
	slot2 = slot0._environmentList[slot1]

	slot0:RemoveAreaOfEffect(slot2:GetAOEData():GetUniqueID())
	slot2:Dispose()

	slot0._environmentList[slot1] = nil
end

function slot8.GetEnvironmentList(slot0)
	return slot0._environmentList
end

function slot8.GernerateEnvironmentID(slot0)
	slot0._environmentIndex = slot0._environmentIndex + 1

	return slot0._environmentIndex
end

function slot8.GetFriendlyCode(slot0)
	return slot0._friendlyCode
end

function slot8.GetFoeCode(slot0)
	return slot0._foeCode
end

function slot8.GetOppoSideCode(slot0)
	if slot0 == uv0.FRIENDLY_CODE then
		return uv0.FOE_CODE
	elseif slot0 == uv0.FOE_CODE then
		return uv0.FRIENDLY_CODE
	end
end

function slot8.GetStatistics(slot0)
	return slot0._statistics
end

function slot8.BlockManualCast(slot0, slot1)
	for slot6, slot7 in pairs(slot0._fleetList) do
		slot7:SetWeaponBlock(slot1 and 1 or -1)
	end
end

function slot8.SubmarineStrike(slot0, slot1)
	if slot0:GetFleetByIFF(slot1):GetWeaponBlock() then
		return
	end

	for slot7, slot8 in ipairs(slot2:GetSubUnitData()) do
		slot0:InitAidUnitStatistics(slot0:SpawnSub(slot8, slot1))
	end

	slot2:SubWarcry()

	for slot8, slot9 in ipairs(slot2:GetSubList()) do
		if slot8 == 1 then
			slot9:TriggerBuff(uv0.BuffEffectType.ON_SUB_LEADER)
		elseif slot8 == 2 then
			slot9:TriggerBuff(uv0.BuffEffectType.ON_UPPER_SUB_CONSORT)
		elseif slot8 == 3 then
			slot9:TriggerBuff(uv0.BuffEffectType.ON_LOWER_SUB_CONSORT)
		end
	end

	slot5 = slot4[1]

	slot2:GetSubAidVO():Cast()
end
