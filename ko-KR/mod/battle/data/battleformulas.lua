ys.Battle.BattleFormulas = ys.Battle.BattleFormulas or {}
slot0 = ys.Battle.BattleFormulas
slot1 = ys.Battle.BattleConst
slot2 = pg.gameset
slot3 = ys.Battle.BattleAttr
slot4 = ys.Battle.BattleConfig
slot5 = ys.Battle.BattleConfig.AnitAirRepeaterConfig
slot6 = pg.bfConsts
slot7 = slot6.SECONDs / slot4.viewFPS * slot4.BulletSpeedConvertConst
slot8 = slot6.SECONDs / slot4.calcFPS * slot4.ShipSpeedConvertConst
slot9 = slot6.SECONDs / slot4.viewFPS * slot4.AircraftSpeedConvertConst
slot10 = slot4.AIR_ASSIST_RELOAD_RATIO * slot6.PERCENT
slot11 = slot4.DAMAGE_ENHANCE_FROM_SHIP_TYPE
slot12 = slot4.AMMO_DAMAGE_ENHANCE
slot13 = slot4.AMMO_DAMAGE_REDUCE
slot14 = slot4.SHIP_TYPE_ACCURACY_ENHANCE

function slot0.GetFleetTotalHP(slot0)
	slot3 = uv0.NUM0

	for slot7, slot8 in ipairs(slot0:GetUnitList()) do
		slot3 = slot8 == slot0:GetFlagShip() and slot3 + uv1.GetCurrent(slot8, "maxHP") * uv0.HP_CONST or slot3 + uv1.GetCurrent(slot8, "maxHP")
	end

	return slot3
end

function slot0.GetFleetVelocity(slot0)
	if slot0[1] and uv1.NUM0 < uv0.GetCurrent(slot1, "fleetVelocity") then
		return slot2 * uv1.PERCENT
	end

	slot3 = #slot0

	for slot7, slot8 in ipairs(slot0) do
		slot2 = uv1.NUM0 + slot8:GetAttrByName("velocity")
	end

	return slot2 / slot3 * (uv1.NUM1 - uv1.SPEED_CONST * (slot3 - uv1.NUM1))
end

function slot0.GetFleetReload(slot0)
	for slot5, slot6 in ipairs(slot0) do
		slot1 = uv0.NUM0 + slot6:GetReload()
	end

	return slot1
end

function slot0.GetFleetTorpedoPower(slot0)
	for slot5, slot6 in ipairs(slot0) do
		slot1 = uv0.NUM0 + slot6:GetTorpedoPower()
	end

	return slot1
end

function slot0.AttrFixer(slot0, slot1)
	if slot0 == SYSTEM_DUEL or slot0 == SYSTEM_SHAM then
		slot4, slot5 = ys.Battle.BattleDataFunction.GetPlayerUnitDurabilityExtraAddition(slot0, slot1.level)
		slot1.durability = slot1.durability * slot4 + slot5
	end
end

function slot0.HealFixer(slot0, slot1)
	slot2 = 1

	if slot0 == SYSTEM_DUEL or slot0 == SYSTEM_SHAM then
		slot2 = ys.Battle.BattleDataFunction.GetPlayerUnitDurabilityExtraAddition(slot0, slot1.level)
	end

	return slot2
end

function slot0.ConvertShipSpeed(slot0)
	return slot0 * uv0
end

function slot0.ConvertAircraftSpeed(slot0)
	if slot0 then
		return slot0 * uv0
	else
		return nil
	end
end

function slot0.ConvertBulletSpeed(slot0)
	return slot0 * uv0
end

function slot0.CalculateDamage(slot0, slot1, slot2)
	slot3 = uv0.NUM1
	slot4 = uv0.NUM0
	slot5 = uv0.NUM10000
	slot6 = uv0.DRATE
	slot7 = uv0.ACCURACY
	slot10 = slot0:GetWeaponTempData()
	slot11 = slot10.type
	slot15 = slot0:GetTemplate().damage_type
	slot16 = slot1._attr
	slot2 = slot2 or slot3
	slot17 = slot16.armorType
	slot18 = slot0._attr.formulaLevel - slot16.formulaLevel
	slot19 = slot3
	slot20 = false
	slot21 = false
	slot22 = slot3

	if slot10.attack_attribute == uv1.WeaponDamageAttr.CANNON then
		slot23 = (slot3 + slot8.cannonPower * slot0:GetWeapon():GetConvertedAtkAttr()) * slot0:GetCorrectedDMG()
		slot2 = slot3 + uv2.GetCurrent(slot1, "injureRatioByCannon") + uv2.GetCurrent(slot0, "damageRatioByCannon")
	elseif slot12 == uv1.WeaponDamageAttr.TORPEDO then
		slot23 = (slot3 + slot8.torpedoPower * slot13) * slot23
		slot2 = slot3 + uv2.GetCurrent(slot1, "injureRatioByBulletTorpedo") + uv2.GetCurrent(slot0, "damageRatioByBulletTorpedo")
	elseif slot12 == uv1.WeaponDamageAttr.ANTI_AIR then
		slot23 = (slot3 + slot8.antiAirPower * slot13) * slot23
	elseif slot12 == uv1.WeaponDamageAttr.AIR then
		slot23 = (slot3 + slot8.airPower * slot13) * slot23
		slot2 = slot2 * slot6[7] / (slot16.antiAirPower + slot6[7]) * (slot3 + uv2.GetCurrent(slot1, "injureRatioByAir") + uv2.GetCurrent(slot0, "damageRatioByAir"))
	elseif slot12 == uv1.WeaponDamageAttr.ANIT_SUB then
		slot23 = (slot3 + slot8.antiSubPower * slot13) * slot23
	end

	if not (uv2.GetCurrent(slot1, "perfectDodge") == 1 and true or not uv4.IsHappen(math.max(slot6[5], math.min(slot3, slot7[1] + slot8.attackRating / (slot8.attackRating + slot16.dodgeRate + slot7[2]) + (slot8.luck - slot16.luck + slot18) * uv0.PERCENT1 + uv2.GetCurrent(slot0, uv3[slot1:GetTemplate().type]) - uv2.GetCurrent(slot1, "dodgeRateExtra"))) * slot5)) then
		slot26 = nil
		slot22 = math.random(uv5.RANDOM_DAMAGE_MIN, uv5.RANDOM_DAMAGE_MAX) + slot23

		if uv4.IsHappen((uv2.GetCurrent(slot0, "GCT") == 1 and 1 or uv0.DFT_CRIT_RATE + slot8.attackRating / (slot8.attackRating + slot16.dodgeRate + slot6[4]) + (slot24 + slot18) * slot6[3] + uv2.GetCurrent(slot0, "cri")) * slot5) then
			slot21 = true
			slot19 = math.max(1, uv0.DFT_CRIT_EFFECT + uv2.GetCurrent(slot0, "criDamage") - uv2.GetCurrent(slot1, "criDamageResist"))
		else
			slot21 = false
		end
	else
		slot26.isCri = slot21

		return slot4, {
			isMiss = true,
			isDamagePrevent = false
		}
	end

	slot26 = uv0.NUM1
	slot28 = uv2.GetCurrent(slot0, "damageEnhanceProjectile")

	if slot1:GetCurrentOxyState() == uv1.OXY_STATE.DIVE then
		slot22 = math.floor(math.max(slot26, math.floor(slot22 * slot2 * (slot9:GetFixAmmo() or slot15[slot17] or slot26) * slot19 * (slot26 + uv2.GetCurrent(slot0, "damageRatioBullet")) * uv2.GetTagAttr(slot0, slot1) * (slot26 + uv2.GetCurrent(slot1, "injureRatio")) * (slot26 + uv2.GetCurrent(slot0, uv6[slot14.ammo_type]) - uv2.GetCurrent(slot1, uv7[slot14.ammo_type])) * (slot26 + uv2.GetCurrent(slot1, uv2.GetCurrent(slot0, "comboTag"))) * (slot26 + math.min(slot6[1], math.max(-slot6[1], slot18)) * slot6[2]))) * slot14.antisub_enhancement)
	end

	slot36 = {
		isMiss = slot20,
		isCri = slot21,
		damageAttr = slot12
	}

	if slot0:GetDamageEnhance() ~= 1 then
		slot22 = math.floor(slot22 * slot37)
	end

	if type(slot14.hit_type) == "table" and slot14.hit_type.rate and slot0.GetExplodePostion then
		slot22 = math.floor(slot22 * (uv0.NUM1 - Mathf.Clamp(Vector3.Distance(pg.Tool.FilterY(slot0:GetExplodePostion()), pg.Tool.FilterY(slot1:GetPosition())) / slot14.hit_type.range, 0, 1) * slot14.hit_type.rate))
	end

	return math.floor(slot22 * slot16.repressReduce) + slot28, slot36, slot14.DMG_font[slot17]
end

function slot0.CalculateIgniteDamage(slot0, slot1, slot2)
	return slot0:GetWeapon():GetCorrectedDMG() * (1 + slot0._attr[slot1] * uv0.PERCENT) * slot2
end

function slot0.WeaponDamagePreCorrection(slot0, slot1)
	slot2 = slot0:GetTemplateData()

	return (slot1 or slot2.damage) * slot0:GetPotential() * slot2.corrected * uv0.PERCENT
end

function slot0.WeaponAtkAttrPreRatio(slot0)
	return slot0:GetTemplateData().attack_attribute_ratio * uv0.PERCENT2
end

function slot0.GetMeteoDamageRatio(slot0)
	slot1 = {}
	slot2 = uv0.METEO_RATE
	slot3 = slot2[1]

	if slot2[2] <= slot0 then
		for slot7 = 1, slot0 + 1, 1 do
			slot1[slot7] = slot3
		end

		return slot1
	else
		slot4 = 1 - slot3 * slot0

		for slot8 = 1, slot0, 1 do
			slot9 = math.random() * slot4 * (slot2[3] + slot2[4] * (slot8 - 1) / slot0)
			slot1[slot8] = slot9 + slot3
			slot4 = math.max(0, slot4 - slot9)
		end

		slot1[slot0 + 1] = slot4

		return slot1
	end
end

function slot0.CalculateFleetAntiAirTotalDamage(slot0)
	slot2 = 0

	for slot6, slot7 in pairs(slot0:GetCrewUnitList()) do
		for slot12, slot13 in ipairs(slot7) do
			slot2 = slot2 + math.max(1, (uv0.GetCurrent(slot6, "antiAirPower") * slot13:GetConvertedAtkAttr() + 1) * slot13:GetCorrectedDMG())
		end
	end

	return slot2
end

function slot0.CalculateRepaterAnitiAirTotalDamage(slot0)
	return math.max(1, (uv0.GetCurrent(slot0:GetHost(), "antiAirPower") * slot0:GetConvertedAtkAttr() + 1) * slot0:GetCorrectedDMG())
end

function slot0.RollRepeaterHitDice(slot0, slot1)
	slot2 = slot0:GetHost()
	slot4 = uv0.GetCurrent(slot2, "attackRating")
	slot8 = uv0.GetCurrent(slot1, "airPower") / uv1.const_A + uv1.const_B

	return uv2.IsHappen(math.min(uv0.GetCurrent(slot1, "dodgeLimit"), slot8 / (uv0.GetCurrent(slot2, "antiAirPower") * uv0.GetCurrent(slot1, "dodge") + slot8 + uv1.const_C)) * uv3.NUM10000)
end

function slot0.AntiAirPowerWeight(slot0)
	return slot0 * slot0
end

function slot0.CalculateDamageFromAircraftToMainShip(slot0, slot1)
	slot6 = uv0.GetCurrent(slot0, "formulaLevel")
	slot10 = uv1.PLANE_LEAK_RATE

	return math.floor(math.max(slot10[1], math.floor((uv0.GetCurrent(slot0, "crashDMG") * (slot10[2] + uv0.GetCurrent(slot0, "airPower") * slot10[3]) + slot6 * slot10[4]) * (slot0:GetHPRate() * slot10[5] + slot10[6]) * (slot10[7] + (slot6 - uv0.GetCurrent(slot1, "formulaLevel")) * slot10[8]) * slot10[9] / (uv0.GetCurrent(slot1, "antiAirPower") + slot10[10]) * (slot10[11] + uv0.GetCurrent(slot1, "injureRatio")) * (slot10[12] + uv0.GetCurrent(slot1, "injureRatioByAir")))) * uv0.GetCurrent(slot1, "repressReduce"))
end

function slot0.CalculateDamageFromShipToMainShip(slot0, slot1)
	slot5 = uv0.GetCurrent(slot0, "formulaLevel")
	slot8 = uv1.LEAK_RATE

	return math.floor(math.max(slot8[1], math.floor(((uv0.GetCurrent(slot0, "cannonPower") + uv0.GetCurrent(slot0, "torpedoPower")) * slot8[2] + slot5 * slot8[7]) * (slot8[5] + uv0.GetCurrent(slot1, "injureRatio")) * (slot0:GetHPRate() * slot8[3] + slot8[4]) * (slot8[5] + (slot5 - uv0.GetCurrent(slot1, "formulaLevel")) * slot8[6]))) * uv0.GetCurrent(slot1, "repressReduce"))
end

function slot0.CalculateDamageFromSubmarinToMainShip(slot0, slot1)
	slot4 = uv0.GetCurrent(slot0, "formulaLevel")
	slot7 = uv1.SUBMARINE_KAMIKAZE

	return math.max(slot7[1], math.floor((uv0.GetCurrent(slot0, "torpedoPower") * slot7[2] + slot4 * slot7[3]) * (slot7[4] + uv0.GetCurrent(slot1, "injureRatio")) * (slot0:GetHPRate() * slot7[5] + slot7[6]) * (slot7[7] + (slot4 - uv0.GetCurrent(slot1, "formulaLevel")) * slot7[8])))
end

function slot0.RollSubmarineDualDice(slot0)
	slot1 = uv0.GetCurrent(slot0, "dodgeRate")

	return uv2.IsHappen(slot1 / (slot1 + uv1.MONSTER_SUB_KAMIKAZE_DUAL_K) * uv1.MONSTER_SUB_KAMIKAZE_DUAL_P * uv3.NUM10000)
end

function slot0.CalculateCrashDamage(slot0, slot1)
	slot2 = uv0.GetCurrent(slot0, "maxHP")
	slot3 = uv0.GetCurrent(slot1, "maxHP")
	slot10 = math.sqrt(slot2 * slot3) * uv1.CRASH_RATE[2]

	return math.floor(math.floor(math.min(slot2 * uv1.CRASH_RATE[1], slot10) * (1 + uv0.GetCurrent(slot1, "hammerDamageRatio")) * (1 - uv0.GetCurrent(slot0, "hammerDamagePrevent"))) * uv0.GetCurrent(slot0, "repressReduce")), math.floor(math.floor(math.min(slot3 * uv1.CRASH_RATE[1], slot10) * (1 + uv0.GetCurrent(slot0, "hammerDamageRatio")) * (1 - uv0.GetCurrent(slot1, "hammerDamagePrevent"))) * uv0.GetCurrent(slot1, "repressReduce"))
end

function slot0.CalculateFleetDamage(slot0)
	return slot0 * uv0.SCORE_RATE[1]
end

function slot0.CalculateFleetOverDamage(slot0, slot1)
	if slot1 == slot0:GetFlagShip() then
		return uv0.GetCurrent(slot1, "maxHP") * uv1.SCORE_RATE[2]
	else
		return uv0.GetCurrent(slot1, "maxHP") * uv1.SCORE_RATE[3]
	end
end

function slot0.ReloadTime(slot0, slot1)
	return uv0.CalculateReloadTime(slot0, slot1.loadSpeed)
end

function slot0.CalculateReloadTime(slot0, slot1)
	return slot0 / uv0.K1 / math.sqrt((slot1 + uv0.K2) * uv0.K3)
end

function slot0.CaclulateReloaded(slot0, slot1)
	return math.sqrt((slot1 + uv0.K2) * uv0.K3) * slot0 * uv0.K1
end

function slot0.CaclulateReloadAttr(slot0, slot1)
	slot2 = slot0 / uv0.K1 / slot1

	return slot2 * slot2 / uv0.K3 - uv0.K2
end

function slot0.CaclulateAirAssistReloadMax(slot0)
	for slot5, slot6 in ipairs(slot0) do
		slot1 = 0 + slot6:GetTemplateData().reload_max
	end

	return slot1 / #slot0 * uv0
end

function slot0.CaclulateDOTPlace(slot0, slot1, slot2, slot3)
	slot5 = uv0.DOT_CONFIG[slot1.arg_list.dotType]

	return uv1.IsHappen(slot0 * (uv2.NUM1 + slot2:GetAttrByName(slot5.hit)) * (uv2.NUM1 - slot3:GetAttrByName(slot5.resist)))
end

function slot0.CaclulateDOTDuration(slot0, slot1, slot2)
	slot4 = uv0.DOT_CONFIG[slot0.arg_list.dotType]

	return slot1:GetAttrByName(slot4.prolong) - slot2:GetAttrByName(slot4.shorten)
end

function slot0.CaclulateDOTDamageEnhanceRate(slot0, slot1, slot2)
	slot4 = uv0.DOT_CONFIG[slot0.arg_list.dotType]

	return (slot1:GetAttrByName(slot4.enhance) - slot2:GetAttrByName(slot4.reduce)) * uv1.PERCENT2
end

function slot0.CalcDamageLock()
	return 0, {
		false,
		true,
		false
	}
end

function slot0.CalcDamageLockA2M()
	return 0
end

function slot0.CalcDamageLockS2M()
	return 0
end

function slot0.CalcDamageLockCrush()
	return 0, 0
end

function slot0.UnilateralCrush()
	return 0, 100000
end

function slot0.ChapterRepressReduce(slot0)
	return 1 - slot0 * 0.01
end

function slot0.IsHappen(slot0)
	if slot0 <= 0 then
		return false
	elseif slot0 >= 10000 then
		return true
	else
		return math.random(10000) <= slot0
	end
end

function slot0.WeightRandom(slot0)
	slot4, slot5 = uv0.GenerateWeightList(slot0)

	return uv0.WeightListRandom(slot1, slot2)
end

function slot0.WeightListRandom(slot0, slot1)
	slot2 = math.random(0, slot1)

	for slot6, slot7 in pairs(slot0) do
		if slot6.min <= slot2 and slot2 <= slot6.max then
			return slot7
		end
	end
end

function slot0.GenerateWeightList(slot0)
	slot1 = {}
	slot2 = -1

	for slot6, slot7 in ipairs(slot0) do
		slot11 = nil
		slot12 = {
			min = slot2 + 1,
			max = slot2 + slot7.weight
		}
		slot1[slot12] = slot7.rst
	end

	return slot1, slot2
end

function slot0.IsListHappen(slot0)
	for slot4, slot5 in ipairs(slot0) do
		if uv0.IsHappen(slot5[1]) then
			return true, slot5[2]
		end
	end

	return false, nil
end

function slot0.BulletYAngle(slot0, slot1)
	return math.rad2Deg * math.atan2(slot1.z - slot0.z, slot1.x - slot0.x)
end

function slot0.RandomPosNull(slot0, slot1)
	slot2 = slot0.distance or 10
	slot2 = slot2 * slot2
	slot3 = ys.Battle.BattleTargetChoise.TargetAll()
	slot4, slot5 = nil

	for slot9 = 1, slot1 or 10, 1 do
		slot5 = true

		for slot13, slot14 in pairs(slot3) do
			if Vector3.SqrDistance(uv0.RandomPos(slot0), slot14:GetPosition()) < slot2 then
				slot5 = false

				break
			end
		end

		if slot5 then
			return slot4
		end
	end

	return nil
end

function slot0.RandomPos(slot0)
	if slot0.rangeX or slot0.rangeY or slot0.rangeZ then
		return Vector3((slot0[1] or 0) + uv0.RandomDelta(slot0.rangeX), (slot0[2] or 0) + uv0.RandomDelta(slot0.rangeY), (slot0[3] or 0) + uv0.RandomDelta(slot0.rangeZ))
	else
		return Vector3(slot1 + uv0.RandomPosXYZ(slot0, "X1", "X2"), slot2 + uv0.RandomPosXYZ(slot0, "Y1", "Y2"), slot3 + uv0.RandomPosXYZ(slot0, "Z1", "Z2"))
	end
end

function slot0.RandomPosXYZ(slot0, slot1, slot2)
	slot2 = slot0[slot2]

	if slot0[slot1] and slot2 then
		return math.random(slot1, slot2)
	else
		return 0
	end
end

function slot0.RandomPosCenterRange(slot0)
	return Vector3(uv0.RandomDelta(slot0.rangeX), uv0.RandomDelta(slot0.rangeY), uv0.RandomDelta(slot0.rangeZ))
end

function slot0.RandomDelta(slot0)
	if slot0 and slot0 > 0 then
		return math.random(slot0 + slot0) - slot0
	else
		return 0
	end
end
