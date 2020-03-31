
-- Decompilation error in this vicinity:
--- BLOCK #0 1-3, warpins: 1 ---
slot0 = ys or {}
ys = ys or 
slot1 = ys.Battle.BattleConst
slot2 = ys.Battle.BattleFormulas
ys.Battle.BattleDataFunction = ys.Battle.BattleDataFunction or {}

ys or .Battle.BattleDataFunction.GetDungeonTmpDataByID = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	return require("GameCfg.dungeon." .. slot0)
	--- END OF BLOCK #0 ---



end

ys or .Battle.BattleDataFunction.ClearDungeonCfg = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	package.loaded["GameCfg.dungeon." .. slot0] = nil

	return
	--- END OF BLOCK #0 ---



end

ys or .Battle.BattleDataFunction.GetSkillTemplate = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-3, warpins: 1 ---
		slot1 = 1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-12, warpins: 2 ---
	if not pg.ConvertedSkill["skill_" .. slot0][slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-13, warpins: 1 ---
		slot4 = slot3[0]
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 14-18, warpins: 2 ---
	slot4.name = getSkillName(slot0)

	return slot4
	--- END OF BLOCK #2 ---



end

ys or .Battle.BattleDataFunction.ConvertSkillTemplate = function ()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	pg.ConvertedSkill = {}

	setmetatable(pg.ConvertedSkill, {
		__index = function (slot0, slot1)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-6, warpins: 1 ---
			slot2 = slot1

			if pg.skillCfg[slot1] then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 7-12, warpins: 1 ---
				slot4 = {}
				slot5 = {}

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 13-18, warpins: 0 ---
				for slot9, slot10 in pairs(slot3) do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 13-16, warpins: 1 ---
					slot5[slot9] = Clone(slot10)
					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 17-18, warpins: 2 ---
					--- END OF BLOCK #1 ---



				end

				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 19-23, warpins: 1 ---
				slot4[0] = slot5

				--- END OF BLOCK #2 ---

				FLOW; TARGET BLOCK #3



				-- Decompilation error in this vicinity:
				--- BLOCK #3 24-36, warpins: 0 ---
				for slot9, slot10 in ipairs(slot3) do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 24-30, warpins: 1 ---
					slot11 = Clone(slot5)

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 31-33, warpins: 0 ---
					for slot15, slot16 in pairs(slot10) do

						-- Decompilation error in this vicinity:
						--- BLOCK #0 31-31, warpins: 1 ---
						slot11[slot15] = slot16
						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 32-33, warpins: 2 ---
						--- END OF BLOCK #1 ---



					end

					--- END OF BLOCK #1 ---

					FLOW; TARGET BLOCK #2



					-- Decompilation error in this vicinity:
					--- BLOCK #2 34-34, warpins: 1 ---
					slot4[slot9] = slot11
					--- END OF BLOCK #2 ---

					FLOW; TARGET BLOCK #3



					-- Decompilation error in this vicinity:
					--- BLOCK #3 35-36, warpins: 2 ---
					--- END OF BLOCK #3 ---



				end

				--- END OF BLOCK #3 ---

				FLOW; TARGET BLOCK #4



				-- Decompilation error in this vicinity:
				--- BLOCK #4 37-40, warpins: 1 ---
				pg.ConvertedSkill[slot2] = slot4

				return slot4
				--- END OF BLOCK #4 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 41-41, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end
	})

	return
	--- END OF BLOCK #0 ---



end

ys or .Battle.BattleDataFunction.GetBuffTemplate = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-3, warpins: 1 ---
		slot1 = 1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-12, warpins: 2 ---
	if not pg.ConvertedBuff["buff_" .. slot0][slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-13, warpins: 1 ---
		slot4 = slot3[0]
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 14-14, warpins: 2 ---
	return slot4
	--- END OF BLOCK #2 ---



end

ys or .Battle.BattleDataFunction.ConvertBuffTemplate = function ()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	pg.ConvertedBuff = {}

	setmetatable(pg.ConvertedBuff, {
		__index = function (slot0, slot1)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-6, warpins: 1 ---
			slot2 = slot1

			if pg.buffCfg[slot1] then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 7-12, warpins: 1 ---
				slot4 = {}
				slot5 = {}

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 13-18, warpins: 0 ---
				for slot9, slot10 in pairs(slot3) do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 13-16, warpins: 1 ---
					slot5[slot9] = Clone(slot10)
					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 17-18, warpins: 2 ---
					--- END OF BLOCK #1 ---



				end

				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 19-23, warpins: 1 ---
				slot4[0] = slot5

				--- END OF BLOCK #2 ---

				FLOW; TARGET BLOCK #3



				-- Decompilation error in this vicinity:
				--- BLOCK #3 24-36, warpins: 0 ---
				for slot9, slot10 in ipairs(slot3) do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 24-30, warpins: 1 ---
					slot11 = Clone(slot5)

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 31-33, warpins: 0 ---
					for slot15, slot16 in pairs(slot10) do

						-- Decompilation error in this vicinity:
						--- BLOCK #0 31-31, warpins: 1 ---
						slot11[slot15] = slot16
						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 32-33, warpins: 2 ---
						--- END OF BLOCK #1 ---



					end

					--- END OF BLOCK #1 ---

					FLOW; TARGET BLOCK #2



					-- Decompilation error in this vicinity:
					--- BLOCK #2 34-34, warpins: 1 ---
					slot4[slot9] = slot11
					--- END OF BLOCK #2 ---

					FLOW; TARGET BLOCK #3



					-- Decompilation error in this vicinity:
					--- BLOCK #3 35-36, warpins: 2 ---
					--- END OF BLOCK #3 ---



				end

				--- END OF BLOCK #3 ---

				FLOW; TARGET BLOCK #4



				-- Decompilation error in this vicinity:
				--- BLOCK #4 37-40, warpins: 1 ---
				pg.ConvertedBuff[slot2] = slot4

				return slot4
				--- END OF BLOCK #4 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 41-41, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end
	})

	return
	--- END OF BLOCK #0 ---



end

ys or .Battle.BattleDataFunction.GetBuffBulletRes = function (slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot4 = {}
	slot5 = {}

	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-5, warpins: 1 ---
		slot1 = {}
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-22, warpins: 2 ---
	slot6 = slot0:GetPlayerShipModelFromID()
	slot7 = slot6.buff_list

	slot8(slot6.buff_list)
	slot8(slot6.hide_buff_list)

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 23-37, warpins: 0 ---
	for slot13, slot14 in ipairs(slot9) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 23-30, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 31-35, warpins: 0 ---
		for slot19, slot20 in ipairs(slot15) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 31-33, warpins: 1 ---
			slot4[#slot4 + 1] = slot20
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 34-35, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 36-37, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 38-43, warpins: 1 ---
	if slot0:GetShipTransformDataTemplate() and slot10.skill_id ~= 0 and pg.transform_data_template[slot10.skill_id].skill_id ~= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 54-62, warpins: 1 ---
		slot12 = nil

		if slot1[pg.transform_data_template[slot10.skill_id].skill_id] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 63-65, warpins: 1 ---
			slot12 = slot1[slot11].level
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 66-66, warpins: 1 ---
			slot12 = 1
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 67-77, warpins: 2 ---
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 78-82, warpins: 0 ---
		for slot17, slot18 in ipairs(slot13) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 78-80, warpins: 1 ---
			slot4[#slot4 + 1] = slot18
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 81-82, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 83-84, warpins: 4 ---
	return slot4
	--- END OF BLOCK #4 ---



end

ys or .Battle.BattleDataFunction.GetResFromBuff = function (slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot4 = {}

	if slot2[slot0 .. "_" .. slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-10, warpins: 1 ---
		return slot4
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-12, warpins: 1 ---
		slot2[slot5] = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 13-20, warpins: 2 ---
	if slot0:GetBuffTemplate(slot1).init_effect and slot6.init_effect ~= "" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 24-27, warpins: 1 ---
		slot7 = slot6.init_effect

		if slot6.skin_adapt then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 28-33, warpins: 1 ---
			slot7 = slot0.SkinAdaptFXID(slot7, slot3)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 34-42, warpins: 2 ---
		slot4[#slot4 + 1] = slot1.Battle.BattleResourceManager.GetFXPath(slot7)
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 43-45, warpins: 3 ---
	if slot6.last_effect and slot6.last_effect ~= "" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 49-57, warpins: 1 ---
		slot4[#slot4 + 1] = slot1.Battle.BattleResourceManager.GetFXPath(slot6.last_effect)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 58-61, warpins: 3 ---
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 62-198, warpins: 0 ---
	for slot10, slot11 in ipairs(slot6.effect_list) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 62-65, warpins: 1 ---
		if slot11.arg_list.skill_id ~= nil then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 66-75, warpins: 1 ---
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 76-80, warpins: 0 ---
			for slot17, slot18 in ipairs(slot13) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 76-78, warpins: 1 ---
				slot4[#slot4 + 1] = slot18
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 79-80, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 81-84, warpins: 2 ---
		if slot11.arg_list.skill_id_list ~= nil then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 85-88, warpins: 1 ---
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 89-105, warpins: 0 ---
			for slot17, slot18 in ipairs(slot13) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 89-98, warpins: 1 ---
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 99-103, warpins: 0 ---
				for slot23, slot24 in ipairs(slot19) do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 99-101, warpins: 1 ---
					slot4[#slot4 + 1] = slot24
					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 102-103, warpins: 2 ---
					--- END OF BLOCK #1 ---



				end
				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 104-105, warpins: 2 ---
				--- END OF BLOCK #2 ---



			end
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 106-109, warpins: 2 ---
		if slot11.arg_list.bullet_id then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 110-119, warpins: 1 ---
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 120-124, warpins: 0 ---
			for slot19, slot20 in ipairs(slot15) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 120-122, warpins: 1 ---
				slot4[#slot4 + 1] = slot20
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 123-124, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 125-128, warpins: 2 ---
		if slot11.arg_list.skin_id then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 129-138, warpins: 1 ---
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 139-143, warpins: 0 ---
			for slot20, slot21 in ipairs(slot16) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 139-141, warpins: 1 ---
				slot4[#slot4 + 1] = slot21
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 142-143, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 144-147, warpins: 2 ---
		if slot11.arg_list.buff_id then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 148-158, warpins: 1 ---
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 159-183, warpins: 0 ---
			for slot21, slot22 in ipairs(slot17) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 159-163, warpins: 1 ---
				if type(slot22) == "string" then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 164-167, warpins: 1 ---
					slot4[#slot4 + 1] = slot22
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 168-172, warpins: 1 ---
					if type(slot22) == "table" then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 173-176, warpins: 1 ---
						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 177-181, warpins: 0 ---
						for slot26, slot27 in ipairs(slot22) do

							-- Decompilation error in this vicinity:
							--- BLOCK #0 177-179, warpins: 1 ---
							slot4[#slot4 + 1] = slot27
							--- END OF BLOCK #0 ---

							FLOW; TARGET BLOCK #1



							-- Decompilation error in this vicinity:
							--- BLOCK #1 180-181, warpins: 2 ---
							--- END OF BLOCK #1 ---



						end
						--- END OF BLOCK #1 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 182-183, warpins: 4 ---
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #4 ---

		FLOW; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #5 184-187, warpins: 2 ---
		if slot11.arg_list.effect then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 188-196, warpins: 1 ---
			slot4[#slot4 + 1] = slot1.Battle.BattleResourceManager.GetFXPath(slot17)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #5 ---

		FLOW; TARGET BLOCK #6



		-- Decompilation error in this vicinity:
		--- BLOCK #6 197-198, warpins: 3 ---
		--- END OF BLOCK #6 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 199-199, warpins: 1 ---
	return slot4
	--- END OF BLOCK #5 ---



end

ys or .Battle.BattleDataFunction.GetBulletResFromSkill = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-3, warpins: 1 ---
		slot1 = 1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-15, warpins: 2 ---
	slot3 = {}

	function slot5(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 5-63, warpins: 0 ---
		for slot4, slot5 in ipairs(slot0) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-8, warpins: 1 ---
			if slot5.arg_list.weapon_id ~= nil then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 9-18, warpins: 1 ---
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 19-25, warpins: 0 ---
				for slot11, slot12 in ipairs(slot7) do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 19-23, warpins: 1 ---
					slot1[#slot1 + 1] = slot12
					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 24-25, warpins: 2 ---
					--- END OF BLOCK #1 ---



				end
				--- END OF BLOCK #1 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 26-29, warpins: 2 ---
			if slot5.arg_list.buff_id then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 30-39, warpins: 1 ---
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 40-46, warpins: 0 ---
				for slot12, slot13 in ipairs(slot8) do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 40-44, warpins: 1 ---
					slot1[#slot1 + 1] = slot13
					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 45-46, warpins: 2 ---
					--- END OF BLOCK #1 ---



				end
				--- END OF BLOCK #1 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 47-50, warpins: 2 ---
			if slot5.arg_list.effect then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 51-61, warpins: 1 ---
				slot1[#slot1 + 1] = slot0.Battle.BattleResourceManager.GetFXPath(slot8)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 62-63, warpins: 3 ---
			--- END OF BLOCK #3 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 64-64, warpins: 1 ---
		return
		--- END OF BLOCK #2 ---



	end

	if type(slot0:GetSkillTemplate(slot1).painting) == "string" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-24, warpins: 1 ---
		slot3[#slot3 + 1] = slot1.Battle.BattleResourceManager.GetHrzIcon(slot4.painting)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 25-29, warpins: 2 ---
	if type(slot4.castCV) == "table" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 30-39, warpins: 1 ---
		slot1.Battle.BattleResourceManager.GetInstance():AddPreloadCV(slot4.castCV.skinID)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 40-46, warpins: 2 ---
	slot5(slot4.effect_list)

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 47-51, warpins: 0 ---
	for slot9, slot10 in ipairs(slot4) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 47-49, warpins: 1 ---
		slot5(slot10.effect_list)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 50-51, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 52-53, warpins: 1 ---
	return slot3
	--- END OF BLOCK #5 ---



end

ys or .Battle.BattleDataFunction.GetShipSkillTriggerCount = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	function slot2(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot1 = 0

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 6-33, warpins: 0 ---
		for slot5, slot6 in pairs(slot0) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-14, warpins: 1 ---
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 15-31, warpins: 0 ---
			for slot12, slot13 in ipairs(slot8) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 15-19, warpins: 1 ---
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 20-29, warpins: 0 ---
				for slot18, slot19 in ipairs(slot14) do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 20-26, warpins: 1 ---
					if table.contains(slot1, slot19) then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 27-27, warpins: 1 ---
						slot1 = slot1 + 1
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 28-29, warpins: 3 ---
					--- END OF BLOCK #1 ---



				end
				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 30-31, warpins: 2 ---
				--- END OF BLOCK #2 ---



			end
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 32-33, warpins: 2 ---
			--- END OF BLOCK #2 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 34-34, warpins: 1 ---
		return slot1
		--- END OF BLOCK #2 ---



	end

	slot3 = 0

	if not slot0.skills then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-6, warpins: 1 ---
		slot4 = {}
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-19, warpins: 2 ---
	slot3 = slot3 + slot2(slot4)
	slot6 = {}

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 20-27, warpins: 0 ---
	for slot10, slot11 in ipairs(slot5) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 20-25, warpins: 1 ---
		table.insert(slot6, {
			id = slot11
		})
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 26-27, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 28-33, warpins: 1 ---
	return slot3 + slot2(slot6)
	--- END OF BLOCK #3 ---



end

ys or .Battle.BattleDataFunction.GetSongList = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	slot1 = {
		initList = {},
		otherList = {}
	}

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-68, warpins: 0 ---
	for slot5, slot6 in pairs(slot0) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-18, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 19-66, warpins: 0 ---
		for slot11, slot12 in ipairs(slot0.GetBuffTemplate(slot5, 1).effect_list) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 19-25, warpins: 1 ---
			if slot12.type == slot1.Battle.BattleBuffDiva.__name then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 26-32, warpins: 1 ---
				if table.contains(slot12.trigger, "onInitGame") then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 33-37, warpins: 1 ---
					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 38-42, warpins: 0 ---
					for slot16, slot17 in ipairs(slot12.arg_list.bgm_list) do

						-- Decompilation error in this vicinity:
						--- BLOCK #0 38-40, warpins: 1 ---
						slot1.initList[slot17] = true
						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 41-42, warpins: 2 ---
						--- END OF BLOCK #1 ---



					end
					--- END OF BLOCK #1 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 43-49, warpins: 2 ---
				if not table.contains(slot12.trigger, "onInitGame") or #slot12.trigger > 1 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 55-59, warpins: 2 ---
					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 60-64, warpins: 0 ---
					for slot16, slot17 in ipairs(slot12.arg_list.bgm_list) do

						-- Decompilation error in this vicinity:
						--- BLOCK #0 60-62, warpins: 1 ---
						slot1.otherList[slot17] = true
						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 63-64, warpins: 2 ---
						--- END OF BLOCK #1 ---



					end
					--- END OF BLOCK #1 ---



				end
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 65-66, warpins: 4 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 67-68, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 69-69, warpins: 1 ---
	return slot1
	--- END OF BLOCK #2 ---



end

ys or .Battle.BattleDataFunction.NeedSkillPainting = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot1 = false

	if slot0:GetSkillTemplate().focus_duration then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-9, warpins: 1 ---
		slot1 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-10, warpins: 2 ---
	return slot1
	--- END OF BLOCK #1 ---



end

ys or .Battle.BattleDataFunction.SkinAdaptFXID = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	return slot0 .. "_" .. slot1
	--- END OF BLOCK #0 ---



end

ys or .Battle.BattleDataFunction.GetFleetReload = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	return slot0:GetFleetReload()
	--- END OF BLOCK #0 ---



end

ys or .Battle.BattleDataFunction.GetFleetTorpedoPower = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	return slot0:GetFleetTorpedoPower()
	--- END OF BLOCK #0 ---



end

ys or .Battle.BattleDataFunction.SortFleetList = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot2 = {}

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-16, warpins: 0 ---
	for slot6, slot7 in ipairs(slot0) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-14, warpins: 1 ---
		slot2[#slot2 + 1] = slot1[slot7]

		slot2[slot6]:SetFormationIndex(slot6)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 15-16, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 17-17, warpins: 1 ---
	return slot2
	--- END OF BLOCK #2 ---



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
--- BLOCK #2 5-15, warpins: 2 ---
--- END OF BLOCK #2 ---

FLOW; TARGET BLOCK #4



-- Decompilation error in this vicinity:
--- BLOCK #3 16-16, warpins: 1 ---
slot4 = 
--- END OF BLOCK #3 ---

FLOW; TARGET BLOCK #4



-- Decompilation error in this vicinity:
--- BLOCK #4 17-53, warpins: 2 ---
--- END OF BLOCK #4 ---



