ys = ys or {}
ys.Battle.BattleBuffHOT = class("BattleBuffHOT", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffHOT.__name = "BattleBuffHOT"

function ys.Battle.BattleBuffHOT.Ctor(slot0, slot1)
	slot0.Battle.BattleBuffHOT.super.Ctor(slot0, slot1)
end

function ys.Battle.BattleBuffHOT.SetArgs(slot0, slot1, slot2)
	slot0._number = slot0._tempData.arg_list.number or 0
	slot0._numberBase = slot0._number
	slot0._time = slot0._tempData.arg_list.time or 0
	slot0._nextEffectTime = pg.TimeMgr.GetInstance():GetCombatTime() + slot0._time
	slot0._maxHPRatio = slot0._tempData.arg_list.maxHPRatio or 0
	slot0._currentHPRatio = slot0._tempData.arg_list.currentHPRatio or 0
end

function ys.Battle.BattleBuffHOT.onStack(slot0, slot1, slot2)
	return
end

function ys.Battle.BattleBuffHOT.onUpdate(slot0, slot1, slot2, slot3)
	if slot0._nextEffectTime <= slot3 then
		slot1:UpdateHP(slot0:CalcNumber(slot1, slot2), {
			isMiss = false,
			isCri = false,
			isHeal = true
		})

		if slot1:IsAlive() then
			slot0._nextEffectTime = slot0._nextEffectTime + slot0._time
		end
	end
end

function ys.Battle.BattleBuffHOT.onRemove(slot0, slot1, slot2)
	slot1:UpdateHP(slot0:CalcNumber(slot1, slot2), {
		isMiss = false,
		isCri = false,
		isHeal = true
	})
end

function ys.Battle.BattleBuffHOT.CalcNumber(slot0, slot1, slot2)
	slot3, slot4 = slot1:GetHP()

	return math.max(0, math.floor(slot3 * slot0._currentHPRatio + slot4 * slot0._maxHPRatio + slot0._number) * slot2._stack)
end

return
