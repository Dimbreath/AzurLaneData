ys = ys or {}
slot1 = ys.Battle.BattleFormulas
slot2 = class("BattleTorpedoBulletUnit", ys.Battle.BattleBulletUnit)
ys.Battle.BattleTorpedoBulletUnit = slot2
slot2.__name = "BattleTorpedoBulletUnit"

slot2.Ctor = function (slot0, slot1, slot2)
	slot0.super.Ctor(slot0, slot1, slot2)
end

slot2.calcSpeed = function (slot0)
	slot0._speed = Vector3(slot1.ConvertBulletSpeed(math.max(0, slot0._velocity + slot0.Battle.BattleAttr.GetCurrent(slot0, "torpedoSpeedExtra")) * (1 + slot0.Battle.BattleAttr.GetCurrent(slot0, "bulletSpeedRatio"))) * math.cos(slot4), 0, slot1.ConvertBulletSpeed(math.max(0, slot0._velocity + slot0.Battle.BattleAttr.GetCurrent(slot0, "torpedoSpeedExtra")) * (1 + slot0.Battle.BattleAttr.GetCurrent(slot0, "bulletSpeedRatio"))) * math.sin(math.deg2Rad * slot0._yAngle))
end

slot2.GetExplodePostion = function (slot0)
	return slot0._explodePos
end

slot2.SetExplodePosition = function (slot0, slot1)
	slot0._explodePos = slot1
end

slot2.InitCldComponent = function (slot0)
	slot0.super.InitCldComponent(slot0)
	slot0:ResetCldSurface()
end

slot2.Hit = function (slot0, slot1, slot2)
	slot0.super.Hit(slot0, slot1, slot2)

	slot0._pierceCount = slot0._pierceCount - 1
end

return
