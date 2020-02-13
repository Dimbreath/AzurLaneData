slot0 = require("jit")
slot1 = require("jit.util")
slot4 = string.sub
slot5 = string.gsub
slot6 = string.format
slot7 = string.byte
slot8 = require("bit").band
slot9 = require("bit").rshift
slot10 = slot1.funcinfo
slot11 = slot1.funcbc
slot12 = slot1.funck
slot13 = slot1.funcuvname
slot14 = require("jit.vmdef").bcnames
slot15 = io.stdout
slot16 = io.stderr

function slot17(slot0)
	if slot0 == "\n" then
		return "\\n"
	elseif slot0 == "\r" then
		return "\\r"
	elseif slot0 == "\t" then
		return "\\t"
	else
		return slot0("\\%03d", slot0(slot0))
	end
end

slot21, slot22 = nil

function slot23(slot0)
	return slot0(slot0, slot0)
end

return {
	line = function (slot0, slot1, slot2)
		slot3, slot4 = slot0(slot0, slot1)

		if not slot3 then
			return
		end

		slot6 = slot1(slot4, 120)
		slot7 = slot1(slot4, 1920)
		slot11 = 
		-- Decompilation error in this vicinity:
		slot1(slot4, 7)("%04d %s %-6s %3s ", slot1, slot2 or "  ", slot3(slot4, 6 * slot1(slot3, 255) + 1, 6 * slot1(slot3, 255) + 6), (slot5 == 0 and "") or slot1(slot2(slot3, 8), 255))
		slot12 = slot2(slot3, 16)

		if slot7 == 1664 then
			return slot5("%s=> %04d\n", slot11, (slot1 + slot12) - 32767)
		end

		if slot6 ~= 0 then
			slot12 = slot1(slot12, 255)
		elseif slot7 == 0 then
			return slot11 .. "\n"
		end

		slot13 = nil

		if slot7 == 1280 then
			slot13 = slot5((#slot6(slot0, -slot12 - 1) > 40 and "\"%.40s\"~") or "\"%s\"", slot7(slot13, "%c", slot8))
		elseif slot7 == 1152 then
			slot13 = slot6(slot0, slot12)

			if slot10 == "TSETM " then
				slot13 = slot13 - 4503599627370496.0
			end
		elseif slot7 == 1536 then
			if slot9(slot6(slot0, -slot12 - 1)).ffid then
				slot13 = slot10.ffnames[slot14.ffid]
			else
				slot13 = slot14.loc
			end
		elseif slot7 == 640 then
			slot13 = slot11(slot0, slot12)
		end

		if slot5 == 5 then
			slot13 = (slot13 and slot11(slot0, slot8) .. " ; " .. slot13) or slot11(slot0, slot8)
		end

		if slot6 ~= 0 then
			slot14 = slot2(slot3, 24)

			if slot13 then
				return slot5("%s%3d %3d  ; %s\n", slot11, slot14, slot12, slot13)
			end

			return slot5("%s%3d %3d\n", slot11, slot14, slot12)
		end

		if slot13 then
			return slot5("%s%3d      ; %s\n", slot11, slot12, slot13)
		end

		if slot7 == 896 and slot12 > 32767 then
			slot12 = slot12 - 65536
		end

		return slot5("%s%3d\n", slot11, slot12)
	end,
	dump = function (slot0, slot1, slot2)
		slot3 = 
		-- Decompilation error in this vicinity:
		slot1 or slot0(slot0)

		if slot2 and slot3.children then
			for slot7 = -1, -1000000000, -1 do
				if not slot2(slot0, slot7) then
					break
				end

				if type(slot8) == "proto" then
					slot3(slot8, slot1, true)
				end
			end
		end

		slot1:write(slot1.write("-- BYTECODE -- %s-%d\n", slot3.loc, slot3.lastlinedefined))

		slot4 = slot1(slot0)

		for slot8 = 1, 1000000000, 1 do
			if not slot6(slot0, slot8, slot4[slot8] and "=>") then
				break
			end

			slot1:write(slot9)
		end

		slot1:write("\n")
		slot1:flush()
	end,
	targets = function (slot0)
		slot1 = {}

		for slot5 = 1, 1000000000, 1 do
			slot6, slot7 = slot0(slot0, slot5)

			if not slot6 then
				break
			end

			if slot1(slot7, 1920) == 1664 then
				slot1[(slot5 + slot2(slot6, 16)) - 32767] = true
			end
		end

		return slot1
	end,
	on = function (slot0)

		-- Decompilation error in this vicinity:
		if slot0 then
			slot1()
		end

		slot5.attach(slot6, "bc")

		slot0 = true
	end,
	off = function ()
		if slot0 then
			slot0 = false

			slot1.attach(slot2)

			if slot3 and slot3 ~= slot4 and slot3 ~= slot5 then
				slot3:close()
			end

			slot3 = nil
		end
	end,
	start = function (slot0)

		-- Decompilation error in this vicinity:
		if slot0 then
			slot1()
		end

		slot5.attach(slot6, "bc")

		slot0 = true
	end
}
