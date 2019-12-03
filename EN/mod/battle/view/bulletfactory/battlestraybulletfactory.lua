ys = ys or {}
slot1 = ys.Battle.BattleConst.UnitType
ys.Battle.BattleStrayBulletFactory = singletonClass("BattleStrayBulletFactory", ys.Battle.BattleCannonBulletFactory)
ys.Battle.BattleStrayBulletFactory.__name = "BattleStrayBulletFactory"

ys.Battle.BattleStrayBulletFactory.Ctor = function (slot0)
	slot0.super.Ctor(slot0)
end

ys.Battle.BattleStrayBulletFactory.MakeBullet = function (slot0)
	return slot0.Battle.BattleStrayBullet.New()
end

return
