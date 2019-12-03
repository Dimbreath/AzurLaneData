slot0 = class("Equipment", import(".BaseVO"))
slot0.EQUIPMENT_STATE_LOCK = 1
slot0.EQUIPMENT_STATE_EMPTY = 0
slot0.EQUIPMENT_NORMAL = 1
slot0.EQUIPMENT_IMPORTANCE = 2
slot0.PROPERTY = {
	AttributeType.Reload,
	AttributeType.Range,
	AttributeType.Angle,
	AttributeType.Scatter,
	AttributeType.Ammo
}

slot0.Ctor = function (slot0, slot1)
	slot0.id = slot1.id
	slot0.configId = slot1.config_id or slot0.id

	slot0:BuildConfig()

	if slot0:GetCategory() == EquipCategory.Siren then
		slot0.count = 1
	else
		slot0.count = defaultValue(slot1.count, 0)
	end

	slot0.new = defaultValue(slot1.new, 0)
	slot0.isSkin = defaultValue(slot1.isSkin, false)
	slot0.skinId = slot1.skinId or 0
	slot0.affixList = {}

	_.each(slot1.affix_list or {}, function (slot0)
		table.insert(slot0.affixList, {
			id = slot0.id,
			value = slot0.value
		})
	end)
end

slot0.GetCategory = function (slot0)
	return slot0.config.is_siren
end

slot0.BuildConfig = function (slot0)
	slot1 = pg.equip_data_statistics[slot0.configId]
	slot2 = pg.equip_data_template[slot0.configId]
	slot0.config = setmetatable({}, {
		__index = function (slot0, slot1)
			return slot0[slot1] or slot1[slot1]
		end
	})

	if slot0.config.weapon_id and #slot3 > 0 and pg.weapon_property[slot3[1]] then
		slot0.config.reload = slot4.reload_max
	end
end

slot0.GetAttributes = function (slot0)
	slot1 = {}
	slot2 = slot0.config

	for slot6 = 1, 3, 1 do
		slot7 = slot2["attribute_" .. slot6]

		if string.match(slot2["value_" .. slot6], "^[%d|\\.]+$") then
			slot8 = tonumber(slot8)
		end

		slot1[slot6] = (slot7 ~= nil and {
			type = slot7,
			value = slot8
		}) or false
	end

	return slot1
end

slot0.GetAdditionalAttributes = function (slot0)
	_.each(slot0:GetAffixList(), function (slot0)
		slot0[pg.equip_siren_ability[slot0.id].attr_1] = (slot0[pg.equip_siren_ability[slot0.id].attr_1] or 0) + slot0.value
		slot0[slot1.attr_2] = (slot0[slot1.attr_2] or 0) + slot0.value
	end)

	return _.map(_.keys(slot1), function (slot0)
		return {
			type = slot0,
			value = slot0[slot0]
		}
	end)
end

slot0.GetAffixBuffList = function (slot0)
	slot1 = {}

	if slot0:GetCategory() == EquipCategory.Siren then
		_.each(slot0:GetAffixList(), function (slot0)
			_.each(pg.equip_siren_ability[slot0.id].effect, function (slot0)
				table.insert(slot0, slot0)
			end)
		end)
	end

	return slot1
end

slot0.GetPropertyRate = function (slot0)
	return slot0.config.property_rate
end

slot0.vertify = function (slot0)
	slot2 = pg.equip_data_template[slot0.configId]

	if slot0.config.value_1 ~= pg.equip_data_statistics[slot0.configId].value_1 or slot0.config.value_2 ~= slot1.value_2 then
		return false
	end

	return true
end

slot0.GetProperties = function (slot0, slot1)
	slot2 = slot0:GetAttributes()
	slot3 = 3
	slot4 = slot0.config

	if not EquipType.isDevice(slot0.configId) then
		if slot1 and EquipType.isAircraft(slot0.configId) then
			table.insert(slot2, {
				type = "dodge_limit",
				value = pg.aircraft_template[slot0.configId].dodge_limit
			})
			table.insert(slot2, 2, (slot4[AttributeType.Reload] ~= nil and {
				type = AttributeType.Reload,
				value = slot4[AttributeType.Reload]
			}) or false)
		else
			for slot8, slot9 in ipairs(slot0.PROPERTY) do
				slot2[slot3 + slot8] = (slot4[slot9] ~= nil and {
					type = slot9,
					value = slot10
				}) or false
			end
		end
	end

	if slot0:GetSonarProperty() then
		slot2[3] = {
			type = AttributeType.SonarInterval,
			value = slot5[AttributeType.SonarInterval]
		}
		slot2[4] = {
			type = AttributeType.SonarRange,
			value = slot5[AttributeType.SonarRange]
		}
	end

	return slot2
end

slot0.GetGearScore = function (slot0)
	return pg.equip_data_by_quality[slot0.config.rarity].gear_score + slot0.config.level * pg.equip_data_by_quality[slot0.config.rarity].gear_score_addition
end

slot0.GetSkill = function (slot0)
	slot1 = nil

	if slot0.config.skill_id[1] then
		slot1 = getSkillConfig(slot2)
	end

	return slot1
end

slot0.GetWeaponID = function (slot0)
	return config.weapon_id
end

slot0.GetSonarProperty = function (slot0)
	slot3 = slot0.config.equip_parameters.interval
	slot4 = slot0.config.equip_parameters.duration

	if slot0.config.equip_parameters.range and slot3 and slot4 then
		return {
			[AttributeType.SonarRange] = slot2,
			[AttributeType.SonarInterval] = slot3,
			[AttributeType.SonarDuration] = slot4
		}
	else
		return nil
	end
end

slot0.getWeaponCD = function (slot0)
	return string.format("%0.2f", ys.Battle.BattleFormulas.CalculateReloadTime(slot0.config[AttributeType.Reload], 100))
end

slot0.canUpgrade = function (slot0)
	return pg.equip_data_template[slot0].next ~= 0
end

slot0.hasPrevLevel = function (slot0)
	return pg.equip_data_template[slot0.configId].prev ~= 0
end

slot0.getRevertAwards = function (slot0)
	slot1 = {}
	slot2 = 0
	slot4 = pg.equip_data_template[slot0.configId]

	while slot3:hasPrevLevel() do
		for slot9, slot10 in ipairs(slot5) do
			slot12 = slot10[2]

			if slot1[slot10[1]] then
				slot1[slot11].count = slot1[slot11].count + slot12
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

slot0.canEquipSkin = function (slot0)
	return pg.equip_data_by_type[slot0.config.type].equip_skin == 1
end

slot0.hasSkin = function (slot0)
	return slot0.skinId and slot0.skinId ~= 0
end

slot0.setSkinId = function (slot0, slot1)
	slot0.skinId = slot1
end

slot0.getSkinId = function (slot0)
	return slot0.skinId
end

slot0.isImportance = function (slot0)
	return slot0.config.important == slot0.EQUIPMENT_IMPORTANCE
end

slot0.isUnique = function (slot0)
	return slot0.config.equip_limit ~= 0
end

slot0.GetAffixSlot = function (slot0)
	return math.clamp(slot0.config.rarity - 2, 1, 3)
end

slot0.GetAffix = function (slot0, slot1)
	return slot0.affixList[slot1]
end

slot0.GetAffixDesc = function (slot0, slot1)
	slot4 = {}

	if #pg.equip_siren_ability[slot0:GetAffix(slot1).id].attr_1 > 0 then
		table.insert(slot4, slot2.value)
	end

	if #slot3.attr_2 > 0 then
		table.insert(slot4, slot2.value)
	end

	slot5 = slot3.desc

	for slot9, slot10 in ipairs(slot4) do
		slot5 = string.gsub(slot5, "$" .. slot9, slot10)
	end

	return slot5
end

slot0.GetAffixList = function (slot0)
	return slot0.affixList
end

slot0.MigrateTo = function (slot0, slot1)
	if slot0:GetCategory() == EquipCategory.Siren then
		return Equipment.New({
			id = slot0.id,
			config_id = slot1,
			affix_list = slot0:GetAffixList()
		})
	else
		return Equipment.New({
			id = slot1,
			config_id = slot1,
			count = slot0.count
		})
	end
end

slot0.GetRootEquipment = function (slot0)
	slot1 = slot0.configId
	slot2 = pg.equip_data_template[slot0.config.prev]

	while slot2 ~= nil do
		slot1 = slot2.id
		slot2 = pg.equip_data_template[slot2.prev]
	end

	slot0:MigrateTo(slot1).count = 1

	return slot0.MigrateTo(slot1)
end

return slot0
