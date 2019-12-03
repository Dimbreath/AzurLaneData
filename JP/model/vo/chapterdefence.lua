slot0 = class("ChapterDefence")

slot0.bindConfigTable = function (slot0)
	return pg.chapter_defense
end

slot0.GetConfigByID = function (slot0, slot1)
	return slot0.bindConfigTable()[slot0]
end

slot0.Ctor = function (slot0, slot1)
	slot0.configId = slot1.id
	slot0.id = slot0.configId
end

slot0.__index = function (slot0, slot1)
	if slot1 == "fleet" then
		return slot0.fleets[slot0.findex]
	end

	return rawget(slot0, slot1) or slot0[slot1] or slot0.super[slot1]
end

return slot0
