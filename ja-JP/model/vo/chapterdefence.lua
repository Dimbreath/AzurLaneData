slot0 = class("ChapterDefence")

function slot0.bindConfigTable(slot0)
	return pg.chapter_defense
end

function slot0.GetConfigByID(slot0, slot1)
	return uv0.bindConfigTable()[slot0]
end

function slot0.Ctor(slot0, slot1)
	slot0.configId = slot1.id
	slot0.id = slot0.configId
end

function slot0.__index(slot0, slot1)
	if slot1 == "fleet" then
		return slot0.fleets[slot0.findex]
	end

	return rawget(slot0, slot1) or uv0[slot1] or uv0.super[slot1]
end

return slot0
