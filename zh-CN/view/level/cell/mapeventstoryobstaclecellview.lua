class("MapEventStoryObstacleCellView", import("view.level.cell.StaticCellView")).Update = function (slot0)
	slot4 = slot0.info.data
	slot6 = pg.map_event_template[slot0.info.attachmentId].icon
	slot7 = "story_" .. slot2 .. "_" .. slot0.info.column .. "_" .. slot0.info.attachmentId

	if IsNil(slot0.go) then
		slot0.go = GameObject.New(slot7)
		slot0.tf = slot0.go:AddComponent(typeof(RectTransform))

		slot0.go.transform:SetParent(slot0.parent, false)

		slot0.tf.sizeDelta = slot0.parent.sizeDelta

		slot0:GetPrefab("ui/" .. slot6 .. "_2", slot6 .. "_2", function (slot0)
			slot0.transform:SetParent(slot0.tf, false)
		end)
	end

	slot9 = pg.map_event_template[slot1.attachmentId]

	if not (slot1.flag == 3) and slot9 and slot9.animation and not slot0.disappearAnim then
		if slot9.animation and #slot10 > 0 then
			slot0:GetPrefab("ui/" .. slot10, slot10, function (slot0)
				setParent(slot0.transform, slot0.tf, false)

				if not IsNil(slot0:GetComponent(typeof(ParticleSystemEvent))) then
					slot1:SetEndEvent(function (slot0)
						slot0._returnRequest["ui/" .. slot0._returnRequest .. slot0._returnRequest]:Start()

						slot0._returnRequest["ui/" .. slot1 .. slot0._returnRequest] = nil
					end)
				end
			end)

			slot0.disappearAnim = true
		end
	end

	setActive(slot0.tf, slot8)
end

return class("MapEventStoryObstacleCellView", import("view.level.cell.StaticCellView"))
