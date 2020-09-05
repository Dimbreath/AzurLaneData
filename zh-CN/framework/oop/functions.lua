function printf(slot0, ...)
	print(string.format(tostring(slot0), ...))
end

function AssureTable(slot0)
	if type(slot0) ~= "table" then
		slot0 = {}
	end

	return slot0
end

function checknumber(slot0, slot1)
	return tonumber(slot0, slot1) or 0
end

function math.round(slot0)
	return math.floor(checknumber(slot0) + 0.5)
end

function checkint(slot0)
	return math.round(checknumber(slot0))
end

function table.nums(slot0)
	for slot5, slot6 in pairs(slot0) do
		slot1 = 0 + 1
	end

	return slot1
end

function table.indexof(slot0, slot1, slot2)
	for slot6 = slot2 or 1, #slot0 do
		if slot0[slot6] == slot1 then
			return slot6
		end
	end

	return false
end

function table.keyof(slot0, slot1)
	for slot5, slot6 in pairs(slot0) do
		if slot6 == slot1 then
			return slot5
		end
	end

	return nil
end

function table.removebyvalue(slot0, slot1, slot2)
	slot3 = 0
	slot4 = 1

	while slot4 <= #slot0 do
		if slot0[slot4] == slot1 then
			table.remove(slot0, slot4)

			slot3 = slot3 + 1
			slot4 = slot4 - 1
			slot5 = slot5 - 1

			if not slot2 then
				break
			end
		end

		slot4 = slot4 + 1
	end

	return slot3
end

function table.insertto(slot0, slot1, slot2)
	if checkint(slot2) <= 0 then
		slot2 = #slot0 + 1
	end

	for slot7 = 0, #slot1 - 1 do
		slot0[slot7 + slot2] = slot1[slot7 + 1]
	end
end

function table.merge(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		slot0[slot5] = slot6
	end
end

function table.isEmpty(slot0)
	if type(slot0) == "table" then
		for slot4, slot5 in pairs(slot0) do
			return false
		end
	end

	return true
end

function handler(slot0, slot1)
	return function (...)
		return uv0(uv1, ...)
	end
end

function handlerArg1(slot0, slot1, slot2)
	return function (...)
		return uv0(uv1, uv2, ...)
	end
end

slot0 = print
slot1 = table.concat
slot2 = table.insert
slot3 = string.rep
slot4 = type
slot5 = pairs
slot6 = tostring
slot7 = next

function print_r(slot0)
	slot1 = {
		[slot0] = "."
	}

	uv7(function (slot0, slot1, slot2)
		slot3 = {}

		for slot7, slot8 in uv0(slot0) do
			if uv2[slot8] then
				uv3(slot3, "+" .. uv1(slot7) .. " {" .. uv2[slot8] .. "}")
			elseif uv4(slot8) == "table" then
				uv2[slot8] = slot2 .. "." .. slot9

				uv3(slot3, "+" .. slot9 .. uv5(slot8, slot1 .. (uv6(slot0, slot7) and "|" or " ") .. uv7(" ", #slot9), slot10))
			else
				uv3(slot3, "+" .. slot9 .. " [" .. uv1(slot8) .. "]")
			end
		end

		return uv8(slot3, "\n" .. slot1)
	end(slot0, "", ""))
end
