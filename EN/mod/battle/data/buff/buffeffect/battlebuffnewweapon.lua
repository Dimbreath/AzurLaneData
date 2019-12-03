ys = ys or {}
ys.Battle.BattleBuffNewWeapon = class("BattleBuffNewWeapon", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffNewWeapon.__name = "BattleBuffNewWeapon"

ys.Battle.BattleBuffNewWeapon.Ctor = function (slot0, slot1)
	slot0.Battle.BattleBuffNewWeapon.super.Ctor(slot0, slot1)
end

ys.Battle.BattleBuffNewWeapon.SetArgs = function (slot0, slot1, slot2)
	slot0._weaponID = slot0._tempData.arg_list.weapon_id
end

ys.Battle.BattleBuffNewWeapon.onAttach = function (slot0, slot1, slot2)
	slot0._weapon = slot1:AddNewAutoWeapon(slot0._weaponID)
end

ys.Battle.BattleBuffNewWeapon.onRemove = function (slot0, slot1, slot2)
	if slot0._weapon then
		slot0._weapon:Clear()
	end
end

return
