slot0 = require("jit")
slot2 = require("jit.vmdef")
slot3 = require("jit.util").funcinfo
slot4 = require("jit.util").traceinfo
slot5 = type
slot6 = string.format
slot7 = io.stdout
slot8 = io.stderr
slot9, slot10, slot11, slot12 = nil

function slot13(slot0, slot1)
	if slot0(slot0, slot1).loc then
		return slot2.loc
	elseif slot2.ffid then
		return slot1.ffnames[slot2.ffid]
	elseif slot2.addr then
		return slot2("C:%x", slot2.addr)
	else
		return "(?)"
	end
end

function slot14(slot0, slot1)
	if slot0(slot0) == "number" then
		if slot0(slot1) == "function" then
			slot1 = slot1(slot1)
		end

		slot0 = slot2(slot3.traceerr[slot0], slot1)
	end

	return slot0
end

function slot15(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot0 == "start" then
		slot0 = slot1(slot2, slot3)
		slot2 = (slot4 and "(" .. slot4 .. "/" .. ((slot5 == -1 and "stitch") or slot5) .. ") ") or ""
	else
		if slot0 == "abort" then
			if slot1(slot2, slot3) ~= slot0 then
				print(slot3("[TRACE --- %s%s -- %s at %s]\n", slot2, slot0, slot4(slot4, slot5), slot6))
			else
				print(slot3("[TRACE --- %s%s -- %s]\n", slot2, slot0, slot4(slot4, slot5)))
			end
		elseif slot0 == "stop" then
			slot7 = slot5(slot1).link

			if slot5(slot1).linktype == "interpreter" then
				print(slot3("[TRACE %3s %s%s -- fallback to interpreter]\n", slot1, slot2, slot0))
			elseif slot8 == "stitch" then
				print(slot3("[TRACE %3s %s%s %s %s]\n", slot1, slot2, slot0, slot8, slot1(slot2, slot3)))
			elseif slot7 == slot1 or slot7 == 0 then
				print(slot3("[TRACE %3s %s%s %s]\n", slot1, slot2, slot0, slot8))
			elseif slot8 == "root" then
				print(slot3("[TRACE %3s %s%s -> %d]\n", slot1, slot2, slot0, slot7))
			else
				print(slot3("[TRACE %3s %s%s -> %d %s]\n", slot1, slot2, slot0, slot7, slot8))
			end
		else
			print(slot3("[TRACE %s]\n", slot0))
		end

		slot6:flush()
	end
end

return {
	on = function (slot0)

		-- Decompilation error in this vicinity:
		if slot0 then
			slot1()
		end

		slot5.attach(slot6, "trace")

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

		slot5.attach(slot6, "trace")

		slot0 = true
	end
}
