ys = ys or {}
ys.Battle.BattleBuffSize = class("BattleBuffSize", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffSize.__name = "BattleBuffSize"

ys.Battle.BattleBuffSize.Ctor = function (slot0, slot1)
	slot0.Battle.BattleBuffSize.super.Ctor(slot0, slot1)
end

ys.Battle.BattleBuffSize.SetArgs = function (slot0, slot1, slot2)
	slot0._number = slot0._tempData.arg_list.number or 1
end

ys.Battle.BattleBuffSize.onAttach = function (slot0, slot1, slot2)
	slot1:DispatchEvent(slot0.Event.New(slot0.Battle.BattleBuffEvent.BUFF_EFFECT_CHNAGE_SIZE, {
		size_ratio = slot0._number
	}))
end

ys.Battle.BattleBuffSize.onRemove = function (slot0, slot1, slot2)
	slot1:DispatchEvent(slot0.Event.New(slot0.Battle.BattleBuffEvent.BUFF_EFFECT_CHNAGE_SIZE, {
		size_ratio = 1 / slot0._number
	}))
end

return
