pg = pg or {}
pg.Protocol = class("Protocol")

function pg.Protocol.Ctor(slot0, slot1, slot2, slot3)
	slot0._id = slot1
	slot0._name = slot2
	slot0._object = slot3
end

function pg.Protocol.GetMessage(slot0)
	return slot0._object[slot0._name]()
end

function pg.Protocol.GetId(slot0)
	return slot0._id
end

function pg.Protocol.GetName(slot0)
	return slot0._name
end

return
