slot0 = ys
slot0 = slot0.Battle
slot1 = ys
slot1 = slot1.Battle
slot1 = slot1.BattleFormulas
slot1 = slot1 or {}
slot0.BattleFormulas = slot1
slot0 = ys
slot0 = slot0.Battle
slot0 = slot0.BattleFormulas
slot1 = ys
slot1 = slot1.Battle
slot1 = slot1.BattleConst
slot2 = pg
slot2 = slot2.gameset
slot3 = ys
slot3 = slot3.Battle
slot3 = slot3.BattleAttr
slot4 = ys
slot4 = slot4.Battle
slot4 = slot4.BattleConfig
slot5 = ys
slot5 = slot5.Battle
slot5 = slot5.BattleConfig
slot5 = slot5.AnitAirRepeaterConfig
slot6 = pg
slot6 = slot6.bfConsts
slot7 = slot6.SECONDs
slot8 = slot4.viewFPS
slot7 = slot7 / slot8
slot8 = slot4.BulletSpeedConvertConst
slot7 = slot7 * slot8
slot8 = slot6.SECONDs
slot9 = slot4.calcFPS
slot8 = slot8 / slot9
slot9 = slot4.ShipSpeedConvertConst
slot8 = slot8 * slot9
slot9 = slot6.SECONDs
slot10 = slot4.viewFPS
slot9 = slot9 / slot10
slot10 = slot4.AircraftSpeedConvertConst
slot9 = slot9 * slot10
slot10 = slot4.AIR_ASSIST_RELOAD_RATIO
slot11 = slot6.PERCENT
slot10 = slot10 * slot11
slot11 = slot4.DAMAGE_ENHANCE_FROM_SHIP_TYPE
slot12 = slot4.AMMO_DAMAGE_ENHANCE
slot13 = slot4.AMMO_DAMAGE_REDUCE
slot14 = slot4.SHIP_TYPE_ACCURACY_ENHANCE

function slot15(slot0)
	slot2 = slot0
	slot1 = slot0.GetFlagShip
	slot1 = slot1(slot2)
	slot3 = slot0
	slot2 = slot0.GetUnitList
	slot2 = slot2(slot3)
	slot3 = uv0
	slot3 = slot3.NUM0
	slot4 = ipairs
	slot5 = slot2
	slot4, slot5, slot6 = slot4(slot5)

	for slot7, slot8 in slot4, slot5, slot6 do
		if slot8 == slot1 then
			slot9 = uv1
			slot9 = slot9.GetCurrent
			slot10 = slot8
			slot11 = "maxHP"
			slot9 = slot9(slot10, slot11)
			slot10 = uv0
			slot10 = slot10.HP_CONST
			slot9 = slot9 * slot10
			slot3 = slot3 + slot9
		else
			slot9 = uv1
			slot9 = slot9.GetCurrent
			slot10 = slot8
			slot11 = "maxHP"
			slot9 = slot9(slot10, slot11)
			slot3 = slot3 + slot9
		end
	end

	return slot3
end

slot0.GetFleetTotalHP = slot15

function slot15(slot0)
	slot1 = slot0[1]

	if slot1 then
		slot2 = uv0
		slot2 = slot2.GetCurrent
		slot3 = slot1
		slot4 = "fleetVelocity"
		slot2 = slot2(slot3, slot4)
		slot3 = uv1
		slot3 = slot3.NUM0

		if slot3 < slot2 then
			slot3 = uv1
			slot3 = slot3.PERCENT
			slot3 = slot2 * slot3

			return slot3
		end
	end

	slot2 = uv1
	slot2 = slot2.NUM0
	slot3 = #slot0
	slot4 = ipairs
	slot5 = slot0
	slot4, slot5, slot6 = slot4(slot5)

	for slot7, slot8 in slot4, slot5, slot6 do
		slot10 = slot8
		slot9 = slot8.GetAttrByName
		slot11 = "velocity"
		slot9 = slot9(slot10, slot11)
		slot2 = slot2 + slot9
	end

	slot4 = uv1
	slot4 = slot4.NUM1
	slot5 = uv1
	slot5 = slot5.SPEED_CONST
	slot6 = uv1
	slot6 = slot6.NUM1
	slot6 = slot3 - slot6
	slot5 = slot5 * slot6
	slot4 = slot4 - slot5
	slot5 = slot2 / slot3
	slot5 = slot5 * slot4

	return slot5
end

slot0.GetFleetVelocity = slot15

function slot15(slot0)
	slot1 = uv0
	slot1 = slot1.NUM0
	slot2 = ipairs
	slot3 = slot0
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot8 = slot6
		slot7 = slot6.GetReload
		slot7 = slot7(slot8)
		slot1 = slot1 + slot7
	end

	return slot1
end

slot0.GetFleetReload = slot15

function slot15(slot0)
	slot1 = uv0
	slot1 = slot1.NUM0
	slot2 = ipairs
	slot3 = slot0
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot8 = slot6
		slot7 = slot6.GetTorpedoPower
		slot7 = slot7(slot8)
		slot1 = slot1 + slot7
	end

	return slot1
end

slot0.GetFleetTorpedoPower = slot15

function slot15(slot0, slot1)
	slot2 = SYSTEM_DUEL

	if slot0 == slot2 then
		slot2 = slot1.level
		slot3 = slot1.durability
		slot4 = ys
		slot4 = slot4.Battle
		slot4 = slot4.BattleDataFunction
		slot4 = slot4.GetPlayerUnitDurabilityExtraAddition
		slot5 = slot0
		slot6 = slot2
		slot4, slot5 = slot4(slot5, slot6)
		slot6 = slot3 * slot4
		slot6 = slot6 + slot5
		slot1.durability = slot6
	end
end

slot0.AttrFixer = slot15

function slot15(slot0, slot1)
	slot2 = 1
	slot3 = SYSTEM_DUEL

	if slot0 == slot3 then
		slot3 = slot1.level
		slot4 = ys
		slot4 = slot4.Battle
		slot4 = slot4.BattleDataFunction
		slot4 = slot4.GetPlayerUnitDurabilityExtraAddition
		slot5 = slot0
		slot6 = slot3
		slot4 = slot4(slot5, slot6)
		slot2 = slot4
	end

	return slot2
end

slot0.HealFixer = slot15

function slot15(slot0)
	slot1 = uv0
	slot1 = slot0 * slot1

	return slot1
end

slot0.ConvertShipSpeed = slot15

function slot15(slot0)
	if slot0 then
		slot1 = uv0
		slot1 = slot0 * slot1

		return slot1
	else
		slot1 = nil

		return slot1
	end
end

slot0.ConvertAircraftSpeed = slot15

function slot15(slot0)
	slot1 = uv0
	slot1 = slot0 * slot1

	return slot1
end

slot0.ConvertBulletSpeed = slot15

function slot15(slot0, slot1, slot2, slot3)
	slot4 = uv0
	slot4 = slot4.NUM1
	slot5 = uv0
	slot5 = slot5.NUM0
	slot6 = uv0
	slot6 = slot6.NUM10000
	slot7 = uv0
	slot7 = slot7.DRATE
	slot8 = uv0
	slot8 = slot8.ACCURACY
	slot10 = slot0
	slot9 = slot0.GetWeaponHostAttr
	slot9 = slot9(slot10)
	slot11 = slot0
	slot10 = slot0.GetWeapon
	slot10 = slot10(slot11)
	slot12 = slot0
	slot11 = slot0.GetWeaponTempData
	slot11 = slot11(slot12)
	slot12 = slot11.type
	slot13 = slot11.attack_attribute
	slot15 = slot10
	slot14 = slot10.GetConvertedAtkAttr
	slot14 = slot14(slot15)
	slot16 = slot0
	slot15 = slot0.GetTemplate
	slot15 = slot15(slot16)
	slot16 = slot15.damage_type
	slot17 = slot15.random_damage_rate
	slot18 = slot1._attr

	if not slot3 then
		slot19 = slot4
	end

	if not slot2 then
		slot2 = slot5
	end

	slot20 = slot18.armorType
	slot21 = slot9.formulaLevel
	slot22 = slot18.formulaLevel
	slot21 = slot21 - slot22
	slot22 = slot4
	slot23 = false
	slot24 = false
	slot25 = slot4
	slot27 = slot0
	slot26 = slot0.GetCorrectedDMG
	slot26 = slot26(slot27)
	slot28 = slot0
	slot27 = slot0.GetWeaponAtkAttr
	slot27 = slot27(slot28)
	slot28 = slot27 * slot14
	slot28 = slot4 + slot28
	slot26 = slot28 * slot26
	slot28 = uv1
	slot28 = slot28.WeaponDamageAttr
	slot28 = slot28.CANNON

	if slot13 == slot28 then
		slot28 = uv2
		slot28 = slot28.GetCurrent
		slot29 = slot1
		slot30 = "injureRatioByCannon"
		slot28 = slot28(slot29, slot30)
		slot28 = slot4 + slot28
		slot29 = uv2
		slot29 = slot29.GetCurrent
		slot30 = slot0
		slot31 = "damageRatioByCannon"
		slot29 = slot29(slot30, slot31)
		slot19 = slot28 + slot29
	else
		slot28 = uv1
		slot28 = slot28.WeaponDamageAttr
		slot28 = slot28.TORPEDO

		if slot13 == slot28 then
			slot28 = uv2
			slot28 = slot28.GetCurrent
			slot29 = slot1
			slot30 = "injureRatioByBulletTorpedo"
			slot28 = slot28(slot29, slot30)
			slot28 = slot4 + slot28
			slot29 = uv2
			slot29 = slot29.GetCurrent
			slot30 = slot0
			slot31 = "damageRatioByBulletTorpedo"
			slot29 = slot29(slot30, slot31)
			slot19 = slot28 + slot29
		else
			slot28 = uv1
			slot28 = slot28.WeaponDamageAttr
			slot28 = slot28.AIR

			if slot13 == slot28 then
				slot28 = slot7[7]
				slot29 = slot18.antiAirPower
				slot30 = slot7[7]
				slot29 = slot29 + slot30
				slot28 = slot28 / slot29
				slot28 = slot19 * slot28
				slot29 = uv2
				slot29 = slot29.GetCurrent
				slot30 = slot1
				slot31 = "injureRatioByAir"
				slot29 = slot29(slot30, slot31)
				slot29 = slot4 + slot29
				slot30 = uv2
				slot30 = slot30.GetCurrent
				slot31 = slot0
				slot32 = "damageRatioByAir"
				slot30 = slot30(slot31, slot32)
				slot29 = slot29 + slot30
				slot19 = slot28 * slot29
			else
				slot28 = uv1
				slot28 = slot28.WeaponDamageAttr
				slot28 = slot28.ANTI_AIR

				if slot13 == slot28 then
					-- Nothing
				else
					slot28 = uv1
					slot28 = slot28.WeaponDamageAttr
					slot28 = slot28.ANIT_SUB

					if slot13 == slot28 then
						-- Nothing
					end
				end
			end
		end
	end

	slot28 = slot9.luck
	slot29 = slot18.luck
	slot28 = slot28 - slot29
	slot29 = uv2
	slot29 = slot29.GetCurrent
	slot30 = slot1
	slot31 = "perfectDodge"
	slot29 = slot29(slot30, slot31)

	if slot29 == 1 then
		slot23 = true
	else
		slot30 = slot8[1]
		slot31 = slot9.attackRating
		slot32 = slot9.attackRating
		slot33 = slot18.dodgeRate
		slot32 = slot32 + slot33
		slot33 = slot8[2]
		slot32 = slot32 + slot33
		slot31 = slot31 / slot32
		slot30 = slot30 + slot31
		slot31 = slot28 + slot21
		slot32 = uv0
		slot32 = slot32.PERCENT1
		slot31 = slot31 * slot32
		slot30 = slot30 + slot31
		slot31 = uv2
		slot31 = slot31.GetCurrent
		slot32 = slot1
		slot33 = "accuracyRateExtra"
		slot31 = slot31(slot32, slot33)
		slot32 = uv2
		slot32 = slot32.GetCurrent
		slot33 = slot0
		slot34 = uv3
		slot36 = slot1
		slot35 = slot1.GetTemplate
		slot35 = slot35(slot36)
		slot35 = slot35.type
		slot34 = slot34[slot35]
		slot32 = slot32(slot33, slot34)
		slot33 = uv2
		slot33 = slot33.GetCurrent
		slot34 = slot1
		slot35 = "dodgeRateExtra"
		slot33 = slot33(slot34, slot35)
		slot34 = math
		slot34 = slot34.max
		slot35 = slot7[5]
		slot36 = math
		slot36 = slot36.min
		slot37 = slot4
		slot38 = slot30 + slot31
		slot38 = slot38 + slot32
		slot38 = slot38 - slot33
		slot34 = slot34(slot35, slot36(slot37, slot38))
		slot30 = slot34
		slot34 = uv4
		slot34 = slot34.IsHappen
		slot35 = slot30 * slot6
		slot34 = slot34(slot35)
		slot23 = not slot34
	end

	if not slot23 then
		slot30 = nil
		slot31 = uv2
		slot31 = slot31.GetCurrent
		slot32 = slot0
		slot33 = "GCT"
		slot31 = slot31(slot32, slot33)

		if slot31 == 1 then
			slot30 = 1
		else
			slot31 = uv0
			slot31 = slot31.DFT_CRIT_RATE
			slot32 = slot9.attackRating
			slot33 = slot9.attackRating
			slot34 = slot18.dodgeRate
			slot33 = slot33 + slot34
			slot34 = slot7[4]
			slot33 = slot33 + slot34
			slot32 = slot32 / slot33
			slot31 = slot31 + slot32
			slot32 = slot28 + slot21
			slot33 = slot7[3]
			slot32 = slot32 * slot33
			slot31 = slot31 + slot32
			slot32 = uv2
			slot32 = slot32.GetCurrent
			slot33 = slot0
			slot34 = "cri"
			slot32 = slot32(slot33, slot34)
			slot30 = slot31 + slot32
		end

		slot31 = math
		slot31 = slot31.random
		slot32 = uv5
		slot32 = slot32.RANDOM_DAMAGE_MIN
		slot33 = uv5
		slot33 = slot33.RANDOM_DAMAGE_MAX
		slot31 = slot31(slot32, slot33)
		slot25 = slot31 + slot26
		slot32 = uv4
		slot32 = slot32.IsHappen
		slot33 = slot30 * slot6
		slot32 = slot32(slot33)

		if slot32 then
			slot24 = true
			slot32 = math
			slot32 = slot32.max
			slot33 = 1
			slot34 = uv0
			slot34 = slot34.DFT_CRIT_EFFECT
			slot35 = uv2
			slot35 = slot35.GetCurrent
			slot36 = slot0
			slot37 = "criDamage"
			slot35 = slot35(slot36, slot37)
			slot34 = slot34 + slot35
			slot35 = uv2
			slot35 = slot35.GetCurrent
			slot36 = slot1
			slot37 = "criDamageResist"
			slot35 = slot35(slot36, slot37)
			slot34 = slot34 - slot35
			slot32 = slot32(slot33, slot34)
			slot22 = slot32
		else
			slot24 = false
		end
	else
		slot25 = slot5
		slot30 = {
			isMiss = true,
			isDamagePrevent = false,
			isCri = slot24
		}
		slot31 = slot25
		slot32 = slot30

		return slot31, slot32
	end

	slot30 = uv0
	slot30 = slot30.NUM1
	slot31 = uv2
	slot31 = slot31.GetCurrent
	slot32 = slot0
	slot33 = "damageRatioBullet"
	slot31 = slot31(slot32, slot33)
	slot32 = uv2
	slot32 = slot32.GetCurrent
	slot33 = slot0
	slot34 = "damageEnhanceProjectile"
	slot32 = slot32(slot33, slot34)
	slot33 = uv2
	slot33 = slot33.GetTagAttr
	slot34 = slot0
	slot35 = slot1
	slot33 = slot33(slot34, slot35)
	slot34 = uv2
	slot34 = slot34.GetCurrent
	slot35 = slot1
	slot36 = "injureRatio"
	slot34 = slot34(slot35, slot36)
	slot36 = slot10
	slot35 = slot10.GetFixAmmo
	slot35 = slot35(slot36)

	if not slot35 then
		slot35 = slot16[slot20]

		if not slot35 then
			slot35 = slot30
		end
	end

	slot36 = uv2
	slot36 = slot36.GetCurrent
	slot37 = slot0
	slot38 = uv5
	slot38 = slot38.AGAINST_ARMOR_ENHANCE
	slot38 = slot38[slot20]
	slot36 = slot36(slot37, slot38)
	slot35 = slot35 + slot36
	slot36 = uv2
	slot36 = slot36.GetCurrent
	slot37 = slot0
	slot38 = uv6
	slot39 = slot15.ammo_type
	slot38 = slot38[slot39]
	slot36 = slot36(slot37, slot38)
	slot37 = uv2
	slot37 = slot37.GetCurrent
	slot38 = slot1
	slot39 = uv7
	slot40 = slot15.ammo_type
	slot39 = slot39[slot40]
	slot37 = slot37(slot38, slot39)
	slot38 = uv2
	slot38 = slot38.GetCurrent
	slot39 = slot0
	slot40 = "comboTag"
	slot38 = slot38(slot39, slot40)
	slot39 = uv2
	slot39 = slot39.GetCurrent
	slot40 = slot1
	slot41 = slot38
	slot39 = slot39(slot40, slot41)
	slot40 = math
	slot40 = slot40.max
	slot41 = slot30
	slot42 = math
	slot42 = slot42.floor
	slot43 = slot25 * slot19
	slot44 = slot30 - slot2
	slot43 = slot43 * slot44
	slot43 = slot43 * slot35
	slot43 = slot43 * slot22
	slot44 = slot30 + slot31
	slot43 = slot43 * slot44
	slot43 = slot43 * slot33
	slot44 = slot30 + slot34
	slot43 = slot43 * slot44
	slot44 = slot30 + slot36
	slot44 = slot44 - slot37
	slot43 = slot43 * slot44
	slot44 = slot30 + slot39
	slot43 = slot43 * slot44
	slot44 = math
	slot44 = slot44.min
	slot45 = slot7[1]
	slot46 = math
	slot46 = slot46.max
	slot47 = slot7[1]
	slot47 = -slot47
	slot48 = slot21
	slot44 = slot44(slot45, slot46(slot47, slot48))
	slot45 = slot7[2]
	slot44 = slot44 * slot45
	slot44 = slot30 + slot44
	slot43 = slot43 * slot44
	slot40 = slot40(slot41, slot42(slot43))
	slot25 = slot40
	slot41 = slot1
	slot40 = slot1.GetCurrentOxyState
	slot40 = slot40(slot41)
	slot41 = uv1
	slot41 = slot41.OXY_STATE
	slot41 = slot41.DIVE

	if slot40 == slot41 then
		slot40 = math
		slot40 = slot40.floor
		slot41 = slot15.antisub_enhancement
		slot41 = slot25 * slot41
		slot40 = slot40(slot41)
		slot25 = slot40
	end

	slot40 = {
		isMiss = slot23,
		isCri = slot24,
		damageAttr = slot13
	}
	slot42 = slot0
	slot41 = slot0.GetDamageEnhance
	slot41 = slot41(slot42)

	if slot41 ~= 1 then
		slot42 = math
		slot42 = slot42.floor
		slot43 = slot25 * slot41
		slot42 = slot42(slot43)
		slot25 = slot42
	end

	slot42 = type
	slot43 = slot15.hit_type
	slot42 = slot42(slot43)

	if slot42 == "table" then
		slot42 = slot15.hit_type
		slot42 = slot42.rate

		if slot42 then
			slot42 = slot0.GetExplodePostion

			if slot42 then
				slot42 = slot15.hit_type
				slot42 = slot42.range
				slot43 = slot15.hit_type
				slot43 = slot43.rate
				slot44 = pg
				slot44 = slot44.Tool
				slot44 = slot44.FilterY
				slot46 = slot0
				slot45 = slot0.GetExplodePostion
				slot44 = slot44(slot45(slot46))
				slot45 = pg
				slot45 = slot45.Tool
				slot45 = slot45.FilterY
				slot47 = slot1
				slot46 = slot1.GetPosition
				slot45 = slot45(slot46(slot47))
				slot46 = Vector3
				slot46 = slot46.Distance
				slot47 = slot44
				slot48 = slot45
				slot46 = slot46(slot47, slot48)
				slot47 = math
				slot47 = slot47.floor
				slot48 = uv0
				slot48 = slot48.NUM1
				slot49 = Mathf
				slot49 = slot49.Clamp
				slot50 = slot46 / slot42
				slot51 = 0
				slot52 = 1
				slot49 = slot49(slot50, slot51, slot52)
				slot49 = slot49 * slot43
				slot48 = slot48 - slot49
				slot48 = slot25 * slot48
				slot47 = slot47(slot48)
				slot25 = slot47
			end
		end
	end

	slot42 = math
	slot42 = slot42.floor
	slot43 = slot18.repressReduce
	slot43 = slot25 * slot43
	slot42 = slot42(slot43)
	slot25 = slot42
	slot25 = slot25 + slot32

	if slot17 ~= 0 then
		slot42 = Mathf
		slot42 = slot42.RandomFloat
		slot43 = slot17
		slot42 = slot42(slot43)
		slot42 = slot42 + 1
		slot43 = math
		slot43 = slot43.floor
		slot44 = slot25 * slot42
		slot43 = slot43(slot44)
		slot25 = slot43
	end

	slot42 = slot25
	slot43 = slot40
	slot44 = slot15.DMG_font
	slot44 = slot44[slot20]

	return slot42, slot43, slot44
end

slot0.CalculateDamage = slot15

function slot15(slot0, slot1, slot2)
	slot3 = slot0._attr
	slot5 = slot0
	slot4 = slot0.GetWeapon
	slot4 = slot4(slot5)
	slot6 = slot4
	slot5 = slot4.GetCorrectedDMG
	slot5 = slot5(slot6)
	slot6 = slot3[slot1]
	slot7 = uv0
	slot7 = slot7.PERCENT
	slot6 = slot6 * slot7
	slot6 = 1 + slot6
	slot6 = slot5 * slot6
	slot6 = slot6 * slot2

	return slot6
end

slot0.CalculateIgniteDamage = slot15

function slot15(slot0, slot1)
	slot3 = slot0
	slot2 = slot0.GetTemplateData
	slot2 = slot2(slot3)

	if not slot1 then
		slot3 = slot2.damage
	end

	slot4 = slot2.corrected
	slot6 = slot0
	slot5 = slot0.GetPotential
	slot5 = slot5(slot6)
	slot6 = slot3 * slot5
	slot6 = slot6 * slot4
	slot7 = uv0
	slot7 = slot7.PERCENT
	slot6 = slot6 * slot7

	return slot6
end

slot0.WeaponDamagePreCorrection = slot15

function slot15(slot0)
	slot2 = slot0
	slot1 = slot0.GetTemplateData
	slot1 = slot1(slot2)
	slot2 = slot1.attack_attribute_ratio
	slot3 = uv0
	slot3 = slot3.PERCENT2
	slot2 = slot2 * slot3

	return slot2
end

slot0.WeaponAtkAttrPreRatio = slot15

function slot15(slot0)
	slot1 = {}
	slot2 = uv0
	slot2 = slot2.METEO_RATE
	slot3 = slot2[1]
	slot4 = slot2[2]

	if slot4 <= slot0 then
		slot4 = 1
		slot5 = slot0 + 1
		slot6 = 1

		for slot7 = slot4, slot5, slot6 do
			slot1[slot7] = slot3
		end

		return slot1
	else
		slot4 = slot3 * slot0
		slot4 = 1 - slot4
		slot5 = 1
		slot6 = slot0
		slot7 = 1

		for slot8 = slot5, slot6, slot7 do
			slot9 = math
			slot9 = slot9.random
			slot9 = slot9()
			slot9 = slot9 * slot4
			slot10 = slot2[3]
			slot11 = slot2[4]
			slot12 = slot8 - 1
			slot11 = slot11 * slot12
			slot11 = slot11 / slot0
			slot10 = slot10 + slot11
			slot9 = slot9 * slot10
			slot10 = slot9 + slot3
			slot1[slot8] = slot10
			slot10 = math
			slot10 = slot10.max
			slot11 = 0
			slot12 = slot4 - slot9
			slot10 = slot10(slot11, slot12)
			slot4 = slot10
		end

		slot5 = slot0 + 1
		slot1[slot5] = slot4

		return slot1
	end
end

slot0.GetMeteoDamageRatio = slot15

function slot15(slot0)
	slot2 = slot0
	slot1 = slot0.GetCrewUnitList
	slot1 = slot1(slot2)
	slot2 = 0
	slot3 = pairs
	slot4 = slot1
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot8 = uv0
		slot8 = slot8.GetCurrent
		slot9 = slot6
		slot10 = "antiAirPower"
		slot8 = slot8(slot9, slot10)
		slot9 = ipairs
		slot10 = slot7
		slot9, slot10, slot11 = slot9(slot10)

		for slot12, slot13 in slot9, slot10, slot11 do
			slot15 = slot13
			slot14 = slot13.GetConvertedAtkAttr
			slot14 = slot14(slot15)
			slot16 = slot13
			slot15 = slot13.GetCorrectedDMG
			slot15 = slot15(slot16)
			slot16 = math
			slot16 = slot16.max
			slot17 = 1
			slot18 = slot8 * slot14
			slot18 = slot18 + 1
			slot18 = slot18 * slot15
			slot16 = slot16(slot17, slot18)
			slot2 = slot2 + slot16
		end
	end

	return slot2
end

slot0.CalculateFleetAntiAirTotalDamage = slot15

function slot15(slot0)
	slot2 = slot0
	slot1 = slot0.GetHost
	slot1 = slot1(slot2)
	slot3 = slot0
	slot2 = slot0.GetConvertedAtkAttr
	slot2 = slot2(slot3)
	slot4 = slot0
	slot3 = slot0.GetCorrectedDMG
	slot3 = slot3(slot4)
	slot4 = uv0
	slot4 = slot4.GetCurrent
	slot5 = slot1
	slot6 = "antiAirPower"
	slot4 = slot4(slot5, slot6)
	slot5 = math
	slot5 = slot5.max
	slot6 = 1
	slot7 = slot4 * slot2
	slot7 = slot7 + 1
	slot7 = slot7 * slot3
	slot5 = slot5(slot6, slot7)

	return slot5
end

slot0.CalculateRepaterAnitiAirTotalDamage = slot15

function slot15(slot0, slot1)
	slot3 = slot0
	slot2 = slot0.GetHost
	slot2 = slot2(slot3)
	slot3 = uv0
	slot3 = slot3.GetCurrent
	slot4 = slot2
	slot5 = "antiAirPower"
	slot3 = slot3(slot4, slot5)
	slot4 = uv0
	slot4 = slot4.GetCurrent
	slot5 = slot2
	slot6 = "attackRating"
	slot4 = slot4(slot5, slot6)
	slot5 = uv0
	slot5 = slot5.GetCurrent
	slot6 = slot1
	slot7 = "airPower"
	slot5 = slot5(slot6, slot7)
	slot6 = uv0
	slot6 = slot6.GetCurrent
	slot7 = slot1
	slot8 = "dodgeLimit"
	slot6 = slot6(slot7, slot8)
	slot7 = uv0
	slot7 = slot7.GetCurrent
	slot8 = slot1
	slot9 = "dodge"
	slot7 = slot7(slot8, slot9)
	slot8 = uv1
	slot8 = slot8.const_A
	slot8 = slot5 / slot8
	slot9 = uv1
	slot9 = slot9.const_B
	slot8 = slot8 + slot9
	slot9 = slot3 * slot7
	slot9 = slot9 + slot8
	slot10 = uv1
	slot10 = slot10.const_C
	slot9 = slot9 + slot10
	slot9 = slot8 / slot9
	slot10 = math
	slot10 = slot10.min
	slot11 = slot6
	slot12 = slot9
	slot10 = slot10(slot11, slot12)
	slot9 = slot10
	slot10 = uv2
	slot10 = slot10.IsHappen
	slot11 = uv3
	slot11 = slot11.NUM10000
	slot11 = slot9 * slot11

	return slot10(slot11)
end

slot0.RollRepeaterHitDice = slot15

function slot15(slot0)
	slot1 = slot0 * slot0

	return slot1
end

slot0.AntiAirPowerWeight = slot15

function slot15(slot0, slot1)
	slot2 = uv0
	slot2 = slot2.GetCurrent
	slot3 = slot0
	slot4 = "airPower"
	slot2 = slot2(slot3, slot4)
	slot3 = uv0
	slot3 = slot3.GetCurrent
	slot4 = slot1
	slot5 = "antiAirPower"
	slot3 = slot3(slot4, slot5)
	slot4 = uv0
	slot4 = slot4.GetCurrent
	slot5 = slot0
	slot6 = "crashDMG"
	slot4 = slot4(slot5, slot6)
	slot6 = slot0
	slot5 = slot0.GetHPRate
	slot5 = slot5(slot6)
	slot6 = uv0
	slot6 = slot6.GetCurrent
	slot7 = slot0
	slot8 = "formulaLevel"
	slot6 = slot6(slot7, slot8)
	slot7 = uv0
	slot7 = slot7.GetCurrent
	slot8 = slot1
	slot9 = "formulaLevel"
	slot7 = slot7(slot8, slot9)
	slot8 = uv0
	slot8 = slot8.GetCurrent
	slot9 = slot1
	slot10 = "injureRatio"
	slot8 = slot8(slot9, slot10)
	slot9 = uv0
	slot9 = slot9.GetCurrent
	slot10 = slot1
	slot11 = "injureRatioByAir"
	slot9 = slot9(slot10, slot11)
	slot10 = uv1
	slot10 = slot10.PLANE_LEAK_RATE
	slot11 = math
	slot11 = slot11.max
	slot12 = slot10[1]
	slot13 = math
	slot13 = slot13.floor
	slot14 = slot10[2]
	slot15 = slot10[3]
	slot15 = slot2 * slot15
	slot14 = slot14 + slot15
	slot14 = slot4 * slot14
	slot15 = slot10[4]
	slot15 = slot6 * slot15
	slot14 = slot14 + slot15
	slot15 = slot10[5]
	slot15 = slot5 * slot15
	slot16 = slot10[6]
	slot15 = slot15 + slot16
	slot14 = slot14 * slot15
	slot15 = slot10[7]
	slot16 = slot6 - slot7
	slot17 = slot10[8]
	slot16 = slot16 * slot17
	slot15 = slot15 + slot16
	slot14 = slot14 * slot15
	slot15 = slot10[9]
	slot16 = slot10[10]
	slot16 = slot3 + slot16
	slot15 = slot15 / slot16
	slot14 = slot14 * slot15
	slot15 = slot10[11]
	slot15 = slot15 + slot8
	slot14 = slot14 * slot15
	slot15 = slot10[12]
	slot15 = slot15 + slot9
	slot14 = slot14 * slot15
	slot11 = slot11(slot12, slot13(slot14))
	slot12 = math
	slot12 = slot12.floor
	slot13 = uv0
	slot13 = slot13.GetCurrent
	slot14 = slot1
	slot15 = "repressReduce"
	slot13 = slot13(slot14, slot15)
	slot13 = slot11 * slot13
	slot12 = slot12(slot13)
	slot11 = slot12

	return slot11
end

slot0.CalculateDamageFromAircraftToMainShip = slot15

function slot15(slot0, slot1)
	slot2 = uv0
	slot2 = slot2.GetCurrent
	slot3 = slot0
	slot4 = "cannonPower"
	slot2 = slot2(slot3, slot4)
	slot3 = uv0
	slot3 = slot3.GetCurrent
	slot4 = slot0
	slot5 = "torpedoPower"
	slot3 = slot3(slot4, slot5)
	slot5 = slot0
	slot4 = slot0.GetHPRate
	slot4 = slot4(slot5)
	slot5 = uv0
	slot5 = slot5.GetCurrent
	slot6 = slot0
	slot7 = "formulaLevel"
	slot5 = slot5(slot6, slot7)
	slot6 = uv0
	slot6 = slot6.GetCurrent
	slot7 = slot1
	slot8 = "formulaLevel"
	slot6 = slot6(slot7, slot8)
	slot7 = uv0
	slot7 = slot7.GetCurrent
	slot8 = slot1
	slot9 = "injureRatio"
	slot7 = slot7(slot8, slot9)
	slot8 = uv1
	slot8 = slot8.LEAK_RATE
	slot9 = math
	slot9 = slot9.max
	slot10 = slot8[1]
	slot11 = math
	slot11 = slot11.floor
	slot12 = slot2 + slot3
	slot13 = slot8[2]
	slot12 = slot12 * slot13
	slot13 = slot8[7]
	slot13 = slot5 * slot13
	slot12 = slot12 + slot13
	slot13 = slot8[5]
	slot13 = slot13 + slot7
	slot12 = slot12 * slot13
	slot13 = slot8[3]
	slot13 = slot4 * slot13
	slot14 = slot8[4]
	slot13 = slot13 + slot14
	slot12 = slot12 * slot13
	slot13 = slot8[5]
	slot14 = slot5 - slot6
	slot15 = slot8[6]
	slot14 = slot14 * slot15
	slot13 = slot13 + slot14
	slot12 = slot12 * slot13
	slot9 = slot9(slot10, slot11(slot12))
	slot10 = math
	slot10 = slot10.floor
	slot11 = uv0
	slot11 = slot11.GetCurrent
	slot12 = slot1
	slot13 = "repressReduce"
	slot11 = slot11(slot12, slot13)
	slot11 = slot9 * slot11
	slot10 = slot10(slot11)
	slot9 = slot10

	return slot9
end

slot0.CalculateDamageFromShipToMainShip = slot15

function slot15(slot0, slot1)
	slot2 = uv0
	slot2 = slot2.GetCurrent
	slot3 = slot0
	slot4 = "torpedoPower"
	slot2 = slot2(slot3, slot4)
	slot4 = slot0
	slot3 = slot0.GetHPRate
	slot3 = slot3(slot4)
	slot4 = uv0
	slot4 = slot4.GetCurrent
	slot5 = slot0
	slot6 = "formulaLevel"
	slot4 = slot4(slot5, slot6)
	slot5 = uv0
	slot5 = slot5.GetCurrent
	slot6 = slot1
	slot7 = "formulaLevel"
	slot5 = slot5(slot6, slot7)
	slot6 = uv0
	slot6 = slot6.GetCurrent
	slot7 = slot1
	slot8 = "injureRatio"
	slot6 = slot6(slot7, slot8)
	slot7 = uv1
	slot7 = slot7.SUBMARINE_KAMIKAZE
	slot8 = math
	slot8 = slot8.max
	slot9 = slot7[1]
	slot10 = math
	slot10 = slot10.floor
	slot11 = slot7[2]
	slot11 = slot2 * slot11
	slot12 = slot7[3]
	slot12 = slot4 * slot12
	slot11 = slot11 + slot12
	slot12 = slot7[4]
	slot12 = slot12 + slot6
	slot11 = slot11 * slot12
	slot12 = slot7[5]
	slot12 = slot3 * slot12
	slot13 = slot7[6]
	slot12 = slot12 + slot13
	slot11 = slot11 * slot12
	slot12 = slot7[7]
	slot13 = slot4 - slot5
	slot14 = slot7[8]
	slot13 = slot13 * slot14
	slot12 = slot12 + slot13
	slot11 = slot11 * slot12
	slot8 = slot8(slot9, slot10(slot11))

	return slot8
end

slot0.CalculateDamageFromSubmarinToMainShip = slot15

function slot15(slot0)
	slot1 = uv0
	slot1 = slot1.GetCurrent
	slot2 = slot0
	slot3 = "dodgeRate"
	slot1 = slot1(slot2, slot3)
	slot2 = uv1
	slot2 = slot2.MONSTER_SUB_KAMIKAZE_DUAL_K
	slot2 = slot1 + slot2
	slot2 = slot1 / slot2
	slot3 = uv1
	slot3 = slot3.MONSTER_SUB_KAMIKAZE_DUAL_P
	slot2 = slot2 * slot3
	slot3 = uv2
	slot3 = slot3.IsHappen
	slot4 = uv3
	slot4 = slot4.NUM10000
	slot4 = slot2 * slot4

	return slot3(slot4)
end

slot0.RollSubmarineDualDice = slot15

function slot15(slot0, slot1)
	slot2 = uv0
	slot2 = slot2.GetCurrent
	slot3 = slot0
	slot4 = "maxHP"
	slot2 = slot2(slot3, slot4)
	slot3 = uv0
	slot3 = slot3.GetCurrent
	slot4 = slot1
	slot5 = "maxHP"
	slot3 = slot3(slot4, slot5)
	slot4 = uv1
	slot4 = slot4.CRASH_RATE
	slot4 = slot4[1]
	slot4 = slot2 * slot4
	slot5 = uv1
	slot5 = slot5.CRASH_RATE
	slot5 = slot5[1]
	slot5 = slot3 * slot5
	slot6 = uv0
	slot6 = slot6.GetCurrent
	slot7 = slot0
	slot8 = "hammerDamageRatio"
	slot6 = slot6(slot7, slot8)
	slot7 = uv0
	slot7 = slot7.GetCurrent
	slot8 = slot1
	slot9 = "hammerDamageRatio"
	slot7 = slot7(slot8, slot9)
	slot8 = uv0
	slot8 = slot8.GetCurrent
	slot9 = slot0
	slot10 = "hammerDamagePrevent"
	slot8 = slot8(slot9, slot10)
	slot9 = uv0
	slot9 = slot9.GetCurrent
	slot10 = slot1
	slot11 = "hammerDamagePrevent"
	slot9 = slot9(slot10, slot11)
	slot10 = math
	slot10 = slot10.sqrt
	slot11 = slot2 * slot3
	slot10 = slot10(slot11)
	slot11 = uv1
	slot11 = slot11.CRASH_RATE
	slot11 = slot11[2]
	slot10 = slot10 * slot11
	slot11 = math
	slot11 = slot11.min
	slot12 = slot4
	slot13 = slot10
	slot11 = slot11(slot12, slot13)
	slot12 = math
	slot12 = slot12.min
	slot13 = slot5
	slot14 = slot10
	slot12 = slot12(slot13, slot14)
	slot13 = math
	slot13 = slot13.floor
	slot14 = 1 + slot7
	slot14 = slot11 * slot14
	slot15 = 1 - slot8
	slot14 = slot14 * slot15
	slot13 = slot13(slot14)
	slot14 = math
	slot14 = slot14.floor
	slot15 = uv0
	slot15 = slot15.GetCurrent
	slot16 = slot0
	slot17 = "repressReduce"
	slot15 = slot15(slot16, slot17)
	slot15 = slot13 * slot15
	slot14 = slot14(slot15)
	slot13 = slot14
	slot14 = math
	slot14 = slot14.floor
	slot15 = 1 + slot6
	slot15 = slot12 * slot15
	slot16 = 1 - slot9
	slot15 = slot15 * slot16
	slot14 = slot14(slot15)
	slot15 = math
	slot15 = slot15.floor
	slot16 = uv0
	slot16 = slot16.GetCurrent
	slot17 = slot1
	slot18 = "repressReduce"
	slot16 = slot16(slot17, slot18)
	slot16 = slot14 * slot16
	slot15 = slot15(slot16)
	slot14 = slot15
	slot15 = slot13
	slot16 = slot14

	return slot15, slot16
end

slot0.CalculateCrashDamage = slot15

function slot15(slot0)
	slot1 = uv0
	slot1 = slot1.SCORE_RATE
	slot1 = slot1[1]
	slot1 = slot0 * slot1

	return slot1
end

slot0.CalculateFleetDamage = slot15

function slot15(slot0, slot1)
	slot3 = slot0
	slot2 = slot0.GetFlagShip
	slot2 = slot2(slot3)

	if slot1 == slot2 then
		slot2 = uv0
		slot2 = slot2.GetCurrent
		slot3 = slot1
		slot4 = "maxHP"
		slot2 = slot2(slot3, slot4)
		slot3 = uv1
		slot3 = slot3.SCORE_RATE
		slot3 = slot3[2]
		slot2 = slot2 * slot3

		return slot2
	else
		slot2 = uv0
		slot2 = slot2.GetCurrent
		slot3 = slot1
		slot4 = "maxHP"
		slot2 = slot2(slot3, slot4)
		slot3 = uv1
		slot3 = slot3.SCORE_RATE
		slot3 = slot3[3]
		slot2 = slot2 * slot3

		return slot2
	end
end

slot0.CalculateFleetOverDamage = slot15

function slot15(slot0, slot1)
	slot2 = slot1.loadSpeed
	slot3 = uv0
	slot3 = slot3.CalculateReloadTime
	slot4 = slot0
	slot5 = slot2

	return slot3(slot4, slot5)
end

slot0.ReloadTime = slot15

function slot15(slot0, slot1)
	slot2 = uv0
	slot2 = slot2.K1
	slot2 = slot0 / slot2
	slot3 = math
	slot3 = slot3.sqrt
	slot4 = uv0
	slot4 = slot4.K2
	slot4 = slot1 + slot4
	slot5 = uv0
	slot5 = slot5.K3
	slot4 = slot4 * slot5
	slot3 = slot3(slot4)
	slot2 = slot2 / slot3

	return slot2
end

slot0.CalculateReloadTime = slot15

function slot15(slot0, slot1)
	slot2 = math
	slot2 = slot2.sqrt
	slot3 = uv0
	slot3 = slot3.K2
	slot3 = slot1 + slot3
	slot4 = uv0
	slot4 = slot4.K3
	slot3 = slot3 * slot4
	slot2 = slot2(slot3)
	slot2 = slot2 * slot0
	slot3 = uv0
	slot3 = slot3.K1
	slot2 = slot2 * slot3

	return slot2
end

slot0.CaclulateReloaded = slot15

function slot15(slot0, slot1)
	slot2 = uv0
	slot2 = slot2.K1
	slot2 = slot0 / slot2
	slot2 = slot2 / slot1
	slot3 = slot2 * slot2
	slot4 = uv0
	slot4 = slot4.K3
	slot3 = slot3 / slot4
	slot4 = uv0
	slot4 = slot4.K2
	slot3 = slot3 - slot4

	return slot3
end

slot0.CaclulateReloadAttr = slot15

function slot15(slot0)
	slot1 = 0
	slot2 = ipairs
	slot3 = slot0
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot8 = slot6
		slot7 = slot6.GetTemplateData
		slot7 = slot7(slot8)
		slot7 = slot7.reload_max
		slot1 = slot1 + slot7
	end

	slot2 = #slot0
	slot2 = slot1 / slot2
	slot3 = uv0
	slot1 = slot2 * slot3

	return slot1
end

slot0.CaclulateAirAssistReloadMax = slot15

function slot15(slot0, slot1, slot2, slot3)
	slot4 = slot1.arg_list
	slot5 = uv0
	slot5 = slot5.DOT_CONFIG
	slot6 = slot4.dotType
	slot5 = slot5[slot6]
	slot7 = slot2
	slot6 = slot2.GetAttrByName
	slot8 = slot5.hit
	slot6 = slot6(slot7, slot8)
	slot8 = slot3
	slot7 = slot3.GetAttrByName
	slot9 = slot5.resist
	slot7 = slot7(slot8, slot9)
	slot8 = uv1
	slot8 = slot8.IsHappen
	slot9 = uv2
	slot9 = slot9.NUM1
	slot9 = slot9 + slot6
	slot9 = slot0 * slot9
	slot10 = uv2
	slot10 = slot10.NUM1
	slot10 = slot10 - slot7
	slot9 = slot9 * slot10

	return slot8(slot9)
end

slot0.CaclulateDOTPlace = slot15

function slot15(slot0, slot1, slot2)
	slot3 = slot0.arg_list
	slot4 = uv0
	slot4 = slot4.DOT_CONFIG
	slot5 = slot3.dotType
	slot4 = slot4[slot5]
	slot6 = slot1
	slot5 = slot1.GetAttrByName
	slot7 = slot4.prolong
	slot5 = slot5(slot6, slot7)
	slot7 = slot2
	slot6 = slot2.GetAttrByName
	slot8 = slot4.shorten
	slot6 = slot6(slot7, slot8)
	slot7 = slot5 - slot6

	return slot7
end

slot0.CaclulateDOTDuration = slot15

function slot15(slot0, slot1, slot2)
	slot3 = slot0.arg_list
	slot4 = uv0
	slot4 = slot4.DOT_CONFIG
	slot5 = slot3.dotType
	slot4 = slot4[slot5]
	slot6 = slot1
	slot5 = slot1.GetAttrByName
	slot7 = slot4.enhance
	slot5 = slot5(slot6, slot7)
	slot7 = slot2
	slot6 = slot2.GetAttrByName
	slot8 = slot4.reduce
	slot6 = slot6(slot7, slot8)
	slot7 = slot5 - slot6
	slot8 = uv1
	slot8 = slot8.PERCENT2
	slot7 = slot7 * slot8

	return slot7
end

slot0.CaclulateDOTDamageEnhanceRate = slot15

function slot15()
	slot0 = 0
	slot1 = {
		false,
		true,
		false
	}

	return slot0, slot1
end

slot0.CalcDamageLock = slot15

function slot15()
	slot0 = 0

	return slot0
end

slot0.CalcDamageLockA2M = slot15

function slot15()
	slot0 = 0

	return slot0
end

slot0.CalcDamageLockS2M = slot15

function slot15()
	slot0 = 0
	slot1 = 0

	return slot0, slot1
end

slot0.CalcDamageLockCrush = slot15

function slot15()
	slot0 = 0
	slot1 = 100000

	return slot0, slot1
end

slot0.UnilateralCrush = slot15

function slot15(slot0)
	slot1 = slot0 * 0.01
	slot1 = 1 - slot1

	return slot1
end

slot0.ChapterRepressReduce = slot15

function slot15(slot0)
	slot1 = 0

	if slot0 <= slot1 then
		slot1 = false

		return slot1
	else
		slot1 = 10000

		if slot0 >= slot1 then
			slot1 = true

			return slot1
		else
			slot1 = math
			slot1 = slot1.random
			slot2 = 10000
			slot1 = slot1(slot2)

			if slot1 > slot0 then
				slot2 = false
			else
				slot2 = true
			end

			return slot2
		end
	end
end

slot0.IsHappen = slot15

function slot15(slot0)
	slot1 = uv0
	slot1 = slot1.GenerateWeightList
	slot2 = slot0
	slot1, slot2 = slot1(slot2)
	slot3 = uv0
	slot3 = slot3.WeightListRandom
	slot4 = slot1
	slot5 = slot2
	slot3 = slot3(slot4, slot5)

	return slot3
end

slot0.WeightRandom = slot15

function slot15(slot0, slot1)
	slot2 = math
	slot2 = slot2.random
	slot3 = 0
	slot4 = slot1
	slot2 = slot2(slot3, slot4)
	slot3 = pairs
	slot4 = slot0
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot8 = slot6.min
		slot9 = slot6.max

		if slot8 <= slot2 and slot2 <= slot9 then
			return slot7
		end
	end
end

slot0.WeightListRandom = slot15

function slot15(slot0)
	slot1 = {}
	slot2 = -1
	slot3 = ipairs
	slot4 = slot0
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot8 = slot7.weight
		slot9 = slot7.rst
		slot10 = slot2 + 1
		slot11 = nil
		slot2 = slot2 + slot8
		slot11 = slot2
		slot12 = {
			min = slot10,
			max = slot11
		}
		slot1[slot12] = slot9
	end

	slot3 = slot1
	slot4 = slot2

	return slot3, slot4
end

slot0.GenerateWeightList = slot15

function slot15(slot0)
	slot1 = ipairs
	slot2 = slot0
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot6 = uv0
		slot6 = slot6.IsHappen
		slot7 = slot5[1]
		slot6 = slot6(slot7)

		if slot6 then
			slot6 = true
			slot7 = slot5[2]

			return slot6, slot7
		end
	end

	slot1 = false
	slot2 = nil

	return slot1, slot2
end

slot0.IsListHappen = slot15

function slot15(slot0, slot1)
	slot2 = math
	slot2 = slot2.rad2Deg
	slot3 = math
	slot3 = slot3.atan2
	slot4 = slot1.z
	slot5 = slot0.z
	slot4 = slot4 - slot5
	slot5 = slot1.x
	slot6 = slot0.x
	slot5 = slot5 - slot6
	slot3 = slot3(slot4, slot5)
	slot2 = slot2 * slot3

	return slot2
end

slot0.BulletYAngle = slot15

function slot15(slot0, slot1)
	if not slot1 then
		slot1 = 10
	end

	slot2 = slot0.distance

	if not slot2 then
		slot2 = 10
	end

	slot2 = slot2 * slot2
	slot3 = ys
	slot3 = slot3.Battle
	slot3 = slot3.BattleTargetChoise
	slot3 = slot3.TargetAll
	slot3 = slot3()
	slot4, slot5 = nil
	slot6 = 1
	slot7 = slot1
	slot8 = 1

	for slot9 = slot6, slot7, slot8 do
		slot5 = true
		slot10 = uv0
		slot10 = slot10.RandomPos
		slot11 = slot0
		slot10 = slot10(slot11)
		slot4 = slot10
		slot10 = pairs
		slot11 = slot3
		slot10, slot11, slot12 = slot10(slot11)

		for slot13, slot14 in slot10, slot11, slot12 do
			slot16 = slot14
			slot15 = slot14.GetPosition
			slot15 = slot15(slot16)
			slot16 = Vector3
			slot16 = slot16.SqrDistance
			slot17 = slot4
			slot18 = slot15
			slot16 = slot16(slot17, slot18)

			if slot16 < slot2 then
				slot5 = false

				break
			end
		end

		if slot5 then
			return slot4
		end
	end

	slot6 = nil

	return slot6
end

slot0.RandomPosNull = slot15

function slot15(slot0)
	slot1 = slot0[1]

	if not slot1 then
		slot1 = 0
	end

	slot2 = slot0[2]

	if not slot2 then
		slot2 = 0
	end

	slot3 = slot0[3]

	if not slot3 then
		slot3 = 0
	end

	slot4 = slot0.rangeX

	if not slot4 then
		slot4 = slot0.rangeY

		if not slot4 then
			slot4 = slot0.rangeZ

			if slot4 then
				slot4 = uv0
				slot4 = slot4.RandomDelta
				slot5 = slot0.rangeX
				slot4 = slot4(slot5)
				slot5 = uv0
				slot5 = slot5.RandomDelta
				slot6 = slot0.rangeY
				slot5 = slot5(slot6)
				slot6 = uv0
				slot6 = slot6.RandomDelta
				slot7 = slot0.rangeZ
				slot6 = slot6(slot7)
				slot7 = Vector3
				slot8 = slot1 + slot4
				slot9 = slot2 + slot5
				slot10 = slot3 + slot6

				return slot7(slot8, slot9, slot10)
			else
				slot4 = uv0
				slot4 = slot4.RandomPosXYZ
				slot5 = slot0
				slot6 = "X1"
				slot7 = "X2"
				slot4 = slot4(slot5, slot6, slot7)
				slot5 = uv0
				slot5 = slot5.RandomPosXYZ
				slot6 = slot0
				slot7 = "Y1"
				slot8 = "Y2"
				slot5 = slot5(slot6, slot7, slot8)
				slot6 = uv0
				slot6 = slot6.RandomPosXYZ
				slot7 = slot0
				slot8 = "Z1"
				slot9 = "Z2"
				slot6 = slot6(slot7, slot8, slot9)
				slot7 = Vector3
				slot8 = slot1 + slot4
				slot9 = slot2 + slot5
				slot10 = slot3 + slot6

				return slot7(slot8, slot9, slot10)
			end
		end
	end
end

slot0.RandomPos = slot15

function slot15(slot0, slot1, slot2)
	slot1 = slot0[slot1]
	slot2 = slot0[slot2]

	if slot1 and slot2 then
		slot3 = math
		slot3 = slot3.random
		slot4 = slot1
		slot5 = slot2

		return slot3(slot4, slot5)
	else
		slot3 = 0

		return slot3
	end
end

slot0.RandomPosXYZ = slot15

function slot15(slot0)
	slot1 = uv0
	slot1 = slot1.RandomDelta
	slot2 = slot0.rangeX
	slot1 = slot1(slot2)
	slot2 = uv0
	slot2 = slot2.RandomDelta
	slot3 = slot0.rangeY
	slot2 = slot2(slot3)
	slot3 = uv0
	slot3 = slot3.RandomDelta
	slot4 = slot0.rangeZ
	slot3 = slot3(slot4)
	slot4 = Vector3
	slot5 = slot1
	slot6 = slot2
	slot7 = slot3

	return slot4(slot5, slot6, slot7)
end

slot0.RandomPosCenterRange = slot15

function slot15(slot0)
	if slot0 then
		slot1 = 0

		if slot0 > slot1 then
			slot1 = math
			slot1 = slot1.random
			slot2 = slot0 + slot0
			slot1 = slot1(slot2)
			slot1 = slot1 - slot0

			return slot1
		end
	else
		slot1 = 0

		return slot1
	end
end

slot0.RandomDelta = slot15
