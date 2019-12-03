slot0 = class("IndexConst")

slot0.Flags2Bits = function (slot0)
	slot1 = 0

	for slot5, slot6 in ipairs(slot0) do
		slot1 = bit.bor(slot1, bit.lshift(1, slot6))
	end

	return slot1
end

slot0.FlagRange2Bits = function (slot0, slot1)
	slot2 = 0

	for slot6 = slot0, slot1, 1 do
		slot2 = bit.bor(slot2, bit.lshift(1, slot6))
	end

	return slot2
end

slot0.ToggleBits = function (slot0, slot1, slot2, slot3)
	slot4 = slot0
	slot5 = bit.lshift(1, slot3)

	if slot2 then
		slot7 = _.reduce(slot1, 0, function (slot0, slot1)
			return slot0 + ((slot1 ~= slot0 and bit.lshift(1, slot1)) or 0)
		end)

		if slot5 == bit.lshift(1, slot2) then
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
	slot0.Rarity4
}
slot0.RarityNames = {
	"index_all",
	"index_rare2",
	"index_rare3",
	"index_rare4",
	"index_rare5",
	"index_rare6"
}
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

slot0.filterByIndex = function (slot0, slot1)
	if bit.band(slot1, bit.lshift(1, slot0.IndexAll)) > 0 then
		return true
	end

	slot2 = slot0:getTeamType()

	if (bit.band(slot1, bit.lshift(1, slot0.IndexVanguard)) > 0 and slot2 == TeamType.Vanguard) or (bit.band(slot1, bit.lshift(1, slot0.IndexMain)) > 0 and slot2 == TeamType.Main) then
		return true
	end

	for slot6 = slot0.IndexQuZhu, slot0.IndexOther, 1 do
		if bit.band(slot1, bit.lshift(1, slot6)) > 0 and slot0.shipType2Index[slot0:getShipType()] + 3 == slot6 then
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

slot0.filterByCamp = function (slot0, slot1)
	if bit.band(slot1, bit.lshift(1, slot0.CampAll)) > 0 then
		return true
	end

	if slot0.Nation2Camp[slot0:getNation()] == nil then
		slot3 = slot0.CampOther
	end

	for slot7 = slot0.CampUS, slot0.CampMNF, 1 do
		if bit.band(slot1, bit.lshift(1, slot7)) > 0 and slot3 == slot7 then
			return true
		end
	end

	if bit.band(slot1, bit.lshift(1, slot0.CampOther)) > 0 and slot3 == slot0.CampOther then
		return true
	end

	return false
end

slot0.filterByRarity = function (slot0, slot1)
	if bit.band(slot1, bit.lshift(1, slot0.RarityAll)) > 0 then
		return true
	end

	for slot5 = slot0.Rarity1, slot0.Rarity5, 1 do
		if bit.band(slot1, bit.lshift(1, slot5)) > 0 and slot0:getRarity() == slot5 then
			return true
		end
	end

	return false
end

slot0.sortByOrder = function (slot0, slot1, slot2)
	if slot1 == slot0.SortPower then
		slot0.combatPowerCaches = {}

		table.sort(slot0, (slot2 and slot0.sortByCombatPowerAsc) or slot0.sortByCombatPower)
	elseif slot1 == slot0.SortRarity then
		table.sort(slot0, (slot2 and slot0.sortByCfgAsc("rarity")) or slot0.sortByCfg("rarity"))
	elseif slot1 == slot0.SortLevel or slot1 == slot0.SortAchivedTime then
		table.sort(slot0, (slot2 and slot0.sortByFieldAsc(({
			"",
			"level",
			"",
			"createTime"
		})[slot1])) or slot0.sortByField(()[slot1]))
	elseif slot1 == slot0.SortVotes then
		table.sort(slot0, (slot2 and slot0.sortByFieldAsc("votes")) or slot0.sortByField("votes"))
	elseif slot0.SortDurability <= slot1 and slot1 <= slot0.SortAntiAircraft then
		table.sort(slot0, (slot2 and slot0.sortByPropertyAsc(({
			"durability",
			"cannon",
			"torpedo",
			"air",
			"antiaircraft"
		})[slot1 - 4])) or slot0.sortByProperty(()[slot1 - 4]))
	end
end

slot0.combatPowerCaches = {}

slot0.sortByCombatPower = function (slot0, slot1)
	if not slot0.combatPowerCaches[slot0] then
		slot0.combatPowerCaches[slot0] = slot0:getShipCombatPower()
	end

	if not slot0.combatPowerCaches[slot1] then
		slot0.combatPowerCaches[slot1] = slot1:getShipCombatPower()
	end

	slot2 = slot0.combatPowerCaches[slot0]
	slot3 = slot0.combatPowerCaches[slot1]

	if slot0:getDockSortValue() == slot1:getDockSortValue() then
		if slot2 ~= slot3 then
			return slot3 < slot2
		else
			return slot0.configId < slot1.configId
		end
	else
		return slot5 < slot4
	end
end

slot0.sortByCombatPowerAsc = function (slot0, slot1)
	if not slot0.combatPowerCaches[slot0] then
		slot0.combatPowerCaches[slot0] = slot0:getShipCombatPower()
	end

	if not slot0.combatPowerCaches[slot1] then
		slot0.combatPowerCaches[slot1] = slot1:getShipCombatPower()
	end

	slot2 = slot0.combatPowerCaches[slot0]
	slot3 = slot0.combatPowerCaches[slot1]

	if slot0:getDockSortValue() == slot1:getDockSortValue() then
		if slot2 ~= slot3 then
			return slot2 < slot3
		else
			return slot0.configId < slot1.configId
		end
	else
		return slot5 < slot4
	end
end

slot0.sortByField = function (slot0)
	return function (slot0, slot1)
		slot2 = slot0[slot0]
		slot3 = slot1[slot0]

		if slot0:getDockSortValue() == slot1:getDockSortValue() then
			if slot2 ~= slot3 then
				return slot3 < slot2
			elseif slot0:getRarity() ~= slot1:getRarity() then
				return slot7 < slot6
			else
				return slot0.configId < slot1.configId
			end
		else
			return slot5 < slot4
		end
	end
end

slot0.sortByFieldAsc = function (slot0)
	return function (slot0, slot1)
		slot2 = slot0[slot0]
		slot3 = slot1[slot0]

		if slot0:getDockSortValue() == slot1:getDockSortValue() then
			if slot2 ~= slot3 then
				return slot2 < slot3
			elseif slot0:getRarity() ~= slot1:getRarity() then
				return slot6 < slot7
			else
				return slot0.configId < slot1.configId
			end
		else
			return slot5 < slot4
		end
	end
end

slot0.sortByProperty = function (slot0)
	slot0.propertyCaches = {}

	return function (slot0, slot1)
		if not slot0.propertyCaches[slot0] then
			slot0.propertyCaches[slot0] = slot0:getShipProperties()
		end

		if not slot0.propertyCaches[slot1] then
			slot0.propertyCaches[slot1] = slot1:getShipProperties()
		end

		slot2 = slot0.propertyCaches[slot0]
		slot3 = slot0.propertyCaches[slot1]

		if slot0:getDockSortValue() == slot1:getDockSortValue() then
			if slot2[slot1] ~= slot3[slot1] then
				return slot3[slot1] < slot2[slot1]
			else
				return slot0.configId < slot1.configId
			end
		else
			return slot5 < slot4
		end
	end
end

slot0.sortByPropertyAsc = function (slot0)
	slot0.propertyCaches = {}

	return function (slot0, slot1)
		if not slot0.propertyCaches[slot0] then
			slot0.propertyCaches[slot0] = slot0:getShipProperties()
		end

		if not slot0.propertyCaches[slot1] then
			slot0.propertyCaches[slot1] = slot1:getShipProperties()
		end

		slot2 = slot0.propertyCaches[slot0]
		slot3 = slot0.propertyCaches[slot1]

		if slot0:getDockSortValue() == slot1:getDockSortValue() then
			if slot2[slot1] ~= slot3[slot1] then
				return slot2[slot1] < slot3[slot1]
			else
				return slot0.configId < slot1.configId
			end
		else
			return slot5 < slot4
		end
	end
end

slot0.sortByCfg = function (slot0)
	return function (slot0, slot1)
		slot2 = slot0:getDockSortValue()
		slot3 = slot1:getDockSortValue()
		slot4 = slot0:getConfig(slot0)
		slot5 = slot1:getConfig(slot0)

		if slot0 == "rarity" then
			slot4 = slot0:getRarity()
			slot5 = slot1:getRarity()
		end

		if slot2 == slot3 then
			if slot4 ~= slot5 then
				return slot5 < slot4
			else
				return slot0.configId < slot1.configId
			end
		else
			return slot3 < slot2
		end
	end
end

slot0.sortByCfgAsc = function (slot0)
	return function (slot0, slot1)
		slot2 = slot0:getDockSortValue()
		slot3 = slot1:getDockSortValue()
		slot4 = slot0:getConfig(slot0)
		slot5 = slot1:getConfig(slot0)

		if slot0 == "rarity" then
			slot4 = slot0:getRarity()
			slot5 = slot1:getRarity()
		end

		if slot2 == slot3 then
			if slot4 ~= slot5 then
				return slot4 < slot5
			else
				return slot0.configId < slot1.configId
			end
		else
			return slot3 < slot2
		end
	end
end

slot0.sortByPriorityFullSkill = function (slot0, slot1, slot2)
	if ((slot0:isFullSkillLevel() and 1) or 0) == ((slot1:isFullSkillLevel() and 1) or 0) then
		return slot2(slot0, slot1)
	else
		return slot3 < slot4
	end
end

slot0.sortForGuider = function (slot0, slot1)
	return ((table.contains({
		101171,
		201211,
		401231,
		301051
	}, slot0.configId) and 1) or 0) > ((table.contains(slot2, slot1.configId) and 1) or 0)
end

return slot0
