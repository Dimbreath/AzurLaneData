ys = ys or {}
slot1 = singletonClass("BattleEnemyCharacterFactory", ys.Battle.BattleCharacterFactory)
ys.Battle.BattleEnemyCharacterFactory = slot1
slot1.__name = "BattleEnemyCharacterFactory"

function slot1.Ctor(slot0)
	slot0.super.Ctor(slot0)

	slot0.HP_BAR_NAME = slot0.super.Ctor.Battle.BattleHPBarManager.HP_BAR_FOE
	slot0.ARROW_BAR_NAME = "EnemyArrowContainer/EnemyArrow"
end

function slot1.MakeCharacter(slot0)
	return slot0.Battle.BattleEnemyCharacter.New()
end

function slot1.MakeModel(slot0, slot1)
	slot2 = slot1:GetUnitData()

	function slot3(slot0)
		slot0:AddModel(slot0)

		slot1 = slot0.AddModel:GetSceneMediator()

		slot0:CameraOrthogonal(slot2.Battle.BattleCameraUtil.GetInstance():GetCamera())
		slot1:AddEnemyCharacter(slot0)
		slot1:MakeUIComponentContainer(slot0)
		slot1:MakeFXContainer(slot0)
		slot1:MakePopNumPool(slot0)
		slot1:MakeBloodBar(slot0)
		slot1:MakeWaveFX(slot0)
		slot1:MakeSmokeFX(slot0)
		slot1:MakeArrowBar(slot0)
		slot0:UpdateDiveInvisible()

		for slot6, slot7 in ipairs(slot2) do
			slot0:AddFX(slot7)
		end
	end

	slot0:GetCharacterPool():InstCharacter(slot1:GetModleID(), function (slot0)
		slot0(slot0)
	end)
end

function slot1.MakeArrowBar(slot0, slot1)
	slot1:AddArrowBar(slot0:GetArrowPool():GetArrow())
	slot1:UpdateArrowBarPostition()
end

function slot1.GetArrowPool(slot0)
	return slot0.Battle.BattleArrowManager.GetInstance()
end

function slot1.MakeBloodBar(slot0, slot1)
	slot4 = findTF(slot0:GetHPBarPool():GetHPBar(slot0.HP_BAR_NAME), "type")

	if slot1:GetUnitData():GetTemplate().icon_type ~= 0 then
		setImageSprite(slot4, slot5, true)
		setImageSprite(slot6, slot5, true)
		SetActive(slot4, true)
	else
		SetActive(slot4, false)
	end

	slot1:AddHPBar(slot2)
	slot1:UpdateHPBarPostition()
end

function slot1.MakeWaveFX(slot0, slot1)
	if slot1:GetUnitData():GetTemplate().wave_fx ~= "" then
		slot1:AddWaveFX(slot2)
	end
end

function slot1.RemoveCharacter(slot0, slot1)
	slot0.Battle.BattleCameraUtil.GetInstance():StartShake(pg.shake_template[slot0.Battle.BattleConst.ShakeType.UNIT_DIE])
	slot1.super.RemoveCharacter(slot0, slot1)
end

return
