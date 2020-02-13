slot0 = class("ShipExpLayer", import("..base.BaseUI"))
slot0.TypeDefault = 0
slot0.TypeClass = 1

function slot0.getUIName(slot0)
	return "ShipExpUI"
end

function slot0.init(slot0)
	slot0._grade = slot0:findTF("grade")
	slot0._gradeLabel = slot0:findTF("label", slot0._grade)
	slot0._levelText = slot0:findTF("Text", slot0._grade)
	slot0._main = slot0:findTF("main")
	slot0._leftPanel = slot0:findTF("leftPanel", slot0._main)
	slot0._topBar = slot0:findTF("topBar", slot0._leftPanel)
	slot0._expResult = slot0:findTF("expResult", slot0._leftPanel)
	slot0._expContainer = slot0:findTF("expContainer", slot0._expResult)
	slot0._extpl = slot0:getTpl("ShipCardTpl", slot0._expContainer)
	slot0._skipBtn = slot0:findTF("skipLayer")

	setActive(slot0._topBar, false)
end

function slot0.didEnter(slot0)
	slot0.tweenTFs = {}
	slot0.timerId = {}

	onButton(slot0, slot0._skipBtn, function ()
		slot0:skip()
	end, SFX_CONFIRM)
	pg.UIMgr.GetInstance():BlurPanel(slot0._tf, false, {
		weight = LayerWeightConst.THIRD_LAYER
	})
	slot0:display()
end

function slot0.display(slot0)
	setActive(slot0._grade, true)
	setText(slot0._levelText, slot0.contextData.title)

	if slot0.contextData.type == slot0.TypeClass then
		setActive(slot0._gradeLabel, false)
	else
		setActive(slot0._gradeLabel, true)
		LoadImageSpriteAsync("battlescore/" .. ((slot0.contextData.isCri and "grade_label_task_perfect") or "grade_label_task_complete"), slot0._gradeLabel, true)
	end

	setActive(slot0._topBar, slot0.contextData.top)

	if slot0.contextData.top then
		setText(slot0._topBar:Find("text_1"), slot1.text1)
		setText(slot0._topBar:Find("text_2"), slot1.text2)
		setText(slot0._topBar:Find("text_3"), slot1.text3)

		slot0._topBar:Find("progress"):GetComponent(typeof(Image)).fillAmount = slot1.progress
	end

	slot0._expTFs = {}
	slot0._nameTxts = {}
	slot0._skipExp = {}
	slot0._maxRightDelay = 0
	slot2 = {}

	for slot6, slot7 in ipairs(slot0.contextData.newShips) do
		slot2[slot7.id] = slot7
	end

	slot4 = 0.5

	for slot8, slot9 in ipairs(slot3) do
		slot11 = cloneTplTo(slot0._extpl, slot0._expContainer)
		slot14 = findTF(slot11, "content")
		slot15 = ScrollTxt.New(findTF(slot14, "info/name_mask"), findTF(slot14, "info/name_mask/name"))
		slot11.transform.anchoredPosition = Vector3(slot11.transform.anchoredPosition.x + (16.2 + rtf(slot11).rect.width) * (slot8 - 1), slot11.transform.anchoredPosition.y, slot11.transform.anchoredPosition.z)
		slot0._expTFs[#slot0._expTFs + 1] = slot11
		slot0._nameTxts[#slot0._nameTxts + 1] = slot15

		flushShipCard(slot11, slot9)
		slot15:setText(slot9:getName())

		slot17 = findTF(slot14, "dockyard/lv_bg/levelUpLabel")
		slot18 = findTF(slot14, "dockyard/lv_bg/levelup")

		setText(slot16, slot9.level)

		slot20 = findTF(slot19, "exp_text")
		slot21 = findTF(slot19, "exp_progress")
		slot0._maxRightDelay = math.max(slot0._maxRightDelay, slot2[slot9.id].level - slot9.level + slot8 * 0.5)

		function slot22()
			SetActive(SetActive, true)

			slot3:GetComponent(typeof(Image)).fillAmount = slot1.exp / SetActive:getLevelExpConfig().exp

			if slot1.level < slot2.level then
				for slot6 = slot1.level, slot2.level - 1, 1 do
					slot2 = slot2 + slot1:getLevelExpConfig(slot6).exp
				end

				slot4:PlayAnimation(slot5, 0, (slot2 + slot2.exp) - slot1.exp, 1, 0, function (slot0)
					setText(slot0, "+" .. math.ceil(slot0))
				end)

				function slot3(slot0)
					SetActive(slot0, true)
					SetActive(SetActive, true)
					LeanTween.moveY(rtf(slot0), slot0.localPosition.y + 30, 0.5):setOnComplete(System.Action(function ()
						SetActive(SetActive, false)

						SetActive.localPosition = SetActive

						playSoundEffect(SFX_BOAT_LEVEL_UP)
					end))
					setText(setText, slot0)
					table.insert(setText.tweenTFs, slot0)
				end

				LeanTween.value(go(go), slot1.exp / slot0, 1, 0.5):setOnUpdate(System.Action_float(function (slot0)
					slot0:GetComponent(typeof(Image)).fillAmount = slot0
				end)):setOnComplete(System.Action(function ()
					slot1(slot0.level + 1)

					slot0 = slot0.level + 1 + 1
					slot1 = 0.1

					while slot0 <= slot2.level do
						slot2 = slot0

						LeanTween.value(go(slot3), 0, 1, 1):setOnUpdate(System.Action_float(function (slot0)
							slot0:GetComponent(typeof(Image)).fillAmount = slot0
						end)):setDelay(slot1):setOnComplete(System.Action(function ()

							-- Decompilation error in this vicinity:
							--- BLOCK #0 1-4, warpins: 1 ---
							slot0(slot1)

							return
							--- END OF BLOCK #0 ---



						end))

						slot1 = slot1 + 1
						slot0 = slot0 + 1
					end

					slot5.timerId[slot0.id] = pg.TimeMgr.GetInstance():AddTimer("delayTimer", slot1, 0, function ()

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-8, warpins: 1 ---
						if slot0.level == slot0:getMaxLevel() then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 9-23, warpins: 1 ---
							slot1:GetComponent(typeof(Image)).fillAmount = 1
							slot2._skipExp[Image] = false

							return
							--- END OF BLOCK #0 ---



						end

						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 24-37, warpins: 1 ---
						slot2:PlayAnimation(slot4, 0, slot0.exp / slot5, 0.5, 0, function (slot0)

							-- Decompilation error in this vicinity:
							--- BLOCK #0 1-14, warpins: 1 ---
							slot0:GetComponent(typeof(Image)).fillAmount = slot0
							slot0.GetComponent(typeof(Image))._skipExp[slot0] = false

							return
							--- END OF BLOCK #0 ---



						end)

						return
						--- END OF BLOCK #1 ---

						FLOW; TARGET BLOCK #2



						-- Decompilation error in this vicinity:
						--- BLOCK #2 38-38, warpins: 2 ---
						--- END OF BLOCK #2 ---



					end)
				end))
				table.insert(slot4.tweenTFs, )

				return
			end

			setText(slot6, "+" .. math.ceil(slot2:getExp() - slot1:getExp()))

			if slot1.level == slot1:getMaxLevel() then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 122-137, warpins: 1 ---
				slot3:GetComponent(typeof(Image)).fillAmount = 1
				slot4._skipExp[slot10] = false

				return
				--- END OF BLOCK #0 ---



			end

			slot4:PlayAnimation(slot5, slot1.exp / slot0, slot2.exp / slot0, 1, 0, function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-14, warpins: 1 ---
				slot0:GetComponent(typeof(Image)).fillAmount = slot0
				slot0.GetComponent(typeof(Image))._skipExp[slot0] = false

				return
				--- END OF BLOCK #0 ---



			end)
		end

		slot0._skipExp[slot8] = function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-33, warpins: 1 ---
			LeanTween.cancel(go(LeanTween.cancel))
			LeanTween.cancel(go(go))
			SetActive(go, true)
			SetActive(true, true)
			setText(slot3, slot4.level)

			if slot5.level == slot5:getMaxLevel() then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 34-60, warpins: 1 ---
				setText(slot6, "+" .. math.ceil(slot4:getExp() - slot4:getExp()))

				slot7:GetComponent(typeof(Image)).fillAmount = 1
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 61-66, warpins: 1 ---
				if slot5.level < slot4.level then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 67-74, warpins: 1 ---
					slot0 = 0

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 75-82, warpins: 0 ---
					for slot4 = slot5.level, slot4.level - 1, 1 do

						-- Decompilation error in this vicinity:
						--- BLOCK #0 75-82, warpins: 2 ---
						slot0 = slot0 + slot5:getLevelExpConfig(slot4).exp
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #1 ---

					FLOW; TARGET BLOCK #2



					-- Decompilation error in this vicinity:
					--- BLOCK #2 83-94, warpins: 1 ---
					setText(slot6, "+" .. (slot0 + slot4.exp) - slot5.exp)
					--- END OF BLOCK #2 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 95-107, warpins: 1 ---
					setText(slot6, "+" .. math.ceil(slot4.exp - slot5.exp))
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 108-123, warpins: 2 ---
				slot7:GetComponent(typeof(Image)).fillAmount = slot4.exp / slot4:getLevelExpConfig().exp
				--- END OF BLOCK #1 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 124-147, warpins: 2 ---
			SetActive(SetActive, false)

			SetActive:GetComponent("CanvasGroup").alpha = 1
			rtf(1).anchoredPosition = Vector2(rtf(slot1).anchoredPosition.x, 0)

			return
			--- END OF BLOCK #1 ---



		end

		slot23 = slot11:GetComponent("CanvasGroup")

		setActive(slot11, false)
		LeanTween.moveY(rtf(slot11), 0, 0.2):setOnComplete(System.Action(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			setActive(setActive, true)
			setActive()

			return
			--- END OF BLOCK #0 ---



		end)):setDelay(slot24)
		table.insert(slot0.tweenTFs, slot11)
		LeanTween.value(go(slot11), 0, 1, 0.2):setOnUpdate(System.Action_float(function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-3, warpins: 1 ---
			slot0.alpha = slot0

			return
			--- END OF BLOCK #0 ---



		end)):setDelay(slot8 * 0.2)
	end
end

function slot0.skip(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	if _.any(slot0._skipExp, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-1, warpins: 1 ---
		return slot0
		--- END OF BLOCK #0 ---



	end) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-12, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 13-23, warpins: 0 ---
		for slot4 = 1, #slot0._skipExp, 1 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-16, warpins: 2 ---
			if slot0._skipExp[slot4] then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 17-22, warpins: 1 ---
				slot0._skipExp[slot4]()

				slot0._skipExp[slot4] = false
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 23-23, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 24-24, warpins: 1 ---
		--- END OF BLOCK #2 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 25-29, warpins: 1 ---
		slot0:emit(BaseUI.ON_CLOSE)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 30-30, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.PlayAnimation(slot0, slot1, slot2, slot3, slot4, slot5, slot6)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-25, warpins: 1 ---
	LeanTween.value(slot1.gameObject, slot2, slot3, slot4):setDelay(slot5):setOnUpdate(System.Action_float(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		slot0(slot0)

		return
		--- END OF BLOCK #0 ---



	end))
	table.insert(slot0.tweenTFs, slot1)

	return
	--- END OF BLOCK #0 ---



end

function slot0.willExit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-20, warpins: 0 ---
	for slot4, slot5 in pairs(slot0.tweenTFs) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-12, warpins: 1 ---
		if LeanTween.isTweening(go(slot5)) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-18, warpins: 1 ---
			LeanTween.cancel(go(slot5))
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 19-20, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 21-26, warpins: 1 ---
	slot0.tweenTFs = nil

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 27-36, warpins: 0 ---
	for slot4, slot5 in pairs(slot0.timerId) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 27-34, warpins: 1 ---
		pg.TimeMgr.GetInstance():RemoveTimer(slot5)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 35-36, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 37-43, warpins: 1 ---
	slot0.timerId = nil

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 44-54, warpins: 0 ---
	for slot4 = #slot0._nameTxts, 1, -1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 44-54, warpins: 2 ---
		slot0._nameTxts[slot4]:destroy()
		table.remove(slot0._nameTxts, slot4)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 55-65, warpins: 1 ---
	slot0._nameTxts = nil

	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf)

	return
	--- END OF BLOCK #6 ---



end

return slot0
