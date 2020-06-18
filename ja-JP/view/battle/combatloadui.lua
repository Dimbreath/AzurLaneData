slot0 = class("CombatLoadUI", import("..base.BaseUI"))
slot0._loadObs = nil
slot0.LOADING_ANIMA_DISTANCE = 1820

function slot0.getUIName(slot0)
	return "CombatLoadUI"
end

function slot0.init(slot0)
	slot1 = slot0:findTF("loading")
	slot0._loadingProgress = slot1:Find("loading_bar"):GetComponent(typeof(Slider))
	slot0._loadingProgress.value = 0
	slot0._loadingText = slot1:Find("loading_label/percent"):GetComponent(typeof(Text))
	slot0._loadingAnima = slot1:Find("loading_anima")
	slot0._loadingAnimaPosY = slot0._loadingAnima.anchoredPosition.y
	slot0._finishAnima = slot1:Find("done_anima")

	SetActive(slot0._loadingAnima, true)
	SetActive(slot0._finishAnima, false)
	slot0._finishAnima:GetComponent("DftAniEvent"):SetEndEvent(function (slot0)
		uv0:emit(CombatLoadMediator.FINISH, uv0._loadObs)
	end)

	slot3 = slot0._tf:Find("bg")
	slot4 = slot0._tf:Find("bg2")

	SetActive(slot3, slot5 ~= 1)
	SetActive(slot4, slot5 == 1)
	setImageSprite(PlayerPrefs.GetInt("bgFitMode", 0) == 1 and slot4 or slot3, LoadSprite("loadingbg/bg_" .. math.random(1, BG_RANDOM_RANGE)))

	slot0._tipsText = slot1:Find("tipsText"):GetComponent(typeof(Text))
end

function slot0.didEnter(slot0)
	slot0:Preload()
end

function slot0.onBackPressed(slot0)
end

function slot0.Preload(slot0)
	PoolMgr.GetInstance():DestroyAllSprite()

	slot0._loadObs = {}
	slot0._toLoad = {}

	ys.Battle.BattleFXPool.GetInstance():Init()
	ys.Battle.BattleResourceManager.GetInstance():Init()

	slot2 = getProxy(BayProxy)

	if slot0.contextData.system == SYSTEM_DEBUG then
		for slot10, slot11 in ipairs(slot2:getShipsByFleet(getProxy(FleetProxy):getFleetById(slot0.contextData.mainFleetId))) do
			-- Nothing
		end

		for slot10, slot11 in pairs({
			[slot11.configId] = slot11
		}) do
			if type(slot10) == "number" then
				slot1:AddPreloadCV(slot11.skinId)

				slot16 = slot11.skinId
				slot17 = true

				slot1:AddPreloadResource(slot1.GetShipResource(slot10, slot16, slot17))

				slot12 = ys.Battle.BattleDataFunction.GetPlayerShipTmpDataFromID(slot10)

				for slot16, slot17 in ipairs(slot11:getActiveEquipments()) do
					if slot16 <= Ship.WEAPON_COUNT then
						slot18, slot19 = nil
						slot20 = 0

						if not slot17 then
							slot18 = slot12.default_equip_list[slot16]
						else
							slot18 = slot17.configId
							slot20 = slot17.skinId
						end

						for slot25, slot26 in ipairs(ys.Battle.BattleDataFunction.GetWeaponDataFromID(slot18).weapon_id) do
							slot1:AddPreloadResource(slot1.GetWeaponResource(slot26, slot20))
						end
					elseif slot17 then
						slot1:AddPreloadResource(slot1.GetEquipResource(slot17.configId, slot17.skinId))
					end
				end

				for slot16, slot17 in ipairs(slot12.depth_charge_list) do
					for slot22, slot23 in ipairs(ys.Battle.BattleDataFunction.GetWeaponDataFromID(slot17).weapon_id) do
						slot1:AddPreloadResource(slot1.GetWeaponResource(slot23))
					end
				end

				for slot16, slot17 in ipairs(slot12.fix_equip_list) do
					for slot22, slot23 in ipairs(ys.Battle.BattleDataFunction.GetWeaponDataFromID(slot17).weapon_id) do
						slot1:AddPreloadResource(slot1.GetWeaponResource(slot23))
					end
				end

				slot17 = slot11.skinId

				for slot17, slot18 in pairs(ys.Battle.BattleDataFunction.GetBuffBulletRes(slot10, slot11.skills, slot0.contextData.system, slot17)) do
					slot1:AddPreloadResource(slot18)
				end
			end
		end

		for slot10, slot11 in pairs(pg.aircraft_template) do
			if type(slot10) == "number" then
				slot1:AddPreloadResource(slot1.GetAircraftResource(slot10, {}))
			end
		end
	else
		slot3 = {}
		slot4 = {}

		if slot0.contextData.system == SYSTEM_SCENARIO then
			for slot12, slot13 in ipairs(getProxy(ChapterProxy):getActiveChapter().fleet:getShips(false)) do
				table.insert(slot3, slot13)
			end

			slot9, slot10 = slot6:getFleetBattleBuffs(slot7)

			uv0.addCommanderBuffRes(slot10)
			uv0.addChapterBuffRes(slot9)
			uv0.addChapterAuraRes(slot5.GetChapterAuraBuffs(slot6))

			slot13 = {}

			for slot17, slot18 in pairs(slot5.GetChapterAidBuffs(slot6)) do
				for slot22, slot23 in ipairs(slot18) do
					table.insert(slot13, slot23)
				end
			end

			uv0.addChapterAuraRes(slot13)

			slot14, slot15 = slot5.getSubAidFlag(slot6)

			if slot14 == true or slot14 > 0 then
				for slot20, slot21 in ipairs(slot15:getShipsByTeam(TeamType.Submarine, false)) do
					table.insert(slot3, slot21)
				end

				slot17, slot18 = slot6:getFleetBattleBuffs(slot15)

				uv0.addCommanderBuffRes(slot18)
				uv0.addChapterBuffRes(slot17)
			end
		elseif slot0.contextData.system == SYSTEM_HP_SHARE_ACT_BOSS or slot0.contextData.system == SYSTEM_ACT_BOSS or slot0.contextData.system == SYSTEM_BOSS_EXPERIMENT then
			if getProxy(FleetProxy):getActivityFleets()[slot0.contextData.actId][slot0.contextData.mainFleetId] then
				for slot12, slot13 in ipairs(slot7.ships) do
					table.insert(slot3, slot2:getShipById(slot13))
				end

				uv0.addCommanderBuffRes(slot7:buildBattleBuffList())
			end

			if slot6[slot0.contextData.mainFleetId + 10] then
				for slot13, slot14 in ipairs(slot8:getTeamByName(TeamType.Submarine)) do
					table.insert(slot3, slot2:getShipById(slot14))
				end

				uv0.addCommanderBuffRes(slot8:buildBattleBuffList())
			end
		elseif slot0.contextData.system == SYSTEM_CHALLENGE then
			ships = getProxy(ChallengeProxy):getUserChallengeInfo(slot0.contextData.mode):getRegularFleet():getShips(false)

			for slot11, slot12 in ipairs(ships) do
				table.insert(slot3, slot12)
			end

			uv0.addCommanderBuffRes(slot7:buildBattleBuffList())

			ships = slot6:getSubmarineFleet():getShips(false)

			for slot11, slot12 in ipairs(ships) do
				table.insert(slot3, slot12)
			end

			uv0.addCommanderBuffRes(slot7:buildBattleBuffList())
		elseif slot0.contextData.mainFleetId then
			for slot11, slot12 in ipairs(slot2:getShipsByFleet(getProxy(FleetProxy):getFleetById(slot0.contextData.mainFleetId))) do
				table.insert(slot3, slot12)
			end
		end

		if slot0.contextData.rivalId then
			for slot11, slot12 in ipairs(getProxy(MilitaryExerciseProxy):getRivalById(slot0.contextData.rivalId):getShips()) do
				table.insert(slot3, slot12)
			end
		end

		if slot0.contextData.prefabFleet then
			slot6 = slot0.contextData.prefabFleet.vanguard_unitList
			slot7 = slot0.contextData.prefabFleet.submarine_unitList

			if slot0.contextData.prefabFleet.main_unitList then
				for slot11, slot12 in ipairs(slot5) do
					table.insert(slot3, {
						configId = slot12.configId,
						equipments = slot12.equipment,
						skinId = slot12.skinId,
						getActiveEquipments = function (slot0)
							return slot0.equipments
						end
					})
				end
			end

			if slot6 then
				for slot11, slot12 in ipairs(slot6) do
					table.insert(slot3, {
						configId = slot12.configId,
						equipments = slot12.equipment,
						skinId = slot12.skinId,
						getActiveEquipments = function (slot0)
							return slot0.equipments
						end
					})
				end
			end

			if slot7 then
				for slot11, slot12 in ipairs(slot7) do
					table.insert(slot3, {
						configId = slot12.configId,
						equipments = slot12.equipment,
						skinId = slot12.skinId,
						getActiveEquipments = function (slot0)
							return slot0.equipments
						end
					})
				end
			end
		end

		for slot8, slot9 in ipairs(slot3) do
			slot1:AddPreloadCV(slot9.skinId)

			slot14 = slot9.skinId
			slot15 = true

			slot1:AddPreloadResource(slot1.GetShipResource(slot9.configId, slot14, slot15))

			slot10 = ys.Battle.BattleDataFunction.GetPlayerShipTmpDataFromID(slot9.configId)

			for slot14, slot15 in ipairs(slot9:getActiveEquipments()) do
				if slot14 <= Ship.WEAPON_COUNT then
					slot16, slot17 = nil
					slot18 = 0

					if not slot15 then
						slot16 = slot10.default_equip_list[slot14]
					else
						slot16 = slot15.configId
						slot18 = slot15.skinId
					end

					for slot23, slot24 in ipairs(ys.Battle.BattleDataFunction.GetWeaponDataFromID(slot16).weapon_id) do
						slot1:AddPreloadResource(slot1.GetWeaponResource(slot24, slot18))
					end
				elseif slot15 then
					slot1:AddPreloadResource(slot1.GetEquipResource(slot15.configId, slot15.skinId))
				end
			end

			for slot14, slot15 in ipairs(slot10.depth_charge_list) do
				for slot20, slot21 in ipairs(ys.Battle.BattleDataFunction.GetWeaponDataFromID(slot15).weapon_id) do
					slot1:AddPreloadResource(slot1.GetWeaponResource(slot21))
				end
			end

			for slot14, slot15 in ipairs(slot10.fix_equip_list) do
				for slot20, slot21 in ipairs(ys.Battle.BattleDataFunction.GetWeaponDataFromID(slot15).weapon_id) do
					slot1:AddPreloadResource(slot1.GetWeaponResource(slot21))
				end
			end

			slot15 = slot9.skinId

			for slot15, slot16 in pairs(ys.Battle.BattleDataFunction.GetBuffBulletRes(slot9.configId, slot9.skills, slot0.contextData.system, slot15)) do
				slot1:AddPreloadResource(slot16)
			end
		end
	end

	slot5, slot6 = slot1.GetStageResource(pg.expedition_data_template[slot0.contextData.stageId].dungeon_id)

	slot1:AddPreloadResource(slot5)

	slot10 = pg.expedition_data_template[slot0.contextData.stageId].map_id

	slot1:AddPreloadResource(slot1.GetMapResource(slot10))
	slot1:AddPreloadResource(slot1.GetCommonResource())
	slot1:AddPreloadResource(slot1.GetBuffResource())

	for slot10, slot11 in ipairs(slot6) do
		slot1:AddPreloadCV(slot11)
	end

	slot8 = 0
	slot8 = slot1:StartPreload(function ()
		SetActive(uv0._loadingAnima, false)
		SetActive(uv0._finishAnima, true)

		uv0._finishAnima:GetComponent("Animator").enabled = true
	end, function (slot0)
		slot1 = nil
		slot1 = uv0 == 0 and 0 or slot0 / uv0
		uv1._loadingProgress.value = slot1
		uv1._loadingText.text = string.format("%.2f", slot1 * 100) .. "%"
		uv1._loadingAnima.anchoredPosition = Vector2(slot1 * uv2.LOADING_ANIMA_DISTANCE, uv1._loadingAnimaPosY)
	end)
	slot0._tipsText.text = pg.server_language[math.random(#pg.server_language)].content
end

function slot0.addCommanderBuffRes(slot0)
	slot1 = ys.Battle.BattleResourceManager.GetInstance()

	for slot5, slot6 in ipairs(slot0) do
		for slot11, slot12 in ipairs(slot1.GetCommanderResource(slot6)) do
			slot1:AddPreloadResource(slot12)
		end
	end
end

function slot0.addChapterBuffRes(slot0)
	slot1 = ys.Battle.BattleResourceManager.GetInstance()

	for slot5, slot6 in ipairs(slot0) do
		for slot11, slot12 in ipairs(ys.Battle.BattleDataFunction.GetResFromBuff(slot6, 1, {})) do
			slot1:AddPreloadResource(slot12)
		end
	end
end

function slot0.addChapterAuraRes(slot0)
	slot1 = ys.Battle.BattleResourceManager.GetInstance()

	for slot5, slot6 in ipairs(slot0) do
		for slot11, slot12 in ipairs(ys.Battle.BattleDataFunction.GetResFromBuff(slot6.id, slot6.level, {})) do
			slot1:AddPreloadResource(slot12)
		end
	end
end

function slot0.StartLoad(slot0, slot1, slot2, slot3)
	slot0._toLoad[slot3] = 1

	LoadAndInstantiateAsync(slot1, slot2, function (slot0)
		uv0:LoadFinish(slot0, uv1)
	end)
end

function slot0.LoadFinish(slot0, slot1, slot2)
	slot0._loadObs.map = slot1
	slot0._toLoad.map = nil

	if table.getCount(slot0._toLoad) <= 0 then
		slot0._go:GetComponent("Animator"):Play("start")
	end
end

return slot0
