ys = ys or {}
slot0 = ys
slot0.Battle.BattleBuffFixRange = class("BattleBuffFixRange", slot0.Battle.BattleBuffEffect)
slot0.Battle.BattleBuffFixRange.__name = "BattleBuffFixRange"
slot1 = slot0.Battle.BattleBuffFixRange

function slot1.Ctor(slot0, slot1)
	uv0.super.Ctor(slot0, slot1)
end

function slot1.SetArgs(slot0, slot1, slot2)
	slot0._weaponRange = slot0._tempData.arg_list.weaponRange
	slot0._bulletRange = slot0._tempData.arg_list.bulletRange
	slot0._minRange = slot0._tempData.arg_list.minRange
end

function slot1.onAttach(slot0, slot1)
	if slot0._weaponRange or slot0._bulletRange then
		slot0:updateBulletRange(slot1, slot0._weaponRange, slot0._bulletRange, slot0._minRange)
	end
end

function slot1.onRemove(slot0, slot1)
	slot0:updateBulletRange(slot1)
end

function slot1.updateBulletRange(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot1:GetAllWeapon()

	for slot9, slot10 in ipairs(slot0._indexRequire) do
		for slot14, slot15 in ipairs(slot5) do
			if slot15:GetEquipmentIndex() == slot10 then
				slot15:FixWeaponRange(slot2, slot3, slot4)
			end
		end
	end
end
