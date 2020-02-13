pg = pg or {}
slot0 = math.max
slot1 = math.min
slot3 = pg.CldNode
slot4 = table
pg.CldArea = class("CldArea")

function pg.CldArea.Ctor(slot0, slot1, slot2, slot3)
	slot0.min = slot1
	slot0.max = slot2
	slot0.center = slot1 + slot2:Mul(0.5)
	slot0.father = slot3

	if slot3 then
		slot0.level = slot3.level + 1
	else
		slot0.level = 1
	end

	slot0.isLeaf = true
	slot0.childs = {}
	slot0.nodes = {}
end

function pg.CldArea.AddNode(slot0, slot1)
	slot0.insert(slot0.nodes, slot1)

	slot1.area = slot0
end

function pg.CldArea.InArea(slot0, slot1, slot2)
	if slot1.x < slot0.min.x or slot1.y < slot0.min.y then
		return false
	end

	if slot0.max.x < slot2.x or slot0.max.y < slot2.y then
		return false
	end

	return true
end

function pg.CldArea.GetAreaIndex(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-12, warpins: 2 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 16-17, warpins: 2 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 20-23, warpins: 2 ---
	if slot0.center.x <= slot1.x then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-7, warpins: 1 ---
		slot4 = 0
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-8, warpins: 1 ---
		slot4 = 2
		--- END OF BLOCK #0 ---



	end

	if slot3.x <= slot2.x then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-14, warpins: 1 ---
		slot5 = 0
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-15, warpins: 1 ---
		slot5 = 2
		--- END OF BLOCK #0 ---



	end

	if slot4 ~= slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 18-19, warpins: 1 ---
		return 0
		--- END OF BLOCK #0 ---



	end

	slot6 = (slot3.z <= slot1.z and 1) or 2

	return (slot4 + ((slot3.z <= slot1.z and 1) or 2) == slot5 + ((slot3.z <= slot2.z and 1) or 2) and slot4 + ((slot3.z <= slot1.z and 1) or 2)) or 0

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #4 24-25, warpins: 1 ---
	slot6 = 1

	if 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 26-26, warpins: 1 ---
		slot6 = 2
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 27-31, warpins: 2 ---
	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #6 32-33, warpins: 1 ---
	slot6 = 1

	if 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 34-34, warpins: 1 ---
		slot6 = 2
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 35-37, warpins: 2 ---
	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #8 38-39, warpins: 1 ---
	if not slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 40-40, warpins: 2 ---
		slot6 = 0
		--- END OF BLOCK #0 ---



	end
	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 41-41, warpins: 2 ---
	--- END OF BLOCK #9 ---



end

slot5 = class("ColliderTree")
pg.ColliderTree = slot5
slot5.MaxLayer = 3
slot6 = 6

function slot5.Ctor(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	slot0.name = slot1
	slot0.root = slot0.CldArea.New(slot2, slot3, nil)
	slot0.MaxLayer = slot4
	slot0.cldStack = {}

	return
	--- END OF BLOCK #0 ---



end

function slot5.Insert(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot1.area then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-8, warpins: 1 ---
		slot0.removebyvalue(slot2.nodes, slot1)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-18, warpins: 2 ---
	slot0:_insert(slot1, slot0:_findParent(slot1, slot0.root))

	return
	--- END OF BLOCK #1 ---



end

function slot5._findParent(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot3 = slot1.min
	slot4 = slot1.max
	slot5 = nil

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-6, warpins: 2 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 7-21, warpins: 0 ---
	while not slot2.isLeaf do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-7, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-16, warpins: 1 ---
		if slot2:GetAreaIndex(slot3, slot4) < 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 17-17, warpins: 1 ---
			break
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 18-20, warpins: 1 ---
		slot2 = slot2.childs[slot5]
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 21-21, warpins: 1 ---
		--- END OF BLOCK #3 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 21-21, warpins: 2 ---
	return slot2
	--- END OF BLOCK #3 ---



end

function slot5._insert(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot3 = nil

	if not slot2.isLeaf or #slot2.nodes < slot0 or slot0.MaxLayer <= slot2.level then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-18, warpins: 3 ---
		slot2:AddNode(slot1)

		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 19-80, warpins: 2 ---
	slot2.isLeaf = false
	slot2.childs[1] = slot1.CldArea.New(slot4, slot5, slot2)
	slot2.childs[2] = slot1.CldArea.New(Vector3(slot2.center.x, 0, slot2.min.z), Vector3(slot2.max.x, 0, slot2.center.z), slot2)
	slot2.childs[3] = slot1.CldArea.New(Vector3(slot2.min.x, 0, slot2.center.z), Vector3(slot2.center.x, 0, slot2.max.z), slot2)
	slot2.childs[4] = slot1.CldArea.New(slot6, slot4, slot2)

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 81-103, warpins: 0 ---
	for slot10 = #slot2.nodes, 1, -1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 81-91, warpins: 2 ---
		if slot2:GetAreaIndex(slot2.nodes[slot10].min, slot2.nodes[slot10].max) > 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 92-102, warpins: 1 ---
			slot2.childs[slot3]:AddNode(slot11)
			slot2.remove(slot2.nodes, slot10)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 103-103, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 104-112, warpins: 1 ---
	if slot2:GetAreaIndex(slot1.min, slot1.max) > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 113-119, warpins: 1 ---
		slot2.childs[slot3]:AddNode(slot1)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 120-123, warpins: 1 ---
		slot2:AddNode(slot1)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 124-124, warpins: 2 ---
	return
	--- END OF BLOCK #4 ---



end

function slot5.Update(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot1.area == nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-6, warpins: 2 ---
	slot3 = slot1.min
	slot4 = slot1.max

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 7-9, warpins: 2 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 10-21, warpins: 0 ---
	while slot2.father do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-10, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 11-17, warpins: 1 ---
		if slot2:InArea(slot3, slot4) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-18, warpins: 1 ---
			break
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 19-20, warpins: 1 ---
		slot2 = slot2.father
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 21-21, warpins: 1 ---
		--- END OF BLOCK #3 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 21-28, warpins: 2 ---
	if slot0:_findParent(slot1, slot2) ~= slot1.area then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 29-39, warpins: 1 ---
		slot0.removebyvalue(slot1.area.nodes, slot1)
		slot0:_insert(slot1, slot5)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 40-40, warpins: 2 ---
	return
	--- END OF BLOCK #5 ---



end

function slot5.Remove(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if not slot1.area then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-12, warpins: 2 ---
	slot0.removebyvalue(slot2.nodes, slot1)

	slot1.area = nil

	return
	--- END OF BLOCK #1 ---



end

function slot5.Intersect(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0.x > slot3.x or slot2.x > slot1.x or slot0.z > slot3.z or slot2.z > slot1.z then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-18, warpins: 4 ---
		slot4 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-19, warpins: 1 ---
		slot4 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 20-20, warpins: 2 ---
	return slot4
	--- END OF BLOCK #1 ---



end

function slot5.CylinderCheck(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if not slot0.cylinder and not slot1.cylinder then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-8, warpins: 1 ---
		return true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-11, warpins: 3 ---
	if slot0.cylinder and slot1.cylinder then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-33, warpins: 1 ---
		if (slot0.center.x - slot1.center.x) * () + (slot0.center.z - slot1.center.z) * () > (slot0.range + slot1.range) * () then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 34-35, warpins: 1 ---
			slot5 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 36-36, warpins: 1 ---
			slot5 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 37-37, warpins: 2 ---
		return slot5
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 38-40, warpins: 3 ---
	if not slot0.cylinder or not slot0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 43-43, warpins: 2 ---
		slot2 = slot1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 44-51, warpins: 2 ---
	slot3 = slot2.range
	slot4 = slot2.center.x
	slot5 = slot2.center.z

	if not slot0.cylinder or not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 54-54, warpins: 2 ---
		slot6 = slot0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 55-58, warpins: 2 ---
	if slot6.min.x <= slot4 and slot4 <= slot6.max.x then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 63-67, warpins: 1 ---
		if slot5 < slot6.min.z - slot3 or slot5 > slot6.max.z + slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 73-74, warpins: 2 ---
			slot7 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 75-75, warpins: 1 ---
			slot7 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 76-77, warpins: 2 ---
		return slot7
		--- END OF BLOCK #1 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 78-81, warpins: 2 ---
		if slot6.min.z <= slot5 and slot5 <= slot6.max.z then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 86-90, warpins: 1 ---
			if slot4 < slot6.min.x - slot3 or slot4 > slot6.max.x + slot3 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 96-97, warpins: 2 ---
				slot7 = false
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 98-98, warpins: 1 ---
				slot7 = true
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 99-100, warpins: 2 ---
			return slot7
			--- END OF BLOCK #1 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 101-105, warpins: 2 ---
			slot7, slot8 = nil

			if slot4 < slot6.min.x then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 106-109, warpins: 1 ---
				slot7 = slot6.min.x - slot4
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 110-112, warpins: 1 ---
				slot7 = slot6.max.x - slot4
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 113-116, warpins: 2 ---
			if slot5 < slot6.min.z then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 117-120, warpins: 1 ---
				slot8 = slot6.min.z - slot5
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 121-123, warpins: 1 ---
				slot8 = slot6.max.z - slot5
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 124-129, warpins: 2 ---
			if slot7 * slot7 + slot8 * slot8 >= slot3 * slot3 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 130-131, warpins: 1 ---
				slot9 = false
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 132-132, warpins: 1 ---
				slot9 = true
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 133-133, warpins: 2 ---
			return slot9
			--- END OF BLOCK #3 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 134-134, warpins: 3 ---
	return
	--- END OF BLOCK #5 ---



end

function slot5.getTime(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot3 = 0

	if slot2.x ~= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-23, warpins: 1 ---
		slot3 = slot0(0, (slot0(slot0.min.x, slot1.min.x) - slot1(slot0.max.x, slot1.max.x)) / slot2.x)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 24-26, warpins: 2 ---
	if slot2.z ~= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 27-45, warpins: 1 ---
		slot3 = slot0(slot3, (slot0(slot0.min.z, slot1.min.z) - slot1(slot0.max.z, slot1.max.z)) / slot2.z)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 46-46, warpins: 2 ---
	return slot3
	--- END OF BLOCK #2 ---



end

function slot5.GetCldList(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot3 = slot1.min
	slot4 = slot1.max
	slot5 = nil
	slot6 = slot0.root
	slot7 = {}

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-8, warpins: 2 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 9-50, warpins: 0 ---
	while not slot6.isLeaf do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-9, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 10-18, warpins: 1 ---
		if slot6:GetAreaIndex(slot3, slot4) < 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 19-19, warpins: 1 ---
			break
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 20-23, warpins: 1 ---
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 24-46, warpins: 0 ---
		for slot11, slot12 in ipairs(slot6.nodes) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 24-32, warpins: 1 ---
			if slot0.Intersect(slot12.min, slot12.max, slot3, slot4) and slot0.CylinderCheck(slot1, slot12) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 40-44, warpins: 1 ---
				slot1.insert(slot7, slot12)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 45-46, warpins: 4 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 47-49, warpins: 1 ---
		slot6 = slot6.childs[slot5]
		--- END OF BLOCK #4 ---

		FLOW; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #5 50-50, warpins: 1 ---
		--- END OF BLOCK #5 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 50-55, warpins: 2 ---
	slot1.insert(slot0.cldStack, slot6)

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 56-59, warpins: 2 ---
	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 60-116, warpins: 0 ---
	while #slot8 > 0 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 60-60, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 61-68, warpins: 1 ---
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 69-91, warpins: 0 ---
		for slot13, slot14 in ipairs(slot1.remove(slot8).nodes) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 69-77, warpins: 1 ---
			if slot0.Intersect(slot14.min, slot14.max, slot3, slot4) and slot0.CylinderCheck(slot1, slot14) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 85-89, warpins: 1 ---
				slot1.insert(slot7, slot14)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 90-91, warpins: 4 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 92-95, warpins: 1 ---
		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 96-114, warpins: 0 ---
		for slot13, slot14 in pairs(slot9.childs) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 96-98, warpins: 1 ---
			if slot14 ~= null and slot0.Intersect(slot14.min, slot14.max, slot3, slot4) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 108-112, warpins: 1 ---
				slot1.insert(slot8, slot14)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 113-114, warpins: 4 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #4 ---

		FLOW; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #5 115-115, warpins: 1 ---
		--- END OF BLOCK #5 ---

		FLOW; TARGET BLOCK #6



		-- Decompilation error in this vicinity:
		--- BLOCK #6 116-116, warpins: 1 ---
		--- END OF BLOCK #6 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 116-116, warpins: 1 ---
	return slot7
	--- END OF BLOCK #6 ---



end

function slot5.GetCldListGradient(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-98, warpins: 1 ---
	slot5 = Vector3(math.cos(slot1), 0, math.sin(slot1))
	slot9 = slot0.CldNode.New()

	slot9:UpdateBox(slot10, slot11)

	slot12 = slot0:GetCldList(slot9, nil)

	if slot5.x * slot5.z == 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 99-99, warpins: 1 ---
		return slot12
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 100-104, warpins: 2 ---
	slot14, slot15, slot16, slot17 = nil

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 105-195, warpins: 0 ---
	for slot21 = #slot12, 1, -1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 105-108, warpins: 2 ---
		slot22 = slot12[slot21]

		if slot13 > 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 109-123, warpins: 1 ---
			slot16 = Vector3(slot22.min.x, 0, slot22.max.z)
			slot17 = Vector3(slot22.max.x, 0, slot22.min.z)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 124-137, warpins: 1 ---
			slot14 = Vector3(slot22.min.x, 0, slot22.max.z)
			slot15 = Vector3(slot22.max.x, 0, slot22.min.z)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 138-138, warpins: 2 ---
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 139-153, warpins: 1 ---
		slot24 = Vector3.Dot(slot5, slot15 - slot7[1])

		if (Vector3.Dot(slot5, slot14 - slot7[1]) < 0 and slot24 < 0) or (slot3 < slot23 and slot3 < slot24) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 161-166, warpins: 2 ---
			slot3.remove(slot12, slot21)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 167-181, warpins: 2 ---
			slot26 = Vector3.Dot(slot6, slot17 - slot7[1])

			if (Vector3.Dot(slot6, slot16 - slot7[1]) < 0 and slot26 < 0) or (slot2 < slot25 and slot2 < slot26) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 189-194, warpins: 2 ---
				slot3.remove(slot12, slot21)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 195-195, warpins: 4 ---
		--- END OF BLOCK #3 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 196-196, warpins: 1 ---
	return slot12
	--- END OF BLOCK #3 ---



end

return
