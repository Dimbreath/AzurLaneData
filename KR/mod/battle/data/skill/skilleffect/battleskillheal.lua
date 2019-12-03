ys = ys or {}
ys.Battle.BattleSkillHeal = class("BattleSkillHeal", ys.Battle.BattleSkillEffect)
ys.Battle.BattleSkillHeal.__name = "BattleSkillHeal"

function ys.Battle.BattleSkillHeal.Ctor(slot0, slot1)
	slot0.Battle.BattleSkillHeal.super.Ctor(slot0, slot1, lv)

	slot0._number = slot0._tempData.arg_list.number or 0
	slot0._maxHPRatio = slot0._tempData.arg_list.maxHPRatio or 0
end

function ys.Battle.BattleSkillHeal.DoDataEffect(slot0, slot1, slot2)
	if slot0:IsFilterTarget(slot1, slot2) then
		slot2:UpdateHP(math.max(0, math.floor((slot2:GetMaxHP() * slot0._maxHPRatio + math.floor(slot0._number * slot0.Battle.BattleFormulas.HealFixer(slot0.Battle.BattleDataProxy.GetInstance():GetInitData().battleType, slot2:GetAttr()))) * (slot1:GetAttrByName("healingEnhancement") + 1))), {
			isMiss = false,
			isCri = false,
			isHeal = true
		})
	end
end

return
