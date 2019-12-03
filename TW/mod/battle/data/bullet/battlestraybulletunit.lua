ys = ys or {}
ys.Battle.BattleStrayBulletUnit = class("BattleStrayBulletUnit", ys.Battle.BattleBulletUnit)
ys.Battle.BattleStrayBulletUnit.__name = "BattleStrayBulletUnit"

ys.Battle.BattleStrayBulletUnit.Ctor = function (slot0, slot1, slot2)
	slot0.super.Ctor(slot0, slot1, slot2)
end

ys.Battle.BattleStrayBulletUnit.SetExplodePosition = function (slot0, slot1)
	slot0._explodePos = slot1
end

ys.Battle.BattleStrayBulletUnit.GetExplodePostion = function (slot0)
	return slot0._explodePos
end

return
