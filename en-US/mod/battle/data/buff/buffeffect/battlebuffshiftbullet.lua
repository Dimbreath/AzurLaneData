ys = ys or {}
ys.Battle.BattleBuffShiftBullet = class("BattleBuffShiftBullet", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffShiftBullet.__name = "BattleBuffShiftBullet"

function ys.Battle.BattleBuffShiftBullet.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

function ys.Battle.BattleBuffShiftBullet.SetArgs(slot0, slot1, slot2)
	slot0._bulletID = slot0._tempData.arg_list.bullet_id
end

function ys.Battle.BattleBuffShiftBullet.onAttach(slot0, slot1, slot2)
	slot0:shiftBullet(slot1, slot0._bulletID)
end

function ys.Battle.BattleBuffShiftBullet.onRemove(slot0, slot1, slot2)
	slot0:shiftBullet(slot1)
end

function ys.Battle.BattleBuffShiftBullet.shiftBullet(slot0, slot1, slot2)
	slot3 = slot1:GetAllWeapon()

	for slot7, slot8 in ipairs(slot0._indexRequire) do
		for slot12, slot13 in ipairs(slot3) do
			if slot13:GetEquipmentIndex() == slot8 then
				if slot2 then
					slot13:ShiftBullet(slot2)
				else
					slot13:RevertBullet()
				end
			end
		end
	end
end

return
