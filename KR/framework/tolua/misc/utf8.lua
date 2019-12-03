function slot1(slot0, slot1, slot2, slot3)
	return slot3[slot0:sub(slot1, slot2)]
end

function slot2(slot0, slot1, slot2, slot3)
	if not slot0:isvalid(slot1) then
		return slot3
	end
end

return {
	next_raw = function (slot0, slot1)
		if not slot1 then
			if #slot0 == 0 then
				return nil
			end

			return 1, true
		end

		if slot1 > #slot0 then
			return
		end

		if slot0:byte(slot1) >= 0 and slot2 <= 127 then
			slot1 = slot1 + 1
		elseif slot2 >= 194 and slot2 <= 223 then
			slot1 = slot1 + 2
		elseif slot2 >= 224 and slot2 <= 239 then
			slot1 = slot1 + 3
		elseif slot2 >= 240 and slot2 <= 244 then
			slot1 = slot1 + 4
		else
			return slot1 + 1, false
		end

		if slot1 > #slot0 then
			return
		end

		return slot1, true
	end,
	next = ()["next_raw"],
	byte_indices = function (slot0, slot1)
		return slot0.next, slot0, slot1
	end,
	len = function (slot0)
		slot1 = 0

		for slot5 in slot0:byte_indices() do
			slot1 = slot1 + 1
		end

		return slot1
	end,
	byte_index = function (slot0, slot1)
		if slot1 < 1 then
			return
		end

		slot2 = 0

		for slot6 in slot0:byte_indices() do
			if slot2 + 1 == slot1 then
				return slot6
			end
		end
	end,
	char_index = function (slot0, slot1)
		if slot1 < 1 or slot1 > #slot0 then
			return
		end

		slot2 = 0

		for slot6 in slot0:byte_indices() do
			slot2 = slot2 + 1

			if slot6 == slot1 then
				return slot2
			end
		end

		error("invalid index")
	end,
	prev = function (slot0, slot1)
		if (slot1 or #slot0 + 1) <= 1 or slot1 > #slot0 + 1 then
			return
		end

		slot2, slot3 = slot0:next()

		for slot7, slot8 in slot0:byte_indices() do
			if slot7 == slot1 then
				return slot2, slot3
			end

			slot3 = slot8
			slot2 = slot7
		end

		if slot1 == #slot0 + 1 then
			return slot2, slot3
		end

		error("invalid index")
	end,
	byte_indices_reverse = function (slot0, slot1)
		if #slot0 < 200 then
			return slot0.prev, slot0, slot1
		else
			slot2 = {}

			for slot6 in slot0:byte_indices() do
				if slot1 and slot1 <= slot6 then
					break
				end

				table.insert(slot2, slot6)
			end

			slot3 = #slot2 + 1

			return function ()
				slot0 = slot0 - 1

				return slot1[]
			end
		end
	end,
	sub = function (slot0, slot1, slot2)
		slot3 = 0
		slot4, slot5 = nil

		for slot9 in slot0:byte_indices() do
			if slot3 + 1 == slot1 then
				slot4 = slot9
			end

			if slot3 == slot2 then
				slot5 = slot9
			end
		end

		if not slot4 then
			return ""
		end

		if slot2 and not slot5 and slot2 < slot1 then
			return ""
		end

		return slot0:sub(slot4, slot5 and slot5 - 1)
	end,
	contains = function (slot0, slot1, slot2)
		if slot1 < 1 or slot1 > #slot0 then
			return nil
		end

		for slot6 = 1, #slot2, 1 do
			if slot0:byte((slot1 + slot6) - 1) ~= slot2:byte(slot6) then
				return false
			end
		end

		return true
	end,
	count = function (slot0, slot1)
		slot2 = 0
		slot3 = 1

		while slot3 do
			if slot0:contains(slot3, slot1) then
				slot2 = slot2 + 1

				if slot3 + #slot1 > #slot0 then
					break

					if false then
						slot3 = slot0:next(slot3)
					end
				end
			end
		end

		return slot2
	end,
	isvalid = function (slot0, slot1)
		if not slot0:byte(slot1) then
			return false
		elseif slot2 >= 0 and slot2 <= 127 then
			return true
		elseif slot2 >= 194 and slot2 <= 223 then
			return slot0:byte(slot1 + 1) and slot3 >= 128 and slot3 <= 191
		elseif slot2 >= 224 and slot2 <= 239 then
			slot3 = slot0:byte(slot1 + 1)
			slot4 = slot0:byte(slot1 + 2)

			if slot2 == 224 then
				return slot3 and slot4 and slot3 >= 160 and slot3 <= 191 and slot4 >= 128 and slot4 <= 191
			elseif slot2 >= 225 and slot2 <= 236 then
				return slot3 and slot4 and slot3 >= 128 and slot3 <= 191 and slot4 >= 128 and slot4 <= 191
			elseif slot2 == 237 then
				return slot3 and slot4 and slot3 >= 128 and slot3 <= 159 and slot4 >= 128 and slot4 <= 191
			elseif slot2 >= 238 and slot2 <= 239 then
				if slot2 == 239 and slot3 == 191 and (slot4 == 190 or slot4 == 191) then
					return false
				end

				return slot3 and slot4 and slot3 >= 128 and slot3 <= 191 and slot4 >= 128 and slot4 <= 191
			end
		elseif slot2 >= 240 and slot2 <= 244 then
			slot3 = slot0:byte(slot1 + 1)
			slot4 = slot0:byte(slot1 + 2)
			slot5 = slot0:byte(slot1 + 3)

			if slot2 == 240 then
				return slot3 and slot4 and slot5 and slot3 >= 144 and slot3 <= 191 and slot4 >= 128 and slot4 <= 191 and slot5 >= 128 and slot5 <= 191
			elseif slot2 >= 241 and slot2 <= 243 then
				return slot3 and slot4 and slot5 and slot3 >= 128 and slot3 <= 191 and slot4 >= 128 and slot4 <= 191 and slot5 >= 128 and slot5 <= 191
			elseif slot2 == 244 then
				return slot3 and slot4 and slot5 and slot3 >= 128 and slot3 <= 143 and slot4 >= 128 and slot4 <= 191 and slot5 >= 128 and slot5 <= 191
			end
		end

		return false
	end,
	next_valid = function (slot0, slot1)
		slot2 = nil
		slot1, slot2 = slot0:next_raw(slot1)

		while slot1 and (not slot2 or not slot0:isvalid(slot1)) do
			slot1, slot2 = slot0:next(slot1)
		end

		return slot1
	end,
	valid_byte_indices = function (slot0)
		return slot0.next_valid, slot0
	end,
	validate = function (slot0)
		for slot4, slot5 in slot0:byte_indices() do
			if not slot5 or not slot0:isvalid(slot4) then
				error(string.format("invalid utf8 char at #%d", slot4))
			end
		end
	end,
	replace = function (slot0, slot1, ...)
		if type(slot1) == "table" then
			return slot0:replace(slot1, slot1)
		end

		if slot0 == "" then
			return slot0
		end

		slot2 = {}
		slot3 = 1

		for slot7 in slot0:byte_indices() do
			if slot1(slot0, slot7, (slot0:next(slot7) or #slot0 + 1) - 1, ...) then
				table.insert(slot2, slot0:sub(slot3, slot7 - 1))
				table.insert(slot2, slot9)

				slot3 = slot8
			end
		end

		table.insert(slot2, slot0:sub(slot3))

		return table.concat(slot2)
	end,
	sanitize = function (slot0, slot1)
		return slot0:replace(slot1 or "�", )
	end
}
