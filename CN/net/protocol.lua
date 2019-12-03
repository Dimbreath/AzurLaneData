pg = pg or {}
pg.Protocol = class("Protocol")

pg.Protocol.Ctor = function (slot0, slot1, slot2, slot3)
	slot0._id = slot1
	slot0._name = slot2
	slot0._object = slot3
end

pg.Protocol.GetMessage = function (slot0)
	return slot0._object[slot0._name]()
end

pg.Protocol.GetId = function (slot0)
	return slot0._id
end

pg.Protocol.GetName = function (slot0)
	return slot0._name
end

return
