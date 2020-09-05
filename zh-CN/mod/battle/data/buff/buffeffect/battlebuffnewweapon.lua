ys = ys or {}
slot0 = ys
slot0.Battle.BattleBuffNewWeapon = class("BattleBuffNewWeapon", slot0.Battle.BattleBuffEffect)
slot0.Battle.BattleBuffNewWeapon.__name = "BattleBuffNewWeapon"

function slot0.Battle.BattleBuffNewWeapon.Ctor(slot0, slot1)
	uv0.Battle.BattleBuffNewWeapon.super.Ctor(slot0, slot1)
end

function slot0.Battle.BattleBuffNewWeapon.SetArgs(slot0, slot1, slot2)
	slot0._weaponID = slot0._tempData.arg_list.weapon_id
end

function slot0.Battle.BattleBuffNewWeapon.onAttach(slot0, slot1, slot2)
	slot0._weapon = slot1:AddNewAutoWeapon(slot0._weaponID)
end

function slot0.Battle.BattleBuffNewWeapon.onRemove(slot0, slot1, slot2)
	if slot0._weapon then
		slot0._weapon:Clear()
	end
end
