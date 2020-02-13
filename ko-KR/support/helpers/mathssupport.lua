function uuid()
	return string.gsub("xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx", "[xy]", function (slot0)
		return string.format("%x", (slot0 == "x" and math.random(0, 15)) or math.random(8, 11))
	end)
end

function map(slot0, slot1, slot2, slot3, slot4)
	return (slot0 - slot1) / (slot2 - slot1) * (slot4 - slot3) + slot3
end

function shuffle(slot0)
	for slot4 = #slot0, 2, -1 do
		slot0[slot4] = slot0[math.random(slot4)]
		slot0[math.random(slot4)] = slot0[slot4]
	end
end

slot0 = math.floor
slot1 = math.abs

function math.round(slot0)
	return slot0(slot0 + 0.5)
end

function math.sign(slot0)
	return (slot0 > 0 and 1) or (slot0 < 0 and -1) or 0
end

function math.clamp(slot0, slot1, slot2)
	if slot0 < slot1 then
		slot0 = slot1
	elseif slot2 < slot0 then
		slot0 = slot2
	end

	return slot0
end

slot2 = math.clamp

function math.lerp(slot0, slot1, slot2)
	return slot0 + (slot1 - slot0) * slot0(slot2, 0, 1)
end

function math.Repeat(slot0, slot1)
	return slot0 - slot0(slot0 / slot1) * slot1
end

function math.LerpAngle(slot0, slot1, slot2)
	if math.Repeat(slot1 - slot0, 360) > 180 then
		slot3 = slot3 - 360
	end

	return slot0 + slot3 * slot0(slot2, 0, 1)
end

function math.MoveTowards(slot0, slot1, slot2)
	if slot0(slot1 - slot0) <= slot2 then
		return slot1
	end

	return slot0 + mathf.sign(slot1 - slot0) * slot2
end

function math.DeltaAngle(slot0, slot1)
	if math.Repeat(slot1 - slot0, 360) > 180 then
		slot2 = slot2 - 360
	end

	return slot2
end

function math.MoveTowardsAngle(slot0, slot1, slot2)
	return math.MoveTowards(slot0, slot0 + math.DeltaAngle(slot0, slot1), slot2)
end

function math.Approximately(slot0, slot1)
	return slot0(slot1 - slot0) < math.max(1e-06 * math.max(slot0(slot0), slot0(slot1)), 1.121039e-44)
end

function math.InverseLerp(slot0, slot1, slot2)
	if slot0 < slot1 then
		if slot2 < slot0 then
			return 0
		end

		if slot1 < slot2 then
			return 1
		end

		return (slot2 - slot0) / (slot1 - slot0)
	end

	if slot0 <= slot1 then
		return 0
	end

	if slot2 < slot1 then
		return 1
	end

	if slot0 < slot2 then
		return 0
	end

	return 1 - (slot2 - slot1) / (slot0 - slot1)
end

function math.PingPong(slot0, slot1)
	return slot1 - slot0(math.Repeat(slot0, slot1 * 2) - slot1)
end

math.deg2Rad = math.pi / 180
math.rad2Deg = 180 / math.pi
math.epsilon = 1.401298e-45

function math.Random(slot0, slot1)
	return math.random() * (slot1 - slot0) + slot0
end

function math.isnan(slot0)
	return slot0 ~= slot0
end

slot3 = math.pi
slot4 = 2 * math.pi
slot5 = math.pi / 2

function math.sin16(slot0)
	slot1 = nil

	if slot0 < 0 or slot0 <= slot0 then
		slot0 = slot0 - slot1(slot0 / slot0) * slot0
	end

	if slot0 < slot2 then
		if slot3 < slot0 then
			slot0 = slot2 - slot0
		end
	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 24-28, warpins: 1 ---
		slot0 = (slot0 > slot2 + slot3 and slot0 - slot0) or slot2 - slot0

		return ((slot0 > slot2 + slot3 and slot0 - slot0) or slot2 - slot0) * (((((-2.39e-08 * ((slot0 > slot2 + slot3 and slot0 - slot0) or slot2 - slot0) * () + 2.7526e-06) * ((slot0 > slot2 + slot3 and slot0 - slot0) or slot2 - slot0) * () - 0.000198409) * ((slot0 > slot2 + slot3 and slot0 - slot0) or slot2 - slot0) * () + 0.0083333315) * ((slot0 > slot2 + slot3 and slot0 - slot0) or slot2 - slot0) * () - 0.1666666664) * ((slot0 > slot2 + slot3 and slot0 - slot0) or slot2 - slot0) * () + 1)

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #1 29-31, warpins: 1 ---
		slot0 = slot0 - slot0

		if slot0 - slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 32-33, warpins: 1 ---
			slot0 = slot2 - slot0
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #1 ---



	end
end

function math.atan16(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot1 = nil

	if slot0(slot0) > 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-32, warpins: 1 ---
		slot1 = -((((((((0.0028662257 * 1 / slot0 *  - 0.0161657367) * 1 / slot0 *  + 0.0429096138) * 1 / slot0 *  - 0.07528964) * 1 / slot0 *  + 0.1065626393) * 1 / slot0 *  - 0.1420889944) * 1 / slot0 *  + 0.1999355085) * 1 / slot0 *  - 0.3333314528) * 1 / slot0 *  + 1) * 1 / slot0

		if FLOATSIGNBITSET(1 / slot0) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 33-36, warpins: 1 ---
			return slot1 - slot1
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 37-40, warpins: 1 ---
			return slot1 + slot1
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 41-59, warpins: 1 ---
		return ((((((((0.0028662257 * slot0 * slot0 - 0.0161657367) * slot0 * slot0 + 0.0429096138) * slot0 * slot0 - 0.07528964) * slot0 * slot0 + 0.1065626393) * slot0 * slot0 - 0.1420889944) * slot0 * slot0 + 0.1999355085) * slot0 * slot0 - 0.3333314528) * slot0 * slot0 + 1) * slot0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 60-60, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



end

function getExpPercent(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	return (slot0 - slot1) / (slot2 - slot1) / 100
	--- END OF BLOCK #0 ---



end

function intProperties(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-10, warpins: 0 ---
	for slot4, slot5 in pairs(slot0) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-8, warpins: 1 ---
		slot0[slot4] = calcFloor(slot5)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 9-10, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 11-11, warpins: 1 ---
	return slot0
	--- END OF BLOCK #2 ---



end

function defaultValue(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if slot0 == nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-4, warpins: 1 ---
		return slot1
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-5, warpins: 1 ---
		return slot0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-6, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function calcFloor(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	return math.floor(slot0 + 1e-09)
	--- END OF BLOCK #0 ---



end

return
