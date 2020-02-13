ys = ys or {}
ys.Battle.BattleEnvironmentWave = class("BattleEnvironmentWave", ys.Battle.BattleWaveInfo)
ys.Battle.BattleEnvironmentWave.__name = "BattleEnvironmentWave"

function ys.Battle.BattleEnvironmentWave.Ctor(slot0)
	slot0.super.Ctor(slot0)

	slot0._spawnTimerList = {}
end

function ys.Battle.BattleEnvironmentWave.SetWaveData(slot0, slot1)
	slot0.super.SetWaveData(slot0, slot1)

	slot0._sapwnData = slot1.spawn or {}
end

function ys.Battle.BattleEnvironmentWave.DoWave(slot0)
	slot0.super.DoWave(slot0)

	for slot4, slot5 in ipairs(slot0._sapwnData) do
		if slot5.delay and slot5.delay > 0 then
			slot0:spawnTimer(slot5)
		else
			slot0:doSpawn(slot5)
		end
	end
end

function ys.Battle.BattleEnvironmentWave.doSpawn(slot0, slot1)
	slot0.Battle.BattleDataProxy.GetInstance():SpawnEnvironment(slot1)
end

function ys.Battle.BattleEnvironmentWave.spawnTimer(slot0, slot1)
	slot2 = nil
	slot0._spawnTimerList[pg.TimeMgr.GetInstance():AddBattleTimer("", 1, slot1.delay, function ()
		slot0:doSpawn(slot0)
		pg.TimeMgr.GetInstance():RemoveBattleTimer(slot0)
	end, true)] = true
end

function ys.Battle.BattleEnvironmentWave.Dispose(slot0)
	for slot4, slot5 in pairs(slot0._spawnTimerList) do
		pg.TimeMgr.GetInstance():RemoveBattleTimer(slot4)
	end

	slot0._spawnTimerList = nil
end

return
