ys = ys or {}
ys.Battle.BattleBuffSetAttr = class("BattleBuffSetAttr", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffSetAttr.__name = "BattleBuffSetAttr"

ys.Battle.BattleBuffSetAttr.Ctor = function (slot0, slot1)
	slot0.Battle.BattleBuffSetAttr.super.Ctor(slot0, slot1)
end

ys.Battle.BattleBuffSetAttr.SetArgs = function (slot0, slot1, slot2)
	slot0._attr = slot0._tempData.arg_list.attr
	slot0._value = slot0._tempData.arg_list.value
end

ys.Battle.BattleBuffSetAttr.onAttach = function (slot0, slot1, slot2)
	slot0.Battle.BattleAttr.SetCurrent(slot1, slot0._attr, slot0._value)
end

ys.Battle.BattleBuffSetAttr.onRemove = function (slot0, slot1, slot2)
	slot0.Battle.BattleAttr.SetCurrent(slot1, slot0._attr, 0)
end

return
