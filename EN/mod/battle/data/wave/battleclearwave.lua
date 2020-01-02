ys = ys or {}
ys.Battle.BattleClearWave = class("BattleClearWave", ys.Battle.BattleWaveInfo)
ys.Battle.BattleClearWave.__name = "BattleClearWave"

function ys.Battle.BattleClearWave.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function ys.Battle.BattleClearWave.DoWave(slot0)
	slot0.super.DoWave(slot0)

	slot1 = slot0.super.DoWave.Battle.BattleState.GetInstance()
	slot2 = slot1:GetProxyByName(slot1.Battle.BattleDataProxy.__name)

	slot2:KillAllAircraft()
	slot2:KillSubmarineByIFF(slot1.Battle.BattleConfig.FOE_CODE)
	slot1:GetMediatorByName(slot1.Battle.BattleSceneMediator.__name).AllBulletNeutralize(slot3)
	slot0:doPass()
end

return
