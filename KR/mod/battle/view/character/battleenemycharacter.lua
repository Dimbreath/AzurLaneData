ys = ys or {}
slot1 = ys.Battle.BattleUnitEvent
ys.Battle.BattleEnemyCharacter = class("BattleEnemyCharacter", ys.Battle.BattleCharacter)
ys.Battle.BattleEnemyCharacter.__name = "BattleEnemyCharacter"

function ys.Battle.BattleEnemyCharacter.Ctor(slot0)
	slot0.super.Ctor(slot0)

	slot0._preCastBound = false
end

function ys.Battle.BattleEnemyCharacter.RegisterWeaponListener(slot0, slot1)
	slot0.super.RegisterWeaponListener(slot0, slot1)
	slot1:RegisterEventListener(slot0, slot1.WEAPON_PRE_CAST, slot0.onWeaponPreCast)
	slot1:RegisterEventListener(slot0, slot1.WEAPON_PRE_CAST_FINISH, slot0.onWeaponPrecastFinish)
	slot1:RegisterEventListener(slot0, slot1.WEAPON_INTERRUPT, slot0.onWeaponInterrupted)
end

function ys.Battle.BattleEnemyCharacter.UnregisterWeaponListener(slot0, slot1)
	slot0.super.UnregisterWeaponListener(slot0, slot1)
	slot1:UnregisterEventListener(slot0, slot1.WEAPON_PRE_CAST)
	slot1:UnregisterEventListener(slot0, slot1.WEAPON_PRE_CAST_FINISH)
	slot1:UnregisterEventListener(slot0, slot1.WEAPON_INTERRUPT)
end

function ys.Battle.BattleEnemyCharacter.Update(slot0)
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

function ys.Battle.BattleEnemyCharacter.Dispose(slot0)
	if slot0._vigilantBar then
		slot0._vigilantBar:Dispose()

		slot0._vigilantBar = nil
	end

	slot0._factory:GetArrowPool():DestroyObj(slot0._arrowBar)
	slot0.super.Dispose(slot0)
end

function ys.Battle.BattleEnemyCharacter.GetModleID(slot0)
	return slot0._unitData:GetTemplate().prefab
end

function ys.Battle.BattleEnemyCharacter.onWeaponPreCast(slot0, slot1)
	slot0:AddFX(slot1.Data.fx, true)

	slot0._preCastBound = slot1.Data.isBound
end

function ys.Battle.BattleEnemyCharacter.onWeaponPrecastFinish(slot0, slot1)
	slot0:RemoveCacheFX(slot1.Data.fx)

	slot0._preCastBound = false
end

function ys.Battle.BattleEnemyCharacter.OnUpdateHP(slot0, slot1)
	slot0.super.OnUpdateHP(slot0, slot1)

	if slot1.Data.dHP <= 0 then
		slot0:AddBlink(1, 1, 1, 0.1, 0.1, true)
	end
end

function ys.Battle.BattleEnemyCharacter.UpdateHPBarPostition(slot0)
	if not slot0._hideHP then
		slot0._hpBarPos:Copy(slot0._referenceVector):Add(slot0._hpBarOffset)

		slot0._HPBarTf.position = slot0._hpBarPos
	end
end

function ys.Battle.BattleEnemyCharacter.AddModel(slot0, slot1)
	slot0.super.AddModel(slot0, slot1)

	slot0._hpBarOffset = Vector3(0, slot0._unitData:GetTemplate().hp_bar[2], 0)
end

function ys.Battle.BattleEnemyCharacter.AddShadow(slot0, slot1)
	slot0.super.AddShadow(slot0, slot1)
end

function ys.Battle.BattleEnemyCharacter.GetSpecificFXScale(slot0)
	return slot0._unitData:GetTemplate().specific_fx_scale
end

function ys.Battle.BattleEnemyCharacter.OnAnimatorTrigger(slot0)
	slot0._unitData:CharacterActionTriggerCallback()
end

function ys.Battle.BattleEnemyCharacter.OnAnimatorEnd(slot0)
	slot0._unitData:CharacterActionEndCallback()
end

function ys.Battle.BattleEnemyCharacter.OnAnimatorStart(slot0)
	slot0._unitData:CharacterActionStartCallback()
end

return
