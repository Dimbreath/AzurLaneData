ys = ys or {}
slot1 = class("BattleBuffAddTag", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffAddTag = slot1
slot1.__name = "BattleBuffAddTag"

function slot1.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

function slot1.SetArgs(slot0, slot1, slot2)
	slot0._labelTag = slot0._tempData.arg_list.tag
end

function slot1.onAttach(slot0, slot1, slot2)
	slot1:AddLabelTag(slot0._labelTag)
end

function slot1.onRemove(slot0, slot1, slot2)
	slot1:RemoveLabelTag(slot0._labelTag)
end

return
