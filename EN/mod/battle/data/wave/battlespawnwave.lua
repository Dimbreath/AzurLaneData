ys = ys or {}
ys.Battle.BattleSpawnWave = class("BattleSpawnWave", ys.Battle.BattleWaveInfo)
ys.Battle.BattleSpawnWave.__name = "BattleSpawnWave"

function ys.Battle.BattleSpawnWave.Ctor(slot0)
	slot0.super.Ctor(slot0)

	slot0._spawnUnitList = {}
	slot0._monsterList = {}
	slot0._reinforceKillCount = 0
	slot0._reinforceTotalKillCount = 0
	slot0._airStrikeTimerList = {}
	slot0._spawnTimerList = {}
end

function ys.Battle.BattleSpawnWave.SetWaveData(slot0, slot1)
	slot0.super.SetWaveData(slot0, slot1)

	slot0._sapwnData = slot1.spawn or {}
	slot0._airStrike = slot1.airFighter or {}
	slot0._reinforce = slot1.reinforcement or {}
	slot0._reinforceCount = #slot0._reinforce
	slot0._spawnCount = #slot0._sapwnData
	slot0._round = slot0._param.round
end

function ys.Battle.BattleSpawnWave.DoWave(slot0)
	slot0.super.DoWave(slot0)

	if slot0._round then
		if slot1.Battle.BattleDataProxy.GetInstance():GetInitData().ChallengeInfo then
			slot3 = slot2:GetInitData().ChallengeInfo:getRound()

			if slot0._round.less and slot3 < slot0._round.less then
				slot1 = true
			end

			if slot0._round.more and slot0._round.more < slot3 then
				slot1 = true
			end

			if slot0._round.equal and table.contains(slot0._round.equal, slot3) then
				slot1 = true
			end
		end

		if not slot1 then
			slot0:doPass()

			return
		end
	end

	for slot4, slot5 in ipairs(slot0._airStrike) do
		if slot5.delay <= 0 then
			slot0:doAirStrike(slot5)
		else
			slot0:airStrikeTimer(slot5, slot5.delay)
		end
	end

	slot1 = 0

	for slot5, slot6 in ipairs(slot0._sapwnData) do
		if slot6.bossData then
			slot1 = slot1 + 1
		end
	end

	slot2 = 0

	for slot6, slot7 in ipairs(slot0._sapwnData) do
		if math.random() <= (slot7.chance or 1) then
			if slot7.bossData and slot1 > 1 then
				slot7.bossData.bossCount = slot2 + 1
			end

			if slot7.delay <= 0 then
				slot0:doSpawn(slot7)
			else
				slot0:spawnTimer(slot7, slot7.delay)
			end
		else
			slot0._spawnCount = slot0._spawnCount - 1
		end
	end

	if slot0._reinforce then
		slot0:doReinforce()
	end

	if slot0._spawnCount == 0 then
		slot0:doPass()
	end

	slot1.Battle.BattleState.GenerateVertifyData(1)

	slot3, slot4 = slot1.Battle.BattleState.Vertify()

	if not slot3 then
		slot1.Battle.BattleState.GetInstance():GetCommandByName(slot1.Battle.BattleSingleDungeonCommand.__name):SetVertifyFail(100 + slot4)
	end
end

function ys.Battle.BattleSpawnWave.AddMonster(slot0, slot1)
	if slot1:GetWaveIndex() ~= slot0._index then
		return
	end

	slot0._monsterList[slot1:GetUniqueID()] = slot1
end

function ys.Battle.BattleSpawnWave.RemoveMonster(slot0, slot1)
	slot0:onWaveUnitDie(slot1)
end

function ys.Battle.BattleSpawnWave.doSpawn(slot0, slot1)
	slot2 = slot0.Battle.BattleConst.UnitType.ENEMY_UNIT

	if slot1.bossData then
		slot2 = slot0.Battle.BattleConst.UnitType.BOSS_UNIT
	end

	slot0._spawnFunc(slot1, slot0._index, slot2)
end

function ys.Battle.BattleSpawnWave.spawnTimer(slot0, slot1, slot2)
	slot3 = nil
	slot0._spawnTimerList[pg.TimeMgr.GetInstance():AddBattleTimer("", 1, slot2, function ()
		slot0._spawnTimerList[slot1] = nil

		slot0._spawnTimerList:doSpawn(nil)
		pg.TimeMgr.GetInstance():RemoveBattleTimer(pg.TimeMgr.GetInstance())
	end, true)] = true
end

function ys.Battle.BattleSpawnWave.doAirStrike(slot0, slot1)
	slot0._airFunc(slot1)
end

function ys.Battle.BattleSpawnWave.airStrikeTimer(slot0, slot1, slot2)
	slot3 = nil
	slot0._airStrikeTimerList[pg.TimeMgr.GetInstance():AddBattleTimer("", 1, slot2, function ()
		slot0._airStrikeTimerList[slot1] = nil

		slot0._airStrikeTimerList:doAirStrike(nil)
		pg.TimeMgr.GetInstance():RemoveBattleTimer(pg.TimeMgr.GetInstance())
	end, true)] = true
end

function ys.Battle.BattleSpawnWave.doReinforce(slot0)
	slot0._reinforceKillCount = 0

	for slot4, slot5 in ipairs(slot0._reinforce) do
		slot5.reinforce = true

		if slot5.delay <= 0 then
			slot0:doSpawn(slot5)
		else
			slot0:spawnTimer(slot5, slot5.delay)
		end
	end
end

function ys.Battle.BattleSpawnWave.reinforceTimer(slot0, slot1)
	slot0:clearReinforceTimer()

	slot0._reinforceTimer = pg.TimeMgr.GetInstance():AddBattleTimer("", 1, slot1, function ()
		slot0:doReinforce()
		slot0.doReinforce:clearReinforceTimer()
	end, true)
end

function ys.Battle.BattleSpawnWave.clearReinforceTimer(slot0)
	pg.TimeMgr.GetInstance():RemoveBattleTimer(slot0._reinforceTimer)

	slot0._reinforceTimer = nil
end

function ys.Battle.BattleSpawnWave.onWaveUnitDie(slot0, slot1)
	if slot0._monsterList[slot1] == nil then
		return
	end

	slot3 = nil

	if slot2:IsReinforcement() then
		slot0._reinforceKillCount = slot0._reinforceKillCount + 1
		slot0._reinforceTotalKillCount = slot0._reinforceTotalKillCount + 1

		if slot0._reinforceCount ~= 0 and slot0._reinforceCount == slot0._reinforceKillCount then
			slot3 = true
		end
	end

	slot4 = 0
	slot5 = 0

	for slot9, slot10 in pairs(slot0._monsterList) do
		if slot10:IsAlive() == false then
			if not slot10:IsReinforcement() then
				slot4 = slot4 + 1
			end
		else
			slot5 = slot5 + 1
			slot11 = slot10:GetReinforceCastTime()

			if slot3 and slot11 then
				if slot11 == 0 then
					slot0:doReinforce()
				else
					slot0:reinforceTimer(slot11)
				end

				slot3 = false
			end
		end
	end

	if slot5 == 0 and slot0._spawnCount <= slot4 and slot0._reinforceCount <= slot0._reinforceTotalKillCount then
		slot0:doPass()
	end
end

function ys.Battle.BattleSpawnWave.doPass(slot0)
	slot0.clearTimerList(slot0._spawnTimerList)
	slot0:clearReinforceTimer()
	slot0.super.doPass(slot0)
end

function ys.Battle.BattleSpawnWave.clearTimerList(slot0)
	for slot4, slot5 in pairs(slot0) do
		pg.TimeMgr.GetInstance():RemoveBattleTimer(slot4)
	end
end

function ys.Battle.BattleSpawnWave.Dispose(slot0)
	slot0.clearTimerList(slot0._airStrikeTimerList)

	slot0._airStrikeTimerList = nil

	slot0.clearTimerList(slot0._spawnTimerList)

	slot0._spawnTimerList = nil

	slot0:clearReinforceTimer()
	slot0.super.Dispose(slot0)
end

return
