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
	slot0._insKeyDict = {}
	slot0._keyInsDict = {}
end

function slot0.GetPrefab(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	slot2 = slot2 or ""

	slot0:ClearRequest(slot4)

	slot5 = nil
	slot0._loadingRequest[slot4 or #slot0._loadingRequest + 1] = slot0.New(slot1, slot2 or "", function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-26, warpins: 1 ---
		slot0._loadingRequest[] = nil
		slot0._insKeyDict[slot0] = slot0._insKeyDict
		slot0._keyInsDict[] = slot0
		slot0._returnRequest[] = slot2.New(slot2.New, , slot0)

		if slot2.New then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 27-29, warpins: 1 ---
			slot5(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 30-30, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end)

	slot0.New(slot1, slot2 or "", function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-26, warpins: 1 ---
		slot0._loadingRequest[] = nil
		slot0._insKeyDict[slot0] = slot0._insKeyDict
		slot0._keyInsDict[] = slot0
		slot0._returnRequest[] = slot2.New(slot2.New, , slot0)

		if slot2.New then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 27-29, warpins: 1 ---
			slot5(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 30-30, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



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
	--- BLOCK #2 4-9, warpins: 2 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #3 10-12, warpins: 1 ---
	slot4 = #slot0._loadingRequest + 1
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 13-27, warpins: 2 ---
	--- END OF BLOCK #4 ---



end

function slot0.ReturnPrefab(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	slot0:ClearRequest(slot0._insKeyDict[go(slot1)])

	return
	--- END OF BLOCK #0 ---



end

function slot0.GetSpine(slot0, slot1, slot2, slot3)

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
	--- BLOCK #2 11-16, warpins: 2 ---
	slot0:ClearRequest(slot3)

	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-19, warpins: 1 ---
		slot3 = #slot0._loadingRequest + 1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 20-33, warpins: 2 ---
	slot4 = nil
	slot0._loadingRequest[slot3] = slot0.New(slot1, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-25, warpins: 1 ---
		slot0._loadingRequest[] = nil
		slot0._insKeyDict[slot0] = slot0._insKeyDict
		slot0._keyInsDict[] = slot0
		slot0._returnRequest[] = slot2.New(slot2.New, slot0)

		if slot2.New then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 26-28, warpins: 1 ---
			slot4(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 29-29, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end)

	slot0.New(slot1, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-25, warpins: 1 ---
		slot0._loadingRequest[] = nil
		slot0._insKeyDict[slot0] = slot0._insKeyDict
		slot0._keyInsDict[] = slot0
		slot0._returnRequest[] = slot2.New(slot2.New, slot0)

		if slot2.New then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 26-28, warpins: 1 ---
			slot4(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 29-29, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end):Start()

	return
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 34-34, warpins: 2 ---
	--- END OF BLOCK #4 ---



end

function slot0.ReturnSpine(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	slot0:ClearRequest(slot0._insKeyDict[go(slot1)])

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
	--- BLOCK #1 12-42, warpins: 2 ---
	slot0:ClearRequest(slot6)

	slot7 = nil
	slot0._loadingRequest[tf(slot3)] = slot0.New(slot1, slot2, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-13, warpins: 1 ---
		slot0._loadingRequest[] = nil
		slot0._loadingRequest.enabled = true
		slot2.sprite = slot0

		if nil then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-17, warpins: 1 ---
			slot2:SetNativeSize()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 18-18, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end)

	slot0.New(slot1, slot2, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-13, warpins: 1 ---
		slot0._loadingRequest[] = nil
		slot0._loadingRequest.enabled = true
		slot2.sprite = slot0

		if nil then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-17, warpins: 1 ---
			slot2.SetNativeSize()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 18-18, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end).Start(slot7)

	slot0._returnRequest["Atlas/" .. slot1] = slot1:New()

	return
	--- END OF BLOCK #1 ---



end

function slot0.GetOffSpriteRequest(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0:ClearRequest(slot1)

	return
	--- END OF BLOCK #0 ---



end

function slot0.LoadPrefab(slot0, slot1, slot2, slot3, slot4)

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
	--- BLOCK #1 4-9, warpins: 2 ---
	slot0:ClearRequest(slot4)

	if not slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-12, warpins: 1 ---
		slot4 = #slot0._loadingRequest + 1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 13-27, warpins: 2 ---
	slot5 = nil
	slot0._loadingRequest[slot4] = slot0.New(slot1, slot2, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		slot0._loadingRequest[] = nil

		if slot0._loadingRequest then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-11, warpins: 1 ---
			slot2(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 12-12, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end)

	slot0.New(slot1, slot2, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		slot0._loadingRequest[] = nil

		if slot0._loadingRequest then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-11, warpins: 1 ---
			slot2(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 12-12, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end):Start()

	return
	--- END OF BLOCK #2 ---



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
	--- BLOCK #1 12-36, warpins: 2 ---
	slot0:ClearRequest(slot6)

	slot7 = nil
	slot0._loadingRequest[tf(slot3)] = slot0.New(slot1, slot2, typeof(Sprite), function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-13, warpins: 1 ---
		slot0._loadingRequest[] = nil
		slot0._loadingRequest.enabled = true
		slot2.sprite = slot0

		if nil then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-17, warpins: 1 ---
			slot2:SetNativeSize()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 18-18, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end)

	slot0.New(slot1, slot2, typeof(Sprite), function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-13, warpins: 1 ---
		slot0._loadingRequest[] = nil
		slot0._loadingRequest.enabled = true
		slot2.sprite = slot0

		if nil then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-17, warpins: 1 ---
			slot2.SetNativeSize()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 18-18, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end):Start()

	return
	--- END OF BLOCK #1 ---



end

function slot0.ClearRequest(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0._loadingRequest[slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-12, warpins: 1 ---
		slot0._loadingRequest[slot1]:Stop()

		slot0._loadingRequest[slot1] = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 13-16, warpins: 2 ---
	if slot0._returnRequest[slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-24, warpins: 1 ---
		slot0._returnRequest[slot1]:Start()

		slot0._returnRequest[slot1] = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 25-28, warpins: 2 ---
	if slot0._keyInsDict[slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 29-36, warpins: 1 ---
		slot0._insKeyDict[slot0._keyInsDict[slot1]] = nil
		slot0._keyInsDict[slot1] = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 37-37, warpins: 2 ---
	return
	--- END OF BLOCK #3 ---



end

function slot0.ClearRequests(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-9, warpins: 0 ---
	for slot4, slot5 in pairs(slot0._loadingRequest) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-7, warpins: 1 ---
		slot5:Stop()
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-9, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 10-17, warpins: 1 ---
	table.clear(slot0._loadingRequest)

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 18-22, warpins: 0 ---
	for slot4, slot5 in pairs(slot0._returnRequest) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 18-20, warpins: 1 ---
		slot5:Start()
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 21-22, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 23-35, warpins: 1 ---
	table.clear(slot0._returnRequest)
	table.clear(slot0._insKeyDict)
	table.clear(slot0._keyInsDict)

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
