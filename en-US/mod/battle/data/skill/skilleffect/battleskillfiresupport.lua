ys = ys or {}
slot1 = ys.Battle.BattleDataFunction
slot2 = class("BattleSkillFireSupport", ys.Battle.BattleSkillEffect)
ys.Battle.BattleSkillFireSupport = slot2
slot2.__name = "BattleSkillFireSupport"

function slot2.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1, lv)

	slot0._weaponID = slot0._tempData.arg_list.weapon_id
	slot0._supportTargetFilter = slot0._tempData.arg_list.supportTarget.targetChoice
	slot0._supportTargetArgList = slot0._tempData.arg_list.supportTarget.arg_list
end

function slot2.DoDataEffect(slot0, slot1, slot2)
	if slot0._weapon == nil then
		slot3 = nil

		for slot7, slot8 in ipairs(slot0._supportTargetFilter) do
			slot3 = slot0.Battle.BattleTargetChoise[slot8](slot1, slot0._supportTargetArgList, slot3)
		end

		slot0._weapon = slot0.Battle.BattleDataFunction.CreateWeaponUnit(slot0._weaponID, slot1)

		if slot3[1] then
			slot0._weapon:SetStandHost(slot4)
		end

		slot1:DispatchEvent(slot0.Event.New(slot0.Battle.BattleUnitEvent.CREATE_TEMPORARY_WEAPON, slot5))
	end

	slot0._weapon:updateMovementInfo()
	slot0._weapon:SingleFire(slot2, slot0._emitter)
end

function slot2.DoDataEffectWithoutTarget(slot0, slot1)
	slot0:DoDataEffect(slot1)
end

function slot2.Clear(slot0)
	slot0.super.Clear(slot0)

	if slot0._weapon then
		slot0._weapon:Clear()
	end
end

return
