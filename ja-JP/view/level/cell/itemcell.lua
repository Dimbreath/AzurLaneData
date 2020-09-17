slot0 = class("ItemCell", import("view.level.cell.LevelCellView"))

function slot0.Ctor(slot0, slot1, slot2, slot3)
	uv0.super.Ctor(slot0)

	slot0.go = slot1
	slot0.tf = slot0.go.transform
	slot0.line = {
		row = slot2,
		column = slot3
	}

	slot0:OverrideCanvas()
	slot0:ResetCanvasOrder()
end

function slot0.Init(slot0, slot1)
	if not slot1.item then
		return
	end

	slot0.loader:GetPrefab("chapter/" .. slot1.item, slot1.item, function (slot0)
		slot1 = slot0.transform
		slot1.name = uv0.item

		slot1:SetParent(uv1.go, false)

		slot1.anchoredPosition3D = uv0.itemOffset

		uv1:RecordCanvasOrder(slot1)
		uv1:AddCanvasOrder(slot1, uv1:GetCurrentOrder())
	end, "ChapterItem" .. slot0.line.row .. "_" .. slot0.line.column)
end

function slot0.ClearLoader(slot0)
end

function slot0.Clear(slot0)
	slot0.loader:ClearRequest("ChapterItem" .. slot0.line.row .. "_" .. slot0.line.column)
	uv0.super.Clear(slot0)
end

return slot0
