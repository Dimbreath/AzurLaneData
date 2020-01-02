slot1 = ys.Battle.BattleEvent
slot2 = ys.Battle.BattleFormulas
slot3 = ys.Battle.BattleConst
slot4 = ys.Battle.BattleConfig
slot5 = ys.Battle.BattleDataFunction
slot6 = ys.Battle.BattleAttr
slot7 = ys.Battle.BattleVariable

function ys.Battle.BattleDataProxy.StatisticsInit(slot0, slot1)
	slot0._statistics = {
		_battleScore = slot0.BattleScore.D,
		kill_id_list = {},
		_totalTime = 0,
		_deadCount = 0,
		_boss_destruct = 0,
		_botPercentage = 0,
		_enemyInfoList = {}
	}

	for slot5, slot6 in ipairs(slot1) do
		slot0._statistics[({
			id = slot6:GetAttrByName("id"),
			damage = 0,
			output = 0,
			kill_count = 0,
			bp = 0,
			max_hp = slot6:GetAttrByName("maxHP"),
			maxDamageOnce = 0,
			gearScore = slot6:GetGearScore()
		})["id"]] = 
	end
end

function ys.Battle.BattleDataProxy.InitAidUnitStatistics(slot0, slot1)
	slot0._statistics[({
		id = slot1:GetAttrByName("id"),
		damage = 0,
		output = 0,
		kill_count = 0,
		bp = 0,
		max_hp = slot1:GetAttrByName("maxHP"),
		maxDamageOnce = 0,
		gearScore = slot1:GetGearScore()
	})["id"]] = 
	slot0._statistics.submarineAid = true
end

function ys.Battle.BattleDataProxy.InitSpecificEnemyStatistics(slot0, slot1)
	slot0._statistics[({
		id = slot1:GetAttrByName("id"),
		damage = 0,
		output = 0,
		kill_count = 0,
		bp = 0,
		max_hp = slot1:GetAttrByName("maxHP"),
		maxDamageOnce = 0,
		gearScore = slot1:GetGearScore()
	})["id"]] = 
end

function ys.Battle.BattleDataProxy.RivalInit(slot0, slot1)
	slot0._statistics._rivalInfo = {}

	for slot5, slot6 in ipairs(slot1) do
		slot7 = slot6:GetAttrByName("id")
		slot0._statistics._rivalInfo[slot7] = {
			id = slot7
		}
	end
end

function ys.Battle.BattleDataProxy.DodgemCountInit(slot0)
	slot0._dodgemStatistics = {
		kill = 0,
		combo = 0,
		miss = 0,
		fail = 0,
		score = 0,
		maxCombo = 0
	}
end

function ys.Battle.BattleDataProxy.SubmarineRunInit(slot0)
	slot0._subRunStatistics = {
		score = 0
	}
end

function ys.Battle.BattleDataProxy.SetFlagShipID(slot0, slot1)
	if slot1 then
		slot0._statistics._flagShipID = slot1:GetAttrByName("id")
	end
end

function ys.Battle.BattleDataProxy.DamageStatistics(slot0, slot1, slot2, slot3)
	if slot0._statistics[slot1] then
		slot0._statistics[slot1].output = slot0._statistics[slot1].output + slot3
		slot0._statistics[slot1].maxDamageOnce = math.max(slot0._statistics[slot1].maxDamageOnce, slot3)
	end

	if slot0._statistics[slot2] then
		slot0._statistics[slot2].damage = slot0._statistics[slot2].damage + slot3
	end
end

function ys.Battle.BattleDataProxy.KillCountStatistics(slot0, slot1, slot2)
	if slot0._statistics[slot1] then
		slot0._statistics[slot1].kill_count = slot0._statistics[slot1].kill_count + 1
	end
end

function ys.Battle.BattleDataProxy.HPRatioStatistics(slot0)
	for slot5, slot6 in ipairs(slot1) do
		slot0._statistics[slot6:GetAttrByName("id")].bp = math.ceil(slot6:GetHPRate() * 10000)
	end
end

function ys.Battle.BattleDataProxy.BotPercentage(slot0, slot1)
	slot0._statistics._botPercentage = math.min(100, math.floor(slot1 / (slot0._currentStageData.timeCount - slot0._countDown) * 100))
end

function ys.Battle.BattleDataProxy.CalcBattleScoreWhenDead(slot0, slot1)
	if slot1:GetIFF() == slot0.FRIENDLY_CODE then
		if not table.contains(TeamType.SubShipType, slot1:GetTemplate().type) then
			slot0:DelScoreWhenPlayerDead(slot1)
		end
	elseif slot2 == slot0.FOE_CODE then
		slot0:AddScoreWhenEnemyDead(slot1)
	end
end

function ys.Battle.BattleDataProxy.AddScoreWhenBossDestruct(slot0)
	slot0._statistics._boss_destruct = slot0._statistics._boss_destruct + 1
end

function ys.Battle.BattleDataProxy.AddScoreWhenEnemyDead(slot0, slot1)
	if slot1:GetDeathReason() == slot0.UnitDeathReason.KILLED then
		slot0._statistics.kill_id_list[#slot0._statistics.kill_id_list + 1] = slot1:GetTemplateID()
	end
end

function ys.Battle.BattleDataProxy.DelScoreWhenPlayerDead(slot0, slot1)
	slot0._statistics._deadCount = slot0._statistics._deadCount + 1
end

function ys.Battle.BattleDataProxy.CalcBPWhenPlayerLeave(slot0, slot1)
	slot0._statistics[slot1:GetAttrByName("id")].bp = math.ceil(slot1:GetHPRate() * 10000)
end

function ys.Battle.BattleDataProxy.isTimeOut(slot0)
	return slot0._currentStageData.timeCount - slot0._countDown >= 180
end

function ys.Battle.BattleDataProxy.CalcSingleDungeonScoreAtEnd(slot0, slot1)
	slot0._statistics._deadUnit = true
	slot0._statistics._badTime = true
	slot0._statistics._totalTime = slot0._currentStageData.timeCount - slot0._countDown
	slot3 = slot0._expeditionTmp.limit_type
	slot5 = slot0._expeditionTmp.time_limit

	if slot0._statistics._deadCount < slot0._expeditionTmp.sink_limit then
		slot0._statistics._deadUnit = false
	end

	slot6 = slot1:GetFlagShip()
	slot7 = slot1:GetScoutList()

	if slot3 == 2 then
		if not slot6:IsAlive() or #slot7 <= 0 then
			slot0._statistics._battleScore = slot0.BattleScore.D
			slot0._statistics._boss_destruct = 1
		else
			slot0._statistics._battleScore = slot0.BattleScore.S
		end
	elseif slot0._countDown <= 0 then
		slot0._statistics._battleScore = slot0.BattleScore.C
		slot0._statistics._boss_destruct = 1
	elseif not slot6:IsAlive() then
		slot0._statistics._battleScore = slot0.BattleScore.D
		slot0._statistics._boss_destruct = 1
		slot0._statistics._scoreMark = slot0.DEAD_FLAG
	elseif #slot7 <= 0 then
		slot0._statistics._battleScore = slot0.BattleScore.D
		slot0._statistics._boss_destruct = 1
	else
		slot8 = 0

		if slot0._statistics._deadUnit then
			slot8 = slot8 + 1
		end

		if slot5 < slot2 then
			slot8 = slot8 + 1
		else
			slot0._statistics._badTime = false
		end

		if slot0._statistics._boss_destruct > 0 then
			slot8 = slot8 + 1
		end

		if slot8 >= 2 then
			slot0._statistics._battleScore = slot0.BattleScore.B
		elseif slot8 == 1 then
			slot0._statistics._battleScore = slot0.BattleScore.A
		elseif slot8 == 0 then
			slot0._statistics._battleScore = slot0.BattleScore.S
		end
	end

	slot0._statistics._timeout = slot0:isTimeOut()
end

function ys.Battle.BattleDataProxy.CalcDuelScoreAtTimesUp(slot0, slot1, slot2, slot3, slot4)
	slot0._statistics._deadUnit = true
	slot0._statistics._badTime = true
	slot0._statistics._timeout = false
	slot0._statistics._totalTime = slot0._currentStageData.timeCount - slot0._countDown

	if slot0._statistics._deadCount < slot0._expeditionTmp.sink_limit then
		slot0._statistics._deadUnit = false
	end

	if slot2 < slot1 then
		slot0._statistics._battleScore = slot0.BattleScore.S
	elseif slot1 < slot2 then
		slot0._statistics._battleScore = slot0.BattleScore.D
	elseif slot4 <= slot3 then
		slot0._statistics._battleScore = slot0.BattleScore.S
	elseif slot3 < slot4 then
		slot0._statistics._battleScore = slot0.BattleScore.D
	end
end

function ys.Battle.BattleDataProxy.CalcDuelScoreAtEnd(slot0, slot1, slot2)
	slot0._statistics._deadUnit = true
	slot0._statistics._badTime = true
	slot0._statistics._totalTime = slot0._currentStageData.timeCount - slot0._countDown
	slot4 = #slot1:GetUnitList()
	slot5 = #slot2:GetUnitList()
	slot7 = slot0._expeditionTmp.time_limit

	if slot0._statistics._deadCount < slot0._expeditionTmp.sink_limit then
		slot0._statistics._deadUnit = false
	end

	if slot4 == 0 then
		slot0._statistics._battleScore = slot0.BattleScore.D
	elseif slot5 == 0 then
		slot0._statistics._battleScore = slot0.BattleScore.S
	end

	slot0._statistics._timeout = slot0:isTimeOut()
end

function ys.Battle.BattleDataProxy.CalcSimulationScoreAtEnd(slot0, slot1, slot2)
	slot0._statistics._deadUnit = true
	slot0._statistics._badTime = true
	slot0._statistics._totalTime = slot0._currentStageData.timeCount - slot0._countDown
	slot4 = #slot1:GetUnitList()
	slot5 = slot1:GetMaxCount()
	slot6 = #slot1:GetScoutList()
	slot7 = #slot2:GetUnitList()
	slot8 = slot0._expeditionTmp.sink_limit
	slot9 = slot0._expeditionTmp.time_limit

	if slot0._statistics._deadCount <= 0 then
		slot0._statistics._deadUnit = false
	end

	if not slot1:GetFlagShip():IsAlive() then
		slot0._statistics._battleScore = slot0.BattleScore.D
		slot0._statistics._scoreMark = slot0.DEAD_FLAG
	elseif slot6 == 0 then
		slot0._statistics._battleScore = slot0.BattleScore.D
	elseif slot7 == 0 then
		slot0._statistics._battleScore = slot0.BattleScore.S
	end

	slot0._statistics._timeout = slot0:isTimeOut()

	slot0:overwriteRivalStatistics(slot2)
end

function ys.Battle.BattleDataProxy.CalcSimulationScoreAtTimesUp(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0._statistics._deadUnit = true
	slot0._statistics._badTime = true
	slot0._statistics._timeout = false
	slot0._statistics._totalTime = slot0._currentStageData.timeCount - slot0._countDown

	if slot0._statistics._deadCount <= 0 then
		slot0._statistics._deadUnit = false
	end

	slot0._statistics._battleScore = slot0.BattleScore.D

	slot0:overwriteRivalStatistics(slot5)
end

function ys.Battle.BattleDataProxy.overwriteRivalStatistics(slot0, slot1)
	for slot5, slot6 in pairs(slot0._statistics._rivalInfo) do
		slot7 = false

		for slot11, slot12 in ipairs(slot1:GetUnitList()) do
			if slot12:GetAttrByName("id") == slot5 then
				slot6.bp = math.ceil(slot12:GetHPRate() * 10000)
				slot7 = true

				break
			end
		end

		if not slot7 then
			slot6.bp = 0
		end
	end
end

function ys.Battle.BattleDataProxy.CalcChallengeScore(slot0, slot1)
	if slot1 then
		slot0._statistics._battleScore = slot0.BattleScore.S
	else
		slot0._statistics._battleScore = slot0.BattleScore.D
	end

	slot0._statistics._totalTime = slot0._totalTime
end

function ys.Battle.BattleDataProxy.CalcDodgemCount(slot0, slot1)
	slot3 = slot1:GetTemplate().type

	if slot1:GetDeathReason() == ys.Battle.BattleConst.UnitDeathReason.CRUSH then
		slot0._dodgemStatistics.kill = slot0._dodgemStatistics.kill + 1

		if slot3 == ShipType.JinBi then
			slot0._dodgemStatistics.combo = slot0._dodgemStatistics.combo + 1
			slot0._dodgemStatistics.maxCombo = math.max(slot0._dodgemStatistics.maxCombo, slot0._dodgemStatistics.combo)
			slot0._dodgemStatistics.score = slot0._dodgemStatistics.score + slot0:GetScorePoint()

			slot0:DispatchEvent(ys.Event.New(slot0.UPDATE_DODGEM_SCORE, {
				totalScore = slot0._dodgemStatistics.score + slot0.GetScorePoint()
			}))
		elseif slot3 == ShipType.ZiBao then
			slot0._dodgemStatistics.fail = slot0._dodgemStatistics.fail + 1
			slot0._dodgemStatistics.combo = 0
		end

		slot0:DispatchEvent(ys.Event.New(slot0.UPDATE_DODGEM_COMBO, {
			combo = slot0._dodgemStatistics.combo
		}))
	elseif slot3 == ShipType.JinBi then
		slot0._dodgemStatistics.miss = slot0._dodgemStatistics.miss + 1
	end
end

function ys.Battle.BattleDataProxy.GetScorePoint(slot0)
	slot1 = nil

	if slot0._dodgemStatistics.combo == 1 then
		slot1 = 1
	elseif slot0._dodgemStatistics.combo == 2 then
		slot1 = 2
	elseif slot0._dodgemStatistics.combo > 2 then
		slot1 = 3
	end

	return slot1
end

function ys.Battle.BattleDataProxy.CalcDodgemScore(slot0)
	if slot0.BATTLE_DODGEM_PASS_SCORE <= slot0._dodgemStatistics.score then
		slot0._statistics._battleScore = slot1.BattleScore.S
	else
		slot0._statistics._battleScore = slot1.BattleScore.B
	end

	slot0._statistics.dodgemResult = slot0._dodgemStatistics
end

function ys.Battle.BattleDataProxy.CalcSpecificEnemyInfo(slot0, slot1)
	slot0._statistics.specificDamage = 0
	slot3 = {}

	for slot7, slot8 in ipairs(slot2) do
		slot0._statistics.specificDamage = slot0._statistics.specificDamage + slot0._statistics["enemy_" .. slot8].damage

		table.insert(slot0._statistics._enemyInfoList, {
			id = slot8,
			damage = slot0._statistics["enemy_" .. slot8].damage,
			totalHp = slot0._statistics["enemy_" .. slot8].max_hp
		})
	end
end

function ys.Battle.BattleDataProxy.CalcKillingSupplyShip(slot0)
	slot0._subRunStatistics.score = slot0._subRunStatistics.score + 1
end

function ys.Battle.BattleDataProxy.CalcSubRunTimeUp(slot0)
	slot0._statistics._battleScore = slot0.BattleScore.B
	slot0._statistics.subRunResult = slot0._subRunStatistics
end

function ys.Battle.BattleDataProxy.CalcSubRunScore(slot0)
	slot0._statistics._battleScore = slot0.BattleScore.S
	slot0._statistics.subRunResult = slot0._subRunStatistics
end

function ys.Battle.BattleDataProxy.CalcSubRunDead(slot0)
	slot0._statistics._battleScore = slot0.BattleScore.D
	slot0._statistics.subRunResult = slot0._subRunStatistics
end

function ys.Battle.BattleDataProxy.CalcKillingSupplyShip(slot0)
	slot0._subRunStatistics.score = slot0._subRunStatistics.score + 1
end

function ys.Battle.BattleDataProxy.CalcSubRountineTimeUp(slot0)
	slot0._statistics._badTime = true

	slot0:CalcSubRoutineScore()

	slot0._statistics._battleScore = slot0.BattleScore.C
end

function ys.Battle.BattleDataProxy.CalcSubRountineElimate(slot0)
	slot0._statistics._elimated = true

	slot0:CalcSubRoutineScore()

	slot0._statistics._battleScore = slot0.BattleScore.D
end

function ys.Battle.BattleDataProxy.CalcSubRoutineScore(slot0)
	if ((((slot0._statistics._badTime or slot0._statistics._elimated) and 0) or slot0.SR_CONFIG.BASE_POINT) + slot0._subRunStatistics.score * slot0.SR_CONFIG.POINT) - slot0._statistics._deadCount * slot0.SR_CONFIG.DEAD_POINT >= slot0.SR_CONFIG.BASE_POINT + slot0.SR_CONFIG.M * slot0.SR_CONFIG.POINT then
		slot0._statistics._battleScore = slot1.BattleScore.S
	elseif slot0.SR_CONFIG.BASE_POINT <= slot4 then
		slot0._statistics._battleScore = slot1.BattleScore.A
	elseif slot4 >= slot0.SR_CONFIG.BASE_POINT - 2 * slot0.SR_CONFIG.DEAD_POINT then
		slot0._statistics._battleScore = slot1.BattleScore.B
	else
		slot0._statistics._battleScore = slot1.BattleScore.D
	end

	slot0._subRunStatistics.basePoint = slot3
	slot0._subRunStatistics.deadCount = slot0._statistics._deadCount
	slot0._subRunStatistics.losePoint = slot1
	slot0._subRunStatistics.point = slot2
	slot0._subRunStatistics.total = slot4
	slot0._statistics.subRunResult = slot0._subRunStatistics
end

return
