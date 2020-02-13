slot0 = Layer
slot1 = rawget
UnityEngine.LayerMask = {
	__index = function (slot0, slot1)
		return slot0(slot1, slot1)
	end,
	__call = function (slot0, slot1)
		return slot0({
			value = value or 0
		}, slot1)
	end,
	New = function (slot0)
		return slot0({
			value = slot0 or 0
		}, slot0)
	end,
	Get = function (slot0)
		return slot0.value
	end,
	NameToLayer = function (slot0)
		return slot0[slot0]
	end,
	GetMask = function (...)
		slot1 = 0

		for slot5 = 1, #{
			...
		}, 1 do
			if slot0.NameToLayer(slot0[slot5]) ~= nil then
				slot1 = slot1 + 2^slot6
			end
		end

		return slot1
	end
}

setmetatable(, )

return 
