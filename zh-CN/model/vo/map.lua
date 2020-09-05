slot0 = class("Map", import(".BaseVO"))
slot0.INVALID = 0
slot0.SCENARIO = 1
slot0.ELITE = 2
slot0.EVENT = 3
slot0.ACTIVITY_EASY = 4
slot0.ACTIVITY_HARD = 5
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

function slot0.Ctor(slot0, slot1)
	slot0.configId = slot1.id
	slot0.id = slot0.configId
	slot0.chapters = slot1.chapters or {}
	slot0.unlock = false
end

function slot0.bindConfigTable(slot0)
	return pg.expedition_data_by_map
end

function slot0.isInValidMap(slot0)
	slot1 = slot0:getMapType()

	if not slot0:isRemaster() and (slot1 == uv0.ACTIVITY_EASY or slot1 == uv0.ACTIVITY_HARD or uv0.ACT_EXTRA == slot1) then
		if slot0:getConfig("on_activity") == 0 then
			return true
		end

		return not getProxy(ActivityProxy):getActivityById(slot2) or slot3:isEnd()
	else
		return false
	end
end

function slot0.setUnlock(slot0, slot1)
	slot0.unlock = slot1
end

function slot0.isUnlock(slot0)
	return slot0.unlock
end

function slot0.setRemaster(slot0, slot1)
	slot0.remasterId = slot1
end

function slot0.isRemaster(slot0)
	return slot0.remasterId ~= nil
end

function slot0.getMapType(slot0)
	return slot0:getConfig("type")
end

function slot0.getMapTitleNumber(slot0)
	return slot0:getConfig("title")
end

function slot0.setBindMapVO(slot0, slot1)
	slot0.bindingMap = slot1
end

function slot0.getBindMap(slot0)
	return slot0:getConfig("bind_map")
end

function slot0.updateChapter(slot0, slot1)
	slot0.chapters[slot1.id] = slot1
end

function slot0.removeChapter(slot0, slot1)
	slot0.chapters[slot1] = nil
end

function slot0.getChapters(slot0)
	return slot0.chapters
end

function slot0.getChapter(slot0, slot1)
	return slot0.chapters[slot1]
end

function slot0.getActiveChapter(slot0)
	for slot4, slot5 in pairs(slot0.chapters) do
		if slot5.active then
			return slot5
		end
	end
end

function slot0.updateChapters(slot0, slot1)
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

function slot0.isClear(slot0)
	if slot0:getMapType() == uv0.SCENARIO or slot1 == uv0.ACTIVITY_EASY then
		for slot5, slot6 in pairs(slot0.chapters) do
			if not slot6:isClear() then
				return false
			end
		end
	end

	return true
end

function slot0.isEliteEnabled(slot0)
	slot1 = nil

	if slot0:getMapType() == uv0.ELITE then
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

function slot0.isAnyChapterUnlocked(slot0)
	return _.any(_.values(slot0.chapters), function (slot0)
		return slot0:isUnlock()
	end)
end

function slot0.isActivity(slot0)
	return slot0:getConfig("type") == Map.EVENT or slot1 == Map.ACTIVITY_HARD or slot1 == Map.ACTIVITY_EASY or slot1 == Map.ACT_EXTRA
end

function slot0.isClearForActivity(slot0)
	for slot4, slot5 in pairs(slot0.chapters) do
		if not slot5:isClear() then
			return false
		end
	end

	return true
end

function slot0.isActExtra(slot0)
	return slot0:getConfig("type") == uv0.ACT_EXTRA
end

function slot0.isEscort(slot0)
	return slot0:getConfig("type") == Map.ESCORT
end

function slot0.isSkirmish(slot0)
	return slot0:getConfig("type") == Map.SKIRMISH
end

function slot0.isNormalMap(slot0)
	return table.contains(Map.NORMAL_MAP, slot0:getConfig("type"))
end

function slot0.IsType(slot0, slot1)
	if Map.bindConfigTable()[slot0] then
		return slot3.type == slot1
	end
end

function slot0.StaticIsActivity(slot0)
	if Map.bindConfigTable()[slot0] then
		return slot2.type == Map.EVENT or slot3 == Map.ACTIVITY_HARD or slot3 == Map.ACTIVITY_EASY or slot3 == Map.ACT_EXTRA
	end
end

function slot0.NeedRecordMap(slot0)
	return slot0:getConfig("type") == uv0.INVALID or slot1 == uv0.SCENARIO or slot1 == uv0.ELITE
end

function slot0.existHardMap(slot0)
	slot1 = 10
	slot2 = slot0:getConfigTable()

	while slot2 ~= nil and slot1 > 0 do
		if slot2.type == uv0.ACTIVITY_HARD or slot2.type == uv0.ELITE then
			return true
		end

		slot2 = pg.expedition_data_by_map[slot2.bind_map]
		slot1 = slot1 - 1
	end

	return false
end

return slot0
