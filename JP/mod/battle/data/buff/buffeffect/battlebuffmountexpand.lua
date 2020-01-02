ys = ys or {}
slot1 = class("BattleBuffMountExpand", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffMountExpand = slot1
slot1.__name = "BattleBuffMountExpand"

function slot1.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

function slot1.SetArgs(slot0, slot1, slot2)
	slot0._weaponIndex = slot0._tempData.arg_list.index
end

function slot1.onAttach(slot0, slot1, slot2)
	slot1:ExpandWeaponMount(slot0._weaponIndex)
end

return
