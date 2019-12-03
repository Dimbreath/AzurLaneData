ys = ys or {}
ys.Battle.BattleBuffShiftWeapon = class("BattleBuffShiftWeapon", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffShiftWeapon.__name = "BattleBuffShiftWeapon"

ys.Battle.BattleBuffShiftWeapon.Ctor = function (slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

ys.Battle.BattleBuffShiftWeapon.SetArgs = function (slot0, slot1, slot2)
	slot0._detachID = slot0._tempData.arg_list.detach_id
	slot0._attachID = slot0._tempData.arg_list.attach_id
end

ys.Battle.BattleBuffShiftWeapon.onAttach = function (slot0, slot1, slot2)
	slot0:shiftWeapon(slot1)
end

ys.Battle.BattleBuffShiftWeapon.shiftWeapon = function (slot0, slot1)
	if not slot1:RemoveWeapon(slot0._detachID) then
		return
	end

	slot3 = slot2:GetEquipmentLabel()
	slot4 = slot2:GetSkinID()
	slot5 = slot2:GetPotential()
	slot6 = slot2:GetEquipmentIndex()
	slot7 = 0

	while slot2 ~= nil do
		slot7 = slot7 + 1
		slot2 = slot1:RemoveWeapon(slot0._detachID)
	end

	for slot11 = 1, slot7, 1 do
		slot1:AddWeapon(slot0._attachID, slot3, slot4, slot5, slot6)
	end
end

return
