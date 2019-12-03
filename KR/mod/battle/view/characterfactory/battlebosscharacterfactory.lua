ys = ys or {}
slot1 = singletonClass("BattleBossCharacterFactory", ys.Battle.BattleEnemyCharacterFactory)
ys.Battle.BattleBossCharacterFactory = slot1
slot1.__name = "BattleBossCharacterFactory"
slot1.BOMB_FX_NAME = "Bossbomb"

function slot1.Ctor(slot0)
	slot0.super.Ctor(slot0)

	slot0.HP_BAR_NAME = "BossBarContainer/heroBlood"
	slot0.DUAL_BAR_NAME = {
		"BossBarContainer/heroBlood_ivory",
		"BossBarContainer/heroBlood_ebony"
	}
end

function slot1.CreateCharacter(slot0, slot1)
	slot3 = slot0:MakeCharacter()

	slot3:SetFactory(slot0)
	slot3:SetUnitData(slot2)
	slot3:SetBossData(slot1.bossData)
	slot0:MakeModel(slot3)
	slot0:MakeCastClock(slot3)

	return slot3
end

function slot1.MakeCharacter(slot0)
	return slot0.Battle.BattleBossCharacter:New()
end

function slot1.MakeBloodBar(slot0, slot1)
	slot2 = slot0:GetSceneMediator()

	if slot1:GetBossIndex() then
		slot1:AddHPBar(slot2:InstantiateCharacterComponent(slot0.DUAL_BAR_NAME[slot3]))
	else
		slot1:AddHPBar(slot2:InstantiateCharacterComponent(slot0.HP_BAR_NAME), true)
	end
end

function slot1.RemoveCharacter(slot0, slot1)
	slot0.super.RemoveCharacter(slot0, slot1)
end

return
