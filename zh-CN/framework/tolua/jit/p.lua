slot0 = require("jit")
slot1 = require("jit.profile")
slot2 = require("jit.vmdef")
slot4 = pairs
slot5 = ipairs
slot6 = tonumber
slot7 = math.floor
slot8 = table.sort
slot9 = string.format
slot10 = io.stdout
slot11, slot12, slot13, slot14, slot15, slot16, slot17, slot18, slot19, slot20, slot21, slot22, slot23 = nil
slot24 = {
	G = "Garbage Collector",
	C = "C code",
	N = "Compiled",
	J = "JIT Compiler",
	I = "Interpreted"
}

function slot25(slot0, slot1, slot2)
	slot0 = slot0 + slot1
	slot3, slot4, slot5 = nil

	if slot1 then
		if slot1 == "v" then
			slot5 = slot2[slot2] or slot2
		else
			slot5 = slot3:get() or "(none)"
		end
	end

	if slot4 then
		slot3 = slot5.dumpstack(slot0, slot4, slot5.dumpstack):gsub("%[builtin#(%d+)%]", function (slot0)
			return slot0.ffnames[slot1(slot0)]
		end)

		if function (slot0)
			return slot0.ffnames[slot1(slot0)]
		end == 2 then
			slot6, slot7 = slot3:match("(.-) [<>] (.*)")

			if slot7 then
				slot4 = slot7
				slot3 = slot6
			end
		elseif slot9 == 3 then
			slot4 = slot5.dumpstack(slot0, "l", 1)
		end
	end

	slot6, slot7 = nil

	if slot9 == 1 then
		if slot5 then
			slot6 = slot5

			if slot3 then
				slot7 = slot3
			end
		end
	elseif slot3 then
		slot6 = slot3

		if slot4 then
			slot7 = slot4
		elseif slot5 then
			slot7 = slot5
		end
	end

	if slot6 then
		slot8[slot6] = (slot10[slot6] or 0) + slot1

		if slot7 then
			if not slot11[slot6] then
				slot9[slot6] = {}
			end

			slot10[slot7] = (slot10[slot7] or 0) + slot1
		end
	end
end

function slot26(slot0, slot1, slot2, slot3)
	slot4 = {}
	slot5 = 0

	for slot9 in slot0(slot0) do
		slot4[slot5 + 1] = slot9
	end

	slot1(slot4, function (slot0, slot1)
		return slot0[slot1] < slot0[slot0]
	end)

	for slot9 = 1, slot5, 1 do
		if slot2((slot0[slot4[slot9]] * 100) / slot2 + 0.5) < slot3 then
			break
		end

		if not slot4 then
			slot5:write(slot6("%s%2d%%  %s\n", slot3, slot12, slot10))
		elseif slot4 == "r" then
			slot5:write(slot6("%s%5d  %s\n", slot3, slot11, slot10))
		else
			slot5:write(slot6("%s %d\n", slot10, slot11))
		end

		if slot1 and slot1[slot10] then
			slot7(slot13, nil, slot11, ((slot8 == 3 or slot8 == 1) and "  -- ") or (slot9 < 0 and "  -> ") or "  <- ")
		end
	end
end

function slot27(slot0, slot1)
	slot2 = {}
	slot3 = 0

	for slot7, slot8 in slot0(slot0) do
		if slot2.max(slot3, slot8) <= slot1((slot8 * 100) / slot1 + 0.5) then
			slot10, slot11 = slot7:match("^(.*):(%d+)$")

			if not slot10 then
				slot10 = slot7
				slot11 = 0
			end

			if not slot2[slot10] then
				slot2[slot10] = {}
				slot2[#slot2 + 1] = slot10
			end

			slot12[slot4(slot11)] = (slot5 and slot8) or slot9
		end
	end

	slot6(slot2)

	slot4 = " %3d%% | %s\n"

	if "      | %s\n" then
		slot4 = "%" .. slot6 .. "d | %s\n"
		slot5 = " ":rep(slot2.max(5, slot2.ceil(slot2.log10(slot3)))) .. " | %s\n"
	end

	slot6 = slot7

	for slot10, slot11 in slot8(slot2) do
		if slot11:byte() == 40 or slot12 == 91 then
			slot9:write(slot10([[

====== %s ======
[Cannot annotate non-file]
]], slot11))

			break
		end

		slot13, slot14 = io.open(slot11)

		if not slot13 then
			slot9:write(slot10("====== ERROR: %s: %s\n", slot11, slot14))

			break
		end

		slot9:write(slot10("\n====== %s ======\n", slot11))

		slot15 = slot2[slot11]
		slot16 = 1
		slot17 = false

		if slot6 ~= 0 then
			for slot21 = 1, slot6, 1 do
				if slot15[slot21] then
					slot17 = true

					slot9:write("@@ 1 @@\n")

					break
				end
			end
		end

		for slot21 in slot13:lines() do
			if slot21:byte() == 27 then
				slot9:write("[Cannot annotate bytecode file]\n")

				break
			end

			slot22 = slot15[slot16]

			if slot6 ~= 0 then
				slot23 = slot15[slot16 + slot6]

				if slot17 then
					if slot23 then
						slot17 = slot16 + slot6
					elseif slot22 then
						slot17 = slot16
					elseif slot16 > slot17 + slot6 then
						slot17 = false
					end
				elseif slot23 then
					slot17 = slot16 + slot6

					slot9:write(slot10("@@ %d @@\n", slot16))
				end

				if not slot17 then
				end
			elseif slot22 then
				slot9:write(slot10(slot4, slot22, slot21))
			else
				slot9:write(slot10(slot5, slot21))
			end

			slot16 = slot16 + 1
		end

		slot13:close()
	end
end

function slot29(slot0)
	slot1 = ""
	slot0 = slot0:gsub("i%d*", function (slot0)
		slot0 = slot0

		return ""
	end)
	slot2 = 1
	slot2 = {}

	for slot6 in 3:gsub("m(%d+)", function (slot0)
		slot0 = slot1(slot0)

		return ""
	end):gsub("%-?%d+", function (slot0)
		slot0 = slot1(slot0)

		return ""
	end).gmatch(slot0, ".") do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 28-28, warpins: 1 ---
		slot2[slot6] = slot6
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 29-30, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	if (slot2.z or slot2.v) == "z" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 39-42, warpins: 1 ---
		slot4 = require("jit.zone")
		--- END OF BLOCK #0 ---



	end

	slot3 = slot2.l or slot2.f or slot2.F or (slot3 and "") or "f"
	slot4 = slot2.p or ""
	slot5 = slot2.r

	if slot2.s then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 67-70, warpins: 1 ---
		slot6 = 2

		if slot2 == -1 or slot2["-"] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 74-75, warpins: 2 ---
			slot2 = -2
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 76-78, warpins: 1 ---
			if slot2 == 1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 79-80, warpins: 1 ---
				slot2 = 2
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 81-86, warpins: 1 ---
		if slot0:find("[fF].*l") then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 87-89, warpins: 1 ---
			slot3 = "l"
			slot6 = 3
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 90-91, warpins: 1 ---
			slot6 = ((slot3 == "" or slot0:find("[zv].*[lfF]")) and 1) or 0
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 101-101, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---



	end

	if (slot2.A and 0) or (slot2.a and 3) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 115-119, warpins: 1 ---
		slot3 = "l"
		slot8 = "pl"
		slot6 = 0
		slot2 = 1
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 120-122, warpins: 1 ---
		if slot2.G and slot3 ~= "" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 125-133, warpins: 1 ---
			slot8 = slot4 .. slot3 .. "Z;"
			slot2 = -100
			slot5 = true
			slot0 = 0
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 134-135, warpins: 2 ---
			if slot3 == "" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 136-137, warpins: 1 ---
				slot8 = false
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 138-140, warpins: 1 ---
				slot8 = slot4 .. ((slot6 == 3 and slot2.f) or slot2.F or slot3) .. ((slot2 >= 0 and "Z < ") or "Z > ")
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 148-153, warpins: 3 ---
				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 157-158, warpins: 2 ---
				--- END OF BLOCK #2 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	slot9 = {}
	slot10 = {}
	slot11 = 0

	slot12.start(slot3:lower() .. slot1, slot13)

	getmetatable(slot14).__gc = slot15
end

return {
	start = function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-9, warpins: 2 ---
		if slot1 or os.getenv("LUAJIT_PROFILEFILE") then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-11, warpins: 1 ---
			slot0 = (slot1 == "-" and slot1) or assert(io.open(slot1, "w"))
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 22-23, warpins: 2 ---
			--- END OF BLOCK #1 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 24-25, warpins: 1 ---
			slot0 = slot1
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 26-28, warpins: 2 ---
		slot2(slot0 or "f")

		return
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 30-31, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end,
	stop = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-9, warpins: 1 ---
			slot1.stop()

			if slot2 == 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 10-12, warpins: 1 ---
				if slot3 ~= true then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 13-17, warpins: 1 ---
					slot4:write("[No samples collected]\n")
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 18-18, warpins: 2 ---
				return
				--- END OF BLOCK #1 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 19-21, warpins: 2 ---
			if slot5 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 22-26, warpins: 1 ---
				slot6(slot7, slot0)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 27-32, warpins: 1 ---
				slot8(slot7, slot9, slot0, "")
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 33-35, warpins: 2 ---
			slot7 = nil
			slot9 = nil
			slot0 = nil
			--- END OF BLOCK #2 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 36-36, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end
}
