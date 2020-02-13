slot0 = class("TrainingCampScene", import("..base.BaseUI"))

function slot0.getUIName(slot0)
	return "TrainingCampUI"
end

function slot0.setActivity(slot0, slot1)
	slot0.activity = slot1
end

function slot0.init(slot0)
	slot0.togglesTF = slot0:findTF("bg/frame/toggles")
	slot0.uilist = UIItemList.New(slot0:findTF("bg/frame/main/scrollrect/content"), slot0:findTF("bg/frame/main/scrollrect/content/task"))
	slot0.phaseTF = slot0:findTF("bg/frame/main/progress")
	slot0.frameTF = slot0:findTF("bg/frame")
	slot0.awardMsg = slot0:findTF("bg/awards")

	slot0:closeMsgBox()
end

function slot0.didEnter(slot0)
	slot0:initToggles()
	onButton(slot0, slot0:findTF("top/left_top/back_button"), function ()
		slot0:emit(slot1.ON_BACK)
	end, SFX_PANEL)
	onButton(slot0, slot0:findTF("top/help"), function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.newplayer_help_tip.tip
		})
	end, SFX_PANEL)
end

function slot0.initToggles(slot0)
	slot0.toggles = {
		slot0:findTF("phase1", slot0.togglesTF),
		slot0:findTF("phase2", slot0.togglesTF),
		slot0:findTF("phase3", slot0.togglesTF)
	}

	slot0:updatePhase()

	for slot4, slot5 in pairs(slot0.toggles) do
		onToggle(slot0, slot5, function (slot0)
			if slot0 then
				if slot0.phaseId <  then
					pg.TipsMgr.GetInstance():ShowTips(i18n("newplayer_notice_7"))
					triggerToggle(slot0.toggles[slot0.contextData.pageId], true)
				else
					slot0:switchPage(slot0.switchPage)
				end
			end
		end, SFX_PANEL)
	end

	triggerToggle(slot0.toggles[slot0.phaseId], true)
end

function slot0.updatePhase(slot0)
	slot1 = 1
	slot2 = slot0.activity:getConfig("config_data")[3]
	slot3 = getProxy(TaskProxy)

	function slot4(slot0)
		if slot0 > 1 then
			return slot1:getFinishTaskById(slot0[slot0 - 1][2]) ~= nil
		end
	end

	for slot8 = #slot0.toggles, 1, -1 do
		if _.all(slot2[slot8][1], function (slot0)
			return (slot0:getTaskById(slot0) or slot0:getFinishTaskById(slot0)) ~= nil
		end) or slot4(slot8) then
			slot1 = slot8

			break
		end
	end

	slot0.phaseId = slot1 or 1

	for slot8, slot9 in ipairs(slot0.toggles) do
		setActive(slot9:Find("disable"), slot0.phaseId < slot8)
	end
end

function slot0.updateTask(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-24, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 34-38, warpins: 3 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 42-46, warpins: 2 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 57-59, warpins: 4 ---
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 76-77, warpins: 4 ---
	slot5 = slot2:Find("got")
	slot6 = slot2:Find("go")
	slot7 = getProxy(TaskProxy)
	slot9 = setActive
	slot10 = slot2:Find("get")

	if slot0:getTask(slot3, slot1) and slot8:isFinish() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 30-33, warpins: 1 ---
		slot11 = not slot8:isReceive()
		--- END OF BLOCK #0 ---



	end

	slot9(slot10, slot11)

	slot9 = setActive
	slot10 = slot5

	if slot8 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 39-41, warpins: 1 ---
		slot11 = slot8:isReceive()
		--- END OF BLOCK #0 ---



	end

	slot9(slot10, slot11)

	slot9 = setActive
	slot10 = slot6

	if slot8 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 47-48, warpins: 1 ---
		if slot8 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 49-53, warpins: 1 ---
			slot11 = not slot8:isFinish()

			if not slot8.isFinish() then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 54-55, warpins: 0 ---
				slot11 = false
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 56-56, warpins: 1 ---
		slot11 = true
		--- END OF BLOCK #0 ---



	end

	slot9(slot10, slot11)

	if slot8 and slot8:isClientTrigger() and not slot8:isFinish() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 70-75, warpins: 1 ---
		slot0:emit(TrainingCampMediator.ON_UPDATE, slot8)
		--- END OF BLOCK #0 ---



	end

	slot8 = slot8 or Task.New({
		id = slot1
	})

	setText(slot2:Find("title"), slot8 or Task.New():getConfig("desc"))
	updateDrop(slot2:Find("item"), {
		type = slot8 or Task.New():getConfig("award_display")[1][1],
		id = slot8 or Task.New().getConfig("award_display")[1][2],
		count = slot8 or Task.New().getConfig("award_display")[1][3]
	})
	setText(slot2:Find("progress"), math.min(slot8.progress, slot8:getConfig("target_num")) .. "/" .. slot8:getConfig("target_num"))
	onButton(slot0, slot4, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		slot0:emit(TrainingCampMediator.ON_GET, slot0)

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onButton(slot0, slot6, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		slot0:emit(TrainingCampMediator.ON_GO, slot0)

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)

	return

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #5 78-83, warpins: 1 ---
	slot8 = Task.New()
	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 84-145, warpins: 2 ---
	--- END OF BLOCK #6 ---



end

function slot0.switchPage(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-46, warpins: 1 ---
	slot0.contextData.pageId = slot1
	slot2 = getProxy(TaskProxy)

	function slot6(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		if slot0:isReceive() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-8, warpins: 1 ---
			return 0
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-13, warpins: 1 ---
			if slot0:isFinish() then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 14-16, warpins: 1 ---
				return 2
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 17-21, warpins: 1 ---
				if not slot0:isFinish() then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 22-23, warpins: 1 ---
					return 1
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 24-25, warpins: 4 ---
		return -1
		--- END OF BLOCK #1 ---



	end

	table.sort(slot4, function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		if not slot0:getTaskById(slot0) and not slot0:getFinishTaskById(slot0) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-19, warpins: 1 ---
			slot2 = Task.New({
				id = slot0
			})
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 20-26, warpins: 3 ---
		if not slot0:getTaskById(slot1) and not slot0:getFinishTaskById(slot1) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 34-38, warpins: 1 ---
			slot3 = Task.New({
				id = slot1
			})
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 39-46, warpins: 3 ---
		if slot1(slot2) == slot1(slot3) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 47-50, warpins: 1 ---
			if slot2.id >= slot3.id then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 51-52, warpins: 1 ---
				slot6 = false
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 53-53, warpins: 1 ---
				slot6 = true
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 54-55, warpins: 2 ---
			return slot6
			--- END OF BLOCK #1 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 56-57, warpins: 1 ---
			if slot5 >= slot4 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 58-59, warpins: 1 ---
				slot6 = false
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 60-60, warpins: 1 ---
				slot6 = true
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 61-61, warpins: 2 ---
			return slot6
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 62-62, warpins: 2 ---
		return
		--- END OF BLOCK #3 ---



	end)
	slot0.uilist:make(function (slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		if slot0 == UIItemList.EventUpdate then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-13, warpins: 1 ---
			slot0:updateTask(slot1[slot1 + 1], slot2, slot2)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 14-14, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end)
	slot0.uilist:align(#slot0.activity:getConfig("config_data")[3][slot1][1])

	function slot7()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		return _.all(_.all, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			if slot0:getFinishTaskById(slot0) == nil then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 8-9, warpins: 1 ---
				slot1 = false
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 10-10, warpins: 1 ---
				slot1 = true
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 11-11, warpins: 2 ---
			return slot1
			--- END OF BLOCK #1 ---



		end)
		--- END OF BLOCK #0 ---



	end

	function slot8()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		return _.any(_.any, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			if not slot0:getFinishTaskById(slot0) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 8-12, warpins: 1 ---
				slot1 = slot0:getTaskById(slot0)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 13-14, warpins: 2 ---
			if slot1 ~= nil then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 15-16, warpins: 1 ---
				slot2 = false
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 17-17, warpins: 1 ---
				slot2 = true
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 18-18, warpins: 2 ---
			return slot2
			--- END OF BLOCK #2 ---



		end)
		--- END OF BLOCK #0 ---



	end

	slot10 = setActive
	slot11 = slot0.phaseTF:Find("get")

	if slot0:getTask(slot1, slot5) and slot9:isFinish() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 52-55, warpins: 1 ---
		slot12 = not slot9:isReceive()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 56-72, warpins: 3 ---
	slot10(slot11, slot12)
	setActive(slot0.phaseTF:Find("lock"), not slot9)

	slot10 = setActive
	slot11 = slot0.phaseTF:Find("go")

	if slot9 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 73-76, warpins: 1 ---
		slot12 = not slot9:isFinish()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 77-85, warpins: 2 ---
	slot10(slot11, slot12)

	slot10 = setActive
	slot11 = slot0.phaseTF:Find("pass")

	if slot9 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 86-88, warpins: 1 ---
		slot12 = slot9:isReceive()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 89-92, warpins: 2 ---
	slot10(slot11, slot12)

	if slot1 == slot0.phaseId and slot8() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 97-105, warpins: 1 ---
		slot0:emit(TrainingCampMediator.ON_TRIGGER, {
			cmd = 1,
			activity_id = slot0.activity.id
		})
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 106-107, warpins: 3 ---
	if slot9 and slot9:isClientTrigger() and not slot9:isFinish() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 118-123, warpins: 1 ---
		slot0:emit(TrainingCampMediator.ON_UPDATE, slot9)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 124-125, warpins: 4 ---
	if not slot9 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 126-135, warpins: 1 ---
		slot9 = Task.New({
			id = slot5
		})

		if slot7() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 136-144, warpins: 1 ---
			slot0:emit(TrainingCampMediator.ON_TRIGGER, {
				cmd = 2,
				activity_id = slot0.activity.id
			})
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 145-174, warpins: 2 ---
		setText(slot0.phaseTF:Find("slider/label"), i18n("newplayer_notice_" .. slot1))
		_.each(slot4, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			if slot0:getFinishTaskById(slot0) ~= nil then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 8-10, warpins: 1 ---
				slot1 = slot1 + 1
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 11-11, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end)
		setText(slot0.phaseTF:Find("slider/Text"), slot10 .. "/" .. #slot4)
		--- END OF BLOCK #1 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 175-206, warpins: 1 ---
		setText(slot0.phaseTF:Find("slider/label"), slot9:getConfig("desc"))
		setText(slot0.phaseTF:Find("slider/Text"), math.min(slot9.progress, slot9:getConfig("target_num")) .. "/" .. slot9:getConfig("target_num"))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 207-276, warpins: 2 ---
	slot0.phaseTF:Find("slider"):GetComponent(typeof(Slider)).value = slot9.progress / slot9:getConfig("target_num")
	slot0.phaseTF:Find("icon"):GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("ui/trainingcampui_atlas", "icon_" .. slot1)

	setText(slot0.phaseTF:Find("tip"), i18n("newplayer_notice_" .. 3 + slot1))
	onButton(slot0, slot0.phaseTF:Find("get"), function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		if slot0:isSelectable() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-12, warpins: 1 ---
			slot1:openMsgbox(function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-9, warpins: 1 ---
				slot0:emit(TrainingCampMediator.ON_SELECTABLE_GET, slot0.emit, slot0)

				return
				--- END OF BLOCK #0 ---



			end)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-19, warpins: 1 ---
			slot1:emit(TrainingCampMediator.ON_GET, slot1.emit)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 20-20, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end, SFX_PANEL)
	onButton(slot0, slot0.phaseTF:Find("go"), function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		slot0:emit(TrainingCampMediator.ON_GO, slot0)

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)

	return
	--- END OF BLOCK #6 ---



end

function slot0.getTask(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot3 = getProxy(TaskProxy)
	slot4 = nil

	if slot0.phaseId <= slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-13, warpins: 1 ---
		if not slot3:getTaskById(slot2) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-18, warpins: 1 ---
			slot4 = slot3:getFinishTaskById(slot2)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 19-19, warpins: 2 ---
		--- END OF BLOCK #1 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 20-32, warpins: 1 ---
		Task.New({
			id = slot2
		}).progress = Task.New():getConfig("target_num")
		Task.New().submitTime = 1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 33-33, warpins: 2 ---
	return slot4
	--- END OF BLOCK #1 ---



end

function slot0.openMsgbox(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-18, warpins: 1 ---
	setActive(slot0.awardMsg, true)
	setActive(slot0.frameTF, false)

	slot2 = nil

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 19-30, warpins: 0 ---
	for slot7 = 1, slot0.awardMsg:Find("photos").childCount, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-30, warpins: 2 ---
		onToggle(slot0, slot3:GetChild(slot7 - 1), function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-2, warpins: 1 ---
			if slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 3-4, warpins: 1 ---
				slot0 = slot1
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 5-5, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end, SFX_PANEL)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 31-42, warpins: 1 ---
	onButton(slot0, slot0.awardMsg:Find("confirm_btn"), function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-6, warpins: 1 ---
			if slot1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 7-9, warpins: 1 ---
				slot1(slot1)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 10-13, warpins: 2 ---
			slot2:closeMsgBox()
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 14-14, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end, SFX_PANEL)

	return
	--- END OF BLOCK #2 ---



end

function slot0.closeMsgBox(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	setActive(slot0.awardMsg, false)
	setActive(slot0.frameTF, true)

	return
	--- END OF BLOCK #0 ---



end

function slot0.willExit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-1, warpins: 1 ---
	return
	--- END OF BLOCK #0 ---



end

return slot0
