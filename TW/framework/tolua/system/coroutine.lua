slot0 = coroutine.create
slot1 = coroutine.running
slot2 = coroutine.resume
slot3 = coroutine.yield
slot4 = error
slot5 = unpack
slot6 = debug
slot7 = FrameTimer
slot8 = CoTimer
slot10 = {}

setmetatable(slot9, {
	__mode = "kv"
})

coroutine.start = function (slot0, ...)
	if slot1() == nil then
		slot2, slot3 = slot2(slot1, ...)

		if not slot2 then
			slot3(slot4.traceback(slot1, slot3))
		end
	else
		slot2 = {
			...
		}
		slot3 = nil

		function slot4()
			slot0[slot1] = nil
			slot2.func = nil
			slot0, slot1 = slot3(nil, slot4(slot5))

			table.insert(slot6, table.insert)

			if not slot0 then
				slot2:Stop()
				slot7(slot8.traceback(slot1, slot1))
			end
		end

		if #slot7 > 0 then
			table.remove(slot7):Reset(slot4, 0, 1)
		else
			slot3 = slot8.New(slot4, 0, 1)
		end

		slot5[slot1] = slot3

		slot3:Start()
	end

	return slot1
end

coroutine.wait = function (slot0, slot1, ...)
	slot2 = {
		...
	}
	slot3 = nil
	slot1 or slot0()[] = slot6.New(slot4, slot0, 1)

	slot6.New(slot4, slot0, 1):Start()

	return slot0()
end

coroutine.step = function (slot0, slot1, ...)
	slot2 = {
		...
	}
	slot1 = slot1 or slot0()
	slot3 = nil

	if #slot4 > 0 then
		table.remove(slot4):Reset(slot4, slot0 or 1, 1)
	else
		slot3 = slot7.New(slot4, slot0 or 1, 1)
	end

	slot1[slot1] = slot3

	slot3:Start()

	return slot8()
end

coroutine.www = function (slot0, slot1)
	slot1 = slot1 or slot0()
	slot2 = nil

	if #slot3 > 0 then
		table.remove(slot3):Reset(slot3, 1, -1)
	else
		slot2 = slot6.New(slot3, 1, -1)
	end

	slot1[slot1] = slot2

	slot2:Start()

	return slot7()
end

coroutine.stop = function (slot0)
	if slot0[slot0] ~= nil then
		slot0[slot0] = nil

		slot1:Stop()

		slot1.func = nil
	end
end

return
