slot0 = class("Technology", import(".BaseVO"))
slot0.STATE_IDLE = 1
slot0.STATE_STARTING = 2
slot0.STATE_FINISHED = 3

slot0.Ctor = function (slot0, slot1)
	slot0.id = slot1.id
	slot0.configId = slot0.id
	slot0.poolId = slot1.pool_id
	slot0.time = slot1.time
	slot0.state = (slot0.time > 0 and slot0.STATE_STARTING) or slot0.STATE_IDLE

	if slot0.time > 0 and slot0:canFinish() then
		slot0.state = slot0.STATE_FINISHED
	end
end

slot0.isStart = function (slot0)
	return slot0.state == slot0.STATE_STARTING or slot0.state == slot0.STATE_FINISHED
end

slot0.isStarting = function (slot0)
	return slot0.STATE_STARTING == slot0.state
end

slot0.start = function (slot0)
	slot0.time = pg.TimeMgr.GetInstance():GetServerTime() + slot0:getConfig("time")
	slot0.state = slot0.STATE_STARTING
end

slot0.getFinishTime = function (slot0)
	return slot0.time
end

slot0.isFinished = function (slot0)
	if slot0.time == 0 then
		return false
	end

	slot1 = pg.TimeMgr.GetInstance():GetServerTime()

	if not slot0:hasCondition() then
		return slot0.time <= slot1
	else
		slot3 = getProxy(TaskProxy):getTaskById(slot0:getTaskId())

		return slot0.time <= slot1 and slot3:getConfig("target_num") <= slot3.progress
	end
end

slot0.getState = function (slot0)
	return slot0.state
end

slot0.bindConfigTable = function (slot0)
	return pg.technology_data_template
end

slot0.hasCondition = function (slot0)
	return slot0:getConfig("condition") ~= 0
end

slot0.getTaskId = function (slot0)
	if slot0:hasCondition() then
		return slot0:getConfig("condition")
	end
end

slot0.canFinish = function (slot0)
	if slot0:isStarting() and slot0.time <= pg.TimeMgr.GetInstance():GetServerTime() then
		if slot0:hasCondition() then
			if getProxy(TaskProxy):getTaskById(slot0:getTaskId()) and slot3:isFinish() then
				return true
			end
		else
			return true
		end
	end

	return false
end

slot0.finish = function (slot0)
	slot0.state = slot0.STATE_FINISHED
end

slot0.hasResToStart = function (slot0)
	slot2 = getProxy(PlayerProxy):getData()
	slot3 = getProxy(BagProxy)

	for slot7, slot8 in ipairs(slot1) do
		if slot8[1] == DROP_TYPE_RESOURCE and slot2:getResById(slot8[2]) < slot8[3] then
			return false, i18n("common_no_resource")
		elseif slot8[1] == DROP_TYPE_ITEM and slot3:getItemCountById(slot8[2]) < slot8[3] then
			return false, i18n("common_no_item_1")
		end
	end

	return true
end

slot0.reset = function (slot0)
	slot0.time = 0
	slot0.state = slot0.STATE_IDLE
end

return slot0
