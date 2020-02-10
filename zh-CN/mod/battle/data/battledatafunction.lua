ys = ys or {}
slot0 = ys
slot1 = slot0.Battle.BattleConst
slot2 = slot0.Battle.BattleFormulas
slot0.Battle.BattleDataFunction = slot0.Battle.BattleDataFunction or {}
slot3 = slot0.Battle.BattleDataFunction

function slot3.GetDungeonTmpDataByID(slot0)
	return require("GameCfg.dungeon." .. slot0)
end

function slot3.ClearDungeonCfg(slot0)
	package.loaded["GameCfg.dungeon." .. slot0] = nil
end

function slot3.GetSkillTemplate(slot0, slot1)
	slot4 = pg.ConvertedSkill["skill_" .. slot0][slot1 or 1] or slot3[0]
	slot4.name = getSkillName(slot0)

	return slot4
end

function slot3.ConvertSkillTemplate()
	pg.ConvertedSkill = {}

	setmetatable(pg.ConvertedSkill, {
		__index = function (slot0, slot1)
			slot2 = slot1

			if pg.skillCfg[slot1] then
				slot4 = {}
				slot5 = {
					[slot9] = Clone(slot10)
				}

				for slot9, slot10 in pairs(slot3) do
				end

				slot4[0] = slot5

				for slot9, slot10 in ipairs(slot3) do
					for slot15, slot16 in pairs(slot10) do
						Clone(slot5)[slot15] = slot16
					end

					slot4[slot9] = slot11
				end

				pg.ConvertedSkill[slot2] = slot4

				return slot4
			end
		end
	})
end

function slot3.GetBuffTemplate(slot0, slot1)
	return pg.ConvertedBuff["buff_" .. slot0][slot1 or 1] or slot3[0]
end

function slot3.ConvertBuffTemplate()
	pg.ConvertedBuff = {}

	setmetatable(pg.ConvertedBuff, {
		__index = function (slot0, slot1)
			slot2 = slot1

			if pg.buffCfg[slot1] then
				slot4 = {}
				slot5 = {
					[slot9] = Clone(slot10)
				}

				for slot9, slot10 in pairs(slot3) do
				end

				slot4[0] = slot5

				for slot9, slot10 in ipairs(slot3) do
					for slot15, slot16 in pairs(slot10) do
						Clone(slot5)[slot15] = slot16
					end

					slot4[slot9] = slot11
				end

				pg.ConvertedBuff[slot2] = slot4

				return slot4
			end
		end
	})
end

function slot3.GetBuffBulletRes(slot0, slot1, slot2)
	slot3 = {}
	slot4 = {}
	slot1 = slot1 or {}

	for slot10, slot11 in ipairs(uv0.GetPlayerShipModelFromID(slot0).buff_list) do
		slot12 = nil

		for slot18, slot19 in ipairs(uv0.GetResFromBuff(uv0.SkillTranform(slot2, slot11), (not slot1[slot11] or slot1[slot11].level) and 1, slot4)) do
			slot3[#slot3 + 1] = slot19
		end
	end

	for slot11, slot12 in ipairs(slot5.airassist_time) do
		for slot17, slot18 in ipairs(uv0.GetBulletResFromSkill(slot12)) do
			slot3[#slot3 + 1] = slot18
		end
	end

	if uv0.GetShipTransformDataTemplate(slot0) and slot8.skill_id ~= 0 and pg.transform_data_template[slot8.skill_id].skill_id ~= 0 then
		slot10 = nil

		for slot15, slot16 in ipairs(uv0.GetResFromBuff(slot9, (not slot1[pg.transform_data_template[slot8.skill_id].skill_id] or slot1[slot9].level) and 1, slot4)) do
			slot3[#slot3 + 1] = slot16
		end
	end

	return slot3
end

function slot3.GetResFromBuff(slot0, slot1, slot2)
	if slot2[slot0 .. "_" .. slot1] then
		return {}
	else
		slot2[slot4] = true
	end

	if uv0.GetBuffTemplate(slot0, slot1).init_effect and slot5.init_effect ~= "" then
		slot3[#slot3 + 1] = uv1.Battle.BattleResourceManager.GetFXPath(slot5.init_effect)
	end

	if slot5.last_effect and slot5.last_effect ~= "" then
		slot3[#slot3 + 1] = uv1.Battle.BattleResourceManager.GetFXPath(slot5.last_effect)
	end

	for slot9, slot10 in ipairs(slot5.effect_list) do
		if slot10.arg_list.skill_id ~= nil then
			for slot16, slot17 in ipairs(uv0.GetBulletResFromSkill(slot11, slot1, slot2)) do
				slot3[#slot3 + 1] = slot17
			end
		end

		if slot10.arg_list.skill_id_list ~= nil then
			for slot16, slot17 in ipairs(slot12) do
				for slot22, slot23 in ipairs(uv0.GetBulletResFromSkill(slot17, slot1, slot2)) do
					slot3[#slot3 + 1] = slot23
				end
			end
		end

		if slot10.arg_list.bullet_id then
			for slot18, slot19 in ipairs(uv1.Battle.BattleResourceManager.GetBulletResource(slot13)) do
				slot3[#slot3 + 1] = slot19
			end
		end

		if slot10.arg_list.skin_id then
			for slot19, slot20 in ipairs(uv1.Battle.BattleResourceManager.GetEquipSkinBulletRes(slot14)) do
				slot3[#slot3 + 1] = slot20
			end
		end

		if slot10.arg_list.buff_id then
			for slot20, slot21 in ipairs(uv0.GetResFromBuff(slot15, slot1, slot2)) do
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
			slot3[#slot3 + 1] = uv1.Battle.BattleResourceManager.GetFXPath(slot16)
		end
	end

	return slot3
end

function slot3.GetBulletResFromSkill(slot0, slot1, slot2)
	slot3 = {}

	function slot5(slot0)
		for slot4, slot5 in ipairs(slot0) do
			if slot5.arg_list.weapon_id ~= nil then
				for slot11, slot12 in ipairs(uv0.Battle.BattleResourceManager.GetWeaponResource(slot6)) do
					uv1[#uv1 + 1] = slot12
				end
			end

			if slot5.arg_list.buff_id then
				for slot12, slot13 in ipairs(uv2.GetResFromBuff(slot7, uv3, uv4)) do
					uv1[#uv1 + 1] = slot13
				end
			end

			if slot5.arg_list.effect then
				uv1[#uv1 + 1] = uv0.Battle.BattleResourceManager.GetFXPath(slot8)
			end
		end
	end

	if type(uv0.GetSkillTemplate(slot0, slot1 or 1).painting) == "string" then
		slot3[#slot3 + 1] = uv1.Battle.BattleResourceManager.GetHrzIcon(slot4.painting)
	end

	if type(slot4.castCV) == "table" then
		uv1.Battle.BattleResourceManager.GetInstance():AddPreloadCV(slot4.castCV.skinID)
	end

	slot5(slot4.effect_list)

	for slot9, slot10 in ipairs(slot4) do
		slot5(slot10.effect_list)
	end

	return slot3
end

function slot3.GetShipSkillTriggerCount(slot0, slot1)
	slot3 = 0 + function (slot0)
		slot1 = 0

		for slot5, slot6 in pairs(slot0) do
			for slot12, slot13 in ipairs(uv0.GetBuffTemplate(slot6.id).effect_list) do
				for slot18, slot19 in ipairs(slot13.trigger) do
					if table.contains(uv1, slot19) then
						slot1 = slot1 + 1
					end
				end
			end
		end

		return slot1
	end(slot0.skills or {})

	for slot10, slot11 in ipairs(uv0.GetEquipSkill(slot0.equipment)) do
		table.insert({}, {
			id = slot11
		})
	end

	return slot3 + slot2(slot6)
end

function slot3.GetSongList(slot0)
	slot1 = {
		initList = {},
		otherList = {}
	}

	for slot5, slot6 in pairs(slot0) do
		for slot11, slot12 in ipairs(uv0.GetBuffTemplate(slot5, 1).effect_list) do
			if slot12.type == uv1.Battle.BattleBuffDiva.__name then
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

function slot3.NeedSkillPainting(slot0)
	slot1 = false

	if uv0.GetSkillTemplate(slot0).focus_duration then
		slot1 = true
	end

	return slot1
end

function slot3.GetFleetReload(slot0)
	return uv0.GetFleetReload(slot0)
end

function slot3.GetFleetTorpedoPower(slot0)
	return uv0.GetFleetTorpedoPower(slot0)
end

function slot3.SortFleetList(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in ipairs(slot0) do
		slot2[#slot2 + 1] = slot1[slot7]

		slot2[slot6]:SetFormationIndex(slot6)
	end

	return slot2
end
