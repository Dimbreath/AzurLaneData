slot0 = class("ActivityPtData")

function slot0.Ctor(slot0, slot1)
	slot0.dropList = slot1:getDataConfig("drop_client")
	slot0.targets = slot1:getDataConfig("target")
	slot0.resId = slot1:getDataConfig("pt")
	slot0.bindActId = slot1:getDataConfig("id_2")
	slot0.unlockDay = slot1:getDataConfig("day_unlock")
	slot0.type = slot1:getDataConfig("type")

	slot0:Update(slot1)
end

function slot0.Update(slot0, slot1)
	slot0.activity = slot1
	slot0.count = slot1.data1
	slot0.level = 0
	slot2 = {}

	for slot6, slot7 in ipairs(slot1.data1_list) do
		table.insert(slot2, slot7)
	end

	table.sort(slot2)

	for slot6, slot7 in ipairs(slot2) do
		if slot7 == slot0.targets[slot6] then
			slot0.level = slot6
		else
			break
		end
	end

	slot0.startTime = slot1.data2
	slot0.value2 = slot1.data3
	slot0.isDayUnlock = (slot0:CheckDayUnlock() and 1) or 0
end

function slot0.CheckDayUnlock(slot0)
	slot2 = pg.TimeMgr.GetInstance()

	return slot2:DiffDay(slot0.startTime, slot2:GetServerTime()) + 1 >= (slot0.unlockDay[math.min(slot0.level + 1, #slot0.targets)] or 0)
end

function slot0.GetLevelProgress(slot0)
	return slot0:getTargetLevel(), #slot0.targets, slot0.getTargetLevel() / #slot0.targets
end

function slot0.GetResProgress(slot0)
	return slot0.count, slot0.targets[slot0:getTargetLevel()], slot0.count / slot0.targets[slot0.getTargetLevel()]
end

function slot0.GetUnlockedMaxResRequire(slot0)
	slot1 = pg.TimeMgr.GetInstance()
	slot2 = slot1:DiffDay(slot0.startTime, slot1:GetServerTime()) + 1

	for slot6 = #slot0.targets, 1, -1 do
		if slot0.unlockDay[slot6] <= slot2 then
			return slot0.targets[slot6]
		end
	end

	return 1
end

function slot0.GetTotalResRequire(slot0)
	return slot0.targets[#slot0.targets]
end

function slot0.GetId(slot0)
	return slot0.activity.id
end

function slot0.GetRes(slot0)
	return {
		type = 1,
		id = slot0.resId
	}
end

function slot0.GetAward(slot0)
	return {
		type = slot0.dropList[slot0:getTargetLevel()][1],
		id = slot0.dropList[slot0.getTargetLevel()][2],
		count = slot0.dropList[slot0.getTargetLevel()][3]
	}
end

function slot0.GetResItemId(slot0)
	return slot0:GetAward().id
end

function slot0.GetValue2(slot0)
	return slot0.value2
end

function slot0.GetBg(slot0)
	return slot0.activity:getConfig("bg")[1]
end

function slot0.getTargetLevel(slot0)
	return math.min(slot0.level + slot0.isDayUnlock, #slot0.targets)
end

function slot0.CanGetAward(slot0)
	return slot0:CanGetNextAward() and function ()
		slot0, slot1, slot2 = slot0:GetResProgress()

		return slot2 >= 1
	end()
end

function slot0.CanGetNextAward(slot0)
	return slot0.isDayUnlock > 0 and slot0.level < #slot0.targets
end

function slot0.CanGetMorePt(slot0)
	return getProxy(ActivityProxy):getActivityById(slot0.bindActId) and not slot1:isEnd()
end

return slot0
