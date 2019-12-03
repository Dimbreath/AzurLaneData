ys = ys or {}
ys.Battle.BattleJammingWave = class("BattleJammingWave", ys.Battle.BattleWaveInfo)
ys.Battle.BattleJammingWave.__name = "BattleJammingWave"
ys.Battle.BattleJammingWave.JAMMING_ENGAGE = 1
ys.Battle.BattleJammingWave.JAMMING_DODGE = 2

ys.Battle.BattleJammingWave.Ctor = function (slot0)
	slot0.super.Ctor(slot0)
end

ys.Battle.BattleJammingWave.DoWave = function (slot0)
	slot0.super.DoWave(slot0)

	if slot0.super.DoWave.Battle.BattleDataProxy.GetInstance().GetInitData(slot1).KizunaJamming and table.contains(slot3, slot0.JAMMING_ENGAGE) then
		slot1:KizunaJamming()
	end

	slot0:doFinish()
end

return
