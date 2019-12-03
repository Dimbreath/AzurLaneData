ys = ys or {}
slot1 = ys.Battle.BattleConst
slot2 = pg.effect_offset
ys.Battle.BattleShelterData = class("BattleShelterData")
ys.Battle.BattleShelterData.__name = "BattleShelterData"

ys.Battle.BattleShelterData.Ctor = function (slot0, slot1)
	slot0._id = slot1
end

ys.Battle.BattleShelterData.SetIFF = function (slot0, slot1)
	slot0._IFF = slot1
end

ys.Battle.BattleShelterData.SetArgs = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot0._duration = slot2
	slot0._bulletType = slot0.Battle.BattleConst.BulletType.CANNON
	slot0._count = slot1
	slot0._effect = slot5
	slot0._doWhenHit = "intercept"
	slot0._wall = slot0.Battle.BattleDataProxy.GetInstance():SpawnWall(slot0, function (slot0)
		if slot0:GetType() == slot0._bulletType and slot0:IsWallActive() then
			slot0:DoWhenHit(slot0)
		end

		return slot0._count > 0
	end, slot3, {
		0,
		0,
		0
	})
	slot0._centerPos = slot4
end

ys.Battle.BattleShelterData.SetStartTimeStamp = function (slot0, slot1)
	slot0._startTimeStamp = slot1
end

ys.Battle.BattleShelterData.Update = function (slot0, slot1)
	if slot0._duration < slot1 - slot0._startTimeStamp then
		slot0._startTimeStamp = nil
	end
end

ys.Battle.BattleShelterData.DoWhenHit = function (slot0, slot1)
	if slot0._doWhenHit == "intercept" then
		slot1:Intercepted()
		slot0.Battle.BattleDataProxy.GetInstance():RemoveBulletUnit(slot1:GetUniqueID())

		slot0._count = slot0._count - 1
	elseif slot0._doWhenHit == "reflect" and slot0:GetIFF() ~= slot1:GetIFF() then
		slot1:Reflected()

		slot0._count = slot0._count - 1
	end
end

ys.Battle.BattleShelterData.GetUniqueID = function (slot0)
	return slot0._id
end

ys.Battle.BattleShelterData.GetIFF = function (slot0)
	return slot0._IFF
end

ys.Battle.BattleShelterData.GetFXID = function (slot0)
	return slot0._effect
end

ys.Battle.BattleShelterData.GetPosition = function (slot0)
	return slot0._centerPos
end

ys.Battle.BattleShelterData.Deactive = function (slot0)
	slot0.Battle.BattleDataProxy.GetInstance():RemoveWall(slot0._wall:GetUniqueID())
end

ys.Battle.BattleShelterData.IsWallActive = function (slot0)
	return slot0._count > 0 and slot0._startTimeStamp
end

return
