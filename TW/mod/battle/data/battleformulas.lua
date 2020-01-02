ys.Battle.BattleFormulas = ys.Battle.BattleFormulas or {}
slot1 = ys.Battle.BattleConst
slot2 = pg.gameset
slot3 = ys.Battle.BattleAttr
slot5 = ys.Battle.BattleConfig.AnitAirRepeaterConfig
slot7 = pg.bfConsts.SECONDs / ys.Battle.BattleConfig.viewFPS * ys.Battle.BattleConfig.BulletSpeedConvertConst
slot8 = pg.bfConsts.SECONDs / ys.Battle.BattleConfig.calcFPS * ys.Battle.BattleConfig.ShipSpeedConvertConst
slot9 = pg.bfConsts.SECONDs / ys.Battle.BattleConfig.viewFPS * ys.Battle.BattleConfig.AircraftSpeedConvertConst
slot10 = ys.Battle.BattleConfig.AIR_ASSIST_RELOAD_RATIO * pg.bfConsts.PERCENT
slot11 = ys.Battle.BattleConfig.DAMAGE_ENHANCE_FROM_SHIP_TYPE
slot12 = ys.Battle.BattleConfig.AMMO_DAMAGE_ENHANCE
slot13 = ys.Battle.BattleConfig.AMMO_DAMAGE_REDUCE
slot14 = ys.Battle.BattleConfig.SHIP_TYPE_ACCURACY_ENHANCE

function ys.Battle.BattleFormulas.GetFleetTotalHP(slot0)
	slot1 = slot0:GetFlagShip()
	slot3 = slot0.NUM0

	for slot7, slot8 in ipairs(slot2) do
		slot3 = (slot8 == slot1 and slot3 + slot1.GetCurrent(slot8, "maxHP") * slot0.HP_CONST) or slot3 + slot1.GetCurrent(slot8, "maxHP")
	end

	return slot3
end

function ys.Battle.BattleFormulas.GetFleetVelocity(slot0)
	if slot0[1] and slot1.NUM0 < slot0.GetCurrent(slot1, "fleetVelocity") then
		return slot2 * slot1.PERCENT
	end

	slot2 = slot1.NUM0
	slot3 = #slot0

	for slot7, slot8 in ipairs(slot0) do
		slot2 = slot2 + slot8:GetAttrByName("velocity")
	end

	return slot2 / slot3 * (slot1.NUM1 - slot1.SPEED_CONST * (slot3 - slot1.NUM1))
end

function ys.Battle.BattleFormulas.GetFleetReload(slot0)
	slot1 = slot0.NUM0

	for slot5, slot6 in ipairs(slot0) do
		slot1 = slot1 + slot6:GetReload()
	end

	return slot1
end

function ys.Battle.BattleFormulas.GetFleetTorpedoPower(slot0)
	slot1 = slot0.NUM0

	for slot5, slot6 in ipairs(slot0) do
		slot1 = slot1 + slot6:GetTorpedoPower()
	end

	return slot1
end

function ys.Battle.BattleFormulas.AttrFixer(slot0, slot1)
	if slot0 == SYSTEM_DUEL or slot0 == SYSTEM_SHAM then
		slot4, slot5 = ys.Battle.BattleDataFunction.GetPlayerUnitDurabilityExtraAddition(slot0, slot2)
		slot1.durability = slot1.durability * slot4 + slot5
	end
end

function ys.Battle.BattleFormulas.HealFixer(slot0, slot1)
	slot2 = 1

	if slot0 == SYSTEM_DUEL or slot0 == SYSTEM_SHAM then
		slot2 = ys.Battle.BattleDataFunction.GetPlayerUnitDurabilityExtraAddition(slot0, slot1.level)
	end

	return slot2
end

function ys.Battle.BattleFormulas.ConvertShipSpeed(slot0)
	return slot0 * slot0
end

function ys.Battle.BattleFormulas.ConvertAircraftSpeed(slot0)
	if slot0 then
		return slot0 * slot0
	else
		return nil
	end
end

function ys.Battle.BattleFormulas.ConvertBulletSpeed(slot0)
	return slot0 * slot0
end

function ys.Battle.BattleFormulas.CalculateDamage(slot0, slot1, slot2)
	slot4 = slot0.NUM0
	slot5 = slot0.NUM10000
	slot6 = slot0.DRATE
	slot7 = slot0.ACCURACY
	slot11 = slot0:GetWeaponTempData().type
	slot12 = slot0.GetWeaponTempData().attack_attribute
	slot13 = slot0:GetWeapon().GetConvertedAtkAttr(slot9)
	slot15 = slot0:GetTemplate().damage_type
	slot2 = slot2 or slot0.NUM1
	slot17 = slot1._attr.armorType
	slot18 = slot0._attr.formulaLevel - slot1._attr.formulaLevel
	slot19 = slot0.NUM1
	slot20 = false
	slot21 = false
	slot22 = slot0.NUM1
	slot23 = slot0:GetCorrectedDMG()

	if slot12 == slot1.WeaponDamageAttr.CANNON then
		slot23 = (slot3 + slot8.cannonPower * slot13) * slot23
		slot2 = slot3 + slot2.GetCurrent(slot1, "injureRatioByCannon") + slot2.GetCurrent(slot0, "damageRatioByCannon")
	elseif slot12 == slot1.WeaponDamageAttr.TORPEDO then
		slot23 = (slot3 + slot8.torpedoPower * slot13) * slot23
		slot2 = slot3 + slot2.GetCurrent(slot1, "injureRatioByBulletTorpedo") + slot2.GetCurrent(slot0, "damageRatioByBulletTorpedo")
	elseif slot12 == slot1.WeaponDamageAttr.ANTI_AIR then
		slot23 = (slot3 + slot8.antiAirPower * slot13) * slot23
	elseif slot12 == slot1.WeaponDamageAttr.AIR then
		slot23 = (slot3 + slot8.airPower * slot13) * slot23
		slot2 = slot2 * slot6[7] / (slot16.antiAirPower + slot6[7]) * (slot3 + slot2.GetCurrent(slot1, "injureRatioByAir") + slot2.GetCurrent(slot0, "damageRatioByAir"))
	elseif slot12 == slot1.WeaponDamageAttr.ANIT_SUB then
		slot23 = (slot3 + slot8.antiSubPower * slot13) * slot23
	end

	slot20 = (slot2.GetCurrent(slot1, "perfectDodge") == 1 and true) or not slot4.IsHappen(math.max(slot6[5], math.min(slot3, (slot7[1] + slot8.attackRating / (slot8.attackRating + slot16.dodgeRate + slot7[2]) + (slot8.luck - slot16.luck + slot18) * slot0.PERCENT1 + slot2.GetCurrent(slot0, slot3[slot1:GetTemplate().type])) - slot2.GetCurrent(slot1, "dodgeRateExtra"))) * slot5)

	if not slot20 then
		slot26 = nil
		slot22 = math.random(slot5.RANDOM_DAMAGE_MIN, slot5.RANDOM_DAMAGE_MAX) + slot23

		if slot4.IsHappen(((slot2.GetCurrent(slot0, "GCT") == 1 and 1) or slot0.DFT_CRIT_RATE + slot8.attackRating / (slot8.attackRating + slot16.dodgeRate + slot6[4]) + (slot24 + slot18) * slot6[3] + slot2.GetCurrent(slot0, "cri")) * slot5) then
			slot21 = true
			slot19 = math.max(1, (slot0.DFT_CRIT_EFFECT + slot2.GetCurrent(slot0, "criDamage")) - slot2.GetCurrent(slot1, "criDamageResist"))
		else
			slot21 = false
		end
	else
		return slot4, {
			isMiss = true,
			isDamagePrevent = false,
			isCri = slot21
		}
	end

	slot28 = slot2.GetCurrent(slot0, "damageEnhanceProjectile")
	slot22 = math.max(slot0.NUM1, math.floor(slot22 * slot2 * (slot9:GetFixAmmo() or slot15[slot17] or slot0.NUM1) * slot19 * (slot0.NUM1 + slot2.GetCurrent(slot0, "damageRatioBullet")) * slot2.GetTagAttr(slot0, slot1) * (slot0.NUM1 + slot2.GetCurrent(slot1, "injureRatio")) * ((slot0.NUM1 + slot2.GetCurrent(slot0, slot6[slot14.ammo_type])) - slot2.GetCurrent(slot1, slot7[slot14.ammo_type])) * (slot0.NUM1 + slot2.GetCurrent(slot1, slot34)) * (slot0.NUM1 + math.min(slot6[1], math.max(-slot6[1], slot18)) * slot6[2])))

	if slot1:GetCurrentOxyState() == slot1.OXY_STATE.DIVE then
		slot22 = math.floor(slot22 * slot14.antisub_enhancement)
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
		slot22 = math.floor(slot22 * (slot0.NUM1 - Mathf.Clamp(Vector3.Distance(slot40, slot41) / slot14.hit_type.range, 0, 1) * slot14.hit_type.rate))
	end

	return slot38 + slot28, slot36, slot14.DMG_font[slot17]
end

function ys.Battle.BattleFormulas.CalculateIgniteDamage(slot0, slot1, slot2)
	return slot0:GetWeapon().GetCorrectedDMG(slot4) * (1 + slot0._attr[slot1] * slot0.PERCENT) * slot2
end

function ys.Battle.BattleFormulas.WeaponDamagePreCorrection(slot0, slot1)
	return (slot1 or slot0:GetTemplateData().damage) * slot0:GetPotential() * slot0.GetTemplateData().corrected * slot0.PERCENT
end

function ys.Battle.BattleFormulas.WeaponAtkAttrPreRatio(slot0)
	return slot0:GetTemplateData().attack_attribute_ratio * slot0.PERCENT2
end

function ys.Battle.BattleFormulas.GetMeteoDamageRatio(slot0)
	slot1 = {}
	slot3 = slot0.METEO_RATE[1]

	if slot0.METEO_RATE[2] <= slot0 then
		for slot7 = 1, slot0 + 1, 1 do
			slot1[slot7] = slot3
		end

		return slot1
	else
		slot4 = 1 - slot3 * slot0

		for slot8 = 1, slot0, 1 do
			slot1[slot8] = math.random() * slot4 * (slot2[3] + (slot2[4] * (slot8 - 1)) / slot0) + slot3
			slot4 = math.max(0, slot4 - math.random() * slot4 * (slot2[3] + (slot2[4] * (slot8 - 1)) / slot0))
		end

		slot1[slot0 + 1] = slot4

		return slot1
	end
end

function ys.Battle.BattleFormulas.CalculateFleetAntiAirTotalDamage(slot0)
	slot2 = 0

	for slot6, slot7 in pairs(slot1) do
		slot8 = slot0.GetCurrent(slot6, "antiAirPower")

		for slot12, slot13 in ipairs(slot7) do
			slot2 = slot2 + math.max(1, (slot8 * slot13:GetConvertedAtkAttr() + 1) * slot13:GetCorrectedDMG())
		end
	end

	return slot2
end

function ys.Battle.BattleFormulas.CalculateRepaterAnitiAirTotalDamage(slot0)
	return math.max(1, (slot0.GetCurrent(slot1, "antiAirPower") * slot0:GetConvertedAtkAttr() + 1) * slot0:GetCorrectedDMG())
end

function ys.Battle.BattleFormulas.RollRepeaterHitDice(slot0, slot1)
	slot2 = slot0:GetHost()
	slot4 = slot0.GetCurrent(slot2, "attackRating")

	return slot2.IsHappen(math.min(slot6, (slot0.GetCurrent(slot1, "airPower") / slot1.const_A + slot1.const_B) / (slot0.GetCurrent(slot2, "antiAirPower") * slot0.GetCurrent(slot1, "dodge") + slot0.GetCurrent(slot1, "airPower") / slot1.const_A + slot1.const_B + slot1.const_C)) * slot3.NUM10000)
end

function ys.Battle.BattleFormulas.AntiAirPowerWeight(slot0)
	return slot0 * slot0
end

function ys.Battle.BattleFormulas.CalculateDamageFromAircraftToMainShip(slot0, slot1)
	return math.floor(math.max(slot1.PLANE_LEAK_RATE[1], math.floor((slot0:GetCurrent("crashDMG") * (slot1.PLANE_LEAK_RATE[2] + slot0:GetCurrent("airPower") * slot1.PLANE_LEAK_RATE[3]) + slot0:GetCurrent("formulaLevel") * slot1.PLANE_LEAK_RATE[4]) * (slot0:GetHPRate() * slot1.PLANE_LEAK_RATE[5] + slot1.PLANE_LEAK_RATE[6]) * (slot1.PLANE_LEAK_RATE[7] + (slot0.GetCurrent("formulaLevel") - slot0.GetCurrent(slot1, "formulaLevel")) * slot1.PLANE_LEAK_RATE[8]) * slot1.PLANE_LEAK_RATE[9] / (slot0.GetCurrent(slot1, "antiAirPower") + slot1.PLANE_LEAK_RATE[10]) * (slot1.PLANE_LEAK_RATE[11] + slot0.GetCurrent(slot1, "injureRatio")) * (slot1.PLANE_LEAK_RATE[12] + slot0.GetCurrent(slot1, "injureRatioByAir")))) * slot0.GetCurrent(slot1, "repressReduce"))
end

function ys.Battle.BattleFormulas.CalculateDamageFromShipToMainShip(slot0, slot1)
	return math.floor(math.max(slot1.LEAK_RATE[1], math.floor(((slot0:GetCurrent("cannonPower") + slot0:GetCurrent("torpedoPower")) * slot1.LEAK_RATE[2] + slot0:GetCurrent("formulaLevel") * slot1.LEAK_RATE[7]) * (slot1.LEAK_RATE[5] + slot0.GetCurrent(slot1, "injureRatio")) * (slot0:GetHPRate() * slot1.LEAK_RATE[3] + slot1.LEAK_RATE[4]) * (slot1.LEAK_RATE[5] + (slot0.GetCurrent("formulaLevel") - slot0.GetCurrent(slot1, "formulaLevel")) * slot1.LEAK_RATE[6]))) * slot0.GetCurrent(slot1, "repressReduce"))
end

function ys.Battle.BattleFormulas.CalculateDamageFromSubmarinToMainShip(slot0, slot1)
	return math.max(slot1.SUBMARINE_KAMIKAZE[1], math.floor((slot0:GetCurrent("torpedoPower") * slot1.SUBMARINE_KAMIKAZE[2] + slot0:GetCurrent("formulaLevel") * slot1.SUBMARINE_KAMIKAZE[3]) * (slot1.SUBMARINE_KAMIKAZE[4] + slot0.GetCurrent(slot1, "injureRatio")) * (slot0:GetHPRate() * slot1.SUBMARINE_KAMIKAZE[5] + slot1.SUBMARINE_KAMIKAZE[6]) * (slot1.SUBMARINE_KAMIKAZE[7] + (slot0.GetCurrent("formulaLevel") - slot0.GetCurrent(slot1, "formulaLevel")) * slot1.SUBMARINE_KAMIKAZE[8])))
end

function ys.Battle.BattleFormulas.RollSubmarineDualDice(slot0)
	slot1 = slot0:GetCurrent("dodgeRate")

	return slot2.IsHappen(slot1 / (slot1 + slot1.MONSTER_SUB_KAMIKAZE_DUAL_K) * slot1.MONSTER_SUB_KAMIKAZE_DUAL_P * slot3.NUM10000)
end

function ys.Battle.BattleFormulas.CalculateCrashDamage(slot0, slot1)
	return math.floor(math.floor(math.min(slot4, slot10) * (1 + slot0.GetCurrent(slot1, "hammerDamageRatio")) * (1 - slot0:GetCurrent("hammerDamagePrevent"))) * slot0:GetCurrent("repressReduce")), math.floor(math.floor(math.min(slot5, slot10) * (1 + slot0:GetCurrent("hammerDamageRatio")) * (1 - slot0.GetCurrent(slot1, "hammerDamagePrevent"))) * slot0.GetCurrent(slot1, "repressReduce"))
end

function ys.Battle.BattleFormulas.CalculateFleetDamage(slot0)
	return slot0 * slot0.SCORE_RATE[1]
end

function ys.Battle.BattleFormulas.CalculateFleetOverDamage(slot0, slot1)
	if slot1 == slot0:GetFlagShip() then
		return slot0.GetCurrent(slot1, "maxHP") * slot1.SCORE_RATE[2]
	else
		return slot0.GetCurrent(slot1, "maxHP") * slot1.SCORE_RATE[3]
	end
end

function ys.Battle.BattleFormulas.ReloadTime(slot0, slot1)
	return slot0:CalculateReloadTime(slot1.loadSpeed)
end

function ys.Battle.BattleFormulas.CalculateReloadTime(slot0, slot1)
	return slot0 / slot0.K1 / math.sqrt((slot1 + slot0.K2) * slot0.K3)
end

function ys.Battle.BattleFormulas.CaclulateReloaded(slot0, slot1)
	return math.sqrt((slot1 + slot0.K2) * slot0.K3) * slot0 * slot0.K1
end

function ys.Battle.BattleFormulas.CaclulateReloadAttr(slot0, slot1)
	return (slot0 / slot0.K1 / slot1 * ) / slot0.K3 - slot0.K2
end

function ys.Battle.BattleFormulas.CaclulateAirAssistReloadMax(slot0)
	slot1 = 0

	for slot5, slot6 in ipairs(slot0) do
		slot1 = slot1 + slot6:GetTemplateData().reload_max
	end

	return slot1 / #slot0 * slot0
end

function ys.Battle.BattleFormulas.CaclulateDOTPlace(slot0, slot1, slot2, slot3)
	return slot1.IsHappen(slot0 * (slot2.NUM1 + slot2:GetAttrByName(slot0.DOT_CONFIG[slot1.arg_list.dotType].hit)) * (slot2.NUM1 - slot3:GetAttrByName(slot0.DOT_CONFIG[slot1.arg_list.dotType].resist)))
end

function ys.Battle.BattleFormulas.CaclulateDOTDuration(slot0, slot1, slot2)
	return slot1:GetAttrByName(slot0.DOT_CONFIG[slot0.arg_list.dotType].prolong) - slot2:GetAttrByName(slot0.DOT_CONFIG[slot0.arg_list.dotType].shorten)
end

function ys.Battle.BattleFormulas.CaclulateDOTDamageEnhanceRate(slot0, slot1, slot2)
	return (slot1:GetAttrByName(slot0.DOT_CONFIG[slot0.arg_list.dotType].enhance) - slot2:GetAttrByName(slot0.DOT_CONFIG[slot0.arg_list.dotType].reduce)) * slot1.PERCENT2
end

function ys.Battle.BattleFormulas.CalcDamageLock()
	return 0, {
		false,
		true,
		false
	}
end

function ys.Battle.BattleFormulas.CalcDamageLockA2M()
	return 0
end

function ys.Battle.BattleFormulas.CalcDamageLockS2M()
	return 0
end

function ys.Battle.BattleFormulas.CalcDamageLockCrush()
	return 0, 0
end

function ys.Battle.BattleFormulas.UnilateralCrush()
	return 0, 100000
end

function ys.Battle.BattleFormulas.ChapterRepressReduce(slot0)
	return 1 - slot0 * 0.01
end

function ys.Battle.BattleFormulas.IsHappen(slot0)
	if slot0 <= 0 then
		return false
	elseif slot0 >= 10000 then
		return true
	else
		return math.random(10000) <= slot0
	end
end

function ys.Battle.BattleFormulas.WeightRandom(slot0)
	slot4, slot5 = slot0:GenerateWeightList()

	return slot0.WeightListRandom(slot1, slot2)
end

function ys.Battle.BattleFormulas.WeightListRandom(slot0, slot1)
	slot2 = math.random(0, slot1)

	for slot6, slot7 in pairs(slot0) do
		slot9 = slot6.max

		if slot6.min <= slot2 and slot2 <= slot9 then
			return slot7
		end
	end
end

function ys.Battle.BattleFormulas.GenerateWeightList(slot0)
	slot1 = {}
	slot2 = -1

	for slot6, slot7 in ipairs(slot0) do
		slot11 = nil
		slot12 = {
			min = slot2 + 1,
			max = slot2 + slot7.weight,
			[slot12] = slot7.rst
		}
	end

	return slot1, slot2
end

function ys.Battle.BattleFormulas.IsListHappen(slot0)
	for slot4, slot5 in ipairs(slot0) do
		if slot0.IsHappen(slot5[1]) then
			return true, slot5[2]
		end
	end

	return false, nil
end

function ys.Battle.BattleFormulas.BulletYAngle(slot0, slot1)
	return math.rad2Deg * math.atan2(slot1.z - slot0.z, slot1.x - slot0.x)
end

function ys.Battle.BattleFormulas.RandomPosNull(slot0, slot1)
	slot1 = slot1 or 10
	slot2 = slot0.distance or 10
	slot2 = slot2 * slot2
	slot3 = ys.Battle.BattleTargetChoise.TargetAll()
	slot4, slot5 = nil

	for slot9 = 1, slot1, 1 do
		slot5 = true
		slot4 = slot0:RandomPos()

		for slot13, slot14 in pairs(slot3) do
			if Vector3.SqrDistance(slot4, slot14:GetPosition()) < slot2 then
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

function ys.Battle.BattleFormulas.RandomPos(slot0)
	slot1 = slot0[1] or 0
	slot2 = slot0[2] or 0
	slot3 = slot0[3] or 0

	if slot0.rangeX or slot0.rangeY or slot0.rangeZ then
		return Vector3(slot1 + slot0.RandomDelta(slot0.rangeX), slot2 + slot0.RandomDelta(slot0.rangeY), slot3 + slot0.RandomDelta(slot0.rangeZ))
	else
		return Vector3(slot1 + slot0:RandomPosXYZ("X1", "X2"), slot2 + slot0:RandomPosXYZ("Y1", "Y2"), slot3 + slot0:RandomPosXYZ("Z1", "Z2"))
	end
end

function ys.Battle.BattleFormulas.RandomPosXYZ(slot0, slot1, slot2)
	slot2 = slot0[slot2]

	if slot0[slot1] and slot2 then
		return math.random(slot1, slot2)
	else
		return 0
	end
end

function ys.Battle.BattleFormulas.RandomPosCenterRange(slot0)
	return Vector3(slot0.RandomDelta(slot0.rangeX), slot0.RandomDelta(slot0.rangeY), slot0.RandomDelta(slot0.rangeZ))
end

function ys.Battle.BattleFormulas.RandomDelta(slot0)
	if slot0 and slot0 > 0 then
		return math.random(slot0 + slot0) - slot0
	else
		return 0
	end
end

return
