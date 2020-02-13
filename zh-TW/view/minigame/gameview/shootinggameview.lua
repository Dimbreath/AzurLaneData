slot0 = class("ShootingGameView", import("..BaseMiniGameView"))
slot0.animTime = 0.3333333333333333
slot0.moveModulus = 120

function slot0.getUIName(slot0)
	return "ShootingGameUI"
end

function slot0.init(slot0)
	slot0.uiMGR = pg.UIMgr.GetInstance()
	slot0.blurPanel = slot0._tf:Find("noAdaptPanel/blur_panel")
	slot0.top = slot0.blurPanel:Find("top")
	slot0.backBtn = slot0.top:Find("back")
	slot0.scoreTF = slot0.top:Find("score/Text")

	setText(slot0.scoreTF, 0)

	slot0.bestScoreTF = slot0.top:Find("score_heightest/Text")
	slot0.ticketTF = slot0.top:Find("ticket/Text")
	slot0.helpBtn = slot0.top:Find("help_btn")
	slot0.sightTF = slot0.blurPanel:Find("MoveArea/Sight")

	setActive(slot0.sightTF, false)

	slot0.corners = slot0.blurPanel:Find("Corners")
	slot0.shootAreaTF = slot0._tf:Find("noAdaptPanel/ShootArea")
	slot0.targetPanel = slot0.shootAreaTF:Find("target_panel")
	slot0.targetTpl = {}

	for slot5 = 1, slot0.shootAreaTF:Find("tpl").childCount, 1 do
		slot0.targetTpl[slot5] = slot1:GetChild(slot5 - 1)
	end

	setActive(slot1, false)

	slot0.startMaskTF = slot0.shootAreaTF:Find("start_mask")
	slot0.countdownTF = slot0.startMaskTF:Find("count")
	slot0.lastTimeTF = slot0.shootAreaTF:Find("time_word")
	slot0.bottomTF = slot0._tf:Find("noAdaptPanel/bottom")
	slot0.joyStrickTF = slot0.bottomTF:Find("Stick")
	slot0.fireBtn = slot0.bottomTF:Find("fire/ActCtl")
	slot0.fireBtnDelegate = GetOrAddComponent(slot0.fireBtn, "EventTriggerListener")

	setActive(slot0.fireBtn:Find("block"), false)

	slot0.resultPanel = slot0._tf:Find("result_panel")

	setActive(slot0.resultPanel, false)
end

function slot0.initData(slot0)
	slot0.tempConfig = slot0:GetMGData():getConfig("simple_config_data")
	slot0.tempConfig.waitCountdown = 3
	slot0.tempConfig.half = 56
end

function slot0.addTimer(slot0, slot1, slot2, slot3)
	slot0.timerList = slot0.timerList or {}
	slot0.timerList[slot1] = {
		timeMark = Time.realtimeSinceStartup + slot2,
		func = slot3
	}
end

function slot0.updateTimers(slot0)
	slot1 = Time.realtimeSinceStartup

	for slot5, slot6 in pairs(slot0.timerList) do
		if slot6.timeMark < slot1 then
			slot0.timerList[slot5] = nil

			slot6.func()
		end
	end
end

function slot0.stopTimers(slot0)
	slot0.isStopped = true
	slot1 = Time.realtimeSinceStartup

	for slot5, slot6 in pairs(slot0.timerList) do
		slot6.timeMark = slot6.timeMark - slot1
	end
end

function slot0.restartTimers(slot0)
	slot0.isStopped = false
	slot1 = Time.realtimeSinceStartup

	for slot5, slot6 in pairs(slot0.timerList) do
		slot6.timeMark = slot6.timeMark + slot1
	end
end

function slot0.clearTimers(slot0)
	slot0.timerList = {}
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.backBtn, function ()
		if slot0.isPlaying then
			slot0:stopTimers()
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("tips_summergame_exit"),
				onYes = function ()
					slot0:gameFinish(true)
					slot0.gameFinish:closeView()
				end,
				onNo = function ()
					slot0:restartTimers()
				end
			})
		else
			slot0:closeView()
		end
	end)
	onButton(slot0, slot0.helpBtn, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_summer_shooting.tip
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.startMaskTF, function ()
		if not slot0.isPlaying then
			slot0:gameStart()
		end
	end)
	slot0:initData()
	slot0:updateCount()
	slot0:resetTime()
	slot0:initFireFunc()
	slot0:setFireLink(false)
	setActive(slot0.startMaskTF, true)
end

function slot0.onBackPressed(slot0)
	triggerButton(slot0.backBtn)
end

function slot1(slot0, slot1)
	return Vector2(math.clamp(slot0.x, -slot1.x, slot1.x), math.clamp(slot0.y, -slot1.y, slot1.y))
end

function slot0.update(slot0)
	slot1 = Time.GetTimestamp()

	if not slot0.isStopped then
		if slot0.isAfterCount and slot0.sightTimeMark then
			if not slot0.moveRect then
				slot0.moveRect = Vector2(tf(slot0.sightTF.parent).rect.width - slot0.sightTF.rect.width, tf(slot0.sightTF.parent).rect.height - slot0.sightTF.rect.height) / 2
			end

			slot0.sightTF.anchoredPosition = slot1(slot0.sightTF.anchoredPosition + Vector2(slot0.uiMGR.hrz, slot0.uiMGR.vtc) * slot0.tempConfig.moveSpeed * (slot1 - slot0.sightTimeMark) * slot0.moveModulus * ((slot0.isDown and 0.5) or 1), slot0.moveRect)
		end

		slot0:updateTimers()
	end

	slot0.sightTimeMark = slot1
end

function slot0.resetTime(slot0)
	slot0.countdown = slot0.tempConfig.waitCountdown

	setText(slot0.countdownTF, slot0.countdown)

	slot0.lastTime = slot0.tempConfig.baseTime

	setText(slot0.lastTimeTF, slot0.lastTime)
end

function slot0.gameStart(slot0)
	slot0.isPlaying = true

	UpdateBeat:Add(slot0.update, slot0)
	setActive(slot0.countdownTF, true)
	setActive(slot0.startMaskTF:Find("word"), false)

	-- Decompilation error in this vicinity:
	function (slot0)
		slot0:addTimer("start countdown", 1, function ()
			slot0.countdown = slot0.countdown - 1

			setText(slot0.countdownTF, slot0.countdown)

			if setText.countdown > 0 then
				slot1(slot1)
			else
				slot0:afterCountDown()
			end
		end)
	end(
	-- Decompilation error in this vicinity:
	function (slot0)
		slot0.addTimer("start countdown", 1, function ()
			slot0.countdown = slot0.countdown - 1

			setText(slot0.countdownTF, slot0.countdown)

			if setText.countdown > 0 then
				slot1(slot1)
			else
				slot0.afterCountDown()
			end
		end)
	end)
end

function slot0.afterCountDown(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-36, warpins: 1 ---
	slot0.isAfterCount = true

	slot0.uiMGR:AttachStickOb(slot0.joyStrickTF)
	setActive(slot0.sightTF, true)
	setAnchoredPosition(slot0.sightTF, Vector2.zero)
	slot0:setFireLink(true)
	setActive(slot0.startMaskTF, false)

	slot0.score = 0

	slot0:flushTarget(true)

	-- Decompilation error in this vicinity:
	function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		slot0:addTimer("gamefinish", 1, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-16, warpins: 1 ---
			slot0.lastTime = slot0.lastTime - 1

			setText(slot0.lastTimeTF, slot0.lastTime)

			if setText.lastTime > 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 17-20, warpins: 1 ---
				slot1(slot1)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 21-24, warpins: 1 ---
				slot0:gameFinish()
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 25-25, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end)

		return
		--- END OF BLOCK #0 ---



	end(
	-- Decompilation error in this vicinity:
	function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		slot0.addTimer("gamefinish", 1, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-16, warpins: 1 ---
			slot0.lastTime = slot0.lastTime - 1

			setText(slot0.lastTimeTF, slot0.lastTime)

			if setText.lastTime > 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 17-20, warpins: 1 ---
				slot1(slot1)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 21-24, warpins: 1 ---
				slot0.gameFinish()
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 25-25, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end)

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

function slot0.gameFinish(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.isAfterCount then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-13, warpins: 1 ---
		slot0:setFireLink(false)
		slot0.uiMGR:ClearStick()

		slot0.isAfterCount = false
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 14-37, warpins: 2 ---
	slot0:clearTimers()
	UpdateBeat:Remove(slot0.update, slot0)
	setActive(slot0.sightTF, false)
	setActive(slot0.countdownTF, false)
	slot0:resetTime()

	slot0.isPlaying = false

	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 38-41, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 42-77, warpins: 0 ---
		for slot5 = 1, 3, 1 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 42-45, warpins: 2 ---
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 46-76, warpins: 0 ---
			for slot9 = 1, 6, 1 do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 46-50, warpins: 2 ---
				if slot0.cell[slot5][slot9] then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 51-75, warpins: 1 ---
					slot0.targetPanel:Find("line_" .. slot5):GetChild(slot9 - 1):GetChild(0):GetComponent(typeof(Animator)):Play("targetDown")
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

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 78-89, warpins: 1 ---
		Timer.New(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-15, warpins: 1 ---
			setActive(slot0.startMaskTF, true)
			setActive(slot0.startMaskTF:Find("word"), true)

			return
			--- END OF BLOCK #0 ---



		end, slot0.animTime).Start(slot2)
		slot0:resultFinish()
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 90-91, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

function slot0.resultFinish(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot2 = nil

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-17, warpins: 0 ---
	for slot6 = 1, #slot0.tempConfig.score_level, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-14, warpins: 2 ---
		if slot1[#slot1 - slot6 + 1] <= slot0.score then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-16, warpins: 1 ---
			slot2 = slot6

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 17-17, warpins: 1 ---
			break
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 17-17, warpins: 1 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 18-25, warpins: 2 ---
	slot0.awardLevel = slot2

	if slot0:GetMGHubData().count > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 26-30, warpins: 1 ---
		slot0:SendSuccess(slot2)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 31-34, warpins: 1 ---
		slot0:showResultPanel({})
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 35-35, warpins: 2 ---
	return
	--- END OF BLOCK #3 ---



end

function slot0.showResultPanel(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-28, warpins: 1 ---
	onButton(slot0, slot0.resultPanel:Find("bg"), slot3)
	onButton(slot0, slot0.resultPanel:Find("main/btn_confirm"), function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		setActive(slot0.resultPanel, false)

		if slot0.resultPanel then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-11, warpins: 1 ---
			slot1()
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 12-15, warpins: 1 ---
			slot0:updateCount()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 16-16, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end)

	slot4 = slot0.resultPanel:Find("main")

	if slot0.bestScore < slot0.score then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 29-44, warpins: 1 ---
		slot0:StoreDataToServer({
			slot0.score
		})
		GetImageSpriteFromAtlasAsync("ui/shootinggameui_atlas", "new_recode", slot4:Find("success"), true)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 45-53, warpins: 1 ---
		GetImageSpriteFromAtlasAsync("ui/shootinggameui_atlas", "success", slot4:Find("success"), true)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 54-85, warpins: 2 ---
	GetImageSpriteFromAtlasAsync("ui/shootinggameui_atlas", "level_" .. #slot0.tempConfig.score_level - slot0.awardLevel + 1, slot4:Find("success/level"), true)
	setText(slot4:Find("right/score/number"), slot0.score)
	setActive(slot4:Find("right/awards/list"), #slot1 > 0)
	setActive(slot4:Find("right/awards/nothing"), #slot1 == 0)

	slot0.itemList = slot0.itemList or UIItemList.New(slot4:Find("right/awards/list"), slot4:Find("right/awards/list/item"))

	slot0.itemList:make(function (slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		if slot0 == UIItemList.EventUpdate then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-22, warpins: 1 ---
			updateDrop(slot2, slot0[slot1 + 1])
			setText(slot2:Find("number"), "x" .. slot0[slot1 + 1].count)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 23-23, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end)
	slot0.itemList:align(#slot1)
	setActive(slot0.resultPanel, true)

	return
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 89-97, warpins: 2 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 101-104, warpins: 2 ---
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 116-132, warpins: 2 ---
	--- END OF BLOCK #4 ---



end

function slot0.updateAfterFinish(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	pg.m02:sendNotification(GAME.MODIFY_MINI_GAME_DATA, {
		id = MiniGameDataCreator.ShrineGameID,
		map = {
			count = (getProxy(MiniGameProxy):GetMiniGameData(MiniGameDataCreator.ShrineGameID):GetRuntimeData("count") or 0) + 1
		}
	})

	return
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 16-31, warpins: 2 ---
	--- END OF BLOCK #1 ---



end

function slot0.OnSendMiniGameOPDone(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot0:updateCount()

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateCount(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-19, warpins: 1 ---
	setText(slot0.ticketTF, slot0:GetMGHubData().count)

	slot0.bestScore = checkExist(slot0:GetMGData():GetRuntimeData("elements"), {
		1
	}) or 0

	setText(slot0.bestScoreTF, slot0.bestScore)

	return
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 21-26, warpins: 2 ---
	--- END OF BLOCK #1 ---



end

function slot0.initFireFunc(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-38, warpins: 1 ---
	slot1 = pg.TipsMgr.GetInstance()
	slot2 = pg.TimeMgr.GetInstance()

	setImageAlpha(slot3, 1)
	setImageAlpha(slot4, 0)

	function slot5()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-23, warpins: 1 ---
		setActive(slot0.corners, true)
		LeanTween.scale(slot0.corners, Vector3(1.95, 1.95, 1), 0.1):setOnComplete(System.Action(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-13, warpins: 1 ---
			LeanTween.alpha(LeanTween.alpha, 0, 0.1)
			LeanTween.alpha(LeanTween.alpha, 1, 0.1)

			return
			--- END OF BLOCK #0 ---



		end))

		return
		--- END OF BLOCK #0 ---



	end

	function slot6()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-25, warpins: 1 ---
		setActive(slot0.corners, false)
		LeanTween.alpha(slot0.corners, 1, 0.1)
		LeanTween.alpha(1, 0, 0.1):setOnComplete(System.Action(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-8, warpins: 1 ---
			LeanTween.scale(LeanTween.scale, Vector3.one, 0.1)

			return
			--- END OF BLOCK #0 ---



		end))

		return
		--- END OF BLOCK #0 ---



	end

	function slot0._downFunc()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		slot0()

		return
		--- END OF BLOCK #0 ---



	end

	function slot0._upFunc()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-23, warpins: 1 ---
		LeanTween.scale(LeanTween.scale, Vector3(2, 2, 2), 0.03):setOnComplete(System.Action(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-15, warpins: 1 ---
			LeanTween.scale(LeanTween.scale, Vector3.one, 0.07):setOnComplete(System.Action(function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-3, warpins: 1 ---
				slot0()

				return
				--- END OF BLOCK #0 ---



			end))

			return
			--- END OF BLOCK #0 ---



		end))

		slot0, slot1, slot2 = slot2:checkHit()

		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 24-105, warpins: 1 ---
			slot2.cell[slot1][slot2] = nil
			slot2.score = slot2.score + slot2.tempConfig.targetScore[slot2.cell[slot1][slot2]]
			slot2.targetCount[slot2.cell[slot1][slot2]] = slot2.targetCount[slot2.cell[slot1][slot2]] - 1
			slot2.lastTime = slot2.lastTime + slot2.tempConfig.bonusTime

			setText(slot2.lastTimeTF, slot2.lastTime)
			slot2.targetPanel:Find("line_" .. slot1):GetChild(slot2 - 1):GetChild(0):GetComponent(typeof(Animator)).Play(slot4, "targetDown")
			slot2:addTimer("flush call", 0.2 + slot3.animTime, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-5, warpins: 1 ---
				slot0:flushTarget()

				return
				--- END OF BLOCK #0 ---



			end)

			if not _.any(slot2.targetCount, function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-3, warpins: 1 ---
				return slot0 > 0
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 7-7, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 106-109, warpins: 1 ---
				slot2:gameFinish()
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 110-124, warpins: 3 ---
		slot2:setFireLink(false)
		slot2:addTimer("fire cd", slot2.tempConfig.fireCD, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-6, warpins: 1 ---
			slot0:setFireLink(true)

			return
			--- END OF BLOCK #0 ---



		end)

		return
		--- END OF BLOCK #1 ---



	end

	function slot0._cancelFunc()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		slot0()

		return
		--- END OF BLOCK #0 ---



	end

	slot0._emptyFunc = nil

	return
	--- END OF BLOCK #0 ---



end

function slot0.setFireLink(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-9, warpins: 1 ---
		setButtonEnabled(slot0.fireBtn, true)

		if slot0._downFunc ~= nil then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-14, warpins: 1 ---
			slot0.fireBtnDelegate:AddPointDownFunc(function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-7, warpins: 1 ---
				slot0.isDown = true

				if slot0._main_cannon_sound then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 8-13, warpins: 1 ---
					slot0._main_cannon_sound:Stop(true)
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 14-27, warpins: 2 ---
				slot0._main_cannon_sound = pg.CriMgr.GetInstance():PlaySE("battle-cannon-main-prepared")

				slot0._downFunc()

				return
				--- END OF BLOCK #1 ---



			end)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 15-17, warpins: 2 ---
		if slot0._upFunc ~= nil then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-22, warpins: 1 ---
			slot0.fireBtnDelegate:AddPointUpFunc(function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-4, warpins: 1 ---
				if slot0.isDown then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 5-8, warpins: 1 ---
					if slot0._main_cannon_sound then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 9-14, warpins: 1 ---
						slot0._main_cannon_sound:Stop(true)
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 15-23, warpins: 2 ---
					playSoundEffect("event:/battle/boom2")

					playSoundEffect.isDown = false

					playSoundEffect._upFunc()
					--- END OF BLOCK #1 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 24-24, warpins: 2 ---
				return
				--- END OF BLOCK #1 ---



			end)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 23-25, warpins: 2 ---
		if slot0._cancelFunc ~= nil then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 26-31, warpins: 1 ---
			slot0.fireBtnDelegate:AddPointExitFunc(function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-4, warpins: 1 ---
				if slot0.isDown then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 5-8, warpins: 1 ---
					if slot0._main_cannon_sound then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 9-14, warpins: 1 ---
						slot0._main_cannon_sound:Stop(true)
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 15-20, warpins: 2 ---
					slot0.isDown = false

					slot0._cancelFunc()
					--- END OF BLOCK #1 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 21-21, warpins: 2 ---
				return
				--- END OF BLOCK #1 ---



			end)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #2 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 32-34, warpins: 1 ---
		if slot0.isDown then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 35-38, warpins: 1 ---
			slot0.isDown = false

			slot0._cancelFunc()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 39-54, warpins: 2 ---
		setButtonEnabled(slot0.fireBtn, false)
		slot0.fireBtnDelegate:RemovePointDownFunc()
		slot0.fireBtnDelegate:RemovePointUpFunc()
		slot0.fireBtnDelegate:RemovePointExitFunc()
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 55-56, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.flushTarget(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-4, warpins: 1 ---
		slot0.targetCount = {
			2,
			4,
			6
		}
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-8, warpins: 2 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 9-27, warpins: 0 ---
	for slot5 = 1, 3, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-12, warpins: 2 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 13-26, warpins: 0 ---
		for slot9 = 1, 6, 1 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-26, warpins: 2 ---
			removeAllChildren(slot0.targetPanel:Find("line_" .. slot5):GetChild(slot9 - 1))
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 27-27, warpins: 1 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 28-40, warpins: 1 ---
	slot2 = {
		0,
		0,
		0
	}
	slot0.cell = {
		{},
		{},
		{}
	}

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 41-99, warpins: 0 ---
	for slot6, slot7 in ipairs(slot0.targetCount) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 41-44, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 45-97, warpins: 0 ---
		for slot11 = 1, slot7, 1 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 45-52, warpins: 2 ---
			slot12 = math.random(3)
			slot13 = math.random(6)

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 53-57, warpins: 2 ---
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 64-76, warpins: 0 ---
			while slot0.cell[slot12][slot13] or (slot1 and slot2[slot12] >= 4) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 64-64, warpins: 2 ---
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 65-75, warpins: 1 ---
				slot13 = math.random(6)
				slot12 = math.random(3)
				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 76-76, warpins: 1 ---
				--- END OF BLOCK #2 ---



			end

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 76-97, warpins: 2 ---
			slot2[slot12] = slot2[slot12] + 1
			slot0.cell[slot12][slot13] = slot6

			cloneTplTo(slot0.targetTpl[slot6], slot0.targetPanel:Find("line_" .. slot12):GetChild(slot13 - 1))
			--- END OF BLOCK #3 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 98-99, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 100-104, warpins: 1 ---
	setText(slot0.scoreTF, slot0.score)

	return
	--- END OF BLOCK #5 ---



end

function slot0.checkHit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-60, warpins: 0 ---
	for slot4 = 1, 3, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-8, warpins: 2 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 9-59, warpins: 0 ---
		for slot8 = 1, 6, 1 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-13, warpins: 2 ---
			if slot0.cell[slot4][slot8] then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 14-54, warpins: 1 ---
				slot9 = slot0.targetPanel:Find("line_" .. slot4):GetChild(slot8 - 1):GetChild(0):Find("icon/face")
				slot10 = slot0.sightTF:InverseTransformPoint(slot9:TransformPoint(slot9.position))

				if slot10.x * slot10.x + slot10.y * slot10.y < slot0.tempConfig.half * slot0.tempConfig.half then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 55-58, warpins: 1 ---
					return true, slot4, slot8
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 59-59, warpins: 3 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 60-60, warpins: 1 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 61-61, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

function slot0.willExit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-1, warpins: 1 ---
	return
	--- END OF BLOCK #0 ---



end

return slot0
