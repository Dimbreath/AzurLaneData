ys = ys or {}
slot1 = singletonClass("BattleNPCCharacterFactory", ys.Battle.BattleEnemyCharacterFactory)
ys.Battle.BattleNPCCharacterFactory = slot1
slot1.__name = "BattleNPCCharacterFactory"

function slot1.Ctor(slot0)
	slot0.super.Ctor(slot0)

	slot0.HP_BAR_NAME = slot0.super.Ctor.Battle.BattleHPBarManager.HP_BAR_FOE
end

function slot1.CreateCharacter(slot0, slot1)
	slot4 = slot0:MakeCharacter()

	slot4:SetFactory(slot0)
	slot4:SetUnitData(slot1.unit)

	if slot1.extraInfo.modleID then
		slot4:SetModleID(slot2.modleID)
	end

	if slot2.HPColor then
		slot4:SetHPColor(slot2.HPColor)
	end

	if slot2.isUnvisible then
		slot4:SetUnvisible()
	end

	slot0:MakeModel(slot4)

	return slot4
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

		for slot6, slot7 in ipairs(slot2) do
			slot0:AddFX(slot7)
		end

		slot0:MakeVisible()
	end

	slot0:GetCharacterPool():InstCharacter(slot1:GetModleID(), function (slot0)
		slot0(slot0)
	end)
end

function slot1.MakeCharacter(slot0)
	return slot0.Battle.BattleNPCCharacter.New()
end

function slot1.MakeBloodBar(slot0, slot1)
	slot3 = slot0:GetHPBarPool():GetHPBar(slot0.HP_BAR_NAME).transform

	if slot1:GetHPColor() then
		slot3:Find("blood"):GetComponent(typeof(Image)).color = slot4
	end

	slot1:AddHPBar(slot2)
	slot1:UpdateHPBarPostition()
end

return
