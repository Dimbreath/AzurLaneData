class("SummaryPage1", import(".SummaryAnimationPage")).OnInit = function (slot0)
	slot4 = findTF(slot3, "mask/painting")

	setText(slot2, slot0.summaryInfoVO.name)

	slot6 = {}

	for slot10 = 1, findTF(slot0._go, "time_line").childCount, 1 do
		for slot16 = 1, slot5:GetChild(slot10 - 1).Find(slot11, "texts").childCount, 1 do
			if go(slot12:GetChild(slot16 - 1)).name == "guildName" then
				if not (not slot0.summaryInfoVO.guildName or slot19 == "") then
					setText(slot17:Find("text/Text"), "「" .. slot19 .. "」")
				end

				setActive(slot17:Find("image"), slot20)
				setActive(slot17:Find("text"), not slot20)
			elseif slot18 == "days" or slot18 == "furnitureCount" or slot18 == "furnitureWorth" then
				setText(slot17:Find("Text"), slot0.summaryInfoVO[slot18])
			elseif slot18 ~= "label" then
				setText(slot17:Find("Text"), "「" .. string.gsub(slot0.summaryInfoVO[slot18], "–", "-") .. "」")
			end
		end

		table.insert(slot6, slot11)
	end

	setPaintingPrefabAsync(slot4, slot7, "chuanwu")
	setActive(slot0._go, false)
end

return class("SummaryPage1", import(".SummaryAnimationPage"))
