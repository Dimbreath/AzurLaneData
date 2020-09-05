slot0 = class("IndexConst")

function slot0.Flags2Bits(slot0)
	for slot5, slot6 in ipairs(slot0) do
		slot1 = bit.bor(0, bit.lshift(1, slot6))
	end

	return slot1
end

function slot0.FlagRange2Bits(slot0, slot1)
	for slot6 = slot0, slot1 do
		slot2 = bit.bor(0, bit.lshift(1, slot6))
	end

	return slot2
end

function slot0.ToggleBits(slot0, slot1, slot2, slot3)
	slot4 = slot0

	if slot2 then
		slot7 = _.reduce(slot1, 0, function (slot0, slot1)
			return slot0 + (slot1 ~= uv0 and bit.lshift(1, slot1) or 0)
		end)

		if bit.lshift(1, slot3) == bit.lshift(1, slot2) then
			slot4 = slot6
		else
			if bit.band(slot4, slot6) > 0 then
				slot4 = slot4 - slot6
			end

			if bit.band(slot4, slot5) > 0 then
				slot5 = -slot5
			end

			if slot4 + slot5 == slot7 or slot4 == 0 then
				slot4 = slot6
			end
		end
	else
		if bit.band(slot4, slot5) > 0 then
			slot5 = -slot5
		end

		slot4 = slot4 + slot5
	end

	return slot4
end

slot0.DisplaySort = 1
slot0.DisplayIndex = 2
slot0.DisplayCamp = 3
slot0.DisplayRarity = 4
slot0.DisplayEquipSkinSort = 5
slot0.DisplayEquipSkinIndex = 6
slot0.DisplayEquipSkinTheme = 7
slot0.SortRarity = 1
slot0.SortLevel = 2
slot0.SortPower = 3
slot0.SortAchivedTime = 4
slot0.SortDurability = 5
slot0.SortCannon = 6
slot0.SortTorpedo = 7
slot0.SortAir = 8
slot0.SortAntiAircraft = 9
slot0.SortVotes = 10
slot0.SortTypes = {
	slot0.SortRarity,
	slot0.SortLevel,
	slot0.SortPower,
	slot0.SortAchivedTime,
	slot0.SortDurability,
	slot0.SortCannon,
	slot0.SortTorpedo,
	slot0.SortAir,
	slot0.SortAntiAircraft,
	slot0.SortVotes
}
slot0.SortSprites = {
	"sort_rarity",
	"sort_lv",
	"sort_synthesize_power",
	"sort_achieved_item",
	"sort_attr_durability",
	"sort_attr_cannon",
	"sort_attr_torpedo",
	"sort_attr_air",
	"sort_attr_antiaircraft",
	"sort_votes"
}
slot0.SortNames = {
	i18n("word_rarity"),
	i18n("word_lv"),
	i18n("word_synthesize_power"),
	i18n("word_achieved_item"),
	i18n("word_attr_durability"),
	i18n("word_attr_cannon"),
	i18n("word_attr_torpedo"),
	i18n("word_attr_air"),
	i18n("word_attr_antiaircraft"),
	i18n("word_attr_antisub"),
	i18n("word_votes")
}
slot0.IndexAll = 1
slot0.IndexVanguard = 2
slot0.IndexMain = 3
slot0.IndexQuZhu = 4
slot0.IndexQingXun = 5
slot0.IndexZhongXun = 6
slot0.IndexZhanLie = 7
slot0.IndexHangMu = 8
slot0.IndexWeiXiu = 9
slot0.IndexQianTing = 10
slot0.IndexOther = 11
slot0.IndexTypes = {
	slot0.IndexAll,
	slot0.IndexVanguard,
	slot0.IndexMain,
	slot0.IndexQuZhu,
	slot0.IndexQingXun,
	slot0.IndexZhongXun,
	slot0.IndexZhanLie,
	slot0.IndexHangMu,
	slot0.IndexWeiXiu,
	slot0.IndexQianTing,
	slot0.IndexOther
}
slot0.IndexNames = {
	"index_all",
	"index_fleetfront",
	"index_fleetrear",
	"index_shipType_quZhu",
	"index_shipType_qinXun",
	"index_shipType_zhongXun",
	"index_shipType_zhanLie",
	"index_shipType_hangMu",
	"index_shipType_weiXiu",
	"index_shipType_qianTing",
	"index_other"
}
slot0.CampAll = 1
slot0.CampUS = 2
slot0.CampEN = 3
slot0.CampJP = 4
slot0.CampDE = 5
slot0.CampCN = 6
slot0.CampITA = 7
slot0.CampSN = 8
slot0.CampFR = 9
slot0.CampMNF = 10
slot0.CampOther = 11
slot0.CampTypes = {
	slot0.CampAll,
	slot0.CampUS,
	slot0.CampEN,
	slot0.CampJP,
	slot0.CampDE,
	slot0.CampCN,
	slot0.CampITA,
	slot0.CampSN,
	slot0.CampFR,
	slot0.CampMNF,
	slot0.CampOther
}
slot0.CampNames = {
	"word_shipNation_all",
	"word_shipNation_baiYing",
	"word_shipNation_huangJia",
	"word_shipNation_chongYing",
	"word_shipNation_tieXue",
	"word_shipNation_dongHuang",
	"word_shipNation_saDing",
	"word_shipNation_beiLian",
	"word_shipNation_ziyou",
	"word_shipNation_weixi",
	"word_shipNation_other"
}
slot0.RarityAll = 1
slot0.Rarity1 = 2
slot0.Rarity2 = 3
slot0.Rarity3 = 4
slot0.Rarity4 = 5
slot0.Rarity5 = 6
slot0.RarityTypes = {
	slot0.RarityAll,
	slot0.Rarity1,
	slot0.Rarity2,
	slot0.Rarity3,
	slot0.Rarity4,
	slot0.Rarity5
}
slot0.RarityNames = {
	"index_all",
	"index_rare2",
	"index_rare3",
	"index_rare4",
	"index_rare5",
	"index_rare6"
}
slot0.EquipSkinSortType = 1
slot0.EquipSkinSortTypes = {
	slot0.EquipSkinSortType
}
slot0.EquipSkinSortNames = {
	i18n("word_equipskin_type")
}
slot0.EquipSkinIndexAll = 1
slot0.EquipSkinIndexCannon = 2
slot0.EquipSkinIndexTarpedo = 3
slot0.EquipSkinIndexAircraft = 4
slot0.EquipSkinIndexTypes = {
	slot0.EquipSkinIndexAll,
	slot0.EquipSkinIndexCannon,
	slot0.EquipSkinIndexTarpedo,
	slot0.EquipSkinIndexAircraft
}
slot0.EquipSkinIndexNames = {
	i18n("word_equipskin_all"),
	i18n("word_equipskin_cannon"),
	i18n("word_equipskin_tarpedo"),
	i18n("word_equipskin_aircraft")
}
slot0.EquipSkinThemeAll = 1
slot0.EquipSkinThemeEnd = nil
slot0.EquipSkinThemeTypes = {
	slot0.EquipSkinThemeAll
}

for slot4, slot5 in ipairs(pg.equip_skin_theme_template.all) do
	table.insert(slot0.EquipSkinThemeTypes, slot4 + slot0.EquipSkinThemeAll)

	if slot4 == #pg.equip_skin_theme_template.all then
		slot0.EquipSkinThemeEnd = slot4 + slot0.EquipSkinThemeAll + 1
	end
end

slot0.EquipSkinThemeNames = {
	i18n("word_equipskin_all")
}

for slot4, slot5 in ipairs(pg.equip_skin_theme_template.all) do
	table.insert(slot0.EquipSkinThemeNames, pg.equip_skin_theme_template[slot5].name)
end

function slot0.filterEquipSkinByIndex(slot0, slot1)
	if not slot1 then
		return true
	end

	if bit.band(slot1, bit.lshift(1, uv0.EquipSkinIndexAll)) > 0 then
		return true
	end

	slot2 = {}
	slot3 = {
		1,
		2,
		3,
		5
	}

	for slot7, slot8 in ipairs(uv0.EquipSkinIndexTypes) do
		if bit.band(slot1, bit.lshift(1, slot8)) > 0 then
			for slot14, slot15 in ipairs(EquipmentSortCfg.index[slot3[slot8]].types) do
				table.insert(slot2, slot15)
			end
		end
	end

	slot4 = pg.equip_skin_template

	if slot0.count > 0 and slot0.isSkin then
		for slot10, slot11 in pairs(slot4[slot0.id].equip_type) do
			if table.contains(slot2, slot11) then
				return true
			end
		end
	end
end

function slot0.filterEquipSkinByTheme(slot0, slot1)
	if not slot1 then
		return true
	end

	if bit.band(slot1, bit.lshift(1, uv0.EquipSkinThemeAll)) > 0 then
		return true
	end

	slot3 = pg.equip_skin_theme_template

	if slot0.count > 0 and slot0.isSkin then
		slot5 = pg.equip_skin_template[slot0.id].themeid
		slot6 = nil

		for slot10, slot11 in ipairs(uv0.EquipSkinThemeTypes) do
			if bit.band(slot1, bit.lshift(1, slot10)) > 0 and table.contains(slot3[slot3[pg.equip_skin_theme_template.all[slot11 - 1]].id].ids, slot4) then
				return true
			end
		end
	end
end

slot0.shipType2Index = {
	1,
	2,
	3,
	4,
	4,
	5,
	5,
	7,
	8,
	8,
	8,
	6,
	8,
	nil,
	nil,
	nil,
	7,
	3
}

function slot0.filterByIndex(slot0, slot1)
	if bit.band(slot1, bit.lshift(1, uv0.IndexAll)) > 0 then
		return true
	end

	slot2 = slot0:getTeamType()

	if bit.band(slot1, bit.lshift(1, uv0.IndexVanguard)) > 0 and slot2 == TeamType.Vanguard or bit.band(slot1, bit.lshift(1, uv0.IndexMain)) > 0 and slot2 == TeamType.Main then
		return true
	end

	for slot6 = uv0.IndexQuZhu, uv0.IndexOther do
		if bit.band(slot1, bit.lshift(1, slot6)) > 0 and uv0.shipType2Index[slot0:getShipType()] + 3 == slot6 then
			return true
		end
	end

	return false
end

slot0.Nation2Camp = {
	2,
	3,
	4,
	5,
	6,
	7,
	8,
	9,
	10
}

function slot0.filterByCamp(slot0, slot1)
	if bit.band(slot1, bit.lshift(1, uv0.CampAll)) > 0 then
		return true
	end

	if uv0.Nation2Camp[slot0:getNation()] == nil then
		slot3 = uv0.CampOther
	end

	for slot7 = uv0.CampUS, uv0.CampMNF do
		if bit.band(slot1, bit.lshift(1, slot7)) > 0 and slot3 == slot7 then
			return true
		end
	end

	if bit.band(slot1, bit.lshift(1, uv0.CampOther)) > 0 and slot3 == uv0.CampOther then
		return true
	end

	return false
end

function slot0.filterByRarity(slot0, slot1)
	if bit.band(slot1, bit.lshift(1, uv0.RarityAll)) > 0 then
		return true
	end

	for slot5 = uv0.Rarity1, uv0.Rarity5 do
		if bit.band(slot1, bit.lshift(1, slot5)) > 0 and slot0:getRarity() == slot5 then
			return true
		end
	end

	return false
end

function slot0.sortByOrder(slot0, slot1, slot2)
	if slot1 == uv0.SortPower then
		uv0.combatPowerCaches = {}

		table.sort(slot0, slot2 and uv0.sortByCombatPowerAsc or uv0.sortByCombatPower)
	elseif slot1 == uv0.SortRarity then
		table.sort(slot0, slot2 and uv0.sortByCfgAsc("rarity") or uv0.sortByCfg("rarity"))
	elseif slot1 == uv0.SortLevel or slot1 == uv0.SortAchivedTime then
		slot3 = {
			"",
			"level",
			"",
			"createTime"
		}

		table.sort(slot0, slot2 and uv0.sortByFieldAsc(slot3[slot1]) or uv0.sortByField(slot3[slot1]))
	elseif slot1 == uv0.SortVotes then
		table.sort(slot0, slot2 and uv0.sortByFieldAsc("votes") or uv0.sortByField("votes"))
	elseif uv0.SortDurability <= slot1 and slot1 <= uv0.SortAntiAircraft then
		slot3 = {
			"durability",
			"cannon",
			"torpedo",
			"air",
			"antiaircraft"
		}

		table.sort(slot0, slot2 and uv0.sortByPropertyAsc(slot3[slot1 - 4]) or uv0.sortByProperty(slot3[slot1 - 4]))
	end
end

slot0.combatPowerCaches = {}

function slot0.sortByCombatPower(slot0, slot1)
	if not uv0.combatPowerCaches[slot0] then
		uv0.combatPowerCaches[slot0] = slot0:getShipCombatPower()
	end

	if not uv0.combatPowerCaches[slot1] then
		uv0.combatPowerCaches[slot1] = slot1:getShipCombatPower()
	end

	return sortCompare({
		uv0.combatPowerCaches[slot1],
		uv0.combatPowerCaches[slot0]
	}, {
		slot0.configId,
		slot1.configId
	})
end

function slot0.sortByCombatPowerAsc(slot0, slot1)
	if not uv0.combatPowerCaches[slot0] then
		uv0.combatPowerCaches[slot0] = slot0:getShipCombatPower()
	end

	if not uv0.combatPowerCaches[slot1] then
		uv0.combatPowerCaches[slot1] = slot1:getShipCombatPower()
	end

	return sortCompare({
		uv0.combatPowerCaches[slot0],
		uv0.combatPowerCaches[slot1]
	}, {
		slot0.configId,
		slot1.configId
	})
end

function slot0.sortByField(slot0)
	return function (slot0, slot1)
		return sortCompare({
			slot1[uv0],
			slot0[uv0]
		}, {
			slot1:getRarity(),
			slot0:getRarity()
		}, {
			slot0.configId,
			slot1.configId
		})
	end
end

function slot0.sortByFieldAsc(slot0)
	return function (slot0, slot1)
		return sortCompare({
			slot0[uv0],
			slot1[uv0]
		}, {
			slot0:getRarity(),
			slot1:getRarity()
		}, {
			slot0.configId,
			slot1.configId
		})
	end
end

function slot0.sortByProperty(slot0)
	uv0.propertyCaches = {}

	return function (slot0, slot1)
		if not uv0.propertyCaches[slot0] then
			uv0.propertyCaches[slot0] = slot0:getShipProperties()
		end

		if not uv0.propertyCaches[slot1] then
			uv0.propertyCaches[slot1] = slot1:getShipProperties()
		end

		return sortCompare({
			uv0.propertyCaches[slot1][uv1],
			uv0.propertyCaches[slot0][uv1]
		}, {
			slot0.configId,
			slot1.configId
		})
	end
end

function slot0.sortByPropertyAsc(slot0)
	uv0.propertyCaches = {}

	return function (slot0, slot1)
		if not uv0.propertyCaches[slot0] then
			uv0.propertyCaches[slot0] = slot0:getShipProperties()
		end

		if not uv0.propertyCaches[slot1] then
			uv0.propertyCaches[slot1] = slot1:getShipProperties()
		end

		return sortCompare({
			uv0.propertyCaches[slot0][uv1],
			uv0.propertyCaches[slot1][uv1]
		}, {
			slot0.configId,
			slot1.configId
		})
	end
end

function slot0.sortByCfg(slot0)
	return function (slot0, slot1)
		slot2 = slot0:getConfig(uv0)
		slot3 = slot1:getConfig(uv0)

		if uv0 == "rarity" then
			slot2 = slot0:getRarity()
			slot3 = slot1:getRarity()
		end

		return sortCompare({
			slot3,
			slot2
		}, {
			slot0.configId,
			slot1.configId
		})
	end
end

function slot0.sortByCfgAsc(slot0)
	return function (slot0, slot1)
		slot2 = slot0:getConfig(uv0)
		slot3 = slot1:getConfig(uv0)

		if uv0 == "rarity" then
			slot2 = slot0:getRarity()
			slot3 = slot1:getRarity()
		end

		return sortCompare({
			slot2,
			slot3
		}, {
			slot0.configId,
			slot1.configId
		})
	end
end

function slot0.sortByPriorityFullSkill(slot0, slot1, slot2)
	return sortCompare({
		slot0:isFullSkillLevel() and 1 or 0,
		slot1:isFullSkillLevel() and 1 or 0
	}, slot2(slot0, slot1))
end

function slot0.sortForGuider(slot0, slot1)
	return (table.contains({
		101171,
		201211,
		401231,
		301051
	}, slot0.configId) and 1 or 0) > (table.contains(slot2, slot1.configId) and 1 or 0)
end

function slot0.sortByIntimacy(slot0, slot1)
	if slot0.intimacy ~= slot1.intimacy then
		return slot1.intimacy < slot0.intimacy
	end

	if slot0.propose ~= slot1.propose then
		return slot0.propose
	end

	if slot0.configId ~= slot1.configId then
		return slot0.configId < slot1.configId
	end

	return slot1.level < slot0.level
end

function slot0.sortByIntimacyAsc(slot0, slot1)
	if slot0.intimacy ~= slot1.intimacy then
		return slot0.intimacy < slot1.intimacy
	end

	if slot0.propose ~= slot1.propose then
		return slot1.propose
	end

	if slot0.configId ~= slot1.configId then
		return slot0.configId < slot1.configId
	end

	if slot0.level ~= slot1.level then
		return slot1.level < slot0.level
	end
end

return slot0
