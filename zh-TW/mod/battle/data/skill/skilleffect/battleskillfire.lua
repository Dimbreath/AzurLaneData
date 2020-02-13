ys = ys or {}
slot1 = ys.Battle.BattleDataFunction
slot2 = class("BattleSkillFire", ys.Battle.BattleSkillEffect)
ys.Battle.BattleSkillFire = slot2
slot2.__name = "BattleSkillFire"

function slot2.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1, lv)

	slot0._weaponID = slot0._tempData.arg_list.weapon_id
	slot0._caster_choise = slot0._tempData.arg_list.caster
	slot0._caster_choise_args = {}
	slot0._emitter = slot0._tempData.arg_list.emitter
	slot0._useSkin = slot0._tempData.arg_list.useSkin
end

function slot2.SetWeaponSkin(slot0, slot1)
	slot0._modelID = slot1
end

function slot2.DoDataEffect(slot0, slot1, slot2)
	if slot0._weapon == nil then
		slot0._weapon = slot0.Battle.BattleDataFunction.CreateWeaponUnit(slot0._weaponID, slot1)

		if slot0._modelID then
			slot0._weapon:SetModelID(slot0._modelID)
		elseif slot0._useSkin and slot1:GetPriorityWeaponSkin() then
			slot0._weapon:SetModelID(slot1.GetEquipSkin(slot3))
		end

		slot1:DispatchEvent(slot0.Event.New(slot0.Battle.BattleUnitEvent.CREATE_TEMPORARY_WEAPON, slot3))
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

function slot2.Dispose(slot0)
	slot0.super.Dispose(slot0)
end

return
