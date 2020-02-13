slot0 = class("HoloLiveLinkGameView", import("..BaseMiniGameView"))
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
slot0.NAME_TO_INDEX = {
	mio = 4,
	shion = 5,
	aqua = 2,
	fubuki = 0,
	Purifier = 8,
	Kawakaze = 7,
	matsuri = 1,
	sora = 6,
	ayame = 3
}

function slot0.getUIName(slot0)
	return "HoloLiveLinkGameUI"
end

function slot0.init(slot0)
	slot0:initData()
	slot0:findUI()
	slot0:addListener()
end

function slot0.didEnter(slot0)
	slot0.miniGameData = slot0:GetMGData()
	slot0.linkGameID = slot0.miniGameData:GetRuntimeData("curLinkGameID")
	slot0.bestScoreTable = slot0.miniGameData:GetRuntimeData("elements")

	if #slot0.bestScoreTable == 0 then
		slot0.bestScoreTable = {
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			0
		}

		slot0.miniGameData:SetRuntimeData("elements", slot0.bestScoreTable)
	end

	setText(slot0.bestTxt, slot0:FormatRecordTime(slot0.bestScoreTable[slot0.linkGameID]))
	slot0:SetState(slot0.GAME_STATE_BEGIN)
end

function slot0.OnSendMiniGameOPDone(slot0)
	return
end

function slot0.onBackPressed(slot0)
	triggerButton(slot0.backBtn)
end

function slot0.willExit(slot0)
	LeanTween.cancel(go(slot0.countDown))

	for slot4 = 0, slot0.layout.childCount - 1, 1 do
		LeanTween.cancel(go(slot0.layout:GetChild(slot4)))
	end

	if slot0.countTimer then
		slot0.countTimer:Stop()

		slot0.countTimer = nil
	end
end

function slot0.initData(slot0)
	return
end

function slot0.findUI(slot0)
	slot0.backBtn = slot0:findTF("ForNotchPanel/BackBtn")
	slot0.helpBtn = slot0:findTF("ForNotchPanel/HelpBtn")
	slot0.resetBtn = slot0:findTF("ResetBtn")
	slot0.timeTxt = slot0:findTF("ForNotchPanel/CurTime/Text")
	slot0.bestTxt = slot0:findTF("ForNotchPanel/BestTime/Text")
	slot0.layout = slot0:findTF("card_con/layout")
	slot0.item = slot0.layout:Find("card")
	slot0.bottom = slot0:findTF("card_con/bottom")
	slot0.line = slot0.bottom:Find("card")
	slot0.countDown = slot0:findTF("count_down")
	slot0.resource = slot0:findTF("resource")
	slot0.resultPanel = slot0:findTF("ResultPanel")
	slot0.resultPanelBG = slot0:findTF("BG", slot0.resultPanel)
	slot1 = slot0:findTF("Result", slot0.resultPanel)
	slot0.resultNewImg = slot0:findTF("NewImg", slot1)
	slot0.resultTimeText = slot0:findTF("TimeText", slot1)
	slot0.resultRestartBtn = slot0:findTF("RestartBtn", slot1)
end

function slot0.addListener(slot0)
	onButton(slot0, slot0.backBtn, function ()
		slot0:emit(slot1.ON_BACK)
	end, SOUND_BACK)
	onButton(slot0, slot0.helpBtn, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.hololive_lianliankan.tip
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.resultPanelBG, function ()
		slot0:showResultPanel(false)
		slot0.showResultPanel:emit(slot1.ON_BACK)
	end, SFX_CANCEL)
	onButton(slot0, slot0.resultRestartBtn, function ()
		slot0:showResultPanel(false)
		slot0.showResultPanel:SetState(slot1.GAME_STATE_BEGIN)
	end, SFX_PANEL)
end

function slot0.showResultPanel(slot0, slot1)
	if not slot1 then
		SetActive(slot0.resultPanel, false)

		return
	end

	setText(slot0.resultTimeText, slot0:FormatRecordTime(slot0.lastRecord))
	SetActive(slot0.resultPanel, true)
end

function slot0.playStory(slot0)
	if slot0.miniGameData:GetConfigCsvLine(slot0.linkGameID).story == "" then
		slot0:showResultPanel(true)
	elseif not pg.StoryMgr.GetInstance():IsPlayed(slot2[1]) then
		slot4:Play(slot3, function ()
			slot0:showResultPanel(true)
		end)
	end
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
	slot1 = slot0:setIconList()
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

				slot7 = GetComponent(slot2, typeof(Animator))
				slot7.enabled = true

				slot7:SetBool("AniSwitch", false)
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
	setText(slot0.timeTxt, slot0:FormatRecordTime(0))
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
		--- BLOCK #1 8-68, warpins: 0 ---
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
			--- BLOCK #3 68-68, warpins: 3 ---
			--- END OF BLOCK #3 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 69-69, warpins: 1 ---
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
									--- BLOCK #0 92-146, warpins: 1 ---
									slot2.state = slot1.CARD_STATE_LINKED
									slot3.state = slot1.CARD_STATE_LINKED

									setActive(slot1.CARD_STATE_LINKED:Find("display/selected"), true)
									slot7(slot3)

									slot6 = true
									slot8 = GetComponent(slot4, "DftAniEvent")

									GetComponent(slot4, typeof(Animator)).SetBool(slot6, "AniSwitch", true)
									GetComponent(slot5, typeof(Animator)).SetBool(slot7, "AniSwitch", true)
									GetComponent(slot5, "DftAniEvent"):SetEndEvent(function (slot0)

										-- Decompilation error in this vicinity:
										--- BLOCK #0 1-13, warpins: 1 ---
										slot0(slot1)

										slot2 = false
										slot3 = nil
										slot4 = nil
										slot1 = true

										--- END OF BLOCK #0 ---

										FLOW; TARGET BLOCK #1



										-- Decompilation error in this vicinity:
										--- BLOCK #1 14-32, warpins: 0 ---
										for slot5 = 0, slot5.MAX_ROW - 1, 1 do

											-- Decompilation error in this vicinity:
											--- BLOCK #0 14-19, warpins: 2 ---
											--- END OF BLOCK #0 ---

											FLOW; TARGET BLOCK #1



											-- Decompilation error in this vicinity:
											--- BLOCK #1 20-31, warpins: 0 ---
											for slot9 = 0, slot5.MAX_COLUMN - 1, 1 do

												-- Decompilation error in this vicinity:
												--- BLOCK #0 20-28, warpins: 2 ---
												if slot6.cards[slot5][slot9].state == slot5.CARD_STATE_NORMAL then

													-- Decompilation error in this vicinity:
													--- BLOCK #0 29-30, warpins: 1 ---
													slot1 = false

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
											--- END OF BLOCK #2 ---



										end

										--- END OF BLOCK #1 ---

										FLOW; TARGET BLOCK #2



										-- Decompilation error in this vicinity:
										--- BLOCK #2 33-34, warpins: 1 ---
										if slot1 then

											-- Decompilation error in this vicinity:
											--- BLOCK #0 35-40, warpins: 1 ---
											slot6:SetState(slot5.GAME_STATE_END)
											--- END OF BLOCK #0 ---



										end

										--- END OF BLOCK #2 ---

										FLOW; TARGET BLOCK #3



										-- Decompilation error in this vicinity:
										--- BLOCK #3 41-41, warpins: 2 ---
										return
										--- END OF BLOCK #3 ---



									end)
									--- END OF BLOCK #0 ---



								end
								--- END OF BLOCK #0 ---

								FLOW; TARGET BLOCK #1



								-- Decompilation error in this vicinity:
								--- BLOCK #1 147-147, warpins: 2 ---
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
			--- BLOCK #1 148-148, warpins: 6 ---
			return
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 149-149, warpins: 2 ---
			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 150-150, warpins: 2 ---
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
		--- BLOCK #0 1-26, warpins: 1 ---
		slot0.lastRecord = math.floor((Time.realtimeSinceStartup - slot0.startTime) * 1000)
		slot0 = math.floor(slot0.lastRecord)

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
	--- BLOCK #0 1-11, warpins: 1 ---
	slot0.countTimer:Stop()

	slot0.countTimer = nil

	if slot0.bestScoreTable[slot0.linkGameID] == 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-18, warpins: 1 ---
		pg.m02:sendNotification(GAME.SEND_MINI_GAME_OP, {
			hubid = slot0.miniGameData:getConfig("hub_id"),
			cmd = MiniGameOPCommand.CMD_COMPLETE,
			args1 = {
				(slot0.linkGameID == #pg.activity_event_linkgame.all and 0) or 1,
				slot0.linkGameID
			}
		})

		slot0.bestScoreTable[slot0.linkGameID] = slot0.lastRecord

		setText(slot0.bestTxt, slot0:FormatRecordTime(slot0.bestScoreTable[slot0.linkGameID]))
		SetActive(slot0.resultNewImg, true)
		slot0:StoreDataToServer(slot0.bestScoreTable)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 22-65, warpins: 2 ---
		--- END OF BLOCK #1 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 66-71, warpins: 1 ---
		if slot0.lastRecord < slot0.bestScoreTable[slot0.linkGameID] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 72-97, warpins: 1 ---
			slot0.bestScoreTable[slot0.linkGameID] = slot0.lastRecord

			setText(slot0.bestTxt, slot0:FormatRecordTime(slot0.bestScoreTable[slot0.linkGameID]))
			SetActive(slot0.resultNewImg, true)
			slot0:StoreDataToServer(slot0.bestScoreTable)
			slot0:showResultPanel(true)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 98-105, warpins: 1 ---
			SetActive(slot0.resultNewImg, false)
			slot0:showResultPanel(true)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 106-106, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



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
	--- BLOCK #1 5-32, warpins: 0 ---
	for slot8 = 1, #slot3, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-15, warpins: 2 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 16-31, warpins: 0 ---
		for slot13, slot14 in ipairs(slot9) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-19, warpins: 1 ---
			if slot14.row == slot1.row and slot14.column == slot1.column then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 24-24, warpins: 1 ---
				return slot14
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 25-29, warpins: 2 ---
			table.insert(slot3, slot14)
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 30-31, warpins: 2 ---
			--- END OF BLOCK #2 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 32-32, warpins: 1 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 33-39, warpins: 1 ---
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
	--- BLOCK #3 40-40, warpins: 2 ---
	--- END OF BLOCK #3 ---



end

function slot0.FindDirectLinkPoint(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot5 = {}

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-63, warpins: 0 ---
	for slot9 = slot2.row - 1, 0, -1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-19, warpins: 2 ---
		slot10 = slot9 .. "_" .. slot2.column

		if slot0.cards[slot9][slot2.column].state == slot0.CARD_STATE_NORMAL and slot11.id == slot1 and slot9 == slot4.row and slot2.column == slot4.column then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 30-39, warpins: 1 ---
			table.insert(slot5, {
				row = slot9,
				column = slot2.column,
				from = slot2
			})

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 40-40, warpins: 1 ---
			break

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 40-40, warpins: 0 ---
			if false then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 41-41, warpins: 0 ---
				break
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 42-46, warpins: 3 ---
			if (slot11.state == slot0.CARD_STATE_NORMAL and slot11.id ~= slot1) or slot3[slot10] then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 53-53, warpins: 1 ---
				break
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #3 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 54-63, warpins: 1 ---
		table.insert(slot5, {
			row = slot9,
			column = slot2.column,
			from = slot2
		})
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 64-70, warpins: 7 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 71-127, warpins: 0 ---
	for slot9 = slot2.row + 1, slot0.MAX_ROW - 1, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 71-83, warpins: 2 ---
		slot10 = slot9 .. "_" .. slot2.column

		if slot0.cards[slot9][slot2.column].state == slot0.CARD_STATE_NORMAL and slot11.id == slot1 and slot9 == slot4.row and slot2.column == slot4.column then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 94-103, warpins: 1 ---
			table.insert(slot5, {
				row = slot9,
				column = slot2.column,
				from = slot2
			})

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 104-104, warpins: 1 ---
			break

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 104-104, warpins: 0 ---
			if false then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 105-105, warpins: 0 ---
				break
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 106-110, warpins: 3 ---
			if (slot11.state == slot0.CARD_STATE_NORMAL and slot11.id ~= slot1) or slot3[slot10] then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 117-117, warpins: 1 ---
				break
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #3 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 118-127, warpins: 1 ---
		table.insert(slot5, {
			row = slot9,
			column = slot2.column,
			from = slot2
		})
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 128-132, warpins: 7 ---
	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 133-189, warpins: 0 ---
	for slot9 = slot2.column - 1, 0, -1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 133-145, warpins: 2 ---
		slot10 = slot2.row .. "_" .. slot9

		if slot0.cards[slot2.row][slot9].state == slot0.CARD_STATE_NORMAL and slot11.id == slot1 and slot2.row == slot4.row and slot9 == slot4.column then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 156-165, warpins: 1 ---
			table.insert(slot5, {
				row = slot2.row,
				column = slot9,
				from = slot2
			})

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 166-166, warpins: 1 ---
			break

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 166-166, warpins: 0 ---
			if false then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 167-167, warpins: 0 ---
				break
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 168-172, warpins: 3 ---
			if (slot11.state == slot0.CARD_STATE_NORMAL and slot11.id ~= slot1) or slot3[slot10] then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 179-179, warpins: 1 ---
				break
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #3 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 180-189, warpins: 1 ---
		table.insert(slot5, {
			row = slot2.row,
			column = slot9,
			from = slot2
		})
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 190-196, warpins: 7 ---
	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 197-253, warpins: 0 ---
	for slot9 = slot2.column + 1, slot0.MAX_COLUMN - 1, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 197-209, warpins: 2 ---
		slot10 = slot2.row .. "_" .. slot9

		if slot0.cards[slot2.row][slot9].state == slot0.CARD_STATE_NORMAL and slot11.id == slot1 and slot2.row == slot4.row and slot9 == slot4.column then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 220-229, warpins: 1 ---
			table.insert(slot5, {
				row = slot2.row,
				column = slot9,
				from = slot2
			})

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 230-230, warpins: 1 ---
			break

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 230-230, warpins: 0 ---
			if false then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 231-231, warpins: 0 ---
				break
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 232-236, warpins: 3 ---
			if (slot11.state == slot0.CARD_STATE_NORMAL and slot11.id ~= slot1) or slot3[slot10] then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 243-243, warpins: 1 ---
				break
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #3 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 244-253, warpins: 1 ---
		table.insert(slot5, {
			row = slot2.row,
			column = slot9,
			from = slot2
		})
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 254-254, warpins: 7 ---
	return slot5
	--- END OF BLOCK #8 ---



end

function slot0.setIconList(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-23, warpins: 1 ---
	slot1 = {}
	slot2 = slot0:GetMGData()

	print("当前地图ID", tostring(slot3))

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 24-43, warpins: 0 ---
	for slot9, slot10 in ipairs(slot5) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 24-28, warpins: 1 ---
		slot11 = slot10[1]

		if slot10[2] % 2 ~= 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 29-29, warpins: 1 ---
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 29-35, warpins: 2 ---
		slot13 = slot0.NAME_TO_INDEX[slot11]

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 36-41, warpins: 0 ---
		for slot17 = 1, slot12, 1 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 36-41, warpins: 2 ---
			table.insert(slot1, slot13)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 42-43, warpins: 2 ---
		--- END OF BLOCK #3 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 44-46, warpins: 1 ---
	if #slot1 ~= 36 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 47-47, warpins: 1 ---
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 47-47, warpins: 2 ---
	return slot1
	--- END OF BLOCK #3 ---



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

return slot0
