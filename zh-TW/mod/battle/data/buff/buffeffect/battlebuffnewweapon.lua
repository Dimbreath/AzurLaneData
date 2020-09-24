ys = ys or {}
slot0 = ys
slot1 = class("BattleBuffNewWeapon", slot0.Battle.BattleBuffEffect)
slot0.Battle.BattleBuffNewWeapon = slot1
slot1.__name = "BattleBuffNewWeapon"

function slot1.Ctor(slot0, slot1)
	uv0.super.Ctor(slot0, slot1)
end

function slot1.SetArgs(slot0, slot1, slot2)
	slot0._weaponID = slot0._tempData.arg_list.weapon_id
	slot0._reverse = slot0._tempData.arg_list.reverse
end

function slot1.onAttach(slot0, slot1, slot2)
	if slot0._reverse then
		slot1:RemoveAutoWeaponByWeaponID(slot0._weaponID)
	else
		slot0._weapon = slot1:AddNewAutoWeapon(slot0._weaponID)
	end
end

function slot1.onRemove(slot0, slot1, slot2)
	if slot0._reverse then
		slot1:AddNewAutoWeapon(slot0._weaponID)
	elseif slot0._weapon then
		slot1:RemoveAutoWeapon(slot0._weapon)
	end
end

function slot1.Dispose(slot0)
	uv0.super.Dispose(slot0)

	slot0._weapon = nil
end
