slot0 = class("Equipment", import(".BaseVO"))
slot0.EQUIPMENT_STATE_LOCK = 1
slot0.EQUIPMENT_STATE_EMPTY = 0
slot0.EQUIPMENT_NORMAL = 1
slot0.EQUIPMENT_IMPORTANCE = 2
slot1[1] = AttributeType.Reload
slot1[2] = AttributeType.Range
slot1[3] = AttributeType.Angle
slot1[4] = AttributeType.Scatter
slot1[5] = AttributeType.Ammo
slot0.PROPERTY = {}

function slot0.Ctor(slot0, slot1)
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
		slot3.id = slot0.id
		slot3.value = slot0.value

		table.insert(uv0.affixList, {})
	end)
end

function slot0.GetCategory(slot0)
	return slot0.config.is_siren
end

function slot0.BuildConfig(slot0)
	slot1 = pg.equip_data_statistics[slot0.configId]
	slot2 = pg.equip_data_template[slot0.configId]

	function slot5.__index(slot0, slot1)
		return uv0[slot1] or uv1[slot1]
	end

	slot0.config = setmetatable({}, {})

	if slot0.config.weapon_id and #slot3 > 0 and pg.weapon_property[slot3[1]] then
		slot0.config.reload = slot4.reload_max
	end
end

function slot0.GetAttributes(slot0)
	slot1 = {}
	slot2 = slot0.config

	for slot6 = 1, 3, 1 do
		slot7 = slot2["attribute_" .. slot6]

		if string.match(slot2["value_" .. slot6], "^[%d|\\.]+$") then
			slot8 = tonumber(slot8)
		end

		slot9.type = slot7
		slot9.value = slot8
		slot1[slot6] = {} or false
	end

	return slot1
end

function slot0.GetAdditionalAttributes(slot0)
	_.each(slot0:GetAffixList(), function (slot0)
		slot1 = pg.equip_siren_ability[slot0.id]
		uv0[slot1.attr_1] = (uv0[slot1.attr_1] or 0) + slot0.value
		uv0[slot1.attr_2] = (uv0[slot1.attr_2] or 0) + slot0.value
	end)

	return _.map(_.keys({}), function (slot0)
		slot1.type = slot0
		slot1.value = uv0[slot0]

		return {}
	end)
end

function slot0.GetAffixBuffList(slot0)
	slot1 = {}

	if slot0:GetCategory() == EquipCategory.Siren then
		_.each(slot0:GetAffixList(), function (slot0)
			_.each(pg.equip_siren_ability[slot0.id].effect, function (slot0)
				table.insert(uv0, slot0)
			end)
		end)
	end

	return slot1
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

function slot0.GetProperties(slot0, slot1)
	slot2 = slot0:GetAttributes()
	slot3 = 3
	slot4 = slot0.config

	if not EquipType.isDevice(slot0.configId) then
		if slot1 and EquipType.isAircraft(slot0.configId) then
			if slot4[AttributeType.Reload] ~= nil then
				slot5.type = AttributeType.Reload
				slot5.value = slot4[AttributeType.Reload]
				slot8.value = pg.aircraft_template[slot0.configId].dodge_limit

				table.insert(slot2, {
					type = "dodge_limit"
				})
				table.insert(slot2, 2, {} or false)
			end
		else
			for slot8, slot9 in ipairs(uv0.PROPERTY) do
				if slot4[slot9] ~= nil then
					slot11.type = slot9
					slot11.value = slot10
					slot2[slot3 + slot8] = {} or false
				end
			end
		end
	end

	if slot0:GetSonarProperty() then
		slot6.type = AttributeType.SonarInterval
		slot6.value = slot5[AttributeType.SonarInterval]
		slot2[3] = {}
		slot6.type = AttributeType.SonarRange
		slot6.value = slot5[AttributeType.SonarRange]
		slot2[4] = {}
	end

	return slot2
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
		slot5[AttributeType.SonarRange] = slot2
		slot5[AttributeType.SonarInterval] = slot3
		slot5[AttributeType.SonarDuration] = slot4

		return {}
	else
		return nil
	end
end

function slot0.getWeaponCD(slot0)
	return string.format("%0.2f", ys.Battle.BattleFormulas.CalculateReloadTime(slot0.config[AttributeType.Reload], 100))
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
		slot6.id = slot4.prev

		for slot9, slot10 in ipairs(pg.equip_data_template[Equipment.New({}).configId].trans_use_item) do
			if slot1[slot10[1]] then
				slot1[slot11].count = slot1[slot11].count + slot10[2]
			else
				slot13.type = DROP_TYPE_ITEM
				slot13.id = slot11
				slot13.count = slot12
				slot1[slot11] = {}
			end
		end

		slot2 = slot2 + slot4.trans_use_gold
	end

	if slot2 > 0 then
		slot6.type = DROP_TYPE_RESOURCE
		slot6.count = slot2
		slot1[id2ItemId(1)] = {
			id = 1
		}
	end

	for slot9, slot10 in pairs(slot1) do
		table.insert({}, slot10)
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

function slot0.GetAffixSlot(slot0)
	return math.clamp(slot0.config.rarity - 2, 1, 3)
end

function slot0.GetAffix(slot0, slot1)
	return slot0.affixList[slot1]
end

function slot0.GetAffixDesc(slot0, slot1)
	if #pg.equip_siren_ability[slot0:GetAffix(slot1).id].attr_1 > 0 then
		table.insert({}, slot2.value)
	end

	if #slot3.attr_2 > 0 then
		table.insert(slot4, slot2.value)
	end

	for slot9, slot10 in ipairs(slot4) do
		slot5 = string.gsub(slot3.desc, "$" .. slot9, slot10)
	end

	return slot5
end

function slot0.GetAffixList(slot0)
	return slot0.affixList
end

function slot0.MigrateTo(slot0, slot1)
	if slot0:GetCategory() == EquipCategory.Siren then
		slot3.id = slot0.id
		slot3.config_id = slot1
		slot3.affix_list = slot0:GetAffixList()

		return Equipment.New({})
	else
		slot3.id = slot1
		slot3.config_id = slot1
		slot3.count = slot0.count

		return Equipment.New({})
	end
end

function slot0.GetRootEquipment(slot0)
	slot1 = slot0.configId

	while pg.equip_data_template[slot0.config.prev] ~= nil do
		slot1 = slot2.id
		slot2 = pg.equip_data_template[slot2.prev]
	end

	slot3 = slot0:MigrateTo(slot1)
	slot3.count = 1

	return slot3
end

return slot0
