return {
	index = {
		{
			spr = "index_all",
			tag = i18n("word_equipment_all"),
			pages = {
				0,
				1
			}
		},
		{
			spr = "index_cannon",
			tag = i18n("word_equipment_cannon"),
			pages = {
				0,
				1
			},
			types = {
				EquipType.CannonQuZhu,
				EquipType.CannonQingXun,
				EquipType.CannonZhongXun,
				EquipType.CannonZhanlie,
				EquipType.CannonZhongXun2
			}
		},
		{
			spr = "index_tarpedo",
			tag = i18n("word_equipment_torpedo"),
			pages = {
				0,
				1
			},
			types = {
				EquipType.Torpedo,
				EquipType.SubmarineTorpedo
			}
		},
		{
			spr = "index_antiaircraft",
			tag = i18n("word_equipment_antiaircraft"),
			pages = {
				0
			},
			types = {
				EquipType.AntiAircraft
			}
		},
		{
			spr = "index_aircraft",
			tag = i18n("word_equipment_aircraft"),
			pages = {
				0,
				1
			},
			types = {
				EquipType.FighterAircraft,
				EquipType.TorpedoAircraft,
				EquipType.BomberAircraft,
				EquipType.SeaPlane
			}
		},
		{
			spr = "index_equip",
			tag = i18n("word_equipment_equip"),
			pages = {
				0
			},
			types = {
				EquipType.Equipment,
				EquipType.AntiSubAircraft,
				EquipType.Sonar,
				EquipType.Helicopter
			}
		}
	},
	sort = {
		{
			value = "rarity",
			spr = "sort_rarity",
			type = 1,
			tag = i18n("word_equipment_rarity"),
			pages = {
				0,
				1
			}
		},
		{
			value = "type",
			spr = "sort_type",
			type = 1,
			tag = i18n("word_equipment_type"),
			pages = {
				0,
				1
			}
		},
		{
			value = "level",
			spr = "sort_intensify",
			type = 2,
			tag = i18n("word_equipment_intensify"),
			pages = {
				0
			}
		}
	},
	sortFunc = function (slot0, slot1, slot2, slot3)
		slot4 = pg.equip_skin_template
		slot5 = (slot0.isSkin and 1) or 0

		if slot5 == ((slot1.isSkin and 1) or 0) and slot5 == 0 then
			if slot0.config[slot2.value] == slot1.config[slot2.value] then
				if slot3 then
					slot9 = {
						slot0.id < slot1.id
					}

					if not slot9 then
						slot9 = {
							slot1.id < slot0.id
						}
					end
				end

				return slot9[1]
			else
				if slot3 then
					slot9 = {
						slot7 < slot8
					}

					if not slot9 then
						slot9 = {
							slot8 < slot7
						}
					end
				end

				return slot9[1]
			end
		elseif slot6 == slot5 then
			if ((slot0.isSkin and slot4[slot0.id]) or slot0.config[slot2.value] or 0) == ((slot1.isSkin and slot4[slot1.id]) or slot1.config[slot2.value] or 0) then
				if slot3 then
					slot11 = {
						slot0.id < slot1.id
					}

					if not slot11 then
						slot11 = {
							slot1.id < slot0.id
						}
					end
				end

				return slot11[1]
			else
				if slot3 then
					slot11 = {
						slot10 < slot9
					}

					if not slot11 then
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
}
