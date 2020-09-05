slot0 = class("Equipment", import(".BaseVO"))
slot0.EQUIPMENT_STATE_LOCK = 1
slot0.EQUIPMENT_STATE_EMPTY = 0
slot0.EQUIPMENT_NORMAL = 1
slot0.EQUIPMENT_IMPORTANCE = 2

function slot0.Ctor(slot0, slot1)
	slot0.id = slot1.id
	slot0.configId = slot1.config_id or slot0.id

	slot0:BuildConfig()

	slot0.count = defaultValue(slot1.count, 0)
	slot0.new = defaultValue(slot1.new, 0)
	slot0.isSkin = defaultValue(slot1.isSkin, false)
	slot0.skinId = slot1.skinId or 0
end

function slot0.BuildConfig(slot0)
	slot1 = pg.equip_data_statistics[slot0.configId]
	slot2 = pg.equip_data_template[slot0.configId]
	slot0.config = setmetatable({}, {
		__index = function (slot0, slot1)
			return uv0[slot1] or uv1[slot1]
		end
	})

	if slot0.config.weapon_id and #slot3 > 0 and pg.weapon_property[slot3[1]] then
		slot0.config[AttributeType.CD] = slot4.reload_max
	end
end

function slot0.GetAttributes(slot0)
	slot2 = slot0.config

	for slot6 = 1, 3 do
		slot8 = slot2["value_" .. slot6]
	end

	return {
		[slot6] = slot2["attribute_" .. slot6] ~= nil and {
			type = slot7,
			value = string.match(slot8, "^[%d|\\.]+$") and tonumber(slot8) or slot8
		} or false
	}
end

function slot0.GetPropertyRate(slot0)
	return slot0.config.property_rate
end

function slot0.vertify(slot0)
	slot2 = pg.equip_data_template[slot0.configId]

	if slot0.config.value_1 ~= pg.equip_data_statistics[slot0.configId].value_1 or slot0.config.value_2 ~= slot1.value_2 then
		return false
	end

	return true
end

function slot0.CalcWeanponCD(slot0, slot1)
	return string.format("%0.2f", ys.Battle.BattleFormulas.CalculateReloadTime(slot0 or 0, slot1 and slot1:getProperties().reload or 100))
end

function slot0.GetInfoTrans(slot0, slot1)
	slot2 = slot0.name or AttributeType.Type2Name(slot0.type)
	slot3 = slot0.value or ""

	if slot0.type == AttributeType.CD then
		if not slot1 then
			slot2 = i18n("cd_normal")
		end

		slot3 = uv0.CalcWeanponCD(slot0.value, slot1) .. "s" .. i18n("word_secondseach")
	elseif slot0.type == AttributeType.AirDurability then
		slot3 = math.floor((slot3[1] + slot3[2] * (slot1 and slot1.level or 100)) / 1000)
	end

	return slot2, slot3
end

function slot1(slot0)
	if string.match(slot0, i18n("word_secondseach")) then
		slot0 = string.gsub(slot0, i18n("word_secondseach"), "")
	end

	slot0 = string.gsub(slot0, " ", "")

	while string.match(slot0, "(%d+)x(%d+)") do
		slot1, slot2 = string.match(slot0, "(%d+)x(%d+)")
		slot0 = string.gsub(slot0, slot1 .. "x" .. slot2, slot1 * slot2, 1)
	end

	return tonumber(slot0)
end

function slot0.AlignAttrs(slot0, slot1)
	for slot5 = 1, #slot0 do
		if not slot1[slot5] or slot0[slot5].type ~= slot1[slot5].type then
			slot9 = Clone

			table.insert(slot1, slot5, slot9(slot0[slot5]))

			slot1[slot5].value = 0

			for slot9 = slot5 + 1, #slot1 do
				if slot1[slot5].type == slot1[slot9].type then
					slot1[slot5].value = slot1[slot9].value

					table.remove(slot1, slot9)

					break
				end
			end
		end
	end

	for slot5 = #slot0 + 1, #slot1 do
		table.insert(slot0, Clone(slot1[slot5]))

		slot0[slot5].value = 0
	end
end

function slot0.CompareInfo(slot0, slot1, slot2)
	if slot0.type == AttributeType.Damage then
		slot1.compare = uv0(slot1.value) - uv0(slot0.value)
	elseif slot0.type == AttributeType.CD then
		slot1.compare = -(uv1.CalcWeanponCD(slot1.value, slot2) - uv1.CalcWeanponCD(slot0.value, slot2))
	else
		slot1.compare = slot1.value - slot0.value
	end
end

function slot0.InsertAttrsUpgrade(slot0, slot1)
	uv0.AlignAttrs(slot0, slot1)

	for slot5 = #slot0, 1, -1 do
		if slot0[slot5].value == slot1[slot5].value then
			table.remove(slot0, slot5)
			table.remove(slot1, slot5)
		else
			slot0[slot5].nextValue = slot1[slot5].value
		end
	end
end

function slot0.InsertAttrsCompare(slot0, slot1, slot2)
	uv0.AlignAttrs(slot0, slot1)

	for slot6 = 1, #slot0 do
		uv0.CompareInfo(slot0[slot6], slot1[slot6], slot2)
	end
end

function slot0.GetPropertiesInfo(slot0)
	if slot0.config[AttributeType.Damage] then
		table.insert(({
			attrs = {}
		}).attrs, {
			type = AttributeType.Damage,
			value = slot1[AttributeType.Damage]
		})
	end

	if slot1[AttributeType.CD] then
		table.insert(slot2.attrs, {
			type = AttributeType.CD,
			value = slot1[AttributeType.CD]
		})
	end

	for slot6, slot7 in ipairs(slot0:GetAttributes()) do
		if slot7 and slot7.type ~= AttributeType.OxyRaidDistance then
			table.insert(slot2.attrs, slot7)
		end
	end

	if slot0:GetSonarProperty() then
		table.insert(slot2.attrs, {
			type = AttributeType.SonarInterval,
			value = slot3[AttributeType.SonarInterval]
		})
		table.insert(slot2.attrs, {
			type = AttributeType.SonarRange,
			value = slot3[AttributeType.SonarRange]
		})
	end

	slot2.weapon = {
		lock_open = true,
		name = i18n(EquipType.isAircraft(slot0.configId) and "equip_info_24" or "equip_info_5"),
		sub = {}
	}

	for slot7, slot8 in ipairs(slot1.ammo_info) do
		table.insert(slot2.weapon.sub, slot0:GetWeaponPageInfo(slot8[1], slot8[2]))
	end

	slot2.equipInfo = {
		name = i18n("equip_info_14"),
		sub = {}
	}

	for slot7, slot8 in ipairs(slot1.equip_info) do
		table.insert(slot2.equipInfo.sub, slot0:GetEquipAttrPageInfo(slot8))
	end

	slot2.part = {
		slot0.config.part_main,
		slot0.config.part_sub
	}

	return slot2
end

function slot0.GetWeaponPageInfo(slot0, slot1, slot2)
	slot3 = {
		sub = {}
	}

	for slot9, slot10 in ipairs(slot4.exhibition_list) do
		table.insert(slot3.sub, slot0:GetWeaponInfo(slot10, slot2, pg.equip_bullet_type[slot1].exhibition_type == 2))
	end

	slot6 = table.remove(slot3.sub, 1)
	slot3.name = slot6.name
	slot3.type = slot6.type
	slot3.value = slot6.value

	return slot3
end

function slot0.GetWeaponInfo(slot0, slot1, slot2, slot3)
	slot4 = slot3 and pg.weapon_property[slot2].bullet_ID[1] or slot2

	if slot1 == 1 then
		return {
			name = slot0.config[AttributeType.Ammo]
		}
	elseif slot1 == 2 then
		return {
			name = pg.weapon_property[slot2].name
		}
	elseif slot1 == 3 then
		return {
			type = AttributeType.Damage,
			value = pg.weapon_property[slot2].damage
		}
	elseif slot1 == 4 then
		return {
			name = i18n("equip_info_6"),
			value = pg.bullet_template[slot4].velocity
		}
	elseif slot1 == 5 then
		return {
			name = i18n("equip_info_7"),
			value = pg.bullet_template[slot4].velocity
		}
	elseif slot1 == 6 then
		slot5 = pg.bullet_template[slot4].damage_type

		return {
			name = i18n("equip_info_8"),
			value = slot5[1] * 100 .. "-" .. slot5[2] * 100 .. "-" .. slot5[3] * 100
		}
	elseif slot1 == 7 then
		return {
			name = i18n("equip_info_9"),
			value = pg.bullet_template[slot4].hit_type.range
		}
	elseif slot1 == 8 then
		return {
			name = i18n("equip_info_10"),
			value = pg.weapon_property[slot2].range
		}
	elseif slot1 == 9 then
		return {
			name = i18n("equip_info_11"),
			value = pg.weapon_property[slot2].angle
		}
	elseif slot1 == 10 then
		return {
			name = i18n("equip_info_12"),
			value = pg.bullet_template[slot4].extra_param.randomOffsetX
		}
	elseif slot1 == 11 then
		return {
			name = i18n("equip_info_13"),
			value = slot0.config[AttributeType.Speciality]
		}
	elseif slot1 == 12 then
		return {
			type = AttributeType.CD,
			value = pg.weapon_property[slot2].reload_max
		}
	end
end

function slot0.GetEquipAttrPageInfo(slot0, slot1)
	if type(slot1) == "table" then
		return slot0:GetEquipAttrInfo(slot1[1], slot1[2])
	else
		return slot0:GetEquipAttrInfo(slot1, slot0.config.weapon_id[1])
	end
end

function slot0.GetEquipAttrInfo(slot0, slot1, slot2)
	if slot1 == 1 then
		return {
			name = i18n("equip_info_15"),
			value = pg.weapon_property[slot2].min_range == 0 and slot3.range or slot3.min_range .. "-" .. slot3.range
		}
	elseif slot1 == 2 then
		return {
			name = i18n("equip_info_16"),
			value = pg.weapon_property[slot2].angle
		}
	elseif slot1 == 3 then
		slot3 = pg.bullet_template[slot2]

		return {
			name = i18n("equip_info_17"),
			value = slot3.range - slot3.range_offset .. "-" .. slot3.range + slot3.range_offset
		}
	elseif slot1 == 4 then
		return {
			name = i18n("equip_info_18"),
			value = pg.barrage_template[slot2].random_angle and slot3.angle or math.abs(slot3.angle) + math.abs(slot3.delta_angle) * slot3.primal_repeat
		}
	elseif slot1 == 5 then
		return {
			name = i18n("attribute_scatter"),
			value = pg.bullet_template[slot2].extra_param.randomOffsetX
		}
	elseif slot1 == 6 then
		return {
			name = i18n("equip_info_19"),
			value = Nation.Nation2Name(slot0.config.nationality)
		}
	elseif slot1 == 7 then
		return {
			name = i18n("equip_info_20"),
			value = pg.aircraft_template[slot0.id].speed
		}
	elseif slot1 == 8 then
		slot3 = pg.aircraft_template[slot0.id]

		return {
			name = i18n("equip_info_21"),
			type = AttributeType.AirDurability,
			value = {
				slot3.max_hp,
				slot3.hp_growth
			}
		}
	elseif slot1 == 9 then
		return {
			name = i18n("equip_info_22"),
			value = pg.aircraft_template[slot0.id].dodge_limit
		}
	end
end

function slot0.GetGearScore(slot0)
	slot3 = pg.equip_data_by_quality[slot0.config.rarity]

	return slot3.gear_score + slot0.config.level * slot3.gear_score_addition
end

function slot0.GetSkill(slot0)
	slot1 = nil

	if slot0.config.skill_id[1] then
		slot1 = getSkillConfig(slot2)
	end

	return slot1
end

function slot0.GetWeaponID(slot0)
	return config.weapon_id
end

function slot0.GetSonarProperty(slot0)
	slot1 = slot0.config.equip_parameters
	slot3 = slot1.interval
	slot4 = slot1.duration

	if slot1.range and slot3 and slot4 then
		return {
			[AttributeType.SonarRange] = slot2,
			[AttributeType.SonarInterval] = slot3,
			[AttributeType.SonarDuration] = slot4
		}
	else
		return nil
	end
end

function slot0.canUpgrade(slot0)
	return pg.equip_data_template[slot0].next ~= 0
end

function slot0.hasPrevLevel(slot0)
	return pg.equip_data_template[slot0.configId].prev ~= 0
end

function slot0.getRevertAwards(slot0)
	slot1 = {}
	slot2 = 0
	slot4 = pg.equip_data_template[slot0.configId]

	while slot3:hasPrevLevel() do
		for slot9, slot10 in ipairs(pg.equip_data_template[Equipment.New({
			id = slot4.prev
		}).configId].trans_use_item) do
			if slot1[slot10[1]] then
				slot1[slot11].count = slot1[slot11].count + slot10[2]
			else
				slot1[slot11] = {
					type = DROP_TYPE_ITEM,
					id = slot11,
					count = slot12
				}
			end
		end

		slot2 = slot2 + slot4.trans_use_gold
	end

	if slot2 > 0 then
		slot1[id2ItemId(1)] = {
			id = 1,
			type = DROP_TYPE_RESOURCE,
			count = slot2
		}
	end

	slot5 = {}

	for slot9, slot10 in pairs(slot1) do
		table.insert(slot5, slot10)
	end

	return slot5
end

function slot0.canEquipSkin(slot0)
	return pg.equip_data_by_type[slot0.config.type].equip_skin == 1
end

function slot0.hasSkin(slot0)
	return slot0.skinId and slot0.skinId ~= 0
end

function slot0.setSkinId(slot0, slot1)
	slot0.skinId = slot1
end

function slot0.getSkinId(slot0)
	return slot0.skinId
end

function slot0.isImportance(slot0)
	return slot0.config.important == uv0.EQUIPMENT_IMPORTANCE
end

function slot0.isUnique(slot0)
	return slot0.config.equip_limit ~= 0
end

function slot0.MigrateTo(slot0, slot1)
	return Equipment.New({
		id = slot1,
		config_id = slot1,
		count = slot0.count
	})
end

function slot0.GetRootEquipment(slot0)
	slot1 = slot0.configId
	slot2 = pg.equip_data_template[slot0.config.prev]

	while slot2 ~= nil do
		slot1 = slot2.id
		slot2 = pg.equip_data_template[slot2.prev]
	end

	slot3 = slot0:MigrateTo(slot1)
	slot3.count = 1

	return slot3
end

return slot0
