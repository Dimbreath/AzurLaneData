slot0 = class("BaseEventLogic")
slot1 = require("Framework.notify.event")

function slot0.Ctor(slot0, slot1)
	slot0.eventStore = {}
	slot0.event = slot1 or slot0.New()
end

function slot0.bind(slot0, slot1, slot2)
	slot0.event:connect(slot1, slot2)
	table.insert(slot0.eventStore, {
		event = slot1,
		callback = slot2
	})
end

function slot0.emit(slot0, ...)
	if slot0.event then
		slot0.event:emit(...)
	end
end

function slot0.disposeEvent(slot0)
	for slot4, slot5 in ipairs(slot0.eventStore) do
		slot0.event:disconnect(slot5.event, slot5.callback)
	end

	slot0.eventStore = {}
end

return slot0
