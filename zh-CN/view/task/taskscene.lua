slot0 = class("TaskScene", import("..base.BaseUI"))
slot0.CHAT_SHOW_TIME = 2
slot0.CHAT_ANIMATION_TIME = 0.3

function slot0.getUIName(slot0)
	return "TaskScene"
end

function slot0.setTaskVOs(slot0, slot1)
	slot0.taskVOsById = slot1
end

function slot0.init(slot0)
	require("ShareCfg.task_ui_config")

	slot0._topPanel = slot0:findTF("blur_panel/adapt/top")
	slot0._backBtn = slot0._topPanel:Find("back_btn")
	slot0._scrllPanel = slot0:findTF("taskBGCenter/right_panel")
	slot0._scrollView = slot0._scrllPanel:GetComponent("LScrollRect")
	slot0._leftLength = slot0:findTF("blur_panel/adapt/left_length")
	slot0._tagRoot = slot0:findTF("blur_panel/adapt/left_length/frame/tagRoot")
	slot0.taskIconTpl = slot0:findTF("taskTagOb/task_icon_default")
	slot0.oneStepBtn = slot0:findTF("blur_panel/adapt/top/GetAllButton")
	slot0.listEmptyTF = slot0:findTF("empty")

	setActive(slot0.listEmptyTF, false)

	slot0.listEmptyTxt = slot0:findTF("Text", slot0.listEmptyTF)

	setText(slot0.listEmptyTxt, i18n("list_empty_tip_taskscene"))
end

function slot0.setTaskStoryIconRes(slot0, slot1, slot2)
	slot3 = slot0:findTF("taskTagOb/" .. slot2) or cloneTplTo(slot0.taskIconTpl, slot0:findTF("taskTagOb"))

	slot0:setSpriteTo("taskTagOb/" .. slot2, slot1, true)
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0._backBtn, function ()
		uv0:emit(uv1.ON_BACK)
	end, SFX_CANCEL)
	setActive(slot0:findTF("stamp"), getProxy(TaskProxy):mingshiTouchFlagEnabled())

	if LOCK_CLICK_MINGSHI then
		setActive(slot0:findTF("stamp"), false)
	end

	onButton(slot0, slot0:findTF("stamp"), function ()
		getProxy(TaskProxy):dealMingshiTouchFlag(5)
	end, SFX_CONFIRM)
	slot0:createTasks()
	slot0:initTypeTag()

	slot1 = slot0.toggles[slot0.contextData.page or "all"]

	if slot0.toggles and slot1 then
		triggerToggle(slot1, true)
	end
end

function slot0.createTasks(slot0)
	slot0.taskCards = {}

	function slot0._scrollView.onInitItem(slot0)
		uv0:onInitTask(slot0)
	end

	function slot0._scrollView.onUpdateItem(slot0, slot1)
		uv0:onUpdateTask(slot0, slot1)
	end
end

function slot0.onInitTask(slot0, slot1)
	slot0.taskCards[slot1] = TaskCard.New(slot1, slot0)
end

function slot0.onUpdateTask(slot0, slot1, slot2)
	if not slot0.taskCards[slot2] then
		slot0:onInitTask(slot2)

		slot3 = slot0.taskCards[slot2]
	end

	slot3:update(slot0.taskVOs[slot1 + 1])
end

function slot0.filterTasks(slot0, slot1)
	slot0.taskVOs = {}
	slot0._currentToggleType = slot1

	for slot6, slot7 in pairs(slot0.taskVOsById) do
		if slot7:getConfig("visibility") == 1 and pg.taskUIConfig.filter[slot0._currentToggleType][slot7:GetRealType()] then
			table.insert(slot0.taskVOs, slot7)
		end
	end

	slot0:sortTasks()
	slot0._scrollView:SetTotalCount(#slot0.taskVOs, -1)

	if slot0:GetSliderValue() > 0 then
		slot0._scrollView:ScrollTo(slot3)
	end

	setActive(slot0.listEmptyTF, #slot0.taskVOs <= 0)
	slot0:updateOneStepBtn()
end

function slot0.GetSliderValue(slot0)
	slot1 = -1

	if slot0.contextData.targetId then
		slot2 = nil

		for slot6, slot7 in ipairs(slot0.taskVOs) do
			if slot7.id == slot0.contextData.targetId then
				slot2 = slot6 - 1

				break
			end
		end

		if slot2 then
			slot1 = slot0._scrollView:HeadIndexToValue(slot2)
		end
	end

	return slot1
end

function slot0.sortTasks(slot0)
	function slot1(slot0, slot1, slot2)
		function slot3(slot0)
			for slot4, slot5 in ipairs(uv0) do
				if slot0 == slot5 then
					return slot4
				end
			end
		end

		return slot3(slot0) < slot3(slot1)
	end

	function slot2(slot0)
		return slot0:IsUrTask() and 1 or 0
	end

	table.sort(slot0.taskVOs, function (slot0, slot1)
		if slot0:getTaskStatus() == slot1:getTaskStatus() then
			if (slot0.id == 10302 and 1 or 0) == (slot1.id == 10302 and 1 or 0) then
				if uv0(slot0) == uv0(slot1) then
					if slot0:GetRealType() == slot1:GetRealType() then
						return slot0.id < slot1.id
					elseif slot0:getTaskStatus() == 0 then
						return uv1(slot0:GetRealType(), slot1:GetRealType(), {
							26,
							36,
							6,
							3,
							4,
							5,
							2,
							1
						})
					elseif slot0:getTaskStatus() == 1 then
						return uv1(slot0:GetRealType(), slot1:GetRealType(), {
							26,
							36,
							6,
							1,
							4,
							2,
							5,
							3
						})
					end
				else
					return slot5 < slot4
				end
			else
				return slot3 < slot2
			end
		else
			return uv1(slot0:getTaskStatus(), slot1:getTaskStatus(), {
				1,
				0,
				2
			})
		end
	end)
end

function slot0.initTypeTag(slot0)
	slot0.toggles = {}

	for slot5, slot6 in pairs(pg.taskUIConfig.filter) do
		slot7 = slot0:findTF(slot5, slot0._tagRoot)
		slot0.toggles[slot5] = slot7

		onToggle(slot0, slot7, function (slot0)
			if slot0 then
				uv0:filterTasks(uv1)
			end
		end, SFX_PANEL)
	end
end

function slot0.addTask(slot0, slot1)
	print("add tgsk " .. slot1.id)

	slot0.taskVOsById[slot1.id] = slot1

	slot0:filterTasks(slot0._currentToggleType)
end

function slot0.removeTask(slot0, slot1)
	print("revemo tgsk " .. slot1.id)

	slot0.taskVOsById[slot1.id] = nil

	slot0:filterTasks(slot0._currentToggleType)
end

function slot0.updateTask(slot0, slot1)
	slot0:addTask(slot1)
end

function slot0.GoToFilter(slot0, slot1)
	triggerToggle(slot0:findTF(slot1, slot0._tagRoot), true)
end

function slot0.onSubmit(slot0, slot1)
	if slot0.onShowAwards then
		return
	end

	slot0:emit(TaskMediator.ON_TASK_SUBMIT, slot1)
end

function slot0.onGo(slot0, slot1)
	if slot0.onShowAwards then
		return
	end

	slot0:emit(TaskMediator.ON_TASK_GO, slot1)
end

function slot0.willExit(slot0)
	for slot4, slot5 in pairs(slot0.taskCards) do
		slot5:dispose()
	end

	if slot0.tweens then
		cancelTweens(slot0.tweens)
	end

	slot1 = pg.taskUIConfig
end

function slot0.updateOneStepBtn(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.taskVOs) do
		if slot6:getTaskStatus() == 1 and slot6:getConfig("visibility") == 1 then
			table.insert(slot1, slot6)
		end
	end

	if #slot1 >= 2 == true then
		setActive(slot0.oneStepBtn, true)
		onButton(slot0, slot0.oneStepBtn, function ()
			slot0 = nil
			slot2 = nil

			coroutine.wrap(function ()
				uv0, uv1 = uv2:filterOverflowTaskVOList(uv3)
				uv0 = uv2:filterSubmitTaskVOList(uv0, uv4)
				uv0 = uv2:filterChoiceTaskVOList(uv0, uv4)

				if #uv0 > 0 then
					pg.m02:sendNotification(GAME.SUBMIT_TASK_ONESTEP, {
						resultList = uv0
					})
				end
			end)()

			if false then
				pg.TipsMgr.GetInstance():ShowTips(i18n("award_overflow_tip"))

				slot1 = false
			end
		end, SFX_PANEL)
	else
		setActive(slot0.oneStepBtn, false)
	end
end

function slot0.filterOverflowTaskVOList(slot0, slot1)
	slot3 = {}
	slot4 = getProxy(PlayerProxy):getData()
	slot9 = pg.gameset.max_gold.key_value
	slot10 = pg.gameset.max_oil.key_value
	slot11 = not LOCK_UR_SHIP and pg.gameset.urpt_chapter_max.description[2] or 0
	slot12 = false

	for slot16, slot17 in pairs(slot1 or slot0.taskVOs) do
		if not slot17:judgeOverflow(slot4.gold, slot4.oil, not LOCK_UR_SHIP and getProxy(BagProxy):GetLimitCntById(pg.gameset.urpt_chapter_max.description[1]) or 0) then
			table.insert(slot3, slot17)
		end

		if slot18 then
			slot12 = true
		end
	end

	return slot3, slot12
end

function slot0.filterSubmitTaskVOList(slot0, slot1, slot2)
	slot3 = {}

	for slot8, slot9 in ipairs(slot1) do
		if slot9:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_ITEM or slot9:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_VIRTUAL_ITEM or slot9:getConfig("sub_type") == TASK_SUB_TYPE_PLAYER_RES then
			slot10 = DROP_TYPE_ITEM

			if slot9:getConfig("sub_type") == TASK_SUB_TYPE_PLAYER_RES then
				slot10 = DROP_TYPE_RESOURCE
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_ITEM_BOX,
				content = i18n("sub_item_warning"),
				items = {
					{
						type = slot10,
						id = slot9:getConfig("target_id_for_client"),
						count = slot9:getConfig("target_num")
					}
				},
				onYes = function ()
					table.insert(uv0, uv1)
					uv2()
				end,
				onNo = function ()
					uv0()
				end
			})
			coroutine.yield()
		else
			table.insert(slot3, slot9)
		end
	end

	return slot3
end

function slot0.filterChoiceTaskVOList(slot0, slot1)
	slot2 = {}

	for slot7, slot8 in ipairs(slot1) do
		if slot8:isSelectable() then
			slot10 = {}

			for slot14, slot15 in ipairs(slot8:getConfig("award_choice")) do
				slot10[#slot10 + 1] = {
					type = slot15[1],
					id = slot15[2],
					count = slot15[3],
					index = slot14
				}
			end

			slot11 = nil

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_ITEM_BOX,
				content = i18n("select_award_warning"),
				items = slot10,
				itemFunc = function (slot0)
					uv0 = slot0.index
				end,
				onYes = function ()
					if not uv0 then
						pg.TipsMgr.GetInstance():ShowTips(i18n("no_item_selected_tip"))
					else
						slot0 = {}

						for slot5, slot6 in ipairs(uv1[uv0]) do
							table.insert(slot0, {
								type = slot6[1],
								id = slot6[2],
								number = slot6[3]
							})
						end

						uv2.choiceItemList = slot0

						table.insert(uv3, uv2)
						process()
					end
				end,
				onNo = function ()
					process()
				end
			})
			coroutine.yield()
		else
			table.insert(slot2, slot8)
		end
	end

	return slot2
end

return slot0
