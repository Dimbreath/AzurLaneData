slot0 = class("TechnologyScene", import("..base.BaseUI"))

function slot0.getUIName(slot0)
	return "TechnologyUI"
end

function slot0.setTechnologys(slot0, slot1)
	slot0.technologyVOs = slot1
end

function slot0.setRefreshFlag(slot0, slot1)
	slot0.flag = slot1
end

function slot0.setPlayer(slot0, slot1)
	slot0.player = slot1

	if slot0._resPanel then
		slot0._resPanel:setResources(slot1)
	end
end

function slot0.setTendency(slot0, slot1)
	slot0.tendency = slot1

	setText(slot0:findTF("Text", slot0.tendencyBtn), i18n("tech_change_version_mark"))
	setImageSprite(slot0:findTF("version", slot0.tendencyBtn), GetSpriteFromAtlas("ui/technologyui_atlas", "version_" .. slot0.tendency))
end

function slot0.init(slot0)
	slot0.srcollView = slot0:findTF("main/srcoll_rect/content")
	slot0.cardTpl = slot0:findTF("card_tpl", slot0.srcollView)
	slot0.srcollViewCG = slot0.srcollView:GetComponent(typeof(CanvasGroup))
	slot0.helpBtn = slot0:findTF("main/help_btn")
	slot0.refreshBtn = slot0:findTF("main/refresh_btn")
	slot0.backBtn = slot0:findTF("blur_panel/adapt/top/back")
	slot0.tendencyBtn = slot0:findTF("main/tendency_btn")
	slot0.selectetPanel = slot0:findTF("main/selecte_panel")

	setActive(slot0.selectetPanel, false)

	slot0.arrLeftBtn = slot0:findTF("left_arr_btn", slot0.selectetPanel)
	slot0.arrRightBtn = slot0:findTF("right_arr_btn", slot0.selectetPanel)
	slot0.technologyTpl = slot0:findTF("technology_card", slot0.selectetPanel)
	slot0.descTxt = slot0:findTF("desc/bg/Text", slot0.selectetPanel):GetComponent(typeof(Text))
	slot0.timerTxt = slot0:findTF("timer/bg/Text", slot0.selectetPanel):GetComponent(typeof(Text))
	slot0.itemContainer = slot0:findTF("consume_panel/bg/container", slot0.selectetPanel)
	slot0.itemTpl = slot0:findTF("item_tpl", slot0.itemContainer)
	slot0.emptyTF = slot0:findTF("consume_panel/bg/empty", slot0.selectetPanel)
	slot0.taskPanel = slot0:findTF("consume_panel/bg/task_panel", slot0.selectetPanel)
	slot0.taskSlider = slot0.taskPanel:Find("slider"):GetComponent(typeof(Slider))
	slot0.taskDesc = slot0.taskPanel:Find("slider/Text"):GetComponent(typeof(Text))
	slot0.descBG = slot0:findTF("desc/bg", slot0.selectetPanel):GetComponent(typeof(Image))
	slot0.techTimer = {}
	slot0.refreshTimer = {}
	slot0.cardtimer = {}
	slot0._playerResOb = slot0:findTF("blur_panel/adapt/top/playerRes")
	slot0._resPanel = PlayerResource.New()

	tf(slot0._resPanel._go):SetParent(tf(slot0._playerResOb), false)
end

function slot0.didEnter(slot0)
	slot0:initTechnologys()
	onButton(slot0, slot0.helpBtn, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.technology_help_text.tip
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.refreshBtn, function ()
		if _.any(slot0.technologyVOs, function (slot0)
			return slot0.state ~= Technology.STATE_IDLE
		end) then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("technology_canot_refresh")
			})

			return
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("technology_refresh_tip"),
			onYes = function ()
				slot0:emit(TechnologyMediator.ON_REFRESH)
			end
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.tendencyBtn, function ()
		slot0:emit(TechnologyMediator.CHANGE_TENDENCY, (slot0.tendency + 1) % 3)
	end, SFX_PANEL)
	onButton(slot0, slot0.backBtn, function ()
		slot0:emit(slot1.ON_BACK)
	end, SOUND_BACK)
	onButton(slot0, slot0.selectetPanel, function ()
		slot0:cancelSelected()
	end, SFX_PANEL)
	slot0:updateRefreshBtn(slot0.flag)
	slot0._resPanel:setResources(slot0.player)
end

function slot0.initTechnologys(slot0)
	slot0.technologCards = {}
	slot0.lastButtonListener = slot0.lastButtonListener or {}

	if not slot0.itemList then
		slot0.itemList = UIItemList.New(slot0.srcollView, slot0.cardTpl)

		slot0.itemList:make(function (slot0, slot1, slot2)
			if slot0 == UIItemList.EventUpdate then
				slot2.name = slot1 + 1
				slot0.technologCards[slot0.technologyVOs[slot1 + 1].id] = slot2

				slot0:updateTechnologyTF(slot2, slot0.technologyVOs[slot1 + 1])
				slot0:updateTimer(slot0.technologyVOs[slot1 + 1])

				slot3 = GetOrAddComponent(slot2, typeof(Button)).onClick

				if slot0.lastButtonListener[slot2] then
					slot3:RemoveListener(slot0.lastButtonListener[slot2])
				end

				if slot0.technologyVOs[slot1 + 1]:isStart() then
					Timer.New(function ()
						slot0.srcollView:GetComponent("EnhancelScrollView"):SetHorizontalTargetItemIndex(slot1:GetComponent("EnhanceItem").scrollViewItemIndex)
					end, 0.35, 1):Start()
				end

				slot0.lastButtonListener[slot2] = function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-15, warpins: 1 ---
					playSoundEffect(SFX_PANEL)

					if playSoundEffect.technologyVOs[SFX_PANEL + 1]:getState() == Technology.STATE_FINISHED then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 16-37, warpins: 1 ---
						slot0:emit(TechnologyMediator.ON_FINISHED, {
							id = slot0.technologyVOs[slot1 + 1].id,
							pool_id = slot0.technologyVOs[slot1 + 1].poolId
						})
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 38-43, warpins: 1 ---
						slot0:onSelected(slot1 + 1)
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 44-44, warpins: 2 ---
					return
					--- END OF BLOCK #1 ---



				end

				slot3:AddListener(slot0.lastButtonListener[slot2])
			end
		end)
	end

	slot0.itemList:align(#slot0.technologyVOs)
end

function slot0.updateRefreshBtn(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	setButtonEnabled(slot0.refreshBtn, slot1 == 0)

	return
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-9, warpins: 2 ---
	--- END OF BLOCK #1 ---



end

function slot0.onSelected(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-3, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-7, warpins: 1 ---
	if not slot0.technologyVOs[slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-8, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 9-53, warpins: 1 ---
	slot0.technologyCount = table.getCount(slot0.technologyVOs)
	slot0.contextData.selectedIndex = slot1
	slot0.srcollViewCG.alpha = 0.3

	setActive(slot3, false)
	setActive(slot0.selectetPanel, true)

	slot4 = {}

	eachChild(slot0.srcollView, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		slot0[tonumber(slot0.name)] = slot0

		return
		--- END OF BLOCK #0 ---



	end)

	function slot5(slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-10, warpins: 1 ---
		slot2 = {}
		slot3 = slot0
		slot4 = slot0[slot0].localPosition.x

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 11-18, warpins: 0 ---
		for slot8, slot9 in ipairs(slot0) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 11-16, warpins: 1 ---
			slot2[slot8] = slot0[slot8].localPosition.x - slot4
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 17-18, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 19-22, warpins: 1 ---
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 23-74, warpins: 0 ---
		for slot8, slot9 in ipairs(slot2) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 23-24, warpins: 1 ---
			if slot9 ~= 0 and (slot2[slot3] == 0 or (slot1 and ((slot9 > 0 and slot2[slot3] > 0 and slot2[slot3] < slot9) or (slot9 < 0 and (slot2[slot3] > 0 or slot2[slot3] < slot9)))) or (not slot1 and ((slot9 < 0 and slot2[slot3] < 0 and slot9 < slot2[slot3]) or (slot9 > 0 and (slot2[slot3] < 0 or slot9 < slot2[slot3]))))) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 72-72, warpins: 7 ---
				slot3 = slot8
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 73-74, warpins: 6 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 75-77, warpins: 1 ---
		return slot0[slot3]
		--- END OF BLOCK #4 ---



	end

	slot0:updateSelectedInfo(slot2)
	onButton(slot0, slot0.arrLeftBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		if slot0.inAnim then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-5, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 6-16, warpins: 2 ---
		slot0:cancelSelected()
		triggerButton(slot0(slot2, true))

		return
		--- END OF BLOCK #1 ---



	end, SFX_PANEL)
	onButton(slot0, slot0.arrRightBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		if slot0.inAnim then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-5, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 6-16, warpins: 2 ---
		slot0:cancelSelected()
		triggerButton(slot0(slot2, false))

		return
		--- END OF BLOCK #1 ---



	end, SFX_PANEL)

	return
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 54-54, warpins: 2 ---
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 55-55, warpins: 2 ---
	--- END OF BLOCK #4 ---



end

function slot0.updateSelectedInfo(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if not slot0.contextData.selectedIndex then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-5, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-16, warpins: 2 ---
	slot0:updateTechnologyTF(slot0.technologyTpl, slot1, true)
	slot0:updateExtraInfo(slot1)

	return
	--- END OF BLOCK #1 ---



end

function slot0.updateExtraInfo(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-39, warpins: 1 ---
	slot0.timerTxt.text = pg.TimeMgr.GetInstance():DescCDTime(slot2)
	slot0.descTxt.text = slot1:getConfig("desc")
	slot0.descBG.sprite = GetSpriteFromAtlas("ui/TechnologyUI_atlas", slot1:getConfig("rarity"))

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 40-44, warpins: 0 ---
	for slot8 = slot0.itemContainer.childCount + 1, #slot1:getConfig("consume"), 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 40-44, warpins: 2 ---
		cloneTplTo(slot0.itemTpl, slot0.itemContainer)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 45-50, warpins: 1 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 51-74, warpins: 0 ---
	for slot8 = 1, slot0.itemContainer.childCount, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 51-60, warpins: 2 ---
		setActive(slot0.itemContainer:GetChild(slot8 - 1), slot8 <= #slot3)

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 64-67, warpins: 2 ---
		if slot8 <= #slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 68-73, warpins: 1 ---
			slot0:updateItem(slot9, slot1, slot3[slot8])
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 74-74, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 75-78, warpins: 1 ---
	setActive(slot0.emptyTF, not slot3 or #slot3 <= 0)

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 86-91, warpins: 2 ---
	if slot1:hasCondition() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 92-103, warpins: 1 ---
		slot0.taskSlider.value = getProxy(TaskProxy):getTaskById(slot1:getTaskId()) or Task.New({
			id = slot5
		}).progress / getProxy(TaskProxy).getTaskById(slot1.getTaskId()) or Task.New():getConfig("target_num")
		slot0.taskDesc.text = getProxy(TaskProxy).getTaskById(slot1.getTaskId()) or Task.New():getConfig("desc") .. "(" .. getProxy(TaskProxy).getTaskById(slot1.getTaskId()) or Task.New().progress .. "/" .. getProxy(TaskProxy).getTaskById(slot1.getTaskId()) or Task.New():getConfig("target_num") .. ")"
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 110-133, warpins: 2 ---
		--- END OF BLOCK #1 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 134-141, warpins: 1 ---
		slot0.taskDesc.text = i18n("technology_task_none_tip")
		slot0.taskSlider.value = 0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 142-146, warpins: 2 ---
	if slot0.techTimer[slot1.id] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 147-156, warpins: 1 ---
		slot0.techTimer[slot1.id]:Stop()

		slot0.techTimer[slot1.id] = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 157-162, warpins: 2 ---
	function slot5()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-19, warpins: 1 ---
		slot0.techTimer[slot1.id]:Stop()

		slot0.techTimer[slot1.id].Stop.techTimer[slot0.techTimer[slot1.id].id] = nil
		slot0.techTimer[slot1.id].Stop.techTimer.timerTxt.text = "00:00:00"

		return
		--- END OF BLOCK #0 ---



	end

	if slot1:isStarting() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 163-182, warpins: 1 ---
		slot0.techTimer[slot1.id] = Timer.New(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-13, warpins: 1 ---
			if slot0.time - pg.TimeMgr.GetInstance():GetServerTime() <= 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 14-16, warpins: 1 ---
				slot1()
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 17-29, warpins: 1 ---
				slot2.timerTxt.text = pg.TimeMgr.GetInstance():DescCDTime(slot0.time - slot0)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 30-30, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end, 1, -1)

		slot0.techTimer[slot1.id]:Start()
		slot0.techTimer[slot1.id].func()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 183-188, warpins: 2 ---
	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 189-213, warpins: 0 ---
	for slot10 = 1, slot0.itemContainer.childCount, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 189-213, warpins: 2 ---
		slot11 = slot0.itemContainer:GetChild(slot10 - 1)

		setActive(slot11:Find("check"), slot1:isStart())
		setActive(slot11:Find("icon_bg/count"), not slot1:isStart())
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #9 ---

	FLOW; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #10 214-215, warpins: 1 ---
	return
	--- END OF BLOCK #10 ---



end

function slot0.cancelSelected(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if not slot0.contextData.selectedIndex then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-5, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-9, warpins: 1 ---
	if not slot0.technologyVOs[slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-10, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 11-35, warpins: 1 ---
	slot0.srcollViewCG.alpha = 1

	setActive(slot3, true)
	removeOnButton(slot0.arrLeftBtn)
	removeOnButton(slot0.arrRightBtn)
	setActive(slot0.selectetPanel, false)

	slot0.inAnim = true

	if slot0.timer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 36-41, warpins: 1 ---
		slot0.timer:Stop()

		slot0.timer = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 42-58, warpins: 2 ---
	slot0.contextData.selectedIndex = nil
	slot0.timer = Timer.New(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		slot0.inAnim = nil

		return
		--- END OF BLOCK #0 ---



	end, 0.2, 1)

	slot0.timer:Start()

	if callback then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 59-60, warpins: 1 ---
		callback()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 61-65, warpins: 2 ---
	if slot0.techTimer[slot2.id] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 66-75, warpins: 1 ---
		slot0.techTimer[slot2.id]:Stop()

		slot0.techTimer[slot2.id] = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 76-77, warpins: 2 ---
	return
	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 78-78, warpins: 2 ---
	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 79-79, warpins: 2 ---
	--- END OF BLOCK #7 ---



end

function slot0.updateTechnology(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-12, warpins: 0 ---
	for slot5, slot6 in ipairs(slot0.technologyVOs) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-8, warpins: 1 ---
		if slot6.id == slot1.id then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-10, warpins: 1 ---
			slot0.technologyVOs[slot5] = slot1
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 11-12, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 13-25, warpins: 1 ---
	slot0:updateTechnologyTF(slot2, slot1)
	slot0:updateTimer(slot1)

	return
	--- END OF BLOCK #2 ---



end

function slot0.updateTimer(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-16, warpins: 1 ---
	slot3 = slot0.technologCards[slot1.id].Find(slot2, "frame/btns/dev_btn/time")
	slot4 = slot0.technologCards[slot1.id].Find(slot2, "frame/btns/dev_btn/limit")

	if slot0.cardtimer[slot1.id] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-26, warpins: 1 ---
		slot0.cardtimer[slot1.id]:Stop()

		slot0.cardtimer[slot1.id] = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 27-33, warpins: 2 ---
	if slot1:getState() == Technology.STATE_STARTING then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 34-61, warpins: 1 ---
		setActive(slot3, true)
		setActive(slot4, false)

		slot0.cardtimer[slot1.id] = Timer.New(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-13, warpins: 1 ---
			if slot0.time - pg.TimeMgr.GetInstance():GetServerTime() <= 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 14-20, warpins: 1 ---
				if slot1.cardtimer[slot0.id] then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 21-34, warpins: 1 ---
					slot1.cardtimer[slot0.id]:Stop()

					slot1.cardtimer[slot0.id] = nil
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 35-40, warpins: 2 ---
				if not slot0:canFinish() then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 41-49, warpins: 1 ---
					setActive(setActive, false)
					setActive(setActive, true)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 50-58, warpins: 1 ---
					slot1:emit(TechnologyMediator.ON_TIME_OVER, slot0.id)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #1 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 59-73, warpins: 1 ---
				setText(slot2:Find("text"), pg.TimeMgr.GetInstance():DescCDTime(slot0 - slot1))
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 74-74, warpins: 3 ---
			return
			--- END OF BLOCK #1 ---



		end, 1, -1)

		slot0.cardtimer[slot1.id]:Start()
		slot0.cardtimer[slot1.id].func()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 62-63, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

function slot0.updateTechnologyTF(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-20, warpins: 1 ---
	slot0:updateInfo(slot1, slot2, slot3)
	setActive(slot0:findTF("frame/btns/finish_btn", slot1), slot2:getState() == Technology.STATE_FINISHED)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 24-26, warpins: 2 ---
	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 27-42, warpins: 1 ---
		setActive(slot0:findTF("frame/btns/desc_btn", slot1), slot4 == Technology.STATE_IDLE)
		setActive(slot0:findTF("frame/btns/dev_btn", slot1), slot4 == Technology.STATE_STARTING)

		return
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 46-52, warpins: 2 ---
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 56-57, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 58-82, warpins: 1 ---
	removeOnButton(slot5)
	removeOnButton(slot6)
	removeOnButton(slot7)
	setActive(slot0:findTF("frame/btns/start_btn", slot1), slot4 == Technology.STATE_IDLE)
	setActive(slot7, slot4 == Technology.STATE_STARTING)

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 86-92, warpins: 2 ---
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 96-100, warpins: 2 ---
	if slot4 == Technology.STATE_IDLE then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 101-113, warpins: 1 ---
		onButton(slot0, slot6, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-8, warpins: 1 ---
			if _.any(slot0.technologyVOs, function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-5, warpins: 1 ---
				return slot0.state ~= Technology.STATE_IDLE
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 9-9, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 9-20, warpins: 1 ---
				pg.TipsMgr.GetInstance():ShowTips(i18n("technology_is_actived"))

				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 21-29, warpins: 2 ---
			if #slot1:getConfig("consume") > 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 30-48, warpins: 1 ---
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("technology_task_build_tip", getDropInfo(slot0)),
					onYes = function ()

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-14, warpins: 1 ---
						slot0:emit(TechnologyMediator.ON_START, {
							id = slot1.id,
							pool_id = slot1.poolId
						})

						return
						--- END OF BLOCK #0 ---



					end
				})
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 49-61, warpins: 1 ---
				slot0:emit(TechnologyMediator.ON_START, {
					id = slot1.id,
					pool_id = slot1.poolId
				})
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 62-62, warpins: 2 ---
			return
			--- END OF BLOCK #2 ---



		end, SFX_PANEL)
		setButtonEnabled(slot6, slot2:hasResToStart())
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 114-117, warpins: 1 ---
		if slot4 == Technology.STATE_STARTING then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 118-124, warpins: 1 ---
			onButton(slot0, slot7, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-15, warpins: 1 ---
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("technology_stop_tip"),
					onYes = function ()

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-14, warpins: 1 ---
						slot0:emit(TechnologyMediator.ON_STOP, {
							id = slot1.id,
							pool_id = slot1.poolId
						})

						return
						--- END OF BLOCK #0 ---



					end
				})

				return
				--- END OF BLOCK #0 ---



			end, SFX_PANEL)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 125-128, warpins: 1 ---
			if slot4 == Technology.STATE_FINISHED then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 129-134, warpins: 1 ---
				onButton(slot0, slot5, function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-14, warpins: 1 ---
					slot0:emit(TechnologyMediator.ON_FINISHED, {
						id = slot1.id,
						pool_id = slot1.poolId
					})

					return
					--- END OF BLOCK #0 ---



				end, SFX_PANEL)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 135-136, warpins: 4 ---
	return
	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 137-137, warpins: 2 ---
	--- END OF BLOCK #6 ---



end

function slot0.dfs(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot1.name ~= "item_tpl" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-7, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-16, warpins: 0 ---
		for slot6 = 1, slot1.childCount, 1 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-16, warpins: 2 ---
			slot0:dfs(slot1:GetChild(slot6 - 1), slot2)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 17-17, warpins: 1 ---
		--- END OF BLOCK #2 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 18-20, warpins: 1 ---
		slot2(slot1)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 21-21, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.updateInfo(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	setImageSprite(slot0:findTF("frame", slot1), GetSpriteFromAtlas("technologycard", slot2:getConfig("bg") .. ((slot3 and "_l") or "")))
	setImageSprite(slot0:findTF("frame/icon_mask/icon", slot1), GetSpriteFromAtlas("technologycard", slot2:getConfig("bg_icon")), true)
	setImageSprite(slot0:findTF("frame/label", slot1), GetSpriteFromAtlas("technologycard", slot2:getConfig("label")))
	setImageSprite(slot0:findTF("frame/label/text", slot1), GetSpriteFromAtlas("technologycard", slot2:getConfig("label_color")), true)
	setImageSprite(slot0:findTF("frame/label/version", slot1), GetSpriteFromAtlas("technologycard", "version_" .. slot2:getConfig("blueprint_version")), true)
	setText(slot0:findTF("frame/name_bg/Text", slot1), slot2:getConfig("name"))
	setText(slot0:findTF("frame/sub_name", slot1), slot2:getConfig("sub_name") or "")

	slot4 = slot2:getConfig("drop_client")
	slot6 = 0

	slot0:dfs(slot1:Find("frame/item_container"), function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-10, warpins: 1 ---
		slot1(slot0 + 1, slot0 + 1 <= #slot1)

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 14-19, warpins: 2 ---
		if slot0 <= #slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 20-28, warpins: 1 ---
			slot2:updateItem(slot0, , slot1[slot0])
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 29-29, warpins: 2 ---
		return
		--- END OF BLOCK #2 ---



	end)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 18-104, warpins: 2 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 106-122, warpins: 2 ---
	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 123-131, warpins: 1 ---
		setActive(slot5:GetChild(1), #slot4 > 2)

		slot5:GetChild(0):GetComponent("HorizontalLayoutGroup").padding.right = (#slot4 == 4 and 25) or 0
		slot5:GetChild(1):GetComponent("HorizontalLayoutGroup").padding.left = (#slot4 == 4 and 25) or 0
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 135-147, warpins: 2 ---
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 151-163, warpins: 2 ---
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 167-167, warpins: 2 ---
		--- END OF BLOCK #3 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 168-169, warpins: 2 ---
	return
	--- END OF BLOCK #3 ---



end

function slot0.updateItem(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-24, warpins: 1 ---
	slot4 = nil

	updateDrop(slot1, slot4)

	if not IsNil(slot0:findTF("icon_bg/count", slot1)) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 25-29, warpins: 1 ---
		slot6 = nil

		setColorCount(slot5, (slot3[1] ~= DROP_TYPE_RESOURCE or slot0.player:getResById(slot3[2])) and getProxy(BagProxy):getItemCountById(slot4.id), slot3[3])
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 45-49, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 50-57, warpins: 2 ---
	onButton(slot0, slot1, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-12, warpins: 2 ---
		if #(slot0:getConfig("display_icon") or {}) > 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-38, warpins: 1 ---
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_ITEM_BOX,
				items = _.map(slot0, function (slot0)

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-6, warpins: 1 ---
					return {
						type = slot0[1],
						id = slot0[2]
					}
					--- END OF BLOCK #0 ---



				end),
				content = slot0:getConfig("display"),
				itemFunc = function (slot0)

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-9, warpins: 1 ---
					slot0:emit(slot1.ON_DROP, slot0, function ()

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-9, warpins: 1 ---
						pg.MsgboxMgr.GetInstance():ShowMsgBox(pg.MsgboxMgr.GetInstance().ShowMsgBox)

						return
						--- END OF BLOCK #0 ---



					end)

					return
					--- END OF BLOCK #0 ---



				end
			})

			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 39-45, warpins: 1 ---
		slot1:emit(slot2.ON_DROP, slot0)
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 46-46, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end, SFX_PANEL)

	return
	--- END OF BLOCK #1 ---



end

function slot0.clearTimer(slot0, ...)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.timer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-9, warpins: 1 ---
		slot0.timer:Stop()

		slot0.timer = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-13, warpins: 2 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 14-18, warpins: 0 ---
	for slot4, slot5 in pairs(slot0.techTimer) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-16, warpins: 1 ---
		slot5:Stop()
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 17-18, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 19-24, warpins: 1 ---
	slot0.techTimer = {}

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 25-29, warpins: 0 ---
	for slot4, slot5 in pairs(slot0.cardtimer) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 25-27, warpins: 1 ---
		slot5:Stop()
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 28-29, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 30-32, warpins: 1 ---
	slot0.cardtimer = {}

	return
	--- END OF BLOCK #5 ---



end

function slot0.willExit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot0:clearTimer()

	slot0.techTimer = nil
	slot0.cardtimer = {}

	return
	--- END OF BLOCK #0 ---



end

return slot0
