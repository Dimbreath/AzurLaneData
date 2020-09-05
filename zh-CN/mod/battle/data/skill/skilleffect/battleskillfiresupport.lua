ys = ys or {}
slot0 = ys
slot1 = slot0.Battle.BattleDataFunction
slot2 = class("BattleSkillFireSupport", slot0.Battle.BattleSkillEffect)
slot0.Battle.BattleSkillFireSupport = slot2
slot2.__name = "BattleSkillFireSupport"

function slot2.Ctor(slot0, slot1)
	uv0.super.Ctor(slot0, slot1, lv)

	slot0._weaponID = slot0._tempData.arg_list.weapon_id
	slot0._supportTargetFilter = slot0._tempData.arg_list.supportTarget.targetChoice
	slot0._supportTargetArgList = slot0._tempData.arg_list.supportTarget.arg_list
end

function slot2.DoDataEffect(slot0, slot1, slot2)
	if slot0._weapon == nil then
		for slot7, slot8 in ipairs(slot0._supportTargetFilter) do
			slot3 = uv0.Battle.BattleTargetChoise[slot8](slot1, slot0._supportTargetArgList, nil)
		end

		slot0._weapon = uv0.Battle.BattleDataFunction.CreateWeaponUnit(slot0._weaponID, slot1)

		if slot3[1] then
			slot0._weapon:SetStandHost(slot4)
		end

		slot1:DispatchEvent(uv0.Event.New(uv0.Battle.BattleUnitEvent.CREATE_TEMPORARY_WEAPON, {
			weapon = slot0._weapon
		}))
	end

	slot0._weapon:updateMovementInfo()
	slot0._weapon:SingleFire(slot2, slot0._emitter)
end

function slot2.DoDataEffectWithoutTarget(slot0, slot1)
	slot0:DoDataEffect(slot1)
end

function slot2.Clear(slot0)
	uv0.super.Clear(slot0)

	if slot0._weapon then
		slot0._weapon:Clear()
	end
end
