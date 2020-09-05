ys = ys or {}
slot0 = ys
slot1 = slot0.Battle.BattleAttr
slot2 = slot0.Battle.BattleFormulas
slot0.Battle.BattleBuffDOT = class("BattleBuffDOT", slot0.Battle.BattleBuffEffect)
slot0.Battle.BattleBuffDOT.__name = "BattleBuffDOT"
slot3 = slot0.Battle.BattleBuffDOT

function slot3.Ctor(slot0, slot1)
	uv0.super.Ctor(slot0, slot1)
end

function slot3.SetArgs(slot0, slot1, slot2)
	slot0._number = slot0._tempData.arg_list.number or 0
	slot0._numberBase = slot0._number
	slot0._time = slot0._tempData.arg_list.time or 0
	slot0._nextEffectTime = pg.TimeMgr.GetInstance():GetCombatTime() + slot0._time
	slot0._maxHPRatio = slot0._tempData.arg_list.maxHPRatio or 0
	slot0._currentHPRatio = slot0._tempData.arg_list.currentHPRatio or 0
	slot0._minRestHPRatio = slot0._tempData.arg_list.minRestHPRatio or 0
	slot0._level = slot0._level or 0

	if slot0._orb then
		slot2:SetOrbDuration(uv0.CaclulateDOTDuration(slot0._tempData, slot0._orb, slot1))

		slot0._igniteAttr = slot0._tempData.arg_list.attr
		slot0._igniteCoefficient = slot0._tempData.arg_list.k
		slot0._igniteDMG = uv0.CalculateIgniteDamage(slot0._orb, slot0._igniteAttr, slot0._igniteCoefficient)
		slot0._igniteDMG = slot0._igniteDMG
	else
		slot0._igniteDMG = 0
	end
end

function slot3.onStack(slot0, slot1, slot2)
end

function slot3.onUpdate(slot0, slot1, slot2, slot3)
	if slot0._nextEffectTime <= slot3 then
		slot4 = slot0:CalcNumber(slot1, slot2)

		slot1:UpdateHP(-slot4, {
			isMiss = false,
			isCri = false,
			isHeal = false
		})
		uv0.Battle.BattleDataProxy.GetInstance():DamageStatistics(nil, slot1:GetAttrByName("id"), slot4)

		if slot1:IsAlive() then
			slot0._nextEffectTime = slot0._nextEffectTime + slot0._time
		end
	end
end

function slot3.onRemove(slot0, slot1, slot2)
	slot3 = slot0:CalcNumber(slot1, slot2)

	slot1:UpdateHP(-slot3, {
		isMiss = false,
		isCri = false,
		isHeal = false
	})
	uv0.Battle.BattleDataProxy.GetInstance():DamageStatistics(nil, slot1:GetAttrByName("id"), slot3)
end

function slot3.CalcNumber(slot0, slot1, slot2)
	slot3 = 0

	if slot0._orb then
		slot3 = uv0.CaclulateDOTDamageEnhanceRate(slot0._tempData, slot0._orb, slot1)
	end

	slot4, slot5 = slot1:GetHP()

	return math.max(0, math.floor(math.min(slot4 - slot5 * slot0._minRestHPRatio, (slot4 * slot0._currentHPRatio + slot5 * slot0._maxHPRatio + slot0._number + slot0._igniteDMG) * (1 + slot3) * slot2._stack * uv1.GetCurrent(slot1, "repressReduce"))))
end

function slot3.SetOrb(slot0, slot1, slot2, slot3)
	slot0._orb = slot2
	slot0._level = slot3

	slot1:SetOrbLevel(slot0._level)
end
