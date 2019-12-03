ys = ys or {}
slot1 = ys.Battle.BattleConst
slot2 = pg.effect_offset
ys.Battle.BattleShelterData = class("BattleShelterData")
ys.Battle.BattleShelterData.__name = "BattleShelterData"

function ys.Battle.BattleShelterData.Ctor(slot0, slot1)
	slot0._id = slot1
end

function ys.Battle.BattleShelterData.SetIFF(slot0, slot1)
	slot0._IFF = slot1
end

function ys.Battle.BattleShelterData.SetArgs(slot0, slot1, slot2, slot3, slot4, slot5)
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

function ys.Battle.BattleShelterData.SetStartTimeStamp(slot0, slot1)
	slot0._startTimeStamp = slot1
end

function ys.Battle.BattleShelterData.Update(slot0, slot1)
	if slot0._duration < slot1 - slot0._startTimeStamp then
		slot0._startTimeStamp = nil
	end
end

function ys.Battle.BattleShelterData.DoWhenHit(slot0, slot1)
	if slot0._doWhenHit == "intercept" then
		slot1:Intercepted()
		slot0.Battle.BattleDataProxy.GetInstance():RemoveBulletUnit(slot1:GetUniqueID())

		slot0._count = slot0._count - 1
	elseif slot0._doWhenHit == "reflect" and slot0:GetIFF() ~= slot1:GetIFF() then
		slot1:Reflected()

		slot0._count = slot0._count - 1
	end
end

function ys.Battle.BattleShelterData.GetUniqueID(slot0)
	return slot0._id
end

function ys.Battle.BattleShelterData.GetIFF(slot0)
	return slot0._IFF
end

function ys.Battle.BattleShelterData.GetFXID(slot0)
	return slot0._effect
end

function ys.Battle.BattleShelterData.GetPosition(slot0)
	return slot0._centerPos
end

function ys.Battle.BattleShelterData.Deactive(slot0)
	slot0.Battle.BattleDataProxy.GetInstance():RemoveWall(slot0._wall:GetUniqueID())
end

function ys.Battle.BattleShelterData.IsWallActive(slot0)
	return slot0._count > 0 and slot0._startTimeStamp
end

return
