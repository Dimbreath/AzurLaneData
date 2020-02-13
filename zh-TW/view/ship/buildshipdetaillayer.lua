slot0 = class("BuildShipDetailLayer", import("..base.BaseUI"))
slot1 = 10
slot2 = 2
slot3 = 1
slot4 = {
	"resources/1",
	"resources/2",
	"resources/3",
	"resources/1"
}

function slot0.getUIName(slot0)
	return "BuildShipDetailUI1"
end

function slot0.setItems(slot0, slot1)
	slot0.itemVO = slot1[ITEM_ID_EQUIP_QUICK_FINISH] or {
		count = 0,
		id = ITEM_ID_EQUIP_QUICK_FINISH
	}
end

function slot0.setWorkCount(slot0, slot1)
	slot0.workCount = slot1
end

function slot0.setBuildSpeedUpRemind(slot0, slot1)
	slot0.isStopSpeedUpRemind = slot1
end

slot0.MODEL_INDEX = 2

function slot0.setProjectList(slot0, slot1)
	slot0.projectList = slot1
	slot0.MODEL = (slot0.MODEL_INDEX < #slot0.projectList and slot1) or slot2
end

function slot0.init(slot0)
	slot0.UIMgr = pg.UIMgr.GetInstance()
	slot0.multLineTF = slot0:findTF("list_mult_line")
	slot0.multLineContain = slot0:findTF("list_mult_line/content")
	slot0.multLineTpl = slot0:findTF("project_tpl", slot0.multLineContain)
	slot0.multList = UIItemList.New(slot0.multLineContain, slot0.multLineTpl)
	slot0.singleLineTF = slot0:findTF("list_single_line")
	slot0.singleLineContain = slot0:findTF("list_single_line/content")
	slot0.singleLineTpl = slot0:findTF("project_tpl", slot0.singleLineContain)
	slot0.singleList = UIItemList.New(slot0.singleLineContain, slot0.singleLineTpl)
	slot0.listCountTF = slot0:findTF("title/value")
	slot0.quickCount = slot0:findTF("quick_count")
	slot0.quickCountTF = slot0:findTF("quick_count/value")
	slot0.noneBg = slot0:findTF("none_bg")
	slot0.allLaunch = slot0:findTF("all_launch")
	slot0.aniBgTF = slot0:findTF("aniBg")
	slot0.canvasgroup = GetOrAddComponent(slot0._tf, typeof(CanvasGroup))
end

function slot0.updatePlayer(slot0, slot1)
	slot0._player = slot1
end

function slot0.didEnter(slot0)
	slot0.projectTFs = {}

	slot0.multList:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot2.gameObject.name = "project_" .. slot1 + 1
			slot0.projectTFs[slot1 + 1] = slot2

			slot0:updateProject(slot1 + 1, slot0.projectList[slot1 + 1])
		end
	end)
	slot0.singleList:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot2.gameObject.name = "project_" .. slot1 + 1
			slot0.projectTFs[slot1 + 1] = slot2

			slot0:updateProject(slot1 + 1, slot0.projectList[slot1 + 1])
		end
	end)
	slot0:initProjectList()
	slot0:updateItem()
	slot0:updateListCount()
	slot0.aniBgTF.transform:SetParent(GameObject.Find("Overlay/UIOverlay").transform, false)
	onButton(slot0, slot0.allLaunch, function ()
		if slot0:getNeedCount() > 0 and not slot0.isStopSpeedUpRemind then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				showStopRemind = true,
				content = i18n("ship_buildShipScene_quest_quickFinish", slot0, (slot0.itemVO.count == 0 and COLOR_RED) or COLOR_GREEN, slot0.itemVO.count),
				stopRamindContent = i18n("common_dont_remind_dur_login"),
				onYes = function ()
					slot0:emit(BuildShipDetailMediator.LAUNCH_ALL, slot1.stopRemindToggle.isOn)
				end
			})

			return
		end

		slot0:emit(BuildShipDetailMediator.LAUNCH_ALL)
	end, SFX_UI_BUILDING_FASTBUILDING)
	onButton(slot0, slot0.quickCount, function ()
		shoppingBatch(61009, {
			id = pg.shop_template[61009].effect_args[1]
		}, 9, "build_ship_quickly_buy_tool")
	end)
end

function slot0.onBackPressed(slot0)
	if slot0.isPlayAnim then
		return
	end

	slot0:emit(slot0.ON_BACK_PRESSED, true)
end

function slot0.getNeedCount(slot0)
	slot1 = 0

	for slot5, slot6 in ipairs(slot0.projectList) do
		if slot6.state ~= BuildShip.FINISH then
			slot1 = slot1 + 1
		end
	end

	return slot1
end

function slot0.updateListCount(slot0)
	setText(slot0.listCountTF, slot0.workCount)
end

function slot0.updateItem(slot0)
	setText(slot0.quickCountTF, slot0.itemVO.count)
end

function slot0.initProjectList(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-7, warpins: 2 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 8-17, warpins: 0 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 18-23, warpins: 1 ---
	slot1 = pairs

	if not slot0.buildTimers then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-5, warpins: 1 ---
		slot2 = {}
		--- END OF BLOCK #0 ---



	end

	for slot4, slot5 in slot1(slot2) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-15, warpins: 1 ---
		pg.TimeMgr.GetInstance():RemoveTimer(slot5)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 16-17, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	slot0.buildTimers = {}
	slot1 = (slot0.MODEL == slot0 and #slot0.projectList) or 0

	setActive(slot0.multLineTF, ((slot0.MODEL == slot0 and #slot0.projectList) or 0) > 0)
	setActive(slot0.singleLineTF, ((slot0.MODEL == ((slot0.MODEL == slot0 and #slot0.projectList) or 0) and #slot0.projectList) or 0) > 0)
	slot0.multList:align((slot0.MODEL == slot0 and #slot0.projectList) or 0)
	slot0.singleList:align((slot0.MODEL == ((slot0.MODEL == slot0 and #slot0.projectList) or 0) and #slot0.projectList) or 0)
	setActive(slot0.noneBg, #slot0.projectList <= 0)

	return

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #4 24-27, warpins: 1 ---
	if not #slot0.projectList then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 28-28, warpins: 2 ---
		slot1 = 0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 29-32, warpins: 2 ---
	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #6 33-36, warpins: 1 ---
	if not #slot0.projectList then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 37-37, warpins: 2 ---
		slot2 = 0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 38-42, warpins: 2 ---
	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #8 43-44, warpins: 1 ---
	slot5 = false

	if false then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 45-45, warpins: 1 ---
		slot5 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 46-51, warpins: 2 ---
	--- END OF BLOCK #9 ---

	FLOW; TARGET BLOCK #11



	-- Decompilation error in this vicinity:
	--- BLOCK #10 52-53, warpins: 1 ---
	slot5 = false

	if false then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 54-54, warpins: 1 ---
		slot5 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #10 ---

	FLOW; TARGET BLOCK #11



	-- Decompilation error in this vicinity:
	--- BLOCK #11 55-72, warpins: 2 ---
	--- END OF BLOCK #11 ---

	FLOW; TARGET BLOCK #13



	-- Decompilation error in this vicinity:
	--- BLOCK #12 73-74, warpins: 1 ---
	slot5 = false

	if false then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 75-75, warpins: 1 ---
		slot5 = true
		--- END OF BLOCK #0 ---



	end
	--- END OF BLOCK #12 ---

	FLOW; TARGET BLOCK #13



	-- Decompilation error in this vicinity:
	--- BLOCK #13 76-77, warpins: 2 ---
	--- END OF BLOCK #13 ---



end

function slot0.initMultLine(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot0.multList:align(#slot0.projectList)

	return
	--- END OF BLOCK #0 ---



end

function slot0.initSingleLine(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot0.singleList:align(#slot0.projectList)

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateProject(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	if IsNil(slot0.projectTFs[slot1]) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-8, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-34, warpins: 1 ---
	slot5 = slot0:findTF("frame/finished", slot3)

	setActive(slot6, false)

	slot7 = setActive
	slot8 = slot0:findTF("frame/buiding", slot3)

	if slot2.state ~= BuildShip.ACTIVE then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 35-36, warpins: 1 ---
		slot9 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 37-37, warpins: 1 ---
		slot9 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 38-45, warpins: 2 ---
	slot7(slot8, slot9)

	slot7 = setActive
	slot8 = slot5

	if slot2.state ~= BuildShip.FINISH then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 46-47, warpins: 1 ---
		slot9 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 48-48, warpins: 1 ---
		slot9 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 49-58, warpins: 2 ---
	slot7(slot8, slot9)

	slot7 = slot3:GetComponent("CanvasGroup")

	if slot2.state == BuildShip.INACTIVE then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 59-60, warpins: 1 ---
		slot8 = 0.6
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 61-61, warpins: 1 ---
		slot8 = 1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 62-79, warpins: 2 ---
	slot7.alpha = slot8
	slot9 = tonumber(pg.ship_data_create_material[slot2.type].ship_icon)

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 80-88, warpins: 0 ---
	for slot14 = 0, slot0:findTF("ship_modal", slot4).childCount - 1, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 80-88, warpins: 2 ---
		setActive(slot10:GetChild(slot14), false)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 89-93, warpins: 1 ---
	if slot2.state == BuildShip.ACTIVE then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 94-102, warpins: 1 ---
		if not slot0:findTF("shipModelBuliding" .. slot9, slot10) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 103-114, warpins: 1 ---
			PoolMgr.GetInstance():GetUI("shipModelBuliding" .. slot9, true, function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-33, warpins: 1 ---
				slot0.transform:SetParent(slot0, false)

				slot0.transform.localPosition = Vector3(1, 1, 1)
				slot0.transform.localScale = Vector3(1, 1, 1)

				slot0.transform:SetAsFirstSibling()

				slot0.name = "shipModelBuliding" .. 

				setActive(slot0, true)

				return
				--- END OF BLOCK #0 ---



			end)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 115-118, warpins: 1 ---
			setActive(slot11, true)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 119-139, warpins: 2 ---
		slot12 = slot0:findTF("timer/Text", slot4)

		onButton(slot0, slot0:findTF("quick_btn", slot4), function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-6, warpins: 1 ---
			slot0, slot1, slot2 = BuildShip.canQuickBuildShip(BuildShip.canQuickBuildShip)

			if not slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 7-8, warpins: 1 ---
				if slot2 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 9-17, warpins: 1 ---
					GoShoppingMsgBox(i18n("switch_to_shop_tip_1"), ChargeScene.TYPE_ITEM, slot2)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 18-25, warpins: 1 ---
					pg.TipsMgr.GetInstance():ShowTips(slot1)
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 26-26, warpins: 2 ---
				return
				--- END OF BLOCK #1 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 27-30, warpins: 1 ---
			if slot1.isStopSpeedUpRemind then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 31-38, warpins: 1 ---
				slot1:emit(BuildShipDetailMediator.ON_QUICK, slot0)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 39-53, warpins: 1 ---
				slot5 = pg.MsgboxMgr.GetInstance()
				slot4 = pg.MsgboxMgr.GetInstance().ShowMsgBox
				slot6 = {
					showStopRemind = true
				}
				slot7 = i18n
				slot8 = "ship_buildShipScene_quest_quickFinish"
				slot9 = 1

				if slot1.itemVO.count ~= 0 or not COLOR_RED then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 57-57, warpins: 2 ---
					slot10 = COLOR_GREEN
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 58-70, warpins: 2 ---
				slot6.content = slot7(slot8, slot9, slot10, slot1.itemVO.count)
				slot6.stopRamindContent = i18n("dont_remind_session")

				function slot6.onYes()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-11, warpins: 1 ---
					slot0:emit(BuildShipDetailMediator.ON_QUICK, slot0, slot2.stopRemindToggle.isOn)

					return
					--- END OF BLOCK #0 ---



				end

				slot4(slot5, slot6)
				--- END OF BLOCK #1 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 71-71, warpins: 2 ---
			return
			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 72-72, warpins: 2 ---
			--- END OF BLOCK #3 ---



		end, SFX_UI_BUILDING_FASTBUILDING)

		function slot13()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-25, warpins: 1 ---
			pg.TimeMgr.GetInstance():RemoveTimer(slot0.buildTimers[pg.TimeMgr.GetInstance()])

			pg.TimeMgr.GetInstance().RemoveTimer.buildTimers[pg.TimeMgr.GetInstance()] = nil

			setActive(nil, false)
			setActive(pg.TimeMgr.GetInstance(), true)

			return
			--- END OF BLOCK #0 ---



		end

		function slot14(slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-13, warpins: 1 ---
			setText(slot0, pg.TimeMgr.GetInstance():DescCDTime(slot0))

			return
			--- END OF BLOCK #0 ---



		end

		if slot0.buildTimers[slot1] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 140-151, warpins: 1 ---
			pg.TimeMgr.GetInstance():RemoveTimer(slot0.buildTimers[slot1])

			slot0.buildTimers[slot1] = nil
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 152-167, warpins: 2 ---
		slot0.buildTimers[slot1] = pg.TimeMgr.GetInstance():AddTimer("timer" .. slot1, 0, 1, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			if slot0:getLeftTime() <= 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 8-10, warpins: 1 ---
				slot1()
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-13, warpins: 1 ---
				slot2(slot0)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 14-14, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end)

		return
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 168-172, warpins: 1 ---
	if slot2.state == BuildShip.FINISH then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 173-203, warpins: 1 ---
		slot0:setSpriteTo(slot0[tonumber(slot8.ship_icon)], slot0:findTF("ship_modal", slot5), false)
		onButton(slot0, slot11, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-8, warpins: 1 ---
			slot0:emit(BuildShipDetailMediator.ON_LAUNCHED, slot0)

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)
		onButton(slot0, slot3, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-4, warpins: 1 ---
			triggerButton(triggerButton)

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 204-208, warpins: 1 ---
		if slot2.state == BuildShip.INACTIVE then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 209-220, warpins: 1 ---
			setActive(slot6, true)
			setActive(slot4, false)
			setActive(slot5, false)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end
	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 221-222, warpins: 4 ---
	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 223-223, warpins: 2 ---
	--- END OF BLOCK #9 ---



end

function slot0.playGetShipAnimate(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	slot0.canvasgroup.blocksRaycasts = false
	slot0.isPlayAnim = true

	function slot4()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-27, warpins: 1 ---
		setActive(slot0.buildAni, false)
		setParent(slot0.buildAni, slot0._tf, false)

		setParent.isPlayAnim = false

		setParent:stopCV()

		setParent.stopCV.canvasgroup.blocksRaycasts = true

		if setParent.stopCV.canvasgroup.aniTimer then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 28-35, warpins: 1 ---
			slot0.aniTimer:Stop()

			slot0.aniTimer.Stop.aniTimer = nil
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 36-39, warpins: 2 ---
		if slot0.buildAni then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 40-46, warpins: 1 ---
			Destroy(slot0.buildAni)

			Destroy.buildAni = nil
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 47-49, warpins: 2 ---
		if slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 50-52, warpins: 1 ---
			slot1()

			slot1 = nil
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 53-53, warpins: 2 ---
		return
		--- END OF BLOCK #3 ---



	end

	function slot5()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-33, warpins: 1 ---
		slot0.aniTimer = Timer.New(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-8, warpins: 1 ---
			setActive(slot0.buildAni, false)
			slot0.buildAni()

			return
			--- END OF BLOCK #0 ---



		end, 4.5)

		slot0.aniTimer:Start()
		setParent(slot0.buildAni, GameObject.Find("Overlay/UIOverlay"), false)
		setActive(slot0.buildAni, true)

		if slot0.buildAni and slot2.build_voice ~= "" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 38-43, warpins: 1 ---
			slot0:playCV(slot2.build_voice)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 44-44, warpins: 3 ---
		return
		--- END OF BLOCK #1 ---



	end

	slot7 = slot0
	slot6 = slot0.findTF

	if not pg.ship_data_create_material[slot2].build_anim then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-16, warpins: 1 ---
		slot8 = "Building"
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 17-21, warpins: 2 ---
	if slot6(slot7, slot8 .. "(Clone)") then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 22-28, warpins: 1 ---
		slot0.buildAni = go(slot6)

		removeOnButton(slot0.buildAni)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 29-31, warpins: 2 ---
	if not slot0.buildAni and not slot0.onLoading then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 35-41, warpins: 1 ---
		slot0.onLoading = true
		slot7 = LoadAndInstantiateAsync
		slot8 = "ui"

		if not slot3.build_anim then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 42-42, warpins: 1 ---
			slot9 = "Building"
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 43-45, warpins: 2 ---
		slot7(slot8, slot9, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-4, warpins: 1 ---
			if slot0.exited then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-11, warpins: 1 ---
				Destory(slot0)

				slot0.buildAni = nil
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 12-42, warpins: 1 ---
				slot0.onLoading = false

				slot0:SetActive(false)

				slot0.buildAni = slot0

				slot0.buildAni.transform:SetParent(slot0._tf, false)
				setActive(slot0.buildAni, false)
				onButton(slot0, slot0.buildAni, function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-3, warpins: 1 ---
					slot0()

					return
					--- END OF BLOCK #0 ---



				end)
				slot0()
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 43-43, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end)
		--- END OF BLOCK #1 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 46-48, warpins: 2 ---
		if slot0.onLoading then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 49-49, warpins: 1 ---
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 50-56, warpins: 1 ---
			slot5()
			onButton(slot0, slot0.buildAni, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-3, warpins: 1 ---
				slot0()

				return
				--- END OF BLOCK #0 ---



			end)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 57-58, warpins: 3 ---
	return
	--- END OF BLOCK #3 ---



end

function slot0.willExit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-14, warpins: 0 ---
	for slot4, slot5 in pairs(slot0.buildTimers) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-12, warpins: 1 ---
		pg.TimeMgr.GetInstance():RemoveTimer(slot5)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 13-14, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 15-17, warpins: 1 ---
	if slot0.aniBgTF then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 18-21, warpins: 1 ---
		SetParent(slot0.aniBgTF, slot0._tf)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 22-24, warpins: 2 ---
	if slot0.aniTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 25-30, warpins: 1 ---
		slot0.aniTimer:Stop()

		slot0.aniTimer = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 31-38, warpins: 2 ---
	slot0.buildTimers = nil

	slot0:stopCV()

	if slot0.loadedCVBankName then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 39-45, warpins: 1 ---
		pg.CriMgr.UnloadCVBank(slot0.loadedCVBankName)

		slot0.loadedCVBankName = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 46-59, warpins: 2 ---
	slot0.onLoading = false

	slot0.multList:each(function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-11, warpins: 1 ---
		eachChild(slot0:findTF("frame/buiding/ship_modal", slot1), function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-9, warpins: 1 ---
			PoolMgr.GetInstance():ReturnUI(slot0.name, slot0)

			return
			--- END OF BLOCK #0 ---



		end)

		return
		--- END OF BLOCK #0 ---



	end)
	slot0.singleList:each(function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-11, warpins: 1 ---
		eachChild(slot0:findTF("frame/buiding/ship_modal", slot1), function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-9, warpins: 1 ---
			PoolMgr.GetInstance():ReturnUI(slot0.name, slot0)

			return
			--- END OF BLOCK #0 ---



		end)

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #5 ---



end

function slot0.playCV(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	voiceContent = "event:/cv/build/" .. slot1

	if voiceContent then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-11, warpins: 1 ---
		function slot2()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-10, warpins: 1 ---
			slot0:stopCV()

			slot0.stopCV._currentVoice = playSoundEffect(voiceContent)

			return
			--- END OF BLOCK #0 ---



		end

		if slot0.loadedCVBankName then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 12-14, warpins: 1 ---
			slot2()
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-24, warpins: 1 ---
			pg.CriMgr:LoadCV("build", function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-9, warpins: 1 ---
				slot0 = pg.CriMgr.GetCVBankName(pg.CriMgr.GetCVBankName)

				if pg.CriMgr.GetCVBankName.exited then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 10-15, warpins: 1 ---
					pg.CriMgr.UnloadCVBank(slot0)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 16-21, warpins: 1 ---
					slot2()

					if slot2._currentVoice then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 22-23, warpins: 1 ---
						slot1.loadedCVBankName = slot0
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 24-24, warpins: 3 ---
				return
				--- END OF BLOCK #1 ---



			end)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 25-25, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 26-27, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.stopCV(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0._currentVoice then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-8, warpins: 1 ---
		slot0._currentVoice:Stop(true)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-11, warpins: 2 ---
	slot0._currentVoice = nil

	return
	--- END OF BLOCK #1 ---



end

return slot0
