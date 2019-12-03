slot0 = class("AttireIconFramePanel", import(".AttireFramePanel"))
slot1 = setmetatable

function slot2(slot0)
	function slot4(slot0, slot1, slot2)
		return
	end

	slot3(slot1)

	return slot0({
		Update = function (slot0, slot1, slot2, slot3)
			slot0:Update(slot1, slot2, slot3)
			slot0:ReturnIconFrame(AttireConst.TYPE_ICON_FRAME)

			if slot0:isEmpty() then
				return
			end

			slot0:LoadPrefab(slot1, function (slot0)
				slot0(slot0, slot0, )
			end)
		end,
		Dispose = function (slot0)
			slot0:ReturnIconFrame(AttireConst.TYPE_ICON_FRAME)
		end
	}, {
		__index = AttireFramePanel.Card(slot0)
	})
end

slot0.getUIName = function (slot0)
	return "AttireIconFrameUI"
end

slot0.GetData = function (slot0)
	return slot0.rawAttireVOs.iconFrames
end

slot0.OnInitItem = function (slot0, slot1)
	slot0.cards[slot1] = slot0(slot1)

	onButton(slot0, slot0(slot1)._go, function ()
		if not slot0:isEmpty() then
			if slot1.card then
				slot1.card:UpdateSelected(false)
			end

			slot1.contextData.iconFrameId = slot0.attireFrame.id

			slot0.attireFrame.id:UpdateDesc(slot0.attireFrame.id.UpdateDesc)
			slot0.attireFrame.id.UpdateDesc:UpdateSelected(true)

			slot0.attireFrame.id.UpdateDesc.card = slot0.attireFrame.id.UpdateDesc
		end
	end, SFX_PANEL)
end

slot0.GetColumn = function (slot0)
	return 2
end

slot0.OnUpdateItem = function (slot0, slot1, slot2)
	slot0.super.OnUpdateItem(slot0, slot1, slot2)

	if slot0.cards[slot2].attireFrame.id == (slot0.contextData.iconFrameId or slot0.displayVOs[1].id) then
		triggerButton(slot4._go)
		slot4:UpdateSelected(true)
	end
end

return slot0
