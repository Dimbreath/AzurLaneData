ys = ys or {}
slot1 = ys.Battle.BattleEvent
slot2 = ys.Battle.BattleFormulas
slot3 = ys.Battle.BattleConst
slot4 = ys.Battle.BattleConfig
slot5 = ys.Battle.BattleDataFunction
slot6 = ys.Battle.BattleAttr
slot7 = ys.Battle.BattleVariable
slot8 = singletonClass("BattleDataProxy", ys.MVC.Proxy)
ys.Battle.BattleDataProxy = slot8
slot8.__name = "BattleDataProxy"

function slot8.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function slot8.InitBattle(slot0, slot1)
	slot0.Update = slot0.updateInit

	slot0:SetupCalculateDamage()
	slot0:SetupDamageKamikazeAir()
	slot0:SetupDamageKamikazeShip()
	slot0:SetupDamageCrush()
	slot0.Init()
	slot0:InitData(slot1)
	slot0:DispatchEvent(slot1.Event.New(slot2.STAGE_DATA_INIT_FINISH))
	slot0._cameraUtil:Initialize()
	slot0._cameraUtil:SetMapData(slot0:GetTotalBounds())
	slot0:InitUserShipsData(slot0._battleInitData.MainUnitList, slot0._battleInitData.VanguardUnitList, slot3.FRIENDLY_CODE, slot0._battleInitData.SubUnitList)
	slot0:SetSubmarinAidData()
	slot0._cameraUtil:SetFocusFleet(slot0:GetFleetByIFF(slot3.FRIENDLY_CODE))
	slot0:StatisticsInit(slot0._fleetList[slot3.FRIENDLY_CODE]:GetUnitList())
	slot0:SetFlagShipID(slot0:GetFleetByIFF(slot3.FRIENDLY_CODE):GetFlagShip())
	slot0:DispatchEvent(slot1.Event.New(slot2.COMMON_DATA_INIT_FINISH, {}))
end

function slot8.Start(slot0)
	slot0._startTimeStamp = pg.TimeMgr.GetInstance():GetCombatTime()
end

function slot8.TriggerBattleInitBuffs(slot0)
	for slot4, slot5 in pairs(slot0._fleetList) do
		for slot10, slot11 in ipairs(slot6) do
			slot11:TriggerBuff(slot0.BuffEffectType.ON_INIT_GAME)
		end
	end
end

function slot8.TirggerBattleStartBuffs(slot0)
	for slot4, slot5 in pairs(slot0._fleetList) do
		slot7 = slot5:GetFlagShip()
		slot8 = slot5:GetScoutList()
		slot9 = slot8[1]
		slot10 = slot8[#slot8]

		for slot14, slot15 in ipairs(slot6) do
			underscore.each(slot0._battleInitData.ChapterBuffIDs or {}, function (slot0)
				slot1:AddBuff(slot0.Battle.BattleBuffUnit.New(slot0))
			end)
			underscore.each(slot0._battleInitData.GlobalBuffIDs or {}, function (slot0)
				slot1:AddBuff(slot0.Battle.BattleBuffUnit.New(slot0))
			end)
			slot15:TriggerBuff(slot1.BuffEffectType.ON_START_GAME)

			if slot15 == slot7 then
				slot15:TriggerBuff(slot1.BuffEffectType.ON_FLAG_SHIP)
			elseif slot15 == slot9 then
				slot15:TriggerBuff(slot1.BuffEffectType.ON_LEADER)
			elseif slot15 == slot10 then
				slot15:TriggerBuff(slot1.BuffEffectType.ON_REAR)
			else
				slot15:TriggerBuff(slot1.BuffEffectType.ON_CONSORT)
			end
		end
	end
end

function slot8.InitAllFleetUnitsWeaponCD(slot0)
	for slot4, slot5 in pairs(slot0._fleetList) do
		for slot10, slot11 in ipairs(slot6) do
			slot0.InitUnitWeaponCD(slot11)
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
	slot0.FRIENDLY_CODE = 1
	slot0.FOE_CODE = -1
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
	slot0._dungeonInfo = slot1.GetDungeonTmpDataByID(slot0._dungeonID)
	slot0._mapId = slot0._expeditionTmp.map_id
	slot0._commander = slot1.CommanderList or {}
	slot0._subCommander = slot1.SubCommanderList or {}
	slot0._commanderBuff = slot0.initCommanderBuff(slot0._commander)
	slot0._subCommanderBuff = slot0.initCommanderBuff(slot0._subCommander)

	if slot0._battleInitData.battleType == SYSTEM_SCENARIO and slot0._battleInitData.RepressInfo then
		if slot0._battleInitData.RepressInfo.repressMax <= slot0._battleInitData.RepressInfo.repressCount then
			slot0._completelyRepress = true
		end

		slot0:SetRepressReduce(slot2.ChapterRepressReduce(slot2.repressReduce))

		slot0._repressLevel = slot2.repressLevel
		slot0._repressEnemyHpRant = slot2.repressEnemyHpRant
	end

	slot0._chapterWinningStreak = slot0._battleInitData.DefeatCount or 0

	slot0:InitStageData()

	slot0._cldSystem = slot3.Battle.BattleCldSystem.New(slot0)
	slot0._cameraUtil = slot3.Battle.BattleCameraUtil.GetInstance()

	slot0:initBGM()
end

function slot8.initBGM(slot0)
	slot0._initBGMList = {}
	slot0._otherBGMList = {}
	slot1 = {}
	slot2 = {}

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
		slot8 = slot6[1].getSkills(slot7)[1]:getLevel()

		for slot12, slot13 in ipairs(slot6[2]) do
			table.insert(slot1, {
				id = slot13,
				level = slot8,
				commander = slot7
			})
		end
	end

	return slot1
end

function slot8.InitStageData(slot0)
	slot0._currentStageData = slot0._dungeonInfo.stages[slot0._currentStageIndex]
	slot0._countDown = slot0._currentStageData.timeCount
	slot0._totalLeftBound = slot0._currentStageData.totalArea[1]
	slot0._totalRightBound = slot0._currentStageData.totalArea[1] + slot0._currentStageData.totalArea[3]
	slot0._totalUpperBound = slot0._currentStageData.totalArea[2] + slot0._currentStageData.totalArea[4]
	slot0._totalLowerBound = slot0._currentStageData.totalArea[2]
	slot0._leftZoneLeftBound = slot0._currentStageData.playerArea[1]
	slot0._leftZoneRightBound = slot0._currentStageData.playerArea[1] + slot0._currentStageData.playerArea[3]
	slot0._leftZoneUpperBound = slot0._currentStageData.playerArea[2] + slot0._currentStageData.playerArea[4]
	slot0._leftZoneLowerBound = slot0._currentStageData.playerArea[2]
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
	slot0.ClearDungeonCfg(slot0._dungeonID)
end

function slot8.DeactiveProxy(slot0)
	slot0._state = nil

	slot0:Clear()
	slot0.Battle.BattleDataProxy.super.DeactiveProxy(slot0)
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

function slot8.SetSubmarinAidData(slot0)
	slot0:GetFleetByIFF(slot0.FRIENDLY_CODE):SetSubAidData(slot0._battleInitData.TotalSubAmmo, slot0._battleInitData.SubFlag)
end

function slot8.CelebrateVictory(slot0, slot1)
	slot2 = nil
	slot2 = (slot1 ~= slot0:GetFoeCode() or slot0._foeShipList) and slot0._friendlyShipList

	for slot6, slot7 in pairs(slot2) do
		slot7:StateChange(slot0.Battle.UnitState.STATE_VICTORY)
	end
end

function slot8.GetVanguardBornCoordinate(slot0, slot1)
	if slot1 == slot0.FRIENDLY_CODE then
		return slot0._currentStageData.fleetCorrdinate
	elseif slot1 == slot0.FOE_CODE then
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
	if slot1 == slot0.FRIENDLY_CODE then
		return slot0._leftZoneUpperBound, slot0._leftZoneLowerBound, slot0._leftZoneLeftBound, slot0.MaxRight, slot0.MaxLeft, slot0._leftZoneRightBound
	elseif slot1 == slot0.FOE_CODE then
		return slot0._rightZoneUpperBound, slot0._rightZoneLowerBound, slot0._rightZoneLeftBound, slot0._rightZoneRightBound, slot0._rightZoneLeftBound, slot0.MaxRight
	end
end

function slot8.GetFleetBoundByIFF(slot0, slot1)
	if slot1 == slot0.FRIENDLY_CODE then
		return slot0._leftZoneUpperBound, slot0._leftZoneLowerBound, slot0._leftZoneLeftBound, slot0._leftZoneRightBound
	elseif slot1 == slot0.FOE_CODE then
		return slot0._rightZoneUpperBound, slot0._rightZoneLowerBound, slot0._rightZoneLeftBound, slot0._rightZoneRightBound
	end
end

function slot8.ShiftFleetBound(slot0, slot1, slot2)
	slot1:SetBound(slot0:GetFleetBoundByIFF(slot2))

	slot3, slot4, slot5, slot6, slot7, slot8 = slot0:GetUnitBoundByIFF(slot2)

	for slot13, slot14 in ipairs(slot9) do
		slot14:SetBound(slot3, slot4, slot5, slot6, slot7, slot8)
	end
end

function slot8.GetFleetByIFF(slot0, slot1)
	if slot0._fleetList[slot1] == nil then
		slot2 = slot0.Battle.BattleFleetVO.New(slot1)
		slot0._fleetList[slot1] = slot2

		slot2:SetBound(slot0:GetFleetBoundByIFF(slot1))
		slot2:SetTotalBound(slot0:GetTotalBounds())
		slot2:CalcSubmarineBaseLine(slot0._battleInitData.battleType)
	end

	return slot0._fleetList[slot1]
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

		if slot6:GetOutBound() and ((slot0._bulletRightBound < slot8.x and slot7.x > 0) or (slot8.z < slot0._bulletLowerBound and slot7.z < 0)) then
			slot0:RemoveBulletUnit(slot6:GetUniqueID())
		elseif slot8.x < slot0._bulletLeftBound and slot7.x < 0 and slot9 ~= slot0.BulletType.BOMB then
			slot0:RemoveBulletUnit(slot6:GetUniqueID())
		else
			slot6:Update(slot1)

			if slot6.GetCurrentState and slot6:GetCurrentState() == slot1.Battle.BattleShrapnelBulletUnit.STATE_SPLIT then
			elseif (slot10 and slot0._bulletUpperBound < slot8.z and slot7.z > 0) or slot6:IsOutRange(slot1) then
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

		if slot7 == slot2.FRIENDLY_CODE then
			slot8 = slot0._totalRightBound
		elseif slot7 == slot2.FOE_CODE then
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
			slot6:SetDeathReason(slot0.UnitDeathReason.TOUCHDOWN)
			slot6:DeadAction()
			slot0:KillUnit(slot6:GetUniqueID())
			slot0:HandleShipMissDamage(slot6, slot0._fleetList[slot2.FRIENDLY_CODE])
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
		slot0:DispatchEvent(slot0.Event.New(slot1.UPDATE_COUNT_DOWN, {}))
	end

	slot0._countDown = slot2
	slot0._totalTime = slot1 - slot0._startTimeStamp
	slot0._lastUpdateTime = slot1
end

function slot8.SpawnMonster(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = slot0:GenerateUnitID()
	slot8 = {}

	for slot12, slot13 in ipairs(slot0.GetMonsterTmpDataFromID(slot1.monsterTemplateID).equipment_list) do
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
			for slot14 = 1, slot9, 1 do
				slot8[#slot8 + 1] = {
					id = slot10[math.random(1, #slot10)]
				}

				table.remove(slot10, math.random(1, #slot10))
			end
		end
	end

	slot11 = slot0.CreateBattleUnitData(slot6, slot3, slot4, slot1.monsterTemplateID, nil, slot8, slot1.extraInfo, nil, slot0._completelyRepress, slot0._repressReduce, slot0._repressEnemyHpRant, nil, nil)

	slot11:SetPosition(slot12)
	slot11:SetAI(slot1.pilotAITemplateID or slot7.pilot_ai_template_id)
	slot0:setShipUnitBound(slot11)

	if table.contains(TeamType.SubShipType, slot7.type) then
		slot11:InitOxygen()
		slot0:UpdateHostileSubmarine(true)
	end

	slot0._freeShipList[slot6] = slot11
	slot0._unitList[slot6] = slot11

	slot0._cldSystem:InitShipCld(slot11)
	slot11:SummonSickness(slot2.SUMMONING_SICKNESS_DURATION)
	slot11:SetMoveCast(slot1.moveCast == true)

	if slot11:GetIFF() == slot3.FRIENDLY_CODE then
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
		slot4.Battle.BattleUnitPhaseSwitcher.New(slot11):SetTemplateData(slot1.phase)
	end

	if slot5 then
		slot5(slot11)
	end

	slot0:DispatchEvent(slot4.Event.New(slot5.ADD_UNIT, {
		type = slot3,
		unit = slot11,
		bossData = slot1.bossData,
		extraInfo = slot1.extraInfo
	}))

	slot14 = slot1.buffList or {}

	for slot18, slot19 in ipairs(slot14) do
		slot11:AddBuff(slot4.Battle.BattleBuffUnit.New(slot19))
	end

	slot15 = slot0._battleInitData.AffixBuffList or {}

	if slot1.affix then
		for slot19, slot20 in ipairs(slot15) do
			slot11:AddBuff(slot4.Battle.BattleBuffUnit.New(slot20))
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

	slot0:DispatchEvent(slot0.Event.New(slot1.UPDATE_HOSTILE_SUBMARINE, {
		count = slot0._enemySubmarineCount
	}))
end

function slot8.EnemyEscape(slot0)
	for slot4, slot5 in pairs(slot0._foeShipList) do
		slot5:SetAI(slot0.COUNT_DOWN_ESCAPE_AI_ID)
	end
end

function slot8.GetNPCTeam(slot0, slot1)
	if not slot0._teamList[slot1] then
		slot0._teamList[slot1] = slot0.Battle.BattleTeamVO.New(slot1)
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
	slot4 = slot0:generatePlayerUnit(slot1, slot2, BuildVector3(slot3), slot0._commanderBuff)

	slot0:GetFleetByIFF(slot2).AppendPlayerUnit(slot5, slot4)
	slot0._cldSystem:InitShipCld(slot4)
	slot0:DispatchEvent(slot1.Event.New(slot2.ADD_UNIT, {
		type = slot0.UnitType.PLAYER_UNIT,
		unit = slot4
	}))

	return slot4
end

function slot8.SpawnMain(slot0, slot1, slot2)
	slot3 = nil
	slot6 = slot0:generatePlayerUnit(slot1, slot2, (not slot0._currentStageData.mainUnitPosition or not slot0._currentStageData.mainUnitPosition[slot2] or Clone(slot0._currentStageData.mainUnitPosition[slot2][#slot0:GetFleetByIFF(slot2).GetMainList(slot4) + 1])) and Clone(slot0.MAIN_UNIT_POS[slot2][#slot0.GetFleetByIFF(slot2).GetMainList(slot4) + 1]), slot0._commanderBuff)

	slot6:SetMainFleetUnit()
	slot4:AppendPlayerUnit(slot6)
	slot0._cldSystem:InitShipCld(slot6)
	slot0:DispatchEvent(slot2.Event.New((not slot0._currentStageData.mainUnitPosition or not slot0._currentStageData.mainUnitPosition[slot2] or Clone(slot0._currentStageData.mainUnitPosition[slot2][#slot0.GetFleetByIFF(slot2).GetMainList(slot4) + 1])) and Clone(slot0.MAIN_UNIT_POS[slot2][#slot0.GetFleetByIFF(slot2).GetMainList(slot4) + 1]).ADD_UNIT, {
		type = slot1.UnitType.PLAYER_UNIT,
		unit = slot6
	}))

	return slot6
end

function slot8.SpawnSub(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-19, warpins: 1 ---
	slot3 = nil
	slot5 = #slot0:GetFleetByIFF(slot2).GetSubList(slot4) + 1
	slot6 = slot0.SUB_UNIT_OFFSET_X
	slot7 = slot1.GetPlayerShipTmpDataFromID(slot1.tmpID).summon_offset or 0
	slot7 = slot0:generatePlayerUnit(slot1, slot2, (slot2 ~= slot0.FRIENDLY_CODE or Vector3(slot6 + (slot1.GetPlayerShipTmpDataFromID(slot1.tmpID).summon_offset or 0) + slot0._totalLeftBound, 0, slot0.SUB_UNIT_POS_Z[slot5])) and Vector3(slot0._totalRightBound - (slot6 + (slot1.GetPlayerShipTmpDataFromID(slot1.tmpID).summon_offset or 0)), 0, slot0.SUB_UNIT_POS_Z[slot5]), slot0._subCommanderBuff)

	slot4:AddSubMarine(slot7)
	slot0._cldSystem:InitShipCld(slot7)
	slot0:DispatchEvent((slot2 ~= slot0.FRIENDLY_CODE or Vector3(slot6 + (slot1.GetPlayerShipTmpDataFromID(slot1.tmpID).summon_offset or 0) + slot0._totalLeftBound, 0, slot0.SUB_UNIT_POS_Z[slot5])) and Vector3(slot0._totalRightBound - (slot6 + (slot1.GetPlayerShipTmpDataFromID(slot1.tmpID).summon_offset or 0)), 0, slot0.SUB_UNIT_POS_Z[slot5]).Event.New(slot4.ADD_UNIT, {
		type = slot2.UnitType.PLAYER_UNIT,
		unit = slot7
	}))

	return slot7

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #1 20-20, warpins: 1 ---
	slot7 = 0
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 21-25, warpins: 2 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #3 26-35, warpins: 1 ---
	slot3 = Vector3(slot6 + (slot1.GetPlayerShipTmpDataFromID(slot1.tmpID).summon_offset or 0) + slot0._totalLeftBound, 0, slot0.SUB_UNIT_POS_Z[slot5])

	if Vector3(slot6 + (slot1.GetPlayerShipTmpDataFromID(slot1.tmpID).summon_offset or 0) + slot0._totalLeftBound, 0, slot0.SUB_UNIT_POS_Z[slot5]) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 36-44, warpins: 1 ---
		slot3 = Vector3(slot0._totalRightBound - (slot6 + (slot1.GetPlayerShipTmpDataFromID(slot1.tmpID).summon_offset or 0)), 0, slot0.SUB_UNIT_POS_Z[slot5])
		--- END OF BLOCK #0 ---



	end
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 45-77, warpins: 2 ---
	--- END OF BLOCK #4 ---



end

function slot8.SpawnManualSub(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-43, warpins: 1 ---
	slot4 = slot0:generatePlayerUnit(slot1, slot2, BuildVector3(slot3), slot0._commanderBuff)

	slot0:GetFleetByIFF(slot2).AddManualSubmarine(slot5, slot4)
	slot0._cldSystem:InitShipCld(slot4)
	slot0:DispatchEvent(slot1.Event.New(slot2.ADD_UNIT, {
		type = slot0.UnitType.SUB_UNIT,
		unit = slot4
	}))

	return slot4
	--- END OF BLOCK #0 ---



end

function slot8.ShutdownPlayerUnit(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-22, warpins: 1 ---
	slot4 = slot0:GetFleetByIFF(slot3)

	slot4:RemovePlayerUnit(slot2)

	slot5 = {}

	if slot4:GetFleetAntiAirWeapon():GetRange() == 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 23-24, warpins: 1 ---
		slot5.isShow = false
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 25-47, warpins: 2 ---
	slot0:DispatchEvent(slot0.Event.New(slot1.ANTI_AIR_AREA, slot5))
	slot0:DispatchEvent(slot0.Event.New(slot1.SHUT_DOWN_PLAYER, {
		unit = slot2
	}))

	return
	--- END OF BLOCK #1 ---



end

function slot8.KillUnit(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0._unitList[slot1] == nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-5, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-23, warpins: 2 ---
	slot3 = slot2:GetUnitType()

	slot0._cldSystem:DeleteShipCld(slot2)
	slot2:Clear()

	slot0._unitList[slot1] = nil

	if slot0._freeShipList[slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 24-26, warpins: 1 ---
		slot0._freeShipList[slot1] = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 27-36, warpins: 2 ---
	slot5 = slot2:GetDeathReason()

	if slot2:GetIFF() == slot0.FOE_CODE then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 37-44, warpins: 1 ---
		slot0._foeShipList[slot1] = nil

		if slot3 == slot1.UnitType.ENEMY_UNIT or slot3 == slot1.UnitType.BOSS_UNIT or slot3 == slot1.UnitType.NPC_UNIT then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 55-59, warpins: 3 ---
			if slot2:GetTeam() then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 60-66, warpins: 1 ---
				slot2:GetTeam():RemoveUnit(slot2)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 67-78, warpins: 2 ---
			if table.contains(TeamType.SubShipType, slot2:GetTemplate().type) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 79-83, warpins: 1 ---
				slot0:UpdateHostileSubmarine(false)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 84-87, warpins: 1 ---
		if slot4 == slot0.FRIENDLY_CODE then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 88-90, warpins: 1 ---
			slot0._friendlyShipList[slot1] = nil
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 91-109, warpins: 5 ---
	slot0:DispatchEvent(slot2.Event.New(slot3.REMOVE_UNIT, {
		UID = slot1,
		type = slot3,
		deadReason = slot5,
		unit = slot2
	}))
	slot2:Dispose()

	return
	--- END OF BLOCK #3 ---



end

function slot8.KillAllEnemy(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-26, warpins: 0 ---
	for slot4, slot5 in pairs(slot0._unitList) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-11, warpins: 1 ---
		if slot5:GetIFF() == slot0.FOE_CODE and slot5:IsAlive() and not slot5:IsBoss() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 22-24, warpins: 1 ---
			slot5:DeadAction()
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 25-26, warpins: 5 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 27-27, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

function slot8.KillSubmarineByIFF(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-35, warpins: 0 ---
	for slot5, slot6 in pairs(slot0._unitList) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-9, warpins: 1 ---
		if slot6:GetIFF() == slot1 and slot6:IsAlive() and table.contains(TeamType.SubShipType, slot6:GetTemplate().type) and not slot6:IsBoss() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 31-33, warpins: 1 ---
			slot6:DeadAction()
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 34-35, warpins: 6 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 36-36, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

function slot8.KillAllAircraft(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-24, warpins: 0 ---
	for slot4, slot5 in pairs(slot0._aircraftList) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-22, warpins: 1 ---
		slot5:Clear()
		slot0:DispatchEvent(slot0.Event.New(slot1.REMOVE_AIR_CRAFT, {
			UID = slot4
		}))

		slot0._aircraftList[slot4] = nil
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 23-24, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 25-25, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

function slot8.IsThereBoss(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-20, warpins: 0 ---
	for slot4, slot5 in pairs(slot0:GetUnitList()) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-11, warpins: 1 ---
		if slot5:IsBoss() and slot5:IsAlive() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 17-18, warpins: 1 ---
			return true
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 19-20, warpins: 4 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 21-22, warpins: 1 ---
	return false
	--- END OF BLOCK #2 ---



end

function slot8.setShipUnitBound(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot1:SetBound(slot0:GetUnitBoundByIFF(slot1:GetIFF()))

	return
	--- END OF BLOCK #0 ---



end

function slot8.generatePlayerUnit(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-20, warpins: 1 ---
	slot5 = slot0:GenerateUnitID()
	slot1.properties.level = slot1.level
	slot1.properties.formationID = slot0.FORMATION_ID
	slot1.properties.id = slot1.id

	slot1.AttrFixer(slot0._battleInitData.battleType, slot1.properties)

	if not slot1.proficiency then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 21-21, warpins: 1 ---
		slot7 = {
			1,
			1,
			1
		}
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 22-29, warpins: 2 ---
	slot8 = slot2.UnitType.PLAYER_UNIT

	if slot0._battleInitData.battleType == SYSTEM_SUBMARINE_RUN or slot9 == SYSTEM_SUB_ROUTINE then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 33-35, warpins: 2 ---
		slot8 = slot2.UnitType.SUB_UNIT
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 36-56, warpins: 2 ---
	slot12 = slot3.CreateBattleUnitData(slot5, slot8, slot2, slot1.tmpID, slot1.skinId, slot1.equipment, slot6, slot7, slot0._completelyRepress, slot0._repressReduce, nil, slot1.baseList, slot1.preloasList)
	slot11 = slot3.CreateBattleUnitData(slot5, slot8, slot2, slot1.tmpID, slot1.skinId, slot1.equipment, slot6, slot7, slot0._completelyRepress, slot0._repressReduce, nil, slot1.baseList, slot1.preloasList).InitCurrentHP

	if not slot1.initHPRate then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 57-57, warpins: 1 ---
		slot13 = 1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 58-83, warpins: 2 ---
	slot11(slot12, slot13)
	slot10:SetRarity(slot1.rarity)
	slot10:SetIntimacy(slot1.intimacy)
	slot10:SetShipName(slot1.name)

	slot0._unitList[slot5] = slot10

	slot0:setShipUnitBound(slot10)

	if slot10:GetIFF() == slot0.FRIENDLY_CODE then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 84-86, warpins: 1 ---
		slot0._friendlyShipList[slot5] = slot10
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 87-93, warpins: 1 ---
		if slot10:GetIFF() == slot0.FOE_CODE then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 94-95, warpins: 1 ---
			slot0._foeShipList[slot5] = slot10
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 96-119, warpins: 3 ---
	slot10:SetPosition(slot3)
	slot3.InitUnitSkill(slot1, slot10)
	slot3.InitEquipSkill(slot1.equipment, slot10)
	slot3.InitCommanderSkill(slot4, slot10)
	slot10:SetGearScore(slot1.shipGS)

	return slot10
	--- END OF BLOCK #4 ---



end

function slot8.GetUnitList(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return slot0._unitList
	--- END OF BLOCK #0 ---



end

function slot8.GetFriendlyShipList(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return slot0._friendlyShipList
	--- END OF BLOCK #0 ---



end

function slot8.GetFoeShipList(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return slot0._foeShipList
	--- END OF BLOCK #0 ---



end

function slot8.GetFoeAircraftList(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return slot0._foeAircraftList
	--- END OF BLOCK #0 ---



end

function slot8.GetFreeShipList(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return slot0._freeShipList
	--- END OF BLOCK #0 ---



end

function slot8.GenerateUnitID(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0._unitCount = slot0._unitCount + 1

	return slot0._unitCount
	--- END OF BLOCK #0 ---



end

function slot8.GetCountDown(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return slot0._countDown
	--- END OF BLOCK #0 ---



end

function slot8.SpawnAirFighter(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	slot2 = #slot0._airFighterList + 1
	slot3 = slot0.GetFormationTmpDataFromID(slot1.formation).pos_offset
	slot4 = {
		currentNumber = 0,
		templateID = slot1.templateID
	}

	if not slot1.totalNumber then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-15, warpins: 1 ---
		slot5 = 0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 16-21, warpins: 2 ---
	slot4.totalNumber = slot5
	slot4.onceNumber = slot1.onceNumber

	if not slot1.interval then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 22-22, warpins: 1 ---
		slot5 = 3
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 23-26, warpins: 2 ---
	slot4.timeDelay = slot5

	if not slot1.maxTotalNumber then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 27-27, warpins: 1 ---
		slot5 = 15
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 28-57, warpins: 2 ---
	slot4.maxTotalNumber = slot5

	function slot5(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		if slot0.currentNumber < slot0.totalNumber then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-31, warpins: 1 ---
			slot0.currentNumber = slot1 + 1
			slot2 = slot1:CreateAirFighter(slot1.CreateAirFighter)

			slot2:SetFormationOffset(slot3[slot0])
			slot2:SetFormationIndex(slot0)
			slot2:SetDeadCallBack(function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-24, warpins: 1 ---
				slot0.totalNumber = slot0.totalNumber - 1
				slot0.currentNumber = slot0.currentNumber - 1

				slot0.currentNumber - 1:DispatchEvent(slot2.Event.New(slot3.REMOVE_AIR_FIGHTER_ICON, {
					index = 
				}))

				return
				--- END OF BLOCK #0 ---



			end)
			slot2:SetLiveCallBack(function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-6, warpins: 1 ---
				slot0.currentNumber = slot0.currentNumber - 1

				return
				--- END OF BLOCK #0 ---



			end)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 32-32, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end

	slot0._airFighterList[slot2] = slot4

	slot0:DispatchEvent(slot1.Event.New(slot2.ADD_AIR_FIGHTER_ICON, {
		index = slot2
	}))

	slot4.timer = pg.TimeMgr.GetInstance():AddBattleTimer("striker", -1, slot1.interval, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		if slot0.totalNumber > 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-11, warpins: 1 ---
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 12-15, warpins: 0 ---
			for slot4 = 1, slot0, 1 do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 12-15, warpins: 2 ---
				slot1(slot4)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 16-16, warpins: 1 ---
			--- END OF BLOCK #2 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 17-28, warpins: 1 ---
			pg.TimeMgr.GetInstance():RemoveBattleTimer(slot0.timer)

			slot0.timer = nil
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 29-29, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end)

	return
	--- END OF BLOCK #3 ---



end

function slot8.ClearAirFighterTimer(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-16, warpins: 0 ---
	for slot4, slot5 in ipairs(slot0._airFighterList) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-14, warpins: 1 ---
		pg.TimeMgr.GetInstance():RemoveBattleTimer(slot5.timer)

		slot5.timer = nil
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 15-16, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 17-19, warpins: 1 ---
	slot0._airFighterList = {}

	return
	--- END OF BLOCK #2 ---



end

function slot8.KillAllAirStrike(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-38, warpins: 0 ---
	for slot4, slot5 in pairs(slot0._aircraftList) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-11, warpins: 1 ---
		if slot5.__name == slot0.Battle.BattleAirFighterUnit.__name then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 12-36, warpins: 1 ---
			slot0._cldSystem:DeleteAircraftCld(slot5)

			slot5._aliveState = false
			slot0._aircraftList[slot4] = nil
			slot0._foeAircraftList[slot4] = nil

			slot0:DispatchEvent(slot0.Event.New(slot1.REMOVE_AIR_CRAFT, {
				UID = slot4
			}))
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 37-38, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 39-43, warpins: 1 ---
	slot1 = true

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 44-47, warpins: 0 ---
	for slot5, slot6 in pairs(slot0._foeAircraftList) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 44-45, warpins: 1 ---
		slot1 = false

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 46-46, warpins: 1 ---
		break
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 46-47, warpins: 1 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 48-49, warpins: 2 ---
	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 50-59, warpins: 1 ---
		slot0:DispatchEvent(slot0.Event.New(slot1.ANTI_AIR_AREA, {
			isShow = false
		}))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 60-63, warpins: 2 ---
	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 64-88, warpins: 0 ---
	for slot5, slot6 in ipairs(slot0._airFighterList) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 64-86, warpins: 1 ---
		slot6.totalNumber = 0

		slot0:DispatchEvent(slot0.Event.New(slot1.REMOVE_AIR_FIGHTER_ICON, {
			index = slot5
		}))
		pg.TimeMgr.GetInstance():RemoveBattleTimer(slot6.timer)

		slot6.timer = nil
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 87-88, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 89-91, warpins: 1 ---
	slot0._airFighterList = {}

	return
	--- END OF BLOCK #7 ---



end

function slot8.GetAirFighterInfo(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	return slot0._airFighterList[slot1]
	--- END OF BLOCK #0 ---



end

function slot8.CreateAircraft(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	slot6 = slot0.CreateAircraftUnit(slot0:GenerateAircraftID(), slot2, slot1, slot3)

	if slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-16, warpins: 1 ---
		slot6:SetSkinID(slot4)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 17-24, warpins: 2 ---
	slot7 = nil

	if slot1:GetIFF() == slot1.FRIENDLY_CODE then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 25-25, warpins: 1 ---
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 26-26, warpins: 1 ---
		slot7 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 27-36, warpins: 2 ---
	slot0:doCreateAirUnit(slot5, slot6, slot2.UnitType.AIRCRAFT_UNIT, slot7)

	return slot6
	--- END OF BLOCK #2 ---



end

function slot8.CreateAirFighter(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-18, warpins: 1 ---
	slot0:doCreateAirUnit(slot0:GenerateAircraftID(), slot0.CreateAirFighterUnit(slot2, slot1), slot1.UnitType.AIRFIGHTER_UNIT, true)

	return slot0.CreateAirFighterUnit(slot2, slot1)
	--- END OF BLOCK #0 ---



end

function slot8.doCreateAirUnit(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-26, warpins: 1 ---
	slot0._aircraftList[slot1] = slot2

	slot0._cldSystem:InitAircraftCld(slot2)
	slot2:SetBound(slot0._leftZoneUpperBound, slot0._leftZoneLowerBound)
	slot0:DispatchEvent(slot0.Event.New(slot1.ADD_UNIT, {
		unit = slot2,
		type = slot3
	}))

	if not slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 27-27, warpins: 1 ---
		slot4 = false
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 28-29, warpins: 2 ---
	if slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 30-41, warpins: 1 ---
		slot0._foeAircraftList[slot1] = slot2

		slot0:DispatchEvent(slot0.Event.New(slot1.ANTI_AIR_AREA, {
			isShow = true
		}))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 42-42, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

function slot8.KillAircraft(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0._aircraftList[slot1] == nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-5, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-18, warpins: 2 ---
	slot2:Clear()
	slot0._cldSystem:DeleteAircraftCld(slot2)

	if slot2:IsUndefeated() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-28, warpins: 1 ---
		slot0:HandleAircraftMissDamage(slot2, slot0._fleetList[slot2:GetIFF() * -1])
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 29-41, warpins: 2 ---
	slot2._aliveState = false
	slot0._aircraftList[slot1] = nil
	slot0._foeAircraftList[slot1] = nil
	slot3 = true

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 42-45, warpins: 0 ---
	for slot7, slot8 in pairs(slot0._foeAircraftList) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 42-43, warpins: 1 ---
		slot3 = false

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 44-44, warpins: 1 ---
		break
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 44-45, warpins: 1 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 46-47, warpins: 2 ---
	if slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 48-57, warpins: 1 ---
		slot0:DispatchEvent(slot0.Event.New(slot1.ANTI_AIR_AREA, {
			isShow = false
		}))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 58-70, warpins: 2 ---
	slot0:DispatchEvent(slot0.Event.New(slot1.REMOVE_AIR_CRAFT, {
		UID = slot1
	}))

	return
	--- END OF BLOCK #5 ---



end

function slot8.GetAircraftList(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return slot0._aircraftList
	--- END OF BLOCK #0 ---



end

function slot8.GenerateAircraftID(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0._aircraftCount = slot0._aircraftCount + 1

	return slot0._aircraftCount
	--- END OF BLOCK #0 ---



end

function slot8.CreateBulletUnit(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	slot6, slot7 = slot0.CreateBattleBulletData(slot5, slot1, slot2, slot3, slot4)

	if slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-18, warpins: 1 ---
		slot0._cldSystem:InitBulletCld(slot6)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 19-23, warpins: 2 ---
	if slot3:GetFixBulletRange() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 24-27, warpins: 1 ---
		slot6:FixRange(slot8)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 28-30, warpins: 2 ---
	slot0._bulletList[slot5] = slot6

	return slot6
	--- END OF BLOCK #2 ---



end

function slot8.RemoveBulletUnit(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0._bulletList[slot1] == nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-5, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-13, warpins: 2 ---
	slot2:DamageUnitListWriteback()

	if slot2:GetIsCld() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-18, warpins: 1 ---
		slot0._cldSystem:DeleteBulletCld(slot2)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 19-37, warpins: 2 ---
	slot0._bulletList[slot1] = nil

	slot0:DispatchEvent(slot0.Event.New(slot1.REMOVE_BULLET, {
		UID = slot1
	}))
	slot2:Dispose()

	return
	--- END OF BLOCK #2 ---



end

function slot8.GetBulletList(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return slot0._bulletList
	--- END OF BLOCK #0 ---



end

function slot8.GenerateBulletID(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot0._bulletCount = slot0._bulletCount + 1

	return slot0._bulletCount + 1
	--- END OF BLOCK #0 ---



end

function slot8.CLSBullet(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot2 = true

	if slot0._battleInitData.battleType == SYSTEM_DUEL or (slot3 == SYSTEM_SHAM and slot1 == slot0.FRIENDLY_CODE) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-14, warpins: 2 ---
		slot2 = false
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 15-16, warpins: 3 ---
	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-20, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 21-41, warpins: 0 ---
		for slot7, slot8 in pairs(slot0._bulletList) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 21-25, warpins: 1 ---
			if slot8:GetIFF() == slot1 and slot8:GetExist() and not slot8:ImmuneCLS() then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 36-39, warpins: 1 ---
				slot0:RemoveBulletUnit(slot7)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 40-41, warpins: 5 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 42-42, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

function slot8.SpawnColumnArea(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if not slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-3, warpins: 1 ---
		slot7 = false
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-46, warpins: 2 ---
	slot10 = slot0.Battle.BattleAOEData.New(slot9, slot2, slot6, slot8)

	slot10:SetPosition(slot3)
	slot10:SetRange(slot4)
	slot10:SetAreaType(slot1.AreaType.COLUMN)
	slot10:SetLifeTime(slot5)
	slot10:SetFieldType(slot1)
	slot10:SetOpponentAffected(not slot7)
	slot0:CreateAreaOfEffect(slot10)

	return
	--- END OF BLOCK #1 ---



end

function slot8.SpawnCubeArea(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if not slot8 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-3, warpins: 1 ---
		slot8 = false
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-50, warpins: 2 ---
	slot11 = slot0.Battle.BattleAOEData.New(slot10, slot2, slot7, slot9)

	slot11:SetPosition(slot3)
	slot11:SetWidth(slot4)
	slot11:SetHeight(slot5)
	slot11:SetAreaType(slot1.AreaType.CUBE)
	slot11:SetLifeTime(slot6)
	slot11:SetFieldType(slot1)
	slot11:SetOpponentAffected(not slot8)
	slot0:CreateAreaOfEffect(slot11)

	return
	--- END OF BLOCK #1 ---



end

function slot8.SpawnLastingColumnArea(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if not slot8 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-3, warpins: 1 ---
		slot8 = false
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-48, warpins: 2 ---
	slot12 = slot0.Battle.BattleLastingAOEData.New(slot11, slot2, slot6, slot7, slot10)

	slot12:SetPosition(slot3)
	slot12:SetRange(slot4)
	slot12:SetAreaType(slot1.AreaType.COLUMN)
	slot12:SetLifeTime(slot5)
	slot12:SetFieldType(slot1)
	slot12:SetOpponentAffected(not slot8)
	slot0:CreateAreaOfEffect(slot12)

	if slot9 and slot9 ~= "" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 51-63, warpins: 1 ---
		slot0:DispatchEvent(slot0.Event.New(slot2.ADD_AREA, {
			area = slot12,
			FXID = slot9
		}))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 64-64, warpins: 3 ---
	return slot12
	--- END OF BLOCK #2 ---



end

function slot8.SpawnLastingCubeArea(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if not slot9 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-3, warpins: 1 ---
		slot9 = false
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-52, warpins: 2 ---
	slot13 = slot0.Battle.BattleLastingAOEData.New(slot12, slot2, slot7, slot8, slot11)

	slot13:SetPosition(slot3)
	slot13:SetWidth(slot4)
	slot13:SetHeight(slot5)
	slot13:SetAreaType(slot1.AreaType.CUBE)
	slot13:SetLifeTime(slot6)
	slot13:SetFieldType(slot1)
	slot13:SetOpponentAffected(not slot9)
	slot0:CreateAreaOfEffect(slot13)

	if slot10 and slot10 ~= "" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 55-67, warpins: 1 ---
		slot0:DispatchEvent(slot0.Event.New(slot2.ADD_AREA, {
			area = slot13,
			FXID = slot10
		}))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 68-68, warpins: 3 ---
	return slot13
	--- END OF BLOCK #2 ---



end

function slot8.SpawnAura(slot0, slot1, slot2, slot3, slot4, slot5, slot6)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-51, warpins: 1 ---
	slot10 = slot0.Battle.BattleMobileAOEData.New(slot7, slot8, slot4, slot5, slot6, slot1)

	slot10:SetPosition(slot9)
	slot10:SetRange(slot3)
	slot10:SetAreaType(slot1.AreaType.COLUMN)
	slot10:SetLifeTime(0)
	slot10:SetFieldType(slot2)
	slot10:SetOpponentAffected(true)
	slot0:CreateAreaOfEffect(slot10)

	return slot10
	--- END OF BLOCK #0 ---



end

function slot8.CreateAreaOfEffect(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	slot0._AOEList[slot1:GetUniqueID()] = slot1

	slot0._cldSystem:InitAOECld(slot1)
	slot1:StartTimer()

	return
	--- END OF BLOCK #0 ---



end

function slot8.RemoveAreaOfEffect(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if not slot0._AOEList[slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-5, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-28, warpins: 2 ---
	slot2:Dispose()

	slot0._AOEList[slot1] = nil

	slot0._cldSystem:DeleteAOECld(slot2)
	slot0:DispatchEvent(slot0.Event.New(slot1.REMOVE_AREA, {
		id = slot1
	}))

	return
	--- END OF BLOCK #1 ---



end

function slot8.GetAOEList(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return slot0._AOEList
	--- END OF BLOCK #0 ---



end

function slot8.GenerateAreaID(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0._AOECount = slot0._AOECount + 1

	return slot0._AOECount
	--- END OF BLOCK #0 ---



end

function slot8.SpawnWall(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-21, warpins: 1 ---
	slot6 = slot0.Battle.BattleWallData.New(slot5, slot1, slot2, slot3, slot4)
	slot0._wallList[slot0:GenerateWallID()] = slot6

	slot0._cldSystem:InitWallCld(slot6)

	return slot6
	--- END OF BLOCK #0 ---



end

function slot8.RemoveWall(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot0._wallList[slot1] = nil

	slot0._cldSystem:DeleteWallCld(slot0._wallList[slot1])

	return
	--- END OF BLOCK #0 ---



end

function slot8.SpawnShelter(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	slot0._shelterList[slot0:GernerateShelterID()] = slot0.Battle.BattleShelterData.New(slot3)

	return slot0.Battle.BattleShelterData.New(slot3)
	--- END OF BLOCK #0 ---



end

function slot8.RemoveShelter(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-21, warpins: 1 ---
	slot0:DispatchEvent(slot0.Event.New(slot1.REMOVE_SHELTER, {
		uid = slot1
	}))
	slot0._shelterList[slot1].Deactive(slot2)

	slot0._shelterList[slot1] = nil

	return
	--- END OF BLOCK #0 ---



end

function slot8.GetWallList(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return slot0._wallList
	--- END OF BLOCK #0 ---



end

function slot8.GenerateWallID(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0._wallIndex = slot0._wallIndex + 1

	return slot0._wallIndex
	--- END OF BLOCK #0 ---



end

function slot8.GernerateShelterID(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0._shelterIndex = slot0._shelterIndex + 1

	return slot0._shelterIndex
	--- END OF BLOCK #0 ---



end

function slot8.SpawnEnvironment(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-32, warpins: 1 ---
	slot3 = slot0.Battle.BattleEnvironmentUnit.New(slot2, slot1.FOE_CODE)

	slot3:SetTemplate(slot1)

	slot4 = slot3:GetBehaviours()
	slot5 = Vector3(slot1.coordinate[1], slot1.coordinate[2], slot1.coordinate[3])

	function slot6(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot1 = {}

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 6-19, warpins: 0 ---
		for slot5, slot6 in ipairs(slot0) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-8, warpins: 1 ---
			if slot6.Active then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 9-17, warpins: 1 ---
				table.insert(slot1, slot0._unitList[slot6.UID])
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
		--- BLOCK #2 20-25, warpins: 1 ---
		slot1:UpdateFrequentlyCollide(slot1)

		return
		--- END OF BLOCK #2 ---



	end

	function slot7()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-1, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	function slot8()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-1, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	if not slot1.field_type then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 33-35, warpins: 1 ---
		slot9 = slot2.BulletField.SURFACE
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 36-38, warpins: 2 ---
	if not slot1.IFF then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 39-40, warpins: 1 ---
		slot10 = slot1.FOE_CODE
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 41-46, warpins: 2 ---
	slot11 = 0
	slot12 = nil

	if #slot1.cld_data == 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 47-63, warpins: 1 ---
		slot12 = slot0:SpawnLastingColumnArea(slot9, slot10, slot5, slot1.cld_data[1], slot11, slot6, slot7, false, slot1.prefab, slot8)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 64-82, warpins: 1 ---
		slot12 = slot0:SpawnLastingCubeArea(slot9, slot10, slot5, slot1.cld_data[1], slot1.cld_data[2], slot11, slot6, slot7, false, slot1.prefab, slot8)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 83-90, warpins: 2 ---
	slot3:SetAOEData(slot12)

	slot0._environmentList[slot2] = slot3

	return
	--- END OF BLOCK #3 ---



end

function slot8.RemoveEnvironment(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-18, warpins: 1 ---
	slot0:RemoveAreaOfEffect(slot0._environmentList[slot1].GetAOEData(slot2):GetUniqueID())
	slot0._environmentList[slot1].Dispose(slot2)

	slot0._environmentList[slot1] = nil

	return
	--- END OF BLOCK #0 ---



end

function slot8.GetEnvironmentList(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return slot0._environmentList
	--- END OF BLOCK #0 ---



end

function slot8.GernerateEnvironmentID(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0._environmentIndex = slot0._environmentIndex + 1

	return slot0._environmentIndex
	--- END OF BLOCK #0 ---



end

function slot8.GetFriendlyCode(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return slot0._friendlyCode
	--- END OF BLOCK #0 ---



end

function slot8.GetFoeCode(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return slot0._foeCode
	--- END OF BLOCK #0 ---



end

function slot8.GetOppoSideCode(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0 == slot0.FRIENDLY_CODE then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-8, warpins: 1 ---
		return slot0.FOE_CODE
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-12, warpins: 1 ---
		if slot0 == slot0.FOE_CODE then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-15, warpins: 1 ---
			return slot0.FRIENDLY_CODE
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 16-16, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



end

function slot8.GetStatistics(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return slot0._statistics
	--- END OF BLOCK #0 ---



end

function slot8.BlockManualCast(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-4, warpins: 1 ---
		slot2 = 1
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-5, warpins: 1 ---
		slot2 = -1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-9, warpins: 2 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 10-15, warpins: 0 ---
	for slot6, slot7 in pairs(slot0._fleetList) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-13, warpins: 1 ---
		slot7:SetWeaponBlock(slot2)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 14-15, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 16-16, warpins: 1 ---
	return
	--- END OF BLOCK #3 ---



end

function slot8.SubmarineStrike(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	if slot0:GetFleetByIFF(slot1):GetWeaponBlock() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-10, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-17, warpins: 2 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 18-28, warpins: 0 ---
	for slot7, slot8 in ipairs(slot3) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 18-26, warpins: 1 ---
		slot0:InitAidUnitStatistics(slot0:SpawnSub(slot8, slot1))
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 27-28, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 29-38, warpins: 1 ---
	slot2:SubWarcry()

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 39-55, warpins: 0 ---
	for slot8, slot9 in ipairs(slot4) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 39-40, warpins: 1 ---
		if slot8 == 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 41-47, warpins: 1 ---
			slot9:TriggerBuff(slot0.BuffEffectType.ON_SUB_LEADER)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 48-53, warpins: 1 ---
			slot9:TriggerBuff(slot0.BuffEffectType.ON_SUB_CONSORT)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 54-55, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 56-63, warpins: 1 ---
	slot5 = slot4[1]

	slot2:GetSubAidVO():Cast()

	return
	--- END OF BLOCK #5 ---



end

return
