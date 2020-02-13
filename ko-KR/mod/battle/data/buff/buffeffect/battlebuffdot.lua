ys = ys or {}
slot1 = ys.Battle.BattleAttr
slot2 = ys.Battle.BattleFormulas
ys.Battle.BattleBuffDOT = class("BattleBuffDOT", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffDOT.__name = "BattleBuffDOT"

function ys.Battle.BattleBuffDOT.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

function ys.Battle.BattleBuffDOT.SetArgs(slot0, slot1, slot2)
	slot0._number = slot0._tempData.arg_list.number or 0
	slot0._numberBase = slot0._number
	slot0._time = slot0._tempData.arg_list.time or 0
	slot0._nextEffectTime = pg.TimeMgr.GetInstance():GetCombatTime() + slot0._time
	slot0._maxHPRatio = slot0._tempData.arg_list.maxHPRatio or 0
	slot0._currentHPRatio = slot0._tempData.arg_list.currentHPRatio or 0
	slot0._minRestHPRatio = slot0._tempData.arg_list.minRestHPRatio or 0
	slot0._level = slot0._level or 0

	if slot0._orb then
		slot2:SetOrbDuration(slot4)

		slot0._damageEnhance = slot0.CaclulateDOTDamageEnhanceRate(slot0._tempData, slot0._orb, slot1)
		slot0._igniteAttr = slot0._tempData.arg_list.attr
		slot0._igniteCoefficient = slot0._tempData.arg_list.k
		slot0._igniteDMG = slot0.CalculateIgniteDamage(slot0._orb, slot0._igniteAttr, slot0._igniteCoefficient)
		slot0._igniteDMG = slot0._igniteDMG
	else
		slot0._igniteDMG = 0
		slot0._damageEnhance = 1
	end
end

function ys.Battle.BattleBuffDOT.onStack(slot0, slot1, slot2)
	return
end

function ys.Battle.BattleBuffDOT.onUpdate(slot0, slot1, slot2, slot3)
	if slot0._nextEffectTime <= slot3 then
		slot1:UpdateHP(-slot0:CalcNumber(slot1, slot2), slot5)
		slot0.Battle.BattleDataProxy.GetInstance():DamageStatistics(nil, slot1:GetAttrByName("id"), slot0.CalcNumber(slot1, slot2))

		if slot1:IsAlive() then
			slot0._nextEffectTime = slot0._nextEffectTime + slot0._time
		end
	end
end

function ys.Battle.BattleBuffDOT.onRemove(slot0, slot1, slot2)
	slot1:UpdateHP(-slot0:CalcNumber(slot1, slot2), slot4)
	slot0.Battle.BattleDataProxy.GetInstance():DamageStatistics(nil, slot1:GetAttrByName("id"), slot0.CalcNumber(slot1, slot2))
end

function ys.Battle.BattleBuffDOT.CalcNumber(slot0, slot1, slot2)
	slot3, slot4 = slot1:GetHP()

	return math.max(0, math.floor(math.min(slot3 - slot4 * slot0._minRestHPRatio, (slot3 * slot0._currentHPRatio + slot4 * slot0._maxHPRatio + slot0._number + slot0._igniteDMG) * (1 + slot0._damageEnhance) * slot2._stack * slot0.GetCurrent(slot1, "repressReduce"))))
end

function ys.Battle.BattleBuffDOT.SetOrb(slot0, slot1, slot2, slot3)
	slot0._orb = slot2
	slot0._level = slot3

	slot1:SetOrbLevel(slot0._level)
end

return
