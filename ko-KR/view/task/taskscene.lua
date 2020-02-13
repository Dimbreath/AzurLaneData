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
		slot0:emit(slot1.ON_BACK)
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
		slot0:onInitTask(slot0)
	end

	function slot0._scrollView.onUpdateItem(slot0, slot1)
		slot0:onUpdateTask(slot0, slot1)
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
	slot2 = pg.taskUIConfig.filter[slot0._currentToggleType]

	for slot6, slot7 in pairs(slot0.taskVOsById) do
		if slot7:getConfig("visibility") == 1 and slot2[slot7:getConfig("type")] then
			table.insert(slot0.taskVOs, slot7)
		end
	end

	slot0:sortTasks()
	slot0._scrollView:SetTotalCount(#slot0.taskVOs)
	setActive(slot0.listEmptyTF, #slot0.taskVOs <= 0)
	slot0:updateOneStepBtn()
end

function slot0.sortTasks(slot0)
	function slot1(slot0, slot1, slot2)
		return slot3(slot0) < slot3(slot1)
	end

	table.sort(slot0.taskVOs, function (slot0, slot1)
		if slot0:getTaskStatus() == slot1:getTaskStatus() then
			if ((slot0.id == 10302 and 1) or 0) == ((slot1.id == 10302 and 1) or 0) then
				if slot0:getConfig("type") == slot1:getConfig("type") then
					return slot0.id < slot1.id
				elseif slot0:getTaskStatus() == 0 then
					return slot0(slot0:getConfig("type"), slot1:getConfig("type"), {
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
					return slot0(slot0:getConfig("type"), slot1:getConfig("type"), {
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
				return slot3 < slot2
			end
		else
			return slot0(slot0:getTaskStatus(), slot1:getTaskStatus(), {
				1,
				0,
				2
			})
		end
	end)
end

function slot0.initTypeTag(slot0)
	slot0.toggles = {}

	for slot5, slot6 in pairs(slot1) do
		slot0.toggles[slot5] = slot0:findTF(slot5, slot0._tagRoot)

		onToggle(slot0, slot0.findTF(slot5, slot0._tagRoot), function (slot0)
			if slot0 then
				slot0:filterTasks(slot0.filterTasks)
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
	slot2 = {}

	for slot6, slot7 in pairs(slot0.taskVOs) do
		if slot7:getTaskStatus() == 1 and slot7:getConfig("visibility") == 1 then
			slot1[#slot1 + 1] = slot7

			slot7:confirmForSubmit()

			slot2[#slot2 + 1] = slot7:getConfirmSetting()
		end
	end

	if (#slot1 >= 2) == true then
		removeOnButton(slot0.oneStepBtn)
		setActive(slot0.oneStepBtn.gameObject, true)
		onButton(slot0, slot0.oneStepBtn, function ()
			slot0:emit(TaskMediator.CLICK_GET_ALL, slot0, )
		end, SFX_CONFIRM)
	else
		setActive(slot0.oneStepBtn.gameObject, false)
	end
end

return slot0
