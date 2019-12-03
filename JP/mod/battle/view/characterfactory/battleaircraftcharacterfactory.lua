ys = ys or {}
slot1 = ys.Battle.BattleConfig
slot2 = singletonClass("BattleAircraftCharacterFactory", ys.Battle.BattleCharacterFactory)
ys.Battle.BattleAircraftCharacterFactory = slot2
slot2.__name = "BattleAircraftCharacterFactory"
slot2.BOMB_FX_NAME = "feijibaozha"

slot2.Ctor = function (slot0)
	slot0.super.Ctor(slot0)
end

slot2.MakeCharacter = function (slot0)
	return slot0.Battle.BattleAircraftCharacter.New()
end

slot2.MakeModel = function (slot0, slot1)
	function slot2(slot0)
		slot0:AddModel(slot0)
		slot0:InitWeapon()

		slot1 = slot0.InitWeapon:GetSceneMediator()

		slot0:CameraOrthogonal(slot2.Battle.BattleCameraUtil.GetInstance():GetCamera())
		slot1:AddAirCraftCharacter(slot0)
		slot1:MakeUIComponentContainer(slot0)
		slot1:MakeFXContainer(slot0)
		slot1:MakeShadow(slot0)

		if slot0:GetUnitData():GetIFF() == slot0.GetUnitData().FOE_CODE then
			slot1:MakePopNumPool(slot0)
			slot1:MakeBloodBar(slot0)
		end
	end

	slot0:GetCharacterPool():InstAirCharacter(slot1:GetModleID(), function (slot0)
		slot0(slot0)
	end)
end

slot2.MakeBloodBar = function (slot0, slot1)
	slot2 = nil

	slot1:AddHPBar((not slot1:GetUnitData():IsPlayerAircraft() or slot0:GetHPBarPool():GetHPBar(slot0.Battle.BattleHPBarManager.HP_BAR_FRIENDLY)) and slot0:GetHPBarPool():GetHPBar(slot0.Battle.BattleHPBarManager.HP_BAR_FOE))
	slot1:UpdateHPBarPostition()
end

slot2.SetHPBarWidth = function (slot0, slot1, slot2)
	slot1.transform.sizeDelta = Vector2(slot3, slot5)
	slot6.sizeDelta = Vector2(40 - slot2 or 0, slot1.transform.Find(slot4, "blood").transform.rect.height)
end

slot2.MakeShadow = function (slot0, slot1)
	slot1:AddShadow()
	slot1:UpdateShadow()
end

return
