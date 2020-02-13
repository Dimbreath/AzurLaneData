slot0 = class("ShipProfileExCvBtn", import(".ShipProfileCvBtn"))

function slot0.Init(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.super.Init(slot0, slot1, slot2, slot3, slot4)

	slot0.favor = slot5
	slot7, slot8 = nil

	if string.find(slot4.key, ShipWordHelper.WORD_TYPE_MAIN) then
		slot7, slot8 = ShipWordHelper.ExistExCv(slot2.id, ShipWordHelper.WORD_TYPE_MAIN, tonumber(string.split(slot6, ShipWordHelper.WORD_TYPE_MAIN)[1]), slot5)
	else
		slot7, slot8 = ShipWordHelper.ExistExCv(slot2.id, slot6, nil, slot5)
	end

	if slot0.wordData.cvPath and slot8 then
		slot0.wordData.cvPath = slot0.wordData.cvPath .. "_ex" .. slot8
	end

	slot0.wordData.matchFavor = slot8
	slot0.wordData.textContent = slot7
end

function slot0.Update(slot0)
	if slot0.voice.unlock_condition[1] >= 0 then
		slot2 = false
	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-9, warpins: 1 ---
		slot2 = true

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 10-13, warpins: 2 ---
		if slot0.wordData.textContent ~= nil and slot0.wordData.textContent ~= "nil" and slot0.wordData.textContent ~= "" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 22-23, warpins: 1 ---
			slot3 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 24-24, warpins: 3 ---
			slot3 = true
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 25-26, warpins: 2 ---
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #2 27-27, warpins: 1 ---
			slot2 = slot3
			--- END OF BLOCK #2 ---



		end
		--- END OF BLOCK #1 ---



	end

	slot3 = slot0.wordData.textContent == nil or slot0.wordData.textContent == "nil" or slot0.wordData.textContent == ""

	setActive(slot0._tf, not (slot2 or slot0.wordData.textContent == nil or slot0.wordData.textContent == "nil" or slot0.wordData.textContent == ""))

	if not (slot2 or slot0.wordData.textContent == nil or slot0.wordData.textContent == "nil" or slot0.wordData.textContent == "") then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 34-36, warpins: 1 ---
		slot0:UpdateCvBtn()
		--- END OF BLOCK #0 ---



	end
end

function slot0.UpdateCvBtn(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot3, slot4 = slot0.shipGroup.VoiceReplayCodition(slot2, slot0.voice)

	if not slot3 or not (slot1.voice_name .. "Ex") then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-14, warpins: 2 ---
		slot5 = "???"
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 15-31, warpins: 2 ---
	slot0.nameTxt.text = slot5

	setActive(slot0.tagDiff, ShipWordHelper.ExistDifferentExWord(slot0.skin.id, slot1.key, slot0.wordData.mainIndex, slot0.favor))

	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 32-37, warpins: 1 ---
		onButton(nil, slot0._tf, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-9, warpins: 1 ---
			pg.TipsMgr.GetInstance():ShowTips(pg.TipsMgr.GetInstance().ShowTips)

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 38-39, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

return slot0
