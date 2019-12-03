ys = ys or {}
ys.Battle.BattleDelayWave = class("BattleDelayWave", ys.Battle.BattleWaveInfo)
ys.Battle.BattleDelayWave.__name = "BattleDelayWave"

ys.Battle.BattleDelayWave.Ctor = function (slot0)
	slot0.super.Ctor(slot0)
end

ys.Battle.BattleDelayWave.SetWaveData = function (slot0, slot1)
	slot0.super.SetWaveData(slot0, slot1)

	slot0._duration = slot0._param.timeout
end

ys.Battle.BattleDelayWave.DoWave = function (slot0)
	slot0.super.DoWave(slot0)

	slot1 = nil
	slot1 = pg.TimeMgr.GetInstance():AddBattleTimer("delayWave", 1, slot0._duration, function ()
		slot0:doPass()
		pg.TimeMgr.GetInstance():RemoveBattleTimer(pg.TimeMgr.GetInstance())
	end, true)
end

return
