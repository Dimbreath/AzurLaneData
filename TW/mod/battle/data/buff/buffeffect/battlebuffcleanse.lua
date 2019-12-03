ys = ys or {}
slot1 = class("BattleBuffCleanse", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffCleanse = slot1
slot1.__name = "BattleBuffCleanse"

slot1.Ctor = function (slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

slot1.SetArgs = function (slot0, slot1, slot2)
	slot0._buffIDList = slot0._tempData.arg_list.buff_id_list
end

slot1.onTrigger = function (slot0, slot1, slot2, slot3)
	slot0.super.onTrigger(slot0, slot1, slot2, slot3)

	for slot7, slot8 in ipairs(slot0._buffIDList) do
		slot1:RemoveBuff(slot8)
	end
end

return
