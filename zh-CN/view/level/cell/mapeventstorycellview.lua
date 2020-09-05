slot0 = class("MapEventStoryCellView", import("view.level.cell.StaticCellView"))

function slot0.Ctor(slot0, slot1)
	uv0.super.Ctor(slot0, slot1)

	slot0.attachTw = nil
end

function slot0.GetOrder(slot0)
	return ChapterConst.CellPriorityAttachment
end

function slot0.Update(slot0)
	slot1 = slot0.info

	if IsNil(slot0.go) then
		slot4 = slot1.data
		slot6 = pg.map_event_template[slot1.attachmentId].icon

		slot0:PrepareBase("story_" .. slot1.row .. "_" .. slot1.column .. "_" .. slot1.attachmentId)

		slot0.attachTw = LeanTween.moveY(slot0.go, 40, 1.5):setEase(LeanTweenType.easeInOutSine):setLoopPingPong()

		slot0:GetLoader():GetPrefab("leveluiview/tpl_box", "tpl_box", function (slot0)
			slot0.name = uv0

			setParent(slot0, uv1.parent)

			slot0.anchoredPosition = Vector2(0, 30)

			uv1:GetLoader():GetPrefab("boxprefab/mapevent1", "mapevent1", function (slot0)
				slot0.transform:SetParent(uv0:Find("icon"), false)
			end)

			if uv0 ~= "mapevent1" then
				uv1:GetLoader():GetPrefab("ui/" .. uv0 .. "_2", uv0 .. "_2", function (slot0)
					slot0.transform:SetParent(uv0.tf, false)
					SetActive(slot0.transform:Find("Xyz/F"), false)
				end)
			end
		end)
	end

	setActive(slot0.tf, slot1.flag == 0)
end

function slot0.DestroyGO(slot0)
	if slot0.attachTw then
		LeanTween.cancel(slot0.attachTw.uniqueId)

		slot0.attachTw = nil
	end

	uv0.super.DestroyGO(slot0)
end

return slot0
