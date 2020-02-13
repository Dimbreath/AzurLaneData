ys = ys or {}
ys.Battle.BattleRangeWave = class("BattleRangeWave", ys.Battle.BattleWaveInfo)
ys.Battle.BattleRangeWave.__name = "BattleRangeWave"

function ys.Battle.BattleRangeWave.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function ys.Battle.BattleRangeWave.SetWaveData(slot0, slot1)
	slot0.super.SetWaveData(slot0, slot1)

	slot0._pos = Vector3(slot0._param.rect[1], 0, slot0._param.rect[2])
	slot0._width = slot0._param.rect[3]
	slot0._height = slot0._param.rect[4]
	slot0._lifeTime = 99999
end

function ys.Battle.BattleRangeWave.DoWave(slot0)
	slot0.super.DoWave(slot0)
	slot0._spawnFunc(slot0._pos, slot0._width, slot0._height, slot0._lifeTime, function (slot0, slot1)
		for slot5, slot6 in ipairs(slot0) do
			if slot6.IFF ~= slot1:GetCldData().IFF then
				slot1:SetActiveFlag(false)
				slot0:doPass()

				break
			end
		end
	end)
end

return
