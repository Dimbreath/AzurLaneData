slot0 = math.sqrt
slot2 = rawget
slot4 = math.acos
slot5 = math.max
slot7 = tolua.initget(slot6)

function slot7.up()
	return slot0({
		x = 0,
		y = 1
	}, )
end

function slot7.right()
	return slot0({
		x = 1,
		y = 0
	}, )
end

function slot7.zero()
	return slot0({
		x = 0,
		y = 0
	}, )
end

function slot7.one()
	return slot0({
		x = 1,
		y = 1
	}, )
end

slot7.magnitude = ({
	__index = function (slot0, slot1)
		if slot0(slot1, slot1) == nil and slot0(slot2, slot1) ~= nil then
			return slot2(slot0)
		end

		return slot2
	end,
	__call = function (slot0, slot1, slot2)
		return slot0({
			x = slot1 or 0,
			y = slot2 or 0
		}, slot1)
	end,
	New = function (slot0, slot1)
		return slot0({
			x = slot0 or 0,
			y = slot1 or 0
		}, slot1)
	end,
	Set = function (slot0, slot1, slot2)
		slot0.x = slot1 or 0
		slot0.y = slot2 or 0
	end,
	Get = function (slot0)
		return slot0.x, slot0.y
	end,
	SqrMagnitude = function (slot0)
		return slot0.x * slot0.x + slot0.y * slot0.y
	end,
	Clone = function (slot0)
		return slot0({
			x = slot0.x,
			y = slot0.y
		}, slot0)
	end,
	Normalize = function (slot0)
		if slot0(slot0.x *  + slot0.y * ) > 1e-05 then
			slot1 = slot1 / slot3
			slot2 = slot2 / slot3
		else
			slot1 = 0
			slot2 = 0
		end

		return slot1({
			x = slot1,
			y = slot2
		}, slot2)
	end,
	SetNormalize = function (slot0)
		if slot0(slot0.x * slot0.x + slot0.y * slot0.y) > 1e-05 then
			slot0.x = slot0.x / slot1
			slot0.y = slot0.y / slot1
		else
			slot0.x = 0
			slot0.y = 0
		end

		return slot0
	end,
	Dot = function (slot0, slot1)
		return slot0.x * slot1.x + slot0.y * slot1.y
	end,
	Angle = function (slot0, slot1)
		if slot0(slot0.x *  + slot0.y * ) > 1e-05 then
			slot2 = slot2 / slot4
			slot3 = slot3 / slot4
		else
			slot3 = 0
			slot2 = 0
		end

		if slot0(slot1.x *  + slot1.y * ) > 1e-05 then
			slot5 = slot5 / slot4
			slot6 = slot6 / slot4
		else
			slot6 = 0
			slot5 = 0
		end

		if slot2 * slot5 + slot3 * slot6 < -1 then
			slot4 = -1
		elseif slot4 > 1 then
			slot4 = 1
		end

		return slot1(slot4) * 57.29578
	end,
	Magnitude = function (slot0)
		return slot0(slot0.x * slot0.x + slot0.y * slot0.y)
	end,
	Reflect = function (slot0, slot1)
		return slot0({
			x = -2 * (slot0.x * slot1.x + slot0.y * slot1.y) * slot1.x + slot0.x,
			y = -2 * (slot0.x * slot1.x + slot0.y * slot1.y) * slot1.y + slot0.y
		}, slot1)
	end,
	Distance = function (slot0, slot1)
		return slot0((slot0.x - slot1.x)^2 + (slot0.y - slot1.y)^2)
	end,
	Lerp = function (slot0, slot1, slot2)
		if slot2 < 0 then
			slot2 = 0
		elseif slot2 > 1 then
			slot2 = 1
		end

		return slot0({
			x = slot0.x + (slot1.x - slot0.x) * slot2,
			y = slot0.y + (slot1.y - slot0.y) * slot2
		}, slot1)
	end,
	LerpUnclamped = function (slot0, slot1, slot2)
		return slot0({
			x = slot0.x + (slot1.x - slot0.x) * slot2,
			y = slot0.y + (slot1.y - slot0.y) * slot2
		}, slot1)
	end,
	MoveTowards = function (slot0, slot1, slot2)
		if (slot1.x - slot0.x) * () + (slot1.y - slot0.y) * () > slot2 * slot2 and slot7 ~= 0 then
			return slot1({
				x = slot3 + slot5 * slot2 / slot0(slot7),
				y = slot4 + slot6 * slot2 / slot0(slot7)
			}, slot2)
		end

		return slot1({
			x = slot1.x,
			y = slot1.y
		}, slot2)
	end,
	ClampMagnitude = function (slot0, slot1)
		if slot0.x *  + slot0.y *  > slot1 * slot1 then
			return slot1({
				x = slot2 * slot1 / slot0(slot4),
				y = slot3 * slot1 / slot0(slot4)
			}, slot2 * slot1 / slot0(slot4))
		end

		return slot1({
			x = slot2,
			y = slot3
		}, slot2)
	end,
	SmoothDamp = function (slot0, slot1, slot2, slot3, slot4, slot5)
		if not slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 3-4, warpins: 1 ---
			slot5 = Time.deltaTime

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 5-6, warpins: 2 ---
			if not slot4 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 7-8, warpins: 1 ---
				slot4 = slot0.huge
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #1 ---



		end

		slot4 = slot4 or slot0.huge
		slot7 = 1 / (1 + 2 / slot0.max(0.0001, slot3) * slot5 + 0.48 * 2 / slot0.max(0.0001, slot3) * slot5 * 2 / slot0.max(0.0001, slot3) * slot5 + 0.235 * 2 / slot0.max(0.0001, slot3) * slot5 * 2 / slot0.max(0.0001, slot3) * slot5 * 2 / slot0.max(0.0001, slot3) * slot5)

		if (slot0.x - slot1.x) * () + (slot0.y - slot1.y) * () > (slot4 or slot0.huge) * slot0.max(0.0001, slot3) *  then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 39-44, warpins: 1 ---
			slot12 = slot12 * slot15 / slot1(slot14)
			slot13 = slot13 * slot15 / slot1(slot14)
			--- END OF BLOCK #0 ---



		end

		slot2.x = (slot2.x - slot6 * (slot2.x + slot6 * slot12) * slot5) * slot7
		slot2.y = (slot2.y - slot6 * (slot2.y + slot6 * slot13) * slot5) * slot7

		if (slot8 - slot10) * ((slot10 - slot12 + (slot12 + (slot2.x + slot6 * slot12) * slot5) * slot7) - slot8) + (slot9 - slot11) * ((slot11 - slot13 + (slot13 + (slot2.y + slot6 * slot13) * slot5) * slot7) - slot9) > 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 79-84, warpins: 1 ---
			slot14 = slot8
			slot15 = slot9
			slot2.x = 0
			slot2.y = 0
			--- END OF BLOCK #0 ---



		end

		return slot2({
			x = slot14,
			y = slot15
		}, slot3), slot2
	end,
	Max = function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-16, warpins: 1 ---
		return slot0({
			x = slot1.max(slot0.x, slot1.x),
			y = slot1.max(slot0.y, slot1.y)
		}, slot0)
		--- END OF BLOCK #0 ---



	end,
	Min = function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-16, warpins: 1 ---
		return slot0({
			x = slot1.min(slot0.x, slot1.x),
			y = slot1.min(slot0.y, slot1.y)
		}, slot0)
		--- END OF BLOCK #0 ---



	end,
	Scale = function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-12, warpins: 1 ---
		return slot0({
			x = slot0.x * slot1.x,
			y = slot0.y * slot1.y
		}, slot1)
		--- END OF BLOCK #0 ---



	end,
	Div = function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		slot0.x = slot0.x / slot1
		slot0.y = slot0.y / slot1

		return slot0
		--- END OF BLOCK #0 ---



	end,
	Mul = function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		slot0.x = slot0.x * slot1
		slot0.y = slot0.y * slot1

		return slot0
		--- END OF BLOCK #0 ---



	end,
	Add = function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		slot0.x = slot0.x + slot1.x
		slot0.y = slot0.y + slot1.y

		return slot0
		--- END OF BLOCK #0 ---



	end,
	Sub = function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		slot0.x = slot0.x - slot1.x
		slot0.y = slot0.y - slot1.y

		return
		--- END OF BLOCK #0 ---



	end,
	__tostring = function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		return string.format("(%f,%f)", slot0.x, slot0.y)
		--- END OF BLOCK #0 ---



	end,
	__div = function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-10, warpins: 1 ---
		return slot0({
			x = slot0.x / slot1,
			y = slot0.y / slot1
		}, slot1)
		--- END OF BLOCK #0 ---



	end,
	__mul = function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		if type(slot1) == "number" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-16, warpins: 1 ---
			return slot0({
				x = slot0.x * slot1,
				y = slot0.y * slot1
			}, slot1)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 17-26, warpins: 1 ---
			return slot0({
				x = slot0 * slot1.x,
				y = slot0 * slot1.y
			}, slot1)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 27-27, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end,
	__add = function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-12, warpins: 1 ---
		return slot0({
			x = slot0.x + slot1.x,
			y = slot0.y + slot1.y
		}, slot1)
		--- END OF BLOCK #0 ---



	end,
	__sub = function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-12, warpins: 1 ---
		return slot0({
			x = slot0.x - slot1.x,
			y = slot0.y - slot1.y
		}, slot1)
		--- END OF BLOCK #0 ---



	end,
	__unm = function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-10, warpins: 1 ---
		return slot0({
			x = -slot0.x,
			y = -slot0.y
		}, slot0)
		--- END OF BLOCK #0 ---



	end,
	__eq = function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-14, warpins: 1 ---
		if (slot0.x - slot1.x)^2 + (slot0.y - slot1.y)^2 >= 9.999999e-11 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-16, warpins: 1 ---
			slot2 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 17-17, warpins: 1 ---
			slot2 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 18-18, warpins: 2 ---
		return slot2
		--- END OF BLOCK #1 ---



	end
})["Magnitude"]
slot7.normalized = ()["Normalize"]
slot7.sqrMagnitude = ()["SqrMagnitude"]
UnityEngine.Vector2 = 

setmetatable(, )

return 
