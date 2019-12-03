slot0 = class("YidaliMainPage", import(".TemplatePage.PreviewTemplatePage"))

slot0.OnInit = function (slot0)
	slot0.super.OnInit(slot0)
	slot0:initUI()

	slot0.YDLtaskIDList = {
		14981,
		14982,
		14983,
		14984,
		14985,
		14986
	}
end

slot0.OnFirstFlush = function (slot0)
	slot0.super.OnFirstFlush(slot0)

	slot0.fight = slot0:findTF("fight", slot0.btnList)

	onButton(slot0, slot0.fight, function ()
		slot0:emit(ActivityMediator.BATTLE_OPERA)
	end, SFX_PANEL)
	slot0:initData()
	slot0:submitFinishedTask()
end

slot0.OnUpdateFlush = function (slot0)
	slot0:updateAwardBtn()
end

slot0.initData = function (slot0)
	slot0.finalTaskID = slot0.activity:getConfig("config_client")[1]
	slot0.taskIDList = Clone(pg.task_data_template[slot0.finalTaskID].target_id)
	slot0.taskProxy = getProxy(TaskProxy)
end

slot0.initUI = function (slot0)
	slot0.awardTF = slot0:findTF("Item", slot0.bg)
	slot0.activeTF = slot0:findTF("Active", slot0.awardTF)
	slot0.finishedTF = slot0:findTF("Finished", slot0.awardTF)
	slot0.achievedTF = slot0:findTF("Achieved", slot0.awardTF)

	setActive(slot0.activeTF, false)
	setActive(slot0.finishedTF, false)
	setActive(slot0.achievedTF, false)

	slot0.achievementBtn = slot0:findTF("AchieveMentBtn", slot0.bg)
	slot0.subViewContainer = slot0:findTF("SubViewContainer")
end

slot0.updateAwardBtn = function (slot0)
	print("final taskid:" .. slot0.finalTaskID)
	print("task status:" .. slot0:getFinalTaskStatus())

	if slot0.getFinalTaskStatus() == 0 then
		setActive(slot0.activeTF, true)
		setActive(slot0.finishedTF, false)
		setActive(slot0.achievedTF, false)
	elseif slot1 == 1 then
		setActive(slot0.activeTF, false)
		setActive(slot0.finishedTF, true)
		setActive(slot0.achievedTF, false)
		onButton(slot0, slot0.awardTF, function ()
			slot0:emit(ActivityMediator.ON_TASK_SUBMIT, slot0.taskProxy:getTaskVO(slot0.finalTaskID))
		end, SFX_PANEL)
	elseif slot1 == 2 then
		setActive(slot0.activeTF, false)
		setActive(slot0.finishedTF, false)
		setActive(slot0.achievedTF, true)
		onButton(slot0, slot0.awardTF, function ()
			return
		end, SFX_PANEL)
	end
end

slot0.submitFinishedTask = function (slot0)
	for slot4, slot5 in ipairs(slot0.YDLtaskIDList) do
		if slot0.taskProxy:getTaskById(slot5) and slot6:isFinish() and not slot6:isReceive() then
			print("!!!!!!!!!!!!!20190907!!!!!!!YDLtaskIDList emit:" .. slot5)
			slot0:emit(ActivityMediator.ON_TASK_SUBMIT, slot6)
		end
	end
end

slot0.getFinalTaskStatus = function (slot0)
	return slot0.taskProxy:getTaskVO(slot0.finalTaskID):getTaskStatus()
end

return slot0
