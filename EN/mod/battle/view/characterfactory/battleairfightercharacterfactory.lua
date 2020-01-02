ys = ys or {}
ys.Battle.BattleAirFighterCharacterFactory = singletonClass("BattleAirFighterCharacterFactory", ys.Battle.BattleAircraftCharacterFactory)
ys.Battle.BattleAirFighterCharacterFactory.__name = "BattleAirFighterCharacterFactory"

function ys.Battle.BattleAirFighterCharacterFactory.Ctor(slot0)
	slot0.Battle.BattleAirFighterCharacterFactory.super.Ctor(slot0)

	slot0.HP_BAR_NAME = slot0.Battle.BattleHPBarManager.HP_BAR_FOE
end

function ys.Battle.BattleAirFighterCharacterFactory.MakeCharacter(slot0)
	return slot0.Battle.BattleAirFighterCharacter.New()
end

function ys.Battle.BattleAirFighterCharacterFactory.MakeModel(slot0, slot1)
	function slot2(slot0)
		slot0:AddModel(slot0)
		slot0:InitWeapon()

		slot1 = slot0.InitWeapon:GetSceneMediator()

		slot0:CameraOrthogonal(slot2.Battle.BattleCameraUtil.GetInstance():GetCamera())
		slot1:AddAirCraftCharacter(slot0)
		slot1:MakeUIComponentContainer(slot0)
		slot1:MakeFXContainer(slot0)
		slot1:MakePopNumPool(slot0)
		slot1:MakeBloodBar(slot0)
		slot1:MakeShadow(slot0)
	end

	slot0:GetCharacterPool():InstAirCharacter(slot1:GetModleID(), function (slot0)
		slot0(slot0)
	end)
end

function ys.Battle.BattleAirFighterCharacterFactory.MakeBloodBar(slot0, slot1)
	slot2 = slot0:GetHPBarPool():GetHPBar(slot0.HP_BAR_NAME)

	slot1:AddHPBar(slot2)
	slot2:SetActive(false)
	slot1:UpdateHPBarPostition()
end

return
