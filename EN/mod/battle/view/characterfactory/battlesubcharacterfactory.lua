ys = ys or {}
slot1 = singletonClass("BattleSubCharacterFactory", ys.Battle.BattlePlayerCharacterFactory)
ys.Battle.BattleSubCharacterFactory = slot1
slot1.__name = "BattleSubCharacterFactory"

slot1.Ctor = function (slot0)
	slot0.super.Ctor(slot0)

	slot0.ARROW_BAR_NAME = "EnemyArrowContainer/SubArrow"
end

slot1.MakeCharacter = function (slot0)
	return slot0.Battle.BattleSubCharacter.New()
end

return
