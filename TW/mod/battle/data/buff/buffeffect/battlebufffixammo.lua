ys = ys or {}
ys.Battle.BattleBuffFixAmmo = class("BattleBuffFixAmmo", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffFixAmmo.__name = "BattleBuffFixAmmo"

function ys.Battle.BattleBuffFixAmmo.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

function ys.Battle.BattleBuffFixAmmo.SetArgs(slot0, slot1, slot2)
	slot0._damageRate = slot0._tempData.arg_list.damage_rate
end

function ys.Battle.BattleBuffFixAmmo.onAttach(slot0, slot1, slot2)
	slot0:updateAmmo(slot1, slot0._damageRate)
end

function ys.Battle.BattleBuffFixAmmo.onRemove(slot0, slot1, slot2)
	slot0:updateAmmo(slot1)
end

function ys.Battle.BattleBuffFixAmmo.updateAmmo(slot0, slot1, slot2)
	slot3 = slot1:GetAllWeapon()

	for slot7, slot8 in ipairs(slot0._indexRequire) do
		for slot12, slot13 in ipairs(slot3) do
			if slot13:GetEquipmentIndex() == slot8 then
				slot13:FixAmmo(slot2)
			end
		end
	end
end

return
