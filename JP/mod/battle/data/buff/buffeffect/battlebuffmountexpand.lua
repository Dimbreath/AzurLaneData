ys = ys or {}
slot1 = class("BattleBuffMountExpand", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffMountExpand = slot1
slot1.__name = "BattleBuffMountExpand"

slot1.Ctor = function (slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

slot1.SetArgs = function (slot0, slot1, slot2)
	slot0._weaponIndex = slot0._tempData.arg_list.index
end

slot1.onAttach = function (slot0, slot1, slot2)
	slot1:ExpandWeaponMount(slot0._weaponIndex)
end

return
