ys = ys or {}
ys.Event = class("Event")
ys.Event.__name = "Event"

function ys.Event.Ctor(slot0, slot1, slot2, slot3)
	slot0.ID = slot1
	slot0.Data = slot2
	slot0.Dispatcher = slot3
end

return ys.Event
