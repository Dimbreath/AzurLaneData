ys = ys or {}
ys.Battle.BattleBuffHealingSteal = class("BattleBuffHealingSteal", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffHealingSteal.__name = "BattleBuffHealingSteal"
ys.Battle.BattleBuffHealingSteal.FX_TYPE = ys.Battle.BattleBuffEffect.FX_TYPE_LINK

function ys.Battle.BattleBuffHealingSteal.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

function ys.Battle.BattleBuffHealingSteal.SetArgs(slot0, slot1, slot2)
	slot0._stealRate = slot0._tempData.arg_list.stealingRate or 1
	slot0._absorbRate = slot3.arsorbRate or 1
end

function ys.Battle.BattleBuffHealingSteal.onTakeHealing(slot0, slot1, slot2, slot3)
	slot4 = slot3.damage

	if slot2:GetCaster() and slot5:IsAlive() and slot5 ~= slot1 then
		slot3.damage = slot4 - math.ceil(slot4 * slot0._stealRate)

		slot5:UpdateHP(math.ceil(math.ceil(slot4 * slot0._stealRate) * slot0._absorbRate), {
			isMiss = false,
			isCri = false,
			isShare = false,
			isHeal = true
		})
	end
end

return
