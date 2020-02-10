slot0 = ys

if not slot0 then
	slot0 = {}
end

ys = slot0
slot0 = ys
slot1 = slot0.Battle
slot1 = slot1.BattleConst
slot2 = slot0.Battle
slot2 = slot2.BattleConfig
slot3 = pg
slot3 = slot3.ship_data_statistics
slot4 = pg
slot4 = slot4.ship_data_template
slot5 = pg
slot5 = slot5.ship_skin_template
slot6 = pg
slot6 = slot6.enemy_data_statistics
slot7 = pg
slot7 = slot7.weapon_property
slot8 = pg
slot8 = slot8.formation_template
slot9 = pg
slot9 = slot9.auto_pilot_template
slot10 = pg
slot10 = slot10.aircraft_template
slot11 = pg
slot11 = slot11.ship_skin_words
slot12 = pg
slot12 = slot12.equip_data_statistics
slot13 = pg
slot13 = slot13.equip_data_template
slot14 = pg
slot14 = slot14.enemy_data_skill
slot15 = pg
slot15 = slot15.ship_data_personality
slot16 = pg
slot16 = slot16.enemy_data_by_type
slot17 = pg
slot17 = slot17.ship_data_by_type
slot18 = pg
slot18 = slot18.ship_level
slot19 = pg
slot19 = slot19.skill_data_template
slot20 = pg
slot20 = slot20.ship_data_trans
slot21 = pg
slot21 = slot21.equip_skin_template
slot22 = pg
slot22 = slot22.activity_template
slot23 = pg
slot23 = slot23.activity_event_worldboss
slot24 = pg
slot24 = slot24.map_data
slot25 = slot0.Battle
slot26 = slot0.Battle
slot26 = slot26.BattleDataFunction
slot26 = slot26 or {}
slot25.BattleDataFunction = slot26
slot25 = slot0.Battle
slot25 = slot25.BattleDataFunction

function slot26(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12)
	slot13, slot14 = nil
	slot15 = uv0
	slot15 = slot15.UnitType
	slot15 = slot15.PLAYER_UNIT

	if slot1 == slot15 then
		slot15 = uv1
		slot15 = slot15.Battle
		slot15 = slot15.BattlePlayerUnit
		slot15 = slot15.New
		slot16 = slot0
		slot17 = slot2
		slot15 = slot15(slot16, slot17)
		slot13 = slot15
		slot16 = slot13
		slot15 = slot13.SetSkinId
		slot17 = slot4

		slot15(slot16, slot17)

		slot16 = slot13
		slot15 = slot13.SetRepressReduce
		slot17 = slot9

		slot15(slot16, slot17)

		slot16 = slot13
		slot15 = slot13.SetWeaponInfo
		slot17 = slot11
		slot18 = slot12

		slot15(slot16, slot17, slot18)

		slot15 = Ship
		slot14 = slot15.WEAPON_COUNT
	else
		slot15 = uv0
		slot15 = slot15.UnitType
		slot15 = slot15.SUB_UNIT

		if slot1 == slot15 then
			slot15 = uv1
			slot15 = slot15.Battle
			slot15 = slot15.BattleSubUnit
			slot15 = slot15.New
			slot16 = slot0
			slot17 = slot2
			slot15 = slot15(slot16, slot17)
			slot13 = slot15
			slot16 = slot13
			slot15 = slot13.SetSkinId
			slot17 = slot4

			slot15(slot16, slot17)

			slot16 = slot13
			slot15 = slot13.SetRepressReduce
			slot17 = slot9

			slot15(slot16, slot17)

			slot16 = slot13
			slot15 = slot13.SetWeaponInfo
			slot17 = slot11
			slot18 = slot12

			slot15(slot16, slot17, slot18)

			slot15 = Ship
			slot14 = slot15.WEAPON_COUNT
		else
			slot15 = uv0
			slot15 = slot15.UnitType
			slot15 = slot15.ENEMY_UNIT

			if slot1 == slot15 then
				slot15 = uv1
				slot15 = slot15.Battle
				slot15 = slot15.BattleEnemyUnit
				slot15 = slot15.New
				slot16 = slot0
				slot17 = slot2
				slot15 = slot15(slot16, slot17)
				slot13 = slot15
				slot16 = slot13
				slot15 = slot13.SetRepress
				slot17 = slot8

				slot15(slot16, slot17)
			else
				slot15 = uv0
				slot15 = slot15.UnitType
				slot15 = slot15.BOSS_UNIT

				if slot1 == slot15 then
					slot15 = uv1
					slot15 = slot15.Battle
					slot15 = slot15.BattleBossUnit
					slot15 = slot15.New
					slot16 = slot0
					slot17 = slot2
					slot15 = slot15(slot16, slot17)
					slot13 = slot15
					slot16 = slot13
					slot15 = slot13.SetRepress
					slot17 = slot8

					slot15(slot16, slot17)
				else
					slot15 = uv0
					slot15 = slot15.UnitType
					slot15 = slot15.NPC_UNIT

					if slot1 == slot15 then
						slot15 = uv1
						slot15 = slot15.Battle
						slot15 = slot15.BattleNPCUnit
						slot15 = slot15.New
						slot16 = slot0
						slot17 = slot2
						slot15 = slot15(slot16, slot17)
						slot13 = slot15
					end
				end
			end
		end
	end

	slot16 = slot13
	slot15 = slot13.SetTemplate
	slot17 = slot3
	slot18 = slot6

	slot15(slot16, slot17, slot18)

	slot15 = uv0
	slot15 = slot15.UnitType
	slot15 = slot15.ENEMY_UNIT

	if slot1 ~= slot15 then
		slot15 = uv0
		slot15 = slot15.UnitType
		slot15 = slot15.BOSS_UNIT

		if slot1 == slot15 then
			slot16 = slot13
			slot15 = slot13.SetCurrentHP
			slot18 = slot13
			slot17 = slot13.GetMaxHP
			slot17 = slot17(slot18)
			slot17 = slot17 * slot10

			slot15(slot16, slot17)
		end
	end

	slot15 = {}
	slot16 = uv0
	slot16 = slot16.UnitType
	slot16 = slot16.ENEMY_UNIT

	if slot1 ~= slot16 then
		slot16 = uv0
		slot16 = slot16.UnitType
		slot16 = slot16.BOSS_UNIT

		if slot1 == slot16 then
			slot16 = ipairs
			slot17 = slot5
			slot16, slot17, slot18 = slot16(slot17)

			for slot19, slot20 in slot16, slot17, slot18 do
				slot21 = #slot15
				slot21 = slot21 + 1
				slot22 = {}
				slot23 = {}
				slot24 = {}
				slot25 = slot20.id
				slot24[1] = slot25
				slot23.weapon_id = slot24
				slot22.equipment = slot23
				slot15[slot21] = slot22
			end
		else
			slot16 = ipairs
			slot17 = slot5
			slot16, slot17, slot18 = slot16(slot17)

			for slot19, slot20 in slot16, slot17, slot18 do
				slot21 = slot20.id

				if not slot21 then
					slot21 = #slot15
					slot21 = slot21 + 1
					slot22 = {
						equipment = false,
						torpedoAmmo = 0
					}
					slot23 = slot20.skin
					slot22.skin = slot23
					slot15[slot21] = slot22
				else
					slot21 = slot20.equipmentInfo

					if slot21 then
						slot21 = slot20.equipmentInfo
						slot21 = slot21.config
						slot21 = slot21.torpedo_ammo

						if not slot21 then
							slot21 = 0
						end
					end

					if slot14 and slot19 > slot14 then
						slot22 = uv2
						slot22 = slot22.GetWeaponDataFromID
						slot23 = slot20.id
						slot22 = slot22(slot23)
						slot22 = slot22.weapon_id
						slot22 = #slot22

						if slot22 then
							slot22 = uv2
							slot22 = slot22.GetWeaponDataFromID
							slot23 = slot20.id
							slot22 = slot22(slot23)
							slot23 = #slot15
							slot23 = slot23 + 1
							slot24 = {
								equipment = slot22
							}
							slot25 = slot20.skin
							slot24.skin = slot25
							slot24.torpedoAmmo = slot21
							slot15[slot23] = slot24
						else
							slot22 = #slot15
							slot22 = slot22 + 1
							slot23 = {
								equipment = false
							}
							slot24 = slot20.skin
							slot23.skin = slot24
							slot23.torpedoAmmo = slot21
							slot15[slot22] = slot23
						end
					end
				end
			end
		end
	end

	slot17 = slot13
	slot16 = slot13.SetProficiencyList
	slot18 = slot7

	slot16(slot17, slot18)

	slot17 = slot13
	slot16 = slot13.SetEquipment
	slot18 = slot15

	slot16(slot17, slot18)

	return slot13
end

slot25.CreateBattleUnitData = slot26

function slot26(slot0, slot1)
	slot2 = slot0.skills

	if not slot2 then
		slot2 = {}
	end

	slot3 = pairs
	slot4 = slot2
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot8 = uv0
		slot8 = slot8.Battle
		slot8 = slot8.BattleBuffUnit
		slot8 = slot8.New
		slot9 = slot7.id
		slot10 = slot7.level
		slot11 = slot1
		slot8 = slot8(slot9, slot10, slot11)
		slot10 = slot1
		slot9 = slot1.AddBuff
		slot11 = slot8

		slot9(slot10, slot11)
	end
end

slot25.InitUnitSkill = slot26

function slot26(slot0)
	slot1 = Ship
	slot1 = slot1.WEAPON_COUNT
	slot2 = {}
	slot3 = ipairs
	slot4 = slot0
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot8 = slot7.id

		if slot8 then
			slot9 = nil

			if slot1 and slot1 < slot6 then
				slot10 = uv0
				slot10 = slot10.GetWeaponDataFromID
				slot11 = slot8
				slot10 = slot10(slot11)

				if slot10 ~= nil then
					slot9 = slot10.skill_id
				end
			else
				slot10 = uv0
				slot10 = slot10.GetWeaponDataFromID
				slot11 = slot8
				slot10 = slot10(slot11)
				slot9 = slot10.skill_id
			end

			slot10 = type
			slot11 = slot7.equipmentInfo
			slot10 = slot10(slot11)

			if slot10 == "table" then
				slot10 = table
				slot10 = slot10.merge
				slot11 = slot9
				slot12 = slot7.equipmentInfo
				slot13 = slot12
				slot12 = slot12.GetAffixBuffList
				slot12 = slot12(slot13)
				slot13 = true
				slot10 = slot10(slot11, slot12, slot13)
				slot9 = slot10
			end

			slot10 = ipairs
			slot11 = slot9
			slot10, slot11, slot12 = slot10(slot11)

			for slot13, slot14 in slot10, slot11, slot12 do
				slot15 = table
				slot15 = slot15.insert
				slot16 = slot2
				slot17 = slot14

				slot15(slot16, slot17)
			end
		end
	end

	return slot2
end

slot25.GetEquipSkill = slot26

function slot26(slot0, slot1)
	slot2 = uv0
	slot2 = slot2.GetEquipSkill
	slot3 = slot0
	slot2 = slot2(slot3)
	slot3 = ipairs
	slot4 = slot2
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot8 = uv1
		slot8 = slot8.Battle
		slot8 = slot8.BattleBuffUnit
		slot8 = slot8.New
		slot9 = slot7
		slot10 = 1
		slot11 = slot1
		slot8 = slot8(slot9, slot10, slot11)
		slot10 = slot1
		slot9 = slot1.AddBuff
		slot11 = slot8

		slot9(slot10, slot11)
	end
end

slot25.InitEquipSkill = slot26

function slot26(slot0, slot1)
	if not slot0 then
		slot0 = {}
	end

	slot2 = uv0
	slot2 = slot2.Battle
	slot2 = slot2.BattleState
	slot2 = slot2.GetInstance
	slot2 = slot2()
	slot3 = slot2
	slot2 = slot2.GetBattleType
	slot2 = slot2(slot3)
	slot3 = pairs
	slot4 = slot0
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot8 = uv0
		slot8 = slot8.Battle
		slot8 = slot8.BattleDataFunction
		slot8 = slot8.GetBuffTemplate
		slot9 = slot7.id
		slot10 = slot7.level
		slot8 = slot8(slot9, slot10)
		slot8 = slot8.limit
		slot9 = false

		if slot8 then
			slot10 = ipairs
			slot11 = slot8
			slot10, slot11, slot12 = slot10(slot11)

			for slot13, slot14 in slot10, slot11, slot12 do
				if slot2 == slot14 then
					slot9 = true

					break
				end
			end
		end

		if not slot9 then
			slot10 = uv0
			slot10 = slot10.Battle
			slot10 = slot10.BattleBuffUnit
			slot10 = slot10.New
			slot11 = slot7.id
			slot12 = slot7.level
			slot13 = slot1
			slot10 = slot10(slot11, slot12, slot13)
			slot12 = slot10
			slot11 = slot10.SetCommander
			slot13 = slot7.commander

			slot11(slot12, slot13)

			slot12 = slot1
			slot11 = slot1.AddBuff
			slot13 = slot10

			slot11(slot12, slot13)
		end
	end
end

slot25.InitCommanderSkill = slot26

function slot26(slot0, slot1, slot2, slot3, slot4)
	if not slot3 then
		slot3 = -1
	end

	slot6 = slot1
	slot5 = slot1.GetUnitType
	slot5 = slot5(slot6)
	slot6 = nil
	slot7 = uv0
	slot7 = slot7.GetWeaponPropertyDataFromID
	slot8 = slot0
	slot7 = slot7(slot8)

	if not slot4 then
		slot8 = slot7.type
	end

	slot9 = uv1
	slot9 = slot9.EquipmentType
	slot9 = slot9.MAIN_CANNON

	if slot8 == slot9 then
		slot9 = uv2
		slot9 = slot9.Battle
		slot9 = slot9.BattleWeaponUnit
		slot9 = slot9.New
		slot9 = slot9()
		slot6 = slot9
	else
		slot9 = uv1
		slot9 = slot9.EquipmentType
		slot9 = slot9.SUB_CANNON

		if slot8 == slot9 then
			slot9 = uv2
			slot9 = slot9.Battle
			slot9 = slot9.BattleWeaponUnit
			slot9 = slot9.New
			slot9 = slot9()
			slot6 = slot9
		else
			slot9 = uv1
			slot9 = slot9.EquipmentType
			slot9 = slot9.TORPEDO

			if slot8 == slot9 then
				slot9 = uv2
				slot9 = slot9.Battle
				slot9 = slot9.BattleTorpedoUnit
				slot9 = slot9.New
				slot9 = slot9()
				slot6 = slot9
			else
				slot9 = uv1
				slot9 = slot9.EquipmentType
				slot9 = slot9.MANUAL_TORPEDO

				if slot8 == slot9 then
					slot9 = uv2
					slot9 = slot9.Battle
					slot9 = slot9.BattleManualTorpedoUnit
					slot9 = slot9.New
					slot9 = slot9()
					slot6 = slot9
				else
					slot9 = uv1
					slot9 = slot9.EquipmentType
					slot9 = slot9.ANTI_AIR

					if slot8 == slot9 then
						slot9 = uv2
						slot9 = slot9.Battle
						slot9 = slot9.BattleAntiAirUnit
						slot9 = slot9.New
						slot9 = slot9()
						slot6 = slot9
					else
						slot9 = uv1
						slot9 = slot9.EquipmentType
						slot9 = slot9.FLEET_ANTI_AIR

						if slot8 == slot9 then
							slot9 = uv2
							slot9 = slot9.Battle
							slot9 = slot9.BattleWeaponUnit
							slot9 = slot9.New
							slot9 = slot9()
							slot6 = slot9
						else
							slot9 = uv1
							slot9 = slot9.EquipmentType
							slot9 = slot9.SCOUT

							if slot8 ~= slot9 then
								slot9 = uv1
								slot9 = slot9.EquipmentType
								slot9 = slot9.PASSIVE_SCOUT

								if slot8 == slot9 then
									slot9 = uv2
									slot9 = slot9.Battle
									slot9 = slot9.BattleHiveUnit
									slot9 = slot9.New
									slot9 = slot9()
									slot6 = slot9
								else
									slot9 = uv1
									slot9 = slot9.EquipmentType
									slot9 = slot9.SPECIAL

									if slot8 == slot9 then
										slot9 = uv2
										slot9 = slot9.Battle
										slot9 = slot9.BattleSpecialWeapon
										slot9 = slot9.New
										slot9 = slot9()
										slot6 = slot9
									else
										slot9 = uv1
										slot9 = slot9.EquipmentType
										slot9 = slot9.ANTI_SEA

										if slot8 == slot9 then
											slot9 = uv2
											slot9 = slot9.Battle
											slot9 = slot9.BattleDirectHitWeaponUnit
											slot9 = slot9.New
											slot9 = slot9()
											slot6 = slot9
										else
											slot9 = uv1
											slot9 = slot9.EquipmentType
											slot9 = slot9.HAMMER_HEAD

											if slot8 == slot9 then
												slot9 = uv2
												slot9 = slot9.Battle
												slot9 = slot9.BattleHammerHeadWeaponUnit
												slot9 = slot9.New
												slot9 = slot9()
												slot6 = slot9
											else
												slot9 = uv1
												slot9 = slot9.EquipmentType
												slot9 = slot9.BOMBER_PRE_CAST_ALERT

												if slot8 == slot9 then
													slot9 = uv2
													slot9 = slot9.Battle
													slot9 = slot9.BattleBombWeaponUnit
													slot9 = slot9.New
													slot9 = slot9()
													slot6 = slot9
												else
													slot9 = uv1
													slot9 = slot9.EquipmentType
													slot9 = slot9.POINT_HIT_AND_LOCK

													if slot8 == slot9 then
														slot9 = uv2
														slot9 = slot9.Battle
														slot9 = slot9.BattlePointHitWeaponUnit
														slot9 = slot9.New
														slot9 = slot9()
														slot6 = slot9
													else
														slot9 = uv1
														slot9 = slot9.EquipmentType
														slot9 = slot9.BEAM

														if slot8 == slot9 then
															slot9 = uv2
															slot9 = slot9.Battle
															slot9 = slot9.BattleLaserUnit
															slot9 = slot9.New
															slot9 = slot9()
															slot6 = slot9
														else
															slot9 = uv1
															slot9 = slot9.EquipmentType
															slot9 = slot9.DEPTH_CHARGE

															if slot8 == slot9 then
																slot9 = uv2
																slot9 = slot9.Battle
																slot9 = slot9.BattleDepthChargeUnit
																slot9 = slot9.New
																slot9 = slot9()
																slot6 = slot9
															else
																slot9 = uv1
																slot9 = slot9.EquipmentType
																slot9 = slot9.REPEATER_ANTI_AIR

																if slot8 == slot9 then
																	slot9 = uv2
																	slot9 = slot9.Battle
																	slot9 = slot9.BattleRepeaterAntiAirUnit
																	slot9 = slot9.New
																	slot9 = slot9()
																	slot6 = slot9
																else
																	slot9 = uv1
																	slot9 = slot9.EquipmentType
																	slot9 = slot9.DISPOSABLE_TORPEDO

																	if slot8 == slot9 then
																		slot9 = uv2
																		slot9 = slot9.Battle
																		slot9 = slot9.BattleDisposableTorpedoUnit
																		slot9 = slot9.New
																		slot9 = slot9()
																		slot6 = slot9
																	end
																end
															end
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end

	slot10 = slot6
	slot9 = slot6.SetPotentialFactor
	slot11 = slot2

	slot9(slot10, slot11)

	slot10 = slot6
	slot9 = slot6.SetEquipmentIndex
	slot11 = slot3

	slot9(slot10, slot11)

	slot10 = slot6
	slot9 = slot6.SetTemplateData
	slot11 = slot7

	slot9(slot10, slot11)

	slot10 = slot6
	slot9 = slot6.SetHostData
	slot11 = slot1

	slot9(slot10, slot11)

	slot9 = uv1
	slot9 = slot9.UnitType
	slot9 = slot9.PLAYER_UNIT

	if slot5 == slot9 then
		slot9 = slot7.auto_aftercast
		slot10 = 0

		if slot9 > slot10 then
			slot10 = slot6
			slot9 = slot6.OverrideGCD
			slot11 = slot7.auto_aftercast

			slot9(slot10, slot11)
		end
	else
		slot9 = uv1
		slot9 = slot9.UnitType
		slot9 = slot9.ENEMY_UNIT

		if slot5 ~= slot9 then
			slot9 = uv1
			slot9 = slot9.UnitType
			slot9 = slot9.BOSS_UNIT

			if slot9 then
				slot10 = slot6
				slot9 = slot6.HostOnEnemy

				slot9(slot10)
			end
		end
	end

	slot9 = slot7.type
	slot10 = uv1
	slot10 = slot10.EquipmentType
	slot10 = slot10.SCOUT

	if slot9 ~= slot10 then
		slot9 = slot7.type
		slot10 = uv1
		slot10 = slot10.EquipmentType
		slot10 = slot10.PASSIVE_SCOUT

		if slot9 == slot10 then
			slot10 = slot6
			slot9 = slot6.EnterCoolDown

			slot9(slot10)
		end
	end

	return slot6
end

slot25.CreateWeaponUnit = slot26

function slot26(slot0, slot1, slot2, slot3)
	slot4 = nil
	slot5 = uv0
	slot5 = slot5.GetAircraftTmpDataFromID
	slot6 = slot1
	slot5 = slot5(slot6)
	slot6 = type
	slot7 = slot5.funnel_behavior
	slot6 = slot6(slot7)

	if slot6 == "table" then
		slot6 = slot5.funnel_behavior
		slot6 = slot6.hover_range

		if slot6 then
			slot6 = uv1
			slot6 = slot6.Battle
			slot6 = slot6.BattelUAVUnit
			slot6 = slot6.New
			slot7 = slot0
			slot6 = slot6(slot7)
			slot4 = slot6
		else
			slot6 = uv1
			slot6 = slot6.Battle
			slot6 = slot6.BattleFunnelUnit
			slot6 = slot6.New
			slot7 = slot0
			slot6 = slot6(slot7)
			slot4 = slot6
		end
	else
		slot6 = uv1
		slot6 = slot6.Battle
		slot6 = slot6.BattleAircraftUnit
		slot6 = slot6.New
		slot7 = slot0
		slot6 = slot6(slot7)
		slot4 = slot6
	end

	slot7 = slot4
	slot6 = slot4.SetMotherUnit
	slot8 = slot2

	slot6(slot7, slot8)

	slot7 = slot4
	slot6 = slot4.SetWeanponPotential
	slot8 = slot3

	slot6(slot7, slot8)

	slot7 = slot4
	slot6 = slot4.SetTemplate
	slot8 = slot5

	slot6(slot7, slot8)

	return slot4
end

slot25.CreateAircraftUnit = slot26

function slot26(slot0)
	slot2 = slot0
	slot1 = slot0.GetTemplateID
	slot1 = slot1(slot2)
	slot2 = uv0
	slot2 = slot2.GetPlayerShipModelFromID
	slot3 = slot1
	slot2 = slot2(slot3)
	slot3 = 0
	slot4 = {}
	slot5 = ipairs
	slot6 = slot2.airassist_time
	slot5, slot6, slot7 = slot5(slot6)

	for slot8, slot9 in slot5, slot6, slot7 do
		slot10 = uv1
		slot10 = slot10.Battle
		slot10 = slot10.BattleAllInStrike
		slot10 = slot10.New
		slot11 = slot9
		slot10 = slot10(slot11)
		slot12 = slot10
		slot11 = slot10.SetHost
		slot13 = slot0

		slot11(slot12, slot13)

		slot4[slot8] = slot10
	end

	return slot4
end

slot25.CreateAllInStrike = slot26

function slot26(slot0)
	slot2 = slot0
	slot1 = slot0.GetTemplateID
	slot1 = slot1(slot2)
	slot2 = uv0
	slot2 = slot2.GetPlayerShipModelFromID
	slot3 = slot1
	slot2 = slot2(slot3)
	slot3 = slot2.airassist_time
	slot4 = #slot3
	slot5 = 0

	if slot4 > slot5 then
		slot4 = #slot3
		slot4 = slot3[slot4]
		slot5 = uv1
		slot5 = slot5.Battle
		slot5 = slot5.BattleAllInStrike
		slot5 = slot5.New
		slot6 = slot4
		slot5 = slot5(slot6)
		slot7 = slot5
		slot6 = slot5.SetHost
		slot8 = slot0

		slot6(slot7, slot8)

		slot7 = slot0
		slot6 = slot0.GetFleetVO
		slot6 = slot6(slot7)
		slot7 = slot6
		slot6 = slot6.GetAirAssistVO
		slot6 = slot6(slot7)
		slot7 = slot6
		slot6 = slot6.AppendWeapon
		slot8 = slot5

		slot6(slot7, slot8)

		slot7 = slot5
		slot6 = slot5.OverHeat

		slot6(slot7)

		slot7 = slot0
		slot6 = slot0.GetAirAssistQueue
		slot6 = slot6(slot7)
		slot7 = slot6
		slot6 = slot6.AppendWeapon
		slot8 = slot5

		slot6(slot7, slot8)

		slot7 = slot0
		slot6 = slot0.GetAirAssistList
		slot6 = slot6(slot7)
		slot7 = #slot6
		slot7 = slot7 + 1
		slot6[slot7] = slot5
	end
end

slot25.ExpandAllinStrike = slot26

function slot26(slot0, slot1)
	slot2 = nil
	slot3 = uv0
	slot3 = slot3.GetAircraftTmpDataFromID
	slot4 = slot1.templateID
	slot3 = slot3(slot4)
	slot4 = uv1
	slot4 = slot4.Battle
	slot4 = slot4.BattleAirFighterUnit
	slot4 = slot4.New
	slot5 = slot0
	slot4 = slot4(slot5)
	slot2 = slot4
	slot5 = slot2
	slot4 = slot2.SetWeaponTemplateID
	slot6 = slot1.weaponID

	slot4(slot5, slot6)

	slot5 = slot2
	slot4 = slot2.SetTemplate
	slot6 = slot3

	slot4(slot5, slot6)

	return slot2
end

slot25.CreateAirFighterUnit = slot26

function slot26(slot0)
	slot1 = Clone
	slot2 = uv0
	slot2 = slot2[slot0]

	return slot1(slot2)
end

slot25.GetPlayerShipTmpDataFromID = slot26

function slot26(slot0)
	slot1 = uv0
	slot1 = slot1[slot0]

	return slot1
end

slot25.GetPlayerShipModelFromID = slot26

function slot26(slot0)
	slot1 = uv0
	slot1 = slot1[slot0]

	return slot1
end

slot25.GetPlayerShipSkinDataFromID = slot26

function slot26(slot0)
	slot1 = uv0
	slot1 = slot1[slot0]

	return slot1
end

slot25.GetShipTypeTmp = slot26

function slot26(slot0)
	slot1 = uv0
	slot1 = slot1[slot0]

	return slot1
end

slot25.GetMonsterTmpDataFromID = slot26

function slot26(slot0)
	slot1 = uv0
	slot1 = slot1[slot0]

	return slot1
end

slot25.GetAircraftTmpDataFromID = slot26

function slot26(slot0)
	slot1 = Equipment
	slot1 = slot1.EQUIPMENT_STATE_EMPTY

	if slot0 ~= slot1 then
		slot1 = Equipment
		slot1 = slot1.EQUIPMENT_STATE_LOCK

		if slot0 ~= slot1 then
			-- Nothing
		end
	end

	slot1 = uv0
	slot1 = slot1[slot0]

	return slot1
end

slot25.GetWeaponDataFromID = slot26

function slot26(slot0)
	slot1 = uv0
	slot1 = slot1[slot0]

	return slot1
end

slot25.GetEquipDataTemplate = slot26

function slot26(slot0)
	slot1 = uv0
	slot1 = slot1[slot0]

	return slot1
end

slot25.GetWeaponPropertyDataFromID = slot26

function slot26(slot0)
	slot1 = uv0
	slot1 = slot1[slot0]

	return slot1
end

slot25.GetFormationTmpDataFromID = slot26

function slot26(slot0)
	slot1 = uv0
	slot1 = slot1[slot0]

	return slot1
end

slot25.GetAITmpDataFromID = slot26

function slot26(slot0)
	slot1 = uv0
	slot1 = slot1[slot0]

	return slot1
end

slot25.GetShipPersonality = slot26

function slot26(slot0)
	slot1 = uv0
	slot1 = slot1[slot0]

	return slot1
end

slot25.GetEnemyTypeDataByType = slot26

function slot26(slot0)
	slot1 = uv0
	slot1 = slot1.GetShipTypeTmp
	slot2 = slot0
	slot1 = slot1(slot2)
	slot1 = slot1.arena_buff

	return slot1
end

slot25.GetArenaBuffByShipType = slot26

function slot26(slot0, slot1)
	slot2 = SYSTEM_DUEL

	if slot0 ~= slot2 then
		slot2 = SYSTEM_SHAM

		if slot0 == slot2 then
			slot2 = uv0
			slot2 = slot2[slot1]
			slot2 = slot2.arena_durability_ratio
			slot3 = uv0
			slot3 = slot3[slot1]
			slot3 = slot3.arena_durability_add

			return slot2, slot3
		else
			slot2 = 1
			slot3 = 0

			return slot2, slot3
		end
	end
end

slot25.GetPlayerUnitDurabilityExtraAddition = slot26

function slot26(slot0)
	slot1 = uv0
	slot1 = slot1[slot0]

	return slot1
end

slot25.GetSkillDataTemplate = slot26

function slot26(slot0)
	slot1 = uv0
	slot1 = slot1.GetPlayerShipModelFromID
	slot2 = slot0
	slot1 = slot1(slot2)
	slot2 = uv1
	slot3 = slot1.group_type
	slot2 = slot2[slot3]

	return slot2
end

slot25.GetShipTransformDataTemplate = slot26

function slot26(slot0)
	slot1 = uv0
	slot1 = slot1[slot0]

	return slot1
end

slot25.GetEquipSkinDataFromID = slot26

function slot26(slot0)
	slot1 = uv0
	slot1 = slot1[slot0]
	slot2 = slot1.bullet_name
	slot3 = slot1.derivate_bullet
	slot4 = slot1.derivate_torpedo
	slot5 = slot1.derivate_boom

	return slot2, slot3, slot4, slot5
end

slot25.GetEquipSkin = slot26

function slot26(slot0, slot1)
	slot2 = uv0
	slot2 = slot2[slot0]
	slot3 = uv1
	slot4 = slot2.config_id
	slot3 = slot3[slot4]
	slot4 = slot3.ex_expedition_enemy
	slot5 = nil
	slot6 = ipairs
	slot7 = slot4
	slot6, slot7, slot8 = slot6(slot7)

	for slot9, slot10 in slot6, slot7, slot8 do
		slot11 = slot10[1]

		if slot11 == slot1 then
			slot5 = slot10[2]

			break
		end
	end

	return slot5
end

slot25.GetSpecificEnemyList = slot26

function slot26(slot0, slot1, slot2)
	slot3 = ipairs
	slot4 = slot2
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot8 = slot7[slot1]

		if slot8 ~= nil then
			slot8 = type
			slot9 = slot7[slot1]
			slot8 = slot8(slot9)

			if slot8 == "number" then
				slot8 = slot7[slot1]
				slot0 = slot0 + slot8
			end
		end
	end
end

slot25.IncreaseAttributes = slot26

function slot26(slot0, slot1, slot2, slot3)
	slot4 = nil
	slot5 = uv0
	slot5 = slot5.GetWeaponPropertyDataFromID
	slot6 = slot0
	slot5 = slot5(slot6)
	slot6 = slot5.type
	slot7 = uv1
	slot7 = slot7.EquipmentType
	slot7 = slot7.MAIN_CANNON

	if slot6 == slot7 then
		slot6 = uv2
		slot6 = slot6.Battle
		slot6 = slot6.BattleWeaponUnit
		slot6 = slot6.New
		slot6 = slot6()
		slot4 = slot6
	else
		slot6 = slot5.type
		slot7 = uv1
		slot7 = slot7.EquipmentType
		slot7 = slot7.SUB_CANNON

		if slot6 == slot7 then
			slot6 = uv2
			slot6 = slot6.Battle
			slot6 = slot6.BattleWeaponUnit
			slot6 = slot6.New
			slot6 = slot6()
			slot4 = slot6
		else
			slot6 = slot5.type
			slot7 = uv1
			slot7 = slot7.EquipmentType
			slot7 = slot7.TORPEDO

			if slot6 == slot7 then
				slot6 = uv2
				slot6 = slot6.Battle
				slot6 = slot6.BattleTorpedoUnit
				slot6 = slot6.New
				slot6 = slot6()
				slot4 = slot6
			else
				slot6 = slot5.type
				slot7 = uv1
				slot7 = slot7.EquipmentType
				slot7 = slot7.ANTI_AIR

				if slot6 == slot7 then
					slot6 = uv2
					slot6 = slot6.Battle
					slot6 = slot6.BattleAntiAirUnit
					slot6 = slot6.New
					slot6 = slot6()
					slot4 = slot6
				else
					slot6 = slot5.type
					slot7 = uv1
					slot7 = slot7.EquipmentType
					slot7 = slot7.ANTI_SEA

					if slot6 == slot7 then
						slot6 = uv2
						slot6 = slot6.Battle
						slot6 = slot6.BattleDirectHitWeaponUnit
						slot6 = slot6.New
						slot6 = slot6()
						slot4 = slot6
					else
						slot6 = slot5.type
						slot7 = uv1
						slot7 = slot7.EquipmentType
						slot7 = slot7.HAMMER_HEAD

						if slot6 == slot7 then
							slot6 = uv2
							slot6 = slot6.Battle
							slot6 = slot6.BattleHammerHeadWeaponUnit
							slot6 = slot6.New
							slot6 = slot6()
							slot4 = slot6
						else
							slot6 = slot5.type
							slot7 = uv1
							slot7 = slot7.EquipmentType
							slot7 = slot7.BOMBER_PRE_CAST_ALERT

							if slot6 == slot7 then
								slot6 = uv2
								slot6 = slot6.Battle
								slot6 = slot6.BattleBombWeaponUnit
								slot6 = slot6.New
								slot6 = slot6()
								slot4 = slot6
							else
								slot6 = slot5.type
								slot7 = uv1
								slot7 = slot7.EquipmentType
								slot7 = slot7.DEPTH_CHARGE

								if slot6 == slot7 then
									slot6 = uv2
									slot6 = slot6.Battle
									slot6 = slot6.BattleDepthChargeUnit
									slot6 = slot6.New
									slot6 = slot6()
									slot4 = slot6
								end
							end
						end
					end
				end
			end
		end
	end

	slot7 = slot4
	slot6 = slot4.SetPotentialFactor
	slot8 = slot3

	slot6(slot7, slot8)

	slot6 = Clone
	slot7 = slot5
	slot6 = slot6(slot7)
	slot7 = "weapon"
	slot6.spawn_bound = slot7
	slot8 = slot4
	slot7 = slot4.SetTemplateData
	slot9 = slot6

	slot7(slot8, slot9)

	slot8 = slot4
	slot7 = slot4.SetHostData
	slot9 = slot1
	slot10 = slot2

	slot7(slot8, slot9, slot10)

	return slot4
end

slot25.CreateAirFighterWeaponUnit = slot26

function slot26(slot0, slot1, slot2)
	slot3 = ShipWordHelper
	slot3 = slot3.GetWordAndCV
	slot4 = slot0
	slot5 = slot1
	slot6 = 1
	slot7 = true
	slot8 = slot2
	slot3, slot4, slot5 = slot3(slot4, slot5, slot6, slot7, slot8)
	slot6 = print
	slot7 = slot5

	slot6(slot7)

	return slot5
end

slot25.GetWords = slot26

function slot26(slot0, slot1)
	slot2 = uv0
	slot2 = slot2.GetSkillDataTemplate
	slot3 = slot1
	slot2 = slot2(slot3)
	slot3 = slot2.system_transform
	slot4 = slot3[slot0]

	if slot4 == nil then
		return slot1
	else
		slot4 = slot3[slot0]

		return slot4
	end
end

slot25.SkillTranform = slot26

function slot26(slot0)
	slot1 = uv0
	slot1 = slot1.GetPlayerShipModelFromID
	slot2 = slot0
	slot1 = slot1(slot2)
	slot1 = slot1.hide_buff_list
	slot2 = {}
	slot3 = ipairs
	slot4 = slot1
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot8 = {}
		slot9 = 1
		slot8.level = slot9
		slot8.id = slot7
		slot2[slot7] = slot8
	end

	return slot2
end

slot25.GenerateHiddenBuff = slot26

function slot26(slot0)
	slot1 = uv0
	slot1 = slot1[slot0]
	slot1 = slot1.diving_filter

	return slot1
end

slot25.GetDivingFilter = slot26

function slot26(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot0 - slot2
	slot6 = {}
	slot7 = {
		index = 0,
		switchType = 3,
		switchTo = 1,
		switchParam = slot5
	}
	slot6[1] = slot7
	slot7 = {
		index = 1,
		dive = "STATE_RAID",
		switchTo = 2,
		switchType = 1,
		switchParamFunc = slot3
	}
	slot6[2] = slot7
	slot7 = {
		switchType = 1,
		dive = "STATE_FLOAT",
		switchTo = 3,
		index = 2,
		switchParam = slot4
	}
	slot6[3] = slot7
	slot7 = {
		switchType = 4,
		dive = "STATE_RETREAT",
		switchTo = 4,
		index = 3,
		switchParam = slot1
	}
	slot6[4] = slot7
	slot7 = {
		index = 4,
		retreat = true
	}
	slot6[5] = slot7

	return slot6
end

slot25.GeneratePlayerSubmarinPhase = slot26
