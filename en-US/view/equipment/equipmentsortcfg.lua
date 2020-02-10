slot2.tag = i18n("word_equipment_all")
slot2.pages = {
	0,
	1
}
slot1[1] = {
	spr = "index_all"
}
slot2.tag = i18n("word_equipment_cannon")
slot2.pages = {
	0,
	1
}
slot3[1] = EquipType.CannonQuZhu
slot3[2] = EquipType.CannonQingXun
slot3[3] = EquipType.CannonZhongXun
slot3[4] = EquipType.CannonZhanlie
slot3[5] = EquipType.CannonZhongXun2
slot2.types = {}
slot1[2] = {
	spr = "index_cannon"
}
slot2.tag = i18n("word_equipment_torpedo")
slot2.pages = {
	0,
	1
}
slot3[1] = EquipType.Torpedo
slot3[2] = EquipType.SubmarineTorpedo
slot2.types = {}
slot1[3] = {
	spr = "index_tarpedo"
}
slot2.tag = i18n("word_equipment_antiaircraft")
slot2.pages = {
	0
}
slot3[1] = EquipType.AntiAircraft
slot2.types = {}
slot1[4] = {
	spr = "index_antiaircraft"
}
slot2.tag = i18n("word_equipment_aircraft")
slot2.pages = {
	0,
	1
}
slot3[1] = EquipType.FighterAircraft
slot3[2] = EquipType.TorpedoAircraft
slot3[3] = EquipType.BomberAircraft
slot3[4] = EquipType.SeaPlane
slot2.types = {}
slot1[5] = {
	spr = "index_aircraft"
}
slot2.tag = i18n("word_equipment_equip")
slot2.pages = {
	0
}
slot3[1] = EquipType.Equipment
slot3[2] = EquipType.AntiSubAircraft
slot3[3] = EquipType.Sonar
slot3[4] = EquipType.Helicopter
slot2.types = {}
slot1[6] = {
	spr = "index_equip"
}
slot0.index = {}
slot2.tag = i18n("word_equipment_rarity")
slot2.pages = {
	0,
	1
}
slot1[1] = {
	value = "rarity",
	spr = "sort_rarity",
	type = 1
}
slot2.tag = i18n("word_equipment_type")
slot2.pages = {
	0,
	1
}
slot1[2] = {
	value = "type",
	spr = "sort_type",
	type = 1
}
slot2.tag = i18n("word_equipment_intensify")
slot2.pages = {
	0
}
slot1[3] = {
	value = "level",
	spr = "sort_intensify",
	type = 2
}
slot0.sort = {}

function slot0.sortFunc(slot0, slot1, slot2, slot3)
	slot4 = pg.equip_skin_template

	if (slot0.isSkin and 1 or 0) == (slot1.isSkin and 1 or 0) and slot5 == 0 then
		if slot0.config[slot2.value] == slot1.config[slot2.value] then
			if slot3 then
				slot9[1] = slot0.id < slot1.id

				if not {} then
					slot9 = {
						slot1.id < slot0.id
					}
				end
			end

			return slot9[1]
		else
			if slot3 then
				slot9[1] = slot7 < slot8

				if not {} then
					slot9 = {
						slot8 < slot7
					}
				end
			end

			return slot9[1]
		end
	elseif slot6 == slot5 then
		if (slot0.isSkin and slot4[slot0.id] or slot0.config[slot2.value] or 0) == (slot1.isSkin and slot4[slot1.id] or slot1.config[slot2.value] or 0) then
			if slot3 then
				slot11[1] = slot0.id < slot1.id

				if not {} then
					slot11 = {
						slot1.id < slot0.id
					}
				end
			end

			return slot11[1]
		else
			if slot3 then
				slot11[1] = slot10 < slot9

				if not {} then
					slot11 = {
						slot9 < slot10
					}
				end
			end

			return slot11[1]
		end
	else
		return slot6 < slot5
	end
end

return {}
