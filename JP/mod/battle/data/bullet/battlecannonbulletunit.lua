ys = ys or {}
ys.Battle.BattleCannonBulletUnit = class("BattleCannonBulletUnit", ys.Battle.BattleBulletUnit)
ys.Battle.BattleCannonBulletUnit.__name = "BattleCannonBulletUnit"

function ys.Battle.BattleCannonBulletUnit.Ctor(slot0, slot1, slot2)
	slot0.super.Ctor(slot0, slot1, slot2)
end

function ys.Battle.BattleCannonBulletUnit.Hit(slot0, slot1, slot2)
	slot0.super.Hit(slot0, slot1, slot2)

	slot0._pierceCount = slot0._pierceCount - 1
end

return
