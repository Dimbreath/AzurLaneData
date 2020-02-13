ys = ys or {}
slot1 = ys.Battle.BattleEvent
slot2 = ys.Battle.BattleConst
slot3 = ys.Battle.BattleConfig
slot4 = class("BattleReferenceBoxMediator", ys.MVC.Mediator)
ys.Battle.BattleReferenceBoxMediator = slot4
slot4.__name = "BattleReferenceBoxMediator"

function slot4.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function slot4.Initialize(slot0)
	slot0.super.Initialize(slot0)

	slot0._dataProxy = slot0._state:GetProxyByName(slot1.Battle.BattleDataProxy.__name)
	slot0._sceneMediator = slot0._state:GetSceneMediator()
	slot0._boxContainer = GameObject("BoxContainer")
	slot0._detailContainer = slot0._state:GetUI():findGO("CharacterDetailContainer")
	slot0._unitBoxList = {}
	slot0._bulletBoxList = {}
	slot0._wallBoxList = {}
	slot0._detailViewList = {}
	slot0._unitBoxActive = false
	slot0._bulletBoxActive = false
	slot0._detailViewActive = false

	slot0:initUnitEvent()
end

function slot4.ActiveUnitBoxes(slot0, slot1)
	if slot1 and not slot0._unitBoxActive then
		slot0._unitBoxActive = true

		slot0:createExistBoxes()
	elseif not slot1 and slot0._unitBoxActive then
		slot0._unitBoxActive = false

		slot0:removeAllBoxes()
	end
end

function slot4.ActiveBulletBoxes(slot0, slot1)
	if slot1 and not slot0._bulletBoxActive then
		slot0:initBulletEvent()

		slot0._bulletBoxActive = true
	elseif not slot1 and slot0._bulletBoxActive then
		slot0:disInitBulletEvent()
		slot0:removeAllBulletBoxes()

		slot0._bulletBoxActive = false
	end
end

function slot4.ActiveUnitDetail(slot0, slot1)
	SetActive(slot0._detailContainer, slot1)

	slot0._state:GetUI()._tf:GetComponent(typeof(RectMask2D)).enabled = not slot1

	if slot1 and not slot0._detailViewActive then
		for slot5, slot6 in ipairs(slot0._dataProxy:GetFleetList()) do
			for slot11, slot12 in ipairs(slot7) do
				slot0:createDetail(slot12)
			end
		end

		slot0._detailViewActive = true
	elseif not slot1 and slot0._detailViewActive then
		slot0._detailViewActive = false

		slot0:removeAllDetail()
	end
end

function slot4.Update(slot0)
	for slot4, slot5 in pairs(slot0._dataProxy:GetUnitList()) do
		if slot0._unitBoxList[slot4] then
			slot6.transform.localPosition = slot5:GetPosition() + slot5._cldComponent:GetCenterOffset()
		end
	end

	if slot0._bulletBoxActive then
		for slot4, slot5 in pairs(slot0._dataProxy:GetBulletList()) do
			slot0._bulletBoxList[slot4] or slot0:createBulletBox(slot5).transform.localPosition = slot5:GetPosition() + slot5._cldComponent:GetCenterOffset()
		end

		for slot4, slot5 in pairs(slot0._dataProxy:GetWallList()) do
			slot0._wallBoxList[slot4] or slot0:createWallBox(slot5).transform.localPosition = slot5:GetPosition() + slot5._cldComponent:GetCenterOffset()
		end
	end

	if slot0._detailViewActive then
		for slot4, slot5 in pairs(slot0._detailViewList) do
			slot5:Update()
		end
	end
end

function slot4.initUnitEvent(slot0)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.ADD_UNIT, slot0.onAddUnit)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.REMOVE_UNIT, slot0.onRemoveUnit)
end

function slot4.disInitUnitEvent(slot0)
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.ADD_UNIT)
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.REMOVE_UNIT)
end

function slot4.onAddUnit(slot0, slot1)
	slot2 = slot1.Data.type

	if slot0._unitBoxActive then
		slot0._unitBoxList[unit:GetUniqueID()] = slot0:createBox(unit)
	end

	if slot0._detailViewActive and slot2 == slot0.UnitType.PLAYER_UNIT then
		slot0:createDetail(unit)
	end
end

function slot4.createBox(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot2 = nil
	slot2 = (slot1:GetIFF() ~= 1 or slot0._sceneMediator:InstantiateCharacterComponent("Cube_friendly")) and slot0._sceneMediator:InstantiateCharacterComponent("Cube_foe")

	(slot1.GetIFF() ~= 1 or slot0._sceneMediator.InstantiateCharacterComponent("Cube_friendly")) and slot0._sceneMediator.InstantiateCharacterComponent("Cube_foe").transform:SetParent(slot0._boxContainer.transform)

	slot2.layer = LayerMask.NameToLayer("Default")
	slot2.transform.localScale = Vector3(slot1:GetBoxSize() * 2.x, slot1.GetBoxSize() * 2.y, slot1.GetBoxSize() * 2.z)

	SetActive(slot2, true)

	return slot2

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-13, warpins: 1 ---
	slot2 = slot0._sceneMediator.InstantiateCharacterComponent("Cube_friendly")

	if slot0._sceneMediator.InstantiateCharacterComponent("Cube_friendly") then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-19, warpins: 1 ---
		slot2 = slot0._sceneMediator.InstantiateCharacterComponent("Cube_foe")
		--- END OF BLOCK #0 ---



	end
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 20-46, warpins: 2 ---
	--- END OF BLOCK #2 ---



end

function slot4.createExistBoxes(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-15, warpins: 0 ---
	for slot4, slot5 in pairs(slot0._dataProxy:GetUnitList()) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-13, warpins: 1 ---
		slot0._unitBoxList[slot4] = slot0:createBox(slot5)
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

function slot4.createDetail(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-45, warpins: 1 ---
	slot2 = slot0.Battle.BattleUnitDetailView.New()
	slot3 = slot1:GetIFF()

	slot0._sceneMediator:InstantiateCharacterComponent("CharacterDetailContainer/detailPanel").transform:SetParent(slot4, true)
	slot2:ConfigSkin(slot5)
	slot2:SetUnit(slot1)

	slot0._detailViewList[slot1:GetUniqueID()] = slot2

	return slot2
	--- END OF BLOCK #0 ---



end

function slot4.onRemoveUnit(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot2 = slot1.Data.type

	if slot0._unitBoxActive then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-10, warpins: 1 ---
		slot0:removeBox(slot1.Data.UID)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-13, warpins: 2 ---
	if slot0._detailViewActive and slot2 == slot0.UnitType.PLAYER_UNIT then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-23, warpins: 1 ---
		slot0:removeDetail(slot1.Data.UID)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 24-24, warpins: 3 ---
	return
	--- END OF BLOCK #2 ---



end

function slot4.removeBox(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	GameObject.Destroy(slot0._unitBoxList[slot1])

	slot0._unitBoxList[slot1] = nil

	return
	--- END OF BLOCK #0 ---



end

function slot4.removeDetail(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	slot0._detailViewList[slot1]:Dispose()

	slot0._detailViewList[slot1] = nil

	return
	--- END OF BLOCK #0 ---



end

function slot4.removeAllBoxes(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-13, warpins: 0 ---
	for slot4, slot5 in pairs(slot0._dataProxy:GetUnitList()) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-11, warpins: 1 ---
		slot0:removeBox(slot4)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 12-13, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 14-14, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

function slot4.removeAllDetail(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-10, warpins: 0 ---
	for slot4, slot5 in pairs(slot0._detailViewList) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-8, warpins: 1 ---
		slot0:removeDetail(slot4)
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

function slot4.initBulletEvent(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	slot0._dataProxy:RegisterEventListener(slot0, slot0.REMOVE_BULLET, slot0.onRemoveBullet)

	return
	--- END OF BLOCK #0 ---



end

function slot4.disInitBulletEvent(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.REMOVE_BULLET)

	return
	--- END OF BLOCK #0 ---



end

function slot4.onRemoveBullet(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot0:removeBulletBox(slot1.Data.UID)

	return
	--- END OF BLOCK #0 ---



end

function slot4.removeBulletBox(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	GameObject.Destroy(slot0._bulletBoxList[slot1])

	slot0._bulletBoxList[slot1] = nil

	return
	--- END OF BLOCK #0 ---



end

function slot4.removeAllBulletBoxes(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-10, warpins: 0 ---
	for slot4, slot5 in pairs(slot0._bulletBoxList) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-8, warpins: 1 ---
		slot0:removeBulletBox(slot4)
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

function slot4.createBulletBox(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot2 = nil

	if slot1:GetIFF() == 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-13, warpins: 1 ---
		slot2 = slot0._sceneMediator:InstantiateCharacterComponent("Cube_friendly")
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-19, warpins: 1 ---
		slot2 = slot0._sceneMediator:InstantiateCharacterComponent("Cube_foe")
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 20-51, warpins: 2 ---
	slot2.transform:SetParent(slot0._boxContainer.transform)

	slot2.layer = LayerMask.NameToLayer("Default")
	slot2.transform.localScale = Vector3(slot1:GetBoxSize() * 2.x, slot1.GetBoxSize() * 2.y, slot1.GetBoxSize() * 2.z)

	SetActive(slot2, true)

	slot0._bulletBoxList[slot1:GetUniqueID()] = slot2

	return slot2
	--- END OF BLOCK #1 ---



end

function slot4.createWallBox(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-37, warpins: 1 ---
	slot2 = slot0._sceneMediator:InstantiateCharacterComponent("Cube_friendly")

	slot2.transform:SetParent(slot0._boxContainer.transform)

	slot2.layer = LayerMask.NameToLayer("Default")
	slot2.transform.localScale = Vector3(slot1:GetBoxSize() * 2.x, slot1.GetBoxSize() * 2.y, slot1.GetBoxSize() * 2.z)

	SetActive(slot2, true)

	slot0._wallBoxList[slot1:GetUniqueID()] = slot2

	return slot2
	--- END OF BLOCK #0 ---



end

function slot4.Dispose(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot0:disInitUnitEvent()

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-13, warpins: 0 ---
	for slot4, slot5 in pairs(slot0._unitBoxList) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-11, warpins: 1 ---
		GameObject.Destroy(slot5)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 12-13, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 14-17, warpins: 1 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 18-23, warpins: 0 ---
	for slot4, slot5 in pairs(slot0._bulletBoxList) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 18-21, warpins: 1 ---
		GameObject.Destroy(slot5)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 22-23, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 24-27, warpins: 1 ---
	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 28-33, warpins: 0 ---
	for slot4, slot5 in pairs(slot0._wallBoxList) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 28-31, warpins: 1 ---
		GameObject.Destroy(slot5)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 32-33, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 34-54, warpins: 1 ---
	slot0._unitBoxList = nil
	slot0._wallBoxList = nil
	slot0._bulletBoxList = nil

	slot0:removeAllDetail()

	slot0._detailViewList = nil

	GameObject.Destroy(slot0._boxContainer)
	slot0.super.Dispose(slot0)

	return
	--- END OF BLOCK #6 ---



end

return
