
-- Decompilation error in this vicinity:
--- BLOCK #0 1-3, warpins: 1 ---
slot0 = ys or {}
ys = ys or 
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

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot13, slot14 = nil

	if slot1 == slot0.UnitType.PLAYER_UNIT then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-30, warpins: 1 ---
		slot1.Battle.BattlePlayerUnit.New(slot0, slot2).SetSkinId(slot13, slot4)
		slot1.Battle.BattlePlayerUnit.New(slot0, slot2).SetRepressReduce(slot13, slot9)
		slot1.Battle.BattlePlayerUnit.New(slot0, slot2):SetWeaponInfo(slot11, slot12)

		slot14 = Ship.WEAPON_COUNT
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 31-35, warpins: 1 ---
		if slot1 == slot0.UnitType.SUB_UNIT then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 36-59, warpins: 1 ---
			slot1.Battle.BattleSubUnit.New(slot0, slot2).SetSkinId(slot13, slot4)
			slot1.Battle.BattleSubUnit.New(slot0, slot2).SetRepressReduce(slot13, slot9)
			slot1.Battle.BattleSubUnit.New(slot0, slot2):SetWeaponInfo(slot11, slot12)

			slot14 = Ship.WEAPON_COUNT
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 60-64, warpins: 1 ---
			if slot1 == slot0.UnitType.ENEMY_UNIT then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 65-77, warpins: 1 ---
				slot1.Battle.BattleEnemyUnit.New(slot0, slot2):SetRepress(slot8)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 78-82, warpins: 1 ---
				if slot1 == slot0.UnitType.BOSS_UNIT then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 83-95, warpins: 1 ---
					slot1.Battle.BattleBossUnit.New(slot0, slot2):SetRepress(slot8)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 96-100, warpins: 1 ---
					if slot1 == slot0.UnitType.NPC_UNIT then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 101-108, warpins: 1 ---
						slot13 = slot1.Battle.BattleNPCUnit.New(slot0, slot2)
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
	slot13:SetTemplate(slot3, slot6)

	if slot1 == slot0.UnitType.ENEMY_UNIT or slot1 == slot0.UnitType.BOSS_UNIT then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 124-130, warpins: 2 ---
		slot13:SetCurrentHP(slot13:GetMaxHP() * slot10)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 131-136, warpins: 2 ---
	slot15 = {}

	if slot1 == slot0.UnitType.ENEMY_UNIT or slot1 == slot0.UnitType.BOSS_UNIT then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 142-145, warpins: 2 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 146-157, warpins: 0 ---
		for slot19, slot20 in ipairs(slot5) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 146-155, warpins: 1 ---
			slot15[#slot15 + 1] = {
				equipment = {
					weapon_id = {
						slot20.id
					}
				}
			}
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
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 163-215, warpins: 0 ---
		for slot19, slot20 in ipairs(slot5) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 163-165, warpins: 1 ---
			if not slot20.id then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 166-172, warpins: 1 ---
				slot15[#slot15 + 1] = {
					equipment = false,
					torpedoAmmo = 0,
					skin = slot20.skin
				}
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 173-175, warpins: 1 ---
				if not slot20.equipmentInfo or not slot20.equipmentInfo.config.torpedo_ammo then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 181-181, warpins: 2 ---
					slot21 = 0
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 182-183, warpins: 2 ---
				if not slot14 or slot19 <= slot14 or #slot2.GetWeaponDataFromID(slot20.id).weapon_id then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 194-206, warpins: 3 ---
					slot15[#slot15 + 1] = {
						equipment = slot2.GetWeaponDataFromID(slot20.id),
						skin = slot20.skin,
						torpedoAmmo = slot21
					}
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 207-213, warpins: 1 ---
					slot15[#slot15 + 1] = {
						equipment = false,
						skin = slot20.skin,
						torpedoAmmo = slot21
					}
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

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 216-224, warpins: 2 ---
	slot13:SetProficiencyList(slot7)
	slot13:SetEquipment(slot15)

	return slot13
	--- END OF BLOCK #3 ---



end

ys or .Battle.BattleDataFunction.InitUnitSkill = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if not slot0.skills then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		slot2 = {}
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-8, warpins: 2 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 9-22, warpins: 0 ---
	for slot6, slot7 in pairs(slot2) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-20, warpins: 1 ---
		slot1:AddBuff(slot0.Battle.BattleBuffUnit.New(slot7.id, slot7.level, slot1))
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

ys or .Battle.BattleDataFunction.GetEquipSkill = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot1 = Ship.WEAPON_COUNT
	slot2 = {}

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-56, warpins: 0 ---
	for slot6, slot7 in ipairs(slot0) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-10, warpins: 1 ---
		if slot7.id then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 11-13, warpins: 1 ---
			slot9 = nil

			if slot1 and slot1 < slot6 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 16-21, warpins: 1 ---
				if slot0.GetWeaponDataFromID(slot8) ~= nil then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 22-23, warpins: 1 ---
					slot9 = slot10.skill_id
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 24-28, warpins: 2 ---
				slot9 = slot0.GetWeaponDataFromID(slot8).skill_id
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 29-33, warpins: 3 ---
			if type(slot7.equipmentInfo) == "table" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 34-43, warpins: 1 ---
				slot9 = table.merge(slot9, slot7.equipmentInfo:GetAffixBuffList(), true)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 44-47, warpins: 2 ---
			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 48-54, warpins: 0 ---
			for slot13, slot14 in ipairs(slot9) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 48-52, warpins: 1 ---
				table.insert(slot2, slot14)
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

ys or .Battle.BattleDataFunction.InitEquipSkill = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-22, warpins: 0 ---
	for slot6, slot7 in ipairs(slot2) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-20, warpins: 1 ---
		slot1:AddBuff(slot1.Battle.BattleBuffUnit.New(slot7, 1, slot1))
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

ys or .Battle.BattleDataFunction.InitCommanderSkill = function (slot0, slot1)

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
	slot2 = slot0.Battle.BattleState.GetInstance():GetBattleType()

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 16-56, warpins: 0 ---
	for slot6, slot7 in pairs(slot0) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-26, warpins: 1 ---
		slot9 = false

		if slot0.Battle.BattleDataFunction.GetBuffTemplate(slot7.id, slot7.level).limit then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 27-30, warpins: 1 ---
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 31-36, warpins: 0 ---
			for slot13, slot14 in ipairs(slot8) do

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
			slot10 = slot0.Battle.BattleBuffUnit.New(slot7.id, slot7.level, slot1)

			slot10:SetCommander(slot7.commander)
			slot1:AddBuff(slot10)
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

ys or .Battle.BattleDataFunction.CreateWeaponUnit = function (slot0, slot1, slot2, slot3, slot4)

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
	slot5 = slot1:GetUnitType()
	slot6 = nil
	slot7 = slot0:GetWeaponPropertyDataFromID()

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
	if slot8 == slot1.EquipmentType.MAIN_CANNON then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 20-26, warpins: 1 ---
		slot6 = slot2.Battle.BattleWeaponUnit.New()
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 27-31, warpins: 1 ---
		if slot8 == slot1.EquipmentType.SUB_CANNON then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 32-38, warpins: 1 ---
			slot6 = slot2.Battle.BattleWeaponUnit.New()
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 39-43, warpins: 1 ---
			if slot8 == slot1.EquipmentType.TORPEDO then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 44-50, warpins: 1 ---
				slot6 = slot2.Battle.BattleTorpedoUnit.New()
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 51-55, warpins: 1 ---
				if slot8 == slot1.EquipmentType.MANUAL_TORPEDO then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 56-62, warpins: 1 ---
					slot6 = slot2.Battle.BattleManualTorpedoUnit.New()
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 63-67, warpins: 1 ---
					if slot8 == slot1.EquipmentType.ANTI_AIR then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 68-74, warpins: 1 ---
						slot6 = slot2.Battle.BattleAntiAirUnit.New()
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 75-79, warpins: 1 ---
						if slot8 == slot1.EquipmentType.FLEET_ANTI_AIR then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 80-86, warpins: 1 ---
							slot6 = slot2.Battle.BattleWeaponUnit.New()
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 87-91, warpins: 1 ---
							if slot8 == slot1.EquipmentType.SCOUT or slot8 == slot1.EquipmentType.PASSIVE_SCOUT then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 97-103, warpins: 2 ---
								slot6 = slot2.Battle.BattleHiveUnit.New()
								--- END OF BLOCK #0 ---



							else

								-- Decompilation error in this vicinity:
								--- BLOCK #0 104-108, warpins: 1 ---
								if slot8 == slot1.EquipmentType.SPECIAL then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 109-115, warpins: 1 ---
									slot6 = slot2.Battle.BattleSpecialWeapon.New()
									--- END OF BLOCK #0 ---



								else

									-- Decompilation error in this vicinity:
									--- BLOCK #0 116-120, warpins: 1 ---
									if slot8 == slot1.EquipmentType.ANTI_SEA then

										-- Decompilation error in this vicinity:
										--- BLOCK #0 121-127, warpins: 1 ---
										slot6 = slot2.Battle.BattleDirectHitWeaponUnit.New()
										--- END OF BLOCK #0 ---



									else

										-- Decompilation error in this vicinity:
										--- BLOCK #0 128-132, warpins: 1 ---
										if slot8 == slot1.EquipmentType.HAMMER_HEAD then

											-- Decompilation error in this vicinity:
											--- BLOCK #0 133-139, warpins: 1 ---
											slot6 = slot2.Battle.BattleHammerHeadWeaponUnit.New()
											--- END OF BLOCK #0 ---



										else

											-- Decompilation error in this vicinity:
											--- BLOCK #0 140-144, warpins: 1 ---
											if slot8 == slot1.EquipmentType.BOMBER_PRE_CAST_ALERT then

												-- Decompilation error in this vicinity:
												--- BLOCK #0 145-151, warpins: 1 ---
												slot6 = slot2.Battle.BattleBombWeaponUnit.New()
												--- END OF BLOCK #0 ---



											else

												-- Decompilation error in this vicinity:
												--- BLOCK #0 152-156, warpins: 1 ---
												if slot8 == slot1.EquipmentType.POINT_HIT_AND_LOCK then

													-- Decompilation error in this vicinity:
													--- BLOCK #0 157-163, warpins: 1 ---
													slot6 = slot2.Battle.BattlePointHitWeaponUnit.New()
													--- END OF BLOCK #0 ---



												else

													-- Decompilation error in this vicinity:
													--- BLOCK #0 164-168, warpins: 1 ---
													if slot8 == slot1.EquipmentType.BEAM then

														-- Decompilation error in this vicinity:
														--- BLOCK #0 169-175, warpins: 1 ---
														slot6 = slot2.Battle.BattleLaserUnit.New()
														--- END OF BLOCK #0 ---



													else

														-- Decompilation error in this vicinity:
														--- BLOCK #0 176-180, warpins: 1 ---
														if slot8 == slot1.EquipmentType.DEPTH_CHARGE then

															-- Decompilation error in this vicinity:
															--- BLOCK #0 181-187, warpins: 1 ---
															slot6 = slot2.Battle.BattleDepthChargeUnit.New()
															--- END OF BLOCK #0 ---



														else

															-- Decompilation error in this vicinity:
															--- BLOCK #0 188-192, warpins: 1 ---
															if slot8 == slot1.EquipmentType.REPEATER_ANTI_AIR then

																-- Decompilation error in this vicinity:
																--- BLOCK #0 193-199, warpins: 1 ---
																slot6 = slot2.Battle.BattleRepeaterAntiAirUnit.New()
																--- END OF BLOCK #0 ---



															else

																-- Decompilation error in this vicinity:
																--- BLOCK #0 200-204, warpins: 1 ---
																if slot8 == slot1.EquipmentType.DISPOSABLE_TORPEDO then

																	-- Decompilation error in this vicinity:
																	--- BLOCK #0 205-210, warpins: 1 ---
																	slot6 = slot2.Battle.BattleDisposableTorpedoUnit.New()
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
	slot6:SetPotentialFactor(slot2)
	slot6:SetEquipmentIndex(slot3)
	slot6:SetTemplateData(slot7)
	slot6:SetHostData(slot1)

	if slot5 == slot1.UnitType.PLAYER_UNIT then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 232-235, warpins: 1 ---
		if slot7.auto_aftercast > 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 236-240, warpins: 1 ---
			slot6:OverrideGCD(slot7.auto_aftercast)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 241-245, warpins: 1 ---
		if slot5 == slot1.UnitType.ENEMY_UNIT or slot1.UnitType.BOSS_UNIT then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 251-253, warpins: 2 ---
			slot6:HostOnEnemy()
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 254-259, warpins: 4 ---
	if slot7.type == slot1.EquipmentType.SCOUT or slot7.type == slot1.EquipmentType.PASSIVE_SCOUT then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 266-268, warpins: 2 ---
		slot6:EnterCoolDown()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 269-269, warpins: 2 ---
	return slot6
	--- END OF BLOCK #5 ---



end

ys or .Battle.BattleDataFunction.CreateAircraftUnit = function (slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot4 = nil

	if type(slot0.GetAircraftTmpDataFromID(slot1).funnel_behavior) == "table" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-14, warpins: 1 ---
		if slot5.funnel_behavior.hover_range then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-22, warpins: 1 ---
			slot4 = slot1.Battle.BattelUAVUnit.New(slot0)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 23-30, warpins: 1 ---
			slot4 = slot1.Battle.BattleFunnelUnit.New(slot0)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 31-37, warpins: 1 ---
		slot4 = slot1.Battle.BattleAircraftUnit.New(slot0)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 38-50, warpins: 3 ---
	slot4:SetMotherUnit(slot2)
	slot4:SetWeanponPotential(slot3)
	slot4:SetTemplate(slot5)

	return slot4
	--- END OF BLOCK #1 ---



end

ys or .Battle.BattleDataFunction.CreateAllInStrike = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	slot3 = 0
	slot4 = {}

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 14-26, warpins: 0 ---
	for slot8, slot9 in ipairs(slot0.GetPlayerShipModelFromID(slot1).airassist_time) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-24, warpins: 1 ---
		slot10 = slot1.Battle.BattleAllInStrike.New(slot9)

		slot10:SetHost(slot0)

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

ys or .Battle.BattleDataFunction.ExpandAllinStrike = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	if #slot0.GetPlayerShipModelFromID(slot1).airassist_time > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-50, warpins: 1 ---
		slot5 = slot1.Battle.BattleAllInStrike.New(slot4)

		slot5:SetHost(slot0)
		slot0:GetFleetVO():GetAirAssistVO():AppendWeapon(slot5)
		slot5:OverHeat()
		slot0:GetAirAssistQueue():AppendWeapon(slot5)

		slot0:GetAirAssistList()[#slot0.GetAirAssistList() + 1] = slot5
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 51-51, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

ys or .Battle.BattleDataFunction.CreateAirFighterUnit = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-21, warpins: 1 ---
	slot1.Battle.BattleAirFighterUnit.New(slot0).SetWeaponTemplateID(nil, slot1.weaponID)
	slot1.Battle.BattleAirFighterUnit.New(slot0):SetTemplate(slot0.GetAircraftTmpDataFromID(slot1.templateID))

	return slot1.Battle.BattleAirFighterUnit.New(slot0)
	--- END OF BLOCK #0 ---



end

ys or .Battle.BattleDataFunction.GetPlayerShipTmpDataFromID = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	return Clone(slot0[slot0])
	--- END OF BLOCK #0 ---



end

ys or .Battle.BattleDataFunction.GetPlayerShipModelFromID = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	return slot0[slot0]
	--- END OF BLOCK #0 ---



end

ys or .Battle.BattleDataFunction.GetPlayerShipSkinDataFromID = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	return slot0[slot0]
	--- END OF BLOCK #0 ---



end

ys or .Battle.BattleDataFunction.GetShipTypeTmp = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	return slot0[slot0]
	--- END OF BLOCK #0 ---



end

ys or .Battle.BattleDataFunction.GetMonsterTmpDataFromID = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	return slot0[slot0]
	--- END OF BLOCK #0 ---



end

ys or .Battle.BattleDataFunction.GetAircraftTmpDataFromID = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	return slot0[slot0]
	--- END OF BLOCK #0 ---



end

ys or .Battle.BattleDataFunction.GetWeaponDataFromID = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0 ~= Equipment.EQUIPMENT_STATE_EMPTY and slot0 ~= Equipment.EQUIPMENT_STATE_LOCK then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-9, warpins: 1 ---
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-11, warpins: 3 ---
	return slot0[slot0]
	--- END OF BLOCK #1 ---



end

ys or .Battle.BattleDataFunction.GetEquipDataTemplate = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	return slot0[slot0]
	--- END OF BLOCK #0 ---



end

ys or .Battle.BattleDataFunction.GetWeaponPropertyDataFromID = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	return slot0[slot0]
	--- END OF BLOCK #0 ---



end

ys or .Battle.BattleDataFunction.GetFormationTmpDataFromID = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	return slot0[slot0]
	--- END OF BLOCK #0 ---



end

ys or .Battle.BattleDataFunction.GetAITmpDataFromID = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	return slot0[slot0]
	--- END OF BLOCK #0 ---



end

ys or .Battle.BattleDataFunction.GetShipPersonality = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	return slot0[slot0]
	--- END OF BLOCK #0 ---



end

ys or .Battle.BattleDataFunction.GetEnemyTypeDataByType = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	return slot0[slot0]
	--- END OF BLOCK #0 ---



end

ys or .Battle.BattleDataFunction.GetArenaBuffByShipType = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	return slot0:GetShipTypeTmp().arena_buff
	--- END OF BLOCK #0 ---



end

ys or .Battle.BattleDataFunction.GetPlayerUnitDurabilityExtraAddition = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0 == SYSTEM_DUEL or slot0 == SYSTEM_SHAM then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-14, warpins: 2 ---
		return slot0[slot1].arena_durability_ratio, slot0[slot1].arena_durability_add
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-17, warpins: 1 ---
		return 1, 0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 18-18, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

ys or .Battle.BattleDataFunction.GetSkillDataTemplate = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	return slot0[slot0]
	--- END OF BLOCK #0 ---



end

ys or .Battle.BattleDataFunction.GetShipTransformDataTemplate = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	return slot1[slot0:GetPlayerShipModelFromID().group_type]
	--- END OF BLOCK #0 ---



end

ys or .Battle.BattleDataFunction.GetEquipSkinDataFromID = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	return slot0[slot0]
	--- END OF BLOCK #0 ---



end

ys or .Battle.BattleDataFunction.GetEquipSkin = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	return slot0[slot0].bullet_name, slot0[slot0].derivate_bullet, slot0[slot0].derivate_torpedo, slot0[slot0].derivate_boom
	--- END OF BLOCK #0 ---



end

ys or .Battle.BattleDataFunction.GetSpecificEnemyList = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot5 = nil

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-18, warpins: 0 ---
	for slot9, slot10 in ipairs(slot4) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-14, warpins: 1 ---
		if slot10[1] == slot1 then

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

ys or .Battle.BattleDataFunction.IncreaseAttributes = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-16, warpins: 0 ---
	for slot6, slot7 in ipairs(slot2) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-7, warpins: 1 ---
		if slot7[slot1] ~= nil and type(slot7[slot1]) == "number" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-14, warpins: 1 ---
			slot0 = slot0 + slot7[slot1]
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

ys or .Battle.BattleDataFunction.CreateAirFighterWeaponUnit = function (slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot4 = nil

	if slot0:GetWeaponPropertyDataFromID().type == slot1.EquipmentType.MAIN_CANNON then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-18, warpins: 1 ---
		slot4 = slot2.Battle.BattleWeaponUnit.New()
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-24, warpins: 1 ---
		if slot5.type == slot1.EquipmentType.SUB_CANNON then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 25-31, warpins: 1 ---
			slot4 = slot2.Battle.BattleWeaponUnit.New()
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 32-37, warpins: 1 ---
			if slot5.type == slot1.EquipmentType.TORPEDO then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 38-44, warpins: 1 ---
				slot4 = slot2.Battle.BattleTorpedoUnit.New()
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 45-50, warpins: 1 ---
				if slot5.type == slot1.EquipmentType.ANTI_AIR then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 51-57, warpins: 1 ---
					slot4 = slot2.Battle.BattleAntiAirUnit.New()
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 58-63, warpins: 1 ---
					if slot5.type == slot1.EquipmentType.ANTI_SEA then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 64-70, warpins: 1 ---
						slot4 = slot2.Battle.BattleDirectHitWeaponUnit.New()
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 71-76, warpins: 1 ---
						if slot5.type == slot1.EquipmentType.HAMMER_HEAD then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 77-83, warpins: 1 ---
							slot4 = slot2.Battle.BattleHammerHeadWeaponUnit.New()
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 84-89, warpins: 1 ---
							if slot5.type == slot1.EquipmentType.BOMBER_PRE_CAST_ALERT then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 90-96, warpins: 1 ---
								slot4 = slot2.Battle.BattleBombWeaponUnit.New()
								--- END OF BLOCK #0 ---



							else

								-- Decompilation error in this vicinity:
								--- BLOCK #0 97-102, warpins: 1 ---
								if slot5.type == slot1.EquipmentType.DEPTH_CHARGE then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 103-108, warpins: 1 ---
									slot4 = slot2.Battle.BattleDepthChargeUnit.New()
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
	slot4:SetPotentialFactor(slot3)

	Clone(slot5).spawn_bound = "weapon"

	slot4:SetTemplateData(slot6)
	slot4:SetHostData(slot1, slot2)

	return slot4
	--- END OF BLOCK #1 ---



end

ys or .Battle.BattleDataFunction.GetWords = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	slot3, slot4, slot5 = ShipWordHelper.GetWordAndCV(slot0, slot1, 1, true, slot2)

	return slot5
	--- END OF BLOCK #0 ---



end

ys or .Battle.BattleDataFunction.SkillTranform = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	if slot0.GetSkillDataTemplate(slot1).system_transform[slot0] == nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-10, warpins: 1 ---
		return slot1
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-12, warpins: 1 ---
		return slot3[slot0]
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 13-13, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

ys or .Battle.BattleDataFunction.GenerateHiddenBuff = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot2 = {}

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-17, warpins: 0 ---
	for slot6, slot7 in ipairs(slot1) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-15, warpins: 1 ---
		slot2[slot7] = {
			level = 1,
			id = slot7
		}
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

ys or .Battle.BattleDataFunction.GetDivingFilter = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	return slot0[slot0].diving_filter
	--- END OF BLOCK #0 ---



end

ys or .Battle.BattleDataFunction.GeneratePlayerSubmarinPhase = function (slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-17, warpins: 1 ---
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
	--- END OF BLOCK #0 ---



end

return

--- END OF BLOCK #0 ---

FLOW; TARGET BLOCK #2



-- Decompilation error in this vicinity:
--- BLOCK #1 4-4, warpins: 1 ---
slot0 = 
--- END OF BLOCK #1 ---

FLOW; TARGET BLOCK #2



-- Decompilation error in this vicinity:
--- BLOCK #2 5-59, warpins: 2 ---
--- END OF BLOCK #2 ---

FLOW; TARGET BLOCK #4



-- Decompilation error in this vicinity:
--- BLOCK #3 60-60, warpins: 1 ---
slot26 = 
--- END OF BLOCK #3 ---

FLOW; TARGET BLOCK #4



-- Decompilation error in this vicinity:
--- BLOCK #4 61-139, warpins: 2 ---
--- END OF BLOCK #4 ---



