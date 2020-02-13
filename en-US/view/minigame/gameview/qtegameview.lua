slot0 = class("QTEGameView", import("..BaseMiniGameView"))

function slot0.getUIName(slot0)
	return "QTEGameUI"
end

function slot0.init(slot0)
	slot0.STATE_BEGIN = 1
	slot0.STATE_COUNT = 2
	slot0.STATE_CLICK = 3
	slot0.STATE_SHOW = 4
	slot0.STATE_END = 5
	slot0.gameState = -1
	slot0.typeNum = 3
	slot0.idNum = 3
	slot0.limitNum = 5
	slot0.TYPE_A = 1
	slot0.TYPE_B = 2
	slot0.TYPE_C = 3
	slot0.ITEM_ID_1 = 1
	slot0.ITEM_ID_2 = 2
	slot0.ITEM_ID_3 = 3
	slot0.startUI = slot0:findTF("start_ui")
	slot0.startBtn = slot0:findTF("start_btn", slot0.startUI)
	slot0.ruleBtn = slot0:findTF("rule_btn", slot0.startUI)
	slot0.qBtn = slot0:findTF("q_btn", slot0.startUI)
	slot0.countUI = slot0:findTF("count_ui")
	slot0.countNumTxt = slot0:findTF("num", slot0.countUI)
	slot0.endUI = slot0:findTF("end_ui")
	slot0.endExitBtn = slot0:findTF("exit_btn", slot0.endUI)
	slot0.endBestTxt = slot0:findTF("rope/paper/best_txt", slot0.endUI)
	slot0.endScoreTxt = slot0:findTF("rope/paper/score_txt", slot0.endUI)
	slot0.endComboTxt = slot0:findTF("rope/paper/combo_txt", slot0.endUI)
	slot0.endMissTxt = slot0:findTF("rope/paper/miss_txt", slot0.endUI)
	slot0.endHitTxt = slot0:findTF("rope/paper/hit_txt", slot0.endUI)
	slot0.endUIEvent = slot0:findTF("rope", slot0.endUI):GetComponent("DftAniEvent")
	slot0.content = slot0:findTF("content")
	slot0.res = slot0:findTF("res")
	slot0.gameBg = slot0:findTF("game_bg", slot0.content)
	slot0.xgmPos = slot0:findTF("xiongguimao_pos", slot0.content)
	slot0.guinuPos = slot0:findTF("guinu_pos", slot0.content)
	slot0.bucketA = slot0:findTF("content/bucket_A")
	slot0.bucketASpine = slot0.bucketA:GetComponent("SpineAnimUI")
	slot0.bucketAGraphic = slot0.bucketA:GetComponent("SkeletonGraphic")
	slot0.bucketB = slot0:findTF("content/bucket_B")
	slot0.bucketBSpine = slot0.bucketB:GetComponent("SpineAnimUI")
	slot0.bucketBGraphic = slot0.bucketB:GetComponent("SkeletonGraphic")
	slot0.bucketC = slot0:findTF("content/bucket_C")
	slot0.msHand = slot0:findTF("ani", slot0.bucketC)
	slot0.msHandAnimator = slot0.msHand:GetComponent("Animator")
	slot0.msHandSlot = slot0:findTF("slot", slot0.msHand)
	slot0.msHandEvent = slot0.msHand:GetComponent("DftAniEvent")
	slot0.msBlockList = {}

	slot0.msHandEvent:SetEndEvent(function ()
		slot0:msClearHold()
		setActive(slot0.msHand, false)
	end)

	slot0.xgmAnimLength = {
		idle = 1,
		attack = 1
	}
	slot0.xgmAnimTargetLength = {
		idle = 1,
		attack = 0.5
	}
	slot0.guinuAnimLength = {
		action = 1.333,
		normal = 4.667
	}
	slot0.guinuAnimTargetLength = {
		action = 0.5,
		normal = 4.667
	}
	slot0.bucketAAnimLength = {
		idle = 0.167,
		attack = 0.8
	}
	slot0.bucketAAnimTargetLength = {
		idle = 1,
		attack = 0.6
	}
	slot0.bucketBAnimLength = {
		idle = 0.167,
		attack = 0.8
	}
	slot0.bucketBAnimTargetLength = {
		idle = 1,
		attack = 0.6
	}
	slot0.cut1 = slot0:findTF("cut_1", slot0.bucketB)
	slot0.cut2 = slot0:findTF("cut_2", slot0.bucketB)
	slot0.cut3 = slot0:findTF("cut_3", slot0.bucketB)
	slot0.cut1Animator = slot0.cut1:GetComponent("Animator")
	slot0.cut2Animator = slot0.cut2:GetComponent("Animator")
	slot0.cut3Animator = slot0.cut3:GetComponent("Animator")
	slot0.cut1Event = slot0.cut1:GetComponent("DftAniEvent")
	slot0.cut2Event = slot0.cut2:GetComponent("DftAniEvent")
	slot0.cut3Event = slot0.cut3:GetComponent("DftAniEvent")

	slot0.cut1Event:SetEndEvent(function ()
		setActive(slot0.cut1, false)
	end)
	slot0.cut2Event:SetEndEvent(function ()
		setActive(slot0.cut2, false)
	end)
	slot0.cut3Event:SetEndEvent(function ()
		setActive(slot0.cut3, false)
	end)

	slot0.keyUI = slot0:findTF("key_ui", slot0.content)
	slot0.keyBar = slot0:findTF("key_bar", slot0.keyUI)
	slot0.aBtn = slot0:findTF("A_btn", slot0.keyUI)
	slot0.bBtn = slot0:findTF("B_btn", slot0.keyUI)
	slot0.cBtn = slot0:findTF("C_btn", slot0.keyUI)
	slot0.comboAni = slot0:findTF("combo_bar/center", slot0.content):GetComponent("Animator")
	slot0.comboTxt = slot0:findTF("combo_bar/center/combo_txt", slot0.content)
	slot0.comboAni.enabled = false
	slot0.scoreTxt = slot0:findTF("score_bar/txt", slot0.content)
	slot0.remainTxt = slot0:findTF("remain_time_bar/txt", slot0.content)

	pg.UIMgr.GetInstance():OverlayPanelPB(slot0.keyBar, {
		pbList = {
			slot0.keyBar
		}
	})

	slot0.roundTxt = slot0:findTF("round_time_bar/txt", slot0.keyUI)
	slot0.firePos = slot0:findTF("content/pos/fire_pos").anchoredPosition
	slot0.hitPos = slot0:findTF("content/pos/hit_pos").anchoredPosition
	slot0.aPos = slot0:findTF("content/pos/a_pos").anchoredPosition
	slot0.bPos = slot0:findTF("content/pos/b_pos").anchoredPosition
	slot0.cPos = slot0:findTF("content/pos/c_pos").anchoredPosition
	slot0.missPos = slot0:findTF("content/pos/miss_pos").anchoredPosition
	slot0.backBtn = slot0:findTF("back_btn", slot0.content)
	slot0.autoLoader = AutoLoader.New()

	slot0.autoLoader:LoadSprite("ui/minigameui/qtegameuiasync/backgroud", "background", slot0.gameBg, false)
end

function slot0.didEnter(slot0)
	slot0:initGame()
	onButton(slot0, slot0.backBtn, function ()
		slot0:setGameState(slot0.STATE_BEGIN)
	end, SFX_PANEL)
	onButton(slot0, slot0.qBtn, function ()
		slot0:emit(slot1.ON_BACK)
	end, SFX_PANEL)
	onButton(slot0, slot0.ruleBtn, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.qte_game_help.tip,
			weight = LayerWeightConst.THIRD_LAYER
		})
	end)
	onButton(slot0, slot0.startBtn, function ()
		setButtonEnabled(slot0.startBtn, false)
		parallelAsync({
			function (slot0)
				slot0:loadXGM(slot0)
			end,
			function (slot0)
				slot0:loadGuinu(slot0)
			end
		}, function ()
			slot0:setGameState(slot0.STATE_COUNT)
		end)
	end, SFX_PANEL)

	if QTEGAME_DEBUG then
		onButton(slot0, slot0.xgm, function ()
			slot0:setGameState(slot0.STATE_SHOW)
		end)
	end

	onButton(slot0, slot0.endExitBtn, function ()
		slot0:emit(slot1.ON_BACK)
	end, SFX_PANEL)
	slot0.endUIEvent:SetEndEvent(function ()
		if slot0:GetMGHubData().count > 0 then
			slot0:SendSuccess(0)
		end

		setActive(slot0.endExitBtn, true)
	end)

	function slot1(slot0)
		if slot0.gameState == slot0.STATE_CLICK and slot0.curShowBlock then
			slot0.curShowBlock:select(slot0)

			slot0.curShowBlock = slot0.curShowBlock.nextBlock

			if slot0.curShowBlock == nil then
				slot0:managedTween(LeanTween.delayedCall, function ()
					slot0:setGameState(slot0.STATE_SHOW)
				end, 0.2, nil)
			end
		end
	end

	onButton(slot0, slot0.aBtn, function ()
		slot0(slot1.TYPE_A)
	end, SFX_PANEL)
	onButton(slot0, slot0.bBtn, function ()
		slot0(slot1.TYPE_B)
	end, SFX_PANEL)
	onButton(slot0, slot0.cBtn, function ()
		slot0(slot1.TYPE_C)
	end, SFX_PANEL)
	slot0:setGameState(slot0.STATE_BEGIN)
	slot0:checkHelp()
end

function slot0.initGame(slot0)
	slot0.curShowBlock = nil
	slot0.randomBlockList = nil
	slot0.scorePerHit = slot0:GetMGData():GetSimpleValue("scorePerHit")
	slot0.comboRange = slot0:GetMGData():GetSimpleValue("comboRange")
	slot0.comboAddScore = slot0:GetMGData():GetSimpleValue("comboAddScore")
	slot0.targetCombo = slot0:GetMGData():GetSimpleValue("targetCombo")
	slot0.targetComboScore = slot0:GetMGData():GetSimpleValue("targetComboScore")
	slot0.usingBlockList = {}
	slot0.blockUniId = 0

	slot0:resetGame()
	slot0.bucketASpine:SetActionCallBack(function (slot0)
		if slot0 == "FINISH" then
			slot0:setBucketAAction("idle")
		end
	end)
	slot0.bucketBSpine:SetActionCallBack(function (slot0)
		if slot0 == "FINISH" then
			slot0:setBucketBAction("idle")
		end
	end)
end

function slot0.resetGame(slot0)
	slot0:setXgmAction("idle")
	slot0:setGuinuAction("normal")
	slot0:setBucketAAction("idle")
	slot0:setBucketBAction("idle")
	setActive(slot0.msHand, false)

	slot0.score = 0
	slot0.bestComboNum = 0
	slot0.comboNum = 0
	slot0.missNum = 0
	slot0.hitNum = 0
	slot0.remainTime = slot0:GetMGData():GetSimpleValue("gameTime")
	slot0.roundTime = slot0:GetMGData():GetSimpleValue("roundTime")

	setText(slot0.comboTxt, 0)
	setText(slot0.scoreTxt, 0)
	setText(slot0.remainTxt, slot0.remainTime .. "S")
	setText(slot0.roundTxt, slot0.roundTime)
	slot0:clearTimer()
	slot0:hideRandomList()
	slot0:clearUsingBlock()
	slot0:cleanManagedTween()
end

function slot0.setGameState(slot0, slot1)
	if slot1 == slot0.gameState then
		return
	end

	slot0.gameState = slot1

	function slot2(slot0)
		for slot5, slot6 in pairs(slot1) do
			setActive(slot6, table.indexof(slot0, slot6) and true)
		end

		if isActive(slot0.endUI) then
			pg.UIMgr.GetInstance():BlurPanel(slot0.endUI)
		else
			pg.UIMgr.GetInstance():UnblurPanel(slot0.endUI, slot0._tf)
		end
	end

	if slot0.gameState == slot0.STATE_BEGIN then
		setButtonEnabled(slot0.startBtn, true)
		slot2({
			slot0.startUI
		})
		slot0:resetGame()
	else
		if slot0.gameState == slot0.STATE_COUNT then
			slot2({
				slot0.countUI,
				slot0.content
			})

			slot3 = Time.realtimeSinceStartup

			slot0:managedTween(LeanTween.delayedCall, function ()
				slot0:startGameTimer()
				slot0.startGameTimer:setGameState(slot0.STATE_CLICK)
			end, 3, nil):setOnUpdate(System.Action_float(function (slot0)
				setText(slot0.countNumTxt, math.ceil(3 - (Time.realtimeSinceStartup - setText)))
			end))

			return
		end

		if slot0.gameState == slot0.STATE_CLICK then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 57-75, warpins: 1 ---
			slot2({
				slot0.content,
				slot0.keyUI,
				slot0.keyBar
			})

			slot0.randomBlockList, slot0.curShowBlock, slot0.firstShowBlock = slot0:getRandomList()

			slot0:startRoundTimer()
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 76-79, warpins: 1 ---
			if slot0.gameState == slot0.STATE_SHOW then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 80-95, warpins: 1 ---
				slot2({
					slot0.content
				})
				slot0:hideRandomList()
				slot0:playArchiveAnim(slot0.randomBlockList, slot0:getUserResult())
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 96-99, warpins: 1 ---
				if slot0.gameState == slot0.STATE_END then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 100-120, warpins: 1 ---
					slot2({
						slot0.content,
						slot0.endUI
					})
					setActive(slot0.endExitBtn, false)

					slot3 = 0

					if slot0:GetMGData():GetRuntimeData("elements") and #slot4 > 0 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 125-125, warpins: 1 ---
						slot3 = slot4[1]
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 126-128, warpins: 3 ---
					if slot3 < slot0.score then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 129-134, warpins: 1 ---
						slot0:StoreDataToServer({
							slot0.score
						})
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #1 ---

					FLOW; TARGET BLOCK #2



					-- Decompilation error in this vicinity:
					--- BLOCK #2 135-157, warpins: 2 ---
					setText(slot0.endBestTxt, slot3)
					setText(slot0.endScoreTxt, slot0.score)
					setText(slot0.endComboTxt, slot0.bestComboNum)
					setText(slot0.endMissTxt, slot0.missNum)
					setText(slot0.endHitTxt, slot0.hitNum)
					slot0:clearTimer()
					--- END OF BLOCK #2 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
	end
end

function slot0.fireBlocks(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-22, warpins: 1 ---
	slot6 = slot0:getBlock(slot2, slot3).tf

	slot0:addUsingBlock(slot0.getBlock(slot2, slot3))

	slot7 = nil

	if slot0.opList[slot0.opIndex] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 23-25, warpins: 1 ---
		if slot2 == slot0.TYPE_A then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 26-27, warpins: 1 ---
			slot7 = slot0.aPos
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 28-30, warpins: 1 ---
			if slot2 == slot0.TYPE_B then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 31-32, warpins: 1 ---
				slot7 = slot0.bPos
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 33-35, warpins: 1 ---
				if slot2 == slot0.TYPE_C then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 36-37, warpins: 1 ---
					slot7 = slot0.cPos
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 38-38, warpins: 1 ---
		slot7 = slot0.missPos
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 39-57, warpins: 5 ---
	slot6.anchoredPosition = slot0.firePos

	slot0:hitFly(slot6, 0.5, slot0.hitPos, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		slot0.anchoredPosition = slot1.hitPos

		if slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-15, warpins: 1 ---
			slot0 = 0.4

			if slot3 == slot1.TYPE_A then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 16-24, warpins: 1 ---
				slot0 = 0.3

				slot1:setBucketAAction("attack")
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 25-29, warpins: 1 ---
				if slot3 == slot1.TYPE_B then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 30-39, warpins: 1 ---
					slot1:managedTween(LeanTween.delayedCall, function ()

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-6, warpins: 1 ---
						slot0:setBucketBAction("attack")

						return
						--- END OF BLOCK #0 ---



					end, 0.2, nil)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 40-44, warpins: 1 ---
					if slot3 == slot1.TYPE_C then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 45-60, warpins: 1 ---
						slot0 = 0.3

						setActive(slot1.msHand, true)
						slot1.msHandAnimator:Play("mingshi_hand", -1, 0)
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 61-68, warpins: 4 ---
			slot1(slot1, slot0, slot0, , function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-5, warpins: 1 ---
				if slot0 == slot1.TYPE_A then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 6-23, warpins: 1 ---
					slot1:removeUsingBlock(slot2)
					slot1:showBucketAEffect()
					pg.CriMgr.GetInstance():PlaySE("ui-minigame_hitcake")
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 24-28, warpins: 1 ---
					if slot0 == slot1.TYPE_B then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 29-62, warpins: 1 ---
						setActive(slot1["cut" .. slot3], true)
						slot1["cut" .. slot3]["cut" .. slot3 .. "Animator"]:Play("cut_fruit", -1, 0)
						slot1["cut" .. slot3]["cut" .. slot3 .. "Animator"]:removeUsingBlock("cut_fruit")
						pg.CriMgr.GetInstance():PlaySE("ui-minigame_sword")
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 63-67, warpins: 1 ---
						if slot0 == slot1.TYPE_C then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 68-76, warpins: 1 ---
							slot1:msClearHold()
							slot1:msHoldBlock(slot2)
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 77-82, warpins: 4 ---
				slot1:checkEnd(slot4)

				return
				--- END OF BLOCK #1 ---



			end)
			--- END OF BLOCK #1 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 69-76, warpins: 1 ---
			slot1:hitFly(slot1.hitFly, 0.6, slot4, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-11, warpins: 1 ---
				slot0:removeUsingBlock(slot0)
				slot0.removeUsingBlock:checkEnd(slot0)

				return
				--- END OF BLOCK #0 ---



			end)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 77-90, warpins: 2 ---
		pg.CriMgr.GetInstance():PlaySE("ui-minigame_hitwood")
		pg.CriMgr.GetInstance():countScore("ui-minigame_hitwood")

		return
		--- END OF BLOCK #1 ---



	end)
	slot0:managedTween(LeanTween.delayedCall, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		slot0:setGuinuAction("action")

		return
		--- END OF BLOCK #0 ---



	end, 0.2, nil)

	return
	--- END OF BLOCK #1 ---



end

function slot0.getRandomList(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if not slot0.allList then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-9, warpins: 1 ---
		slot0.allList = {}

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 10-23, warpins: 0 ---
		for slot4 = 1, slot0.typeNum, 1 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-13, warpins: 2 ---
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 14-22, warpins: 0 ---
			for slot8 = 1, slot0.idNum, 1 do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 14-22, warpins: 2 ---
				slot0.allList[#slot0.allList + 1] = {
					type = slot4,
					id = slot8
				}
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 23-23, warpins: 1 ---
			--- END OF BLOCK #2 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 24-31, warpins: 2 ---
	slot1 = Clone(slot0.allList)
	slot2 = {}

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 32-44, warpins: 0 ---
	for slot6 = 1, slot0.limitNum, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 32-44, warpins: 2 ---
		slot2[#slot2 + 1] = table.remove(slot1, math.random(1, #slot1))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 45-49, warpins: 1 ---
	slot3, slot4, slot5 = nil

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 50-73, warpins: 0 ---
	for slot9, slot10 in ipairs(slot2) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 50-56, warpins: 1 ---
		slot11 = slot0:getShowBlock(slot10.type, slot10.id)

		if slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 57-57, warpins: 1 ---
			slot3.nextBlock = slot11
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 58-60, warpins: 2 ---
		if slot0.limitNum <= slot9 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 61-62, warpins: 1 ---
			slot11.nextBlock = nil
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 63-64, warpins: 2 ---
		if slot9 == 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 65-66, warpins: 1 ---
			slot4 = slot11
			slot5 = slot11
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 67-71, warpins: 2 ---
		slot11:showOrHide(true)

		slot3 = slot11
		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 72-73, warpins: 2 ---
		--- END OF BLOCK #4 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 74-77, warpins: 1 ---
	return slot2, slot4, slot5
	--- END OF BLOCK #5 ---



end

function slot0.hideRandomList(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-1, warpins: 1 ---
	slot1 = slot0.firstShowBlock

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 2-3, warpins: 2 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 4-11, warpins: 0 ---
	while slot1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 5-10, warpins: 1 ---
		slot1:showOrHide(false)

		slot1 = slot1.nextBlock
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 11-11, warpins: 1 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 11-11, warpins: 1 ---
	return
	--- END OF BLOCK #3 ---



end

function slot0.countScore(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-7, warpins: 1 ---
		slot2 = nil

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-21, warpins: 0 ---
		for slot6, slot7 in ipairs(slot0.comboRange) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-10, warpins: 1 ---
			if slot0.comboNum < slot7 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-12, warpins: 1 ---
				slot2 = slot6 - 1

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 13-13, warpins: 1 ---
				break
				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 13-13, warpins: 0 ---
				--- END OF BLOCK #2 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 14-17, warpins: 1 ---
				if slot6 == #slot0.comboRange then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 18-19, warpins: 1 ---
					slot2 = #slot0.comboRange
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 20-21, warpins: 4 ---
			--- END OF BLOCK #1 ---



		end

		slot0.comboNum = slot0.comboNum + 1
		slot0.score = slot0.score + slot0.scorePerHit + (slot0.comboAddScore[slot2] or 0) + (slot0.targetComboScore[table.indexof(slot0.targetCombo, slot0.comboNum)] or 0)
		slot0.hitNum = slot0.hitNum + 1
		slot0.comboAni.enabled = true

		slot0.comboAni:Play("combo_shake", -1, 0)
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 27-38, warpins: 2 ---
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 40-59, warpins: 2 ---
		--- END OF BLOCK #3 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 60-64, warpins: 1 ---
		slot0.comboNum = 0
		slot0.missNum = slot0.missNum + 1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 65-68, warpins: 2 ---
	if slot0.bestComboNum < slot0.comboNum then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 69-70, warpins: 1 ---
		slot0.bestComboNum = slot0.comboNum
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 71-76, warpins: 2 ---
	setText(slot0.comboTxt, (slot0.comboNum < 0 and 0) or slot0.comboNum)
	setText(slot0.scoreTxt, slot0.score)

	return
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 80-85, warpins: 2 ---
	--- END OF BLOCK #3 ---



end

function slot0.getUserResult(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	slot1 = {}
	slot2 = slot0.firstShowBlock

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 3-4, warpins: 2 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 5-14, warpins: 0 ---
	while slot2 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-5, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 6-13, warpins: 1 ---
		slot1[#slot1 + 1] = slot2:isRight()
		slot2 = slot2.nextBlock
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 14-14, warpins: 1 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 14-14, warpins: 1 ---
	return slot1
	--- END OF BLOCK #3 ---



end

function slot0.playArchiveAnim(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	slot0.arBlockList = slot1
	slot0.opList = slot2
	slot0.opIndex = 1

	slot0:setXgmAction("attack")

	return
	--- END OF BLOCK #0 ---



end

function slot0.checkPlayFinished(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	if slot0.opIndex >= #slot0.opList and slot0.remainTime > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-13, warpins: 1 ---
		slot0:setGameState(slot0.STATE_CLICK)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 14-14, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.checkEnd(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot1 >= #slot0.opList and slot0.remainTime <= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-12, warpins: 1 ---
		slot0:setGameState(slot0.STATE_END)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 13-13, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.parabolaMove(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-39, warpins: 1 ---
	slot0:managedTween(LeanTween.rotate, nil, slot1, 135, slot2)
	slot0:managedTween(LeanTween.moveX, nil, slot1, slot3.x, slot2):setEase(LeanTweenType.linear)
	slot0:managedTween(LeanTween.moveY, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-5, warpins: 1 ---
			slot0()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 6-6, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end, slot1, slot3.y, slot2):setEase(LeanTweenType.easeInQuad)

	return
	--- END OF BLOCK #0 ---



end

function slot0.parabolaMove_center(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-39, warpins: 1 ---
	slot0:managedTween(LeanTween.rotate, nil, slot1, 135, slot2)
	slot0:managedTween(LeanTween.moveX, nil, slot1, slot3.x, slot2):setEase(LeanTweenType.easeOutQuad)
	slot0:managedTween(LeanTween.moveY, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-5, warpins: 1 ---
			slot0()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 6-6, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end, slot1, slot3.y, slot2):setEase(LeanTweenType.linear)

	return
	--- END OF BLOCK #0 ---



end

function slot0.hitFly(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-39, warpins: 1 ---
	slot0:managedTween(LeanTween.rotate, nil, slot1, 135, slot2)
	slot0:managedTween(LeanTween.moveX, nil, slot1, slot3.x, slot2):setEase(LeanTweenType.linear)
	slot0:managedTween(LeanTween.moveY, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-5, warpins: 1 ---
			slot0()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 6-6, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end, slot1, slot3.y, slot2):setEase(LeanTweenType.easeOutQuad)

	return
	--- END OF BLOCK #0 ---



end

function slot0.loadXGM(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.xgm then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-6, warpins: 1 ---
		slot1()
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-13, warpins: 1 ---
		slot0.autoLoader:LoadPrefab("ui/minigameui/qtegameuiasync/xiongguimao", nil, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-35, warpins: 1 ---
			slot0.xgm = tf(slot0)
			slot0.xgmSpine = slot0.xgm:GetComponent("SpineAnimUI")
			slot0.xgmSklGraphic = slot0.xgm:GetComponent("SkeletonGraphic")

			setParent(slot0.xgm, slot0.xgmPos, false)
			slot0:initXGM()
			slot0.initXGM()

			return
			--- END OF BLOCK #0 ---



		end)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 14-15, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.initXGM(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot0.xgmSpine:SetActionCallBack(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-2, warpins: 1 ---
		if slot0 == "FIRE" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 3-7, warpins: 1 ---
			slot0:fireBlocks()
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-9, warpins: 1 ---
			if slot0 == "FINISH" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 10-16, warpins: 1 ---
				if slot0.opIndex < #slot0.opList then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 17-27, warpins: 1 ---
					slot0.opIndex = slot0.opIndex + 1

					slot0:setXgmAction("attack")
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 28-36, warpins: 1 ---
					slot0:setXgmAction("idle")
					slot0:checkPlayFinished()
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 37-37, warpins: 4 ---
		return
		--- END OF BLOCK #1 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

function slot0.loadGuinu(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.guinu then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-6, warpins: 1 ---
		slot1()
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-12, warpins: 1 ---
		slot0.autoLoader:GetSpine("guinu_2", function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-35, warpins: 1 ---
			slot0.guinu = tf(slot0)
			slot0.guinuSpine = slot0.guinu:GetComponent("SpineAnimUI")
			slot0.guinuSklGraphic = slot0.guinu:GetComponent("SkeletonGraphic")

			setParent(slot0.guinu, slot0.guinuPos, false)
			slot0:initGuinu()
			slot0.initGuinu()

			return
			--- END OF BLOCK #0 ---



		end)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 13-14, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.initGuinu(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	slot0.guinu.localScale = Vector3.one

	slot0:setGuinuAction("normal")
	slot0.guinuSpine:SetActionCallBack(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-2, warpins: 1 ---
		if slot0 == "finish" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 3-7, warpins: 1 ---
			slot0:setGuinuAction("normal")
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-8, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

function slot0.setXgmAction(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if not slot0.xgm then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-18, warpins: 2 ---
	slot0.xgmSklGraphic.timeScale = slot0.xgmAnimLength[slot1] / slot0.xgmAnimTargetLength[slot1]

	slot0.xgmSpine:SetAction(slot1, 0)

	return
	--- END OF BLOCK #1 ---



end

function slot0.setGuinuAction(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if not slot0.guinu then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-18, warpins: 2 ---
	slot0.guinuSklGraphic.timeScale = slot0.guinuAnimLength[slot1] / slot0.guinuAnimTargetLength[slot1]

	slot0.guinuSpine:SetAction(slot1, 0)

	return
	--- END OF BLOCK #1 ---



end

function slot0.setBucketAAction(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	slot0.bucketAGraphic.timeScale = slot0.bucketAAnimLength[slot1] / slot0.bucketAAnimTargetLength[slot1]

	slot0.bucketASpine:SetAction(slot1, 0)

	return
	--- END OF BLOCK #0 ---



end

function slot0.setBucketBAction(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	slot0.bucketBGraphic.timeScale = slot0.bucketBAnimLength[slot1] / slot0.bucketBAnimTargetLength[slot1]

	slot0.bucketBSpine:SetAction(slot1, 0)

	return
	--- END OF BLOCK #0 ---



end

function slot0.showBucketAEffect(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot0.aEffectList = slot0.aEffectList or {}
	slot0.aEffectUsingList = slot0.aEffectUsingList or {}

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-8, warpins: 2 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 10-15, warpins: 2 ---
	function slot1()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-39, warpins: 1 ---
		slot0 = table.remove(slot0.aEffectList, #slot0.aEffectList)
		slot0.aEffectUsingList[#slot0.aEffectUsingList + 1] = slot0

		setParent(slot0, slot0.bucketA, false)

		slot0.localScale = Vector3.one

		setActive(slot0, true)
		slot0:managedTween(LeanTween.delayedCall, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-6, warpins: 1 ---
			slot0:recycleBucketAEffect(slot0)

			return
			--- END OF BLOCK #0 ---



		end, 2, nil)

		return
		--- END OF BLOCK #0 ---



	end

	if #slot0.aEffectList == 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-23, warpins: 1 ---
		slot0.autoLoader:LoadPrefab("effect/xinnianyouxi_baozha", nil, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-13, warpins: 1 ---
			slot0.aEffectList[#slot0.aEffectList + 1] = tf(slot0)

			slot0.aEffectList()

			return
			--- END OF BLOCK #0 ---



		end)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 24-25, warpins: 1 ---
		slot1()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 26-27, warpins: 2 ---
	return
	--- END OF BLOCK #3 ---



end

function slot0.recycleBucketAEffect(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-24, warpins: 0 ---
	for slot5 = #slot0.aEffectUsingList, 1, -1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-9, warpins: 2 ---
		if slot0.aEffectUsingList[slot5] == slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-23, warpins: 1 ---
			setActive(slot1, false)

			slot0.aEffectList[#slot0.aEffectList + 1] = table.remove(slot0.aEffectUsingList, slot5)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 24-24, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 25-25, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

function slot0.getBlock(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot3 = slot1 .. "-" .. slot2

	if not slot0.blockPool then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-15, warpins: 1 ---
		slot0.blockPool = {}
		slot0.blockSource = {}

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 16-43, warpins: 0 ---
		for slot7 = 1, 3, 1 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-19, warpins: 2 ---
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 20-42, warpins: 0 ---
			for slot11 = 1, 3, 1 do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 20-42, warpins: 2 ---
				slot0.blockPool[slot7 .. "-" .. slot11] = {}
				slot0.blockPool[slot7 .. "-" .. slot11][#slot0.blockPool[slot7 .. "-" .. slot11] + 1] = slot0:findTF("res/item" .. slot7 .. "-" .. slot11)
				slot0.blockSource[slot7 .. "-" .. slot11] = slot0.findTF("res/item" .. slot7 .. "-" .. slot11)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 43-43, warpins: 1 ---
			--- END OF BLOCK #2 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 44-50, warpins: 2 ---
	slot4 = nil

	if #slot0.blockPool[slot3] > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 51-65, warpins: 1 ---
		table.remove(slot0.blockPool[slot3], #slot0.blockPool[slot3]):SetParent(slot0.content, false)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 66-71, warpins: 1 ---
		slot4 = cloneTplTo(slot0.blockSource[slot3], slot0.content)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 72-84, warpins: 2 ---
	setActive(slot4, true)

	slot0.blockUniId = slot0.blockUniId + 1

	return {
		uid = slot0.blockUniId,
		key = slot3,
		tf = slot4
	}
	--- END OF BLOCK #2 ---



end

function slot0.recycleBlock(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-17, warpins: 1 ---
	slot0.blockPool[slot1.key][#slot0.blockPool[slot1.key] + 1] = slot1.tf

	slot1.tf.SetParent(slot2, slot0.res, false)
	setActive(slot1.tf, false)

	return
	--- END OF BLOCK #0 ---



end

function slot0.msHoldBlock(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	setParent(slot1.tf, slot0.msHandSlot, false)

	slot1.tf.localPosition = Vector2.zero
	slot0.msBlockList[#slot0.msBlockList + 1] = slot1

	return
	--- END OF BLOCK #0 ---



end

function slot0.msClearHold(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-14, warpins: 0 ---
	for slot4 = #slot0.msBlockList, 1, -1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-14, warpins: 2 ---
		slot0:removeUsingBlock(table.remove(slot0.msBlockList, slot4))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 15-15, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

function slot0.addUsingBlock(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot0.usingBlockList[#slot0.usingBlockList + 1] = slot1

	return
	--- END OF BLOCK #0 ---



end

function slot0.removeUsingBlock(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-22, warpins: 0 ---
	for slot5 = #slot0.usingBlockList, 1, -1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-11, warpins: 2 ---
		if slot0.usingBlockList[slot5].uid == slot1.uid then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 12-21, warpins: 1 ---
			slot0:recycleBlock(slot0.usingBlockList[slot5])
			table.remove(slot0.usingBlockList, slot5)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 22-22, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 23-23, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

function slot0.clearUsingBlock(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-16, warpins: 0 ---
	for slot4 = #slot0.usingBlockList, 1, -1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-16, warpins: 2 ---
		slot0:recycleBlock(slot0.usingBlockList[slot4])
		table.remove(slot0.usingBlockList, slot4)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 17-17, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

function slot0.getShowBlock(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot4 = "item" .. slot3
	slot0.showBlockDic = slot0.showBlockDic or {}
	slot5 = nil

	(not slot0.showBlockDic[slot3] or slot0.showBlockDic[slot3]) and false:init()

	return (not slot0.showBlockDic[slot3] or slot0.showBlockDic[slot3]) and false
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-17, warpins: 2 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 55-59, warpins: 2 ---
	--- END OF BLOCK #2 ---



end

function slot0.startGameTimer(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-18, warpins: 1 ---
	slot0.remainTime = slot0:GetMGData():GetSimpleValue("gameTime")

	setText(slot0.remainTxt, slot0.remainTime .. "S")

	function slot1()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-18, warpins: 1 ---
		slot0.remainTime = slot0.remainTime - 1

		setText(slot0.remainTxt, slot0.remainTime .. "S")

		if setText.remainTime <= 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 19-23, warpins: 1 ---
			slot0.remainTimer:Stop()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 24-24, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end

	if slot0.remainTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-26, warpins: 1 ---
		slot0.remainTimer:Reset(slot1, 1, -1)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 27-33, warpins: 1 ---
		slot0.remainTimer = Timer.New(slot1, 1, -1)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 34-39, warpins: 2 ---
	slot0.remainTimer:Start()

	return
	--- END OF BLOCK #1 ---



end

function slot0.startRoundTimer(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-16, warpins: 1 ---
	slot0.roundTime = slot0:GetMGData():GetSimpleValue("roundTime")

	setText(slot0.roundTxt, slot0.roundTime)

	function slot1()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-16, warpins: 1 ---
		slot0.roundTime = slot0.roundTime - 1

		setText(slot0.roundTxt, slot0.roundTime)

		if setText.roundTime <= 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 17-24, warpins: 1 ---
			slot0.roundTimer:Stop()

			if not QTEGAME_DEBUG then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 25-30, warpins: 1 ---
				slot0:setGameState(slot0.STATE_SHOW)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 31-31, warpins: 3 ---
		return
		--- END OF BLOCK #1 ---



	end

	if slot0.roundTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-24, warpins: 1 ---
		slot0.roundTimer:Reset(slot1, 1, -1)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 25-31, warpins: 1 ---
		slot0.roundTimer = Timer.New(slot1, 1, -1)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 32-37, warpins: 2 ---
	slot0.roundTimer:Start()

	return
	--- END OF BLOCK #1 ---



end

function slot0.clearTimer(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.remainTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-9, warpins: 1 ---
		slot0.remainTimer:Stop()

		slot0.remainTimer = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-12, warpins: 2 ---
	if slot0.roundTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-18, warpins: 1 ---
		slot0.roundTimer:Stop()

		slot0.roundTimer = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 19-19, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

function slot0.OnSendMiniGameOPDone(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot2 = slot1.argList

	if slot1.cmd == MiniGameOPCommand.CMD_COMPLETE and slot2[1] == 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-23, warpins: 1 ---
		slot0:SendOperator(MiniGameOPCommand.CMD_SPECIAL_GAME, {
			slot0:GetMGData():GetSimpleValue("shrineGameId"),
			1
		})
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 24-24, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.checkHelp(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	if PlayerPrefs.GetInt("QTEGameGuide", 0) == 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-18, warpins: 1 ---
		triggerButton(slot0.ruleBtn)
		PlayerPrefs.SetInt("QTEGameGuide", 1)
		PlayerPrefs.Save()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 19-19, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.willExit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-38, warpins: 1 ---
	slot0:clearTimer()
	pg.UIMgr.GetInstance():UnblurPanel(slot0.endUI, slot0._tf)
	pg.UIMgr.GetInstance():UnOverlayPanel(slot0.keyBar, slot0.content)

	slot0.xgm = nil
	slot0.xgmSpine = nil
	slot0.xgmSklGraphic = nil
	slot0.guinu = nil
	slot0.guinuSpine = nil
	slot0.guinuSklGraphic = nil

	slot0.autoLoader:Clear()

	return
	--- END OF BLOCK #0 ---



end

return slot0
