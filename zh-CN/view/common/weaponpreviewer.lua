slot0 = class("WeaponPreviewer")
slot1 = Vector3(0, 1, 40)

function slot0.Ctor(slot0, slot1)
	slot0.rawImage = slot1

	setActive(slot0.rawImage, false)

	slot0.seaCameraGO = GameObject.Find("BarrageCamera")
	slot0.seaCameraGO.tag = "MainCamera"
	slot0.seaCamera = slot0.seaCameraGO:GetComponent(typeof(Camera))
	slot0.seaCamera.targetTexture = slot0.rawImage.texture
	slot0.seaCamera.enabled = true
	slot0.mainCameraGO = GameObject.Find("MainCamera")
end

function slot0.configUI(slot0, slot1)
	slot0.healTF = slot1

	setActive(slot0.healTF, false)
	slot0.healTF:GetComponent("DftAniEvent"):SetEndEvent(function ()
		setActive(slot0.healTF, false)
		setText(slot0.healTF:Find("text"), "")
	end)
end

function slot0.setDisplayWeapon(slot0, slot1, slot2, slot3)
	slot0.weaponIds = slot1
	slot0.equipSkinId = slot2 or 0

	slot0:onWeaponUpdate()
end

function slot0.load(slot0, slot1, slot2, slot3, slot4)
	slot0.loading = true
	slot0.shipVO = slot2

	ys.Battle.BattleVariable.Init()
	ys.Battle.BattleFXPool.GetInstance():Init()

	slot5 = ys.Battle.BattleResourceManager.GetInstance()

	slot5:Init()
	slot5:AddPreloadResource(slot5.GetMapResource(slot1))
	slot5:AddPreloadResource(slot5.GetDisplayCommonResource())

	if slot0.equipSkinId > 0 then
		slot5:AddPreloadResource(slot5.GetEquipSkinPreviewRes(slot0.equipSkinId))
	end

	slot5:AddPreloadResource(slot5.GetShipResource(slot2.configId, slot2.skinId), false)

	if slot2:getShipType() ~= ShipType.WeiXiu then
		for slot9, slot10 in ipairs(slot3) do
			if slot10 ~= 0 then
				for slot15, slot16 in ipairs(slot11) do
					slot5:AddPreloadResource(slot5.GetWeaponResource(slot16))
				end
			end
		end
	end

	slot5:StartPreload(function ()
		slot0.seaView = ys.Battle.BattleMap.New(ys.Battle.BattleMap.New)

		function slot0(slot0)
			slot0.loading = false
			slot0.loaded = true

			pg.UIMgr.GetInstance():LoadingOff()

			slot0.seaCharacter = slot0
			slot0.transform.localScale = Vector3(slot1, slot1, slot1)
			slot0.transform.localPosition = slot0.transform
			slot0.transform.localEulerAngles = Vector3(30, 0, 0)
			slot0.seaAnimator = slot0.transform:GetComponent("SpineAnim")
			slot0.characterAction = ys.Battle.BattleConst.ActionName.MOVE

			slot0.seaAnimator:SetAction(slot0.characterAction, 0, true)

			slot0.seaFXList = {}
			slot0._FXAttachPoint = GameObject()

			slot0._FXAttachPoint.transform.SetParent(slot2, slot0.transform, false)

			slot0._FXAttachPoint.transform.localPosition = Vector3.zero
			slot0._FXAttachPoint.transform.localEulerAngles = Vector3(330, 0, 0)
			slot4 = pg.ship_skin_template[slot1.skinId].fx_container
			slot5 = {}

			for slot9, slot10 in ipairs(ys.Battle.BattleConst.FXContainerIndex) do
				slot5[slot9] = Vector3(slot4[slot9][1], slot4[slot9][2], slot4[slot9][3])
			end

			slot0._FXOffset = slot5
			slot6 = ys.Battle.BattleFXPool.GetInstance()

			pg.EffectMgr.GetInstance():PlayBattleEffect(slot6:GetCharacterFX("movewave", slot0), Vector3(0, 0, 0), true)

			slot0.seaFXPool = slot6

			if slot1:getShipType() ~= ShipType.WeiXiu then
				slot0.boneList = {}

				for slot12, slot13 in pairs(pg.ship_skin_template[slot1.skinId].bound_bone) do
					slot14 = {}

					for slot18, slot19 in ipairs(slot13) do
						if type(slot19) == "table" then
							slot14[#slot14 + 1] = Vector3(slot19[1], slot19[2], slot19[3])
						else
							slot14[#slot14 + 1] = Vector3.zero
						end
					end

					slot0.boneList[slot12] = slot14[1]
				end

				slot0:SeaUpdate()
			end

			setActive(slot0.rawImage, true)
			slot0.mainCameraGO:SetActive(false)
			pg.TimeMgr.GetInstance():ResumeBattleTimer()
			slot0:onWeaponUpdate()
			slot3()
		end

		slot5:InstCharacter(slot2:getPrefab(), function (slot0)
			slot0(slot0)
		end)
	end, nil)
	pg.UIMgr.GetInstance():LoadingOn()
end

function slot0.playShipAnims(slot0)
	if slot0.loaded and slot0.seaAnimator then
		slot1 = {
			"attack",
			"victory",
			"dead"
		}

		function slot2(slot0)
			if slot0.seaAnimator then
				slot0.seaAnimator:SetActionCallBack(nil)
			end

			slot0.seaAnimator:SetAction(slot1[slot0], 0, false)
			slot0.seaAnimator:SetActionCallBack(function (slot0)
				if slot0 == "finish" then
					slot0.seaAnimator:SetActionCallBack(nil)
					slot0.seaAnimator:SetAction("stand", 0, false)
				end
			end)
		end

		if slot0.palyAnimTimer then
			slot0.palyAnimTimer:Stop()

			slot0.palyAnimTimer = nil
		end

		slot0.palyAnimTimer = Timer.New(function ()
			slot0(math.random(1, #slot1))
		end, 5, -1)

		slot0.palyAnimTimer:Start()
		slot0.palyAnimTimer.func()
	end
end

function slot0.onWeaponUpdate(slot0)
	if slot0.loaded and slot0.weaponIds then
		if slot0.seaAnimator then
			slot0.seaAnimator:SetActionCallBack(nil)
		end

		function slot1()
			slot1 = slot0.weaponList or {}

			for slot3, slot4 in slot0(slot1) do
				slot5 = pairs
				slot6 = slot4.emitterList or {}

				for slot8, slot9 in slot5(slot6) do
					slot9:Destroy()
				end
			end

			slot1 = slot0.bulletList or {}

			for slot3, slot4 in slot0(slot1) do
				Object.Destroy(slot4._go)
			end

			slot1 = slot0.aircraftList or {}

			for slot3, slot4 in slot0(slot1) do
				Object.Destroy(slot4.obj)
			end

			slot0.bulletList = {}
			slot0.aircraftList = {}
		end

		if #slot0.weaponIds == 0 and slot0.playRandomAnims then
			if slot0._fireTimer then
				slot0._fireTimer:Stop()
			end

			if slot0._delayTimer then
				slot0._delayTimer:Stop()
			end

			if slot0.shipVO:getShipType() ~= ShipType.WeiXiu then
				slot1()
			elseif slot0.buffTimer then
				pg.TimeMgr.GetInstance():RemoveBattleTimer(slot0.buffTimer)

				slot0.buffTimer = nil
			end

			slot0:playShipAnims()
		elseif slot0.shipVO:getShipType() ~= ShipType.WeiXiu then
			slot1()
			slot0:MakeWeapon(slot0.weaponIds)
			slot0:SeaFire()
		elseif slot0.weaponIds[1] then
			slot0:MakeBuff(pg.equip_data_statistics[slot2].skill_id[1])
		end
	end
end

function slot0.SeaFire(slot0)
	slot1 = 1

	if slot0._fireTimer then
		slot0._delayTimer:Stop()
		slot0._fireTimer:Stop()
		slot0._fireTimer:Start()
	else
		slot0._fireTimer = pg.TimeMgr.GetInstance():AddBattleTimer("barrageFireTimer", -1, 1.5, slot2)
		slot0._delayTimer = pg.TimeMgr.GetInstance():AddBattleTimer("", -1, 3, function ()
			slot0._delayTimer:Stop()
			slot0._delayTimer.Stop._fireTimer:Resume()
		end, nil, true)
	end
end

function slot0.MakeBuff(slot0, slot1)
	slot4 = getSkillConfig(slot1).effect_list[1].arg_list.time
	slot5 = require("GameCfg.skill.skill_" .. getSkillConfig(slot1).effect_list[1].arg_list.skill_id)

	if slot0.buffTimer then
		pg.TimeMgr.GetInstance():RemoveBattleTimer(slot0.buffTimer)

		slot0.buffTimer = nil
	end

	slot0.buffTimer = pg.TimeMgr.GetInstance():AddBattleTimer("buffTimer", -1, slot4, function ()
		setActive(slot0.healTF, true)
		setText(slot0.healTF:Find("text"), slot1.effect_list[1].arg_list.number)
	end)
end

function slot0.MakeWeapon(slot0, slot1)
	slot0.weaponList = {}
	slot0.bulletList = {}
	slot0.aircraftList = {}
	slot2 = 0
	slot3 = ys.Battle.BattleConst

	for slot7, slot8 in ipairs(slot1) do
		for slot13, slot14 in ipairs(slot9) do
			if slot14 <= 0 then
				break
			end

			slot2 = slot2 + 1

			if ys.Battle.BattleDataFunction.GetWeaponPropertyDataFromID(slot14).type == slot3.EquipmentType.MAIN_CANNON or slot15.type == slot3.EquipmentType.SUB_CANNON or slot15.type == slot3.EquipmentType.TORPEDO or slot15.type == slot3.EquipmentType.MANUAL_TORPEDO or slot15.type == slot3.EquipmentType.POINT_HIT_AND_LOCK then
				if type(slot15.barrage_ID) == "table" then
					slot0.weaponList[slot2] = {
						tmpData = slot15,
						emitterList = {}
					}

					for slot19, slot20 in ipairs(slot15.barrage_ID) do
						slot0.weaponList[slot2].emitterList[slot19] = slot0:createEmitterCannon(slot20, slot15.bullet_ID[slot19], slot15.spawn_bound)
					end
				end
			elseif slot15.type == slot3.EquipmentType.PREVIEW_ARICRAFT and type(slot15.barrage_ID) == "table" then
				slot0.weaponList[slot2] = {
					tmpData = slot15,
					emitterList = {}
				}

				for slot19, slot20 in ipairs(slot15.barrage_ID) do
					slot0.weaponList[slot2].emitterList[slot19] = slot0:createEmitterAir(slot20, slot15.bullet_ID[slot19], slot15.spawn_bound)
				end
			end
		end
	end
end

function slot0.createEmitterCannon(slot0, slot1, slot2, slot3)
	return ys.Battle.BattleBulletEmitter.New(function (slot0, slot1, slot2, slot3, slot4)
		slot5 = ys.Battle.BattlePlayerUnit.New(1, ys.Battle.BattleConfig.FRIENDLY_CODE)

		slot5:SetSkinId(slot0.shipVO.skinId)
		slot5:SetTemplate(slot0.shipVO.configId, slot6)

		slot8 = ys.Battle.BattleDataFunction.CreateBattleBulletData(slot1, slot1, slot5, slot7, slot2 + Vector3(40, 0, 0))

		slot8:SetOffsetPriority(slot3)
		slot8:SetShiftInfo(slot0, slot1)
		slot8:SetRotateInfo(nil, 0, slot2)

		if slot0.equipSkinId > 0 then
			slot9 = pg.equip_skin_template[slot0.equipSkinId]
			slot10, slot11, slot12, slot13 = ys.Battle.BattleDataFunction.GetEquipSkin(slot0.equipSkinId)
			slot16 = nil

			if slot8:GetType() == ys.Battle.BattleConst.BulletType.CANNON or slot14 == slot15.BOMB then
				if _.any({
					EquipType.CannonQuZhu,
					EquipType.CannonQingXun,
					EquipType.CannonZhongXun,
					EquipType.CannonZhanlie,
					EquipType.CannonZhongXun2
				}, function (slot0)
					return table.contains(slot0.equip_type, slot0)
				end) then
					slot8:SetModleID(slot10)
				elseif slot11 and #slot11 > 0 then
					slot8:SetModleID(slot11)
				elseif slot13 and #slot13 > 0 then
					slot8:SetModleID(slot13)
				end
			elseif slot14 == slot15.TORPEDO then
				if table.contains(slot9.equip_type, EquipType.Torpedo) then
					slot8:SetModleID(slot10)
				elseif slot12 and #slot12 > 0 then
					slot8:SetModleID(slot12)
				end
			end
		end

		slot11 = nil

		(slot8:GetType() ~= ys.Battle.BattleConst.BulletType.CANNON or ys.Battle.BattleCannonBullet.New()) and (slot9 ~= slot10.BOMB or ys.Battle.BattleBombBullet.New()) and (slot9 ~= slot10.TORPEDO or ys.Battle.BattleTorpedoBullet.New()) and ys.Battle.BattleBullet.New():SetBulletData(slot8)

		function slot12(slot0)
			slot0:SetGO(slot0)
			slot0:AddRotateScript()

			if tf(slot0).parent then
				tf(slot0).parent = nil
			end

			slot0:SetSpawn(slot3 + (slot1.boneList[slot2] or Vector3.zero))

			if slot1.boneList[slot2] or Vector3.zero.bulletList then
				table.insert(slot1.bulletList, slot0)
			end
		end

		ys.Battle.BattleResourceManager.GetInstance():InstBullet((slot8.GetType() ~= ys.Battle.BattleConst.BulletType.CANNON or ys.Battle.BattleCannonBullet.New()) and (slot9 ~= slot10.BOMB or ys.Battle.BattleBombBullet.New()) and (slot9 ~= slot10.TORPEDO or ys.Battle.BattleTorpedoBullet.New()) and ys.Battle.BattleBullet.New():GetModleID(), function (slot0)
			slot0(slot0)
		end)
	end, function ()
		return
	end, slot1)
end

function slot0.createEmitterAir(slot0, slot1, slot2, slot3)
	return ys.Battle.BattleBulletEmitter.New(function (slot0, slot1, slot2, slot3, slot4)
		slot5 = {
			id = slot0,
			tmpData = pg.aircraft_template[slot0]
		}
		slot8 = Vector3(math.cos(slot7), 0, math.sin(slot7))

		function slot9(slot0)
			slot0.transform.localPosition = slot0 + Vector3(slot1.position_offset[1] + slot2, slot1.position_offset[2], slot1.position_offset[3] + slot1.position_offset[1] + slot2)
			slot0.transform.localScale = Vector3(0.1, 0.1, 0.1)
			slot4.obj = slot0
			slot4.tf = slot0.transform
			slot4.pos = slot0 + Vector3(slot1.position_offset[1] + slot2, slot1.position_offset[2], slot1.position_offset[3] + slot1.position_offset[1] + slot2)
			0.1.baseVelocity = ys.Battle.BattleFormulas.ConvertAircraftSpeed(0.1.tmpData.speed)
			0.1.tmpData.speed.speed = slot5 * 0.1.tmpData.speed.baseVelocity
			slot4.speedZ = (math.random() - 0.5) * 0.5
			slot4.targetZ = slot0.z

			if slot6.aircraftList then
				table.insert(slot6.aircraftList, slot4)
			end
		end

		slot10 = pg.aircraft_template[slot0].model_ID

		if slot2.equipSkinId > 0 and table.contains(pg.equip_skin_template[slot2.equipSkinId].equip_type, ({
			EquipType.FighterAircraft,
			EquipType.TorpedoAircraft,
			EquipType.BomberAircraft
		})[slot6.type]) then
			slot10 = ys.Battle.BattleDataFunction.GetEquipSkin(slot2.equipSkinId)
		end

		ys.Battle.BattleResourceManager.GetInstance():InstAirCharacter(slot10, function (slot0)
			slot0(slot0)
		end)
	end, function ()
		return
	end, slot1)
end

function slot0.RemoveBullet(slot0, slot1, slot2)
	Object.Destroy(slot0.bulletList[slot1]._go)
	table.remove(slot0.bulletList, slot1)

	if slot2 and slot3:GetMissFXID() and slot4 ~= "" then
		slot9, slot6 = slot0.seaFXPool:GetFX(slot4)

		pg.EffectMgr.GetInstance():PlayBattleEffect(slot5, slot3:GetPosition() + slot6, true)
	end
end

function slot0.SeaUpdate(slot0)
	slot1 = 0
	slot2 = -20
	slot3 = 60
	slot4 = 0
	slot5 = 60
	slot6 = ys.Battle.BattleConfig
	slot7 = ys.Battle.BattleConst

	pg.TimeMgr.GetInstance():AddBattleTimer("barrageUpdateTimer", -1, 0.033, function ()
		for slot3 = #slot0.bulletList, 1, -1 do
			slot5 = 
			-- Decompilation error in this vicinity:
			slot0.bulletList[slot3]._bulletData:GetSpeed()()

			if (slot1 < slot0.bulletList[slot3].GetPosition(slot4).x and slot5.x > 0) or (slot6.z < slot2 and slot5.z < 0) then
				slot0:RemoveBullet(slot3, false)
			elseif slot6.x < slot3 and slot5.x < 0 and slot4:GetType() ~= slot4.BulletType.BOMB then
				slot0:RemoveBullet(slot3, false)
			else
				slot4._bulletData:Update(slot7)
				slot4:Update(slot5)

				if (slot6 < slot6.z and slot5.z > 0) or slot4._bulletData:IsOutRange(slot5) then
					slot0:RemoveBullet(slot3, true)
				end
			end
		end

		for slot3, slot4 in ipairs(slot0.aircraftList) do
			if slot4.pos + slot4.speed.y < slot7.AircraftHeight + 5 then
				slot4.speed.y = math.max(0.4, 1 - slot5.y / slot7.AircraftHeight)
				slot6 = math.min(1, slot5.y / slot7.AircraftHeight)
				slot4.tf.localScale = Vector3(slot6, slot6, slot6)
			end

			slot4.speed.z = slot4.baseVelocity * slot4.speedZ

			if slot4.baseVelocity < slot4.targetZ - slot5.z then
				slot4.speed.z = slot4.baseVelocity * 0.5
			elseif slot6 < -slot4.baseVelocity then
				slot4.speed.z = -slot4.baseVelocity * 0.5
			else
				slot4.targetZ = slot8.z + slot8.z * (math.random() - 0.5) * 0.6
			end

			if slot1 < slot5.x or slot5.x < slot3 then
				Object.Destroy(slot4.obj)
				table.remove(slot0.aircraftList, slot3)
			else
				slot4.tf.localPosition = slot5
				slot4.pos = slot5
			end
		end

		slot5 = slot5 + 1
	end)
end

function slot0.GetFXOffsets(slot0, slot1)
	return slot0._FXOffset[slot1 or 1]
end

function slot0.GetAttachPoint(slot0)
	return slot0._FXAttachPoint
end

function slot0.GetGO(slot0)
	return slot0.seaCharacter
end

function slot0.GetSpecificFXScale(slot0)
	return {}
end

function slot0.clear(slot0)
	pg.TimeMgr.GetInstance():RemoveAllBattleTimer()

	if slot0.seaCharacter then
		Destroy(slot0.seaCharacter)

		slot0.seaCharacter = nil
	end

	if slot0.aircraftList then
		for slot4, slot5 in ipairs(slot0.aircraftList) do
			Destroy(slot5.obj)
		end

		slot0.aircraftList = nil
	end

	if slot0.seaView then
		slot0.seaView:Dispose()

		slot0.seaView = nil
	end

	if slot0.weaponList then
		for slot4, slot5 in ipairs(slot0.weaponList) do
			for slot9, slot10 in ipairs(slot5.emitterList) do
				slot10:Destroy()
			end
		end

		slot0.weaponList = nil
	end

	if slot0.bulletList then
		for slot4, slot5 in ipairs(slot0.bulletList) do
			Destroy(slot5._go)
		end

		slot0.bulletList = nil
	end

	if slot0.seaFXPool then
		slot0.seaFXPool:Clear()

		slot0.seaFXPool = nil
	end

	if slot0.seaFXContainersPool then
		slot0.seaFXContainersPool:Clear()

		slot0.seaFXContainersPool = nil
	end

	ys.Battle.BattleResourceManager.GetInstance().Clear(slot1)

	slot0.seaCameraGO.tag = "Untagged"
	slot0.seaCameraGO = nil
	slot0.seaCamera = nil

	slot0.mainCameraGO:SetActive(true)

	slot0.mainCameraGO = nil
	slot0.loading = false
	slot0.loaded = false

	if slot0.palyAnimTimer then
		slot0.palyAnimTimer:Stop()

		slot0.palyAnimTimer = nil
	end
end

return slot0
