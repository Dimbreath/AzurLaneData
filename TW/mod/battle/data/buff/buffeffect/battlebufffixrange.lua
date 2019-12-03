ys = ys or {}
ys.Battle.BattleBuffFixRange = class("BattleBuffFixRange", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffFixRange.__name = "BattleBuffFixRange"

function ys.Battle.BattleBuffFixRange.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

function ys.Battle.BattleBuffFixRange.SetArgs(slot0, slot1, slot2)
	slot0._weaponRange = slot0._tempData.arg_list.weaponRange
	slot0._bulletRange = slot0._tempData.arg_list.bulletRange
	slot0._minRange = slot0._tempData.arg_list.minRange
end

function ys.Battle.BattleBuffFixRange.onAttach(slot0, slot1)
	if slot0._weaponRange or slot0._bulletRange then
		slot0:updateBulletRange(slot1, slot0._weaponRange, slot0._bulletRange, slot0._minRange)
	end
end

function ys.Battle.BattleBuffFixRange.onRemove(slot0, slot1)
	slot0:updateBulletRange(slot1)
end

function ys.Battle.BattleBuffFixRange.updateBulletRange(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot1:GetAllWeapon()

	for slot9, slot10 in ipairs(slot0._indexRequire) do
		for slot14, slot15 in ipairs(slot5) do
			if slot15:GetEquipmentIndex() == slot10 then
				slot15:FixWeaponRange(slot2, slot3, slot4)
			end
		end
	end
end

return
