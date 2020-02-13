pg = pg or {}
pg.TipsMgr = singletonClass("TipsMgr")

function pg.TipsMgr.Ctor(slot0)
	slot0._go = nil
end

function pg.TipsMgr.Init(slot0, slot1)
	print("initializing tip manager...")

	slot0._count = 0
	slot0._tipTable = {}

	PoolMgr.GetInstance():GetUI("TipPanel", true, function (slot0)
		slot0._go = slot0

		slot0._go:SetActive(false)
		slot0._go.transform:SetParent(
		-- Decompilation error in this vicinity:
		GameObject.Find("Overlay/UIOverlay").transform, false)

		slot0._tips = slot0._go.transform:Find("toolTip")
		slot0._picTips = slot0._go.transform:Find("toolPicTip")
		slot0._grid = slot0._go.transform:Find("Grid")


		-- Decompilation error in this vicinity:
		GameObject.Find("Overlay/UIOverlay")()
	end)
end

function pg.TipsMgr.ShowTips(slot0, slot1, slot2, slot3)
	playSoundEffect(slot3 or SFX_UI_TIP)
	slot0._go.transform:SetAsLastSibling()
	SetActive(slot0._go, true)

	slot0._count = slot0._count + 1
	slot4 = cloneTplTo(slot0._tips, slot0._grid)

	setText(slot4.transform:Find("Text"), "<color=" .. (slot2 or "white") .. ">" .. slot1 .. "</color>")

	slot4.transform.localScale = Vector3(0, 0.1, 1)

	LeanTween.scale(slot4, Vector3(1.8, 0.1, 1), 0.1):setUseEstimatedTime(true)
	LeanTween.scale(slot4, Vector3(1.1, 1.1, 1), 0.1):setDelay(0.1):setUseEstimatedTime(true)

	function slot6(slot0, slot1)
		slot2 = GetOrAddComponent(slot0, "CanvasGroup")

		Timer.New(function ()
			if IsNil(IsNil) then
				return
			end

			LeanTween.scale(LeanTween.scale, Vector3(0.1, 1.5, 1), 0.1):setUseEstimatedTime(true):setOnComplete(System.Action(function ()
				LeanTween.scale(LeanTween.scale, Vector3.zero, 0.1):setUseEstimatedTime(true):setOnComplete(System.Action(function ()
					Destroy(Destroy)

					for slot3, slot4 in pairs(Destroy._tipTable) do
						if slot4 == slot0 then
							table.remove(slot1._tipTable, slot3)
						end
					end

					slot1._count = slot1._count - 1

					if slot1._count == 0 then
						SetActive(slot1._go, false)
					end
				end))
			end))
		end, 3):Start()
	end

	if slot0._count <= 3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 82-89, warpins: 1 ---
		slot0._tipTable[slot0._count] = slot4

		slot6(slot4, slot0._count)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 90-106, warpins: 1 ---
		Destroy(slot0._tipTable[1])
		table.remove(slot0._tipTable, 1)

		slot0._count = 3
		slot0._tipTable[3] = slot4

		slot6(slot4, slot0._count)
		--- END OF BLOCK #0 ---



	end
end

function pg.TipsMgr.ShowPicTips(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot5 = playSoundEffect

	if not slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		slot6 = SFX_UI_TIP
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-23, warpins: 2 ---
	slot5(slot6)
	slot0._go.transform:SetAsLastSibling()
	SetActive(slot0._go, true)

	slot0._count = slot0._count + 1
	slot5 = cloneTplTo(slot0._picTips, slot0._grid)
	slot6 = slot3 or "white"

	setText(cloneTplTo(slot0._picTips, slot0._grid).transform:Find("Text"), "<color=" .. slot6 .. ">\"" .. slot1 .. "\" x" .. slot2 .. "</color>")

	function slot7(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-25, warpins: 1 ---
		GetOrAddComponent(slot0, "CanvasGroup").alpha = 1
		slot2 = LeanTween.alphaCanvas(slot1, 0, 5):setUseEstimatedTime(true):setOnComplete(System.Action(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-8, warpins: 1 ---
			Destroy(Destroy)

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 9-19, warpins: 0 ---
			for slot3, slot4 in pairs(Destroy._tipTable) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 9-11, warpins: 1 ---
				if slot4 == slot0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 12-17, warpins: 1 ---
					table.remove(slot1._tipTable, slot3)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 18-19, warpins: 3 ---
				--- END OF BLOCK #1 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 20-28, warpins: 1 ---
			slot1._count = slot1._count - 1

			if slot1._count == 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 29-33, warpins: 1 ---
				SetActive(slot1._go, false)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 34-34, warpins: 2 ---
			return
			--- END OF BLOCK #3 ---



		end))

		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #2 24-24, warpins: 1 ---
	slot6 = "white"

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 25-44, warpins: 2 ---
	if slot0._count <= 3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 45-51, warpins: 1 ---
		slot0._tipTable[slot0._count] = slot5

		slot7(slot5)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 52-67, warpins: 1 ---
		Destroy(slot0._tipTable[1])
		table.remove(slot0._tipTable, 1)

		slot0._count = 3
		slot0._tipTable[3] = slot5

		slot7(slot5)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 68-69, warpins: 2 ---
	return
	--- END OF BLOCK #4 ---



end

return
