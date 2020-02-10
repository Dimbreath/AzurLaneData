slot0 = class("MapEventStoryObstacleCellView", import("view.level.cell.StaticCellView"))

function slot0.Update(slot0)
	slot1 = slot0.info
	slot4 = slot1.data
	slot6 = pg.map_event_template[slot1.attachmentId].icon

	if IsNil(slot0.go) then
		slot0.go = GameObject.New("story_" .. slot1.row .. "_" .. slot1.column .. "_" .. slot1.attachmentId)
		slot0.tf = slot0.go:AddComponent(typeof(RectTransform))

		slot0.go.transform:SetParent(slot0.parent, false)

		slot0.tf.sizeDelta = slot0.parent.sizeDelta

		slot0:GetPrefab("ui/" .. slot6 .. "_2", slot6 .. "_2", function (slot0)
			slot0.transform:SetParent(uv0.tf, false)
		end)
	end

	if not (slot1.flag == 3) and pg.map_event_template[slot1.attachmentId] then
	end

	setActive(slot0.tf, slot8)
end

return slot0
