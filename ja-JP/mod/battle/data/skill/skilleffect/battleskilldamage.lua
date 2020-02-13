ys = ys or {}
ys.Battle.BattleSkillDamage = class("BattleSkillDamage", ys.Battle.BattleSkillEffect)
ys.Battle.BattleSkillDamage.__name = "BattleSkillDamage"

function ys.Battle.BattleSkillDamage.Ctor(slot0, slot1)
	slot0.Battle.BattleSkillDamage.super.Ctor(slot0, slot1, lv)

	slot0._number = slot0._tempData.arg_list.number or 0
	slot0._rate = slot0._tempData.arg_list.rate or 0
end

function ys.Battle.BattleSkillDamage.DoDataEffect(slot0, slot1, slot2)
	slot4, slot5 = slot2:GetHP()

	slot2:UpdateHP(-(math.floor(slot5 * slot0._rate) + slot0._number), {
		isMiss = false,
		isCri = false,
		isHeal = false
	})

	if not slot2:IsAlive() then
		slot0.Battle.BattleAttr.Spirit(slot2)
		slot0.Battle.BattleAttr.Whosyourdaddy(slot2)
	end
end

return
