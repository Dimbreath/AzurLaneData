slot0 = class("TaskProxy", import(".NetProxy"))
slot0.TASK_ADDED = "task added"
slot0.TASK_UPDATED = "task updated"
slot0.TASK_REMOVED = "task removed"
slot0.TASK_FINISH = "task finish"
mingshiTriggerId = 1
mingshiActivityId = 21
changdaoActivityId = 10006
changdaoTaskStartId = 5031

function slot0.register(slot0)
	slot0:on(20001, function (slot0)
		uv0.data = {}
		uv0.finishData = {}
		uv0.tmpInfo = {}

		for slot4, slot5 in ipairs(slot0.info) do
			if Task.New(slot5):getConfigTable() ~= nil then
				slot6:display("loaded")

				if slot6:getTaskStatus() ~= 2 then
					uv0.data[slot6.id] = slot6
				else
					uv0.finishData[slot6.id] = slot6
				end
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("task_notfound_error") .. tostring(slot5.id))
				Debugger.LogWarning("Missing Task Config, id :" .. tostring(slot5.id))
			end
		end

		getProxy(TechnologyProxy):updateBlueprintStates()
	end)
	slot0:on(20002, function (slot0)
		for slot4, slot5 in ipairs(slot0.info) do
			if uv0.data[slot5.id] ~= nil then
				slot6.progress = slot5.progress

				uv0:updateTask(slot6)
			end
		end
	end)
	slot0:on(20003, function (slot0)
		for slot4, slot5 in ipairs(slot0.info) do
			uv0:addTask(Task.New(slot5))
		end
	end)
	slot0:on(20004, function (slot0)
		for slot4, slot5 in ipairs(slot0.id_list) do
			uv0:removeTaskById(slot5)
		end
	end)

	slot0.taskTriggers = {}
end

function slot0.getTasksForBluePrint(slot0)
	slot1 = {
		[slot6.id] = slot6
	}

	for slot5, slot6 in pairs(slot0.data or {}) do
		-- Nothing
	end

	for slot5, slot6 in pairs(slot0.finishData) do
		slot1[slot6.id] = slot6
	end

	return slot1
end

function slot0.addTmpTask(slot0, slot1)
	slot0.tmpInfo[slot1.id] = slot1
end

function slot0.checkTmpTask(slot0, slot1)
	if slot0.tmpInfo[slot1] then
		slot0:addTask(slot0.tmpInfo[slot1])

		slot0.tmpInfo[slot1] = nil
	end
end

function slot0.addTask(slot0, slot1)
	if slot0.data[slot1.id] then
		slot0:addTmpTask(slot1)

		return
	end

	if slot1:getConfigTable() == nil then
		pg.TipsMgr.GetInstance():ShowTips(i18n("task_notfound_error") .. tostring(slot1.id))
		Debugger.LogWarning("Missing Task Config, id :" .. tostring(slot1.id))

		return
	end

	slot0.data[slot1.id] = slot1:clone()

	slot0.data[slot1.id]:display("added")
	slot0.data[slot1.id]:onAdded()
	slot0.facade:sendNotification(uv0.TASK_ADDED, slot1:clone())

	if slot1:getConfig("type") == 10 and slot1:isFinish() then
		slot0:sendNotification(GAME.SUBMIT_TASK, slot1.id)
	end
end

function slot0.updateTask(slot0, slot1)
	slot0.data[slot1.id] = slot1:clone()
	slot0.data[slot1.id].acceptTime = slot0.data[slot1.id].acceptTime

	slot0.data[slot1.id]:display("updated")
	slot0.facade:sendNotification(uv0.TASK_UPDATED, slot1:clone())

	if slot1:getConfig("type") == 10 and slot1:isFinish() then
		slot0:sendNotification(GAME.SUBMIT_TASK, slot1.id)
	end
end

function slot0.getTasks(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.data) do
		table.insert(slot1, slot6)
	end

	return Clone(slot1)
end

function slot0.getTaskById(slot0, slot1)
	if slot0.data[slot1] then
		return slot0.data[slot1]:clone()
	end
end

function slot0.getFinishTaskById(slot0, slot1)
	if slot0.finishData[slot1] then
		return slot0.finishData[slot1]:clone()
	end
end

function slot0.getTaskVO(slot0, slot1)
	return slot0:getTaskById(slot1) or slot0:getFinishTaskById(slot1)
end

function slot0.getCanReceiveCount(slot0)
	for slot5, slot6 in pairs(slot0.data) do
		if slot6:getConfig("visibility") == 1 and slot6:isFinish() and slot6:isReceive() == false then
			slot1 = 0 + 1
		end
	end

	return slot1
end

function slot0.getNotFinishCount(slot0, slot1)
	for slot7, slot8 in pairs(slot0.data) do
		if slot8:getConfig("type") == (slot1 or 3) and slot8:isFinish() == false then
			slot3 = 0 + 1
		end
	end

	return slot3
end

function slot0.removeTask(slot0, slot1)
	slot0:removeTaskById(slot1.id)
end

function slot0.removeTaskById(slot0, slot1)
	if slot0.data[slot1] == nil then
		return
	end

	slot0.finishData[slot1] = slot0.data[slot1]:clone()
	slot0.finishData[slot1].submitTime = pg.TimeMgr.GetInstance():GetServerTime()
	slot0.data[slot1] = nil

	slot0.facade:sendNotification(uv0.TASK_REMOVED, slot2)
	slot0:checkTmpTask(slot1)
end

function slot0.getmingshiTaskID(slot0, slot1)
	for slot6, slot7 in pairs(pg.task_data_trigger[mingshiTriggerId].args) do
		if slot7[1] <= slot1 and slot7[2] and not slot0:getTaskVO(slot8) then
			return slot8
		end
	end

	return 0
end

function slot0.dealMingshiTouchFlag(slot0, slot1)
	if not getProxy(ActivityProxy):getActivityById(mingshiActivityId) or slot2:isEnd() then
		return
	end

	slot3 = slot2:getConfig("config_id")

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		hideNo = true,
		content = i18n("mingshi_task_tip_" .. slot1)
	})

	if slot0:getTaskById(slot2:getConfig("config_data")[1]) and slot5:getTaskStatus() < 1 then
		if not slot0.mingshiTouchList then
			slot0.mingshiTouchList = {}
		end

		for slot9, slot10 in pairs(slot0.mingshiTouchList) do
			if slot10 == slot1 then
				return
			end
		end

		for slot9, slot10 in pairs(slot2.data1_list) do
			if slot10 == slot1 then
				return
			end
		end

		table.insert(slot0.mingshiTouchList, slot1)
		slot0:sendNotification(GAME.ACTIVITY_OPERATION, {
			cmd = 2,
			activity_id = mingshiActivityId,
			arg1 = slot1
		})
	end
end

function slot0.mingshiTouchFlagEnabled(slot0)
	if not getProxy(ActivityProxy):getActivityById(mingshiActivityId) or slot1:isEnd() then
		return
	end

	slot2 = tonumber(slot1:getConfig("config_id"))

	if slot0:getTaskById(tonumber(slot1:getConfig("config_data")[1])) and slot4:getTaskStatus() < 1 then
		return true
	end

	if slot0:getTaskVO(slot2) then
		return false
	end

	return true
end

function slot0.getAcademyTask(slot0, slot1)
	if _.detect(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_TASK_LIST), function (slot0)
		return slot0:getTaskShip() and slot1.groupId == uv0
	end) and not slot4:isEnd() then
		return getActivityTask(slot4, true)
	end
end

function slot0.isFinishPrevTasks(slot0, slot1)
	if Task.New({
		id = slot1
	}):getConfig("open_need") and type(slot3) == "table" and #slot3 > 0 then
		return _.all(slot3, function (slot0)
			slot1 = uv0:getTaskById(slot0) or uv0:getFinishTaskById(slot0)

			return slot1 and slot1:isReceive()
		end)
	end

	return true
end

function slot0.isReceiveTasks(slot0, slot1)
	return _.all(slot1, function (slot0)
		return uv0:getFinishTaskById(slot0) and slot1:isReceive()
	end)
end

function slot0.pushAutoSubmitTask(slot0)
	for slot4, slot5 in pairs(slot0.data) do
		if slot5:getConfig("type") == 10 and slot5:isFinish() then
			slot0:sendNotification(GAME.SUBMIT_TASK, slot5.id)
		end
	end
end

function slot0.triggerClientTasks(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.data) do
		if slot6:isClientTrigger() then
			table.insert(slot1, slot6)
		end
	end

	return slot1
end

return slot0
