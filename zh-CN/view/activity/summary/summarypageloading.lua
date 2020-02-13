slot0 = class("SummaryPageLoading", import(".SummaryPage"))
slot1 = 0.05

function slot0.OnInit(slot0)
	slot0.textContainer = findTF(slot0._go, "texts")
	slot0.textTFs = {}

	eachChild(slot0.textContainer, function (slot0)
		setActive(slot0, false)
		table.insert(slot0.textTFs, 1, slot0)
	end)

	slot0.timers = {}

	setActive(slot0._go, false)
end

function slot0.Show(slot0, slot1)
	slot0.inAniming = true

	setActive(slot0._tf, true)

	slot2 = {}

	for slot6, slot7 in ipairs(slot0.textTFs) do
		table.insert(slot2, function (slot0)
			slot0.timers[] = Timer.New(function ()
				if slot0.timers[slot1] then
					slot0.timers[slot1]:Stop()

					slot0.timers[slot1].Stop.timers[slot0.timers[slot1]] = nil
				end

				setActive(slot2, true)
				slot2:GetComponent(typeof(Typewriter)):setSpeed(
				-- Decompilation error in this vicinity:
				0.015)

				-- Decompilation error in this vicinity:
				0.015()
			end, slot3 * slot1, 1)

			slot0.timers[]:Start()
		end)
	end

	table.insert(slot2, function (slot0)
		slot1 = slot0.textContainer:GetComponent(typeof(CanvasGroup))

		LeanTween.value(go(slot0.textContainer), 1, 0, 0.5):setOnUpdate(System.Action_float(function (slot0)
			slot0.alpha = slot0
		end)):setOnComplete(System.Action(slot0)):setDelay(0.6)
	end)
	seriesAsync(slot2, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		slot0.inAniming = 
		-- Decompilation error in this vicinity:
		nil


		-- Decompilation error in this vicinity:
		nil()

		return
		--- END OF BLOCK #0 ---



	end)
end

function slot0.Hide(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot0:Clear()
	setActive(slot0._tf, false)
	slot1()

	return
	--- END OF BLOCK #0 ---



end

function slot0.inAnim(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return slot0.inAniming
	--- END OF BLOCK #0 ---



end

function slot0.Clear(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-9, warpins: 0 ---
	for slot4, slot5 in pairs(slot0.timers) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-7, warpins: 1 ---
		slot5:Stop()
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-9, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 10-12, warpins: 1 ---
	slot0.timers = {}

	return
	--- END OF BLOCK #2 ---



end

return slot0
