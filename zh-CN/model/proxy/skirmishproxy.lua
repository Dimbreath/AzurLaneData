slot0 = class("SkirmishProxy", import(".NetProxy"))

function slot0.register(slot0)
	slot0.data = {}

	slot0:BuildSkirmishData()
end

slot0.SkirmishMap = 1250022

function slot0.BuildSkirmishData(slot0)
	for slot5, slot6 in pairs(SkirmishVO:bindConfigTable().all) do
		table.insert(slot0.data, SkirmishVO.New(slot1[slot6].id))
	end
end

function slot0.TryFetchNewTask(slot0)
	if getProxy(ActivityProxy):getActivityById(ActivityConst.ACTIVITY_ID_US_SKIRMISH) and not slot2:isEnd() then
		return updateActivityTaskStatus(slot2)
	end
end

function slot0.UpdateSkirmishProgress(slot0)
	slot3 = slot0.data
	activeAmount = math.min(getProxy(ActivityProxy):getActivityById(ActivityConst.ACTIVITY_ID_US_SKIRMISH):getDayIndex(), #slot3)
	slot5 = false

	for slot9 = #slot3, 1, -1 do
		v = slot3[slot9]
		slot11 = getProxy(TaskProxy):getTaskVO(v:getConfig("task_id"))
		slot12 = nil

		if activeAmount < slot9 then
			slot12 = SkirmishVO.StateInactive
		elseif slot11 then
			if slot11:isReceive() then
				slot12 = SkirmishVO.StateClear
				slot5 = slot5 or slot9 <= activeAmount
			elseif not slot11:isFinish() then
				slot12 = SkirmishVO.StateWorking
				slot5 = true
			else
				slot12 = SkirmishVO.StateWorking
				slot5 = true
			end
		else
			slot12 = (not slot5 or SkirmishVO.StateClear) and SkirmishVO.StateActive
		end

		v:SetState(slot12)
	end
end

return slot0
