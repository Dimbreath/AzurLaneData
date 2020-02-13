ys = ys or {}
ys.Battle.BattleSwitchBGMWave = class("BattleSwitchBGMWave", ys.Battle.BattleWaveInfo)
ys.Battle.BattleSwitchBGMWave.__name = "BattleSwitchBGMWave"

function ys.Battle.BattleSwitchBGMWave.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function ys.Battle.BattleSwitchBGMWave.SetWaveData(slot0, slot1)
	slot0.super.SetWaveData(slot0, slot1)

	slot0._bgmName = slot0._param.bgm
end

function ys.Battle.BattleSwitchBGMWave.DoWave(slot0)
	slot0.super.DoWave(slot0)
	playBGM(slot0._bgmName)
	slot0:doPass()
end

return
