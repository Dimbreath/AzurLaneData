slot0 = Vector2.zero
slot1 = rawget
TouchPhase = {
	Stationary = 2,
	Canceled = 4,
	Moved = 1,
	Ended = 3,
	Began = 0
}
TouchBits = {
	DeltaPosition = 1,
	Position = 2,
	RawPosition = 4,
	ALL = 7
}
slot4 = TouchBits
slot6 = tolua.initget(slot5)
UnityEngine.TouchPhase = TouchPhase
UnityEngine.Touch = {
	__index = function (slot0, slot1)
		if slot0(slot1, slot1) == nil and slot0(slot2, slot1) ~= nil then
			return slot2(slot0)
		end

		return slot2
	end,
	New = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
		return slot0({
			fingerId = slot0 or 0,
			position = slot1 or slot1,
			rawPosition = slot2 or slot1,
			deltaPosition = slot3 or slot1,
			deltaTime = slot4 or 0,
			tapCount = slot5 or 0,
			phase = slot6 or 0
		}, slot2)
	end,
	Init = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
		slot0.fingerId = slot1
		slot0.position = slot2
		slot0.rawPosition = slot3
		slot0.deltaPosition = slot4
		slot0.deltaTime = slot5
		slot0.tapCount = slot6
		slot0.phase = slot7
	end,
	Destroy = function (slot0)
		slot0.position = nil
		slot0.rawPosition = nil
		slot0.deltaPosition = nil
	end,
	GetMask = function (...)
		slot1 = 0

		for slot5 = 1, #{
			...
		}, 1 do
			if (slot0[slot0[slot5]] or 0) ~= 0 then
				slot1 = slot1 + slot6
			end
		end

		if slot1 == 0 then
			slot1 = slot0.all
		end

		return slot1
	end
}

setmetatable(, )

return 
