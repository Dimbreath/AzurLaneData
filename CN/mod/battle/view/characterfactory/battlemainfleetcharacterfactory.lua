ys = ys or {}
ys.Battle.BattleMainFleetCharacterFactory = singletonClass("BattleMainFleetCharacterFactory", ys.Battle.BattlePlayerCharacterFactory)
ys.Battle.BattleMainFleetCharacterFactory.__name = "BattleMainFleetCharacterFactory"

ys.Battle.BattleMainFleetCharacterFactory.Ctor = function (slot0)
	slot0.super.Ctor(slot0)

	slot0.ARROW_BAR_NAME = "EnemyArrowContainer/MainArrow"
end

ys.Battle.BattleMainFleetCharacterFactory.MakeCharacter = function (slot0)
	return slot0.Battle.BattleMainFleetCharacter.New()
end

ys.Battle.BattleMainFleetCharacterFactory.MakeModel = function (slot0, slot1, slot2)
	function slot3(slot0)
		slot0:AddModel(slot0)

		slot1 = slot0.AddModel:GetSceneMediator()

		slot0:CameraOrthogonal(slot2.Battle.BattleCameraUtil.GetInstance():GetCamera())
		slot1:AddPlayerCharacter(slot0)
		slot1:MakeUIComponentContainer(slot0)
		slot1:MakeFXContainer(slot0)
		slot1:MakePopNumPool(slot0)
		slot1:MakeBloodBar(slot0)
		slot1:MakeWaveFX(slot0)
		slot1:MakeSmokeFX(slot0)
		slot1:MakeArrowBar(slot0)
	end

	slot0:GetCharacterPool():InstCharacter(slot1:GetModleID(), function (slot0)
		slot0(slot0)
	end)
end

return
