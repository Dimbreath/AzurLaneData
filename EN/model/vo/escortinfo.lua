slot0 = class("EscortInfo", import(".BaseVO"))

slot0.Ctor = function (slot0, slot1)
	slot0.id = slot1
	slot0.configId = slot0.id
	slot0.chapters = {}
end

slot0.bindConfigTable = function (slot0)
	return pg.escort_map_template
end

slot0.shouldFetch = function (slot0)
	return false
end

slot0.getEscort = function (slot0, slot1)
	return _.detect(slot0.chapters, function (slot0)
		return slot0.chapter.id == slot0
	end) and slot2.escortId
end

return slot0
