ys = ys or {}
slot1 = ys.Battle.BattleConst
slot2 = ys.Battle.BattleFormulas
ys.Battle.BattleDataFunction = ys.Battle.BattleDataFunction or {}

ys or .Battle.BattleDataFunction.GetDungeonTmpDataByID = function (slot0)
	return require("GameCfg.dungeon." .. slot0)
end

ys or .Battle.BattleDataFunction.ClearDungeonCfg = function (slot0)
	package.loaded["GameCfg.dungeon." .. slot0] = nil
end

ys or .Battle.BattleDataFunction.GetSkillTemplate = function (slot0, slot1)
	pg.ConvertedSkill["skill_" .. slot0][slot1 or 1] or slot3[0].name = getSkillName(slot0)

	return pg.ConvertedSkill["skill_" .. slot0][slot1 or 1] or slot3[0]
end

ys or .Battle.BattleDataFunction.ConvertSkillTemplate = function ()
	pg.ConvertedSkill = {}

	setmetatable(pg.ConvertedSkill, {
		__index = function (slot0, slot1)
			slot2 = slot1

			if pg.skillCfg[slot1] then
				slot4 = {}
				slot5 = {}

				for slot9, slot10 in pairs(slot3) do
					slot5[slot9] = Clone(slot10)
				end

				slot4[0] = slot5

				for slot9, slot10 in ipairs(slot3) do
					slot11 = Clone(slot5)

					for slot15, slot16 in pairs(slot10) do
						slot11[slot15] = slot16
					end

					slot4[slot9] = slot11
				end

				pg.ConvertedSkill[slot2] = slot4

				return slot4
			end
		end
	})
end

ys or .Battle.BattleDataFunction.GetBuffTemplate = function (slot0, slot1)
	return pg.ConvertedBuff["buff_" .. slot0][slot1 or 1] or slot3[0]
end

ys or .Battle.BattleDataFunction.ConvertBuffTemplate = function ()
	pg.ConvertedBuff = {}

	setmetatable(pg.ConvertedBuff, {
		__index = function (slot0, slot1)
			slot2 = slot1

			if pg.buffCfg[slot1] then
				slot4 = {}
				slot5 = {}

				for slot9, slot10 in pairs(slot3) do
					slot5[slot9] = Clone(slot10)
				end

				slot4[0] = slot5

				for slot9, slot10 in ipairs(slot3) do
					slot11 = Clone(slot5)

					for slot15, slot16 in pairs(slot10) do
						slot11[slot15] = slot16
					end

					slot4[slot9] = slot11
				end

				pg.ConvertedBuff[slot2] = slot4

				return slot4
			end
		end
	})
end

ys or .Battle.BattleDataFunction.GetBuffBulletRes = function (slot0, slot1)
	slot2 = {}
	slot3 = {}
	slot1 = slot1 or {}

	for slot9, slot10 in ipairs(slot5) do
		slot11 = nil
		slot11 = (not slot1[slot10] or slot1[slot10].level) and 1

		for slot16, slot17 in ipairs(slot12) do
			slot2[#slot2 + 1] = slot17
		end
	end

	for slot10, slot11 in ipairs(slot6) do
		for slot16, slot17 in ipairs(slot12) do
			slot2[#slot2 + 1] = slot17
		end
	end

	if slot0:GetShipTransformDataTemplate() and slot7.skill_id ~= 0 and pg.transform_data_template[slot7.skill_id].skill_id ~= 0 then
		slot9 = nil
		slot9 = (not slot1[pg.transform_data_template[slot7.skill_id].skill_id] or slot1[slot8].level) and 1

		for slot14, slot15 in ipairs(slot10) do
			slot2[#slot2 + 1] = slot15
		end
	end

	return slot2
end

ys or .Battle.BattleDataFunction.GetResFromBuff = function (slot0, slot1, slot2)
	slot3 = {}

	if slot2[slot0 .. "_" .. slot1] then
		return slot3
	else
		slot2[slot4] = true
	end

	if slot0:GetBuffTemplate(slot1).init_effect and slot5.init_effect ~= "" then
		slot3[#slot3 + 1] = slot1.Battle.BattleResourceManager.GetFXPath(slot5.init_effect)
	end

	if slot5.last_effect and slot5.last_effect ~= "" then
		slot3[#slot3 + 1] = slot1.Battle.BattleResourceManager.GetFXPath(slot5.last_effect)
	end

	for slot9, slot10 in ipairs(slot5.effect_list) do
		if slot10.arg_list.skill_id ~= nil then
			for slot16, slot17 in ipairs(slot12) do
				slot3[#slot3 + 1] = slot17
			end
		end

		if slot10.arg_list.skill_id_list ~= nil then
			for slot16, slot17 in ipairs(slot12) do
				for slot22, slot23 in ipairs(slot18) do
					slot3[#slot3 + 1] = slot23
				end
			end
		end

		if slot10.arg_list.bullet_id then
			for slot18, slot19 in ipairs(slot14) do
				slot3[#slot3 + 1] = slot19
			end
		end

		if slot10.arg_list.skin_id then
			for slot19, slot20 in ipairs(slot15) do
				slot3[#slot3 + 1] = slot20
			end
		end

		if slot10.arg_list.buff_id then
			for slot20, slot21 in ipairs(slot16) do
				if type(slot21) == "string" then
					slot3[#slot3 + 1] = slot21
				elseif type(slot21) == "table" then
					for slot25, slot26 in ipairs(slot21) do
						slot3[#slot3 + 1] = slot26
					end
				end
			end
		end

		if slot10.arg_list.effect then
			slot3[#slot3 + 1] = slot1.Battle.BattleResourceManager.GetFXPath(slot16)
		end
	end

	return slot3
end

ys or .Battle.BattleDataFunction.GetBulletResFromSkill = function (slot0, slot1, slot2)
	slot3 = {}

	function slot5(slot0)
		for slot4, slot5 in ipairs(slot0) do
			if slot5.arg_list.weapon_id ~= nil then
				for slot11, slot12 in ipairs(slot7) do
					slot1[#slot1 + 1] = slot12
				end
			end

			if slot5.arg_list.buff_id then
				for slot12, slot13 in ipairs(slot8) do
					slot1[#slot1 + 1] = slot13
				end
			end

			if slot5.arg_list.effect then
				slot1[#slot1 + 1] = slot0.Battle.BattleResourceManager.GetFXPath(slot8)
			end
		end
	end

	if type(slot0:GetSkillTemplate(slot1 or 1).painting) == "string" then
		slot3[#slot3 + 1] = slot1.Battle.BattleResourceManager.GetHrzIcon(slot4.painting)
	end

	if type(slot4.castCV) == "table" then
		slot1.Battle.BattleResourceManager.GetInstance():AddPreloadCV(slot4.castCV.skinID)
	end

	slot5(slot4.effect_list)

	for slot9, slot10 in ipairs(slot4) do
		slot5(slot10.effect_list)
	end

	return slot3
end

ys or .Battle.BattleDataFunction.GetShipSkillTriggerCount = function (slot0, slot1)
	slot3 = 0 + function (slot0)
		slot1 = 0

		for slot5, slot6 in pairs(slot0) do
			for slot12, slot13 in ipairs(slot8) do
				for slot18, slot19 in ipairs(slot14) do
					if table.contains(slot1, slot19) then
						slot1 = slot1 + 1
					end
				end
			end
		end

		return slot1
	end(slot0.skills or {})
	slot6 = {}

	for slot10, slot11 in ipairs(slot5) do
		table.insert(slot6, {
			id = slot11
		})
	end

	return slot3 + slot2(slot6)
end

ys or .Battle.BattleDataFunction.GetSongList = function (slot0)
	slot1 = {
		initList = {},
		otherList = {}
	}

	for slot5, slot6 in pairs(slot0) do
		for slot11, slot12 in ipairs(slot0.GetBuffTemplate(slot5, 1).effect_list) do
			if slot12.type == slot1.Battle.BattleBuffDiva.__name then
				if table.contains(slot12.trigger, "onInitGame") then
					for slot16, slot17 in ipairs(slot12.arg_list.bgm_list) do
						slot1.initList[slot17] = true
					end
				end

				if not table.contains(slot12.trigger, "onInitGame") or #slot12.trigger > 1 then
					for slot16, slot17 in ipairs(slot12.arg_list.bgm_list) do
						slot1.otherList[slot17] = true
					end
				end
			end
		end
	end

	return slot1
end

ys or .Battle.BattleDataFunction.NeedSkillPainting = function (slot0)
	slot1 = false

	if slot0:GetSkillTemplate().focus_duration then
		slot1 = true
	end

	return slot1
end

ys or .Battle.BattleDataFunction.GetFleetReload = function (slot0)
	return slot0:GetFleetReload()
end

ys or .Battle.BattleDataFunction.GetFleetTorpedoPower = function (slot0)
	return slot0:GetFleetTorpedoPower()
end

ys or .Battle.BattleDataFunction.SortFleetList = function (slot0, slot1)
	slot2 = {}

	for slot6, slot7 in ipairs(slot0) do
		slot2[#slot2 + 1] = slot1[slot7]

		slot2[slot6]:SetFormationIndex(slot6)
	end

	return slot2
end

return
