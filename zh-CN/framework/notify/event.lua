slot1 = setmetatable
slot2 = string
slot3 = error
slot4 = unpack
slot5 = require("Framework.notify.double-queue")
slot6 = ":"
slot7 = {
	New = function ()
		return uv0({
			stopped = false,
			events = {}
		}, uv1)
	end
}
slot8 = {}
slot9 = {
	__index = slot8
}

function slot10()
	return {
		handlers = uv0.New(),
		pre_emits = uv0.New(),
		post_emits = uv0.New(),
		blocked_handlers = {},
		subevents = {}
	}
end

function slot11(slot0)
	slot1 = {}

	for slot5 in uv0.gmatch(slot0, "[^" .. uv1 .. "]+") do
		slot1[#slot1 + 1] = slot5
	end

	return slot1
end

function slot12(slot0, slot1)
	slot0.events[slot2[1]] = slot0.events[uv0(slot1)[1]] or uv1()

	for slot7 = 2, #slot2, 1 do
		slot8 = slot3.subevents[slot2[slot7]] or uv1()
		slot3.subevents[slot2[slot7]] = slot8
		slot3 = slot8
	end

	return slot3
end

function slot13(slot0, slot1)
	if not slot0.events[uv0(slot1)[1]] then
		return true
	end

	for slot7 = 2, #slot2, 1 do
		if not slot3.subevents[slot2[slot7]] then
			return true
		end

		slot3 = slot8
	end

	return false
end

function slot14(slot0, slot1)
	slot3 = 2
	slot4 = slot0.events[uv0(slot1)[1]]

	return function ()
		if not uv0 then
			return
		end

		slot0 = uv0

		if uv1[uv2] then
			uv0 = uv0.subevents[uv1[uv2]]
			uv2 = uv2 + 1
		else
			uv0 = nil
		end

		return slot0
	end
end

function slot15(slot0, slot1)
	slot2 = uv0.New()
	slot3 = uv0.New()

	for slot7 in uv1(slot0, slot1) do
		slot8 = slot7.pre_emits

		for slot11 in slot8:get_iterator() do
			slot11(slot1)
		end

		slot2:push_back(slot7)
		slot3:push_front(slot7)
	end

	return slot2, slot3
end

function slot16(slot0, slot1)
	for slot5 in slot1:get_iterator() do
		slot6 = slot5.post_emits

		for slot9 in slot6:get_iterator() do
			slot9(slot0)
		end
	end
end

function slot17(slot0, slot1)
	slot2 = slot1.nodes

	for slot5 in slot2:get_iterator() do
		slot6 = slot5.handlers

		for slot9 in slot6:get_iterator() do
			if slot0.stopped then
				return
			end

			if slot5.blocked_handlers[slot9] == 0 then
				if slot1.accumulator then
					slot1.accumulator(slot9(slot1.event_name, uv0(slot1.args)))
				else
					slot9(slot1.event_name, uv0(slot1.args))
				end
			end
		end
	end
end

function slot8.connect(slot0, slot1, slot2)
	slot3 = uv0(slot0, slot1)
	slot4 = slot3.handlers

	slot3.handlers:push_back(slot2)

	if not slot3.blocked_handlers[slot2] then
		slot3.blocked_handlers[slot2] = 0
	end
end

function slot8.disconnect(slot0, slot1, slot2)
	if uv0(slot0, slot1) then
		return
	end

	slot3 = uv1(slot0, slot1)
	slot4 = slot3.handlers

	slot3.handlers:remove(slot2)

	slot3.blocked_handlers[slot2] = nil
end

function slot8.chectConnect(slot0, slot1)
	return not uv0(slot0, slot1)
end

function slot8.block(slot0, slot1, slot2)
	if uv0(slot0, slot1) then
		return
	end

	if uv1(slot0, slot1).blocked_handlers[slot2] then
		slot3.blocked_handlers[slot2] = slot4 + 1
	end
end

function slot8.unblock(slot0, slot1, slot2)
	if uv0(slot0, slot1) then
		return
	end

	if uv1(slot0, slot1).blocked_handlers[slot2] and slot3.blocked_handlers[slot2] > 0 then
		slot3.blocked_handlers[slot2] = slot3.blocked_handlers[slot2] - 1
	end
end

function slot8.emit(slot0, slot1, ...)
	slot0.stopped = false
	slot6.nodes, slot6 = uv0(slot0, slot1)
	slot7[MULTRES] = ...

	uv1(slot0, {
		event_name = slot1,
		nodes = slot2,
		args = {
			...
		}
	})
	uv2(slot1, slot3)
end

function slot8.emit_with_accumulator(slot0, slot1, slot2, ...)
	slot0.stopped = false
	slot7.nodes, slot7 = uv0(slot0, slot1)
	slot8[MULTRES] = ...

	uv1(slot0, {
		event_name = slot1,
		nodes = slot3,
		accumulator = slot2,
		args = {
			...
		}
	})
	uv2(slot1, slot4)
end

function slot8.add_pre_emit(slot0, slot1, slot2)
	slot3 = uv0(slot0, slot1).pre_emits

	uv0(slot0, slot1).pre_emits:push_back(slot2)
end

function slot8.remove_pre_emit(slot0, slot1, slot2)
	if uv0(slot0, slot1) then
		return
	end

	slot3 = uv1(slot0, slot1).pre_emits

	uv1(slot0, slot1).pre_emits:remove(slot2)
end

function slot8.add_post_emit(slot0, slot1, slot2)
	slot3 = uv0(slot0, slot1).post_emits

	uv0(slot0, slot1).post_emits:push_front(slot2)
end

function slot8.remove_post_emit(slot0, slot1, slot2)
	if uv0(slot0, slot1) then
		return
	end

	slot3 = uv1(slot0, slot1).post_emits

	uv1(slot0, slot1).post_emits:remove(slot2)
end

function slot8.stop(slot0)
	slot0.stopped = true
end

function slot8.clear(slot0, slot1)
	if not slot1 then
		slot0.events = {}

		return
	end
end

slot18 = slot7.New()

function slot7.get_global_event()
	return uv0
end

return slot7
