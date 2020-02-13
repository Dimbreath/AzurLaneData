slot0 = class("MapEventStoryCellView", import("view.level.cell.StaticCellView"))

function slot0.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1)

	slot0.attachTw = nil
end

function slot0.Update(slot0)
	slot4 = slot0.info.data
	slot6 = pg.map_event_template[slot0.info.attachmentId].icon
	slot7 = "story_" .. slot2 .. "_" .. slot0.info.column .. "_" .. slot0.info.attachmentId

	if IsNil(slot0.go) then
		slot0.go = GameObject.New(slot7)

		slot0.go.transform:SetParent(slot0.parent)

		slot0.tf = slot0.go.transform
		slot0.tf.sizeDelta = slot0.parent.sizeDelta
		cloneTplTo(slot0.Tpl, slot0.parent, slot6).anchoredPosition = Vector2(0, 30)

		slot0:GetPrefab("boxprefab/mapevent1", "mapevent1", function (slot0)
			slot0.transform:SetParent(slot0:Find("icon"), false)
		end)

		if slot6 ~= "mapevent1" then
			slot0:GetPrefab("ui/" .. slot6 .. "_2", slot6 .. "_2", function (slot0)
				slot0.transform:SetParent(slot0.tf, false)
				SetActive(slot0.transform:Find("Xyz/F"), false)
			end)
		end

		slot0.attachTw = LeanTween.moveY(slot0.go, 40, 1.5):setEase(LeanTweenType.easeInOutSine):setLoopPingPong()
	end

	setActive(slot0.tf, slot1.flag == 0)
end

function slot0.DestroyGO(slot0)
	if slot0.attachTw then
		LeanTween.cancel(slot0.attachTw.uniqueId)

		slot0.attachTw = nil
	end

	slot0.super.DestroyGO(slot0)
end

return slot0
