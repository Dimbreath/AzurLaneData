ys = ys or {}
slot1 = singletonClass("BattleSubCharacterFactory", ys.Battle.BattlePlayerCharacterFactory)
ys.Battle.BattleSubCharacterFactory = slot1
slot1.__name = "BattleSubCharacterFactory"

function slot1.Ctor(slot0)
	slot0.super.Ctor(slot0)

	slot0.ARROW_BAR_NAME = "EnemyArrowContainer/SubArrow"
end

function slot1.MakeCharacter(slot0)
	return slot0.Battle.BattleSubCharacter.New()
end

return
