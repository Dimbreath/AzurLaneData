slot0 = class("EventProxy", import(".NetProxy"))
slot0.EVENT_FLUSHTIMES_UPDATED = "EventProxy:EVENT_FLUSHTIMES_UPDATED"

slot0.register = function (slot0)
	slot0.flushTimes = 0
	slot0.eventList = {}

	slot0:on(13002, function (slot0)
		slot0.maxFleetNums = slot0.max_team

		slot0:updateInfo(slot0)
	end)
	slot0:on(13011, function (slot0)
		for slot4, slot5 in ipairs(slot0.collection) do
			slot6 = EventInfo.New(slot5)
			slot7, slot8 = slot0:findInfoById(slot5.id)

			if slot8 == -1 then
				table.insert(slot0.eventList, slot6)

				slot0.eventForMsg = slot6
			else
				slot0.eventList[slot8] = slot6
			end
		end

		slot0.virgin = true

		slot0.facade:sendNotification(GAME.EVENT_LIST_UPDATE)
	end)

	slot0.timer = Timer.New(function ()
		slot0:updateTime()
	end, 1, -1)

	slot0.timer:Start()
end

slot0.remove = function (slot0)
	if slot0.timer then
		slot0.timer:Stop()

		slot0.timer = nil
	end
end

slot0.updateInfo = function (slot0, slot1)
	slot0.eventList = {}

	if slot1.result == nil or slot1.result == 0 then
		slot0.flushTimes = slot1.flash_count

		for slot5, slot6 in ipairs(slot1.collection_list) do
			table.insert(slot0.eventList, EventInfo.New(slot6))
		end

		slot0.facade:sendNotification(GAME.EVENT_LIST_UPDATE)
	end
end

slot0.resetFlushTimes = function (slot0)
	slot0.flushTimes = 0

	slot0.facade:sendNotification(slot0.EVENT_FLUSHTIMES_UPDATED)
end

slot0.getActiveShipIds = function (slot0)
	slot1 = {}

	for slot5, slot6 in ipairs(slot0.eventList) do
		if slot6.state ~= EventInfo.StateNone then
			for slot10, slot11 in ipairs(slot6.shipIds) do
				table.insert(slot1, slot11)
			end
		end
	end

	return slot1
end

slot0.findInfoById = function (slot0, slot1)
	for slot5, slot6 in ipairs(slot0.eventList) do
		if slot6.id == slot1 then
			return slot6, slot5
		end
	end

	return nil, -1
end

slot0.countByState = function (slot0, slot1)
	slot2 = 0

	for slot6, slot7 in ipairs(slot0.eventList) do
		if slot7.state == slot1 then
			slot2 = slot2 + 1
		end
	end

	return slot2
end

slot0.hasFinishState = function (slot0)
	if slot0:countByState(EventInfo.StateFinish) > 0 then
		return true
	end
end

slot0.countBusyFleetNums = function (slot0)
	slot1 = 0

	for slot5, slot6 in ipairs(slot0.eventList) do
		if slot6.state ~= EventInfo.StateNone then
			slot1 = slot1 + 1
		end
	end

	return slot1
end

slot0.updateTime = function (slot0)
	slot1 = false

	for slot5, slot6 in pairs(slot0.eventList) do
		if slot6:updateTime() then
			slot1 = true
		end
	end

	if slot1 then
		slot0:sendNotification(GAME.EVENT_LIST_UPDATE)
	end
end

slot0.getEventList = function (slot0)
	return Clone(slot0.eventList)
end

slot0.getActiveEvents = function (slot0)
	slot1 = {}

	for slot5, slot6 in ipairs(slot0.eventList) do
		if pg.TimeMgr.GetInstance():GetServerTime() <= slot6.finishTime then
			table.insert(slot1, slot6)
		end
	end

	return slot1
end

slot0.fillRecommendShip = function (slot0, slot1)
	for slot7, slot8 in ipairs(slot3) do
		table.insert(slot1.shipIds, slot8)
	end
end

return slot0
