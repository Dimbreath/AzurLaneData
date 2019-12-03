slot0 = class("Map", import(".BaseVO"))
slot0.INVALID = 0
slot0.SCENARIO = 1
slot0.ELITE = 2
slot0.EVENT = 3
slot0.ACTIVITY_EASY = 4
slot0.ACTIVITY_HARD = 5
slot0.SHAM = 6
slot0.GUILD_BOSS = 7
slot0.ACT_EXTRA = 8
slot0.ESCORT = 9
slot0.SKIRMISH = 10
slot0.NORMAL_MAP = {
	slot0.INVALID,
	slot0.SCENARIO,
	slot0.ELITE,
	slot0.EVENT,
	slot0.ACTIVITY_EASY,
	slot0.ACTIVITY_HARD,
	slot0.SHAM,
	slot0.GUILD_BOSS,
	slot0.ACT_EXTRA
}

slot0.Ctor = function (slot0, slot1)
	slot0.configId = slot1.id
	slot0.id = slot0.configId
	slot0.chapters = slot1.chapters or {}
	slot0.unlock = false
end

slot0.bindConfigTable = function (slot0)
	return pg.expedition_data_by_map
end

slot0.isInValidMap = function (slot0)
	slot1 = slot0:getMapType()

	if not slot0:isRemaster() and (slot1 == slot0.ACTIVITY_EASY or slot1 == slot0.ACTIVITY_HARD or slot0.ACT_EXTRA == slot1) then
		if slot0:getConfig("on_activity") == 0 then
			return true
		end

		return not getProxy(ActivityProxy):getActivityById(slot2) or slot3:isEnd()
	else
		return false
	end
end

slot0.setUnlock = function (slot0, slot1)
	slot0.unlock = slot1
end

slot0.isUnlock = function (slot0)
	return slot0.unlock
end

slot0.setRemaster = function (slot0, slot1)
	slot0.remasterId = slot1
end

slot0.isRemaster = function (slot0)
	return slot0.remasterId ~= nil
end

slot0.getMapType = function (slot0)
	return slot0:getConfig("type")
end

slot0.getMapTitleNumber = function (slot0)
	return slot0:getConfig("title")
end

slot0.setBindMapVO = function (slot0, slot1)
	slot0.bindingMap = slot1
end

slot0.getBindMap = function (slot0)
	return slot0:getConfig("bind_map")
end

slot0.updateChapter = function (slot0, slot1)
	slot0.chapters[slot1.id] = slot1
end

slot0.removeChapter = function (slot0, slot1)
	slot0.chapters[slot1] = nil
end

slot0.getChapters = function (slot0)
	return slot0.chapters
end

slot0.getChapter = function (slot0, slot1)
	return slot0.chapters[slot1]
end

slot0.getActiveChapter = function (slot0)
	for slot4, slot5 in pairs(slot0.chapters) do
		if slot5.active then
			return slot5
		end
	end
end

slot0.updateChapters = function (slot0, slot1)
	for slot5, slot6 in pairs(slot0.chapters) do
		if slot6:getConfig("pre_chapter") == 0 then
			slot6:setUnlock(true)
		else
			slot8 = slot6:getConfig("act_id")

			if not slot0:isRemaster() and slot8 > 0 then
				slot6:setUnlock(getProxy(ActivityProxy):getActivityById(slot8) and not slot10:isEnd() and getProxy(ChapterProxy):getChapterById(slot7):isClear())
			elseif not slot0.chapters[slot7] then
				slot6:setUnlock(slot1 and slot1:isClear())
			else
				slot6:setUnlock(slot9:isClear())
			end
		end
	end
end

slot0.isClear = function (slot0)
	if slot0:getMapType() == slot0.SCENARIO or slot1 == slot0.ACTIVITY_EASY then
		for slot5, slot6 in pairs(slot0.chapters) do
			if not slot6:isClear() then
				return false
			end
		end
	end

	return true
end

slot0.isEliteEnabled = function (slot0)
	slot1 = nil

	if slot0:getMapType() == slot0.ELITE then
		if not slot0.bindingMap then
			return false
		end

		if not slot0.bindingMap.bindingMap then
			return false
		end

		slot1 = slot0.bindingMap.chapters
	else
		slot1 = slot0.chapters
	end

	for slot5, slot6 in pairs(slot1) do
		if not slot6:isClear() or not slot6:isAllAchieve() then
			return false
		end
	end

	return true
end

slot0.isAnyChapterUnlocked = function (slot0)
	return _.any(_.values(slot0.chapters), function (slot0)
		return slot0:isUnlock()
	end)
end

slot0.isActivity = function (slot0)
	return slot0:getConfig("type") == Map.EVENT or slot1 == Map.ACTIVITY_HARD or slot1 == Map.ACTIVITY_EASY or slot1 == Map.ACT_EXTRA
end

slot0.isClearForActivity = function (slot0)
	for slot4, slot5 in pairs(slot0.chapters) do
		if not slot5:isClear() then
			return false
		end
	end

	return true
end

slot0.isActExtra = function (slot0)
	return slot0:getConfig("type") == slot0.ACT_EXTRA
end

slot0.isGuildBoss = function (slot0)
	return slot0:getConfig("type") == Map.GUILD_BOSS
end

slot0.isSham = function (slot0)
	return slot0:getConfig("type") == Map.SHAM
end

slot0.isEscort = function (slot0)
	return slot0:getConfig("type") == Map.ESCORT
end

slot0.isSkirmish = function (slot0)
	return slot0:getConfig("type") == Map.SKIRMISH
end

slot0.isNormalMap = function (slot0)
	return table.contains(Map.NORMAL_MAP, slot0:getConfig("type"))
end

slot0.IsType = function (slot0, slot1)
	if Map.bindConfigTable()[slot0] then
		return slot3.type == slot1
	end
end

slot0.NeedRecordMap = function (slot0)
	return slot0:getConfig("type") == slot0.INVALID or slot1 == slot0.SCENARIO or slot1 == slot0.ELITE
end

slot0.existHardMap = function (slot0)
	slot1 = 10
	slot2 = slot0:getConfigTable()

	while slot2 ~= nil and slot1 > 0 do
		if slot2.type == slot0.ACTIVITY_HARD or slot2.type == slot0.ELITE then
			return true
		end

		slot2 = pg.expedition_data_by_map[slot2.bind_map]
		slot1 = slot1 - 1
	end

	return false
end

return slot0
