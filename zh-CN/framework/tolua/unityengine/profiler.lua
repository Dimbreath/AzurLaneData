slot0 = LuaProfiler
slot1 = jit and require("jit.vmdef")
slot2 = {
	event = {
		[142.0] = "event.__call",
		[20.0] = "_xpcall.__call"
	},
	slot = {
		[11.0] = "slot.__call"
	},
	MainScene = {
		[250.0] = "MainScene.Update"
	}
}
slot3 = {
	["_xpcall.__call"] = 1,
	ipairs_aux = 1,
	unknow = 1
}
slot5 = {}

function slot6(slot0)
	slot1 = #slot0 + 1

	for slot5, slot6 in ipairs(slot0) do
		if slot6 == slot0 then
			slot1 = slot5
		end
	end

	return slot1
end

function slot7(slot0)
	if #slot0 > 0 and debug.getinfo(5, "f") then
		if slot1 < slot1(slot2.func) and debug.getinfo(6, "f") then
			slot4 = slot1(slot2.func) or slot4
		end

		for slot8 = slot4 + 1, slot1, 1 do
			table.remove(slot0)
			slot2.EndSample()
		end
	end
end

function slot8(slot0, slot1, slot2)
	slot0()
	table.insert(slot1, slot1)

	if slot2.id == -1 then
		slot2.name = slot0
		slot2.id = slot2.GetID(slot0)
	end

	slot2.BeginSample(slot2.id)
end

function slot9(slot0, slot1, slot2)
	slot0()
	table.insert(slot1, slot1)

	slot3 = -1

	if slot2.nick == nil then
		slot2.nick = {}
	end

	if not slot2.nick[slot0] then
		slot2.nick[slot0] = slot2.GetID(slot0)
	end

	slot2.BeginSample(slot3)
end

function profiler_hook(slot0, slot1)
	if slot0 == "call" then
		slot2 = nil

		if slot0.cache[debug.getinfo(2, "f").func] then
			slot2 = slot4.name
		end

		if slot1[slot2] then
			return
		end

		if slot2 == "event.__call" then
			slot6 = slot2

			if not debug.getinfo(2, "n").name then
				slot7 = slot2
			end

			slot6(slot7, slot3, slot4)
		elseif slot2 then
			slot3(slot2, slot3, slot4)
		else
			slot6 = debug.getinfo(2, "Sn").name
			slot7 = debug.getinfo(2, "Sn").linedefined

			if not slot4 then
				slot0.cache[slot3] = {
					id = -1,
					name = "unknow"
				}
			end

			if slot5.short_src == "[C]" then
				if slot6 == "__index" or slot6 == "__newindex" then
					return
				end

				if not tostring(slot3):match("function: builtin#(%d+)") then
					if slot6 then
						slot8 = slot6

						slot3(slot6, slot3, slot4)
					elseif slot7 ~= -1 then
						slot3(slot5.short_src .. slot7, slot3, slot4)
					end
				elseif not slot1[slot4.ffnames[tonumber(slot9)]] then
					slot3(slot8, slot3, slot4)
				end
			elseif slot7 ~= -1 or slot6 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 115-117, warpins: 2 ---
				slot8 = slot5.short_src
				slot6 = slot6 or slot7
				slot9 = nil

				slot3(((not slot5[slot5.short_src:match("([^/\\]+)%.%w+$") or slot5.short_src:match("([^/\\]+)$")] or slot10[slot7]) and (slot5.short_src.match("([^/\\]+)%.%w+$") or slot5.short_src.match("([^/\\]+)$")) .. "." .. slot6) or slot8 .. "." .. slot6, slot3, slot4)

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #1 118-118, warpins: 1 ---
				slot6 = slot7
				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 119-126, warpins: 2 ---
				--- END OF BLOCK #2 ---

				FLOW; TARGET BLOCK #4



				-- Decompilation error in this vicinity:
				--- BLOCK #3 127-131, warpins: 1 ---
				slot9 = slot5.short_src.match("([^/\\]+)$")
				--- END OF BLOCK #3 ---

				FLOW; TARGET BLOCK #4



				-- Decompilation error in this vicinity:
				--- BLOCK #4 132-135, warpins: 2 ---
				--- END OF BLOCK #4 ---

				FLOW; TARGET BLOCK #6



				-- Decompilation error in this vicinity:
				--- BLOCK #5 136-137, warpins: 1 ---
				slot9 = slot10[slot7]

				if slot10[slot7] then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 138-141, warpins: 1 ---
					slot9 = (slot5.short_src.match("([^/\\]+)%.%w+$") or slot5.short_src.match("([^/\\]+)$")) .. "." .. slot6
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #5 ---

				FLOW; TARGET BLOCK #6



				-- Decompilation error in this vicinity:
				--- BLOCK #6 142-143, warpins: 2 ---
				--- END OF BLOCK #6 ---

				FLOW; TARGET BLOCK #8



				-- Decompilation error in this vicinity:
				--- BLOCK #7 144-147, warpins: 1 ---
				slot9 = slot8 .. "." .. slot6
				--- END OF BLOCK #7 ---

				FLOW; TARGET BLOCK #8



				-- Decompilation error in this vicinity:
				--- BLOCK #8 148-153, warpins: 2 ---
				--- END OF BLOCK #8 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 154-159, warpins: 1 ---
				slot3(slot2, slot3, slot4)
				--- END OF BLOCK #0 ---



			end
		end
	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 160-161, warpins: 1 ---
		if slot0 == "return" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 162-165, warpins: 1 ---
			if #slot6 == 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 166-166, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 167-176, warpins: 2 ---
			if debug.getinfo(2, "f").func == slot6[slot2] then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 177-184, warpins: 1 ---
				table.remove(slot6)
				slot7.EndSample()
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 185-189, warpins: 1 ---
				if slot2 < slot8(slot3.func) then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 190-190, warpins: 1 ---
					return
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 191-194, warpins: 2 ---
				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 195-202, warpins: 0 ---
				for slot8 = slot4, slot2, 1 do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 195-202, warpins: 2 ---
					table.remove(slot6)
					slot7.EndSample()
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #2 ---



			end
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---



	end
end

return {
	mark = 1,
	cache = 1,
	scan = function (slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		if slot0.mark[slot1] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-5, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 6-12, warpins: 2 ---
		slot0.mark[slot1] = true

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 13-74, warpins: 0 ---
		for slot6, slot7 in pairs(slot1) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-17, warpins: 1 ---
			if type(slot6) == "string" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 18-22, warpins: 1 ---
				if type(slot7) == "function" then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 23-25, warpins: 1 ---
					slot8 = slot6

					if slot2 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 26-29, warpins: 1 ---
						slot8 = slot2 .. "." .. slot8
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 30-33, warpins: 2 ---
					if not slot0[slot8] and slot6 ~= "__index" and slot6 ~= "__newindex" then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 38-42, warpins: 1 ---
						slot0.cache[slot7] = {
							id = -1,
							name = slot8
						}
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #1 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 43-47, warpins: 1 ---
					if type(slot7) == "table" and not slot0.mark[slot7] then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 52-57, warpins: 1 ---
						slot0:scan(slot7, slot6)
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 58-59, warpins: 1 ---
				if (slot2 and slot6 == tolua.gettag) or slot6 == tolua.settag then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 68-72, warpins: 2 ---
					slot0:scan(slot7, slot2)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 73-74, warpins: 10 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 75-75, warpins: 1 ---
		return
		--- END OF BLOCK #3 ---



	end,
	scanlibs = function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		slot0.mark[package.loaded] = true

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 10-36, warpins: 0 ---
		for slot5, slot6 in pairs(slot1) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-14, warpins: 1 ---
			if type(slot5) == "string" and type(slot6) == "table" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 20-29, warpins: 1 ---
				slot0:scan(slot6, slot5)

				if getmetatable(slot6) then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 30-34, warpins: 1 ---
					slot0:scan(slot7, slot5)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 35-36, warpins: 5 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 37-37, warpins: 1 ---
		return
		--- END OF BLOCK #2 ---



	end,
	start = function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-21, warpins: 1 ---
		slot0.mark = {}
		slot0.cache = {
			__mode = "k"
		}

		slot0:scan(_G, nil)
		slot0:scanlibs()

		slot0.mark = nil

		debug.sethook(profiler_hook, "cr", 0)

		return
		--- END OF BLOCK #0 ---



	end,
	print = function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 5-9, warpins: 0 ---
		for slot4, slot5 in pairs(slot0.cache) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-7, warpins: 1 ---
			print(slot5.name)
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 8-9, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 10-10, warpins: 1 ---
		return
		--- END OF BLOCK #2 ---



	end,
	stop = function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		debug.sethook(nil)

		slot0.cache = nil

		return
		--- END OF BLOCK #0 ---



	end
}
