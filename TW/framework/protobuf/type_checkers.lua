slot0 = type
slot1 = error
slot2 = string

module("type_checkers")

function TypeChecker(slot0)
	slot1 = slot0

	return function (slot0)
		if slot1[slot0(slot0)] == nil then
			slot2(slot3.format("%s has type %s, but expected one of: %s", slot0, slot0(slot0), slot1))
		end
	end
end

function Int32ValueChecker()
	slot0 = -2147483648
	slot1 = 2147483647

	return function (slot0)
		if slot0(slot0) ~= "number" then
			slot1(slot2.format("%s has type %s, but expected one of: number", slot0, slot0(slot0)))
		end

		if slot0 < slot3 or slot4 < slot0 then
			slot1("Value out of range: " .. slot0)
		end
	end
end

function Uint32ValueChecker(slot0)
	slot1 = 0
	slot2 = 4294967295.0

	return function (slot0)
		if slot0(slot0) ~= "number" then
			slot1(slot2.format("%s has type %s, but expected one of: number", slot0, slot0(slot0)))
		end

		if slot0 < slot3 or slot4 < slot0 then
			slot1("Value out of range: " .. slot0)
		end
	end
end

function UnicodeValueChecker()
	return function (slot0)
		if slot0(slot0) ~= "string" then
			slot1(slot2.format("%s has type %s, but expected one of: string", slot0, slot0(slot0)))
		end
	end
end

return
