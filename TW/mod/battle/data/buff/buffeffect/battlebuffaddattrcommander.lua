ys = ys or {}
slot1 = class("BattleBuffAddAttrCommander", ys.Battle.BattleBuffAddAttr)
ys.Battle.BattleBuffAddAttrCommander = slot1
slot1.__name = "BattleBuffAddAttrCommander"

function slot1.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

function slot1.GetEffectType(slot0)
	return slot0.Battle.BattleBuffEffect.FX_TYPE_MOD_ATTR
end

function slot1.SetArgs(slot0, slot1, slot2)
	slot0._group = slot0._tempData.arg_list.group or slot2:GetID()
	slot0._attr = slot0._tempData.arg_list.convertAttr
	slot0._number = slot0._commander:getAbilitys()[slot0._tempData.arg_list.ability].value * slot0._tempData.arg_list.convertRate
	slot0._numberBase = slot0._number
end

return
