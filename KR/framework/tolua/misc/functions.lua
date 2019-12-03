slot0 = require
slot2 = table
int64.zero = int64.new(0, 0)
uint64.zero = uint64.new(0, 0)

function string.split(slot0, slot1)
	slot0 = tostring(slot0)

	if tostring(slot1) == "" then
		return false
	end

	slot2 = 0
	slot3 = {}

	for slot7, slot8 in nil do
		slot1.insert(slot3, slot0:sub(slot2, slot7 - 1))

		slot2 = slot8 + 1
	end

	slot1.insert(slot3, slot0:sub(slot2))

	return slot3
end

function import(slot0, slot1)
	slot2 = nil
	slot3 = slot0
	slot4 = 1

	while true do
		if slot0:byte(slot4) ~= 46 then
			slot3 = slot0:sub(slot4)

			if slot2 and #slot2 > 0 then
				slot3 = slot1.concat(slot2, ".") .. "." .. slot3
			end

			break
		end

		slot4 = slot4 + 1

		if not slot2 then
			if not slot1 then
				slot5, slot1 = debug.getlocal(3, 1)
			end

			slot2 = slot0.split(slot1, ".")
		end

		slot1.remove(slot2, #slot2)
	end

	return slot2(slot3)
end

function reimport(slot0)
	package.loaded[slot0] = nil
	package.preload[slot0] = nil

	return slot0(slot0)
end

return
