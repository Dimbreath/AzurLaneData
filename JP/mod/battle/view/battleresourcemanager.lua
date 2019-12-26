ys = ys or {}
slot1 = ys.Battle.BattleDataFunction
slot2 = ys.Battle.BattleConst
slot3 = ys.Battle.BattleConfig
slot4 = require("Mgr/Pool/PoolUtil")
slot5 = singletonClass("BattleResourceManager")
ys.Battle.BattleResourceManager = slot5
slot5.__name = "BattleResourceManager"

function slot5.Ctor(slot0)
	slot0.rotateScriptMap = setmetatable({}, {
		__mode = "kv"
	})
end

function slot5.Init(slot0)
	slot0._preloadList = {}
	slot0._resCacheList = {}
	slot0._allPool = {}
	slot0._ob2Pool = {}
	slot0._shaders = {}
	slot1 = GameObject()

	slot1:SetActive(false)

	slot1.name = "PoolRoot"
	slot1.transform.position = Vector3(-10000, -10000, 0)
	slot0._poolRoot = slot1
	slot0._bulletContainer = GameObject("BulletContainer")
	slot0._battleCVList = {}
end

function slot5.Clear(slot0)
	for slot4, slot5 in pairs(slot0._allPool) do
		slot5:Dispose()
	end

	for slot4, slot5 in pairs(slot0._resCacheList) do
		if string.find(slot4, "Char/") then
			slot0.ClearCharRes(slot4, slot5)
		elseif string.find(slot4, "painting/") then
			slot0.ClearPaintingRes(slot4, slot5)
		else
			slot1.Destroy(slot5)
		end
	end

	slot0._resCacheList = {}
	slot0._ob2Pool = {}
	slot0._allPool = {}
	slot0._shaders = {}

	Object.Destroy(slot0._poolRoot)

	slot0._poolRoot = nil

	Object.Destroy(slot0._bulletContainer)

	slot0._bulletContainer = nil
	slot0.rotateScriptMap = setmetatable({}, {
		__mode = "kv"
	})

	for slot4, slot5 in pairs(slot0._battleCVList) do
		pg.CriMgr.UnloadCVBank(slot5)
	end

	slot0._battleCVList = {}
end

function slot5.GetBulletPath(slot0)
	return "Item/" .. slot0
end

function slot5.GetCharacterPath(slot0)
	return "Char/" .. slot0
end

function slot5.GetCharacterGoPath(slot0)
	return "chargo/" .. slot0
end

function slot5.GetAircraftIconPath(slot0)
	return "AircraftIcon/" .. slot0
end

function slot5.GetFXPath(slot0)
	return "Effect/" .. slot0
end

function slot5.GetPaintingPath(slot0)
	return "painting/" .. slot0
end

function slot5.GetHrzIcon(slot0)
	return "herohrzicon/" .. slot0
end

function slot5.GetSquareIcon(slot0)
	return "squareicon/" .. slot0
end

function slot5.GetQIcon(slot0)
	return "qicon/" .. slot0
end

function slot5.GetCommanderHrzIconPath(slot0)
	return "commanderhrz/" .. slot0
end

function slot5.GetShipTypeIconPath(slot0)
	return "shiptype/" .. slot0
end

function slot5.GetMapPath(slot0)
	return "Map/" .. slot0
end

function slot5.GetUIPath(slot0)
	return "UI/" .. slot0
end

function slot5.GetResName(slot0)
	slot2 = string.find(slot0, "%/")

	while slot2 do
		slot2 = string.find(string.sub(slot1, slot2 + 1), "%/")
	end

	return slot1
end

function slot5.ClearCharRes(slot0, slot1)
	slot3 = slot1:GetComponent("SkeletonRenderer").skeletonDataAsset

	if not PoolMgr.GetInstance():IsSpineSkelCached(slot0:GetResName()) then
		UIUtil.ClearSharedMaterial(slot1)
	end

	slot1:Destroy()
end

function slot5.ClearPaintingRes(slot0, slot1)
	PoolMgr.GetInstance():ReturnPainting(slot0:GetResName(), slot1)
end

function slot5.DestroyOb(slot0, slot1)
	if slot0._ob2Pool[slot1] then
		slot2:Recycle(slot1)
	else
		slot0.Destroy(slot1)
	end
end

function slot5.popPool(slot0, slot1, slot2)
	slot3 = slot1:GetObject()

	if not slot2 then
		slot3.transform.parent = nil
	end

	slot0._ob2Pool[slot3] = slot1

	return slot3
end

function slot5.InstCharacter(slot0, slot1, slot2)
	if slot0._allPool[slot0.GetCharacterPath(slot1)] then
		slot2(slot0:popPool(slot4))
	elseif slot0._resCacheList[slot3] ~= nil then
		slot0:InitPool(slot3, slot0._resCacheList[slot3])
		slot2(slot0:popPool(slot4))
	else
		slot0:LoadSpineAsset(slot1, function (slot0)
			if not slot0._poolRoot then
				slot1.ClearCharRes(slot2, slot0)

				return
			end

			slot1 = SpineAnim.AnimChar(slot3, slot0)

			slot1:SetActive(false)
			slot0:InitPool(slot0.InitPool, slot1)
			slot1(slot0:popPool(slot0._allPool[]))
		end)
	end
end

function slot5.LoadSpineAsset(slot0, slot1, slot2)
	slot3 = slot0.GetCharacterPath(slot1)

	if not PoolMgr.GetInstance():IsSpineSkelCached(slot1) then
		ResourceMgr.Inst:getAssetAsync(slot3, slot1 .. "_SkeletonData", UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
			slot0(slot0)
		end), true, true)
	else
		PoolMgr.GetInstance():GetSpineSkel(slot1, true, slot2)
	end
end

function slot5.InstAirCharacter(slot0, slot1, slot2)
	if slot0._allPool[slot0.GetCharacterGoPath(slot1)] then
		slot2(slot0:popPool(slot4))
	elseif slot0._resCacheList[slot3] ~= nil then
		slot0:InitPool(slot3, slot0._resCacheList[slot3])
		slot2(slot0:popPool(slot4))
	else
		ResourceMgr.Inst:getAssetAsync(slot3, slot1, UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
			if not slot0._poolRoot then
				slot1.Destroy(slot0)

				return
			else
				slot0:InitPool(slot0, slot0)
				slot0(slot0:popPool(slot0._allPool[slot0]))
			end
		end), true, true)
	end
end

function slot5.InstBullet(slot0, slot1, slot2)
	if slot0._allPool[slot0.GetBulletPath(slot1)] then
		slot2(slot0:popPool(slot4, true))

		return true
	elseif slot0._resCacheList[slot3] ~= nil then
		slot0:InitPool(slot3, slot0._resCacheList[slot3])
		slot2(slot0:popPool(slot4, true))

		return true
	else
		ResourceMgr.Inst:getAssetAsync(slot3, slot1, UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
			if slot0._poolRoot then
				slot1.Destroy(slot0)

				return
			else
				slot0:InitPool(slot0, slot0)
				true(slot0:popPool(slot0._allPool[slot0], true))
			end
		end), true, true)

		return false
	end
end

function slot5.InstFX(slot0, slot1)
	slot3 = nil

	if slot0._allPool[slot0.GetFXPath(slot1)] then
		slot3 = slot0:popPool(slot4)
	elseif slot0._resCacheList[slot2] ~= nil then
		slot0:InitPool(slot2, slot0._resCacheList[slot2])

		slot3 = slot0:popPool(slot0._allPool[slot2])
	else
		ResourceMgr.Inst:getAssetAsync(slot2, slot1, UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
			if not slot0._poolRoot then
				slot1.Destroy(slot0)

				return
			else
				slot0:InitPool(slot0, slot0)
			end
		end), true, true)
		GameObject(slot1 .. "临时假obj"):SetActive(false)

		slot0._resCacheList[slot2] = GameObject(slot1 .. "临时假obj")
	end

	return slot3
end

function slot5.InstSkillPaintingUI(slot0)
	slot0._ob2Pool[slot0._allPool["UI/SkillPainting"].GetObject(slot1)] = slot0._allPool["UI/SkillPainting"]

	return slot0._allPool["UI/SkillPainting"].GetObject(slot1)
end

function slot5.InstKizunaJamming(slot0)
	slot0._ob2Pool[slot0._allPool["UI/KizunaJamming"].GetObject(slot1)] = slot0._allPool["UI/KizunaJamming"]

	return slot0._allPool["UI/KizunaJamming"].GetObject(slot1)
end

function slot5.InstPainting(slot0, slot1)
	slot3 = nil

	if slot0._allPool[slot0.GetPaintingPath(slot1)] then
		slot0._ob2Pool[slot4:GetObject()] = slot4
	elseif slot0._resCacheList[slot2] ~= nil then
		Object.Instantiate(slot0._resCacheList[slot2]):SetActive(true)
	end

	return slot3
end

function slot5.InstMap(slot0, slot1)
	slot3 = nil

	if slot0._allPool[slot0.GetMapPath(slot1)] then
		slot0._ob2Pool[slot4:GetObject()] = slot4
	elseif slot0._resCacheList[slot2] ~= nil then
		slot3 = Object.Instantiate(slot0._resCacheList[slot2])
	end

	slot3:SetActive(true)

	return slot3
end

function slot5.GetCharacterIcon(slot0, slot1)
	return slot0._resCacheList[slot0.GetHrzIcon(slot1)]
end

function slot5.GetCharacterSquareIcon(slot0, slot1)
	return slot0._resCacheList[slot0.GetSquareIcon(slot1)]
end

function slot5.GetCharacterQIcon(slot0, slot1)
	return slot0._resCacheList[slot0.GetQIcon(slot1)]
end

function slot5.GetAircraftIcon(slot0, slot1)
	return slot0._resCacheList[slot0.GetAircraftIconPath(slot1)]
end

function slot5.GetShipTypeIcon(slot0, slot1)
	return slot0._resCacheList[slot0.GetShipTypeIconPath(slot1)]
end

function slot5.GetCommanderHrzIcon(slot0, slot1)
	return slot0._resCacheList[slot0.GetCommanderHrzIconPath(slot1)]
end

function slot5.GetShader(slot0, slot1)
	return slot0._shaders[slot1]
end

function slot5.AddPreloadResource(slot0, slot1)
	if type(slot1) == "string" then
		slot0._preloadList[slot1] = false
	elseif type(slot1) == "table" then
		for slot5, slot6 in ipairs(slot1) do
			slot0._preloadList[slot6] = false
		end
	end
end

function slot5.AddPreloadCV(slot0, slot1)
	if ShipWordHelper.RawGetCVKey(slot1) > 0 then
		slot0._battleCVList[slot2] = pg.CriMgr.GetBattleCVBankName(slot2)
	end
end

function slot5.StartPreload(slot0, slot1, slot2)
	slot3 = 0
	slot4 = 0

	for slot8, slot9 in pairs(slot0._preloadList) do
		slot4 = slot4 + 1
	end

	for slot8, slot9 in pairs(slot0._battleCVList) do
		slot4 = slot4 + 1
	end

	for slot8, slot9 in pairs(slot0.BATTLE_SHADER) do
		slot4 = slot4 + 1
	end

	function slot5()
		if not slot0._poolRoot then
			return
		end

		if slot2 < slot1 + 1 then
			return
		end

		if slot3 then
			slot3(slot1)
		end

		if slot1 == slot2 then
			slot0._preloadList = nil

			slot4()
		end
	end

	for slot9, slot10 in pairs(slot0._battleCVList) do
		pg.CriMgr:LoadBattleCV(slot9, slot5)
	end

	for slot9, slot10 in pairs(slot0.BATTLE_SHADER) do
		ResourceMgr.Inst:LoadAssetAsync(pg.ShaderMgr.GetInstance().shaders, slot10, UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
			slot0._shaders[] = slot0
			slot2 = slot2 + 1
		end), false, false)
	end

	for slot9, slot10 in pairs(slot0._preloadList) do
		if slot0.GetResName(slot9) == "" or slot0._resCacheList[slot9] ~= nil then
			slot5()
		elseif string.find(slot9, "herohrzicon/") or string.find(slot9, "qicon/") or string.find(slot9, "squareicon/") or string.find(slot9, "commanderhrz/") or string.find(slot9, "AircraftIcon/") then
			ResourceMgr.Inst:getAssetAsync(slot9, "", typeof(Sprite), UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
				if slot0 == nil then
					print("资源预加载失败，检查以下目录：>>" .. slot0 .. "<<")
				else
					if not slot1._poolRoot then
						slot2.Destroy(slot0)

						return
					end

					if slot1._resCacheList then
						slot1._resCacheList[slot0] = slot0
					end
				end

				slot3()
			end), true, true)
		elseif string.find(slot9, "shiptype/") then
			ResourceMgr.Inst:getAssetAsync("shiptype", string.split(slot9, "/")[2], typeof(Sprite), UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
				if slot0 == nil then
					print("资源预加载失败，检查以下目录：>>" .. slot0 .. "<<")
				else
					if not slot1._poolRoot then
						slot2.Destroy(slot0)

						return
					end

					if slot1._resCacheList then
						slot1._resCacheList[slot0] = slot0
					end
				end

				slot3()
			end), true, true)
		elseif string.find(slot9, "painting/") then
			PoolMgr.GetInstance():GetPainting(slot11 .. ((PlayerPrefs.GetInt("paint_hide_other_obj_" .. slot11, 0) ~= 0 and "_n") or ""), true, function (slot0)
				if slot0 == nil then
					print("资源预加载失败，检查以下目录：>>" .. slot0 .. "<<")
				else
					if not slot1._poolRoot then
						slot2.ClearPaintingRes(slot0, slot0)

						return
					end

					Ship.SetExpression(slot0, slot3)
					slot0:SetActive(false)

					if slot0.SetActive._resCacheList then
						slot1._resCacheList[slot0] = slot0
					end
				end

				slot4()
			end)
		elseif string.find(slot9, "Char/") then
			slot0:LoadSpineAsset(slot11, function (slot0)
				if slot0 == nil then
					print("资源预加载失败，检查以下目录：>>" .. slot0 .. "<<")
				else
					if not slot1._poolRoot then
						slot2.ClearCharRes(slot0, slot0)

						return
					end

					SpineAnim.AnimChar(slot3, slot0):SetActive(false)

					if SpineAnim.AnimChar(slot3, slot0).SetActive._resCacheList then
						slot1._resCacheList[slot0] = slot0
					end
				end

				slot1:InitPool(slot0, slot0)
				slot0()
			end)
		elseif string.find(slot9, "UI/") then
			LoadAndInstantiateAsync("UI", slot11, function (slot0)
				if slot0 == nil then
					print("资源预加载失败，检查以下目录：>>" .. slot0 .. "<<")
				else
					if not slot1._poolRoot then
						slot2.Destroy(slot0)

						return
					end

					slot0:SetActive(false)

					if slot0.SetActive._resCacheList then
						slot1._resCacheList[slot0] = slot0
					end
				end

				slot1:InitPool(slot0, slot0)
				slot0()
			end, true, true)
		else
			ResourceMgr.Inst:getAssetAsync(slot9, slot11, UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
				if slot0 == nil then
					print("资源预加载失败，检查以下目录：>>" .. slot0 .. "<<")
				else
					if not slot1._poolRoot then
						slot2.Destroy(slot0)

						return
					end

					if slot1._resCacheList then
						slot1._resCacheList[slot0] = slot0
					end
				end

				slot1:InitPool(slot0, slot0)
				slot0()
			end), true, true)
		end
	end

	return slot4
end

slot6 = Vector3(0, 10000, 0)

function slot5.HideBullet(slot0)
	slot0.transform.position = slot0
end

function slot5.InitParticleSystemCB(slot0)
	pg.EffectMgr.GetInstance():CommonEffectEvent(slot0)
end

function slot5.InitPool(slot0, slot1, slot2)
	slot3 = slot0._poolRoot.transform

	if string.find(slot1, "Item/") then
		if slot2:GetComponentInChildren(typeof(UnityEngine.TrailRenderer)) ~= nil or slot2:GetComponentInChildren(typeof(ParticleSystem)) ~= nil then
			slot0._allPool[slot1] = pg.Pool.New(slot0._bulletContainer.transform, slot2, 15, 20, true, false):InitSize()
		else
			slot4 = pg.Pool.New(slot0._bulletContainer.transform, slot2, 20, 20, true, true)

			slot4:SetRecycleFuncs(slot0.HideBullet)
			slot4:InitSize()

			slot0._allPool[slot1] = slot4
		end
	elseif string.find(slot1, "Effect/") then
		if slot2:GetComponent(typeof(UnityEngine.ParticleSystem)) then
			slot4 = 5

			if string.find(slot1, "smoke") and not string.find(slot1, "smokeboom") then
				slot4 = 30
			elseif string.find(slot1, "feijiyingzi") then
				slot4 = 1
			end

			slot5 = pg.Pool.New(slot3, slot2, slot4, 20, false, false)

			slot5:SetInitFuncs(slot0.InitParticleSystemCB)
			slot5:InitSize()

			slot0._allPool[slot1] = slot5
		else
			slot4 = 8

			if string.find(slot1, "AntiAirArea") or string.find(slot1, "AntiSubArea") then
				slot4 = 1
			end

			GetOrAddComponent(slot2, typeof(ParticleSystemEvent))

			slot0._allPool[slot1] = pg.Pool.New(slot3, slot2, slot4, 20, false, false):InitSize()
		end
	elseif string.find(slot1, "Char/") then
		slot4 = 1

		if string.find(slot1, "danchuan") then
			slot4 = 3
		end

		slot0._allPool[slot1] = pg.Pool.New(slot3, slot2, slot4, 20, false, false):InitSize()
	elseif string.find(slot1, "chargo/") then
		slot0._allPool[slot1] = pg.Pool.New(slot3, slot2, 3, 20, false, false):InitSize()
	elseif slot1 == "UI/SkillPainting" then
		slot0._allPool[slot1] = pg.Pool.New(slot3, slot2, 1, 20, false, false):InitSize()
	elseif slot1 == "UI/KizunaJamming" then
		slot0._allPool[slot1] = pg.Pool.New(slot3, slot2, 1, 20, false, false):InitSize()
	elseif slot1 == "UI/CombatHPBar" then
		slot1.Battle.BattleHPBarManager.GetInstance():Init(slot2, slot3)
	elseif slot1 == "UI/CombatHPPop" then
		slot1.Battle.BattlePopNumManager.GetInstance():Init(slot2, slot3)
	end
end

function slot5.GetRotateScript(slot0, slot1, slot2)
	if slot0.rotateScriptMap[slot1] then
		return slot3[slot1]
	end

	slot3[slot1] = GetOrAddComponent(slot1, "BulletRotation")

	return GetOrAddComponent(slot1, "BulletRotation")
end

function slot5.GetCommonResource()
	return {
		slot0.GetFXPath(slot1.Battle.BattleCharacterFactory.MOVE_WAVE_FX_NAME),
		slot0.GetFXPath(slot1.Battle.BattleCharacterFactory.BOMB_FX_NAME),
		slot0.GetFXPath(slot1.Battle.BattleBossCharacterFactory.BOMB_FX_NAME),
		slot0.GetFXPath(slot1.Battle.BattleAircraftCharacterFactory.BOMB_FX_NAME),
		slot0.GetFXPath("AlertArea"),
		slot0.GetFXPath("TorAlert"),
		slot0.GetFXPath("SquareAlert"),
		slot0.GetFXPath("AntiAirArea"),
		slot0.GetFXPath("AntiSubArea"),
		slot0.GetFXPath("shock"),
		slot0.GetFXPath("qianting_chushui"),
		slot0.GetFXPath("qianting_chushui".PLAYER_SUB_BUBBLE_FX),
		slot0.GetUIPath("SkillPainting"),
		slot0.GetUIPath("CombatHPBar"),
		slot0.GetUIPath("CombatHPPop")
	}
end

function slot5.GetDisplayCommonResource()
	return {
		slot0.GetFXPath(slot1.Battle.BattleCharacterFactory.MOVE_WAVE_FX_NAME),
		slot0.GetFXPath(slot1.Battle.BattleCharacterFactory.BOMB_FX_NAME)
	}
end

function slot5.GetMapResource(slot0)
	slot1 = {}

	for slot6, slot7 in ipairs(slot0.Battle.BattleMap.LAYERS) do
		for slot12, slot13 in ipairs(slot8) do
			slot1[#slot1 + 1] = slot1.GetMapPath(slot13)
		end
	end

	return slot1
end

function slot5.GetBuffResource()
	slot0 = {}

	for slot5, slot6 in ipairs(slot1) do
		slot0[#slot0 + 1] = slot0.GetFXPath(slot6)
	end

	return slot0
end

function slot5.GetShipResource(slot0, slot1, slot2)
	slot3 = {}
	slot4 = slot0:GetPlayerShipTmpDataFromID()

	if slot1 == nil or slot1 == 0 then
		slot1 = slot4.skin_id
	end

	slot5 = slot0.GetPlayerShipSkinDataFromID(slot1)
	slot3[#slot3 + 1] = slot1.GetCharacterPath(slot5.prefab)
	slot3[#slot3 + 1] = slot1.GetHrzIcon(slot5.painting)
	slot3[#slot3 + 1] = slot1.GetQIcon(slot5.painting)
	slot3[#slot3 + 1] = slot1.GetSquareIcon(slot5.painting)

	if slot2 and slot0.GetShipTypeTmp(slot4.type).team_type == TeamType.Main then
		slot3[#slot3 + 1] = slot1.GetPaintingPath(slot5.painting)
	end

	return slot3
end

function slot5.GetEnemyResource(slot0)
	slot2 = slot0:GetMonsterTmpDataFromID()

	for slot6, slot7 in ipairs(slot2.appear_fx) do
		slot1[#slot1 + 1] = slot1.GetFXPath(slot7)
	end

	for slot6, slot7 in ipairs(slot2.smoke) do
		for slot12, slot13 in ipairs(slot8) do
			slot1[#slot1 + 1] = slot1.GetFXPath(slot13[1])
		end
	end

	slot1[#slot1 + 1] = slot1.GetFXPath(slot2.bubble_fx)

	if string.find(slot2.icon, "danchuan") == nil then
		slot1[#slot1 + 1] = slot1.GetHrzIcon(slot2.icon)
		slot1[#slot1 + 1] = slot1.GetQIcon(slot2.icon)
		slot1[#slot1 + 1] = slot1.GetSquareIcon(slot2.icon)
	end

	return slot1
end

function slot5.GetWeaponResource(slot0, slot1)
	slot2 = {}

	if slot0 == -1 then
		return slot2
	end

	if slot0:GetWeaponPropertyDataFromID().type == slot1.EquipmentType.MAIN_CANNON or slot3.type == slot1.EquipmentType.SUB_CANNON or slot3.type == slot1.EquipmentType.TORPEDO or slot3.type == slot1.EquipmentType.ANTI_AIR or slot3.type == slot1.EquipmentType.POINT_HIT_AND_LOCK or slot3.type == slot1.EquipmentType.BOMBER_PRE_CAST_ALERT or slot3.type == slot1.EquipmentType.DEPTH_CHARGE or slot3.type == slot1.EquipmentType.MANUAL_TORPEDO or slot3.type == slot1.EquipmentType.DISPOSABLE_TORPEDO or slot3.type == slot1.EquipmentType.BEAM then
		for slot7, slot8 in ipairs(slot3.bullet_ID) do
			for slot13, slot14 in ipairs(slot9) do
				slot2[#slot2 + 1] = slot14
			end
		end
	elseif slot3.type == slot1.EquipmentType.SCOUT or slot3.type == slot1.EquipmentType.PASSIVE_SCOUT then
		slot2 = slot2.GetAircraftResource(slot0, nil, slot1)
	elseif slot3.type == slot1.EquipmentType.PREVIEW_ARICRAFT then
		for slot7, slot8 in ipairs(slot3.bullet_ID) do
			slot2 = slot2.GetAircraftResource(slot8, nil, slot1)
		end
	end

	slot2[#slot2 + 1] = slot2.GetFXPath(slot3.fire_fx)

	if slot3.precast_param.fx then
		slot2[#slot2 + 1] = slot2.GetFXPath(slot3.precast_param.fx)
	end

	return slot2
end

function slot5.GetEquipResource(slot0, slot1)
	slot2 = {}

	if slot1 ~= 0 then
		if slot0.Battle.BattleDataFunction.GetEquipSkinDataFromID(slot1).ship_skin_id ~= 0 then
			slot2[#slot2 + 1] = slot1.GetCharacterPath(slot0.Battle.BattleDataFunction.GetPlayerShipSkinDataFromID(slot4).prefab)
		end

		if slot3.attachment_combat_scene ~= "" then
			slot2[#slot2 + 1] = slot1.GetFXPath(slot5)
		end
	end

	slot5 = slot0.Battle.BattleDataFunction.GetWeaponDataFromID(slot0).skill_id

	for slot9, slot10 in ipairs(slot4) do
		for slot15, slot16 in ipairs(slot11) do
			slot2[#slot2 + 1] = slot16
		end
	end

	for slot9, slot10 in ipairs(slot5) do
		for slot15, slot16 in ipairs(slot11) do
			slot2[#slot2 + 1] = slot16
		end
	end

	return slot2
end

function slot5.GetBulletResource(slot0, slot1)
	slot2 = {}
	slot4 = nil
	slot4 = ((slot1 or 0) == 0 or slot0.GetEquipSkin(slot1 or 0)) and slot0:GetBulletTmpDataFromID().modle_ID

	if slot3.type == slot1.BulletType.BEAM then
		slot2[#slot2 + 1] = slot2.GetFXPath(slot3.modle_ID)
	else
		slot2[#slot2 + 1] = slot2.GetBulletPath(slot4)
	end

	slot2[#slot2 + 1] = slot2.GetFXPath(slot3.hit_fx)
	slot2[#slot2 + 1] = slot2.GetFXPath(slot3.miss_fx)
	slot2[#slot2 + 1] = slot2.GetFXPath(slot3.track_fx)
	slot2[#slot2 + 1] = slot2.GetFXPath(slot3.alert_fx)

	if slot3.extra_param.shrapnel then
		for slot8, slot9 in ipairs(slot3.extra_param.shrapnel) do
			for slot14, slot15 in ipairs(slot10) do
				slot2[#slot2 + 1] = slot15
			end
		end
	end

	for slot8, slot9 in ipairs(slot3.attach_buff) do
		if slot9.effect_id then
			slot2[#slot2 + 1] = slot2.GetFXPath(slot9.effect_id)
		end

		if slot9.buff_id then
			for slot14, slot15 in ipairs(slot10) do
				slot2[#slot2 + 1] = slot15
			end
		end
	end

	return slot2
end

function slot5.GetAircraftResource(slot0, slot1, slot2)
	slot3 = {}
	slot2 = slot2 or 0
	slot4 = slot0:GetAircraftTmpDataFromID()
	slot5 = nil

	if slot2 ~= 0 then
		slot5, bullet, torpedo, bomb = slot0.GetEquipSkin(slot2)

		if bullet ~= "" then
			slot3[#slot3 + 1] = slot1.GetBulletPath(bullet)
		end

		if torpedo ~= "" then
			slot3[#slot3 + 1] = slot1.GetBulletPath(torpedo)
		end

		if bomb ~= "" then
			slot3[#slot3 + 1] = slot1.GetBulletPath(bomb)
		end
	else
		slot5 = slot4.model_ID
	end

	slot3[#slot3 + 1] = slot1.GetCharacterGoPath(slot5)
	slot3[#slot3 + 1] = slot1.GetAircraftIconPath(slot4.model_ID)

	if type(slot1 or slot4.weapon_ID) == "table" then
		for slot10, slot11 in ipairs(slot6) do
			for slot16, slot17 in ipairs(slot12) do
				slot3[#slot3 + 1] = slot17
			end
		end
	else
		for slot11, slot12 in ipairs(slot7) do
			slot3[#slot3 + 1] = slot12
		end
	end

	return slot3
end

function slot5.GetCommanderResource(slot0)
	slot3 = slot0[1].getSkills(slot2)[1]:getLevel()

	for slot7, slot8 in ipairs(slot0[2]) do
		for slot13, slot14 in ipairs(slot9) do
			slot1[#slot1 + 1] = slot14
		end
	end

	return slot1
end

function slot5.GetStageResource(slot0)
	slot2 = {}
	slot3 = {}

	for slot7, slot8 in ipairs(slot0.Battle.BattleDataFunction.GetDungeonTmpDataByID(slot0).stages) do
		for slot12, slot13 in ipairs(slot8.waves) do
			if slot13.triggerType == slot0.Battle.BattleConst.WaveTriggerType.NORMAL then
				for slot17, slot18 in ipairs(slot13.spawn) do
					for slot23, slot24 in ipairs(slot19) do
						table.insert(slot2, slot24)
					end
				end

				if slot13.reinforcement then
					for slot17, slot18 in ipairs(slot13.reinforcement) do
						for slot23, slot24 in ipairs(slot19) do
							table.insert(slot2, slot24)
						end
					end
				end
			elseif slot13.triggerType == slot0.Battle.BattleConst.WaveTriggerType.AID then
				slot15 = slot13.triggerParams.main_unitList

				if slot13.triggerParams.vanguard_unitList then
					for slot20, slot21 in ipairs(slot16) do
						table.insert(slot2, slot21)
					end

					for slot20, slot21 in ipairs(slot14) do
						slot3[#slot3 + 1] = slot21.skinId
					end
				end

				if slot15 then
					for slot20, slot21 in ipairs(slot16) do
						table.insert(slot2, slot21)
					end

					for slot20, slot21 in ipairs(slot15) do
						slot3[#slot3 + 1] = slot21.skinId
					end
				end
			elseif slot13.triggerType == slot0.Battle.BattleConst.WaveTriggerType.ENVIRONMENT then
				for slot17, slot18 in ipairs(slot13.spawn) do
					slot2[#slot2 + 1] = slot1.GetFXPath(slot18.prefab)

					for slot22, slot23 in ipairs(slot18.behaviours) do
						if slot23.type == slot0.Battle.BattleConst.EnviroumentBehaviour.BUFF then
							for slot29, slot30 in ipairs(slot25) do
								slot2[#slot2 + 1] = slot30
							end
						end
					end
				end
			end

			if slot13.airFighter ~= nil then
				for slot17, slot18 in pairs(slot13.airFighter) do
					for slot23, slot24 in ipairs(slot19) do
						slot2[#slot2 + 1] = slot24
					end
				end
			end
		end
	end

	return slot2, slot3
end

function slot5.GetMonsterRes(slot0)
	slot1 = {}

	for slot6, slot7 in ipairs(slot2) do
		slot1[#slot1 + 1] = slot7
	end

	slot3 = Clone(slot1.Battle.BattleDataFunction.GetMonsterTmpDataFromID(slot0.monsterTemplateID).equipment_list)
	slot4 = Clone(slot0.buffList) or {}

	if slot0.phase then
		for slot8, slot9 in ipairs(slot0.phase) do
			if slot9.addWeapon then
				for slot13, slot14 in ipairs(slot9.addWeapon) do
					slot3[#slot3 + 1] = slot14
				end
			end

			if slot9.addBuff then
				for slot13, slot14 in ipairs(slot9.addBuff) do
					slot4[#slot4 + 1] = slot14
				end
			end
		end
	end

	for slot8, slot9 in ipairs(slot4) do
		for slot14, slot15 in ipairs(slot10) do
			slot1[#slot1 + 1] = slot15
		end

		for slot15, slot16 in pairs(slot1.Battle.BattleDataFunction.GetBuffTemplate(slot9, 1).effect_list) do
			if slot16.arg_list.skill_id and slot1.Battle.BattleDataFunction.NeedSkillPainting(slot17) then
				slot1[#slot1 + 1] = slot0.GetPaintingPath(slot2.GetMonsterTmpDataFromID(slot0.monsterTemplateID).icon)

				break
			end
		end
	end

	for slot8, slot9 in ipairs(slot3) do
		for slot14, slot15 in ipairs(slot10) do
			slot1[#slot1 + 1] = slot15
		end
	end

	return slot1
end

function slot5.GetKizunaJammingUI()
	return slot0.GetUIPath("KizunaJamming")
end

function slot5.GetEquipSkinPreviewRes(slot0)
	slot1 = {}

	for slot6, slot7 in ipairs(slot0:GetEquipSkinDataFromID().weapon_ids) do
		for slot12, slot13 in ipairs(slot8) do
			slot1[#slot1 + 1] = slot13
		end
	end

	function slot3(slot0)
		if slot0 ~= "" then
			slot0[#slot0 + 1] = slot1.GetBulletPath(slot0)
		end
	end

	slot4, slot5, slot6, slot7 = slot0:GetEquipSkin()

	if _.any({
		EquipType.FighterAircraft,
		EquipType.TorpedoAircraft,
		EquipType.BomberAircraft
	}, function (slot0)
		return table.contains(slot0.equip_type, slot0)
	end) then
		slot1[#slot1 + 1] = slot1.GetCharacterGoPath(slot4)
	else
		slot1[#slot1 + 1] = slot1.GetBulletPath(slot4)
	end

	slot3(slot5)
	slot3(slot6)
	slot3(slot7)

	return slot1
end

function slot5.GetEquipSkinBulletRes(slot0)
	slot1 = {}
	slot2, slot3, slot4, slot5 = slot0:GetEquipSkin()

	function slot6(slot0)
		if slot0 ~= "" then
			slot0[#slot0 + 1] = slot1.GetBulletPath(slot0)
		end
	end

	slot8 = false

	for slot12, slot13 in ipairs(slot0:GetEquipSkinDataFromID().equip_type) do
		if table.contains(EquipType.AircraftSkinType, slot13) then
			slot8 = true
		end
	end

	if slot8 then
		if slot2 ~= "" then
			slot1[#slot1 + 1] = slot1.GetCharacterGoPath(slot2)
		end
	else
		slot6(slot2)
	end

	slot6(slot3)
	slot6(slot4)
	slot6(slot5)

	return slot1
end

function slot5.GetAidUnitsRes(slot0)
	slot1 = {}

	for slot5, slot6 in ipairs(slot0) do
		slot7 = slot0.GetShipResource(slot6.tmpID, nil, true)

		for slot11, slot12 in ipairs(slot6.equipment) do
			if slot12 ~= 0 then
				if slot11 <= Ship.WEAPON_COUNT then
					for slot17, slot18 in ipairs(slot13) do
						for slot23, slot24 in ipairs(slot19) do
							table.insert(slot7, slot24)
						end
					end
				else
					for slot17, slot18 in ipairs(slot13) do
						table.insert(slot7, slot18)
					end
				end
			end
		end

		for slot11, slot12 in ipairs(slot7) do
			table.insert(slot1, slot12)
		end
	end

	return slot1
end

return
