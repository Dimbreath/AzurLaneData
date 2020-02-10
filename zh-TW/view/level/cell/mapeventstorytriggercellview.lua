slot0 = class("MapEventStoryTriggerCellView", import("view.level.cell.StaticCellView"))

function slot0.Ctor(slot0, slot1)
	uv0.super.Ctor(slot0, slot1)

	slot0.chapter = nil
	slot0.triggerUpper = nil
	slot0.refattachments = nil
end

function slot0.Update(slot0)
	slot1 = slot0.info
	slot4 = slot1.data
	slot5 = slot0.chapter
	slot7 = pg.map_event_template[slot1.attachmentId].icon
	slot8 = "story_" .. slot1.row .. "_" .. slot1.column .. "_" .. slot1.attachmentId
	slot0.active = slot1.flag == 3 and slot1.trait ~= ChapterConst.TraitLurk

	if slot0.updateExe then
		return
	end

	slot10[1] = function (slot0)
		if IsNil(uv0.go) then
			uv0.go = GameObject.New(uv1)
			uv0.tf = uv0.go:AddComponent(typeof(RectTransform))

			uv0.go.transform:SetParent(uv0.parent, false)

			uv0.tf.sizeDelta = uv0.parent.sizeDelta

			uv0.tf:SetAsFirstSibling()
			uv0:GetPrefab("ui/" .. uv2 .. "_1", uv2 .. "_1", function (slot0)
				slot0.transform:SetParent(uv0.tf, false)
			end)
		end

		slot1 = uv2 .. "_1shangceng"

		slot0("ui/" .. slot1, slot1)
	end

	slot10[2] = function (slot0, slot1, slot2)
		if IsNil(uv0.triggerUpper) then
			slot3 = GameObject.New(uv1 .. "_upper")
			uv0.triggerUpper = slot3:AddComponent(typeof(RectTransform))

			uv0.triggerUpper:SetParent(uv0.cellRoot, false)

			uv0.triggerUpper.localPosition = uv2.theme:GetLinePosition(uv3, uv4)
			uv0.triggerUpper.localEulerAngles = Vector3(-uv2.theme.angle, 0, 0)

			table.insert(uv0.refattachments, HaloAttachmentView.New(slot3.transform, uv3, uv4))
			uv0:GetPrefab(slot1, slot2, function (slot0)
				slot0.transform:SetParent(uv0.triggerUpper, false)
			end)
		end

		slot0()
	end

	slot10[3] = function (slot0)
		setActive(uv0.tf, uv0.active)
		setActive(uv0.triggerUpper, uv0.active)

		uv0.updateExe = nil
	end

	slot0.updateExe = AsyncExcutionRequestPackage.New({}):Start()
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

	uv0.super.DestroyGO(slot0)
end

return slot0
