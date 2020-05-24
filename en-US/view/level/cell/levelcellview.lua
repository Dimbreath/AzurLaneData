slot0 = class("LevelCellView")

function slot0.GetOrder(slot0)
	return ChapterConst.CellPriorityNone
end

function slot0.GetLoader(slot0)
	slot0.loader = slot0.loader or AutoLoader.New()

	return slot0.loader
end

function slot0.ClearLoader(slot0)
	if slot0.loader then
		slot0.loader:Clear()
	end
end

function slot0.GetLine(slot0)
	return slot0.line
end

function slot0.SetLine(slot0, slot1)
	slot0.line = {
		row = slot1.row,
		column = slot1.column
	}
end

function slot0.OverrideCanvas(slot0)
	pg.ViewUtils.SetLayer(tf(slot0.go), Layer.UI)

	slot0.canvas = GetOrAddComponent(slot0.go, typeof(Canvas))
	slot0.canvas.overrideSorting = true
end

function slot0.ResetCanvasOrder(slot0)
	if not slot0.canvas then
		return
	end

	pg.ViewUtils.SetSortingOrder(slot0.tf, slot0.line.row * ChapterConst.PriorityPerRow + slot0:GetOrder())
end

function slot0.Clear(slot0)
	slot0:ClearLoader()
end

return slot0
