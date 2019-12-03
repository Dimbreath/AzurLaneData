slot0 = setmetatable
slot3 = {
	__index = {
		is_empty = function (slot0)
			return slot0.last < slot0.first
		end,
		push_front = function (slot0, slot1)
			if slot0.data_position[slot1] then
				return
			end

			slot0.first = slot0.first - 1
			slot0.data[slot0.first] = slot1
			slot0.data_position[slot1] = slot0.first
		end,
		push_back = function (slot0, slot1)
			if slot0.data_position[slot1] then
				return
			end

			slot0.last = slot0.last + 1
			slot0.data[slot0.last] = slot1
			slot0.data_position[slot1] = slot0.last
		end,
		get_iterator = function (slot0)
			slot1 = slot0.first

			return function ()
				while slot0 <= slot1.last do
					if slot0 + 1 then
						return slot0
					end
				end
			end
		end,
		remove = function (slot0, slot1)
			if not slot0.data_position[slot1] then
				return
			end

			slot0.data[slot0.data_position[slot1]] = nil
			slot0.data_position[slot1] = nil

			slot0(slot0)
		end
	}
}

function slot4(slot0)
	while slot0.first <= slot0.last do
		if slot0.data[slot0.first] then
			return true
		end

		slot0.first = slot0.first + 1
	end
end

return {
	New = function ()
		return slot0({
			first = 1,
			last = 0,
			data = {},
			data_position = {}
		}, )
	end
}
