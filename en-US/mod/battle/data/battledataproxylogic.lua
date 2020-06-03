slot0 = ys.Battle.BattleDataProxy
slot1 = ys.Battle.BattleEvent
slot2 = ys.Battle.BattleFormulas
slot3 = ys.Battle.BattleConst
slot4 = ys.Battle.BattleConfig
slot5 = ys.Battle.BattleDataFunction
slot6 = ys.Battle.BattleAttr
slot7 = ys.Battle.BattleVariable

function slot0.SetupCalculateDamage(slot0, slot1)
	slot0._calculateDamage = slot1 or uv0.CalculateDamage
end

function slot0.SetupDamageKamikazeAir(slot0, slot1)
	slot0._calculateDamageKamikazeAir = slot1 or uv0.CalculateDamageFromAircraftToMainShip
end

function slot0.SetupDamageKamikazeShip(slot0, slot1)
	slot0._calculateDamageKamikazeShip = slot1 or uv0.CalculateDamageFromShipToMainShip
end

function slot0.SetupDamageCrush(slot0, slot1)
	slot0._calculateDamageCrush = slot1 or uv0.CalculateCrashDamage
end

function slot0.ClearFormulas(slot0)
	slot0._calculateDamage = nil
	slot0._calculateDamageKamikazeAir = nil
	slot0._calculateDamageKamikazeShip = nil
	slot0._calculateDamageCrush = nil
end

function slot0.HandleBulletHit(slot0, slot1, slot2)
	if not slot2 then
		return false
	elseif not slot1 then
		return false
	end

	if uv0.IsSpirit(slot2) then
		return false
	end

	if slot1:IsCollided(slot2:GetUniqueID()) == true then
		return
	end

	slot1:Hit(slot2:GetUniqueID(), slot2:GetUnitType())
	slot1:BuffTrigger(ys.Battle.BattleConst.BuffEffectType.ON_BULLET_COLLIDE, {
		_bullet = slot1,
		equipIndex = slot1:GetWeapon():GetEquipmentIndex()
	})

	if slot2:GetUnitType() == uv1.UnitType.PLAYER_UNIT and slot2:GetIFF() == uv2.FRIENDLY_CODE then
		ys.Battle.BattleCameraUtil.GetInstance():StartShake(pg.shake_template[uv1.ShakeType.HIT])
	end

	return true
end

function slot0.HandleDamage(slot0, slot1, slot2, slot3)
	if slot2:GetIFF() == uv0.FOE_CODE and slot2:IsShowHPBar() then
		slot0:DispatchEvent(ys.Event.New(uv1.HIT_ENEMY, slot2))
	end

	slot6 = slot1:GetWeaponHostAttr()

	slot2:TriggerBuff(uv2.BuffEffectType.ON_BULLET_HIT_BEFORE, {
		weaponType = slot1:GetWeapon():GetTemplateData().attack_attribute,
		bulletType = slot1:GetType()
	})

	if uv3.IsInvincible(slot2) then
		return
	end

	slot9, slot10, slot11 = slot0._calculateDamage(slot1, slot2, slot3)
	slot12 = slot10.isMiss
	slot13 = slot10.isCri
	slot14 = slot10.damageAttr

	slot1:AppendDamageUnit(slot2:GetUniqueID())

	slot17 = {
		target = slot2,
		damage = slot9,
		weaponType = slot7.type,
		equipIndex = slot5:GetEquipmentIndex()
	}

	if slot10.isDamagePrevent then
		slot2:TriggerBuff(uv2.BuffEffectType.ON_DAMAGE_PREVENT, {})
	end

	slot2:UpdateHP(slot9 * -1, {
		isHeal = false,
		isMiss = slot12,
		isCri = slot13,
		attr = slot14
	}, slot1:GetPosition(), slot11)
	slot0:DamageStatistics(slot6.id, slot2:GetAttrByName("id"), slot9)

	if not slot12 and slot1:GetWeaponTempData().type ~= uv2.EquipmentType.ANTI_AIR then
		slot1:BuffTrigger(ys.Battle.BattleConst.BuffEffectType.ON_BULLET_HIT, slot17)
	end

	slot20 = true

	if slot2:GetUnitType() ~= uv2.UnitType.AIRCRAFT_UNIT and slot19 ~= uv2.UnitType.AIRFIGHTER_UNIT and slot19 ~= uv2.UnitType.FUNNEL_UNIT and slot19 ~= uv2.UnitType.UAV_UNIT then
		slot20 = false
	end

	if slot2:IsAlive() then
		if not slot20 then
			for slot24, slot25 in ipairs(slot1:GetAttachBuff()) do
				if slot25.hit_ignore or not slot12 then
					uv4.HandleBuffPlacer(slot25, slot1, slot2)
				end
			end
		end

		if not slot12 then
			slot2:TriggerBuff(uv2.BuffEffectType.ON_BE_HIT, slot8)
		end
	else
		slot1:BuffTrigger(ys.Battle.BattleConst.BuffEffectType.ON_BULLET_KILL, slot17)
		slot0:obituary(slot2, slot20, slot1)
		slot0:KillCountStatistics(slot6.id, slot2:GetAttrByName("id"))
	end

	return slot12, slot13
end

function slot0.HandleMeteoDamage(slot0, slot1, slot2)
	for slot7, slot8 in ipairs(slot2) do
		slot0:HandleDamage(slot1, slot8, uv0.GetMeteoDamageRatio(#slot2)[slot7])
	end
end

function slot0.HandleDirectDamage(slot0, slot1, slot2, slot3, slot4)
	slot6 = slot1:GetAttrByName("id")

	slot1:UpdateHP(slot2 * -1, {
		isMiss = false,
		isCri = false,
		isHeal = false,
		damageReason = slot4
	})

	slot7 = slot1:IsAlive()

	if slot3 then
		slot0:DamageStatistics(slot3:GetAttrByName("id"), slot6, slot2)

		if not slot7 then
			slot0:KillCountStatistics(slot8, slot6)
		end
	end

	if not slot7 then
		slot9 = true

		if slot1:GetUnitType() ~= uv0.UnitType.AIRCRAFT_UNIT and slot8 ~= uv0.UnitType.AIRFIGHTER_UNIT and slot8 ~= uv0.UnitType.FUNNEL_UNIT and slot8 ~= uv0.UnitType.UAV_UNIT then
			slot9 = false
		end

		slot0:obituary(slot1, slot9, slot3)
	end
end

function slot0.obituary(slot0, slot1, slot2, slot3)
	for slot7, slot8 in pairs(slot0._unitList) do
		if slot8 ~= slot1 then
			if slot8:GetIFF() == slot1:GetIFF() then
				if slot2 then
					slot8:TriggerBuff(uv0.BuffEffectType.ON_FRIENDLY_AIRCRAFT_DYING, {
						unit = slot1,
						killer = slot3
					})
				else
					slot8:TriggerBuff(uv0.BuffEffectType.ON_FRIENDLY_SHIP_DYING, {
						unit = slot1,
						killer = slot3
					})
				end
			elseif slot2 then
				slot8:TriggerBuff(uv0.BuffEffectType.ON_FOE_AIRCRAFT_DYING, {
					unit = slot1,
					killer = slot3
				})
			else
				slot8:TriggerBuff(uv0.BuffEffectType.ON_FOE_DYING, {
					unit = slot1,
					killer = slot3
				})
			end
		end
	end
end

function slot0.HandleAircraftMissDamage(slot0, slot1, slot2)
	if slot2 == nil then
		return
	end

	slot4 = {}

	for slot8, slot9 in ipairs(slot2:GetMainList()) do
		if uv0.GetCurrent(slot9, "immuneDirectHit") ~= 1 then
			slot4[#slot4 + 1] = slot9
		end
	end

	if #slot4 > 0 then
		slot6 = slot4[math.random(#slot4)]

		slot6:TriggerBuff(uv1.BuffEffectType.ON_BE_HIT, {})
		slot0:HandleDirectDamage(slot6, slot0._calculateDamageKamikazeAir(slot1, slot6), slot1)
	end
end

function slot0.HandleShipMissDamage(slot0, slot1, slot2)
	if slot2 == nil then
		return
	end

	slot4 = {}

	for slot8, slot9 in ipairs(slot2:GetMainList()) do
		if uv0.GetCurrent(slot9, "immuneDirectHit") ~= 1 then
			slot4[#slot4 + 1] = slot9
		end
	end

	if #slot4 > 0 then
		slot6 = slot4[math.random(#slot4)]

		if table.contains(TeamType.SubShipType, slot1:GetTemplate().type) then
			slot6:TriggerBuff(uv2.BuffEffectType.ON_BE_HIT, {})
			slot0:HandleDirectDamage(slot6, uv1.CalculateDamageFromSubmarinToMainShip(slot1, slot6), slot1)

			if slot6:IsAlive() and uv1.RollSubmarineDualDice(slot1) then
				slot6:TriggerBuff(uv2.BuffEffectType.ON_BE_HIT, {})
				slot0:HandleDirectDamage(slot6, uv1.CalculateDamageFromSubmarinToMainShip(slot1, slot6), slot1)
			end
		else
			slot6:TriggerBuff(uv2.BuffEffectType.ON_BE_HIT, {})
			slot0:HandleDirectDamage(slot6, slot0._calculateDamageKamikazeShip(slot1, slot6), slot1)
		end
	end
end

function slot0.HandleCrashDamage(slot0, slot1, slot2)
	slot3, slot4 = slot0._calculateDamageCrush(slot1, slot2)

	slot0:HandleDirectDamage(slot1, slot3, slot2, uv0.UnitDeathReason.CRUSH)
	slot0:HandleDirectDamage(slot2, slot4, slot1, uv0.UnitDeathReason.CRUSH)
end

function slot0.HandleWallHitByBullet(slot0, slot1, slot2)
	return slot1:GetCldFunc()(slot2)
end

function slot0.HandleBuffPlacer(slot0, slot1, slot2)
	slot5 = false

	if uv0.GetBuffTemplate(slot0.buff_id).effect_list[1].type == "BattleBuffDOT" then
		if uv1.CaclulateDOTPlace(slot0.rant, slot4[1], slot1, slot2) then
			slot5 = true
		end
	elseif uv1.IsHappen(slot0.rant or 10000) then
		slot5 = true
	end

	if slot5 then
		slot6 = ys.Battle.BattleBuffUnit.New(slot0.buff_id, nil, slot1)

		slot6:SetOrb(slot1, slot0.level)
		slot2:AddBuff(slot6)
	end
end

function slot0.HandleDOTPlace(slot0, slot1, slot2)
	slot3 = slot0.arg_list
	slot4 = uv0.DOT_CONFIG[slot3.dotType]
	slot5 = slot1:GetAttrByName(slot4.hit)

	if uv1.IsHappen(slot3.ACC + slot1:GetAttrByName(slot4.hit) - slot2:GetAttrByName(slot4.resist)) then
		return true
	end

	return false
end

function slot0.HandleShipCrashDamageList(slot0, slot1, slot2)
	for slot7, slot8 in pairs(slot1:GetHostileCldList()) do
		if not table.contains(slot2, slot7) then
			slot1:RemoveHostileCld(slot7)
		end
	end

	for slot7, slot8 in ipairs(slot2) do
		if slot3[slot8] == nil then
			slot9 = nil

			function slot9()
				uv0:HandleCrashDamage(uv0._unitList[uv1], uv2)
			end

			slot1:AppendHostileCld(slot8, pg.TimeMgr.GetInstance():AddBattleTimer("shipCld", nil, uv0.SHIP_CLD_INTERVAL, slot9, true))
			slot9()

			if not slot1:IsAlive() then
				break
			end
		end
	end
end

function slot0.HandleShipCrashDecelerate(slot0, slot1, slot2)
	if slot2 == 0 and slot1:IsCrash() then
		slot1:SetCrash(false)
	elseif slot2 > 0 and not slot1:IsCrash() then
		slot1:SetCrash(true)
	end
end
