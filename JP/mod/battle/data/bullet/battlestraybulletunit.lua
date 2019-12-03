ys = ys or {}
ys.Battle.BattleStrayBulletUnit = class("BattleStrayBulletUnit", ys.Battle.BattleBulletUnit)
ys.Battle.BattleStrayBulletUnit.__name = "BattleStrayBulletUnit"

function ys.Battle.BattleStrayBulletUnit.Ctor(slot0, slot1, slot2)
	slot0.super.Ctor(slot0, slot1, slot2)
end

function ys.Battle.BattleStrayBulletUnit.SetExplodePosition(slot0, slot1)
	slot0._explodePos = slot1
end

function ys.Battle.BattleStrayBulletUnit.GetExplodePostion(slot0)
	return slot0._explodePos
end

return
