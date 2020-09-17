slot0 = class("ActivityLevelConst")

function slot0.hasExtraMap(slot0)
	for slot4, slot5 in pairs(slot0) do
		if slot5:isActExtra() then
			return slot5
		end
	end

	return nil
end

function slot0.isClearMaps(slot0, slot1)
	for slot5, slot6 in pairs(slot0) do
		if slot6:getConfig("type") == slot1 and not slot6:isClearAllChapters() then
			return false
		end
	end

	return true
end

function slot0.canSwitchToEx(slot0, slot1)
	slot3 = false

	for slot7, slot8 in pairs(slot1.chapters) do
		if slot8:getConfig("pre_chapter") == 0 or function (slot0)
			if uv0[pg.chapter_template[slot0].map] then
				return slot2:getChapter(slot0):isClear()
			end
		end(slot9) then
			slot3 = true

			break
		end
	end

	return slot3
end

function slot0.getMapsByType(slot0, slot1, slot2)
	slot3 = {}

	for slot7, slot8 in pairs(slot0) do
		if slot8:getConfig("type") == slot1 and slot8:getConfig("on_activity") == slot2 then
			table.insert(slot3, slot8)
		end
	end

	table.sort(slot3, function (slot0, slot1)
		return slot0.id < slot1.id
	end)

	return slot3
end

function slot0.getMapsByActivityType(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(slot0) do
		if slot7:IsZprojectActiveMap() and pg.activity_template[slot7:getConfig("on_activity")] and slot8.type == slot1 then
			table.insert(slot2, slot7)
		end
	end

	table.sort(slot2, function (slot0, slot1)
		return slot0.id < slot1.id
	end)

	return slot2
end

function slot0.isExtraBossChapter(slot0, slot1)
	return slot0:getConfig("config_data")[1] == slot1
end

function slot0.getExtraChapterSocre(slot0, slot1, slot2, slot3)
	if not slot3 or slot3:isEnd() then
		return 0, 0
	end

	slot5 = 0
	slot6 = 0

	if slot3:getConfig("config_data") then
		slot5 = math.max((slot4[2] / math.pow(slot1 + slot4[3], slot4[4]) - math.pow(slot2, slot4[5])) * slot4[6], 1)
	end

	return math.floor(slot5), math.floor(slot3:getData1() or 0)
end

function slot0.getShipsPower(slot0)
	for slot5, slot6 in pairs(slot0) do
		slot1 = 0 + math.floor(slot6:getShipCombatPower())
	end

	return slot1
end

return slot0
