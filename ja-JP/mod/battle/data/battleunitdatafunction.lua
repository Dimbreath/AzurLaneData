
-- Decompilation error in this vicinity:
--- BLOCK #0 1-3, warpins: 1 ---
--- END OF BLOCK #0 ---

FLOW; TARGET BLOCK #1



-- Decompilation error in this vicinity:
--- BLOCK #1 5-59, warpins: 2 ---
slot0 = ys

if not slot0 then

	-- Decompilation error in this vicinity:
	--- BLOCK #0 4-4, warpins: 1 ---
	slot0 = {}
	--- END OF BLOCK #0 ---



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

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot13, slot14 = nil
	slot15 = slot0
	slot15 = slot15.UnitType
	slot15 = slot15.PLAYER_UNIT

	if slot1 == slot15 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-30, warpins: 1 ---
		slot15 = slot1
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
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 31-35, warpins: 1 ---
		slot15 = slot0
		slot15 = slot15.UnitType
		slot15 = slot15.SUB_UNIT

		if slot1 == slot15 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 36-59, warpins: 1 ---
			slot15 = slot1
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
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 60-64, warpins: 1 ---
			slot15 = slot0
			slot15 = slot15.UnitType
			slot15 = slot15.ENEMY_UNIT

			if slot1 == slot15 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 65-77, warpins: 1 ---
				slot15 = slot1
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
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 78-82, warpins: 1 ---
				slot15 = slot0
				slot15 = slot15.UnitType
				slot15 = slot15.BOSS_UNIT

				if slot1 == slot15 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 83-95, warpins: 1 ---
					slot15 = slot1
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
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 96-100, warpins: 1 ---
					slot15 = slot0
					slot15 = slot15.UnitType
					slot15 = slot15.NPC_UNIT

					if slot1 == slot15 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 101-108, warpins: 1 ---
						slot15 = slot1
						slot15 = slot15.Battle
						slot15 = slot15.BattleNPCUnit
						slot15 = slot15.New
						slot16 = slot0
						slot17 = slot2
						slot15 = slot15(slot16, slot17)
						slot13 = slot15
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 109-118, warpins: 6 ---
	slot16 = slot13
	slot15 = slot13.SetTemplate
	slot17 = slot3
	slot18 = slot6

	slot15(slot16, slot17, slot18)

	slot15 = slot0
	slot15 = slot15.UnitType
	slot15 = slot15.ENEMY_UNIT

	if slot1 ~= slot15 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 119-123, warpins: 1 ---
		slot15 = slot0
		slot15 = slot15.UnitType
		slot15 = slot15.BOSS_UNIT

		if slot1 == slot15 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 124-130, warpins: 2 ---
			slot16 = slot13
			slot15 = slot13.SetCurrentHP
			slot18 = slot13
			slot17 = slot13.GetMaxHP
			slot17 = slot17(slot18)
			slot17 = slot17 * slot10

			slot15(slot16, slot17)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 131-136, warpins: 2 ---
	slot15 = {}
	slot16 = slot0
	slot16 = slot16.UnitType
	slot16 = slot16.ENEMY_UNIT

	if slot1 ~= slot16 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 137-141, warpins: 1 ---
		slot16 = slot0
		slot16 = slot16.UnitType
		slot16 = slot16.BOSS_UNIT

		if slot1 == slot16 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 142-145, warpins: 2 ---
			slot16 = ipairs
			slot17 = slot5
			slot16, slot17, slot18 = slot16(slot17)

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 146-157, warpins: 0 ---
			for slot19, slot20 in slot16, slot17, slot18 do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 146-155, warpins: 1 ---
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
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 156-157, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 158-158, warpins: 1 ---
			--- END OF BLOCK #2 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 159-162, warpins: 1 ---
			slot16 = ipairs
			slot17 = slot5
			slot16, slot17, slot18 = slot16(slot17)

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 163-215, warpins: 0 ---
			for slot19, slot20 in slot16, slot17, slot18 do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 163-165, warpins: 1 ---
				slot21 = slot20.id

				if not slot21 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 166-172, warpins: 1 ---
					slot21 = #slot15
					slot21 = slot21 + 1
					slot22 = {
						equipment = false,
						torpedoAmmo = 0
					}
					slot23 = slot20.skin
					slot22.skin = slot23
					slot15[slot21] = slot22
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 173-175, warpins: 1 ---
					slot21 = slot20.equipmentInfo

					if slot21 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 176-180, warpins: 1 ---
						slot21 = slot20.equipmentInfo
						slot21 = slot21.config
						slot21 = slot21.torpedo_ammo

						if not slot21 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 181-181, warpins: 2 ---
							slot21 = 0
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 182-183, warpins: 2 ---
					if slot14 and slot19 > slot14 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 186-193, warpins: 1 ---
						slot22 = slot2
						slot22 = slot22.GetWeaponDataFromID
						slot23 = slot20.id
						slot22 = slot22(slot23)
						slot22 = slot22.weapon_id
						slot22 = #slot22

						if slot22 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 194-206, warpins: 3 ---
							slot22 = slot2
							slot22 = slot22.GetWeaponDataFromID
							slot23 = slot20.id
							slot22 = slot22(slot23)
							slot23 = #slot15
							slot23 = slot23 + 1
							slot24 = {}
							slot24.equipment = slot22
							slot25 = slot20.skin
							slot24.skin = slot25
							slot24.torpedoAmmo = slot21
							slot15[slot23] = slot24
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 207-213, warpins: 1 ---
							slot22 = #slot15
							slot22 = slot22 + 1
							slot23 = {
								equipment = false
							}
							slot24 = slot20.skin
							slot23.skin = slot24
							slot23.torpedoAmmo = slot21
							slot15[slot22] = slot23
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #1 ---



				end
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 214-215, warpins: 4 ---
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 216-224, warpins: 2 ---
	slot17 = slot13
	slot16 = slot13.SetProficiencyList
	slot18 = slot7

	slot16(slot17, slot18)

	slot17 = slot13
	slot16 = slot13.SetEquipment
	slot18 = slot15

	slot16(slot17, slot18)

	return slot13
	--- END OF BLOCK #3 ---



end

slot25.CreateBattleUnitData = slot26

function slot26(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot2 = slot0.skills

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		slot2 = {}
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-8, warpins: 2 ---
	slot3 = pairs
	slot4 = slot2
	slot3, slot4, slot5 = slot3(slot4)

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 9-22, warpins: 0 ---
	for slot6, slot7 in slot3, slot4, slot5 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-20, warpins: 1 ---
		slot8 = slot0
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
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 21-22, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 23-23, warpins: 1 ---
	return
	--- END OF BLOCK #3 ---



end

slot25.InitUnitSkill = slot26

function slot26(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot1 = Ship
	slot1 = slot1.WEAPON_COUNT
	slot2 = {}
	slot3 = ipairs
	slot4 = slot0
	slot3, slot4, slot5 = slot3(slot4)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-56, warpins: 0 ---
	for slot6, slot7 in slot3, slot4, slot5 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-10, warpins: 1 ---
		slot8 = slot7.id

		if slot8 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 11-13, warpins: 1 ---
			slot9 = nil

			if slot1 and slot1 < slot6 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 16-21, warpins: 1 ---
				slot10 = slot0
				slot10 = slot10.GetWeaponDataFromID
				slot11 = slot8
				slot10 = slot10(slot11)

				if slot10 ~= nil then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 22-23, warpins: 1 ---
					slot9 = slot10.skill_id
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 24-28, warpins: 2 ---
				slot10 = slot0
				slot10 = slot10.GetWeaponDataFromID
				slot11 = slot8
				slot10 = slot10(slot11)
				slot9 = slot10.skill_id
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 29-33, warpins: 3 ---
			slot10 = type
			slot11 = slot7.equipmentInfo
			slot10 = slot10(slot11)

			if slot10 == "table" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 34-43, warpins: 1 ---
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
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 44-47, warpins: 2 ---
			slot10 = ipairs
			slot11 = slot9
			slot10, slot11, slot12 = slot10(slot11)

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 48-54, warpins: 0 ---
			for slot13, slot14 in slot10, slot11, slot12 do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 48-52, warpins: 1 ---
				slot15 = table
				slot15 = slot15.insert
				slot16 = slot2
				slot17 = slot14

				slot15(slot16, slot17)
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 53-54, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #3 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 55-56, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 57-57, warpins: 1 ---
	return slot2
	--- END OF BLOCK #2 ---



end

slot25.GetEquipSkill = slot26

function slot26(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot2 = slot0
	slot2 = slot2.GetEquipSkill
	slot3 = slot0
	slot2 = slot2(slot3)
	slot3 = ipairs
	slot4 = slot2
	slot3, slot4, slot5 = slot3(slot4)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-22, warpins: 0 ---
	for slot6, slot7 in slot3, slot4, slot5 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-20, warpins: 1 ---
		slot8 = slot1
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
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 21-22, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 23-23, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

slot25.InitEquipSkill = slot26

function slot26(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if not slot0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-3, warpins: 1 ---
		slot0 = {}
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-15, warpins: 2 ---
	slot2 = slot0
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

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 16-56, warpins: 0 ---
	for slot6, slot7 in slot3, slot4, slot5 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-26, warpins: 1 ---
		slot8 = slot0
		slot8 = slot8.Battle
		slot8 = slot8.BattleDataFunction
		slot8 = slot8.GetBuffTemplate
		slot9 = slot7.id
		slot10 = slot7.level
		slot8 = slot8(slot9, slot10)
		slot8 = slot8.limit
		slot9 = false

		if slot8 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 27-30, warpins: 1 ---
			slot10 = ipairs
			slot11 = slot8
			slot10, slot11, slot12 = slot10(slot11)

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 31-36, warpins: 0 ---
			for slot13, slot14 in slot10, slot11, slot12 do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 31-32, warpins: 1 ---
				if slot2 == slot14 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 33-34, warpins: 1 ---
					slot9 = true

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 35-35, warpins: 1 ---
					break
					--- END OF BLOCK #1 ---



				end
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 35-36, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 37-38, warpins: 3 ---
		if not slot9 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 39-54, warpins: 1 ---
			slot10 = slot0
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
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 55-56, warpins: 3 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 57-57, warpins: 1 ---
	return
	--- END OF BLOCK #3 ---



end

slot25.InitCommanderSkill = slot26

function slot26(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-3, warpins: 1 ---
		slot3 = -1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-13, warpins: 2 ---
	slot6 = slot1
	slot5 = slot1.GetUnitType
	slot5 = slot5(slot6)
	slot6 = nil
	slot7 = slot0
	slot7 = slot7.GetWeaponPropertyDataFromID
	slot8 = slot0
	slot7 = slot7(slot8)

	if not slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-14, warpins: 1 ---
		slot8 = slot7.type
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 15-19, warpins: 2 ---
	slot9 = slot1
	slot9 = slot9.EquipmentType
	slot9 = slot9.MAIN_CANNON

	if slot8 == slot9 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 20-26, warpins: 1 ---
		slot9 = slot2
		slot9 = slot9.Battle
		slot9 = slot9.BattleWeaponUnit
		slot9 = slot9.New
		slot9 = slot9()
		slot6 = slot9
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 27-31, warpins: 1 ---
		slot9 = slot1
		slot9 = slot9.EquipmentType
		slot9 = slot9.SUB_CANNON

		if slot8 == slot9 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 32-38, warpins: 1 ---
			slot9 = slot2
			slot9 = slot9.Battle
			slot9 = slot9.BattleWeaponUnit
			slot9 = slot9.New
			slot9 = slot9()
			slot6 = slot9
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 39-43, warpins: 1 ---
			slot9 = slot1
			slot9 = slot9.EquipmentType
			slot9 = slot9.TORPEDO

			if slot8 == slot9 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 44-50, warpins: 1 ---
				slot9 = slot2
				slot9 = slot9.Battle
				slot9 = slot9.BattleTorpedoUnit
				slot9 = slot9.New
				slot9 = slot9()
				slot6 = slot9
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 51-55, warpins: 1 ---
				slot9 = slot1
				slot9 = slot9.EquipmentType
				slot9 = slot9.MANUAL_TORPEDO

				if slot8 == slot9 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 56-62, warpins: 1 ---
					slot9 = slot2
					slot9 = slot9.Battle
					slot9 = slot9.BattleManualTorpedoUnit
					slot9 = slot9.New
					slot9 = slot9()
					slot6 = slot9
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 63-67, warpins: 1 ---
					slot9 = slot1
					slot9 = slot9.EquipmentType
					slot9 = slot9.ANTI_AIR

					if slot8 == slot9 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 68-74, warpins: 1 ---
						slot9 = slot2
						slot9 = slot9.Battle
						slot9 = slot9.BattleAntiAirUnit
						slot9 = slot9.New
						slot9 = slot9()
						slot6 = slot9
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 75-79, warpins: 1 ---
						slot9 = slot1
						slot9 = slot9.EquipmentType
						slot9 = slot9.FLEET_ANTI_AIR

						if slot8 == slot9 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 80-86, warpins: 1 ---
							slot9 = slot2
							slot9 = slot9.Battle
							slot9 = slot9.BattleWeaponUnit
							slot9 = slot9.New
							slot9 = slot9()
							slot6 = slot9
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 87-91, warpins: 1 ---
							slot9 = slot1
							slot9 = slot9.EquipmentType
							slot9 = slot9.SCOUT

							if slot8 ~= slot9 then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 92-96, warpins: 1 ---
								slot9 = slot1
								slot9 = slot9.EquipmentType
								slot9 = slot9.PASSIVE_SCOUT

								if slot8 == slot9 then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 97-103, warpins: 2 ---
									slot9 = slot2
									slot9 = slot9.Battle
									slot9 = slot9.BattleHiveUnit
									slot9 = slot9.New
									slot9 = slot9()
									slot6 = slot9
									--- END OF BLOCK #0 ---



								else

									-- Decompilation error in this vicinity:
									--- BLOCK #0 104-108, warpins: 1 ---
									slot9 = slot1
									slot9 = slot9.EquipmentType
									slot9 = slot9.SPECIAL

									if slot8 == slot9 then

										-- Decompilation error in this vicinity:
										--- BLOCK #0 109-115, warpins: 1 ---
										slot9 = slot2
										slot9 = slot9.Battle
										slot9 = slot9.BattleSpecialWeapon
										slot9 = slot9.New
										slot9 = slot9()
										slot6 = slot9
										--- END OF BLOCK #0 ---



									else

										-- Decompilation error in this vicinity:
										--- BLOCK #0 116-120, warpins: 1 ---
										slot9 = slot1
										slot9 = slot9.EquipmentType
										slot9 = slot9.ANTI_SEA

										if slot8 == slot9 then

											-- Decompilation error in this vicinity:
											--- BLOCK #0 121-127, warpins: 1 ---
											slot9 = slot2
											slot9 = slot9.Battle
											slot9 = slot9.BattleDirectHitWeaponUnit
											slot9 = slot9.New
											slot9 = slot9()
											slot6 = slot9
											--- END OF BLOCK #0 ---



										else

											-- Decompilation error in this vicinity:
											--- BLOCK #0 128-132, warpins: 1 ---
											slot9 = slot1
											slot9 = slot9.EquipmentType
											slot9 = slot9.HAMMER_HEAD

											if slot8 == slot9 then

												-- Decompilation error in this vicinity:
												--- BLOCK #0 133-139, warpins: 1 ---
												slot9 = slot2
												slot9 = slot9.Battle
												slot9 = slot9.BattleHammerHeadWeaponUnit
												slot9 = slot9.New
												slot9 = slot9()
												slot6 = slot9
												--- END OF BLOCK #0 ---



											else

												-- Decompilation error in this vicinity:
												--- BLOCK #0 140-144, warpins: 1 ---
												slot9 = slot1
												slot9 = slot9.EquipmentType
												slot9 = slot9.BOMBER_PRE_CAST_ALERT

												if slot8 == slot9 then

													-- Decompilation error in this vicinity:
													--- BLOCK #0 145-151, warpins: 1 ---
													slot9 = slot2
													slot9 = slot9.Battle
													slot9 = slot9.BattleBombWeaponUnit
													slot9 = slot9.New
													slot9 = slot9()
													slot6 = slot9
													--- END OF BLOCK #0 ---



												else

													-- Decompilation error in this vicinity:
													--- BLOCK #0 152-156, warpins: 1 ---
													slot9 = slot1
													slot9 = slot9.EquipmentType
													slot9 = slot9.POINT_HIT_AND_LOCK

													if slot8 == slot9 then

														-- Decompilation error in this vicinity:
														--- BLOCK #0 157-163, warpins: 1 ---
														slot9 = slot2
														slot9 = slot9.Battle
														slot9 = slot9.BattlePointHitWeaponUnit
														slot9 = slot9.New
														slot9 = slot9()
														slot6 = slot9
														--- END OF BLOCK #0 ---



													else

														-- Decompilation error in this vicinity:
														--- BLOCK #0 164-168, warpins: 1 ---
														slot9 = slot1
														slot9 = slot9.EquipmentType
														slot9 = slot9.BEAM

														if slot8 == slot9 then

															-- Decompilation error in this vicinity:
															--- BLOCK #0 169-175, warpins: 1 ---
															slot9 = slot2
															slot9 = slot9.Battle
															slot9 = slot9.BattleLaserUnit
															slot9 = slot9.New
															slot9 = slot9()
															slot6 = slot9
															--- END OF BLOCK #0 ---



														else

															-- Decompilation error in this vicinity:
															--- BLOCK #0 176-180, warpins: 1 ---
															slot9 = slot1
															slot9 = slot9.EquipmentType
															slot9 = slot9.DEPTH_CHARGE

															if slot8 == slot9 then

																-- Decompilation error in this vicinity:
																--- BLOCK #0 181-187, warpins: 1 ---
																slot9 = slot2
																slot9 = slot9.Battle
																slot9 = slot9.BattleDepthChargeUnit
																slot9 = slot9.New
																slot9 = slot9()
																slot6 = slot9
																--- END OF BLOCK #0 ---



															else

																-- Decompilation error in this vicinity:
																--- BLOCK #0 188-192, warpins: 1 ---
																slot9 = slot1
																slot9 = slot9.EquipmentType
																slot9 = slot9.REPEATER_ANTI_AIR

																if slot8 == slot9 then

																	-- Decompilation error in this vicinity:
																	--- BLOCK #0 193-199, warpins: 1 ---
																	slot9 = slot2
																	slot9 = slot9.Battle
																	slot9 = slot9.BattleRepeaterAntiAirUnit
																	slot9 = slot9.New
																	slot9 = slot9()
																	slot6 = slot9
																	--- END OF BLOCK #0 ---



																else

																	-- Decompilation error in this vicinity:
																	--- BLOCK #0 200-204, warpins: 1 ---
																	slot9 = slot1
																	slot9 = slot9.EquipmentType
																	slot9 = slot9.DISPOSABLE_TORPEDO

																	if slot8 == slot9 then

																		-- Decompilation error in this vicinity:
																		--- BLOCK #0 205-210, warpins: 1 ---
																		slot9 = slot2
																		slot9 = slot9.Battle
																		slot9 = slot9.BattleDisposableTorpedoUnit
																		slot9 = slot9.New
																		slot9 = slot9()
																		slot6 = slot9
																		--- END OF BLOCK #0 ---



																	end
																	--- END OF BLOCK #0 ---



																end
																--- END OF BLOCK #0 ---



															end
															--- END OF BLOCK #0 ---



														end
														--- END OF BLOCK #0 ---



													end
													--- END OF BLOCK #0 ---



												end
												--- END OF BLOCK #0 ---



											end
											--- END OF BLOCK #0 ---



										end
										--- END OF BLOCK #0 ---



									end
									--- END OF BLOCK #0 ---



								end
								--- END OF BLOCK #0 ---



							end
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 211-231, warpins: 17 ---
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

	slot9 = slot1
	slot9 = slot9.UnitType
	slot9 = slot9.PLAYER_UNIT

	if slot5 == slot9 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 232-235, warpins: 1 ---
		slot9 = slot7.auto_aftercast
		slot10 = 0

		if slot9 > slot10 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 236-240, warpins: 1 ---
			slot10 = slot6
			slot9 = slot6.OverrideGCD
			slot11 = slot7.auto_aftercast

			slot9(slot10, slot11)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 241-245, warpins: 1 ---
		slot9 = slot1
		slot9 = slot9.UnitType
		slot9 = slot9.ENEMY_UNIT

		if slot5 ~= slot9 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 246-250, warpins: 1 ---
			slot9 = slot1
			slot9 = slot9.UnitType
			slot9 = slot9.BOSS_UNIT

			if slot9 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 251-253, warpins: 2 ---
				slot10 = slot6
				slot9 = slot6.HostOnEnemy

				slot9(slot10)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 254-259, warpins: 4 ---
	slot9 = slot7.type
	slot10 = slot1
	slot10 = slot10.EquipmentType
	slot10 = slot10.SCOUT

	if slot9 ~= slot10 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 260-265, warpins: 1 ---
		slot9 = slot7.type
		slot10 = slot1
		slot10 = slot10.EquipmentType
		slot10 = slot10.PASSIVE_SCOUT

		if slot9 == slot10 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 266-268, warpins: 2 ---
			slot10 = slot6
			slot9 = slot6.EnterCoolDown

			slot9(slot10)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 269-269, warpins: 2 ---
	return slot6
	--- END OF BLOCK #5 ---



end

slot25.CreateWeaponUnit = slot26

function slot26(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot4 = nil
	slot5 = slot0
	slot5 = slot5.GetAircraftTmpDataFromID
	slot6 = slot1
	slot5 = slot5(slot6)
	slot6 = type
	slot7 = slot5.funnel_behavior
	slot6 = slot6(slot7)

	if slot6 == "table" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-14, warpins: 1 ---
		slot6 = slot5.funnel_behavior
		slot6 = slot6.hover_range

		if slot6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-22, warpins: 1 ---
			slot6 = slot1
			slot6 = slot6.Battle
			slot6 = slot6.BattelUAVUnit
			slot6 = slot6.New
			slot7 = slot0
			slot6 = slot6(slot7)
			slot4 = slot6
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 23-30, warpins: 1 ---
			slot6 = slot1
			slot6 = slot6.Battle
			slot6 = slot6.BattleFunnelUnit
			slot6 = slot6.New
			slot7 = slot0
			slot6 = slot6(slot7)
			slot4 = slot6
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 31-37, warpins: 1 ---
		slot6 = slot1
		slot6 = slot6.Battle
		slot6 = slot6.BattleAircraftUnit
		slot6 = slot6.New
		slot7 = slot0
		slot6 = slot6(slot7)
		slot4 = slot6
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 38-50, warpins: 3 ---
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
	--- END OF BLOCK #1 ---



end

slot25.CreateAircraftUnit = slot26

function slot26(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	slot2 = slot0
	slot1 = slot0.GetTemplateID
	slot1 = slot1(slot2)
	slot2 = slot0
	slot2 = slot2.GetPlayerShipModelFromID
	slot3 = slot1
	slot2 = slot2(slot3)
	slot3 = 0
	slot4 = {}
	slot5 = ipairs
	slot6 = slot2.airassist_time
	slot5, slot6, slot7 = slot5(slot6)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 14-26, warpins: 0 ---
	for slot8, slot9 in slot5, slot6, slot7 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-24, warpins: 1 ---
		slot10 = slot1
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
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 25-26, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 27-27, warpins: 1 ---
	return slot4
	--- END OF BLOCK #2 ---



end

slot25.CreateAllInStrike = slot26

function slot26(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	slot2 = slot0
	slot1 = slot0.GetTemplateID
	slot1 = slot1(slot2)
	slot2 = slot0
	slot2 = slot2.GetPlayerShipModelFromID
	slot3 = slot1
	slot2 = slot2(slot3)
	slot3 = slot2.airassist_time
	slot4 = #slot3
	slot5 = 0

	if slot4 > slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-50, warpins: 1 ---
		slot4 = #slot3
		slot4 = slot3[slot4]
		slot5 = slot1
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
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 51-51, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot25.ExpandAllinStrike = slot26

function slot26(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-21, warpins: 1 ---
	slot2 = nil
	slot3 = slot0
	slot3 = slot3.GetAircraftTmpDataFromID
	slot4 = slot1.templateID
	slot3 = slot3(slot4)
	slot4 = slot1
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
	--- END OF BLOCK #0 ---



end

slot25.CreateAirFighterUnit = slot26

function slot26(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot1 = Clone
	slot2 = slot0
	slot2 = slot2[slot0]

	return slot1(slot2)
	--- END OF BLOCK #0 ---



end

slot25.GetPlayerShipTmpDataFromID = slot26

function slot26(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot1 = slot0
	slot1 = slot1[slot0]

	return slot1
	--- END OF BLOCK #0 ---



end

slot25.GetPlayerShipModelFromID = slot26

function slot26(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot1 = slot0
	slot1 = slot1[slot0]

	return slot1
	--- END OF BLOCK #0 ---



end

slot25.GetPlayerShipSkinDataFromID = slot26

function slot26(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot1 = slot0
	slot1 = slot1[slot0]

	return slot1
	--- END OF BLOCK #0 ---



end

slot25.GetShipTypeTmp = slot26

function slot26(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot1 = slot0
	slot1 = slot1[slot0]

	return slot1
	--- END OF BLOCK #0 ---



end

slot25.GetMonsterTmpDataFromID = slot26

function slot26(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot1 = slot0
	slot1 = slot1[slot0]

	return slot1
	--- END OF BLOCK #0 ---



end

slot25.GetAircraftTmpDataFromID = slot26

function slot26(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot1 = Equipment
	slot1 = slot1.EQUIPMENT_STATE_EMPTY

	if slot0 ~= slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-8, warpins: 1 ---
		slot1 = Equipment
		slot1 = slot1.EQUIPMENT_STATE_LOCK

		if slot0 ~= slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-9, warpins: 1 ---
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-11, warpins: 3 ---
	slot1 = slot0
	slot1 = slot1[slot0]

	return slot1
	--- END OF BLOCK #1 ---



end

slot25.GetWeaponDataFromID = slot26

function slot26(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot1 = slot0
	slot1 = slot1[slot0]

	return slot1
	--- END OF BLOCK #0 ---



end

slot25.GetEquipDataTemplate = slot26

function slot26(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot1 = slot0
	slot1 = slot1[slot0]

	return slot1
	--- END OF BLOCK #0 ---



end

slot25.GetWeaponPropertyDataFromID = slot26

function slot26(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot1 = slot0
	slot1 = slot1[slot0]

	return slot1
	--- END OF BLOCK #0 ---



end

slot25.GetFormationTmpDataFromID = slot26

function slot26(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot1 = slot0
	slot1 = slot1[slot0]

	return slot1
	--- END OF BLOCK #0 ---



end

slot25.GetAITmpDataFromID = slot26

function slot26(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot1 = slot0
	slot1 = slot1[slot0]

	return slot1
	--- END OF BLOCK #0 ---



end

slot25.GetShipPersonality = slot26

function slot26(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot1 = slot0
	slot1 = slot1[slot0]

	return slot1
	--- END OF BLOCK #0 ---



end

slot25.GetEnemyTypeDataByType = slot26

function slot26(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot1 = slot0
	slot1 = slot1.GetShipTypeTmp
	slot2 = slot0
	slot1 = slot1(slot2)
	slot1 = slot1.arena_buff

	return slot1
	--- END OF BLOCK #0 ---



end

slot25.GetArenaBuffByShipType = slot26

function slot26(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot2 = SYSTEM_DUEL

	if slot0 ~= slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-6, warpins: 1 ---
		slot2 = SYSTEM_SHAM

		if slot0 == slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-14, warpins: 2 ---
			slot2 = slot0
			slot2 = slot2[slot1]
			slot2 = slot2.arena_durability_ratio
			slot3 = slot0
			slot3 = slot3[slot1]
			slot3 = slot3.arena_durability_add

			return slot2, slot3
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-17, warpins: 1 ---
			slot2 = 1
			slot3 = 0

			return slot2, slot3
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 18-18, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot25.GetPlayerUnitDurabilityExtraAddition = slot26

function slot26(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot1 = slot0
	slot1 = slot1[slot0]

	return slot1
	--- END OF BLOCK #0 ---



end

slot25.GetSkillDataTemplate = slot26

function slot26(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot1 = slot0
	slot1 = slot1.GetPlayerShipModelFromID
	slot2 = slot0
	slot1 = slot1(slot2)
	slot2 = slot1
	slot3 = slot1.group_type
	slot2 = slot2[slot3]

	return slot2
	--- END OF BLOCK #0 ---



end

slot25.GetShipTransformDataTemplate = slot26

function slot26(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot1 = slot0
	slot1 = slot1[slot0]

	return slot1
	--- END OF BLOCK #0 ---



end

slot25.GetEquipSkinDataFromID = slot26

function slot26(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot1 = slot0
	slot1 = slot1[slot0]
	slot2 = slot1.bullet_name
	slot3 = slot1.derivate_bullet
	slot4 = slot1.derivate_torpedo
	slot5 = slot1.derivate_boom

	return slot2, slot3, slot4, slot5
	--- END OF BLOCK #0 ---



end

slot25.GetEquipSkin = slot26

function slot26(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot2 = slot0
	slot2 = slot2[slot0]
	slot3 = slot1
	slot4 = slot2.config_id
	slot3 = slot3[slot4]
	slot4 = slot3.ex_expedition_enemy
	slot5 = nil
	slot6 = ipairs
	slot7 = slot4
	slot6, slot7, slot8 = slot6(slot7)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-18, warpins: 0 ---
	for slot9, slot10 in slot6, slot7, slot8 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-14, warpins: 1 ---
		slot11 = slot10[1]

		if slot11 == slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-16, warpins: 1 ---
			slot5 = slot10[2]

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 17-17, warpins: 1 ---
			break
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 17-18, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 19-19, warpins: 2 ---
	return slot5
	--- END OF BLOCK #2 ---



end

slot25.GetSpecificEnemyList = slot26

function slot26(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot3 = ipairs
	slot4 = slot2
	slot3, slot4, slot5 = slot3(slot4)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-16, warpins: 0 ---
	for slot6, slot7 in slot3, slot4, slot5 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-7, warpins: 1 ---
		slot8 = slot7[slot1]

		if slot8 ~= nil then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-12, warpins: 1 ---
			slot8 = type
			slot9 = slot7[slot1]
			slot8 = slot8(slot9)

			if slot8 == "number" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 13-14, warpins: 1 ---
				slot8 = slot7[slot1]
				slot0 = slot0 + slot8
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 15-16, warpins: 4 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 17-17, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

slot25.IncreaseAttributes = slot26

function slot26(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot4 = nil
	slot5 = slot0
	slot5 = slot5.GetWeaponPropertyDataFromID
	slot6 = slot0
	slot5 = slot5(slot6)
	slot6 = slot5.type
	slot7 = slot1
	slot7 = slot7.EquipmentType
	slot7 = slot7.MAIN_CANNON

	if slot6 == slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-18, warpins: 1 ---
		slot6 = slot2
		slot6 = slot6.Battle
		slot6 = slot6.BattleWeaponUnit
		slot6 = slot6.New
		slot6 = slot6()
		slot4 = slot6
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-24, warpins: 1 ---
		slot6 = slot5.type
		slot7 = slot1
		slot7 = slot7.EquipmentType
		slot7 = slot7.SUB_CANNON

		if slot6 == slot7 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 25-31, warpins: 1 ---
			slot6 = slot2
			slot6 = slot6.Battle
			slot6 = slot6.BattleWeaponUnit
			slot6 = slot6.New
			slot6 = slot6()
			slot4 = slot6
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 32-37, warpins: 1 ---
			slot6 = slot5.type
			slot7 = slot1
			slot7 = slot7.EquipmentType
			slot7 = slot7.TORPEDO

			if slot6 == slot7 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 38-44, warpins: 1 ---
				slot6 = slot2
				slot6 = slot6.Battle
				slot6 = slot6.BattleTorpedoUnit
				slot6 = slot6.New
				slot6 = slot6()
				slot4 = slot6
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 45-50, warpins: 1 ---
				slot6 = slot5.type
				slot7 = slot1
				slot7 = slot7.EquipmentType
				slot7 = slot7.ANTI_AIR

				if slot6 == slot7 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 51-57, warpins: 1 ---
					slot6 = slot2
					slot6 = slot6.Battle
					slot6 = slot6.BattleAntiAirUnit
					slot6 = slot6.New
					slot6 = slot6()
					slot4 = slot6
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 58-63, warpins: 1 ---
					slot6 = slot5.type
					slot7 = slot1
					slot7 = slot7.EquipmentType
					slot7 = slot7.ANTI_SEA

					if slot6 == slot7 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 64-70, warpins: 1 ---
						slot6 = slot2
						slot6 = slot6.Battle
						slot6 = slot6.BattleDirectHitWeaponUnit
						slot6 = slot6.New
						slot6 = slot6()
						slot4 = slot6
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 71-76, warpins: 1 ---
						slot6 = slot5.type
						slot7 = slot1
						slot7 = slot7.EquipmentType
						slot7 = slot7.HAMMER_HEAD

						if slot6 == slot7 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 77-83, warpins: 1 ---
							slot6 = slot2
							slot6 = slot6.Battle
							slot6 = slot6.BattleHammerHeadWeaponUnit
							slot6 = slot6.New
							slot6 = slot6()
							slot4 = slot6
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 84-89, warpins: 1 ---
							slot6 = slot5.type
							slot7 = slot1
							slot7 = slot7.EquipmentType
							slot7 = slot7.BOMBER_PRE_CAST_ALERT

							if slot6 == slot7 then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 90-96, warpins: 1 ---
								slot6 = slot2
								slot6 = slot6.Battle
								slot6 = slot6.BattleBombWeaponUnit
								slot6 = slot6.New
								slot6 = slot6()
								slot4 = slot6
								--- END OF BLOCK #0 ---



							else

								-- Decompilation error in this vicinity:
								--- BLOCK #0 97-102, warpins: 1 ---
								slot6 = slot5.type
								slot7 = slot1
								slot7 = slot7.EquipmentType
								slot7 = slot7.DEPTH_CHARGE

								if slot6 == slot7 then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 103-108, warpins: 1 ---
									slot6 = slot2
									slot6 = slot6.Battle
									slot6 = slot6.BattleDepthChargeUnit
									slot6 = slot6.New
									slot6 = slot6()
									slot4 = slot6
									--- END OF BLOCK #0 ---



								end
								--- END OF BLOCK #0 ---



							end
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 109-127, warpins: 9 ---
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
	--- END OF BLOCK #1 ---



end

slot25.CreateAirFighterWeaponUnit = slot26

function slot26(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
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
	--- END OF BLOCK #0 ---



end

slot25.GetWords = slot26

function slot26(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot2 = slot0
	slot2 = slot2.GetSkillDataTemplate
	slot3 = slot1
	slot2 = slot2(slot3)
	slot3 = slot2.system_transform
	slot4 = slot3[slot0]

	if slot4 == nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-10, warpins: 1 ---
		return slot1
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-12, warpins: 1 ---
		slot4 = slot3[slot0]

		return slot4
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 13-13, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot25.SkillTranform = slot26

function slot26(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot1 = slot0
	slot1 = slot1.GetPlayerShipModelFromID
	slot2 = slot0
	slot1 = slot1(slot2)
	slot1 = slot1.hide_buff_list
	slot2 = {}
	slot3 = ipairs
	slot4 = slot1
	slot3, slot4, slot5 = slot3(slot4)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-17, warpins: 0 ---
	for slot6, slot7 in slot3, slot4, slot5 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-15, warpins: 1 ---
		slot8 = {}
		slot9 = 1
		slot8.level = slot9
		slot8.id = slot7
		slot2[slot7] = slot8
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 16-17, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 18-18, warpins: 1 ---
	return slot2
	--- END OF BLOCK #2 ---



end

slot25.GenerateHiddenBuff = slot26

function slot26(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot1 = slot0
	slot1 = slot1[slot0]
	slot1 = slot1.diving_filter

	return slot1
	--- END OF BLOCK #0 ---



end

slot25.GetDivingFilter = slot26

function slot26(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-17, warpins: 1 ---
	slot5 = slot0 - slot2
	slot6 = {}
	slot7 = {
		index = 0,
		switchType = 3,
		switchTo = 1
	}
	slot7.switchParam = slot5
	slot6[1] = slot7
	slot7 = {
		index = 1,
		dive = "STATE_RAID",
		switchTo = 2,
		switchType = 1
	}
	slot7.switchParamFunc = slot3
	slot6[2] = slot7
	slot7 = {
		switchType = 1,
		dive = "STATE_FLOAT",
		switchTo = 3,
		index = 2
	}
	slot7.switchParam = slot4
	slot6[3] = slot7
	slot7 = {
		switchType = 4,
		dive = "STATE_RETREAT",
		switchTo = 4,
		index = 3
	}
	slot7.switchParam = slot1
	slot6[4] = slot7
	slot7 = {
		index = 4,
		retreat = true
	}
	slot6[5] = slot7

	return slot6
	--- END OF BLOCK #0 ---



end

slot25.GeneratePlayerSubmarinPhase = slot26

return

--- END OF BLOCK #1 ---

FLOW; TARGET BLOCK #3



-- Decompilation error in this vicinity:
--- BLOCK #2 60-60, warpins: 1 ---
slot26 = 
--- END OF BLOCK #2 ---

FLOW; TARGET BLOCK #3



-- Decompilation error in this vicinity:
--- BLOCK #3 61-139, warpins: 2 ---
--- END OF BLOCK #3 ---



