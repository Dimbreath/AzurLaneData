slot0 = class("EscortInfo", import(".BaseVO"))

function slot0.Ctor(slot0, slot1)
	slot0.id = slot1
	slot0.configId = slot0.id
	slot0.chapters = {}
end

function slot0.bindConfigTable(slot0)
	return pg.escort_map_template
end

function slot0.shouldFetch(slot0)
	return false
end

function slot0.getEscort(slot0, slot1)
	return _.detect(slot0.chapters, function (slot0)
		return slot0.chapter.id == slot0
	end) and slot2.escortId
end

return slot0
