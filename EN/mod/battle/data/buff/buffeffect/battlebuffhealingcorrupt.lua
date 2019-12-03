ys = ys or {}
ys.Battle.BattleBuffHealingCorrupt = class("BattleBuffHealingCorrupt", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffHealingCorrupt.__name = "BattleBuffHealingCorrupt"
ys.Battle.BattleBuffHealingCorrupt.FX_TYPE = ys.Battle.BattleBuffEffect.FX_TYPE_LINK

function ys.Battle.BattleBuffHealingCorrupt.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

function ys.Battle.BattleBuffHealingCorrupt.SetArgs(slot0, slot1, slot2)
	slot0._corruptRate = slot0._tempData.arg_list.corruptRate or 1
	slot0._damageRate = slot3.damageRate or 1
end

function ys.Battle.BattleBuffHealingCorrupt.onTakeHealing(slot0, slot1, slot2, slot3)
	slot3.damage = slot3.damage - math.ceil(slot3.damage * slot0._corruptRate)

	slot1:UpdateHP(math.ceil(math.ceil(slot3.damage * slot0._corruptRate) * slot0._damageRate), {
		isMiss = false,
		isCri = false,
		isShare = false,
		isHeal = false
	})
end

return
