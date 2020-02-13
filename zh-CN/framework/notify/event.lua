slot0 = require
slot1 = setmetatable
slot2 = string
slot3 = error
slot4 = unpack
slot5 = slot0
slot6 = "Framework.notify.double-queue"
slot5 = slot5(slot6)
slot6 = ":"
slot7 = {}
slot8 = {}
slot9 = {
	__index = slot8
}

function slot10()
	slot0 = {}
	slot1 = slot0
	slot1 = slot1.New
	slot1 = slot1()
	slot0.handlers = slot1
	slot1 = slot0
	slot1 = slot1.New
	slot1 = slot1()
	slot0.pre_emits = slot1
	slot1 = slot0
	slot1 = slot1.New
	slot1 = slot1()
	slot0.post_emits = slot1
	slot1 = {}
	slot0.blocked_handlers = slot1
	slot1 = {}
	slot0.subevents = slot1

	return slot0
end

function slot11(slot0)
	slot1 = {}
	slot2 = slot0
	slot2 = slot2.gmatch
	slot3 = slot0
	slot4 = "[^"
	slot5 = slot1
	slot6 = "]+"
	slot4 = slot4 .. slot5 .. slot6
	slot2, slot3, slot4 = slot2(slot3, slot4)

	for slot5 in slot2, slot3, slot4 do
		slot6 = #slot1
		slot6 = slot6 + 1
		slot1[slot6] = slot5
	end

	return slot1
end

function slot12(slot0, slot1)
	slot2 = slot0
	slot3 = slot1
	slot2 = slot2(slot3)
	slot3 = slot0.events
	slot4 = slot2[1]
	slot3 = slot3[slot4]

	if not slot3 then
		slot3 = slot1
		slot3 = slot3()
	end

	slot4 = slot0.events
	slot5 = slot2[1]
	slot4[slot5] = slot3
	slot4 = 2
	slot5 = #slot2
	slot6 = 1

	for slot7 = slot4, slot5, slot6 do
		slot8 = slot3.subevents
		slot9 = slot2[slot7]
		slot8 = slot8[slot9]

		if not slot8 then
			slot8 = slot1
			slot8 = slot8()
		end

		slot9 = slot3.subevents
		slot10 = slot2[slot7]
		slot9[slot10] = slot8
		slot3 = slot8
	end

	return slot3
end

function slot13(slot0, slot1)
	slot2 = slot0
	slot3 = slot1
	slot2 = slot2(slot3)
	slot3 = slot0.events
	slot4 = slot2[1]
	slot3 = slot3[slot4]

	if not slot3 then
		slot4 = true

		return slot4
	end

	slot4 = 2
	slot5 = #slot2
	slot6 = 1

	for slot7 = slot4, slot5, slot6 do
		slot8 = slot3.subevents
		slot9 = slot2[slot7]
		slot8 = slot8[slot9]

		if not slot8 then
			slot9 = true

			return slot9
		end

		slot3 = slot8
	end

	slot4 = false

	return slot4
end

function slot14(slot0, slot1)
	slot2 = slot0
	slot3 = slot1
	slot2 = slot2(slot3)
	slot3 = 2
	slot4 = slot0.events
	slot5 = slot2[1]
	slot4 = slot4[slot5]

	function slot5()
		slot0 = slot0

		if not slot0 then
			return
		end

		slot0 = slot0
		slot1 = slot1
		slot2 = slot2
		slot1 = slot1[slot2]

		if slot1 then
			slot1 = slot0
			slot1 = slot1.subevents
			slot2 = slot1
			slot3 = slot2
			slot2 = slot2[slot3]
			slot1 = slot1[slot2]
			slot0 = slot1
			slot1 = slot2
			slot1 = slot1 + 1
			slot2 = slot1
		else
			slot0 = nil
		end

		return slot0
	end

	return slot5
end

function slot15(slot0, slot1)
	slot2 = slot0
	slot2 = slot2.New
	slot2 = slot2()
	slot3 = slot0
	slot3 = slot3.New
	slot3 = slot3()
	slot4 = slot1
	slot5 = slot0
	slot6 = slot1
	slot4, slot5, slot6 = slot4(slot5, slot6)

	for slot7 in slot4, slot5, slot6 do
		slot8 = slot7.pre_emits
		slot9 = slot8
		slot8 = slot8.get_iterator
		slot8, slot9, slot10 = slot8(slot9)

		for slot11 in slot8, slot9, slot10 do
			slot12 = slot11
			slot13 = slot1

			slot12(slot13)
		end

		slot9 = slot2
		slot8 = slot2.push_back
		slot10 = slot7

		slot8(slot9, slot10)

		slot9 = slot3
		slot8 = slot3.push_front
		slot10 = slot7

		slot8(slot9, slot10)
	end

	slot4 = slot2
	slot5 = slot3

	return slot4, slot5
end

function slot16(slot0, slot1)
	slot3 = slot1
	slot2 = slot1.get_iterator
	slot2, slot3, slot4 = slot2(slot3)

	for slot5 in slot2, slot3, slot4 do
		slot6 = slot5.post_emits
		slot7 = slot6
		slot6 = slot6.get_iterator
		slot6, slot7, slot8 = slot6(slot7)

		for slot9 in slot6, slot7, slot8 do
			slot10 = slot9
			slot11 = slot0

			slot10(slot11)
		end
	end
end

function slot17(slot0, slot1)
	slot2 = slot1.nodes
	slot3 = slot2
	slot2 = slot2.get_iterator
	slot2, slot3, slot4 = slot2(slot3)

	for slot5 in slot2, slot3, slot4 do
		slot6 = slot5.handlers
		slot7 = slot6
		slot6 = slot6.get_iterator
		slot6, slot7, slot8 = slot6(slot7)

		for slot9 in slot6, slot7, slot8 do
			slot10 = slot0.stopped

			if slot10 then
				return
			end

			slot10 = slot5.blocked_handlers
			slot10 = slot10[slot9]

			if slot10 == 0 then
				slot10 = slot1.accumulator

				if slot10 then
					slot10 = slot1.accumulator
					slot11 = slot9
					slot12 = slot1.event_name
					slot13 = slot0
					slot14 = slot1.args

					slot10(slot11(slot12, slot13(slot14)))
				else
					slot10 = slot9
					slot11 = slot1.event_name
					slot12 = slot0
					slot13 = slot1.args

					slot10(slot11, slot12(slot13))
				end
			end
		end
	end
end

function slot18()
	slot0 = slot0
	slot1 = {
		stopped = false
	}
	slot2 = {}
	slot1.events = slot2
	slot2 = slot1

	return slot0(slot1, slot2)
end

slot7.New = slot18

function slot18(slot0, slot1, slot2)
	slot3 = slot0
	slot4 = slot0
	slot5 = slot1
	slot3 = slot3(slot4, slot5)
	slot4 = slot3.handlers
	slot5 = slot4
	slot4 = slot4.push_back
	slot6 = slot2

	slot4(slot5, slot6)

	slot4 = slot3.blocked_handlers
	slot4 = slot4[slot2]

	if not slot4 then
		slot4 = slot3.blocked_handlers
		slot5 = 0
		slot4[slot2] = slot5
	end
end

slot8.connect = slot18

function slot18(slot0, slot1, slot2)
	slot3 = slot0
	slot4 = slot0
	slot5 = slot1
	slot3 = slot3(slot4, slot5)

	if slot3 then
		return
	end

	slot3 = slot1
	slot4 = slot0
	slot5 = slot1
	slot3 = slot3(slot4, slot5)
	slot4 = slot3.handlers
	slot5 = slot4
	slot4 = slot4.remove
	slot6 = slot2

	slot4(slot5, slot6)

	slot4 = slot3.blocked_handlers
	slot5 = nil
	slot4[slot2] = slot5
end

slot8.disconnect = slot18

function slot18(slot0, slot1)
	slot2 = slot0
	slot3 = slot0
	slot4 = slot1
	slot2 = slot2(slot3, slot4)
	slot2 = not slot2

	return slot2
end

slot8.chectConnect = slot18

function slot18(slot0, slot1, slot2)
	slot3 = slot0
	slot4 = slot0
	slot5 = slot1
	slot3 = slot3(slot4, slot5)

	if slot3 then
		return
	end

	slot3 = slot1
	slot4 = slot0
	slot5 = slot1
	slot3 = slot3(slot4, slot5)
	slot4 = slot3.blocked_handlers
	slot4 = slot4[slot2]

	if slot4 then
		slot5 = slot3.blocked_handlers
		slot6 = slot4 + 1
		slot5[slot2] = slot6
	end
end

slot8.block = slot18

function slot18(slot0, slot1, slot2)
	slot3 = slot0
	slot4 = slot0
	slot5 = slot1
	slot3 = slot3(slot4, slot5)

	if slot3 then
		return
	end

	slot3 = slot1
	slot4 = slot0
	slot5 = slot1
	slot3 = slot3(slot4, slot5)
	slot4 = slot3.blocked_handlers
	slot4 = slot4[slot2]

	if slot4 then
		slot4 = slot3.blocked_handlers
		slot4 = slot4[slot2]
		slot5 = 0

		if slot4 > slot5 then
			slot4 = slot3.blocked_handlers
			slot5 = slot3.blocked_handlers
			slot5 = slot5[slot2]
			slot5 = slot5 - 1
			slot4[slot2] = slot5
		end
	end
end

slot8.unblock = slot18

function slot18(slot0, slot1, ...)
	slot2 = false
	slot0.stopped = slot2
	slot2 = slot0
	slot3 = slot0
	slot4 = slot1
	slot2, slot3 = slot2(slot3, slot4)
	slot4 = slot1
	slot5 = slot0
	slot6 = {
		event_name = slot1,
		nodes = slot2
	}
	slot7 = {
		...
	}
	slot6.args = slot7

	slot4(slot5, slot6)

	slot4 = slot2
	slot5 = slot1
	slot6 = slot3

	slot4(slot5, slot6)
end

slot8.emit = slot18

function slot18(slot0, slot1, slot2, ...)
	slot3 = false
	slot0.stopped = slot3
	slot3 = slot0
	slot4 = slot0
	slot5 = slot1
	slot3, slot4 = slot3(slot4, slot5)
	slot5 = slot1
	slot6 = slot0
	slot7 = {
		event_name = slot1,
		nodes = slot3,
		accumulator = slot2
	}
	slot8 = {
		...
	}
	slot7.args = slot8

	slot5(slot6, slot7)

	slot5 = slot2
	slot6 = slot1
	slot7 = slot4

	slot5(slot6, slot7)
end

slot8.emit_with_accumulator = slot18

function slot18(slot0, slot1, slot2)
	slot3 = slot0
	slot4 = slot0
	slot5 = slot1
	slot3 = slot3(slot4, slot5)
	slot3 = slot3.pre_emits
	slot4 = slot3
	slot3 = slot3.push_back
	slot5 = slot2

	slot3(slot4, slot5)
end

slot8.add_pre_emit = slot18

function slot18(slot0, slot1, slot2)
	slot3 = slot0
	slot4 = slot0
	slot5 = slot1
	slot3 = slot3(slot4, slot5)

	if slot3 then
		return
	end

	slot3 = slot1
	slot4 = slot0
	slot5 = slot1
	slot3 = slot3(slot4, slot5)
	slot3 = slot3.pre_emits
	slot4 = slot3
	slot3 = slot3.remove
	slot5 = slot2

	slot3(slot4, slot5)
end

slot8.remove_pre_emit = slot18

function slot18(slot0, slot1, slot2)
	slot3 = slot0
	slot4 = slot0
	slot5 = slot1
	slot3 = slot3(slot4, slot5)
	slot3 = slot3.post_emits
	slot4 = slot3
	slot3 = slot3.push_front
	slot5 = slot2

	slot3(slot4, slot5)
end

slot8.add_post_emit = slot18

function slot18(slot0, slot1, slot2)
	slot3 = slot0
	slot4 = slot0
	slot5 = slot1
	slot3 = slot3(slot4, slot5)

	if slot3 then
		return
	end

	slot3 = slot1
	slot4 = slot0
	slot5 = slot1
	slot3 = slot3(slot4, slot5)
	slot3 = slot3.post_emits
	slot4 = slot3
	slot3 = slot3.remove
	slot5 = slot2

	slot3(slot4, slot5)
end

slot8.remove_post_emit = slot18

function slot18(slot0)
	slot1 = true
	slot0.stopped = slot1
end

slot8.stop = slot18

function slot18(slot0, slot1)
	if not slot1 then
		slot2 = {}
		slot0.events = slot2

		return
	end
end

slot8.clear = slot18
slot18 = slot7.New
slot18 = slot18()

function slot19()
	slot0 = slot0

	return slot0
end

slot7.get_global_event = slot19

return slot7
