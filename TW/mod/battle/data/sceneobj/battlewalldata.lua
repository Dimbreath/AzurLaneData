ys = ys or {}
slot1 = ys.Battle.BattleConst
ys.Battle.BattleWallData = class("BattleWallData")
ys.Battle.BattleWallData.__name = "BattleWallData"

function ys.Battle.BattleWallData.Ctor(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0._id = slot1
	slot0._host = slot2
	slot0._cldFun = slot3
	slot0._cldBox = slot4
	slot0._cldOffset = slot5

	slot0:InitCldComponent()
end

function ys.Battle.BattleWallData.InitCldComponent(slot0)
	slot0._cldComponent = slot0.Battle.BattleCubeCldComponent.New(slot0._cldBox[1], slot0._cldBox[2], slot0._cldBox[3], slot0._cldOffset[1], slot0._cldOffset[3])

	slot0._cldComponent:SetCldData(slot3)
	slot0._cldComponent:SetActive(true)
end

function ys.Battle.BattleWallData.IsActive(slot0)
	return slot0._host:IsWallActive()
end

function ys.Battle.BattleWallData.DeactiveCldBox(slot0)
	slot0._cldComponent:SetActive(false)
end

function ys.Battle.BattleWallData.GetCldBox(slot0)
	return slot0._cldComponent:GetCldBox(slot0:GetPosition())
end

function ys.Battle.BattleWallData.GetCldData(slot0)
	return slot0._cldComponent:GetCldData()
end

function ys.Battle.BattleWallData.GetBoxSize(slot0)
	return slot0._cldComponent:GetCldBoxSize()
end

function ys.Battle.BattleWallData.GetHost(slot0)
	return slot0._host
end

function ys.Battle.BattleWallData.GetIFF(slot0)
	return slot0:GetHost():GetIFF()
end

function ys.Battle.BattleWallData.GetPosition(slot0)
	return slot0:GetHost():GetPosition()
end

function ys.Battle.BattleWallData.GetUniqueID(slot0)
	return slot0._id
end

function ys.Battle.BattleWallData.GetCldFunc(slot0)
	return slot0._cldFun
end

return
