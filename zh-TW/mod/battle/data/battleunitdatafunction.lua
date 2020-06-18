ys = ys or {}
slot0 = ys
slot1 = slot0.Battle.BattleConst
slot2 = slot0.Battle.BattleConfig
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
slot0.Battle.BattleDataFunction = slot0.Battle.BattleDataFunction or {}
slot25 = slot0.Battle.BattleDataFunction

function slot25.CreateBattleUnitData(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13)
	slot14, slot15 = nil

	if slot1 == uv0.UnitType.PLAYER_UNIT then
		slot14 = uv1.Battle.BattlePlayerUnit.New(slot0, slot2)

		slot14:SetSkinId(slot4)
		slot14:SetRepressReduce(slot9)
		slot14:SetWeaponInfo(slot11, slot12)

		slot15 = Ship.WEAPON_COUNT
	elseif slot1 == uv0.UnitType.SUB_UNIT then
		slot14 = uv1.Battle.BattleSubUnit.New(slot0, slot2)

		slot14:SetSkinId(slot4)
		slot14:SetRepressReduce(slot9)
		slot14:SetWeaponInfo(slot11, slot12)

		slot15 = Ship.WEAPON_COUNT
	elseif slot1 == uv0.UnitType.ENEMY_UNIT then
		slot14 = uv1.Battle.BattleEnemyUnit.New(slot0, slot2)

		slot14:SetRepress(slot8)
		slot14:SetOverrideLevel(slot13)
	elseif slot1 == uv0.UnitType.BOSS_UNIT then
		slot14 = uv1.Battle.BattleBossUnit.New(slot0, slot2)

		slot14:SetRepress(slot8)
		slot14:SetOverrideLevel(slot13)
	elseif slot1 == uv0.UnitType.NPC_UNIT then
		slot14 = uv1.Battle.BattleNPCUnit.New(slot0, slot2)
	end

	slot14:SetTemplate(slot3, slot6)

	if slot1 == uv0.UnitType.ENEMY_UNIT or slot1 == uv0.UnitType.BOSS_UNIT then
		slot14:SetCurrentHP(slot14:GetMaxHP() * slot10)
	end

	slot16 = {}

	if slot1 == uv0.UnitType.ENEMY_UNIT or slot1 == uv0.UnitType.BOSS_UNIT then
		for slot20, slot21 in ipairs(slot5) do
			slot16[#slot16 + 1] = {
				equipment = {
					weapon_id = {
						slot21.id
					}
				}
			}
		end
	else
		for slot20, slot21 in ipairs(slot5) do
			if not slot21.id then
				slot16[#slot16 + 1] = {
					equipment = false,
					torpedoAmmo = 0,
					skin = slot21.skin
				}
			elseif not slot15 or slot20 <= slot15 or #uv2.GetWeaponDataFromID(slot21.id).weapon_id then
				slot16[#slot16 + 1] = {
					equipment = uv2.GetWeaponDataFromID(slot21.id),
					skin = slot21.skin,
					torpedoAmmo = slot21.equipmentInfo and slot21.equipmentInfo.config.torpedo_ammo or 0
				}
			else
				slot16[#slot16 + 1] = {
					equipment = false,
					skin = slot21.skin,
					torpedoAmmo = slot22
				}
			end
		end
	end

	slot14:SetProficiencyList(slot7)
	slot14:SetEquipment(slot16)

	return slot14
end

function slot25.InitUnitSkill(slot0, slot1)
	for slot6, slot7 in pairs(slot0.skills or {}) do
		slot1:AddBuff(uv0.Battle.BattleBuffUnit.New(slot7.id, slot7.level, slot1))
	end
end

function slot25.GetEquipSkill(slot0)
	slot1 = Ship.WEAPON_COUNT
	slot2 = {}

	for slot6, slot7 in ipairs(slot0) do
		if slot7.id then
			slot9 = nil

			if slot1 and slot1 < slot6 then
				if uv0.GetWeaponDataFromID(slot8) ~= nil then
					slot9 = slot10.skill_id
				end
			else
				slot9 = uv0.GetWeaponDataFromID(slot8).skill_id
			end

			for slot13, slot14 in ipairs(slot9) do
				table.insert(slot2, slot14)
			end
		end
	end

	return slot2
end

function slot25.InitEquipSkill(slot0, slot1)
	for slot6, slot7 in ipairs(uv0.GetEquipSkill(slot0)) do
		slot1:AddBuff(uv1.Battle.BattleBuffUnit.New(slot7, 1, slot1))
	end
end

function slot25.InitCommanderSkill(slot0, slot1)
	slot2 = uv0.Battle.BattleState.GetInstance():GetBattleType()

	for slot6, slot7 in pairs(slot0 or {}) do
		slot9 = false

		if uv0.Battle.BattleDataFunction.GetBuffTemplate(slot7.id, slot7.level).limit then
			for slot13, slot14 in ipairs(slot8) do
				if slot2 == slot14 then
					slot9 = true

					break
				end
			end
		end

		if not slot9 then
			slot10 = uv0.Battle.BattleBuffUnit.New(slot7.id, slot7.level, slot1)

			slot10:SetCommander(slot7.commander)
			slot1:AddBuff(slot10)
		end
	end
end

function slot25.CreateWeaponUnit(slot0, slot1, slot2, slot3, slot4)
	slot3 = slot3 or -1
	slot5 = slot1:GetUnitType()
	slot6 = nil

	if (slot4 or uv0.GetWeaponPropertyDataFromID(slot0).type) == uv1.EquipmentType.MAIN_CANNON then
		slot6 = uv2.Battle.BattleWeaponUnit.New()
	elseif slot8 == uv1.EquipmentType.SUB_CANNON then
		slot6 = uv2.Battle.BattleWeaponUnit.New()
	elseif slot8 == uv1.EquipmentType.TORPEDO then
		slot6 = uv2.Battle.BattleTorpedoUnit.New()
	elseif slot8 == uv1.EquipmentType.MANUAL_TORPEDO then
		slot6 = uv2.Battle.BattleManualTorpedoUnit.New()
	elseif slot8 == uv1.EquipmentType.ANTI_AIR then
		slot6 = uv2.Battle.BattleAntiAirUnit.New()
	elseif slot8 == uv1.EquipmentType.FLEET_ANTI_AIR then
		slot6 = uv2.Battle.BattleWeaponUnit.New()
	elseif slot8 == uv1.EquipmentType.SCOUT or slot8 == uv1.EquipmentType.PASSIVE_SCOUT then
		slot6 = uv2.Battle.BattleHiveUnit.New()
	elseif slot8 == uv1.EquipmentType.SPECIAL then
		slot6 = uv2.Battle.BattleSpecialWeapon.New()
	elseif slot8 == uv1.EquipmentType.ANTI_SEA then
		slot6 = uv2.Battle.BattleDirectHitWeaponUnit.New()
	elseif slot8 == uv1.EquipmentType.HAMMER_HEAD then
		slot6 = uv2.Battle.BattleHammerHeadWeaponUnit.New()
	elseif slot8 == uv1.EquipmentType.BOMBER_PRE_CAST_ALERT then
		slot6 = uv2.Battle.BattleBombWeaponUnit.New()
	elseif slot8 == uv1.EquipmentType.POINT_HIT_AND_LOCK then
		slot6 = uv2.Battle.BattlePointHitWeaponUnit.New()
	elseif slot8 == uv1.EquipmentType.BEAM then
		slot6 = uv2.Battle.BattleLaserUnit.New()
	elseif slot8 == uv1.EquipmentType.DEPTH_CHARGE then
		slot6 = uv2.Battle.BattleDepthChargeUnit.New()
	elseif slot8 == uv1.EquipmentType.REPEATER_ANTI_AIR then
		slot6 = uv2.Battle.BattleRepeaterAntiAirUnit.New()
	elseif slot8 == uv1.EquipmentType.DISPOSABLE_TORPEDO then
		slot6 = uv2.Battle.BattleDisposableTorpedoUnit.New()
	end

	slot6:SetPotentialFactor(slot2)
	slot6:SetEquipmentIndex(slot3)
	slot6:SetTemplateData(slot7)
	slot6:SetHostData(slot1)

	if slot5 == uv1.UnitType.PLAYER_UNIT then
		if slot7.auto_aftercast > 0 then
			slot6:OverrideGCD(slot7.auto_aftercast)
		end
	elseif slot5 == uv1.UnitType.ENEMY_UNIT or uv1.UnitType.BOSS_UNIT then
		slot6:HostOnEnemy()
	end

	if slot7.type == uv1.EquipmentType.SCOUT or slot7.type == uv1.EquipmentType.PASSIVE_SCOUT then
		slot6:EnterCoolDown()
	end

	return slot6
end

function slot25.CreateAircraftUnit(slot0, slot1, slot2, slot3)
	slot4 = nil
	slot4 = (type(uv0.GetAircraftTmpDataFromID(slot1).funnel_behavior) ~= "table" or (not slot5.funnel_behavior.hover_range or uv1.Battle.BattelUAVUnit.New(slot0)) and (not slot5.funnel_behavior.AI or uv1.Battle.BattlePatternFunnelUnit.New(slot0)) and uv1.Battle.BattleFunnelUnit.New(slot0)) and uv1.Battle.BattleAircraftUnit.New(slot0)

	slot4:SetMotherUnit(slot2)
	slot4:SetWeanponPotential(slot3)
	slot4:SetTemplate(slot5)

	return slot4
end

function slot25.CreateAllInStrike(slot0)
	slot3 = 0

	for slot8, slot9 in ipairs(uv0.GetPlayerShipModelFromID(slot0:GetTemplateID()).airassist_time) do
		uv1.Battle.BattleAllInStrike.New(slot9):SetHost(slot0)
	end

	return {
		[slot8] = slot10
	}
end

function slot25.ExpandAllinStrike(slot0)
	if #uv0.GetPlayerShipModelFromID(slot0:GetTemplateID()).airassist_time > 0 then
		slot5 = uv1.Battle.BattleAllInStrike.New(slot3[#slot3])

		slot5:SetHost(slot0)
		slot0:GetFleetVO():GetAirAssistVO():AppendWeapon(slot5)
		slot5:OverHeat()
		slot0:GetAirAssistQueue():AppendWeapon(slot5)

		slot6 = slot0:GetAirAssistList()
		slot6[#slot6 + 1] = slot5
	end
end

function slot25.CreateAirFighterUnit(slot0, slot1)
	slot2 = nil
	slot2 = uv1.Battle.BattleAirFighterUnit.New(slot0)

	slot2:SetWeaponTemplateID(slot1.weaponID)
	slot2:SetTemplate(uv0.GetAircraftTmpDataFromID(slot1.templateID))

	return slot2
end

function slot25.GetPlayerShipTmpDataFromID(slot0)
	return Clone(uv0[slot0])
end

function slot25.GetPlayerShipModelFromID(slot0)
	return uv0[slot0]
end

function slot25.GetPlayerShipSkinDataFromID(slot0)
	return uv0[slot0]
end

function slot25.GetShipTypeTmp(slot0)
	return uv0[slot0]
end

function slot25.GetMonsterTmpDataFromID(slot0)
	return uv0[slot0]
end

function slot25.GetAircraftTmpDataFromID(slot0)
	return uv0[slot0]
end

function slot25.GetWeaponDataFromID(slot0)
	if slot0 ~= Equipment.EQUIPMENT_STATE_EMPTY and slot0 ~= Equipment.EQUIPMENT_STATE_LOCK then
		-- Nothing
	end

	return uv0[slot0]
end

function slot25.GetEquipDataTemplate(slot0)
	return uv0[slot0]
end

function slot25.GetWeaponPropertyDataFromID(slot0)
	return uv0[slot0]
end

function slot25.GetFormationTmpDataFromID(slot0)
	return uv0[slot0]
end

function slot25.GetAITmpDataFromID(slot0)
	return uv0[slot0]
end

function slot25.GetShipPersonality(slot0)
	return uv0[slot0]
end

function slot25.GetEnemyTypeDataByType(slot0)
	return uv0[slot0]
end

function slot25.GetArenaBuffByShipType(slot0)
	return uv0.GetShipTypeTmp(slot0).arena_buff
end

function slot25.GetPlayerUnitDurabilityExtraAddition(slot0, slot1)
	if slot0 == SYSTEM_DUEL then
		return uv0[slot1].arena_durability_ratio, uv0[slot1].arena_durability_add
	else
		return 1, 0
	end
end

function slot25.GetSkillDataTemplate(slot0)
	return uv0[slot0]
end

function slot25.GetShipTransformDataTemplate(slot0)
	return uv1[uv0.GetPlayerShipModelFromID(slot0).group_type]
end

function slot25.GetEquipSkinDataFromID(slot0)
	return uv0[slot0]
end

function slot25.GetEquipSkin(slot0)
	slot1 = uv0[slot0]

	return slot1.bullet_name, slot1.derivate_bullet, slot1.derivate_torpedo, slot1.derivate_boom
end

function slot25.GetSpecificEnemyList(slot0, slot1)
	slot5 = nil

	for slot9, slot10 in ipairs(uv1[uv0[slot0].config_id].ex_expedition_enemy) do
		if slot10[1] == slot1 then
			slot5 = slot10[2]

			break
		end
	end

	return slot5
end

function slot25.IncreaseAttributes(slot0, slot1, slot2)
	for slot6, slot7 in ipairs(slot2) do
		if slot7[slot1] ~= nil and type(slot7[slot1]) == "number" then
			slot0 = slot0 + slot7[slot1]
		end
	end
end

function slot25.CreateAirFighterWeaponUnit(slot0, slot1, slot2, slot3)
	slot4 = nil

	if uv0.GetWeaponPropertyDataFromID(slot0).type == uv1.EquipmentType.MAIN_CANNON then
		slot4 = uv2.Battle.BattleWeaponUnit.New()
	elseif slot5.type == uv1.EquipmentType.SUB_CANNON then
		slot4 = uv2.Battle.BattleWeaponUnit.New()
	elseif slot5.type == uv1.EquipmentType.TORPEDO then
		slot4 = uv2.Battle.BattleTorpedoUnit.New()
	elseif slot5.type == uv1.EquipmentType.ANTI_AIR then
		slot4 = uv2.Battle.BattleAntiAirUnit.New()
	elseif slot5.type == uv1.EquipmentType.ANTI_SEA then
		slot4 = uv2.Battle.BattleDirectHitWeaponUnit.New()
	elseif slot5.type == uv1.EquipmentType.HAMMER_HEAD then
		slot4 = uv2.Battle.BattleHammerHeadWeaponUnit.New()
	elseif slot5.type == uv1.EquipmentType.BOMBER_PRE_CAST_ALERT then
		slot4 = uv2.Battle.BattleBombWeaponUnit.New()
	elseif slot5.type == uv1.EquipmentType.DEPTH_CHARGE then
		slot4 = uv2.Battle.BattleDepthChargeUnit.New()
	end

	slot4:SetPotentialFactor(slot3)

	slot6 = Clone(slot5)
	slot6.spawn_bound = "weapon"

	slot4:SetTemplateData(slot6)
	slot4:SetHostData(slot1, slot2)

	return slot4
end

function slot25.GetWords(slot0, slot1, slot2)
	slot3, slot4, slot5 = ShipWordHelper.GetWordAndCV(slot0, slot1, 1, true, slot2)

	return slot5
end

function slot25.SkillTranform(slot0, slot1)
	if uv0.GetSkillDataTemplate(slot1).system_transform[slot0] == nil then
		return slot1
	else
		return slot3[slot0]
	end
end

function slot25.GenerateHiddenBuff(slot0)
	for slot6, slot7 in ipairs(uv0.GetPlayerShipModelFromID(slot0).hide_buff_list) do
		-- Nothing
	end

	return {
		[slot7] = {
			level = 1,
			id = slot7
		}
	}
end

function slot25.GetDivingFilter(slot0)
	return uv0[slot0].diving_filter
end

function slot25.GeneratePlayerSubmarinPhase(slot0, slot1, slot2, slot3, slot4)
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
