
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

ys or .Battle.BattleDataFunction.GetBuffBulletRes = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot3 = {}
	slot4 = {}

	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-5, warpins: 1 ---
		slot1 = {}
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-14, warpins: 2 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 15-44, warpins: 0 ---
	for slot10, slot11 in ipairs(slot6) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-18, warpins: 1 ---
		slot12 = nil

		if slot1[slot11] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 19-21, warpins: 1 ---
			slot12 = slot1[slot11].level
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 22-22, warpins: 1 ---
			slot12 = 1
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 23-37, warpins: 2 ---
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 38-42, warpins: 0 ---
		for slot18, slot19 in ipairs(slot14) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 38-40, warpins: 1 ---
			slot3[#slot3 + 1] = slot19
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 41-42, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 43-44, warpins: 2 ---
		--- END OF BLOCK #3 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 45-49, warpins: 1 ---
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 50-64, warpins: 0 ---
	for slot11, slot12 in ipairs(slot7) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 50-57, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 58-62, warpins: 0 ---
		for slot17, slot18 in ipairs(slot13) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 58-60, warpins: 1 ---
			slot3[#slot3 + 1] = slot18
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 61-62, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 63-64, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 65-70, warpins: 1 ---
	if slot0:GetShipTransformDataTemplate() and slot8.skill_id ~= 0 and pg.transform_data_template[slot8.skill_id].skill_id ~= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 81-89, warpins: 1 ---
		slot10 = nil

		if slot1[pg.transform_data_template[slot8.skill_id].skill_id] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 90-92, warpins: 1 ---
			slot10 = slot1[slot9].level
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 93-93, warpins: 1 ---
			slot10 = 1
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 94-103, warpins: 2 ---
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 104-108, warpins: 0 ---
		for slot15, slot16 in ipairs(slot11) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 104-106, warpins: 1 ---
			slot3[#slot3 + 1] = slot16
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 107-108, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 109-109, warpins: 4 ---
	return slot3
	--- END OF BLOCK #6 ---



end

ys or .Battle.BattleDataFunction.GetResFromBuff = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot3 = {}

	if slot2[slot0 .. "_" .. slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-10, warpins: 1 ---
		return slot3
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-12, warpins: 1 ---
		slot2[slot4] = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 13-20, warpins: 2 ---
	if slot0:GetBuffTemplate(slot1).init_effect and slot5.init_effect ~= "" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 24-32, warpins: 1 ---
		slot3[#slot3 + 1] = slot1.Battle.BattleResourceManager.GetFXPath(slot5.init_effect)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 33-35, warpins: 3 ---
	if slot5.last_effect and slot5.last_effect ~= "" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 39-47, warpins: 1 ---
		slot3[#slot3 + 1] = slot1.Battle.BattleResourceManager.GetFXPath(slot5.last_effect)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 48-51, warpins: 3 ---
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 52-187, warpins: 0 ---
	for slot9, slot10 in ipairs(slot5.effect_list) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 52-55, warpins: 1 ---
		if slot10.arg_list.skill_id ~= nil then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 56-65, warpins: 1 ---
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 66-70, warpins: 0 ---
			for slot16, slot17 in ipairs(slot12) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 66-68, warpins: 1 ---
				slot3[#slot3 + 1] = slot17
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 69-70, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 71-74, warpins: 2 ---
		if slot10.arg_list.skill_id_list ~= nil then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 75-78, warpins: 1 ---
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 79-95, warpins: 0 ---
			for slot16, slot17 in ipairs(slot12) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 79-88, warpins: 1 ---
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 89-93, warpins: 0 ---
				for slot22, slot23 in ipairs(slot18) do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 89-91, warpins: 1 ---
					slot3[#slot3 + 1] = slot23
					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 92-93, warpins: 2 ---
					--- END OF BLOCK #1 ---



				end
				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 94-95, warpins: 2 ---
				--- END OF BLOCK #2 ---



			end
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 96-99, warpins: 2 ---
		if slot10.arg_list.bullet_id then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 100-109, warpins: 1 ---
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 110-114, warpins: 0 ---
			for slot18, slot19 in ipairs(slot14) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 110-112, warpins: 1 ---
				slot3[#slot3 + 1] = slot19
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 113-114, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 115-118, warpins: 2 ---
		if slot10.arg_list.skin_id then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 119-128, warpins: 1 ---
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 129-133, warpins: 0 ---
			for slot19, slot20 in ipairs(slot15) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 129-131, warpins: 1 ---
				slot3[#slot3 + 1] = slot20
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 132-133, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 134-137, warpins: 2 ---
		if slot10.arg_list.buff_id then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 138-147, warpins: 1 ---
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 148-172, warpins: 0 ---
			for slot20, slot21 in ipairs(slot16) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 148-152, warpins: 1 ---
				if type(slot21) == "string" then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 153-156, warpins: 1 ---
					slot3[#slot3 + 1] = slot21
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 157-161, warpins: 1 ---
					if type(slot21) == "table" then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 162-165, warpins: 1 ---
						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 166-170, warpins: 0 ---
						for slot25, slot26 in ipairs(slot21) do

							-- Decompilation error in this vicinity:
							--- BLOCK #0 166-168, warpins: 1 ---
							slot3[#slot3 + 1] = slot26
							--- END OF BLOCK #0 ---

							FLOW; TARGET BLOCK #1



							-- Decompilation error in this vicinity:
							--- BLOCK #1 169-170, warpins: 2 ---
							--- END OF BLOCK #1 ---



						end
						--- END OF BLOCK #1 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 171-172, warpins: 4 ---
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #4 ---

		FLOW; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #5 173-176, warpins: 2 ---
		if slot10.arg_list.effect then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 177-185, warpins: 1 ---
			slot3[#slot3 + 1] = slot1.Battle.BattleResourceManager.GetFXPath(slot16)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #5 ---

		FLOW; TARGET BLOCK #6



		-- Decompilation error in this vicinity:
		--- BLOCK #6 186-187, warpins: 3 ---
		--- END OF BLOCK #6 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 188-188, warpins: 1 ---
	return slot3
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
--- BLOCK #4 17-51, warpins: 2 ---
--- END OF BLOCK #4 ---



