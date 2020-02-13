slot0 = class("HoloLivePtPage", import("...base.BaseActivityPage"))

function slot0.OnInit(slot0)
	slot0.taskProxy = getProxy(TaskProxy)
	slot0.activityProxy = getProxy(ActivityProxy)
	slot0.circleTF = slot0:findTF("CircleImg/Circle")
	slot0.startBtn = slot0:findTF("CircleImg/StartBtn")
	slot0.helpBtn1 = slot0:findTF("HelpBtn")
	slot0.taskPanel = slot0:findTF("AD")

	onButton(slot0, slot0.startBtn, function ()
		if slot0.isTurning then
			return
		end

		slot0:emit(ActivityMediator.EVENT_OPERATION, {
			cmd = 1,
			activity_id = slot0.activity.id
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.helpBtn1, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.hololive_goodmorning.tip
		})
	end, SFX_PANEL)
end

function slot0.OnDataSetting(slot0)
	slot0.activityStartTime = slot0.activity.data1
	slot0.isGotFinalAward = slot0.activity.data2
	slot0.progressStep = slot0.activity.data3
	slot0.configID = slot0.activity:getConfig("config_id")
	slot0.configData = pg.activity_event_turning[slot0.configID]
	slot0.groupNum = slot0.configData.total_num
	slot0.maxday = math.clamp(slot1, 1, slot0.configData.total_num)

	print("init data on setting:", tostring(slot0.maxday), tostring(slot0.isGotFinalAward), tostring(slot0.progressStep), tostring(slot0.activity.data4))
end

function slot0.OnFirstFlush(slot0)
	slot0.curIndex = slot0.activity.data4

	if slot0.curIndex ~= 0 then
		slot0.curShipGroupID = slot0.configData.groupid_list[slot0.curIndex]
		slot0.curTaskIDList = slot0.configData.task_table[slot0.curIndex]
		slot0.curStoryID = slot0.configData.story_list[slot0.curIndex]
	end
end

function slot0.OnUpdateFlush(slot0)
	if slot0.curIndex == 0 and slot0.activity.data4 > 0 then
		slot0.curIndex = slot0.activity.data4
		slot0.curShipGroupID = slot0.configData.groupid_list[slot0.curIndex]
		slot0.curTaskIDList = slot0.configData.task_table[slot0.curIndex]
		slot0.curStoryID = slot0.configData.story_list[slot0.curIndex]

		print("before rotate", tostring(slot0.curShipGroupID), tostring(slot0.curIndex), tostring(slot0.curStoryID))
		slot0:rotate()
	elseif slot0.activity.data4 > 0 then
		if slot0.activity.data4 <= slot0.groupNum then
			slot0.curIndex = slot0.activity.data4
			slot0.curShipGroupID = slot0.configData.groupid_list[slot0.curIndex]
			slot0.curTaskIDList = slot0.configData.task_table[slot0.curIndex]
			slot0.curStoryID = slot0.configData.story_list[slot0.curIndex]

			print("direct update", tostring(slot0.curShipGroupID), tostring(slot0.curIndex), tostring(slot0.curStoryID))
			slot0:updateTaskPanel()
		end
	elseif slot0.activity.data4 == 0 then
		slot0.curIndex = 0
		slot0.curShipGroupID = nil
		slot0.curTaskIDList = nil
		slot0.curStoryID = nil

		setActive(slot0.taskPanel, false)

		if slot0.groupNum < slot0.progressStep then
			slot0:lockTurnTable()
		end
	end

	slot0:checkAward()
end

function slot0.onDestroy(slot0)
	LeanTween.cancel(go(slot0.circleTF))
end

function slot0.rotate(slot0)
	slot0.isTurning = true

	LeanTween.value(go(slot0.circleTF), 0, slot8, 4):setEase(LeanTweenType.easeInOutCirc):setOnUpdate(System.Action_float(function (slot0)
		slot0.circleTF.localEulerAngles = Vector3(0, 0, -slot0)
	end)):setOnComplete(System.Action(function ()
		pg.StoryMgr.GetInstance():Play(slot0.curStoryID, function ()
			slot0:updateTaskPanel()
		end, true, true, true)

		pg.StoryMgr.GetInstance().isTurning = false
	end))
end

function slot0.updateTaskPanel(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-94, warpins: 1 ---
	slot0.charImg = slot0:findTF("CharImg", slot0.taskPanel)
	slot0.nameImg = slot0:findTF("NameImg", slot0.charImg)
	slot0.dayText = slot0:findTF("ProgressImg/day", slot0.taskPanel)
	slot0.taskItemTpl = slot0:findTF("item", slot0.taskPanel)
	slot0.taskItemContainer = slot0:findTF("items", slot0.taskPanel)
	slot0.backBtn = slot0:findTF("BackBtn", slot0.taskPanel)
	slot0.countText = slot0:findTF("RedPoint/Text", slot0.backBtn)
	slot0.helpBtn2 = slot0:findTF("HelpBtn", slot0.taskPanel)

	LoadSpriteAtlasAsync("ui/activityuipage/hololivemorningpage", slot1, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		if slot0.curShipGroupID == 1050001 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-19, warpins: 1 ---
			rtf(slot0.charImg).sizeDelta = Vector2(1058, 714)

			setImageSprite(slot0.charImg, slot0)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 20-23, warpins: 1 ---
			if slot0.curShipGroupID == 1050003 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 24-38, warpins: 1 ---
				rtf(slot0.charImg).sizeDelta = Vector2(1122, 714)

				setImageSprite(slot0.charImg, slot0)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 39-42, warpins: 1 ---
				if slot0.curShipGroupID == 1050005 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 43-57, warpins: 1 ---
					rtf(slot0.charImg).sizeDelta = Vector2(1044, 714)

					setImageSprite(slot0.charImg, slot0)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 58-63, warpins: 1 ---
					setImageSprite(slot0.charImg, slot0, true)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 64-64, warpins: 4 ---
		return
		--- END OF BLOCK #1 ---



	end)
	LoadSpriteAtlasAsync("ui/activityuipage/hololivemorningpage", slot2, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		setImageSprite(slot0.nameImg, slot0, true)

		return
		--- END OF BLOCK #0 ---



	end)
	setText(slot0.dayText, slot0.progressStep .. "/" .. slot0.configData.total_num)

	slot0.taskUIItemList = UIItemList.New(slot0.taskItemContainer, slot0.taskItemTpl)

	slot0.taskUIItemList:make(function (slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		if slot0 == UIItemList.EventUpdate then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-22, warpins: 1 ---
			updateDrop(slot0:findTF("item", slot2), slot8)
			onButton(slot0, slot0.findTF("item", slot2), function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-8, warpins: 1 ---
				slot0:emit(BaseUI.ON_DROP, slot0)

				return
				--- END OF BLOCK #0 ---



			end, SFX_PANEL)
			setText(slot0:findTF("description", slot2), slot0.taskProxy:getTaskById(slot0.curTaskIDList[slot1 + 1]) or slot0.taskProxy:getFinishTaskById(slot5):getConfig("desc") .. "(" .. slot9 .. "/" .. slot0.taskProxy.getTaskById(slot0.curTaskIDList[slot1 + 1]) or slot0.taskProxy.getFinishTaskById(slot5):getConfig("target_num") .. ")")
			setSlider(slot0:findTF("progress", slot2), 0, slot10, slot9)
			setActive(slot0:findTF("go_btn", slot2), slot0.taskProxy.getTaskById(slot0.curTaskIDList[slot1 + 1]) or slot0.taskProxy.getFinishTaskById(slot5):getTaskStatus() == 0)
			setActive(slot0:findTF("get_btn", slot2), slot14 == 1)
			setActive(slot0:findTF("got_btn", slot2), slot14 == 2)
			onButton(slot0, slot11, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-8, warpins: 1 ---
				slot0:emit(ActivityMediator.ON_TASK_GO, slot0)

				return
				--- END OF BLOCK #0 ---



			end, SFX_PANEL)
			onButton(slot0, slot0.findTF("get_btn", slot2), function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-8, warpins: 1 ---
				slot0:emit(ActivityMediator.ON_TASK_SUBMIT, slot0)

				return
				--- END OF BLOCK #0 ---



			end, SFX_PANEL)
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 29-111, warpins: 2 ---
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 115-119, warpins: 2 ---
			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 123-127, warpins: 2 ---
			--- END OF BLOCK #3 ---

			FLOW; TARGET BLOCK #4



			-- Decompilation error in this vicinity:
			--- BLOCK #4 131-144, warpins: 2 ---
			--- END OF BLOCK #4 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 145-145, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end)
	slot0.taskUIItemList:align(#slot0.curTaskIDList)

	slot3 = true

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 95-115, warpins: 0 ---
	for slot7, slot8 in ipairs(slot0.curTaskIDList) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 107-111, warpins: 2 ---
		if slot0.taskProxy:getTaskById(slot8) or slot0.taskProxy:getFinishTaskById(slot8):getTaskStatus() ~= 2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 112-113, warpins: 1 ---
			slot3 = false

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 114-114, warpins: 1 ---
			break
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 114-115, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 116-117, warpins: 2 ---
	if slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 118-137, warpins: 1 ---
		print("story", tostring(pg.activity_event_turning[slot0.activity:getConfig("config_id")].story_task[slot0.progressStep][1]))

		if pg.activity_event_turning[slot0.activity.getConfig("config_id")].story_task[slot0.progressStep][1] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 138-146, warpins: 1 ---
			pg.StoryMgr.GetInstance():Play(slot6, nil)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 147-150, warpins: 3 ---
	if slot0.maxday <= slot0.progressStep then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 151-151, warpins: 1 ---
		slot3 = false
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 152-157, warpins: 2 ---
	setActive(slot0.backBtn, slot3)

	if slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 158-165, warpins: 1 ---
		setText(slot0.countText, tostring(slot0.maxday - slot0.progressStep))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 166-183, warpins: 2 ---
	setActive(slot0.taskPanel, true)
	onButton(slot0, slot0.backBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:resetIndex()

		return
		--- END OF BLOCK #0 ---



	end, SFX_CANCEL)
	onButton(slot0, slot0.helpBtn2, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-16, warpins: 1 ---
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.hololive_goodmorning.tip
		})

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)

	return
	--- END OF BLOCK #5 ---



end

function slot0.checkAward(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.isGotFinalAward == 0 and slot0.progressStep == slot0.groupNum then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-10, warpins: 1 ---
		if slot0.curTaskIDList then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 11-15, warpins: 1 ---
			slot1 = true

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 16-36, warpins: 0 ---
			for slot5, slot6 in ipairs(slot0.curTaskIDList) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 28-32, warpins: 2 ---
				if slot0.taskProxy:getTaskById(slot6) or slot0.taskProxy:getFinishTaskById(slot6):getTaskStatus() ~= 2 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 33-34, warpins: 1 ---
					slot1 = false

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 35-35, warpins: 1 ---
					break
					--- END OF BLOCK #1 ---



				end
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 35-36, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 37-38, warpins: 2 ---
			if slot1 and slot0.activity.data4 ~= 0 and slot0.activity.data3 == slot0.groupNum then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 48-57, warpins: 1 ---
				slot0:emit(ActivityMediator.EVENT_OPERATION, {
					cmd = 2,
					activity_id = slot0.activity.id
				})
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #2 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 58-66, warpins: 1 ---
			slot0:emit(ActivityMediator.EVENT_OPERATION, {
				cmd = 1,
				activity_id = slot0.activity.id
			})
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 67-67, warpins: 7 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.resetIndex(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot0:emit(ActivityMediator.EVENT_OPERATION, {
		cmd = 2,
		activity_id = slot0.activity.id
	})

	return
	--- END OF BLOCK #0 ---



end

function slot0.lockTurnTable(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-28, warpins: 1 ---
	slot0.finalTip = slot0:findTF("FinalTip")
	slot0.finalLock = slot0:findTF("CircleImg/FinalLock")

	setActive(slot0.finalTip, true)
	setActive(slot0.finalLock, true)

	slot0.tipImg = slot0:findTF("TipImg")

	setActive(slot0.tipImg, false)

	return
	--- END OF BLOCK #0 ---



end

return slot0
