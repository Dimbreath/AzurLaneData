slot0 = class("AttireChatFramePanel", import(".AttireFramePanel"))
slot1 = setmetatable

function slot2(slot0)
	function slot4(slot0, slot1, slot2)
		setAnchoredPosition(slot1, Vector2.zero)
		setText(slot1.transform:Find("Text"), "")
	end

	slot3(slot1)

	return slot0({
		Update = function (slot0, slot1, slot2, slot3)
			slot0:Update(slot1, slot2, slot3)
			slot0:ReturnIconFrame(AttireConst.TYPE_CHAT_FRAME)

			if slot0:isEmpty() then
				return
			end

			slot0:LoadPrefab(slot1, function (slot0)
				slot0(slot0, slot0, )
			end)
		end,
		Dispose = function (slot0)
			slot0:ReturnIconFrame(AttireConst.TYPE_CHAT_FRAME)
		end
	}, {
		__index = AttireFramePanel.Card(slot0)
	})
end

function slot0.getUIName(slot0)
	return "AttireChatFrameUI"
end

function slot0.GetData(slot0)
	return slot0.rawAttireVOs.chatFrames
end

function slot0.OnInitItem(slot0, slot1)
	slot0.cards[slot1] = slot0(slot1)

	onButton(slot0, slot0(slot1)._go, function ()
		if slot0:isEmpty() then
			return
		end

		if slot1.card then
			slot1.card:UpdateSelected(false)
		end

		slot1.contextData.chatFrameIndex = slot0.attireFrame.id

		slot0.attireFrame.id:UpdateDesc(slot0.attireFrame.id.UpdateDesc)
		slot0.attireFrame.id.UpdateDesc:UpdateSelected(true)

		slot0.attireFrame.id.UpdateDesc.card = slot0.attireFrame.id.UpdateDesc
	end, SFX_PANEL)
end

function slot0.GetColumn(slot0)
	return 3
end

function slot0.OnUpdateItem(slot0, slot1, slot2)
	slot0.super.OnUpdateItem(slot0, slot1, slot2)

	if slot0.cards[slot2].attireFrame.id == (slot0.contextData.chatFrameIndex or slot0.displayVOs[1].id) then
		triggerButton(slot4._go)
		slot4:UpdateSelected(true)
	end
end

return slot0
