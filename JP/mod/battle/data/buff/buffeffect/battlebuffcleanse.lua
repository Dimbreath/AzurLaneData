ys = ys or {}
slot1 = class("BattleBuffCleanse", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffCleanse = slot1
slot1.__name = "BattleBuffCleanse"

function slot1.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

function slot1.SetArgs(slot0, slot1, slot2)
	slot0._buffIDList = slot0._tempData.arg_list.buff_id_list
end

function slot1.onTrigger(slot0, slot1, slot2, slot3)
	slot0.super.onTrigger(slot0, slot1, slot2, slot3)

	for slot7, slot8 in ipairs(slot0._buffIDList) do
		slot1:RemoveBuff(slot8)
	end
end

return
