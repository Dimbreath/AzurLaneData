slot0 = class("MapEventStoryTriggerCellView", import("view.level.cell.StaticCellView"))

function slot0.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1)

	slot0.chapter = nil
	slot0.triggerUpper = nil
	slot0.refattachments = nil
end

function slot0.Update(slot0)
	slot4 = slot0.info.data
	slot5 = slot0.chapter
	slot7 = pg.map_event_template[slot0.info.attachmentId].icon
	slot8 = "story_" .. slot2 .. "_" .. slot0.info.column .. "_" .. slot0.info.attachmentId
	slot0.active = slot0.info.flag == 3 and slot1.trait ~= ChapterConst.TraitLurk

	if slot0.updateExe then
		return
	end

	slot0.updateExe = AsyncExcutionRequestPackage.New({
		function (slot0)
			if IsNil(slot0.go) then
				slot0.go = GameObject.New(slot0)
				slot0.tf = slot0.go:AddComponent(typeof(RectTransform))

				slot0.go.transform:SetParent(slot0.parent, false)

				slot0.tf.sizeDelta = slot0.parent.sizeDelta

				slot0.tf:SetAsFirstSibling()
				slot0:GetPrefab("ui/" .. slot2 .. "_1", slot2 .. "_1", function (slot0)
					slot0.transform:SetParent(slot0.tf, false)
				end)
			end

			slot0("ui/" .. slot1, slot2 .. "_1shangceng")
		end,
		function (slot0, slot1, slot2)
			if IsNil(slot0.triggerUpper) then
				slot3 = GameObject.New(slot1 .. "_upper")
				slot0.triggerUpper = slot3:AddComponent(typeof(RectTransform))

				slot0.triggerUpper:SetParent(slot0.cellRoot, false)

				slot0.triggerUpper.localPosition = slot2.theme:GetLinePosition(slot3, slot0.triggerUpper)
				slot0.triggerUpper.localEulerAngles = Vector3(-slot2.theme.angle, 0, 0)

				table.insert(slot0.refattachments, HaloAttachmentView.New(slot3.transform, slot3, table.insert))
				slot0:GetPrefab(slot1, slot2, function (slot0)
					slot0.transform:SetParent(slot0.triggerUpper, false)
				end)
			end

			slot0()
		end,
		function (slot0)
			setActive(slot0.tf, slot0.active)
			setActive(slot0.triggerUpper, slot0.active)

			slot0.updateExe = nil
		end
	}):Start()
end

function slot0.DestroyGO(slot0)
	if slot0.updateExe then
		slot0.updateExe:Stop()
	end

	slot0.updateExe = nil

	if slot0.triggerUpper then
		Destroy(slot0.triggerUpper)
	end

	slot0.triggerUpper = nil

	slot0.super.DestroyGO(slot0)
end

return slot0
