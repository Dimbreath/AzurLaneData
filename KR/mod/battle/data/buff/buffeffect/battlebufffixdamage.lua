ys = ys or {}
ys.Battle.BattleBuffFixDamage = class("BattleBuffFixDamage", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffFixDamage.__name = "BattleBuffFixDamage"

ys.Battle.BattleBuffFixDamage.Ctor = function (slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

ys.Battle.BattleBuffFixDamage.SetArgs = function (slot0, slot1, slot2)
	slot0._rant = slot0._tempData.arg_list.rant or 10000
	slot0._value = slot0._tempData.arg_list.value
end

ys.Battle.BattleBuffFixDamage.onTrigger = function (slot0, slot1, slot2, slot3)
	if not slot0.Battle.BattleFormulas.IsHappen(slot0._rant) then
		return "chance"
	end

	if slot0._value < slot3.damage then
		slot3.damage = slot0._value
	end
end

return
