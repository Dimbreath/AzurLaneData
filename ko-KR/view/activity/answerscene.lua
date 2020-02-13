slot0 = class("AnswerScene", import("..base.BaseUI"))
slot0.Idle = "stand"
slot0.HandsUp = "attack"

function slot0.getUIName(slot0)
	return "AnswerUI"
end

function slot0.setActivity(slot0, slot1)
	slot0.activity = slot1
end

function slot0.init(slot0)
	slot0.top = slot0:findTF("top")
	slot0.btnBack = slot0:findTF("back", slot0.top)
	slot0.btnHelp = slot0:findTF("btnHelp")
	slot0.layerSelection = slot0:findTF("layer_selection")
	slot0.layerProcess = slot0:findTF("layer_process")
	slot0.layerResult = slot0:findTF("layer_result")
	slot0.resources = slot0:findTF("resources")

	setActive(slot0.layerSelection, false)
	setActive(slot0.layerProcess, false)
	setActive(slot0.layerResult, false)
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.btnBack, function ()
		if slot0.isTweening then
			return
		end

		if isActive(slot0.layerProcess) then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("answer_exit_tip"),
				onYes = function ()
					slot0:emit(slot1.ON_BACK)
				end
			})
		else
			slot0:emit(slot1.ON_BACK)
		end
	end, SFX_CANCEL)
	onButton(slot0, slot0.btnHelp, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("answer_help_tip")
		})
	end, SFX_PANEL)
	slot0:displaySelection()
end

function slot0.onBackPressed(slot0)
	if slot0.isTweening then
		return
	end

	playSoundEffect(SFX_CANCEL)
	triggerButton(slot0.btnBack)
end

function slot0.displaySelection(slot0)
	setActive(slot0.layerSelection, true)

	slot1 = slot0.layerSelection:Find("panel")
	slot2 = slot1:Find("name")
	slot4 = slot1:Find("confirm")
	slot5 = slot1:Find("cancel")
	slot6 = getProxy(AnswerProxy)

	for slot10 = 0, slot1:Find("subjects").childCount - 1, 1 do
		setText(slot3:GetChild(slot10):Find("score"), slot6:getScore(slot10) or "--")
		setToggleEnabled(slot11, slot6:isSubjectOpen(slot0.activity, slot10))
		setActive(slot11:Find("lock"), not slot6.isSubjectOpen(slot0.activity, slot10))
	end

	setText(slot2, getProxy(PlayerProxy):getRawData().name)

	slot0.isTweening = true

	LeanTween.value(go(slot1), 0, 1, 0.7):setOnUpdate(System.Action_float(function (slot0)
		slot0.localScale = Vector3(slot0, slot0, 1)
		slot0.localEulerAngles = Vector3(0, 0, 720 * slot0)
	end)):setOnComplete(System.Action(function ()
		slot0.isTweening = false
	end)):setEase(LeanTweenType.easeInOutSine)
	onButton(slot0, slot4, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 7-31, warpins: 0 ---
		for slot3 = 0, slot0.childCount - 1, 1 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-15, warpins: 2 ---
			if getToggleState(slot0:GetChild(slot3)) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 16-30, warpins: 1 ---
				slot1:hideSelection()
				slot1:emit(AnswerMediator.ANSWER_START, slot1.activity.id, slot3)

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 31-31, warpins: 1 ---
				break
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 31-31, warpins: 1 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 32-32, warpins: 2 ---
		return
		--- END OF BLOCK #2 ---



	end, SFX_CONFIRM)
	onButton(slot0, slot5, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		triggerButton(slot0.btnBack)

		return
		--- END OF BLOCK #0 ---



	end, SFX_CANCEL)
end

function slot0.hideSelection(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	setActive(slot0.layerSelection, false)

	return
	--- END OF BLOCK #0 ---



end

function slot0.startProcess(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-59, warpins: 1 ---
	setActive(slot0.layerProcess, true)

	slot4 = slot0.layerProcess:Find("prepare").Find(slot3, "tips")
	slot5 = slot0.layerProcess:Find("count_down")
	slot6 = slot5:Find("progress")
	slot7 = slot5:Find("time")
	slot8 = slot5:Find("question")
	slot9 = slot5:Find("answer1")
	slot10 = slot5:Find("answer2")
	slot11 = slot0.layerProcess:Find("ship_left")
	slot12 = slot0.layerProcess:Find("ship_right")
	slot13 = nil
	process = coroutine.create(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-35, warpins: 1 ---
		slot0 = slot0.activity:getConfig("config_client")
		slot2 = slot0.answertime
		slot3 = slot0.endtime
		slot4 = slot0.activity:getConfig("config_data")[1][1]
		slot5 = Ship.New({
			id = 1,
			configId = Answer.Ship1
		})
		slot6 = Ship.New({
			id = 2,
			configId = Answer.Ship2
		})

		if slot1.childCount == 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 36-47, warpins: 1 ---
			slot0:loadShip(slot5:getPrefab(), slot1, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-4, warpins: 1 ---
				onNextTick(onNextTick)

				return
				--- END OF BLOCK #0 ---



			end)
			coroutine.yield()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 48-51, warpins: 2 ---
		if slot3.childCount == 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 52-63, warpins: 1 ---
			slot0:loadShip(slot6:getPrefab(), slot3, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-4, warpins: 1 ---
				onNextTick(onNextTick)

				return
				--- END OF BLOCK #0 ---



			end)
			coroutine.yield()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 64-86, warpins: 2 ---
		slot7 = slot1:GetChild(0):GetComponent(typeof(SpineAnimUI))
		slot8 = slot3:GetChild(0):GetComponent(typeof(SpineAnimUI))
		slot9 = 1

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 87-90, warpins: 2 ---
		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 91-474, warpins: 0 ---
		while slot9 <= #slot4 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 91-91, warpins: 1 ---
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 92-95, warpins: 1 ---
			if slot0.exited then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 96-97, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 98-102, warpins: 2 ---
			if slot4[slot9].type ~= 0 or not slot5 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 105-105, warpins: 2 ---
				slot11 = slot6
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 106-108, warpins: 2 ---
			slot12 = (slot10.type == 0 and slot1) or slot3

			setActive(slot5, true)
			setActive(slot6, false)
			setText(slot7, i18n("answer_answer_role", slot11:getName()))
			setImageAlpha(slot1:Find("spot_light"), 0)
			setImageAlpha(slot3:Find("spot_light"), 0)
			slot7:SetAction(slot8.Idle, 0)
			slot8:SetAction(slot8.Idle, 0)
			LeanTween.textAlpha(slot7, 1, slot15)
			LeanTween.textAlpha(slot7, 0, slot15):setDelay(slot1 - 0.3):setOnComplete(System.Action(slot2))
			LeanTween.alpha((slot10.type == 0 and slot1) or slot3:Find("spot_light"), 1, 0.3):setOnComplete(System.Action(function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-8, warpins: 1 ---
				slot0:SetAction(slot1.HandsUp, 0)

				return
				--- END OF BLOCK #0 ---



			end))
			coroutine.yield()

			slot16, slot17 = nil
			slot9.sizeDelta.x = 746
			slot9.sizeDelta = slot9.sizeDelta

			setActive(slot5, false)
			setActive(slot6, true)
			setText(slot11, slot10:getConfig("qusetion"))
			setActive(slot12:Find("correct"), false)
			setActive(slot12:Find("wrong"), false)
			setActive((slot10.type == 0 and slot7) or slot8:Find("correct"), false)
			setActive((slot10.type == 0 and slot7) or slot8:Find("wrong"), false)
			setButtonEnabled(slot12, true)
			setButtonEnabled((slot10.type == 0 and slot7) or slot8, true)
			setText(slot12:Find("text"), "A." .. ((math.random() >= 0.5 and slot10:getConfig("incorrect_answer")) or slot10:getConfig("correct_answer")))
			setText((slot10.type == 0 and slot7) or slot8:Find("text"), "B." .. ((math.random() >= 0.5 and slot10:getConfig("correct_answer")) or slot10:getConfig("incorrect_answer")))
			onButton(slot0, slot12, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-4, warpins: 1 ---
				slot0 = 0

				slot1()

				return
				--- END OF BLOCK #0 ---



			end, SFX_PANEL)
			onButton(slot0, (slot10.type == 0 and slot7) or slot8, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-4, warpins: 1 ---
				slot0 = 1

				slot1()

				return
				--- END OF BLOCK #0 ---



			end, SFX_PANEL)
			coroutine.yield()
			LeanTween.cancel(LeanTween.value(go(slot9), slot2, 0, slot2):setOnUpdate(System.Action_float(function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-19, warpins: 1 ---
				slot0.sizeDelta.x = slot0 / slot1 * 746
				slot0.sizeDelta = slot0.sizeDelta
				slot2 = slot0

				setText(slot3, math.ceil(slot0) .. "s")

				return
				--- END OF BLOCK #0 ---



			end)):setOnComplete(System.Action(function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-4, warpins: 1 ---
				slot0 = 0

				slot1()

				return
				--- END OF BLOCK #0 ---



			end)).uniqueId)
			setButtonEnabled(slot12, false)
			setButtonEnabled((slot10.type == 0 and slot7) or slot8, false)

			--- END OF BLOCK #3 ---

			FLOW; TARGET BLOCK #5



			-- Decompilation error in this vicinity:
			--- BLOCK #4 109-111, warpins: 1 ---
			if not slot1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 112-112, warpins: 2 ---
				slot12 = slot3
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #4 ---

			FLOW; TARGET BLOCK #5



			-- Decompilation error in this vicinity:
			--- BLOCK #5 113-115, warpins: 2 ---
			--- END OF BLOCK #5 ---

			FLOW; TARGET BLOCK #7



			-- Decompilation error in this vicinity:
			--- BLOCK #6 116-117, warpins: 1 ---
			if not slot7 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 118-118, warpins: 2 ---
				slot13 = slot8
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #6 ---

			FLOW; TARGET BLOCK #7



			-- Decompilation error in this vicinity:
			--- BLOCK #7 119-124, warpins: 2 ---
			--- END OF BLOCK #7 ---

			FLOW; TARGET BLOCK #9



			-- Decompilation error in this vicinity:
			--- BLOCK #8 125-126, warpins: 1 ---
			slot14 = false

			if false then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 127-127, warpins: 1 ---
				slot14 = true
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #8 ---

			FLOW; TARGET BLOCK #9



			-- Decompilation error in this vicinity:
			--- BLOCK #9 128-310, warpins: 2 ---
			--- END OF BLOCK #9 ---

			FLOW; TARGET BLOCK #11



			-- Decompilation error in this vicinity:
			--- BLOCK #10 311-316, warpins: 1 ---
			if not slot10.getConfig("incorrect_answer") then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 317-320, warpins: 2 ---
				slot23 = slot10.getConfig("correct_answer")
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #10 ---

			FLOW; TARGET BLOCK #11



			-- Decompilation error in this vicinity:
			--- BLOCK #11 321-331, warpins: 2 ---
			--- END OF BLOCK #11 ---

			FLOW; TARGET BLOCK #13



			-- Decompilation error in this vicinity:
			--- BLOCK #12 332-337, warpins: 1 ---
			if not slot10.getConfig("correct_answer") then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 338-341, warpins: 2 ---
				slot23 = slot10.getConfig("incorrect_answer")
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #13



				-- Decompilation error in this vicinity:
				--- BLOCK #1 342-373, warpins: 2 ---
				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #13



				-- Decompilation error in this vicinity:
				--- BLOCK #2 374-375, warpins: 1 ---
				slot20 = 0

				if 0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 376-376, warpins: 1 ---
					slot20 = 1
					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #13



					-- Decompilation error in this vicinity:
					--- BLOCK #1 377-378, warpins: 2 ---
					--- END OF BLOCK #1 ---

					FLOW; TARGET BLOCK #13



					-- Decompilation error in this vicinity:
					--- BLOCK #2 379-380, warpins: 1 ---
					slot21 = 1

					if 1 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 381-381, warpins: 1 ---
						slot21 = 0
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #2 ---



				end
				--- END OF BLOCK #2 ---



			end

			--- END OF BLOCK #12 ---

			FLOW; TARGET BLOCK #13



			-- Decompilation error in this vicinity:
			--- BLOCK #13 382-384, warpins: 2 ---
			if ((slot10.type == 0 and 0) or 1) + ((slot14 and 1) or 0) == 1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 385-401, warpins: 1 ---
				setActive(slot12:Find("wrong"), true)
				setActive(slot13:Find("correct"), true)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 402-417, warpins: 1 ---
				setActive(slot12:Find("correct"), true)
				setActive(slot13:Find("wrong"), true)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #13 ---

			FLOW; TARGET BLOCK #14



			-- Decompilation error in this vicinity:
			--- BLOCK #14 418-419, warpins: 2 ---
			if not slot16 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 420-422, warpins: 1 ---
				slot10.select = (slot10.type == 0 and 1) or 0
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #1 423-424, warpins: 1 ---
				slot21 = 1

				if 1 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 425-425, warpins: 1 ---
					slot21 = 0
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 426-427, warpins: 2 ---
				--- END OF BLOCK #2 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 428-429, warpins: 1 ---
				slot10.select = (slot14 and 1 - slot16) or slot16

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #1 430-432, warpins: 1 ---
				if not (1 - slot16) then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 433-433, warpins: 2 ---
					slot21 = slot16
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 434-434, warpins: 2 ---
				--- END OF BLOCK #2 ---



			end

			--- END OF BLOCK #14 ---

			FLOW; TARGET BLOCK #15



			-- Decompilation error in this vicinity:
			--- BLOCK #15 435-469, warpins: 2 ---
			slot4 = slot4 + _.reduce(slot21, 0, function (slot0, slot1)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-4, warpins: 1 ---
				if slot1[1] >= slot0 or not math.max(slot0, slot1[2]) then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 12-12, warpins: 2 ---
					slot2 = slot0
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 13-13, warpins: 2 ---
				return slot2
				--- END OF BLOCK #1 ---



			end)
			slot10.restTime = math.floor(slot17 * 10)

			Timer.New(slot2, slot3, 1):Start()
			coroutine.yield()

			if slot0.exited then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 470-471, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #15 ---

			FLOW; TARGET BLOCK #16



			-- Decompilation error in this vicinity:
			--- BLOCK #16 472-473, warpins: 2 ---
			slot9 = slot9 + 1
			--- END OF BLOCK #16 ---

			FLOW; TARGET BLOCK #17



			-- Decompilation error in this vicinity:
			--- BLOCK #17 474-474, warpins: 2 ---
			--- END OF BLOCK #17 ---



		end

		--- END OF BLOCK #4 ---

		FLOW; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #5 474-491, warpins: 1 ---
		slot0:emit(AnswerMediator.ANSWER_SUBMIT, slot0.activity.id, slot14, _.map(slot4, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-8, warpins: 1 ---
			return {
				id = slot0.id,
				answer = slot0.select,
				time = slot0.restTime
			}
			--- END OF BLOCK #0 ---



		end), slot4)

		return
		--- END OF BLOCK #5 ---



	end)


	-- Decompilation error in this vicinity:
	function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0, slot1 = coroutine.resume(process)

		return
		--- END OF BLOCK #0 ---



	end()

	return
	--- END OF BLOCK #0 ---



end

function slot0.loadShip(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	PoolMgr.GetInstance():GetSpineChar(slot1, true, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		if slot0.exited then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-13, warpins: 1 ---
			PoolMgr.GetInstance():ReturnSpineChar(PoolMgr.GetInstance().ReturnSpineChar, slot0)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-44, warpins: 1 ---
			setParent(slot0, , false)
			slot0.transform:SetAsFirstSibling()

			slot0.transform.localScale = Vector3.New(0.8, 0.8, 1)

			slot0:GetComponent(typeof(SpineAnimUI)):SetAction(typeof.Idle, 
			-- Decompilation error in this vicinity:
			0)

			-- Decompilation error in this vicinity:
			0()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 45-45, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

function slot0.displayResult(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-79, warpins: 1 ---
	setActive(slot0.layerProcess, false)
	setActive(slot0.top, false)
	setActive(slot0.btnHelp, false)
	setActive(slot0.layerResult, true)

	slot5 = slot0.layerResult:Find("top")
	slot6 = slot0.layerResult:Find("left")
	slot7 = slot0.layerResult:Find("right")
	slot8 = slot0.layerResult:Find("alpha"):GetComponent(typeof(CanvasGroup))
	slot9 = slot0.layerResult:Find("score")
	slot10 = slot0.layerResult:Find("btnReset")

	setImageSprite(slot4, getImageSprite(slot0.resources:Find(tostring(slot1))))

	process = coroutine.create(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-127, warpins: 1 ---
		slot0.alpha = 0

		setText(0, "")
		setActive("", false)
		setAnchoredPosition(slot3, {
			y = slot3.rect.height
		})
		setAnchoredPosition(slot4, {
			x = -slot4.rect.width
		})
		setAnchoredPosition(slot5, {
			x = slot5.rect.width
		})

		slot6.isTweening = true

		LeanTween.moveY(slot5.rect.width, 0, 0.5):setEase(LeanTweenType.easeOutSine)
		LeanTween.moveX(slot4, 0, 0.5):setDelay(0.5):setEase(LeanTweenType.easeOutSine)
		LeanTween.moveX(slot5, 0, 0.5):setDelay(0.6):setEase(LeanTweenType.easeOutSine)
		LeanTween.value(go(slot0), 0, 1, 0.5):setDelay(1.1):setOnUpdate(System.Action_float(function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-3, warpins: 1 ---
			slot0.alpha = slot0

			return
			--- END OF BLOCK #0 ---



		end)):setOnComplete(System.Action(slot7))
		coroutine.yield()
		setText(LeanTween.value(go(slot0), 0, 1, 0.5).setDelay(1.1).setOnUpdate(System.Action_float(function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-3, warpins: 1 ---
			slot0.alpha = slot0

			return
			--- END OF BLOCK #0 ---



		end)), slot8)
		setActive(slot8, true)
		onButton(slot6, true, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-20, warpins: 1 ---
			setActive(slot0.layerResult, false)
			setActive(slot0.top, true)
			setActive(slot0.btnHelp, true)
			setActive:displaySelection()

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)

		if slot9 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 128-129, warpins: 1 ---
			slot9()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 130-133, warpins: 2 ---
		slot6.isTweening = false

		return
		--- END OF BLOCK #1 ---



	end)


	-- Decompilation error in this vicinity:
	function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0, slot1 = coroutine.resume(process)

		return
		--- END OF BLOCK #0 ---



	end()

	return
	--- END OF BLOCK #0 ---



end

function slot0.willExit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-18, warpins: 1 ---
	LeanTween.cancelAll(false)

	slot2 = slot0.layerProcess:Find("ship_right")

	if slot0.layerProcess:Find("ship_left").childCount > 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-39, warpins: 1 ---
		PoolMgr.GetInstance():ReturnSpineChar(Ship.New({
			id = 1,
			configId = Answer.Ship1
		}).getPrefab(slot3), slot1:GetChild(0).gameObject)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 40-43, warpins: 2 ---
	if slot2.childCount > 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 44-64, warpins: 1 ---
		PoolMgr.GetInstance():ReturnSpineChar(Ship.New({
			id = 2,
			configId = Answer.Ship2
		}).getPrefab(slot3), slot2:GetChild(0).gameObject)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 65-65, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

return slot0
