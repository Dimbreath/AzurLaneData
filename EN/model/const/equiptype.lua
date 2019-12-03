slot0 = class("EquipType")
slot0.CannonQuZhu = 1
slot0.CannonQingXun = 2
slot0.CannonZhongXun = 3
slot0.CannonZhanlie = 4
slot0.Torpedo = 5
slot0.AntiAircraft = 6
slot0.FighterAircraft = 7
slot0.TorpedoAircraft = 8
slot0.BomberAircraft = 9
slot0.Equipment = 10
slot0.CannonZhongXun2 = 11
slot0.SeaPlane = 12
slot0.SubmarineTorpedo = 13
slot0.Sonar = 14
slot0.AntiSubAircraft = 15
slot0.Helicopter = 17
slot0.AirDomainEquip = {
	slot0.FighterAircraft,
	slot0.TorpedoAircraft,
	slot0.BomberAircraft,
	slot0.SeaPlane
}
slot0.AircraftSkinType = {
	slot0.FighterAircraft,
	slot0.TorpedoAircraft,
	slot0.BomberAircraft,
	slot0.SeaPlane,
	slot0.AntiSubAircraft
}
slot1 = {
	i18n("word_primary_weapons"),
	i18n("word_sub_cannons"),
	i18n("word_torpedo"),
	i18n("word_air_defense_artillery"),
	i18n("word_shipboard_aircraft"),
	i18n("word_device"),
	i18n("word_submarine_torpedo"),
	i18n("wrod_sub_weapons"),
	i18n("word_main_cannons"),
	i18n("word_cannon"),
	i18n("word_equipment_aircraft"),
	i18n("word_fighter"),
	i18n("word_bomber"),
	i18n("word_attacker"),
	i18n("word_seaplane"),
	i18n("word_equipment")
}
slot2 = {
	"cannon",
	"cannon",
	"cannon",
	"cannon",
	"torpedo",
	"antiair",
	"fighter",
	"attacker",
	"bomber",
	"equipment",
	"cannon",
	"seaplane",
	"torpedo",
	"equipment",
	"equipment",
	nil,
	"equipment"
}

function slot0.Type2Name(slot0)
	return pg.equip_data_by_type[slot0].type_name
end

function slot0.Type2Name2(slot0)
	return pg.equip_data_by_type[slot0].type_name2
end

function slot0.type2Tag(slot0)
	if not slot0.tagPrints then
		slot0.tagPrints = {
			"4",
			"4",
			"4",
			"4",
			"5",
			"6",
			"7",
			"8",
			"9",
			"10",
			"4",
			"12",
			"5",
			"10",
			"13",
			nil,
			"14"
		}
	end

	return slot0.tagPrints[slot0]
end

function slot0.isAircraft(slot0)
	return pg.equip_data_template[slot0].type == slot0.FighterAircraft or slot1 == slot0.TorpedoAircraft or slot1 == slot0.BomberAircraft or slot1 == slot0.SeaPlane or slot1 == slot0.AntiSubAircraft
end

function slot0.isDevice(slot0)
	return pg.equip_data_template[slot0].type == slot0.Equipment or slot1 == slot0.Sonar or slot1 == slot0.Helicopter
end

function slot0.type2Title(slot0, slot1)
	if slot1 <= 4 then
		return slot0[slot0]
	elseif slot1 == slot1.Torpedo then
		return slot0[3]
	elseif slot1 == slot1.AntiAircraft then
		return slot0[4]
	elseif (slot1 >= 7 and slot1 <= 9) or slot1 == slot1.SeaPlane then
		return slot1:Type2Name()
	elseif slot1 == slot1.Equipment or slot1 == slot1.AntiSubAircraft then
		return slot0[6]
	elseif slot1 == slot1.SubmarineTorpedo then
		return slot0[7]
	end
end

slot3 = {
	1,
	2,
	3,
	4,
	11
}
slot4 = {
	7,
	8,
	9
}
slot5 = {
	1,
	2
}

function slot6(slot0)
	if _.all(slot0, function (slot0)
		return table.contains(slot0, slot0)
	end) then
		return "main_cannons"
	elseif #slot0 == 1 then
		return slot1[slot0[1]]
	elseif #slot0 > 1 then
		if _.all(slot0, function (slot0)
			return table.contains(slot0, slot0)
		end) then
			return "equipment_aircraft"
		else
			return "primary_weapons"
		end
	end

	return ""
end

function slot7(slot0, slot1)
	if _.all(slot1, function (slot0)
		return table.contains(slot0, slot0)
	end) and _.is_equal(slot0, slot1) then
		return "main_cannons"
	elseif _.all(slot0, function (slot0)
		return table.contains(slot0, slot0)
	end) then
		return "sub_cannons"
	elseif #slot0 == 1 then
		return slot2[slot0[1]]
	elseif #slot0 > 1 then
		if _.all(slot0, function (slot0)
			return table.contains(slot0, slot0)
		end) then
			return "equipment_aircraft"
		else
			return "sub_weapons"
		end
	end

	return ""
end

function slot8(slot0)
	if _.all(slot0, function (slot0)
		return table.contains(slot0, slot0)
	end) then
		return "sub_cannons"
	elseif #slot0 == 1 then
		return slot1[slot0[1]]
	elseif #slot0 > 1 then
		if _.all(slot0, function (slot0)
			return table.contains(slot0, slot0)
		end) then
			return "equipment_aircraft"
		else
			return "sub_weapons"
		end
	end

	return ""
end

function slot0.Types2Title(slot0, slot1)
	slot3 = pg.ship_data_template[slot1]["equip_" .. slot0]

	if slot0 == 1 then
		return slot0(slot3)
	elseif slot0 == 2 then
		return slot1(slot3, slot2.equip_1)
	elseif slot0 == 3 then
		return slot2(slot3)
	elseif slot0 == 4 or slot0 == 5 then
		return slot3[slot3[1]]
	end
end

function slot0.LabelToName(slot0)
	if slot0 == "antiair" then
		slot0 = "air_defense_artillery"
	elseif slot0 == "equipment" then
		slot0 = "device"
	end

	return i18n("word_" .. slot0)
end

return slot0
