slot0 = class("SummaryPage2", import(".SummaryAnimationPage"))

function slot0.OnInit(slot0)
	setText(slot1, slot0.summaryInfoVO.firstProposeName)

	slot0.textTFs = {}

	for slot6 = 1, findTF(slot0._go, "texts").childCount, 1 do
		if go(slot2:GetChild(slot6 - 1)).name ~= "label" then
			setText(slot7:Find("Text"), slot0.summaryInfoVO[slot8])
		end

		table.insert(slot0.textTFs, slot7)
	end

	setText(slot3, slot0.summaryInfoVO.firstLadyTime)
	setPaintingPrefabAsync(slot5, slot6, "chuanwu")
	setActive(slot0._go, false)
end

function slot0.Clear(slot0)
	return
end

return slot0
