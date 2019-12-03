ys = ys or {}
slot1 = ys.Battle.BattleEvent
slot2 = ys.Battle.BattleConst
slot3 = ys.Battle.BattleConfig
slot4 = ys.Battle.BattleVariable
slot5 = class("BattleSceneMediator", ys.MVC.Mediator)
ys.Battle.BattleSceneMediator = slot5
slot5.__name = "BattleSceneMediator"
slot6 = Vector3(0, 0.8, 0)

slot5.Ctor = function (slot0)
	slot0.super.Ctor(slot0)

	slot0.FlagShipUIPos = Vector3.zero
end

slot5.Initialize = function (slot0)
	slot0.super.Initialize(slot0)

	slot0._dataProxy = slot0._state:GetProxyByName(slot1.Battle.BattleDataProxy.__name)

	slot0:InitCharacterFactory()
	slot0:Init()
	slot0:AddEvent()
end

slot5.Init = function (slot0)
	slot0:InitPopNumPool()

	slot0._characterList = {}
	slot0._bulletList = {}
	slot0._aircraftList = {}
	slot0._areaList = {}
	slot0._shelterList = {}
	slot0._bulletContainer = GameObject.Find("BulletContainer")
	slot0._fxPool = slot0.Battle.BattleFXPool.GetInstance()

	slot0.Battle.BattleCharacterFXContainersPool.GetInstance():Init()
	slot0:InitPlayerAntiAirArea()
	slot0:InitPlayerAntiSubArea()
	slot0:InitFlagShipMark()
end

slot5.InitCamera = function (slot0)
	slot0._cameraUtil = slot0.Battle.BattleCameraUtil.GetInstance()

	slot0._cameraUtil:RegisterEventListener(slot0, slot1.CAMERA_FOCUS_RESET, slot0.onCameraFocusReset)
	slot0._cameraUtil:RegisterEventListener(slot0, slot1.BULLET_TIME, slot0.onBulletTime)
end

slot5.InitPopNumPool = function (slot0)
	slot0._popNumPool = slot0.Battle.BattlePopNumManager.GetInstance()

	slot0._popNumPool:InitialPoolRoot(slot0._state:GetUI():findTF(slot0.Battle.BattlePopNumManager.CONTAINER_HP))
end

slot5.InitPopScorePool = function (slot0)
	slot0._popNumPool = slot0.Battle.BattlePopNumManager.GetInstance()

	slot0._popNumPool:InitialScorePoolRoot(slot0._state:GetUI():findTF(slot0.Battle.BattlePopNumManager.CONTAINER_SCORE))
end

slot5.InitFlagShipMark = function (slot0)
	slot1 = slot0._state:GetUI():findGO("flagShipMark")

	slot1:SetActive(true)

	slot0._goFlagShipMarkTf = slot1.transform
end

slot5.InitCharacterFactory = function (slot0)
	slot1 = slot0._state:GetUI()

	slot0.Battle.BattleHPBarManager.GetInstance():InitialPoolRoot(slot1:findTF(slot0.Battle.BattleHPBarManager.ROOT_NAME))
	slot0.Battle.BattleArrowManager.GetInstance():Init(slot1:findTF(slot0.Battle.BattleArrowManager.ROOT_NAME))

	slot0._characterFactoryList = {
		[slot1.UnitType.PLAYER_UNIT] = slot0.Battle.BattlePlayerCharacterFactory.GetInstance(),
		[slot1.UnitType.ENEMY_UNIT] = slot0.Battle.BattleEnemyCharacterFactory.GetInstance(),
		[slot1.UnitType.BOSS_UNIT] = slot0.Battle.BattleBossCharacterFactory.GetInstance(),
		[slot1.UnitType.NPC_UNIT] = slot0.Battle.BattleNPCCharacterFactory.GetInstance(),
		[slot1.UnitType.AIRCRAFT_UNIT] = slot0.Battle.BattleAircraftCharacterFactory.GetInstance(),
		[slot1.UnitType.AIRFIGHTER_UNIT] = slot0.Battle.BattleAirFighterCharacterFactory.GetInstance(),
		[slot1.UnitType.SUB_UNIT] = slot0.Battle.BattleSubCharacterFactory.GetInstance()
	}
end

slot5.InitPlayerAntiAirArea = function (slot0)
	slot0._antiAirArea = slot0._fxPool:GetFX("AntiAirArea")
	slot0._antiAirAreaTF = slot0._antiAirArea.transform

	slot0._antiAirArea:SetActive(false)
end

slot5.InitPlayerAntiSubArea = function (slot0)
	slot0._anitSubArea = slot0._fxPool:GetFX("AntiSubArea")
	slot0._anitSubAreaTF = slot0._anitSubArea.transform

	slot0._anitSubArea:SetActive(false)

	slot0._antiSubScanAnima = slot0._anitSubAreaTF:Find("Quad"):GetComponent(typeof(Animator))
	slot0._anitSubAreaTFList = {
		[slot0._anitSubAreaTF] = true
	}
end

slot5.AddEvent = function (slot0)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.STAGE_DATA_INIT_FINISH, slot0.onStageInitFinish)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.ADD_UNIT, slot0.onAddUnit)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.REMOVE_UNIT, slot0.onRemoveUnit)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.REMOVE_BULLET, slot0.onRemoveBullet)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.REMOVE_AIR_CRAFT, slot0.onRemoveAircraft)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.REMOVE_AIR_FIGHTER, slot0.onRemoveAirFighter)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.ADD_AREA, slot0.onAddArea)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.REMOVE_AREA, slot0.onRemoveArea)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.ADD_SHELTER, slot0.onAddShelter)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.REMOVE_SHELTER, slot0.onRemoveShleter)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.ANTI_AIR_AREA, slot0.onAntiAirArea)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.UPDATE_HOSTILE_SUBMARINE, slot0.onUpdateHostileSubmarine)
end

slot5.RemoveEvent = function (slot0)
	slot0._leftFleet:UnregisterEventListener(slot0, slot0.SONAR_SCAN)
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.STAGE_DATA_INIT_FINISH)
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.ADD_UNIT)
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.REMOVE_UNIT)
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.REMOVE_BULLET)
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.REMOVE_AIR_CRAFT)
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.REMOVE_AIR_FIGHTER)
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.ADD_AREA)
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.REMOVE_AREA)
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.ADD_SHELTER)
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.REMOVE_SHELTER)
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.ANTI_AIR_AREA)
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.UPDATE_HOSTILE_SUBMARINE)
	slot0._cameraUtil:UnregisterEventListener(slot0, slot0.CAMERA_FOCUS_RESET)
	slot0._cameraUtil:UnregisterEventListener(slot0, slot0.BULLET_TIME)
end

slot5.onStageInitFinish = function (slot0, slot1)
	slot0._leftFleet = slot0._dataProxy:GetFleetByIFF(slot0.Battle.BattleConfig.FRIENDLY_CODE)
	slot0._leftFleetMotion = slot0._leftFleet:GetMotion()

	slot0:InitCamera()
	slot0._leftFleet:RegisterEventListener(slot0, slot1.SONAR_SCAN, slot0.onSonarScan)
end

slot5.onAddUnit = function (slot0, slot1)
	slot0._characterFactoryList[slot1.Data.type]:CreateCharacter(slot1.Data)
end

slot5.onRemoveUnit = function (slot0, slot1)
	slot3 = slot1.Data.deadReason

	if slot0._characterList[slot1.Data.UID] then
		slot4:GetFactory():RemoveCharacter(slot4, slot3)

		slot0._characterList[slot2] = nil
	end
end

slot5.onRemoveAircraft = function (slot0, slot1)
	if slot0._aircraftList[slot1.Data.UID] then
		slot3:GetFactory():RemoveCharacter(slot3)

		slot0._aircraftList[slot2] = nil
	end
end

slot5.onRemoveAirFighter = function (slot0, slot1)
	if slot0._aircraftList[slot1.Data.UID] then
		slot3:GetFactory():RemoveCharacter(slot3)

		slot0._aircraftList[slot2] = nil
	end
end

slot5.onRemoveBullet = function (slot0, slot1)
	slot0:RemoveBullet(slot1.Data.UID)
end

slot5.onAddArea = function (slot0, slot1)
	slot0:AddArea(slot1.Data.area, slot1.Data.FXID, slot1.Data.isStatic)
end

slot5.onRemoveArea = function (slot0, slot1)
	slot0:RemoveArea(slot1.Data.id)
end

slot5.onAddShelter = function (slot0, slot1)
	slot8, slot11 = slot0._fxPool:GetFX(slot1.Data.shelter.GetFXID(slot2))

	pg.EffectMgr.GetInstance():PlayBattleEffect(slot3, slot1.Data.shelter.GetPosition(slot2).Add(slot5, slot4), true)

	if slot1.Data.shelter.GetIFF(slot2) == slot0.FOE_CODE then
		slot3.transform.localEulerAngles.y = 180
		slot3.transform.localEulerAngles = slot3.transform.localEulerAngles
	end

	slot0._shelterList[slot2:GetUniqueID()] = slot3
end

slot5.onRemoveShleter = function (slot0, slot1)
	if slot0._shelterList[slot1.Data.uid] then
		slot0.Battle.BattleResourceManager.GetInstance():DestroyOb(slot3)

		slot0._shelterList[slot2] = nil
	end
end

slot5.onAntiAirArea = function (slot0, slot1)
	if slot1.Data.isShow ~= nil then
		slot0._antiAirArea.gameObject:SetActive(slot1.Data.isShow)

		if slot2 == true then
			slot0._antiAirAreaTF.localScale = Vector3(slot0._leftFleet:GetFleetAntiAirWeapon():GetRange() * 2, 0, slot0._leftFleet.GetFleetAntiAirWeapon().GetRange() * 2)
		end
	end
end

slot5.onAntiAirOverload = function (slot0, slot1)
	slot0._antiAirAreaTF:Find("Quad"):GetComponent(typeof(Animator)).enabled = not slot1.Dispatcher:IsOverLoad()
end

slot5.onUpdateHostileSubmarine = function (slot0, slot1)
	slot0:updateSonarView(slot1.Data.count > 0)
end

slot5.updateSonarView = function (slot0, slot1)
	slot0._sonarActive = slot1

	for slot5, slot6 in pairs(slot0._characterList) do
		slot6:SonarAcitve(slot1)
	end

	slot0._anitSubArea.gameObject:SetActive(slot1)

	if slot1 then
		slot0._anitSubAreaTF.localScale = Vector3(slot0._leftFleet:GetFleetSonar():GetRange() * 2, 0, slot0._leftFleet.GetFleetSonar().GetRange() * 2)
	end
end

slot5.onSonarScan = function (slot0, slot1)
	if slot1.Data.indieSonar then
		slot0._fxPool:GetFX("AntiSubArea").transform.localScale = Vector3(100, 0, 100)

		SetActive(slot0._fxPool.GetFX("AntiSubArea").transform.Find(slot4, "static"), false)

		slot5 = slot0._fxPool.GetFX("AntiSubArea").transform.Find(slot4, "Quad")
		slot6 = slot5:GetComponent(typeof(Animator))
		slot6.enabled = true

		slot6:Play("antiSubZoom", -1, 0)

		slot0._anitSubAreaTFList[slot0._fxPool.GetFX("AntiSubArea").transform] = true

		slot5:GetComponent("DftAniEvent"):SetEndEvent(function (slot0)
			slot0._anitSubAreaTFList[] = nil
		end)

		return
	end

	if slot0._antiSubScanAnima and slot0._sonarActive then
		slot0._antiSubScanAnima.enabled = true

		slot0._antiSubScanAnima:Play("antiSubZoom", -1, 0)
	end
end

slot5.onCameraFocusReset = function (slot0, slot1)
	slot0:ResetFocus()
end

slot5.Update = function (slot0)
	for slot4, slot5 in pairs(slot0._characterList) do
		slot5:Update()
	end

	for slot4, slot5 in pairs(slot0._aircraftList) do
		slot5:Update()
	end

	for slot4, slot5 in pairs(slot0._bulletList) do
		slot5:Update()
	end

	for slot4, slot5 in pairs(slot0._areaList) do
		slot5:Update()
	end

	slot0._popNumPool:Update()
	slot0:UpdateAntiAirArea()
	slot0:UpdateFlagShipMark()
end

slot5.UpdatePause = function (slot0)
	for slot4, slot5 in pairs(slot0._characterList) do
		slot5:UpdateUIComponentPosition()
		slot5:UpdateHPBarPostition()
	end

	for slot4, slot5 in pairs(slot0._aircraftList) do
		slot5:UpdateUIComponentPosition()

		if slot5:GetUnitData():GetUniqueID() == slot0.FOE_CODE then
			slot5:UpdateHPBarPostition()
		end
	end

	slot0:UpdateFlagShipMark()
end

slot5.UpdateEscapeOnly = function (slot0, slot1)
	for slot5, slot6 in pairs(slot0._characterList) do
		if slot6.__name == slot0.Battle.BattleEnemyCharacter.__name or slot6.__name == slot0.Battle.BattleBossCharacter.__name then
			slot6:Update(slot1)
		end
	end
end

slot5.Pause = function (slot0)
	for slot4, slot5 in pairs(slot0._areaList) do
		for slot10 = 0, slot5._go:GetComponentsInChildren(typeof(ParticleSystem)).Length - 1, 1 do
			slot6[slot10]:Pause()
		end
	end
end

slot5.Resume = function (slot0)
	for slot4, slot5 in pairs(slot0._areaList) do
		for slot10 = 0, slot5._go:GetComponentsInChildren(typeof(ParticleSystem)).Length - 1, 1 do
			slot6[slot10]:Play()
		end
	end
end

slot5.onBulletTime = function (slot0, slot1)
	slot3 = slot1.Data.key

	if slot1.Data.speed then
		slot5 = slot2.exemptUnit:GetUniqueID()

		slot0.AppendIFFFactor(slot1.FOE_CODE, slot3, slot4)
		slot0.AppendIFFFactor(slot1.FRIENDLY_CODE, slot3, slot4)

		for slot9, slot10 in pairs(slot0._characterList) do
			if slot9 == slot5 then
				slot10:SetAnimaSpeed(1 / slot4)

				break
			end
		end
	else
		slot0.RemoveIFFFactor(slot1.FOE_CODE, slot3)
		slot0.RemoveIFFFactor(slot1.FRIENDLY_CODE, slot3)

		for slot8, slot9 in pairs(slot0._characterList) do
			slot9:SetAnimaSpeed(1)
		end
	end
end

slot5.ResetFocus = function (slot0)
	slot0.RemoveIFFFactor(slot1.FOE_CODE, slot1.SPEED_FACTOR_FOCUS_CHARACTER)
	slot0.RemoveIFFFactor(slot1.FRIENDLY_CODE, slot1.SPEED_FACTOR_FOCUS_CHARACTER)

	for slot4, slot5 in pairs(slot0._characterList) do
		slot5:SetAnimaSpeed(1)
	end

	slot0._cameraUtil:ZoomCamara(nil, nil, slot1.CAM_RESET_DURATION)
end

slot5.UpdateFlagShipMark = function (slot0)
	slot0._goFlagShipMarkTf.position = slot0.CameraPosToUICamera(slot1):Add(slot0.FlagShipUIPos:Copy(slot0._leftFleetMotion:GetPos()))
end

slot5.UpdateAntiAirArea = function (slot0)
	slot0._antiAirAreaTF.position = slot0._leftFleetMotion:GetPos()

	for slot4, slot5 in pairs(slot0._anitSubAreaTFList) do
		slot4.position = slot0._leftFleetMotion:GetPos()
	end
end

slot5.AddBullet = function (slot0, slot1)
	slot0._bulletList[slot1:GetBulletData():GetUniqueID()] = slot1
end

slot5.RemoveBullet = function (slot0, slot1)
	if slot0._bulletList[slot1] then
		slot2:GetFactory():RemoveBullet(slot2)
	end

	slot0._bulletList[slot1] = nil
end

slot5.GetBulletRoot = function (slot0)
	return slot0._bulletContainer
end

slot5.EnablePopContainer = function (slot0, slot1, slot2)
	setActive(slot0._state:GetUI():findTF(slot1), slot2)
end

slot5.AddPlayerCharacter = function (slot0, slot1)
	slot0:AppendCharacter(slot1)

	slot3 = slot1:GetUnitData():IsMainFleetUnit()

	if slot0._dataProxy:GetInitData().battleType ~= SYSTEM_DUEL then
		if slot2 == SYSTEM_SHAM then
		elseif slot2 == SYSTEM_SUBMARINE_RUN or slot2 == SYSTEM_SUB_ROUTINE then
			slot1:SetBarHidden(false, false)
		else
			slot1:SetBarHidden(not slot3, slot3)
		end
	end
end

slot5.AddEnemyCharacter = function (slot0, slot1)
	slot0:AppendCharacter(slot1)
end

slot5.AppendCharacter = function (slot0, slot1)
	slot0._characterList[slot1:GetUnitData():GetUniqueID()] = slot1
end

slot5.InstantiateCharacterComponent = function (slot0, slot1)
	return cloneTplTo(slot3, slot0._state:GetUI().findTF(slot2, slot1).parent).gameObject
end

slot5.GetCharacterList = function (slot0)
	return slot0._characterList
end

slot5.GetPopNumPool = function (slot0)
	return slot0._popNumPool
end

slot5.GetCharacter = function (slot0, slot1)
	return slot0._characterList[slot1]
end

slot5.GetAircraft = function (slot0, slot1)
	return slot0._aircraftList[slot1]
end

slot5.AddAirCraftCharacter = function (slot0, slot1)
	slot0._aircraftList[slot1:GetUnitData():GetUniqueID()] = slot1
end

slot5.AddArea = function (slot0, slot1, slot2, slot3)
	slot5 = slot0.Battle.BattleEffectArea.New(slot0._fxPool:GetFX(slot2), slot1)

	if slot3 then
		slot5:SetStatic()
	else
		slot5:ResetScale()
	end

	slot0._areaList[slot1:GetUniqueID()] = slot5
end

slot5.RemoveArea = function (slot0, slot1)
	if slot0._areaList[slot1] then
		slot0._areaList[slot1].Dispose(slot2)

		slot0._areaList[slot1] = nil
	end
end

slot5.Reinitialize = function (slot0)
	slot0:Clear()
	slot0:Init()
end

slot5.AllBulletNeutralize = function (slot0)
	for slot4, slot5 in pairs(slot0._characterList) do
		if slot5.__name == slot0.Battle.BattlePlayerCharacter.__name or slot5.__name == slot0.Battle.BattleSubCharacter.__name then
			slot5:DisableWeaponTrack()
		end
	end

	slot0._antiAirArea:SetActive(false)

	for slot4, slot5 in pairs(slot0._bulletList) do
		slot5:Neutrailze()
	end

	slot0.Battle.BattleBulletFactory.NeutralizeBullet()
end

slot5.AllCharAnimAutoCalcComplex = function (slot0, slot1)
	for slot5, slot6 in pairs(slot0._characterList) do
		slot6:SetSkeletonAutoCalcComplex(slot1)
	end
end

slot5.Clear = function (slot0)
	for slot4, slot5 in pairs(slot0._characterList) do
		slot5:GetFactory():RemoveCharacter(slot5)
	end

	for slot4, slot5 in pairs(slot0._aircraftList) do
		slot5:GetFactory():RemoveCharacter(slot5)
	end

	slot0._characterList = nil
	slot0._characterFactoryList = nil

	for slot4, slot5 in pairs(slot0._bulletList) do
		slot0:RemoveBullet(slot4)
	end

	for slot5, slot6 in pairs(slot1) do
		slot6:Clear()
	end

	slot0._fxPool:Clear()

	for slot5, slot6 in pairs(slot0._areaList) do
		slot0:RemoveArea(slot5)
	end

	slot0._areaList = nil

	slot0.Battle.BattleCharacterFXContainersPool.GetInstance():Clear()
	slot0._popNumPool:Clear()
	slot0.Battle.BattleHPBarManager.GetInstance():Clear()
	slot0.Battle.BattleArrowManager.GetInstance():Clear()

	slot0._anitSubAreaTFList = nil
end

slot5.Dispose = function (slot0)
	slot0:Clear()
	slot0:RemoveEvent()
	slot0.super.Dispose(slot0)
end

return
