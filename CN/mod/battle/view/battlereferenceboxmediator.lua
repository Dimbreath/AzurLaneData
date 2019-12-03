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

	if slot1 and not slot0._detailViewActive then
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
		for slot4, slot5 in pairs(slot0._sceneMediator:GetCharacterList()) do
			slot0._detailViewList[slot4] or slot0:createDetail(slot5:GetUnitData()):UpdatePos(slot5:GetReferenceVector())
			slot0._detailViewList[slot4] or slot0.createDetail(slot5.GetUnitData()):Update()
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
	slot2 = slot1.Data.unit

	if slot0._unitBoxActive then
		slot0._unitBoxList[slot2:GetUniqueID()] = slot0:createBox(slot2)
	end

	if slot0._detailViewActive then
		slot0:createDetail(slot2)
	end
end

function slot4.createBox(slot0, slot1)
	slot2 = nil

	(slot1:GetIFF() ~= 1 or slot0._sceneMediator:InstantiateCharacterComponent("Cube_friendly")) and slot0._sceneMediator:InstantiateCharacterComponent("Cube_foe").transform:SetParent(slot0._boxContainer.transform)

	(slot1.GetIFF() ~= 1 or slot0._sceneMediator.InstantiateCharacterComponent("Cube_friendly")) and slot0._sceneMediator.InstantiateCharacterComponent("Cube_foe").layer = LayerMask.NameToLayer("Default")
	(slot1.GetIFF() ~= 1 or slot0._sceneMediator.InstantiateCharacterComponent("Cube_friendly")) and slot0._sceneMediator.InstantiateCharacterComponent("Cube_foe").transform.localScale = Vector3(slot1:GetBoxSize() * 2.x, slot1.GetBoxSize() * 2.y, slot1.GetBoxSize() * 2.z)

	SetActive((slot1.GetIFF() ~= 1 or slot0._sceneMediator.InstantiateCharacterComponent("Cube_friendly")) and slot0._sceneMediator.InstantiateCharacterComponent("Cube_foe"), true)

	return (slot1.GetIFF() ~= 1 or slot0._sceneMediator.InstantiateCharacterComponent("Cube_friendly")) and slot0._sceneMediator.InstantiateCharacterComponent("Cube_foe")
end

function slot4.createExistBoxes(slot0)
	for slot4, slot5 in pairs(slot0._dataProxy:GetUnitList()) do
		slot0._unitBoxList[slot4] = slot0:createBox(slot5)
	end
end

function slot4.createDetail(slot0, slot1)
	slot2 = slot0.Battle.BattleUnitDetailView.New()

	slot2:ConfigSkin(slot0._sceneMediator:InstantiateCharacterComponent("CharacterDetailContainer/detailPanel"))
	slot2:SetUnit(slot1)

	slot0._detailViewList[slot1:GetUniqueID()] = slot2

	return slot2
end

function slot4.onRemoveUnit(slot0, slot1)
	if slot0._unitBoxActive then
		slot0:removeBox(slot1.Data.UID)
	end

	if slot0._detailViewActive then
		slot0:removeDetail(slot1.Data.UID)
	end
end

function slot4.removeBox(slot0, slot1)
	GameObject.Destroy(slot0._unitBoxList[slot1])

	slot0._unitBoxList[slot1] = nil
end

function slot4.removeDetail(slot0, slot1)
	slot0._detailViewList[slot1]:Dispose()

	slot0._detailViewList[slot1] = nil
end

function slot4.removeAllBoxes(slot0)
	for slot4, slot5 in pairs(slot0._dataProxy:GetUnitList()) do
		slot0:removeBox(slot4)
	end
end

function slot4.removeAllDetail(slot0)
	for slot4, slot5 in pairs(slot0._detailViewList) do
		slot0:removeDetail(slot4)
	end
end

function slot4.initBulletEvent(slot0)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.REMOVE_BULLET, slot0.onRemoveBullet)
end

function slot4.disInitBulletEvent(slot0)
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.REMOVE_BULLET)
end

function slot4.onRemoveBullet(slot0, slot1)
	slot0:removeBulletBox(slot1.Data.UID)
end

function slot4.removeBulletBox(slot0, slot1)
	GameObject.Destroy(slot0._bulletBoxList[slot1])

	slot0._bulletBoxList[slot1] = nil
end

function slot4.removeAllBulletBoxes(slot0)
	for slot4, slot5 in pairs(slot0._bulletBoxList) do
		slot0:removeBulletBox(slot4)
	end
end

function slot4.createBulletBox(slot0, slot1)
	slot2 = nil

	(slot1:GetIFF() ~= 1 or slot0._sceneMediator:InstantiateCharacterComponent("Cube_friendly")) and slot0._sceneMediator:InstantiateCharacterComponent("Cube_foe").transform:SetParent(slot0._boxContainer.transform)

	(slot1.GetIFF() ~= 1 or slot0._sceneMediator.InstantiateCharacterComponent("Cube_friendly")) and slot0._sceneMediator.InstantiateCharacterComponent("Cube_foe").layer = LayerMask.NameToLayer("Default")
	(slot1.GetIFF() ~= 1 or slot0._sceneMediator.InstantiateCharacterComponent("Cube_friendly")) and slot0._sceneMediator.InstantiateCharacterComponent("Cube_foe").transform.localScale = Vector3(slot1:GetBoxSize() * 2.x, slot1.GetBoxSize() * 2.y, slot1.GetBoxSize() * 2.z)

	SetActive((slot1.GetIFF() ~= 1 or slot0._sceneMediator.InstantiateCharacterComponent("Cube_friendly")) and slot0._sceneMediator.InstantiateCharacterComponent("Cube_foe"), true)

	slot0._bulletBoxList[slot1:GetUniqueID()] = (slot1.GetIFF() ~= 1 or slot0._sceneMediator.InstantiateCharacterComponent("Cube_friendly")) and slot0._sceneMediator.InstantiateCharacterComponent("Cube_foe")

	return (slot1.GetIFF() ~= 1 or slot0._sceneMediator.InstantiateCharacterComponent("Cube_friendly")) and slot0._sceneMediator.InstantiateCharacterComponent("Cube_foe")
end

function slot4.createWallBox(slot0, slot1)
	slot2 = slot0._sceneMediator:InstantiateCharacterComponent("Cube_friendly")

	slot2.transform:SetParent(slot0._boxContainer.transform)

	slot2.layer = LayerMask.NameToLayer("Default")
	slot2.transform.localScale = Vector3(slot1:GetBoxSize() * 2.x, slot1.GetBoxSize() * 2.y, slot1.GetBoxSize() * 2.z)

	SetActive(slot2, true)

	slot0._wallBoxList[slot1:GetUniqueID()] = slot2

	return slot2
end

function slot4.Dispose(slot0)
	slot0:disInitUnitEvent()

	for slot4, slot5 in pairs(slot0._unitBoxList) do
		GameObject.Destroy(slot5)
	end

	for slot4, slot5 in pairs(slot0._bulletBoxList) do
		GameObject.Destroy(slot5)
	end

	for slot4, slot5 in pairs(slot0._wallBoxList) do
		GameObject.Destroy(slot5)
	end

	slot0._unitBoxList = nil
	slot0._wallBoxList = nil
	slot0._bulletBoxList = nil

	slot0:removeAllDetail()

	slot0._detailViewList = nil

	GameObject.Destroy(slot0._boxContainer)
	slot0.super.Dispose(slot0)
end

return
