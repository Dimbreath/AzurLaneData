ys = ys or {}
ys.Battle.BattleAntiAirBulletUnit = class("BattleAntiAirBulletUnit", ys.Battle.BattleBulletUnit)
ys.Battle.BattleAntiAirBulletUnit.__name = "BattleAntiAirBulletUnit"

ys.Battle.BattleAntiAirBulletUnit.Ctor = function (slot0, slot1, slot2)
	slot0.Battle.BattleAntiAirBulletUnit.super.Ctor(slot0, slot1, slot2)
end

ys.Battle.BattleAntiAirBulletUnit.Update = function (slot0, slot1)
	return
end

ys.Battle.BattleAntiAirBulletUnit.IsOutRange = function (slot0)
	return false
end

ys.Battle.BattleAntiAirBulletUnit.SetDirectHitUnit = function (slot0, slot1)
	slot0._directHitUnit = slot1
end

ys.Battle.BattleAntiAirBulletUnit.GetDirectHitUnit = function (slot0)
	return slot0._directHitUnit
end

ys.Battle.BattleAntiAirBulletUnit.Dispose = function (slot0)
	slot0._directHitUnit = nil

	slot0.super.Dispose(slot0)
end

return
