ys = ys or {}
ys.Battle.BattleBuffShiftWeaponSkin = class("BattleBuffShiftWeaponSkin", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffShiftWeaponSkin.__name = "BattleBuffShiftWeaponSkin"

ys.Battle.BattleBuffShiftWeaponSkin.Ctor = function (slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

ys.Battle.BattleBuffShiftWeaponSkin.SetArgs = function (slot0, slot1, slot2)
	slot0._weaponIndex = slot0._tempData.arg_list.index
	slot0._skinID = slot0._tempData.arg_list.skin_id
end

ys.Battle.BattleBuffShiftWeaponSkin.onAttach = function (slot0, slot1, slot2)
	slot0:shiftWeaponSkin(slot1)
end

ys.Battle.BattleBuffShiftWeaponSkin.onRemove = function (slot0, slot1, slot2)
	return
end

ys.Battle.BattleBuffShiftWeaponSkin.shiftWeaponSkin = function (slot0, slot1)
	slot2 = slot1:GetAllWeapon()

	for slot6, slot7 in ipairs(slot0._indexRequire) do
		for slot11, slot12 in ipairs(slot2) do
			if slot12:GetEquipmentIndex() == slot7 then
				slot12:SetSkinData(slot0._skinID)
			end
		end
	end
end

return
