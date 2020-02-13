slot0 = class("AutoLoader")
slot1 = import("view.util.RequestPackages.LoadPrefabRequestPackage")
slot2 = import("view.util.RequestPackages.LoadReferenceRequestPackage")
slot3 = import("view.util.RequestPackages.GetSpineRequestPackage")
slot4 = import("view.util.RequestPackages.GetPrefabRequestPackage")
slot5 = import("view.util.RequestPackages.GetSpriteRequestPackage")
slot6 = import("view.util.RequestPackages.ReturnPrefabRequestPackage")
slot7 = import("view.util.RequestPackages.ReturnSpineRequestPackage")
slot8 = import("view.util.RequestPackages.DestroyAtlasPoolRequestPackage")

function slot0.Ctor(slot0)
	slot0._loadingRequest = {}
	slot0._returnRequest = {}
end

function slot0.GetPrefab(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	slot2 = slot2 or ""
	slot5 = nil

	slot0.InsertList(slot0._loadingRequest, slot1, slot0.New(slot1, slot2 or "", function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-15, warpins: 1 ---
		table.removebyvalue(slot0._loadingRequest[slot1], )

		if #slot0._loadingRequest[] == 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-20, warpins: 1 ---
			slot0._loadingRequest[] = nil
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 21-23, warpins: 2 ---
		if slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 24-26, warpins: 1 ---
			slot3(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 27-39, warpins: 2 ---
		slot0.InsertList(slot0._returnRequest, slot0, slot4.New(slot5, slot6, slot0))

		return
		--- END OF BLOCK #2 ---



	end))
	slot0.New(slot1, slot2 or "", function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-15, warpins: 1 ---
		table.removebyvalue(slot0._loadingRequest[slot1], )

		if #slot0._loadingRequest[] == 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-20, warpins: 1 ---
			slot0._loadingRequest[] = nil
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 21-23, warpins: 2 ---
		if slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 24-26, warpins: 1 ---
			slot3(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 27-39, warpins: 2 ---
		slot0.InsertList(slot0._returnRequest, slot0, slot4.New(slot5, slot6, slot0))

		return
		--- END OF BLOCK #2 ---



	end):Start()

	return

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #1 3-3, warpins: 1 ---
	slot2 = ""
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 4-22, warpins: 2 ---
	--- END OF BLOCK #2 ---



end

function slot0.ReturnPrefab(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot0:ClearRequest(go(slot1))

	return
	--- END OF BLOCK #0 ---



end

function slot0.GetSpine(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if not slot1 or #slot1 < 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-7, warpins: 2 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-9, warpins: 1 ---
	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-10, warpins: 1 ---
		slot1 = ""
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 11-28, warpins: 2 ---
	slot4 = nil

	slot0.InsertList(slot0._loadingRequest, slot1, slot0.New(slot1, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-15, warpins: 1 ---
		table.removebyvalue(slot0._loadingRequest[slot1], )

		if #slot0._loadingRequest[] == 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-20, warpins: 1 ---
			slot0._loadingRequest[] = nil
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 21-23, warpins: 2 ---
		if slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 24-26, warpins: 1 ---
			slot3(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 27-38, warpins: 2 ---
		slot0.InsertList(slot0._returnRequest, slot0, slot4.New(slot5, slot0))

		return
		--- END OF BLOCK #2 ---



	end))
	slot0.New(slot1, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-15, warpins: 1 ---
		table.removebyvalue(slot0._loadingRequest[slot1], )

		if #slot0._loadingRequest[] == 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-20, warpins: 1 ---
			slot0._loadingRequest[] = nil
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 21-23, warpins: 2 ---
		if slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 24-26, warpins: 1 ---
			slot3(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 27-38, warpins: 2 ---
		slot0.InsertList(slot0._returnRequest, slot0, slot4.New(slot5, slot0))

		return
		--- END OF BLOCK #2 ---



	end):Start()

	return
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 29-29, warpins: 2 ---
	--- END OF BLOCK #3 ---



end

function slot0.ReturnSpine(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot0:ClearRequest(go(slot1))

	return
	--- END OF BLOCK #0 ---



end

function slot0.GetSprite(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot3:GetComponent(typeof(Image)).enabled = false

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-11, warpins: 1 ---
		slot2 = ""
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-37, warpins: 2 ---
	slot7 = nil

	slot0.InsertList(slot0._loadingRequest, slot6, slot0.New(slot1, slot2, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-15, warpins: 1 ---
		table.removebyvalue(slot0._loadingRequest[slot1], )

		if #slot0._loadingRequest[] == 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-20, warpins: 1 ---
			slot0._loadingRequest[] = nil
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 21-28, warpins: 2 ---
		slot3.enabled = true
		slot3.sprite = slot0

		if slot4 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 29-32, warpins: 1 ---
			slot3:SetNativeSize()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 33-33, warpins: 2 ---
		return
		--- END OF BLOCK #2 ---



	end))
	slot0.New(slot1, slot2, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-15, warpins: 1 ---
		table.removebyvalue(slot0._loadingRequest[slot1], )

		if #slot0._loadingRequest[] == 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-20, warpins: 1 ---
			slot0._loadingRequest[] = nil
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 21-28, warpins: 2 ---
		slot3.enabled = true
		slot3.sprite = slot0

		if slot4 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 29-32, warpins: 1 ---
			slot3.SetNativeSize()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 33-33, warpins: 2 ---
		return
		--- END OF BLOCK #2 ---



	end).Start(slot7)

	if not slot0._returnRequest["Atlas/" .. slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 38-47, warpins: 1 ---
		slot0.InsertList(slot0._returnRequest, "Atlas/" .. slot1, slot1:New())
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 48-49, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

function slot0.GetOffSpriteRequest(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0:ClearRequest(slot1)

	return
	--- END OF BLOCK #0 ---



end

function slot0.LoadPrefab(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-3, warpins: 1 ---
		slot2 = ""
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-22, warpins: 2 ---
	slot5 = nil

	slot0.InsertList(slot0._loadingRequest, slot1, slot0.New(slot1, slot2, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-15, warpins: 1 ---
		table.removebyvalue(slot0._loadingRequest[slot1], )

		if #slot0._loadingRequest[] == 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-20, warpins: 1 ---
			slot0._loadingRequest[] = nil
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 21-23, warpins: 2 ---
		if slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 24-26, warpins: 1 ---
			slot3(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 27-27, warpins: 2 ---
		return
		--- END OF BLOCK #2 ---



	end))
	slot0.New(slot1, slot2, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-15, warpins: 1 ---
		table.removebyvalue(slot0._loadingRequest[slot1], )

		if #slot0._loadingRequest[] == 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-20, warpins: 1 ---
			slot0._loadingRequest[] = nil
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 21-23, warpins: 2 ---
		if slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 24-26, warpins: 1 ---
			slot3(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 27-27, warpins: 2 ---
		return
		--- END OF BLOCK #2 ---



	end):Start()

	return
	--- END OF BLOCK #1 ---



end

function slot0.LoadSprite(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot3:GetComponent(typeof(Image)).enabled = false

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-11, warpins: 1 ---
		slot2 = ""
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-35, warpins: 2 ---
	slot7 = nil

	slot0.InsertList(slot0._loadingRequest, tf(slot3), slot0.New(slot1, slot2, typeof(Sprite), function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-15, warpins: 1 ---
		table.removebyvalue(slot0._loadingRequest[slot1], )

		if #slot0._loadingRequest[] == 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-20, warpins: 1 ---
			slot0._loadingRequest[] = nil
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 21-28, warpins: 2 ---
		slot3.enabled = true
		slot3.sprite = slot0

		if slot4 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 29-32, warpins: 1 ---
			slot3:SetNativeSize()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 33-33, warpins: 2 ---
		return
		--- END OF BLOCK #2 ---



	end))
	slot0.New(slot1, slot2, typeof(Sprite), function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-15, warpins: 1 ---
		table.removebyvalue(slot0._loadingRequest[slot1], )

		if #slot0._loadingRequest[] == 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-20, warpins: 1 ---
			slot0._loadingRequest[] = nil
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 21-28, warpins: 2 ---
		slot3.enabled = true
		slot3.sprite = slot0

		if slot4 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 29-32, warpins: 1 ---
			slot3.SetNativeSize()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 33-33, warpins: 2 ---
		return
		--- END OF BLOCK #2 ---



	end):Start()

	return
	--- END OF BLOCK #1 ---



end

function slot0.InsertList(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if not slot0[slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		slot3 = {}
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-11, warpins: 2 ---
	slot0[slot1] = slot3

	table.insert(slot0[slot1], slot2)

	return
	--- END OF BLOCK #1 ---



end

function slot0.ClearRequest(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0._loadingRequest[slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-9, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 10-14, warpins: 0 ---
		for slot5, slot6 in ipairs(slot0._loadingRequest[slot1]) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-12, warpins: 1 ---
			slot6:Stop()
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 13-14, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 15-17, warpins: 1 ---
		slot0._loadingRequest[slot1] = nil
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 18-21, warpins: 2 ---
	if slot0._returnRequest[slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 22-26, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 27-31, warpins: 0 ---
		for slot5, slot6 in ipairs(slot0._returnRequest[slot1]) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 27-29, warpins: 1 ---
			slot6:Start()
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 30-31, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 32-34, warpins: 1 ---
		slot0._returnRequest[slot1] = nil
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 35-35, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

function slot0.ClearRequests(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-15, warpins: 0 ---
	for slot4, slot5 in pairs(slot0._loadingRequest) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-8, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 9-13, warpins: 0 ---
		for slot9, slot10 in ipairs(slot5) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-11, warpins: 1 ---
			slot10:Stop()
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 12-13, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 14-15, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 16-23, warpins: 1 ---
	table.clear(slot0._loadingRequest)

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 24-34, warpins: 0 ---
	for slot4, slot5 in pairs(slot0._returnRequest) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 24-27, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 28-32, warpins: 0 ---
		for slot9, slot10 in ipairs(slot5) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 28-30, warpins: 1 ---
			slot10:Start()
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 31-32, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 33-34, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 35-39, warpins: 1 ---
	table.clear(slot0._returnRequest)

	return
	--- END OF BLOCK #4 ---



end

function slot0.Clear(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot0:ClearRequests()

	return
	--- END OF BLOCK #0 ---



end

return slot0
