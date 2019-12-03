slot0 = class("BillboardProxy", import(".NetProxy"))
slot0.FETCH_LIST_DONE = "BillboardProxy:FETCH_LIST_DONE"
slot0.NONTIMER = {}

slot0.register = function (slot0)
	slot0.NONTIMER = {
		PowerRank.TYPE_MILITARY_RANK
	}
	slot0.data = {}
	slot0.playerData = {}
	slot0.timers = {}
	slot0.hashList = {}
	slot0.hashCount = 0
end

slot0.setPlayerRankData = function (slot0, slot1, slot2, slot3)
	slot4 = slot0:getHashId(slot1, slot2)

	if table.contains(slot0.NONTIMER, slot1) then
		return
	end

	slot0.playerData[slot4] = slot3
end

slot0.getPlayerRankData = function (slot0, slot1, slot2)
	return slot0.playerData[slot0:getHashId(slot1, slot2)]
end

slot0.setRankList = function (slot0, slot1, slot2, slot3)
	slot4 = slot0:getHashId(slot1, slot2)

	if table.contains(slot0.NONTIMER, slot1) then
		return
	end

	if not slot0.data[slot4] then
		slot0:addTimer(slot1, slot2, GetHalfHour())
	end

	slot0.data[slot4] = slot3
end

slot0.getRankList = function (slot0, slot1, slot2)
	return slot0.data[slot0:getHashId(slot1, slot2)]
end

slot0.addTimer = function (slot0, slot1, slot2, slot3)
	if slot0.timers[slot0:getHashId(slot1, slot2)] then
		slot0.timers[slot4]:Stop()

		slot0.timers[slot4] = nil
	end

	slot0.timers[slot4] = Timer.New(function ()
		slot0.timers[slot1]:Stop()

		slot0.timers[slot1].Stop.timers[slot0.timers[slot1]] = nil

		slot0.timers[slot1].Stop.timers:sendNotification(GAME.GET_POWERRANK, {
			type = slot2,
			activityId = 
		})
		slot0.timers[slot1].Stop.timers.sendNotification:addTimer(GAME.GET_POWERRANK, , GetHalfHour())
	end, slot3 - pg.TimeMgr.GetInstance():GetServerTime(), 1)

	slot0.timers[slot4]:Start()
end

slot0.remove = function (slot0)
	for slot4, slot5 in pairs(slot0.timers) do
		slot5:Stop()
	end

	slot0.timers = nil
end

slot0.canFetch = function (slot0, slot1, slot2)
	return table.contains(slot0.NONTIMER, slot1) or slot0.timers[slot0:getHashId(slot1, slot2)] == nil
end

slot0.getHashId = function (slot0, slot1, slot2)
	slot3 = nil

	if slot2 then
		slot0.hashList[slot1] = slot0.hashList[slot1] or {}
		slot3 = slot0.hashList[slot1][slot2]
	else
		slot3 = slot0.hashList[slot1]
	end

	if slot3 then
		return slot3
	else
		slot0.hashCount = slot0.hashCount + 1

		if slot2 then
			slot0.hashList[slot1][slot2] = slot0.hashCount
		else
			slot0.hashList[slot1] = slot0.hashCount
		end

		return slot0.hashCount
	end
end

return slot0
