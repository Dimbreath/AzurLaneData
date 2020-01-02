ys = ys or {}
slot1 = singletonClass("BattlePlayerCharacterFactory", ys.Battle.BattleCharacterFactory)
ys.Battle.BattlePlayerCharacterFactory = slot1
slot1.__name = "BattlePlayerCharacterFactory"

function slot1.Ctor(slot0)
	slot0.super.Ctor(slot0)

	slot0.HP_BAR_NAME = slot0.super.Ctor.Battle.BattleHPBarManager.HP_BAR_FRIENDLY
	slot0.CD_BAR_NAME = "CDBarContainer/chargeWeaponCD"
	slot0.CHARGE_AREA_NAME = "ChargeAreaContainer/ChargeArea"
	slot0.ARROW_BAR_NAME = "EnemyArrowContainer/MainArrow"
	slot0.SUB_ARROW_BAR = "EnemyArrowContainer/SubArrow"
end

function slot1.MakeCharacter(slot0)
	return slot0.Battle.BattlePlayerCharacter.New()
end

function slot1.MakeModel(slot0, slot1, slot2)
	function slot3(slot0)
		slot0:AddModel(slot0)

		slot1 = slot0.AddModel:GetSceneMediator()

		slot0:CameraOrthogonal(slot2.Battle.BattleCameraUtil.GetInstance():GetCamera())
		slot1:AddPlayerCharacter(slot0)
		slot1:MakeUIComponentContainer(slot0)
		slot1:MakeFXContainer(slot0)
		slot1:MakePopNumPool(slot0)
		slot1:MakeBloodBar(slot0)
		slot1:MakeArrowBar(slot0)
		slot1:MakeWaveFX(slot0)
		slot1:MakeSmokeFX(slot0)
		slot1:MakeEquipSkinAttachment(slot0)
		slot0:UpdateDiveInvisible()

		if #slot0:GetUnitData():GetTorpedoList() > 0 then
			slot1:MakeTorpedoTrack(slot0)
		end
	end

	slot0:GetCharacterPool():InstCharacter(slot1:GetModleID(), function (slot0)
		slot0(slot0)
	end)
end

function slot1.MakeBloodBar(slot0, slot1)
	LuaHelper.SetTFChildActive(slot3, "torpedoIcons", true)
	slot1:AddHPBar(slot0:GetHPBarPool():GetHPBar(slot0.HP_BAR_NAME))
end

function slot1.MakeChargeArea(slot0, slot1)
	slot0:GetSceneMediator():InstantiateCharacterComponent(slot0.CHARGE_AREA_NAME).transform.localEulerAngles = Vector3(60, 0, 0)

	slot1:AddChargeArea(slot0.GetSceneMediator().InstantiateCharacterComponent(slot0.CHARGE_AREA_NAME))
end

function slot1.MakeTorpedoTrack(slot0, slot1)
	slot1:AddTorpedoTrack(slot0:GetFXPool():GetFX("SquareAlert", slot1:GetTf()))
end

function slot1.RemoveCharacter(slot0, slot1, slot2)
	slot3 = slot0:GetSceneMediator()

	if slot2 and slot2 ~= slot0.Battle.BattleConst.UnitDeathReason.KILLED then
	else
		slot0.Battle.BattleCameraUtil.GetInstance():StartShake(pg.shake_template[slot0.Battle.BattleConst.ShakeType.UNIT_DIE])
	end

	slot1.super.RemoveCharacter(slot0, slot1, slot2)
end

return
