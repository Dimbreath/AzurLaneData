pg = pg or {}
slot1 = require("Mgr/Pool/PoolUtil")
slot2 = class("Pool")
pg.Pool = slot2

function slot2.Ctor(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot0.template = slot2
	slot0.keepParent = slot5
	slot0.parentTF = slot1
	slot0.templateActive = slot2.activeSelf
	slot0.parentActive = slot1.gameObject.activeSelf
	slot0.keepActive = slot6
	slot0.min = slot3
	slot0.list = ys.LinkList.New()
	slot0.map = {}
	slot0.usedEnd = nil
	slot0.resizeTime = slot4
end

function slot2.InitSize(slot0, slot1)
	slot1 = slot1 or slot0.min
	slot2 = {}

	for slot6 = 1, slot1, 1 do
		slot2[slot6] = slot0:GetObject()
	end

	for slot6 = 1, slot1, 1 do
		slot0:Recycle(slot2[slot6])
	end

	return slot0
end

function slot2.SetInitFuncs(slot0, slot1)
	slot0.initFunc = slot1
end

function slot2.SetRecycleFuncs(slot0, slot1)
	slot0.recycleFunc = slot1
end

function slot2.IsEmpty(slot0)
	return slot0.usedEnd == slot0.list.Tail
end

function slot2.GetRootTF(slot0)
	return slot0.parentTF
end

function slot2.GetObject(slot0)
	slot1 = nil
	slot2 = slot0.usedEnd

	if not slot0:IsEmpty() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-9, warpins: 1 ---
		slot2 = (slot2 ~= nil or slot0.list.Head) and slot0.usedEnd.Next
		slot0.usedEnd = (slot2 ~= nil or slot0.list.Head) and slot0.usedEnd.Next
		slot0.map[(slot2 ~= nil or slot0.list.Head) and slot0.usedEnd.Next.Data] = (slot2 ~= nil or slot0.list.Head) and slot0.usedEnd.Next

		LuaHelper.ResetTF((slot2 ~= nil or slot0.list.Head) and slot0.usedEnd.Next.Data.transform)

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #1 10-12, warpins: 1 ---
		slot2 = slot0.list.Head

		if slot0.list.Head then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-14, warpins: 1 ---
			slot2 = slot0.usedEnd.Next
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 15-25, warpins: 2 ---
		if not slot0.keepActive and slot0.parentActive then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 29-33, warpins: 1 ---
			slot1:SetActive(true)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #2 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 34-41, warpins: 1 ---
		slot1 = Object.Instantiate(slot0.template)

		if not slot0.templateActive then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 42-45, warpins: 1 ---
			slot1:SetActive(true)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 46-48, warpins: 2 ---
		if slot0.keepParent then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 49-54, warpins: 1 ---
			slot1.transform:SetParent(slot0.parentTF, false)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 55-57, warpins: 2 ---
		if slot0.initFunc then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 58-60, warpins: 1 ---
			slot0.initFunc(slot1)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 61-68, warpins: 2 ---
		slot0.usedEnd = slot0.list:AddLast(slot1)
		slot0.map[slot1] = slot0.list.AddLast(slot1)
		--- END OF BLOCK #3 ---



	end

	return slot1
end

function slot2.ResetParent(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot0.parentTF = slot1

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-15, warpins: 0 ---
	for slot5 in slot0.list:Iterator() do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-13, warpins: 1 ---
		slot5.Data.transform:SetParent(slot0.parentTF, false)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 14-15, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 16-16, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

function slot2.Recycle(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0.map[slot1] == nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-9, warpins: 1 ---
		slot0.Destroy(slot1)

		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-15, warpins: 2 ---
	slot0.map[slot1] = nil

	if not slot0.keepActive and slot0.parentActive then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-22, warpins: 1 ---
		slot1:SetActive(false)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 23-25, warpins: 3 ---
	if not slot0.keepParent then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 26-31, warpins: 1 ---
		LuaHelper.SetGOParentTF(slot1, slot0.parentTF, false)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 32-34, warpins: 2 ---
	if slot0.recycleFunc then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 35-37, warpins: 1 ---
		slot0.recycleFunc(slot1)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 38-40, warpins: 2 ---
	if slot0.usedEnd == slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 41-42, warpins: 1 ---
		slot0.usedEnd = slot2.Before
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 43-63, warpins: 2 ---
	slot0.list:Remove(slot2)
	slot0.list:AddNodeLast(slot2)

	slot2.liveTime = slot1.TimeMgr.GetInstance():GetCombatTime() + slot0.resizeTime

	return
	--- END OF BLOCK #5 ---



end

function slot2.AllRecycle(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-10, warpins: 0 ---
	for slot4, slot5 in pairs(slot0.map) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-8, warpins: 1 ---
		slot0:Recycle(slot4)
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
	return
	--- END OF BLOCK #2 ---



end

function slot2.Resize(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	if slot0.list.Count <= slot0.min then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-6, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-10, warpins: 2 ---
	slot1 = nil

	if slot0.usedEnd then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-13, warpins: 1 ---
		slot1 = slot0.usedEnd.Next
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-15, warpins: 1 ---
		slot1 = slot0.list.Head
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 16-23, warpins: 2 ---
	slot2 = slot0.TimeMgr.GetInstance():GetCombatTime()
	slot3 = 0

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 24-25, warpins: 3 ---
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 26-53, warpins: 0 ---
	while slot1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 26-26, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 27-29, warpins: 1 ---
		if slot2 < slot1.liveTime then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 30-30, warpins: 1 ---
			break
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 31-45, warpins: 1 ---
		slot1.Destroy(slot1.Data)
		slot0.list:Remove(slot1)

		slot1 = slot1.Next

		if slot3 + 1 >= 6 or slot0.list.Count <= slot0.min then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 51-51, warpins: 1 ---
			break
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 52-52, warpins: 0 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 53-53, warpins: 0 ---
		--- END OF BLOCK #3 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 53-53, warpins: 4 ---
	return
	--- END OF BLOCK #5 ---



end

function slot2.Dispose(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-11, warpins: 0 ---
	for slot4 in slot0.list:Iterator() do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-9, warpins: 1 ---
		slot0.Destroy(slot4.Data)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 10-11, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 12-22, warpins: 1 ---
	slot0.list = nil
	slot0.map = nil
	slot0.last = nil
	slot0.template = nil
	slot0.parentTF = nil

	return
	--- END OF BLOCK #2 ---



end

return
