slot0 = class("LinkLinkScene", import("..base.BaseUI"))
slot0.MAX_ROW = 6
slot0.MAX_COLUMN = 11
slot0.COUNT_DOWN = 3
slot0.RESET_CD = 5
slot0.GAME_STATE_BEGIN = 0
slot0.GAME_STATE_GAMING = 1
slot0.GAME_STATE_END = 2
slot0.CARD_STATE_NORMAL = 0
slot0.CARD_STATE_LINKED = 1
slot0.CARD_STATE_BLANK = 2

function slot0.getUIName(slot0)
	return "LinkLinkUI"
end

function slot0.init(slot0)
	slot0.backBtn = slot0:findTF("BackBtn")
	slot0.helpBtn = slot0:findTF("top/help_btn")
	slot0.resetBtn = slot0:findTF("info/reset_button")
	slot0.awardTxt = slot0:findTF("info/award_txt")
	slot0.timeTxt = slot0:findTF("info/time_txt")
	slot0.bestTxt = slot0:findTF("info/best_txt")
	slot0.layout = slot0:findTF("card_con/layout")
	slot0.item = slot0.layout:Find("card")
	slot0.bottom = slot0:findTF("card_con/bottom")
	slot0.line = slot0.bottom:Find("card")
	slot0.result = slot0:findTF("result")
	slot0.countDown = slot0:findTF("count_down")
	slot0.resource = slot0:findTF("resource")
	slot0.bestTitleText = slot0:findTF("info/BestTitle")
	slot0.curTitleText = slot0:findTF("info/CurTitle")

	setText(slot0.bestTitleText, i18n("LinkLinkGame_BestTime"))
	setText(slot0.curTitleText, i18n("LinkLinkGame_CurTime"))
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.backBtn, function ()
		slot0:emit(slot1.ON_BACK)
	end, SOUND_BACK)
	slot0:SetState(slot0.GAME_STATE_BEGIN)
end

function slot0.willExit(slot0)
	slot0:HideResult()
	LeanTween.cancel(go(slot0.countDown))

	for slot4 = 0, slot0.layout.childCount - 1, 1 do
		LeanTween.cancel(go(slot0.layout:GetChild(slot4)))
	end

	if slot0.countTimer then
		slot0.countTimer:Stop()

		slot0.countTimer = nil
	end
end

function slot0.SetPlayer(slot0, slot1)
	slot0.player = slot1
end

function slot0.SetActivity(slot0, slot1)
	slot0.activity = slot1
	slot0.activityAchieved = slot1.data1
	slot0.activityProgress = slot1.data2
	slot0.activityStartTime = slot1.data3
	slot0.activityBestRecord = slot1.data4
	slot3 = pg.TimeMgr.GetInstance()
	slot0.activityRestTimes = (slot3:DiffDay(slot0.activityStartTime, slot3:GetServerTime()) + 1) - slot0.activityProgress
	slot0.activityRestTimes = math.clamp(slot0.activityRestTimes, 0, #slot0.activity:getConfig("config_client")[3] - slot0.activityProgress)

	setText(slot0.awardTxt, (slot0.activityRestTimes > 0 and slot2[slot0.activityProgress + 1]) or 0)
	setText(slot0.bestTxt, slot0:FormatRecordTime(slot0.activityBestRecord))
end

function slot0.SetState(slot0, slot1)
	if slot0.state ~= slot1 then
		slot0.state = slot1

		if slot1 == slot0.GAME_STATE_BEGIN then
			slot0:GameBegin()
		elseif slot1 == slot0.GAME_STATE_GAMING then
			slot0:GameLoop()
		elseif slot1 == slot0.GAME_STATE_END then
			slot0:GameEnd()
		end
	end
end

function slot0.GameBegin(slot0)
	slot0.cards = {}
	slot1 = {}

	for slot5 = 0, 17, 1 do
		table.insert(slot1, slot5)
		table.insert(slot1, slot5)
	end

	slot2 = 0

	while #slot1 > 0 do
		slot0.cards[slot4] = slot0.cards[math.floor(slot2 / (slot0.MAX_COLUMN - 2)) + 1] or {}
		slot0.cards[slot4][slot2 % (slot0.MAX_COLUMN - 2) + 1] = {
			row = slot4,
			column = slot2 % (slot0.MAX_COLUMN - 2) + 1,
			id = slot1[math.clamp(math.floor(math.random() * #slot1 + 1), 1, #slot1)],
			state = slot0.CARD_STATE_NORMAL
		}

		table.remove(slot1, math.clamp(math.floor(math.random() * #slot1 + 1), 1, #slot1))

		slot2 = slot2 + 1
	end

	for slot6 = 0, slot0.MAX_ROW - 1, 1 do
		for slot10 = 0, slot0.MAX_COLUMN - 1, 1 do
			slot0.cards[slot6] = slot0.cards[slot6] or {}
			slot0.cards[slot6][slot10] = slot0.cards[slot6][slot10] or {
				row = slot6,
				column = slot10,
				state = slot0.CARD_STATE_BLANK
			}
		end
	end

	slot0.list = UIItemList.New(slot0.layout, slot0.item)

	slot0.list:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot2.name = slot3 .. "_" .. slot4
			slot2.localScale = Vector3.one

			setActive(slot2:Find("display"), slot1.cards[math.floor(slot1 / slot0.MAX_COLUMN)][slot1 % slot0.MAX_COLUMN].state == slot0.CARD_STATE_NORMAL)

			if slot5.state == slot0.CARD_STATE_NORMAL then
				setImageSprite(slot2:Find("display/icon"), slot6)
				setActive(slot2:Find("display/selected"), false)
			end
		end
	end)
	slot0.list:align(slot0.MAX_ROW * slot0.MAX_COLUMN)

	slot0.llist = UIItemList.New(slot0.bottom, slot0.line)

	slot0.llist:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			for slot7 = 0, slot2:Find("lines").childCount - 1, 1 do
				setActive(slot3:GetChild(slot7), false)
			end
		end
	end)
	slot0.llist:align(slot0.MAX_ROW * slot0.MAX_COLUMN)
	setActive(slot0.countDown, true)

	for slot6 = 0, slot0.countDown.childCount - 1, 1 do
		setActive(slot0.countDown:GetChild(slot6), false)
	end

	setActive(slot4, true)
	setImageAlpha(slot4, 0)
	LeanTween.value(go(slot0.countDown), 0, 1, 1):setOnUpdate(System.Action_float(function (slot0)
		setImageAlpha(slot0, slot0)
		setLocalScale(math.min(slot0 / 0.3, 1), {
			x = (1 - math.min(slot0 / 0.3, 1)) * 2 + 1,
			y = (1 - math.min(slot0 / 0.3, 1)) * 2 + 1
		})
	end)):setOnComplete(System.Action(function ()
		setActive(setActive, false)

		if slot1 + 1 < slot2.countDown.childCount then
			slot0 = slot2.countDown:GetChild(slot2.countDown)

			setActive(setActive, true)
			setImageAlpha(setImageAlpha, 0)
		else
			setActive(slot2.countDown, false)
			slot2:SetState(slot3.GAME_STATE_GAMING)
		end
	end)):setRepeat(4):setLoopType(LeanTweenType.punch):setOnCompleteOnRepeat(true):setEase(LeanTweenType.easeOutSine)
end

function slot0.GameLoop(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	function slot1(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		slot1 = 0
		slot2 = 0

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-167, warpins: 0 ---
		for slot6 = 1, #slot0 - 1, 1 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-36, warpins: 2 ---
			slot9 = slot0[slot6 + 1].row - slot0[slot6].row
			slot10 = slot0[slot6 + 1].column - slot0[slot6].column

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 37-44, warpins: 0 ---
			for slot15 = 0, slot0.bottom:GetChild(slot0[slot6].row * slot1.MAX_COLUMN + slot0[slot6].column):Find("lines").childCount - 1, 1 do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 37-44, warpins: 2 ---
				setActive(slot11:GetChild(slot15), false)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 45-46, warpins: 1 ---
			if slot9 ~= 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 47-56, warpins: 1 ---
				setActive(slot11:Find("y" .. slot9), true)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 57-58, warpins: 1 ---
				if slot10 ~= 0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 59-67, warpins: 1 ---
					setActive(slot11:Find("x" .. slot10), true)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 68-69, warpins: 3 ---
			if slot9 ~= slot1 and slot10 ~= slot2 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 72-74, warpins: 1 ---
				slot12 = 0

				setActive(slot13, true)

				slot11:Find("joint").localEulerAngles = Vector3(0, 0, (((slot9 == -1 and slot2 == 1) or (slot1 == 1 and slot10 == -1)) and 0) or (((slot10 == -1 and slot1 == -1) or (slot9 == 1 and slot2 == 1)) and 90) or (((slot9 == 1 and slot2 == -1) or (slot1 == -1 and slot10 == 1)) and 180) or 270)
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 104-118, warpins: 4 ---
				--- END OF BLOCK #1 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 119-120, warpins: 2 ---
				if (slot1 == 0 and slot9 ~= 0) or (slot1 ~= 0 and slot9 == slot1) then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 127-141, warpins: 2 ---
					setActive(slot12, true)

					slot11:Find("cross").localEulerAngles = Vector3(0, 0, 90)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 142-143, warpins: 2 ---
					if (slot2 == 0 and slot10 ~= 0) or (slot2 ~= 0 and slot10 == slot2) then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 150-163, warpins: 2 ---
						setActive(slot12, true)

						slot11:Find("cross").localEulerAngles = Vector3(0, 0, 0)
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #3 ---

			FLOW; TARGET BLOCK #4



			-- Decompilation error in this vicinity:
			--- BLOCK #4 164-167, warpins: 5 ---
			slot2 = slot10
			slot1 = slot9
			--- END OF BLOCK #4 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 168-168, warpins: 1 ---
		return
		--- END OF BLOCK #2 ---



	end

	function slot2(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 6-36, warpins: 0 ---
		for slot4 = 1, #slot0 - 1, 1 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-27, warpins: 2 ---
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 28-35, warpins: 0 ---
			for slot11 = 0, slot1.bottom:GetChild(slot6):Find("lines").childCount - 1, 1 do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 28-35, warpins: 2 ---
				setActive(slot7:GetChild(slot11), false)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 36-36, warpins: 1 ---
			--- END OF BLOCK #2 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 37-37, warpins: 1 ---
		return
		--- END OF BLOCK #2 ---



	end

	slot3, slot4, slot5 = nil

	slot0.list:each(function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-11, warpins: 1 ---
		onButton(slot0, slot1:Find("display/icon"), function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-20, warpins: 1 ---
			if slot1.MAX_COLUMN.cards[math.floor(slot0 / slot1.MAX_COLUMN)][slot0 % slot1.MAX_COLUMN].state ~= slot1.CARD_STATE_NORMAL then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 21-21, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 22-22, warpins: 0 ---
				--- END OF BLOCK #1 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 23-25, warpins: 1 ---
				if not slot3 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 26-37, warpins: 1 ---
					slot3 = slot2
					slot4 = slot5

					setActive(slot5:Find("display/selected"), true)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 38-40, warpins: 1 ---
					if slot6 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 41-41, warpins: 1 ---
						return
						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 42-42, warpins: 0 ---
						--- END OF BLOCK #1 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 43-45, warpins: 1 ---
						if slot3 == slot2 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 46-56, warpins: 1 ---
							setActive(slot5:Find("display/selected"), false)

							slot4 = nil
							slot3 = nil
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 57-61, warpins: 1 ---
							if slot3.id ~= slot2.id then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 62-72, warpins: 1 ---
								setActive(slot4:Find("display/selected"), false)

								slot4 = nil
								slot3 = nil
								--- END OF BLOCK #0 ---



							else

								-- Decompilation error in this vicinity:
								--- BLOCK #0 73-80, warpins: 1 ---
								if not slot2:LinkLink(slot2.LinkLink, slot2) then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 81-91, warpins: 1 ---
									setActive(slot4:Find("display/selected"), false)

									slot4 = nil
									slot3 = nil
									--- END OF BLOCK #0 ---



								else

									-- Decompilation error in this vicinity:
									--- BLOCK #0 92-149, warpins: 1 ---
									slot2.state = slot1.CARD_STATE_LINKED
									slot3.state = slot1.CARD_STATE_LINKED

									setActive(slot1.CARD_STATE_LINKED:Find("display/selected"), true)
									slot7(slot3)

									slot6 = true
									slot5 = slot3

									LeanTween.value(go(slot4), 1, 0.15, 0.3):setEase(LeanTweenType.easeInBack):setOnUpdate(System.Action_float(function (slot0)

										-- Decompilation error in this vicinity:
										--- BLOCK #0 1-15, warpins: 1 ---
										slot0.localScale = Vector3(slot0, slot0, 1)
										slot0.localScale = Vector3(slot0, slot0, 1)

										return
										--- END OF BLOCK #0 ---



									end)):setOnComplete(System.Action(function ()

										-- Decompilation error in this vicinity:
										--- BLOCK #0 1-21, warpins: 1 ---
										slot0(slot1)
										setActive(slot2:Find("display"), false)
										setActive(slot3:Find("display"), false)

										slot4 = false

										return
										--- END OF BLOCK #0 ---



									end))

									slot4 = nil
									slot3 = nil
									slot6 = true

									--- END OF BLOCK #0 ---

									FLOW; TARGET BLOCK #1



									-- Decompilation error in this vicinity:
									--- BLOCK #1 150-168, warpins: 0 ---
									for slot10 = 0, slot1.MAX_ROW - 1, 1 do

										-- Decompilation error in this vicinity:
										--- BLOCK #0 150-155, warpins: 2 ---
										--- END OF BLOCK #0 ---

										FLOW; TARGET BLOCK #1



										-- Decompilation error in this vicinity:
										--- BLOCK #1 156-167, warpins: 0 ---
										for slot14 = 0, slot1.MAX_COLUMN - 1, 1 do

											-- Decompilation error in this vicinity:
											--- BLOCK #0 156-164, warpins: 2 ---
											if slot2.cards[slot10][slot14].state == slot1.CARD_STATE_NORMAL then

												-- Decompilation error in this vicinity:
												--- BLOCK #0 165-166, warpins: 1 ---
												slot6 = false

												--- END OF BLOCK #0 ---

												FLOW; TARGET BLOCK #1



												-- Decompilation error in this vicinity:
												--- BLOCK #1 167-167, warpins: 1 ---
												break
												--- END OF BLOCK #1 ---



											end
											--- END OF BLOCK #0 ---

											FLOW; TARGET BLOCK #1



											-- Decompilation error in this vicinity:
											--- BLOCK #1 167-167, warpins: 1 ---
											--- END OF BLOCK #1 ---



										end
										--- END OF BLOCK #1 ---

										FLOW; TARGET BLOCK #2



										-- Decompilation error in this vicinity:
										--- BLOCK #2 168-168, warpins: 2 ---
										--- END OF BLOCK #2 ---



									end

									--- END OF BLOCK #1 ---

									FLOW; TARGET BLOCK #2



									-- Decompilation error in this vicinity:
									--- BLOCK #2 169-170, warpins: 1 ---
									if slot6 then

										-- Decompilation error in this vicinity:
										--- BLOCK #0 171-176, warpins: 1 ---
										slot2:SetState(slot1.GAME_STATE_END)
										--- END OF BLOCK #0 ---



									end
									--- END OF BLOCK #2 ---

									FLOW; TARGET BLOCK #3



									-- Decompilation error in this vicinity:
									--- BLOCK #3 177-177, warpins: 2 ---
									--- END OF BLOCK #3 ---



								end
								--- END OF BLOCK #0 ---

								FLOW; TARGET BLOCK #1



								-- Decompilation error in this vicinity:
								--- BLOCK #1 178-178, warpins: 2 ---
								--- END OF BLOCK #1 ---



							end
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 179-179, warpins: 6 ---
			return
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 180-180, warpins: 2 ---
			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 181-181, warpins: 2 ---
			--- END OF BLOCK #3 ---



		end, SFX_PANEL)

		return
		--- END OF BLOCK #0 ---



	end)

	if Application.isEditor and AUTO_LINKLINK then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-24, warpins: 1 ---
		setActive(slot0.helpBtn, true)
		onButton(slot0, slot0.helpBtn, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-8, warpins: 1 ---
			slot0 = nil
			slot1 = nil

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 9-101, warpins: 0 ---
			for slot3 = 0, slot2.MAX_ROW - 1, 1 do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 9-14, warpins: 2 ---
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 15-100, warpins: 0 ---
				for slot7 = 0, slot2.MAX_COLUMN - 1, 1 do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 15-35, warpins: 2 ---
					slot10 = slot3.layout:GetChild(slot9)

					if slot3.cards[slot3][slot7].state == slot2.CARD_STATE_NORMAL then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 36-41, warpins: 1 ---
						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 42-99, warpins: 0 ---
						for slot14 = 0, slot2.MAX_ROW - 1, 1 do

							-- Decompilation error in this vicinity:
							--- BLOCK #0 42-47, warpins: 2 ---
							--- END OF BLOCK #0 ---

							FLOW; TARGET BLOCK #1



							-- Decompilation error in this vicinity:
							--- BLOCK #1 48-98, warpins: 0 ---
							for slot18 = 0, slot2.MAX_COLUMN - 1, 1 do

								-- Decompilation error in this vicinity:
								--- BLOCK #0 48-49, warpins: 2 ---
								if slot3 ~= slot14 or slot7 ~= slot18 then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 52-71, warpins: 2 ---
									slot21 = slot3.layout:GetChild(slot20)

									if slot8.id == slot3.cards[slot14][slot18].id then

										-- Decompilation error in this vicinity:
										--- BLOCK #0 72-86, warpins: 1 ---
										triggerButton(slot10:Find("display/icon"))
										triggerButton(slot21:Find("display/icon"))

										if slot4 then

											-- Decompilation error in this vicinity:
											--- BLOCK #0 87-97, warpins: 1 ---
											Timer.New(function ()

												-- Decompilation error in this vicinity:
												--- BLOCK #0 1-5, warpins: 1 ---
												triggerButton(slot0.helpBtn)

												return
												--- END OF BLOCK #0 ---



											end, 0.4, 1):Start()

											return
											--- END OF BLOCK #0 ---



										end
										--- END OF BLOCK #0 ---



									end
									--- END OF BLOCK #0 ---



								end
								--- END OF BLOCK #0 ---

								FLOW; TARGET BLOCK #1



								-- Decompilation error in this vicinity:
								--- BLOCK #1 98-98, warpins: 4 ---
								--- END OF BLOCK #1 ---



							end
							--- END OF BLOCK #1 ---

							FLOW; TARGET BLOCK #2



							-- Decompilation error in this vicinity:
							--- BLOCK #2 99-99, warpins: 1 ---
							--- END OF BLOCK #2 ---



						end
						--- END OF BLOCK #1 ---



					end
					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 100-100, warpins: 2 ---
					--- END OF BLOCK #1 ---



				end
				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 101-101, warpins: 1 ---
				--- END OF BLOCK #2 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 102-102, warpins: 1 ---
			return
			--- END OF BLOCK #2 ---



		end)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 25-50, warpins: 3 ---
	slot6 = 0

	onButton(slot0, slot0.resetBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		if slot0.state ~= slot1.GAME_STATE_GAMING then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-7, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 8-8, warpins: 0 ---
			--- END OF BLOCK #1 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-16, warpins: 1 ---
			if Time.realtimeSinceStartup - slot2 < slot2.RESET_CD then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 17-27, warpins: 1 ---
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_wait"))
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 28-30, warpins: 1 ---
				if slot3 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 31-40, warpins: 1 ---
					setActive(slot4:Find("display/selected"), false)

					slot4 = nil
					slot3 = nil
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 41-48, warpins: 2 ---
				slot0 = {}

				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 49-77, warpins: 0 ---
				for slot5 = 0, slot1.MAX_ROW - 1, 1 do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 49-54, warpins: 2 ---
					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 55-76, warpins: 0 ---
					for slot9 = 0, slot1.MAX_COLUMN - 1, 1 do

						-- Decompilation error in this vicinity:
						--- BLOCK #0 55-63, warpins: 2 ---
						if slot0.cards[slot5][slot9].state == slot1.CARD_STATE_NORMAL then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 64-75, warpins: 1 ---
							table.insert(slot0, {
								row = slot5,
								column = slot9
							})
							table.insert(slot1, slot10.id)
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 76-76, warpins: 2 ---
						--- END OF BLOCK #1 ---



					end
					--- END OF BLOCK #1 ---

					FLOW; TARGET BLOCK #2



					-- Decompilation error in this vicinity:
					--- BLOCK #2 77-77, warpins: 1 ---
					--- END OF BLOCK #2 ---



				end

				--- END OF BLOCK #2 ---

				FLOW; TARGET BLOCK #3



				-- Decompilation error in this vicinity:
				--- BLOCK #3 78-78, warpins: 1 ---
				slot2 = 1

				--- END OF BLOCK #3 ---

				FLOW; TARGET BLOCK #4



				-- Decompilation error in this vicinity:
				--- BLOCK #4 79-82, warpins: 2 ---
				--- END OF BLOCK #4 ---

				FLOW; TARGET BLOCK #5



				-- Decompilation error in this vicinity:
				--- BLOCK #5 83-115, warpins: 0 ---
				while #slot1 > 0 do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 83-83, warpins: 1 ---
					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 84-114, warpins: 1 ---
					slot0.cards[slot0[slot2].row][slot0[slot2].column].id = slot1[math.clamp(math.floor(math.random() * #slot1 + 1), 1, #slot1)]

					table.remove(slot1, math.clamp(math.floor(math.random() * #slot1 + 1), 1, #slot1))

					slot2 = slot2 + 1
					--- END OF BLOCK #1 ---

					FLOW; TARGET BLOCK #2



					-- Decompilation error in this vicinity:
					--- BLOCK #2 115-115, warpins: 1 ---
					--- END OF BLOCK #2 ---



				end

				--- END OF BLOCK #5 ---

				FLOW; TARGET BLOCK #6



				-- Decompilation error in this vicinity:
				--- BLOCK #6 115-123, warpins: 1 ---
				slot0.list:each(function (slot0, slot1)

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-18, warpins: 1 ---
					if slot1.cards[math.floor(slot0 / slot0.MAX_COLUMN)][slot0 % slot0.MAX_COLUMN].state == slot0.CARD_STATE_NORMAL then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 19-33, warpins: 1 ---
						setImageSprite(slot1:Find("display/icon"), getImageSprite(slot1.resource:GetChild(slot4.id)))
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 34-34, warpins: 2 ---
					return
					--- END OF BLOCK #1 ---



				end)

				slot2 = Time.realtimeSinceStartup
				--- END OF BLOCK #6 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 124-124, warpins: 3 ---
		return
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 125-125, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end, SFX_PANEL)

	slot0.startTime = Time.realtimeSinceStartup
	slot0.countTimer = Timer.New(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-19, warpins: 1 ---
		slot0 = math.floor((Time.realtimeSinceStartup - slot0.startTime) * 1000)

		setText(slot0.timeTxt, slot0:FormatRecordTime(slot0))

		return
		--- END OF BLOCK #0 ---



	end, 0.033, -1)

	slot0.countTimer:Start()
	slot0.countTimer.func()

	return
	--- END OF BLOCK #1 ---



end

function slot0.GameEnd(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-19, warpins: 1 ---
	slot0.countTimer:Stop()

	slot0.countTimer = nil
	slot0.lastRecord = math.floor((Time.realtimeSinceStartup - slot0.startTime) * 1000)

	if slot0.activityRestTimes > 0 or slot0.lastRecord < slot0.activityBestRecord then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 24-28, warpins: 2 ---
		slot0:emit(LinkLinkMediator.EVENT_OPERATION, {
			cmd = 1,
			activity_id = slot0.activity.id,
			arg1 = slot0.activityProgress + ((slot0.activityRestTimes > 0 and 1) or 0),
			arg2 = slot0.lastRecord
		})
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 32-45, warpins: 2 ---
		--- END OF BLOCK #1 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 46-49, warpins: 1 ---
		slot0:DisplayResult(slot0.activity)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 50-50, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.DisplayResult(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-18, warpins: 1 ---
	setActive(slot0.result, true)
	setActive(slot0.result:Find("bg").Find(slot2, "pic_new_record"), slot1.data4 < slot0.activityBestRecord)
	setActive(slot2:Find("pic_win"), slot0.activityBestRecord <= slot1.data4)
	setText(slot2:Find("time_txt"), slot0:FormatRecordTime(slot0.lastRecord))
	setText(slot2:Find("award_txt"), (slot0.activityProgress < slot1.data2 and slot1:getConfig("config_client")[3][slot1.data2]) or 0)
	onButton(slot0, slot2:Find("button"), function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-16, warpins: 1 ---
		slot0:HideResult()
		slot0.HideResult:SetActivity(slot0.HideResult)
		slot0.HideResult.SetActivity:SetState(slot0.HideResult.GAME_STATE_BEGIN)

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onButton(slot0, slot0.result, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		triggerButton(slot0.backBtn)

		return
		--- END OF BLOCK #0 ---



	end, SFX_CANCEL)
	pg.UIMgr.GetInstance():BlurPanel(slot0.result)

	return
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 22-31, warpins: 2 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 35-59, warpins: 2 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 65-90, warpins: 2 ---
	--- END OF BLOCK #3 ---



end

function slot0.HideResult(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	if isActive(slot0.result) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-18, warpins: 1 ---
		setActive(slot0.result, false)
		pg.UIMgr.GetInstance():UnblurPanel(slot0.result, slot0._tf)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 19-19, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.FormatRecordTime(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	return ((math.floor(slot1 / 60000) >= 10 and slot2) or "0" .. slot2) .. "'" .. ((math.floor(slot1 % 60000 / 1000) >= 10 and slot3) or "0" .. slot3) .. "'" .. ((math.floor(slot1 % 1000 / 10) >= 10 and slot4) or "0" .. slot4)
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 13-20, warpins: 2 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 26-33, warpins: 2 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 39-45, warpins: 2 ---
	--- END OF BLOCK #3 ---



end

function slot0.LinkLink(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-26, warpins: 1 ---
	slot4 = {
		row = slot2.row,
		column = slot2.column
	}

	table.insert(slot5, slot3)
	table.insert(slot6, slot3)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 27-105, warpins: 0 ---
	for slot10 = 1, 3, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 27-35, warpins: 2 ---
		if slot0:IterateByOneSnap(slot4, slot1.id, slot5, slot6) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 36-37, warpins: 1 ---
			slot12 = {
				slot11
			}

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 38-39, warpins: 2 ---
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 43-104, warpins: 0 ---
			while slot11 and slot11.from do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 43-43, warpins: 1 ---
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 44-48, warpins: 1 ---
				if slot11.row ~= slot11.from.row then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 49-53, warpins: 1 ---
					slot13 = (slot11.from.row < slot11.row and -1) or 1

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 57-62, warpins: 2 ---
					--- END OF BLOCK #1 ---

					FLOW; TARGET BLOCK #2



					-- Decompilation error in this vicinity:
					--- BLOCK #2 63-71, warpins: 0 ---
					for slot17 = slot11.row + slot13, slot11.from.row, slot13 do

						-- Decompilation error in this vicinity:
						--- BLOCK #0 63-71, warpins: 2 ---
						table.insert(slot12, {
							row = slot17,
							column = slot11.column
						})
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #2 ---

					FLOW; TARGET BLOCK #3



					-- Decompilation error in this vicinity:
					--- BLOCK #3 72-72, warpins: 1 ---
					--- END OF BLOCK #3 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 73-77, warpins: 1 ---
					if slot11.from.column ~= slot11.column then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 78-82, warpins: 1 ---
						slot13 = (slot11.from.column < slot11.column and -1) or 1

						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 86-91, warpins: 2 ---
						--- END OF BLOCK #1 ---

						FLOW; TARGET BLOCK #2



						-- Decompilation error in this vicinity:
						--- BLOCK #2 92-100, warpins: 0 ---
						for slot17 = slot11.column + slot13, slot11.from.column, slot13 do

							-- Decompilation error in this vicinity:
							--- BLOCK #0 92-100, warpins: 2 ---
							table.insert(slot12, {
								row = slot11.row,
								column = slot17
							})
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #2 ---

						FLOW; TARGET BLOCK #3



						-- Decompilation error in this vicinity:
						--- BLOCK #3 101-101, warpins: 1 ---
						--- END OF BLOCK #3 ---



					end
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 102-103, warpins: 3 ---
				slot11 = slot11.from
				--- END OF BLOCK #2 ---

				FLOW; TARGET BLOCK #3



				-- Decompilation error in this vicinity:
				--- BLOCK #3 104-104, warpins: 3 ---
				--- END OF BLOCK #3 ---



			end

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 104-104, warpins: 2 ---
			return slot12
			--- END OF BLOCK #3 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 105-105, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 106-106, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

function slot0.IterateByOneSnap(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-31, warpins: 0 ---
	for slot8 = 1, #slot3, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-14, warpins: 2 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 15-30, warpins: 0 ---
		for slot13, slot14 in ipairs(slot9) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-18, warpins: 1 ---
			if slot14.row == slot1.row and slot14.column == slot1.column then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 23-23, warpins: 1 ---
				return slot14
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 24-28, warpins: 2 ---
			table.insert(slot3, slot14)
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 29-30, warpins: 2 ---
			--- END OF BLOCK #2 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 31-31, warpins: 1 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 32-38, warpins: 1 ---
	_.each(slot3, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		slot0[slot0.row .. "_" .. slot0.column] = true

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 39-39, warpins: 2 ---
	--- END OF BLOCK #3 ---



end

function slot0.FindDirectLinkPoint(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot4 = {}

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-36, warpins: 0 ---
	for slot8 = slot2.row - 1, 0, -1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-19, warpins: 2 ---
		slot9 = slot8 .. "_" .. slot2.column

		if (slot0.cards[slot8][slot2.column].state == slot0.CARD_STATE_NORMAL and slot10.id ~= slot1) or slot3[slot9] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 26-26, warpins: 1 ---
			break
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 27-36, warpins: 1 ---
		table.insert(slot4, {
			row = slot8,
			column = slot2.column,
			from = slot2
		})
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 37-43, warpins: 3 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 44-73, warpins: 0 ---
	for slot8 = slot2.row + 1, slot0.MAX_ROW - 1, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 44-56, warpins: 2 ---
		slot9 = slot8 .. "_" .. slot2.column

		if (slot0.cards[slot8][slot2.column].state == slot0.CARD_STATE_NORMAL and slot10.id ~= slot1) or slot3[slot9] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 63-63, warpins: 1 ---
			break
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 64-73, warpins: 1 ---
		table.insert(slot4, {
			row = slot8,
			column = slot2.column,
			from = slot2
		})
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 74-78, warpins: 3 ---
	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 79-108, warpins: 0 ---
	for slot8 = slot2.column - 1, 0, -1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 79-91, warpins: 2 ---
		slot9 = slot2.row .. "_" .. slot8

		if (slot0.cards[slot2.row][slot8].state == slot0.CARD_STATE_NORMAL and slot10.id ~= slot1) or slot3[slot9] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 98-98, warpins: 1 ---
			break
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 99-108, warpins: 1 ---
		table.insert(slot4, {
			row = slot2.row,
			column = slot8,
			from = slot2
		})
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 109-115, warpins: 3 ---
	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 116-145, warpins: 0 ---
	for slot8 = slot2.column + 1, slot0.MAX_COLUMN - 1, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 116-128, warpins: 2 ---
		slot9 = slot2.row .. "_" .. slot8

		if (slot0.cards[slot2.row][slot8].state == slot0.CARD_STATE_NORMAL and slot10.id ~= slot1) or slot3[slot9] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 135-135, warpins: 1 ---
			break
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 136-145, warpins: 1 ---
		table.insert(slot4, {
			row = slot2.row,
			column = slot8,
			from = slot2
		})
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 146-146, warpins: 3 ---
	return slot4
	--- END OF BLOCK #8 ---



end

function slot0.LinkLink1(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-27, warpins: 1 ---
	slot3 = nil
	slot4 = {
		[slot1.row .. "_" .. slot1.column] = {
			rdir = 0,
			cdir = 0,
			snap = 0,
			row = slot1.row,
			column = slot1.column,
			path = {}
		}
	}
	slot6 = {
		row = slot2.row,
		column = slot2.column
	}
	slot7 = {
		{
			row = slot1.row,
			column = slot1.column
		}
	}
	slot8 = {}

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 28-31, warpins: 2 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 32-73, warpins: 0 ---
	while #slot7 > 0 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 32-32, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 33-41, warpins: 1 ---
		if table.remove(slot7, 1).row == slot6.row and slot9.column == slot6.column then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 46-52, warpins: 1 ---
			return slot4[slot9.row .. "_" .. slot9.column].path
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 53-72, warpins: 2 ---
		table.insert(slot8, slot9)
		_.each({
			{
				row = 1,
				column = 0
			},
			{
				row = -1,
				column = 0
			},
			{
				row = 0,
				column = 1
			},
			{
				row = 0,
				column = -1
			}
		}, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-17, warpins: 1 ---
			slot0.row = slot0.row + slot0.row
			slot0.column = slot0.column + slot0.column
			slot1 = _.any(_.any, function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-5, warpins: 1 ---
				return slot0.row == slot0.row and slot0.column == slot0.column
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 14-14, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end) or _.any(slot2, function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-5, warpins: 1 ---
				return slot0.row == slot0.row and slot0.column == slot0.column
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 14-14, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end)
			slot2 = (slot3.cards[slot0.row] and slot3.cards[slot0.row][slot0.column]) or nil

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 23-28, warpins: 2 ---
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 38-39, warpins: 2 ---
			if not slot1 and (not slot2 or slot2.state == slot4.CARD_STATE_LINKED or slot2.state == slot4.CARD_STATE_BLANK or slot2.id == slot5.id) and slot0.row >= 0 and slot0.row < slot4.MAX_ROW and slot0.column >= 0 and slot0.column < slot4.MAX_COLUMN then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 75-94, warpins: 1 ---
				slot4 = slot6[slot0.row .. "_" .. slot0.column].snap
				slot5 = slot0.row - slot0.row
				slot6 = slot0.column - slot0.column

				if (slot6[slot0.row .. "_" .. slot0.column].rdir ~= 0 and slot3.rdir ~= slot5) or (slot3.cdir ~= 0 and slot3.cdir ~= slot6) then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 104-104, warpins: 2 ---
					slot4 = slot4 + 1
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 105-107, warpins: 3 ---
				if slot4 <= 2 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 108-136, warpins: 1 ---
					table.insert(slot7, slot0)

					slot6[slot0.row .. "_" .. slot0.column] = {
						row = slot0.row,
						column = slot0.column,
						snap = slot4,
						rdir = slot5,
						cdir = slot6,
						path = Clone(slot3.path)
					}
					slot8 = 0

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 137-158, warpins: 0 ---
					for slot12 = #slot1, 1, -1 do

						-- Decompilation error in this vicinity:
						--- BLOCK #0 137-147, warpins: 2 ---
						if slot6[slot1[slot12].row .. "_" .. slot1[slot12].column].snap < slot4 or (slot4 == slot14.snap and #slot7 > #slot14.path) then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 156-157, warpins: 2 ---
							slot8 = slot12

							--- END OF BLOCK #0 ---

							FLOW; TARGET BLOCK #1



							-- Decompilation error in this vicinity:
							--- BLOCK #1 158-158, warpins: 2 ---
							break
							--- END OF BLOCK #1 ---



						end
						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 158-158, warpins: 2 ---
						--- END OF BLOCK #1 ---



					end

					--- END OF BLOCK #1 ---

					FLOW; TARGET BLOCK #2



					-- Decompilation error in this vicinity:
					--- BLOCK #2 159-164, warpins: 2 ---
					table.insert(slot1, slot8 + 1, slot0)
					--- END OF BLOCK #2 ---



				end
				--- END OF BLOCK #1 ---



			end

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 165-166, warpins: 8 ---
			return
			--- END OF BLOCK #3 ---



		end)
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 73-73, warpins: 2 ---
		--- END OF BLOCK #3 ---



	end
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 73-74, warpins: 2 ---
	--- END OF BLOCK #3 ---



end

return slot0
