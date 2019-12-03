ys = ys or {}
ys.Battle.BattleAntiSeaBulletUnit = class("BattleAntiSeaBulletUnit", ys.Battle.BattleBulletUnit)
ys.Battle.BattleAntiSeaBulletUnit.__name = "BattleAntiSeaBulletUnit"

ys.Battle.BattleAntiSeaBulletUnit.Ctor = function (slot0, slot1, slot2)
	slot0.super.Ctor(slot0, slot1, slot2)
end

ys.Battle.BattleAntiSeaBulletUnit.Update = function (slot0, slot1)
	return
end

ys.Battle.BattleAntiSeaBulletUnit.IsOutRange = function (slot0)
	return false
end

ys.Battle.BattleAntiSeaBulletUnit.SetDirectHitUnit = function (slot0, slot1)
	slot0._directHitUnit = slot1
end

ys.Battle.BattleAntiSeaBulletUnit.GetDirectHitUnit = function (slot0)
	return slot0._directHitUnit
end

ys.Battle.BattleAntiSeaBulletUnit.Dispose = function (slot0)
	slot0._directHitUnit = nil

	slot0.super.Dispose(slot0)
end

return
