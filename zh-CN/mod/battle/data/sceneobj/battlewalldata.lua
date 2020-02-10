ys = ys or {}
slot0 = ys
slot1 = slot0.Battle.BattleConst
slot0.Battle.BattleWallData = class("BattleWallData")
slot0.Battle.BattleWallData.__name = "BattleWallData"
slot2 = slot0.Battle.BattleWallData

function slot2.Ctor(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0._id = slot1
	slot0._host = slot2
	slot0._cldFun = slot3
	slot0._cldBox = slot4
	slot0._cldOffset = slot5

	slot0:InitCldComponent()
end

function slot2.InitCldComponent(slot0)
	slot1 = slot0._cldBox
	slot2 = slot0._cldOffset
	slot0._cldComponent = uv0.Battle.BattleCubeCldComponent.New(slot1[1], slot1[2], slot1[3], slot2[1], slot2[3])

	slot0._cldComponent:SetCldData({
		type = uv1.CldType.WALL,
		UID = slot0:GetUniqueID(),
		func = slot0:GetCldFunc()
	})
	slot0._cldComponent:SetActive(true)
end

function slot2.IsActive(slot0)
	return slot0._host:IsWallActive()
end

function slot2.DeactiveCldBox(slot0)
	slot0._cldComponent:SetActive(false)
end

function slot2.GetCldBox(slot0)
	return slot0._cldComponent:GetCldBox(slot0:GetPosition())
end

function slot2.GetCldData(slot0)
	return slot0._cldComponent:GetCldData()
end

function slot2.GetBoxSize(slot0)
	return slot0._cldComponent:GetCldBoxSize()
end

function slot2.GetHost(slot0)
	return slot0._host
end

function slot2.GetIFF(slot0)
	return slot0:GetHost():GetIFF()
end

function slot2.GetPosition(slot0)
	return slot0:GetHost():GetPosition()
end

function slot2.GetUniqueID(slot0)
	return slot0._id
end

function slot2.GetCldFunc(slot0)
	return slot0._cldFun
end
