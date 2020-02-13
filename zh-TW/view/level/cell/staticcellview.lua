slot0 = class("StaticCellView")
slot1 = import("view.util.RequestPackages.LoadPrefabRequestPackage")
slot2 = import("view.util.RequestPackages.LoadReferenceRequestPackage")
slot3 = import("view.util.RequestPackages.GetSpineRequestPackage")
slot4 = import("view.util.RequestPackages.GetPrefabRequestPackage")
slot5 = import("view.util.RequestPackages.ReturnPrefabRequestPackage")
slot6 = import("view.util.RequestPackages.ReturnSpineRequestPackage")

function slot0.Ctor(slot0, slot1)
	slot0.parent = slot1
	slot0.go = nil
	slot0.tf = nil
	slot0.info = nil
	slot0._loadingRequest = {}
	slot0._returnRequest = {}
end

function slot0.SetTpl(slot0, slot1)
	slot0._tpl = slot1
end

function slot0.UpdateGO(slot0)
	if slot0._tpl and slot0._currentTpl ~= slot1 then
		if not IsNil(slot0.go) then
			slot0:ClearRequests()
			Destroy(slot0.go)
		end

		slot0.go = Instantiate(slot1)

		setParent(slot0.go, slot0.parent)

		slot0.tf = slot0.go.transform
		slot0._currentTpl = slot1
	end
end

function slot0.UpdateGOAsync(slot0, slot1, slot2, slot3)
	if slot0._loadingRequest.main and slot4.name == slot3 then
		return
	elseif slot0._loadedMainName == slot3 then
		slot1()

		return
	end

	slot0:ClearRequests()
	slot0:LoadMain(slot2, slot3, function (slot0)
		slot0:DestroyGO()

		slot0.go = slot0

		setParent(slot0.go, slot0.parent)

		slot0.tf = slot0.go.transform
		slot0._loadedMainName = slot0

		slot0()
	end)
end

function slot0.LoadMain(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	slot2 = slot2 or ""
	slot0._loadingRequest.main = 
	-- Decompilation error in this vicinity:
	slot0.New(slot1, slot2 or "", function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-6, warpins: 1 ---
			slot0(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 7-11, warpins: 2 ---
		slot1._loadingRequest.main = nil

		return
		--- END OF BLOCK #1 ---



	end)


	-- Decompilation error in this vicinity:
	slot0.New(slot1, slot2 or "", function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-6, warpins: 1 ---
			slot0(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 7-11, warpins: 2 ---
		slot1._loadingRequest.main = nil

		return
		--- END OF BLOCK #1 ---



	end)()

	return

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #1 3-3, warpins: 1 ---
	slot2 = ""
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 4-15, warpins: 2 ---
	--- END OF BLOCK #2 ---



end

function slot0.GetPrefab(slot0, slot1, slot2, slot3)

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
	--- BLOCK #1 4-18, warpins: 2 ---
	slot0._loadingRequest[slot1 .. slot2] = 
	-- Decompilation error in this vicinity:
	slot0.New(slot1, slot2, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-6, warpins: 1 ---
			slot0(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 7-26, warpins: 2 ---
		slot1._loadingRequest[slot2 .. slot3] = nil
		slot1._loadingRequest._returnRequest[slot2 .. slot3 .. nil] = slot4.New(slot2 .. slot3 .. nil, slot4.New, slot0)

		return
		--- END OF BLOCK #1 ---



	end)


	-- Decompilation error in this vicinity:
	slot0.New(slot1, slot2, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-6, warpins: 1 ---
			slot0(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 7-26, warpins: 2 ---
		slot1._loadingRequest[slot2 .. slot3] = nil
		slot1._loadingRequest._returnRequest[slot2 .. slot3 .. nil] = slot4.New(slot2 .. slot3 .. nil, slot4.New, slot0)

		return
		--- END OF BLOCK #1 ---



	end)()

	return
	--- END OF BLOCK #1 ---



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
	--- BLOCK #2 11-24, warpins: 2 ---
	slot0._loadingRequest["spine/" .. slot1] = 
	-- Decompilation error in this vicinity:
	slot0.New(slot1, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-6, warpins: 1 ---
			slot0(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 7-25, warpins: 2 ---
		slot1._loadingRequest["spine/" .. ] = nil
		slot1._loadingRequest._returnRequest["spine/" .. ] = "spine/".New("spine/" .. , slot0)

		return
		--- END OF BLOCK #1 ---



	end)


	-- Decompilation error in this vicinity:
	slot0.New(slot1, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-6, warpins: 1 ---
			slot0(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 7-25, warpins: 2 ---
		slot1._loadingRequest["spine/" .. ] = nil
		slot1._loadingRequest._returnRequest["spine/" .. ] = "spine/".New("spine/" .. , slot0)

		return
		--- END OF BLOCK #1 ---



	end)()

	return
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 25-25, warpins: 2 ---
	--- END OF BLOCK #3 ---



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
	--- BLOCK #1 4-18, warpins: 2 ---
	slot0._loadingRequest[slot1 .. slot2] = 
	-- Decompilation error in this vicinity:
	slot0.New(slot1, slot2, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-6, warpins: 1 ---
			slot0(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 7-14, warpins: 2 ---
		slot1._loadingRequest[slot2 .. slot3] = nil

		return
		--- END OF BLOCK #1 ---



	end)


	-- Decompilation error in this vicinity:
	slot0.New(slot1, slot2, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-6, warpins: 1 ---
			slot0(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 7-14, warpins: 2 ---
		slot1._loadingRequest[slot2 .. slot3] = nil

		return
		--- END OF BLOCK #1 ---



	end)()

	return
	--- END OF BLOCK #1 ---



end

function slot0.LoadSprite(slot0, slot1, slot2, slot3, slot4, slot5)

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
	--- BLOCK #1 12-29, warpins: 2 ---
	slot0._loadingRequest[slot1 .. slot2] = 
	-- Decompilation error in this vicinity:
	slot0.New(slot1, slot2, typeof(Sprite), function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		slot0.enabled = true
		slot0.sprite = slot0

		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-12, warpins: 1 ---
			slot0:SetNativeSize()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 13-15, warpins: 2 ---
		if slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-18, warpins: 1 ---
			slot2(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 19-26, warpins: 2 ---
		slot3._loadingRequest[slot4 .. slot5] = nil

		return
		--- END OF BLOCK #2 ---



	end)


	-- Decompilation error in this vicinity:
	slot0.New(slot1, slot2, typeof(Sprite), function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		slot0.enabled = true
		slot0.sprite = slot0

		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-12, warpins: 1 ---
			slot0.SetNativeSize()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 13-15, warpins: 2 ---
		if slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-18, warpins: 1 ---
			slot2(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 19-26, warpins: 2 ---
		slot3._loadingRequest[slot4 .. slot5] = nil

		return
		--- END OF BLOCK #2 ---



	end)()

	return
	--- END OF BLOCK #1 ---



end

function slot0.SetActive(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	setActive(slot0.go, slot1)

	return
	--- END OF BLOCK #0 ---



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
	--- BLOCK #2 25-25, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



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
	--- BLOCK #4 23-27, warpins: 1 ---
	table.clear(slot0._returnRequest)

	return
	--- END OF BLOCK #4 ---



end

function slot0.DestroyGO(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot0:ClearRequests()

	if not IsNil(slot0.go) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-15, warpins: 1 ---
		Destroy(slot0.go)

		slot0.go = nil
		slot0.tf = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 16-16, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.Clear(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	slot0.parent = nil
	slot0._tpl = nil
	slot0._currentTpl = nil
	slot0.info = nil

	slot0:DestroyGO()
	slot0:ClearRequests()

	return
	--- END OF BLOCK #0 ---



end

return slot0
