slot0 = class("SpineCellView")
slot1 = import("view.util.RequestPackages.LoadPrefabRequestPackage")

function slot0.Ctor(slot0, slot1)
	slot0.go = slot1
	slot0.tf = slot0.go.transform
	slot0.tfShip = slot0.tf:Find("ship")
	slot0.validate = true
	slot0._attachmentList = {}
	slot0._extraEffect = nil
	slot0._loadingRequest = {}
end

function slot0.getOrder(slot0)
	return 0
end

function slot0.getLine(slot0)
	return slot0.line
end

function slot0.setLine(slot0, slot1)
	slot0.line = {
		row = slot1.row,
		column = slot1.column
	}
end

function slot0.getPrefab(slot0)
	return slot0.prefab
end

function slot0.setPrefab(slot0, slot1)
	slot0.prefab = slot1
end

function slot0.getAction(slot0)
	return slot0.action
end

function slot0.setAction(slot0, slot1)
	slot0.action = slot1

	if slot0.anim then
		slot0.anim:SetAction(slot1, 0)
	end
end

function slot0.getModel(slot0)
	return slot0.model
end

function slot0.setModel(slot0, slot1)
	slot1.transform.name = "model"
	slot1.transform.GetComponent(slot2, "SkeletonGraphic").raycastTarget = false

	slot1.transform.SetParent(slot2, slot0.tfShip, false)

	slot1.transform.localPosition = Vector3.zero
	slot1.transform.localScale = Vector3(0.4, 0.4, 1)

	pg.ViewUtils.SetLayer(slot2, Layer.UI)

	slot0.model = slot1
	slot0.anim = slot1.transform.GetComponent(slot2, "SpineAnimUI")

	slot0:setAction(slot0:getAction())
end

function slot0.setAttachment(slot0, slot1)
	slot0._attachmentInfo = slot1
end

function slot0.SetExtraEffect(slot0, slot1)
	slot0._extraEffect = slot1
end

function slot0.loadSpine(slot0, slot1)
	if slot0.lastPrefab == slot0:getPrefab() then
		if not IsNil(slot0.model) and slot1 then
			slot1()
		end

		return
	end

	slot0:unloadSpine()

	function slot3()
		if slot0._attachmentInfo then
			for slot3, slot4 in pairs(slot0._attachmentInfo) do
				if slot4.attachment_combat_ui[1] ~= "" then
					slot0._loadingRequest["Effect/" .. slot5] = 
					-- Decompilation error in this vicinity:
					slot1.New(slot6, slot5, function (slot0)
						slot0._attachmentList[] = slot0

						tf(slot0):SetParent(tf(slot0.model))

						tf(slot0).localPosition = BuildVector3(slot2.attachment_combat_ui[2])
						slot0._loadingRequest[] = nil
					end)


					-- Decompilation error in this vicinity:
					slot1.New(slot6, slot5, function (slot0)
						slot0._attachmentList[] = slot0

						tf(slot0).SetParent(tf(slot0.model))

						tf(slot0).localPosition = BuildVector3(slot2.attachment_combat_ui[2])
						slot0._loadingRequest[] = nil
					end)()
				end
			end
		end

		if slot0._extraEffect and #slot0._extraEffect > 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 42-58, warpins: 1 ---
			slot0._loadingRequest["effect/" .. slot0] = 
			-- Decompilation error in this vicinity:
			slot1:New(slot0._extraEffect, function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-20, warpins: 1 ---
				slot0._attachmentList[] = slot0

				tf(slot0):SetParent(tf(slot0.model))

				slot0._loadingRequest[] = nil

				return
				--- END OF BLOCK #0 ---



			end)


			-- Decompilation error in this vicinity:
			slot1.New(slot0._extraEffect, function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-20, warpins: 1 ---
				slot0._attachmentList[] = slot0

				tf(slot0).SetParent(tf(slot0.model))

				slot0._loadingRequest[] = nil

				return
				--- END OF BLOCK #0 ---



			end)()
			--- END OF BLOCK #0 ---



		end
	end

	PoolMgr.GetInstance():GetSpineChar(slot0:getPrefab(), true, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		if slot0 ~= slot1:getPrefab() or not slot1.validate then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 12-20, warpins: 2 ---
			PoolMgr.GetInstance():ReturnSpineChar(slot0, slot0)

			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 21-28, warpins: 2 ---
		slot1:setModel(slot0)

		if slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 29-30, warpins: 1 ---
			slot2()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 31-37, warpins: 2 ---
		slot3()
		slot3:OnLoadSpine()

		return
		--- END OF BLOCK #2 ---



	end)

	slot0.lastPrefab = slot0.getPrefab()
end

function slot0.OnLoadSpine(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-1, warpins: 1 ---
	return
	--- END OF BLOCK #0 ---



end

function slot0.unloadSpine(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.prefab and slot0.model then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-32, warpins: 1 ---
		slot0:SetSpineVisible(true)
		slot0:setAction(ChapterConst.ShipIdleAction)
		slot0:ClearAttachments()
		PoolMgr.GetInstance():ReturnSpineChar(slot0.prefab, slot0.model)

		slot0.model = nil
		slot0._attachmentInfo = nil
		slot0._extraEffect = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 33-36, warpins: 3 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 37-41, warpins: 0 ---
	for slot4, slot5 in pairs(slot0._loadingRequest) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 37-39, warpins: 1 ---
		slot5:Stop()
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 40-41, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 42-46, warpins: 1 ---
	table.clear(slot0._loadingRequest)

	return
	--- END OF BLOCK #3 ---



end

function slot0.ClearAttachments(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-9, warpins: 0 ---
	for slot4, slot5 in pairs(slot0._attachmentList) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-7, warpins: 1 ---
		Destroy(slot5)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-9, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 10-14, warpins: 1 ---
	table.clear(slot0._attachmentList)

	return
	--- END OF BLOCK #2 ---



end

function slot0.SetSpineVisible(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if not slot0.model then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-15, warpins: 2 ---
	slot2:GetComponent("SkeletonGraphic").color = Color.New(1, 1, 1, (slot1 and 1) or 0)

	return
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 19-21, warpins: 2 ---
	--- END OF BLOCK #2 ---



end

function slot0.clear(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot0:unloadSpine()

	slot0.prefab = nil
	slot0.anim = nil
	slot0.validate = nil

	return
	--- END OF BLOCK #0 ---



end

return slot0
