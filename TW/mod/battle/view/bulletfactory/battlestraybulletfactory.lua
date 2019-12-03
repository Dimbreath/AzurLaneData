ys = ys or {}
slot1 = ys.Battle.BattleConst.UnitType
ys.Battle.BattleStrayBulletFactory = singletonClass("BattleStrayBulletFactory", ys.Battle.BattleCannonBulletFactory)
ys.Battle.BattleStrayBulletFactory.__name = "BattleStrayBulletFactory"

function ys.Battle.BattleStrayBulletFactory.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function ys.Battle.BattleStrayBulletFactory.MakeBullet(slot0)
	return slot0.Battle.BattleStrayBullet.New()
end

return
