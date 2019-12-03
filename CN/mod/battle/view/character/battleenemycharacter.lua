ys = ys or {}
slot1 = ys.Battle.BattleUnitEvent
ys.Battle.BattleEnemyCharacter = class("BattleEnemyCharacter", ys.Battle.BattleCharacter)
ys.Battle.BattleEnemyCharacter.__name = "BattleEnemyCharacter"

ys.Battle.BattleEnemyCharacter.Ctor = function (slot0)
	slot0.super.Ctor(slot0)

	slot0._preCastBound = false
end

ys.Battle.BattleEnemyCharacter.RegisterWeaponListener = function (slot0, slot1)
	slot0.super.RegisterWeaponListener(slot0, slot1)
	slot1:RegisterEventListener(slot0, slot1.WEAPON_PRE_CAST, slot0.onWeaponPreCast)
	slot1:RegisterEventListener(slot0, slot1.WEAPON_PRE_CAST_FINISH, slot0.onWeaponPrecastFinish)
	slot1:RegisterEventListener(slot0, slot1.WEAPON_INTERRUPT, slot0.onWeaponInterrupted)
end

ys.Battle.BattleEnemyCharacter.UnregisterWeaponListener = function (slot0, slot1)
	slot0.super.UnregisterWeaponListener(slot0, slot1)
	slot1:UnregisterEventListener(slot0, slot1.WEAPON_PRE_CAST)
	slot1:UnregisterEventListener(slot0, slot1.WEAPON_PRE_CAST_FINISH)
	slot1:UnregisterEventListener(slot0, slot1.WEAPON_INTERRUPT)
end

ys.Battle.BattleEnemyCharacter.Update = function (slot0)
	slot0.super.Update(slot0)
	slot0:UpdatePosition()
	slot0:UpdateMatrix()
	slot0:UpdateArrowBarPostition()
	slot0:UpdateArrowBarRotation()

	if slot0._vigilantBar then
		slot0:UpdateVigilantBarPosition()
		slot0._vigilantBar:UpdateVigilantProgress()
	end
end

ys.Battle.BattleEnemyCharacter.Dispose = function (slot0)
	if slot0._vigilantBar then
		slot0._vigilantBar:Dispose()

		slot0._vigilantBar = nil
	end

	slot0._factory:GetArrowPool():DestroyObj(slot0._arrowBar)
	slot0.super.Dispose(slot0)
end

ys.Battle.BattleEnemyCharacter.GetModleID = function (slot0)
	return slot0._unitData:GetTemplate().prefab
end

ys.Battle.BattleEnemyCharacter.onWeaponPreCast = function (slot0, slot1)
	slot0:AddFX(slot1.Data.fx, true)

	slot0._preCastBound = slot1.Data.isBound
end

ys.Battle.BattleEnemyCharacter.onWeaponPrecastFinish = function (slot0, slot1)
	slot0:RemoveCacheFX(slot1.Data.fx)

	slot0._preCastBound = false
end

ys.Battle.BattleEnemyCharacter.OnUpdateHP = function (slot0, slot1)
	slot0.super.OnUpdateHP(slot0, slot1)

	if slot1.Data.dHP <= 0 then
		slot0:AddBlink(1, 1, 1, 0.1, 0.1, true)
	end
end

ys.Battle.BattleEnemyCharacter.UpdateHPBarPostition = function (slot0)
	if not slot0._hideHP then
		slot0._hpBarPos:Copy(slot0._referenceVector):Add(slot0._hpBarOffset)

		slot0._HPBarTf.position = slot0._hpBarPos
	end
end

ys.Battle.BattleEnemyCharacter.AddModel = function (slot0, slot1)
	slot0.super.AddModel(slot0, slot1)

	slot0._hpBarOffset = Vector3(0, slot0._unitData:GetTemplate().hp_bar[2], 0)
end

ys.Battle.BattleEnemyCharacter.AddShadow = function (slot0, slot1)
	slot0.super.AddShadow(slot0, slot1)
end

ys.Battle.BattleEnemyCharacter.GetSpecificFXScale = function (slot0)
	return slot0._unitData:GetTemplate().specific_fx_scale
end

ys.Battle.BattleEnemyCharacter.OnAnimatorTrigger = function (slot0)
	slot0._unitData:CharacterActionTriggerCallback()
end

ys.Battle.BattleEnemyCharacter.OnAnimatorEnd = function (slot0)
	slot0._unitData:CharacterActionEndCallback()
end

ys.Battle.BattleEnemyCharacter.OnAnimatorStart = function (slot0)
	slot0._unitData:CharacterActionStartCallback()
end

return
