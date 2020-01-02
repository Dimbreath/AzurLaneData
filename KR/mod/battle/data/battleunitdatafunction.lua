ys = ys or {}
slot1 = ys.Battle.BattleConst
slot2 = ys.Battle.BattleConfig
slot3 = pg.ship_data_statistics
slot4 = pg.ship_data_template
slot5 = pg.ship_skin_template
slot6 = pg.enemy_data_statistics
slot7 = pg.weapon_property
slot8 = pg.formation_template
slot9 = pg.auto_pilot_template
slot10 = pg.aircraft_template
slot11 = pg.ship_skin_words
slot12 = pg.equip_data_statistics
slot13 = pg.equip_data_template
slot14 = pg.enemy_data_skill
slot15 = pg.ship_data_personality
slot16 = pg.enemy_data_by_type
slot17 = pg.ship_data_by_type
slot18 = pg.ship_level
slot19 = pg.skill_data_template
slot20 = pg.ship_data_trans
slot21 = pg.equip_skin_template
slot22 = pg.activity_template
slot23 = pg.activity_event_worldboss
slot24 = pg.map_data
ys.Battle.BattleDataFunction = ys.Battle.BattleDataFunction or {}

ys or .Battle.BattleDataFunction.CreateBattleUnitData = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12)
	slot13, slot14 = nil

	if slot1 == slot0.UnitType.PLAYER_UNIT then
		slot1.Battle.BattlePlayerUnit.New(slot0, slot2).SetSkinId(slot13, slot4)
		slot1.Battle.BattlePlayerUnit.New(slot0, slot2).SetRepressReduce(slot13, slot9)
		slot1.Battle.BattlePlayerUnit.New(slot0, slot2):SetWeaponInfo(slot11, slot12)

		slot14 = Ship.WEAPON_COUNT
	elseif slot1 == slot0.UnitType.SUB_UNIT then
		slot1.Battle.BattleSubUnit.New(slot0, slot2).SetSkinId(slot13, slot4)
		slot1.Battle.BattleSubUnit.New(slot0, slot2).SetRepressReduce(slot13, slot9)
		slot1.Battle.BattleSubUnit.New(slot0, slot2):SetWeaponInfo(slot11, slot12)

		slot14 = Ship.WEAPON_COUNT
	elseif slot1 == slot0.UnitType.ENEMY_UNIT then
		slot1.Battle.BattleEnemyUnit.New(slot0, slot2):SetRepress(slot8)
	elseif slot1 == slot0.UnitType.BOSS_UNIT then
		slot1.Battle.BattleBossUnit.New(slot0, slot2):SetRepress(slot8)
	elseif slot1 == slot0.UnitType.NPC_UNIT then
		slot13 = slot1.Battle.BattleNPCUnit.New(slot0, slot2)
	end

	slot13:SetTemplate(slot3, slot6)

	if slot1 == slot0.UnitType.ENEMY_UNIT or slot1 == slot0.UnitType.BOSS_UNIT then
		slot13:SetCurrentHP(slot13:GetMaxHP() * slot10)
	end

	slot15 = {}

	if slot1 == slot0.UnitType.ENEMY_UNIT or slot1 == slot0.UnitType.BOSS_UNIT then
		for slot19, slot20 in ipairs(slot5) do
			slot15[#slot15 + 1] = {
				equipment = {
					weapon_id = {
						slot20.id
					}
				}
			}
		end
	else
		for slot19, slot20 in ipairs(slot5) do
			if not slot20.id then
				slot15[#slot15 + 1] = {
					equipment = false,
					torpedoAmmo = 0,
					skin = slot20.skin
				}
			else
				slot21 = (slot20.equipmentInfo and slot20.equipmentInfo.config.torpedo_ammo) or 0

				if not slot14 or slot19 <= slot14 or #slot2.GetWeaponDataFromID(slot20.id).weapon_id then
					slot15[#slot15 + 1] = {
						equipment = slot2.GetWeaponDataFromID(slot20.id),
						skin = slot20.skin,
						torpedoAmmo = slot21
					}
				else
					slot15[#slot15 + 1] = {
						equipment = false,
						skin = slot20.skin,
						torpedoAmmo = slot21
					}
				end
			end
		end
	end

	slot13:SetProficiencyList(slot7)
	slot13:SetEquipment(slot15)

	return slot13
end

ys or .Battle.BattleDataFunction.InitUnitSkill = function (slot0, slot1)
	slot2 = slot0.skills or {}

	for slot6, slot7 in pairs(slot2) do
		slot1:AddBuff(slot0.Battle.BattleBuffUnit.New(slot7.id, slot7.level, slot1))
	end
end

ys or .Battle.BattleDataFunction.GetEquipSkill = function (slot0)
	slot1 = Ship.WEAPON_COUNT
	slot2 = {}

	for slot6, slot7 in ipairs(slot0) do
		if slot7.id then
			slot9 = nil

			if slot1 and slot1 < slot6 then
				if slot0.GetWeaponDataFromID(slot8) ~= nil then
					slot9 = slot10.skill_id
				end
			else
				slot9 = slot0.GetWeaponDataFromID(slot8).skill_id
			end

			if type(slot7.equipmentInfo) == "table" then
				slot9 = table.merge(slot9, slot7.equipmentInfo:GetAffixBuffList(), true)
			end

			for slot13, slot14 in ipairs(slot9) do
				table.insert(slot2, slot14)
			end
		end
	end

	return slot2
end

ys or .Battle.BattleDataFunction.InitEquipSkill = function (slot0, slot1)
	for slot6, slot7 in ipairs(slot2) do
		slot1:AddBuff(slot1.Battle.BattleBuffUnit.New(slot7, 1, slot1))
	end
end

ys or .Battle.BattleDataFunction.InitCommanderSkill = function (slot0, slot1)
	slot2 = slot0 or {}.Battle.BattleState.GetInstance():GetBattleType()

	for slot6, slot7 in pairs(slot0) do
		slot9 = false

		if slot0.Battle.BattleDataFunction.GetBuffTemplate(slot7.id, slot7.level).limit then
			for slot13, slot14 in ipairs(slot8) do
				if slot2 == slot14 then
					slot9 = true

					break
				end
			end
		end

		if not slot9 then
			slot10 = slot0.Battle.BattleBuffUnit.New(slot7.id, slot7.level, slot1)

			slot10:SetCommander(slot7.commander)
			slot1:AddBuff(slot10)
		end
	end
end

ys or .Battle.BattleDataFunction.CreateWeaponUnit = function (slot0, slot1, slot2, slot3, slot4)
	slot3 = slot3 or -1
	slot5 = slot1:GetUnitType()
	slot6 = nil
	slot8 = slot4 or slot0:GetWeaponPropertyDataFromID().type

	if slot8 == slot1.EquipmentType.MAIN_CANNON then
		slot6 = slot2.Battle.BattleWeaponUnit.New()
	elseif slot8 == slot1.EquipmentType.SUB_CANNON then
		slot6 = slot2.Battle.BattleWeaponUnit.New()
	elseif slot8 == slot1.EquipmentType.TORPEDO then
		slot6 = slot2.Battle.BattleTorpedoUnit.New()
	elseif slot8 == slot1.EquipmentType.MANUAL_TORPEDO then
		slot6 = slot2.Battle.BattleManualTorpedoUnit.New()
	elseif slot8 == slot1.EquipmentType.ANTI_AIR then
		slot6 = slot2.Battle.BattleAntiAirUnit.New()
	elseif slot8 == slot1.EquipmentType.FLEET_ANTI_AIR then
		slot6 = slot2.Battle.BattleWeaponUnit.New()
	elseif slot8 == slot1.EquipmentType.SCOUT or slot8 == slot1.EquipmentType.PASSIVE_SCOUT then
		slot6 = slot2.Battle.BattleHiveUnit.New()
	elseif slot8 == slot1.EquipmentType.SPECIAL then
		slot6 = slot2.Battle.BattleSpecialWeapon.New()
	elseif slot8 == slot1.EquipmentType.ANTI_SEA then
		slot6 = slot2.Battle.BattleDirectHitWeaponUnit.New()
	elseif slot8 == slot1.EquipmentType.HAMMER_HEAD then
		slot6 = slot2.Battle.BattleHammerHeadWeaponUnit.New()
	elseif slot8 == slot1.EquipmentType.BOMBER_PRE_CAST_ALERT then
		slot6 = slot2.Battle.BattleBombWeaponUnit.New()
	elseif slot8 == slot1.EquipmentType.POINT_HIT_AND_LOCK then
		slot6 = slot2.Battle.BattlePointHitWeaponUnit.New()
	elseif slot8 == slot1.EquipmentType.BEAM then
		slot6 = slot2.Battle.BattleLaserUnit.New()
	elseif slot8 == slot1.EquipmentType.DEPTH_CHARGE then
		slot6 = slot2.Battle.BattleDepthChargeUnit.New()
	elseif slot8 == slot1.EquipmentType.REPEATER_ANTI_AIR then
		slot6 = slot2.Battle.BattleRepeaterAntiAirUnit.New()
	elseif slot8 == slot1.EquipmentType.DISPOSABLE_TORPEDO then
		slot6 = slot2.Battle.BattleDisposableTorpedoUnit.New()
	end

	slot6:SetPotentialFactor(slot2)
	slot6:SetEquipmentIndex(slot3)
	slot6:SetTemplateData(slot7)
	slot6:SetHostData(slot1)

	if slot5 == slot1.UnitType.PLAYER_UNIT then
		if slot7.auto_aftercast > 0 then
			slot6:OverrideGCD(slot7.auto_aftercast)
		end
	elseif slot5 == slot1.UnitType.ENEMY_UNIT or slot1.UnitType.BOSS_UNIT then
		slot6:HostOnEnemy()
	end

	if slot7.type == slot1.EquipmentType.SCOUT or slot7.type == slot1.EquipmentType.PASSIVE_SCOUT then
		slot6:EnterCoolDown()
	end

	return slot6
end

ys or .Battle.BattleDataFunction.CreateAircraftUnit = function (slot0, slot1, slot2, slot3)
	slot4 = nil

	(type(slot0.GetAircraftTmpDataFromID(slot1).funnel_behavior) ~= "table" or ((not slot5.funnel_behavior.hover_range or slot1.Battle.BattelUAVUnit.New(slot0)) and slot1.Battle.BattleFunnelUnit.New(slot0))) and slot1.Battle.BattleAircraftUnit.New(slot0):SetMotherUnit(slot2)
	(type(slot0.GetAircraftTmpDataFromID(slot1).funnel_behavior) ~= "table" or ((not slot5.funnel_behavior.hover_range or slot1.Battle.BattelUAVUnit.New(slot0)) and slot1.Battle.BattleFunnelUnit.New(slot0))) and slot1.Battle.BattleAircraftUnit.New(slot0):SetWeanponPotential(slot3)
	(type(slot0.GetAircraftTmpDataFromID(slot1).funnel_behavior) ~= "table" or ((not slot5.funnel_behavior.hover_range or slot1.Battle.BattelUAVUnit.New(slot0)) and slot1.Battle.BattleFunnelUnit.New(slot0))) and slot1.Battle.BattleAircraftUnit.New(slot0):SetTemplate(slot5)

	return (type(slot0.GetAircraftTmpDataFromID(slot1).funnel_behavior) ~= "table" or ((not slot5.funnel_behavior.hover_range or slot1.Battle.BattelUAVUnit.New(slot0)) and slot1.Battle.BattleFunnelUnit.New(slot0))) and slot1.Battle.BattleAircraftUnit.New(slot0)
end

ys or .Battle.BattleDataFunction.CreateAllInStrike = function (slot0)
	slot3 = 0
	slot4 = {}

	for slot8, slot9 in ipairs(slot0.GetPlayerShipModelFromID(slot1).airassist_time) do
		slot10 = slot1.Battle.BattleAllInStrike.New(slot9)

		slot10:SetHost(slot0)

		slot4[slot8] = slot10
	end

	return slot4
end

ys or .Battle.BattleDataFunction.ExpandAllinStrike = function (slot0)
	if #slot0.GetPlayerShipModelFromID(slot1).airassist_time > 0 then
		slot5 = slot1.Battle.BattleAllInStrike.New(slot4)

		slot5:SetHost(slot0)
		slot0:GetFleetVO():GetAirAssistVO():AppendWeapon(slot5)
		slot5:OverHeat()
		slot0:GetAirAssistQueue():AppendWeapon(slot5)

		slot0:GetAirAssistList()[#slot0.GetAirAssistList() + 1] = slot5
	end
end

ys or .Battle.BattleDataFunction.CreateAirFighterUnit = function (slot0, slot1)
	slot1.Battle.BattleAirFighterUnit.New(slot0).SetWeaponTemplateID(nil, slot1.weaponID)
	slot1.Battle.BattleAirFighterUnit.New(slot0):SetTemplate(slot0.GetAircraftTmpDataFromID(slot1.templateID))

	return slot1.Battle.BattleAirFighterUnit.New(slot0)
end

ys or .Battle.BattleDataFunction.GetPlayerShipTmpDataFromID = function (slot0)
	return Clone(slot0[slot0])
end

ys or .Battle.BattleDataFunction.GetPlayerShipModelFromID = function (slot0)
	return slot0[slot0]
end

ys or .Battle.BattleDataFunction.GetPlayerShipSkinDataFromID = function (slot0)
	return slot0[slot0]
end

ys or .Battle.BattleDataFunction.GetShipTypeTmp = function (slot0)
	return slot0[slot0]
end

ys or .Battle.BattleDataFunction.GetMonsterTmpDataFromID = function (slot0)
	return slot0[slot0]
end

ys or .Battle.BattleDataFunction.GetAircraftTmpDataFromID = function (slot0)
	return slot0[slot0]
end

ys or .Battle.BattleDataFunction.GetWeaponDataFromID = function (slot0)
	if slot0 ~= Equipment.EQUIPMENT_STATE_EMPTY and slot0 ~= Equipment.EQUIPMENT_STATE_LOCK then
	end

	return slot0[slot0]
end

ys or .Battle.BattleDataFunction.GetEquipDataTemplate = function (slot0)
	return slot0[slot0]
end

ys or .Battle.BattleDataFunction.GetWeaponPropertyDataFromID = function (slot0)
	return slot0[slot0]
end

ys or .Battle.BattleDataFunction.GetFormationTmpDataFromID = function (slot0)
	return slot0[slot0]
end

ys or .Battle.BattleDataFunction.GetAITmpDataFromID = function (slot0)
	return slot0[slot0]
end

ys or .Battle.BattleDataFunction.GetShipPersonality = function (slot0)
	return slot0[slot0]
end

ys or .Battle.BattleDataFunction.GetEnemyTypeDataByType = function (slot0)
	return slot0[slot0]
end

ys or .Battle.BattleDataFunction.GetArenaBuffByShipType = function (slot0)
	return slot0:GetShipTypeTmp().arena_buff
end

ys or .Battle.BattleDataFunction.GetPlayerUnitDurabilityExtraAddition = function (slot0, slot1)
	if slot0 == SYSTEM_DUEL or slot0 == SYSTEM_SHAM then
		return slot0[slot1].arena_durability_ratio, slot0[slot1].arena_durability_add
	else
		return 1, 0
	end
end

ys or .Battle.BattleDataFunction.GetSkillDataTemplate = function (slot0)
	return slot0[slot0]
end

ys or .Battle.BattleDataFunction.GetShipTransformDataTemplate = function (slot0)
	return slot1[slot0:GetPlayerShipModelFromID().group_type]
end

ys or .Battle.BattleDataFunction.GetEquipSkinDataFromID = function (slot0)
	return slot0[slot0]
end

ys or .Battle.BattleDataFunction.GetEquipSkin = function (slot0)
	return slot0[slot0].bullet_name, slot0[slot0].derivate_bullet, slot0[slot0].derivate_torpedo, slot0[slot0].derivate_boom
end

ys or .Battle.BattleDataFunction.GetSpecificEnemyList = function (slot0, slot1)
	slot5 = nil

	for slot9, slot10 in ipairs(slot4) do
		if slot10[1] == slot1 then
			slot5 = slot10[2]

			break
		end
	end

	return slot5
end

ys or .Battle.BattleDataFunction.IncreaseAttributes = function (slot0, slot1, slot2)
	for slot6, slot7 in ipairs(slot2) do
		if slot7[slot1] ~= nil and type(slot7[slot1]) == "number" then
			slot0 = slot0 + slot7[slot1]
		end
	end
end

ys or .Battle.BattleDataFunction.CreateAirFighterWeaponUnit = function (slot0, slot1, slot2, slot3)
	slot4 = nil

	if slot0:GetWeaponPropertyDataFromID().type == slot1.EquipmentType.MAIN_CANNON then
		slot4 = slot2.Battle.BattleWeaponUnit.New()
	elseif slot5.type == slot1.EquipmentType.SUB_CANNON then
		slot4 = slot2.Battle.BattleWeaponUnit.New()
	elseif slot5.type == slot1.EquipmentType.TORPEDO then
		slot4 = slot2.Battle.BattleTorpedoUnit.New()
	elseif slot5.type == slot1.EquipmentType.ANTI_AIR then
		slot4 = slot2.Battle.BattleAntiAirUnit.New()
	elseif slot5.type == slot1.EquipmentType.ANTI_SEA then
		slot4 = slot2.Battle.BattleDirectHitWeaponUnit.New()
	elseif slot5.type == slot1.EquipmentType.HAMMER_HEAD then
		slot4 = slot2.Battle.BattleHammerHeadWeaponUnit.New()
	elseif slot5.type == slot1.EquipmentType.BOMBER_PRE_CAST_ALERT then
		slot4 = slot2.Battle.BattleBombWeaponUnit.New()
	elseif slot5.type == slot1.EquipmentType.DEPTH_CHARGE then
		slot4 = slot2.Battle.BattleDepthChargeUnit.New()
	end

	slot4:SetPotentialFactor(slot3)

	Clone(slot5).spawn_bound = "weapon"

	slot4:SetTemplateData(slot6)
	slot4:SetHostData(slot1, slot2)

	return slot4
end

ys or .Battle.BattleDataFunction.GetWords = function (slot0, slot1, slot2)
	if (type(ShipWordHelper.RawGetWord(slot0, slot1)) == "string" and slot3 == "") or (type(slot3) == "table" and #slot3 == 0) then
		return ShipWordHelper.RawGetWord(slot2, slot1)
	else
		return slot3
	end
end

ys or .Battle.BattleDataFunction.SkillTranform = function (slot0, slot1)
	if slot0.GetSkillDataTemplate(slot1).system_transform[slot0] == nil then
		return slot1
	else
		return slot3[slot0]
	end
end

ys or .Battle.BattleDataFunction.GenerateHiddenBuff = function (slot0)
	slot2 = {}

	for slot6, slot7 in ipairs(slot1) do
		slot2[slot7] = {
			level = 1,
			id = slot7
		}
	end

	return slot2
end

ys or .Battle.BattleDataFunction.GetDivingFilter = function (slot0)
	return slot0[slot0].diving_filter
end

ys or .Battle.BattleDataFunction.GeneratePlayerSubmarinPhase = function (slot0, slot1, slot2, slot3, slot4)
	return {
		{
			index = 0,
			switchType = 3,
			switchTo = 1,
			switchParam = slot0 - slot2
		},
		{
			index = 1,
			dive = "STATE_RAID",
			switchTo = 2,
			switchType = 1,
			switchParamFunc = slot3
		},
		{
			switchType = 1,
			dive = "STATE_FLOAT",
			switchTo = 3,
			index = 2,
			switchParam = slot4
		},
		{
			switchType = 4,
			dive = "STATE_RETREAT",
			switchTo = 4,
			index = 3,
			switchParam = slot1
		},
		{
			index = 4,
			retreat = true
		}
	}
end

return
