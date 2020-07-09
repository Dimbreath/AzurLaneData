ys = ys or {}
slot0 = {}
ys.Battle.BattleAttr = slot0
slot1 = ys.Battle.BattleConst
slot0.AttrListInheritance = {
	"level",
	"srcShipType",
	"formulaLevel",
	"repressReduce",
	"cannonPower",
	"torpedoPower",
	"antiAirPower",
	"airPower",
	"antiSubPower",
	"loadSpeed",
	"attackRating",
	"dodgeRate",
	"velocity",
	"luck",
	"cri",
	"criDamage",
	"criDamageResist",
	"hiveExtraHP",
	"bulletSpeedRatio",
	"torpedoSpeedExtra",
	"damageRatioBullet",
	"damageEnhanceProjectile",
	"healingEnhancement",
	"injureRatio",
	"injureRatioByCannon",
	"injureRatioByBulletTorpedo",
	"injureRatioByAir",
	"damageRatioByCannon",
	"damageRatioByBulletTorpedo",
	"damageRatioByAir",
	"damagePreventRantTorpedo",
	"accuracyRateExtra",
	"dodgeRateExtra",
	"perfectDodge",
	"immuneDirectHit",
	"chargeBulletAccuracy",
	"dropBombAccuracy",
	"aircraftBooster",
	"manualEnhancement",
	"initialEnhancement"
}

function slot0.InsertInheritedAttr(slot0)
	for slot4, slot5 in pairs(slot0) do
		uv0.AttrListInheritance[#uv0.AttrListInheritance + 1] = slot5
	end
end

slot0.InsertInheritedAttr(ys.Battle.BattleConfig.AMMO_DAMAGE_ENHANCE)
slot0.InsertInheritedAttr(ys.Battle.BattleConfig.AMMO_DAMAGE_REDUCE)
slot0.InsertInheritedAttr(ys.Battle.BattleConfig.AGAINST_ARMOR_ENHANCE)
slot0.InsertInheritedAttr(ys.Battle.BattleConfig.SHIP_TYPE_ACCURACY_ENHANCE)

slot0.TAG_EHC_KEY = "DMG_TAG_EHC_"
slot0.FROM_TAG_EHC_KEY = "DMG_FROM_TAG_"

function slot0.SetAttr(slot0, slot1)
	slot0._attr = setmetatable({}, {
		__index = slot1
	})
end

function slot0.GetAttr(slot0)
	return slot0._attr
end

function slot0.SetBaseAttr(slot0)
	slot0._baseAttr = Clone(slot0._attr)
end

function slot0.IsInvincible(slot0)
	return slot0._attr.isInvincible and slot1 > 0
end

function slot0.Whosyourdaddy(slot0)
	slot0._attr.isInvincible = (slot0._attr.isInvincible or 0) + 1
end

function slot0.Imyourson(slot0)
	slot0._attr.isInvincible = (slot0._attr.isInvincible or 0) - 1
end

function slot0.AddImmuneAreaLimit(slot0, slot1)
	slot2 = (slot0._attr.immuneAreaLimit or 0) + slot1
	slot0._attr.immuneAreaLimit = slot2

	slot0._move:ImmuneAreaLimit(slot2 > 0)
end

function slot0.AddImmuneMaxAreaLimit(slot0, slot1)
	slot2 = (slot0._attr.immuneMaxAreaLimit or 0) + slot1
	slot0._attr.immuneMaxAreaLimit = slot2

	slot0._move:ImmuneMaxAreaLimit(slot2 > 0)
end

function slot0.IsImmuneAreaLimit(slot0)
	return slot0._attr.immuneAreaLimit and slot1 > 0
end

function slot0.IsImmuneMaxAreaLimit(slot0)
	return slot0._attr.immuneMaxAreaLimit and slot1 > 0
end

function slot0.IsVisitable(slot0)
	return not slot0._attr.isUnVisitable or slot1 <= 0
end

function slot0.UnVisitable(slot0)
	slot0._attr.isUnVisitable = (slot0._attr.isUnVisitable or 0) + 1
end

function slot0.Visitable(slot0)
	slot0._attr.isUnVisitable = (slot0._attr.isUnVisitable or 0) - 1
end

function slot0.IsSpirit(slot0)
	return slot0._attr.isSpirit and slot1 > 0
end

function slot0.Spirit(slot0)
	slot0._attr.isSpirit = (slot0._attr.isSpirit or 0) + 1
end

function slot0.Entity(slot0)
	slot0._attr.isSpirit = (slot0._attr.isSpirit or 0) - 1
end

function slot0.IsStun(slot0)
	return slot0._attr.isStun and slot1 > 0
end

function slot0.Stun(slot0)
	slot0._attr.isStun = (slot0._attr.isStun or 0) + 1
end

function slot0.CancelStun(slot0)
	slot0._attr.isStun = (slot0._attr.isStun or 0) - 1
end

function slot0.SetPlayerAttrFromOutBattle(slot0, slot1)
	slot2 = slot0._attr or {}
	slot0._attr = slot2
	slot2.id = slot1.id
	slot2.battleUID = slot0:GetUniqueID()
	slot2.level = slot1.level
	slot2.formulaLevel = slot1.level
	slot2.maxHP = slot1.durability
	slot2.cannonPower = slot1.cannon
	slot2.torpedoPower = slot1.torpedo
	slot2.antiAirPower = slot1.antiaircraft
	slot2.antiSubPower = slot1.antisub
	slot2.airPower = slot1.air
	slot2.loadSpeed = slot1.reload
	slot2.armorType = slot1.armorType
	slot2.attackRating = slot1.hit
	slot2.dodgeRate = slot1.dodge
	slot2.velocity = ys.Battle.BattleFormulas.ConvertShipSpeed(slot1.speed)
	slot2.luck = slot1.luck
	slot2.repressReduce = slot0:GetRepressReduce()
	slot2.oxyMax = slot1.oxy_max
	slot2.oxyCost = slot1.oxy_cost
	slot2.oxyRecovery = slot1.oxy_recovery
	slot2.oxyRecoveryBench = slot1.oxy_recovery_bench
	slot2.oxyAtkDuration = slot1.attack_duration
	slot2.raidDist = slot1.raid_distance
	slot2.sonarRange = slot1.sonarRange or 0
	slot2.sonarInterval = slot1.sonarInterval or 0
	slot2.sonarDuration = slot1.sonarDuration or 0
	slot2.comboTag = "combo_" .. slot2.battleUID
	slot2.labelTag = {}

	uv0.SetBaseAttr(slot0)
end

function slot0.InitDOTAttr(slot0, slot1)
	slot2 = ys.Battle.BattleConfig.DOT_CONFIG_DEFAULT

	for slot7, slot8 in ipairs(ys.Battle.BattleConfig.DOT_CONFIG) do
		for slot12, slot13 in pairs(slot8) do
			if slot12 == "hit" then
				slot0[slot13] = slot1[slot13] or slot2[slot12]
			else
				slot0[slot13] = slot2[slot12]
			end
		end
	end
end

function slot0.SetEnemyAttr(slot0, slot1)
	slot2 = slot0._tmpData
	slot3 = slot0:GetLevel()
	slot4 = slot0._attr or {}
	slot0._attr = slot4
	slot4.battleUID = slot0:GetUniqueID()
	slot4.level = slot3
	slot4.formulaLevel = math.max(1, slot3 - (slot1 or 0))
	slot5 = (slot3 - 1) / 1000
	slot4.maxHP = slot2.durability + slot2.durability_growth * slot5
	slot4.cannonPower = slot2.cannon + slot2.cannon_growth * slot5
	slot4.torpedoPower = slot2.torpedo + slot2.torpedo_growth * slot5
	slot4.antiAirPower = slot2.antiaircraft + slot2.antiaircraft_growth * slot5
	slot4.airPower = slot2.air + slot2.air_growth * slot5
	slot4.antiSubPower = slot2.antisub + slot2.antisub_growth * slot5
	slot4.loadSpeed = slot2.reload + slot2.reload_growth * slot5
	slot4.armorType = slot2.armor_type
	slot4.attackRating = slot2.hit + slot2.hit_growth * slot5
	slot4.dodgeRate = slot2.dodge + slot2.dodge_growth * slot5
	slot4.velocity = ys.Battle.BattleFormulas.ConvertShipSpeed(slot2.speed + slot2.speed_growth * slot5)
	slot4.luck = slot2.luck + slot2.luck_growth * slot5
	slot4.bulletSpeedRatio = 0
	slot4.id = "enemy_" .. tostring(slot2.id)
	slot4.repressReduce = 1
	slot4.comboTag = "combo_" .. slot4.battleUID
	slot4.labelTag = {}

	uv0.SetBaseAttr(slot0)
end

function slot0.SetAircraftAttFromMother(slot0, slot1)
	slot2 = slot0._attr or {}
	slot0._attr = slot2
	slot2.battleUID = slot0:GetUniqueID()
	slot2.hostUID = slot1:GetUniqueID()

	if type(slot1._attr.id) == "number" then
		slot2.id = slot1._attr.id
	end

	slot3 = uv0.GetAttr(slot1)

	for slot7, slot8 in ipairs(uv0.AttrListInheritance) do
		slot2[slot8] = slot3[slot8]
	end

	for slot7, slot8 in pairs(slot3) do
		if string.find(slot7, uv0.TAG_EHC_KEY) then
			slot2[slot7] = slot8
		end
	end

	slot2.armorType = 0
	slot2.labelTag = setmetatable({}, {
		__index = slot1._attr.labelTag
	})
	slot2.comboTag = "combo_" .. slot2.hostUID
end

function slot0.SetAircraftAttFromTemp(slot0)
	slot0._attr = slot0._attr or {}
	slot0._attr.velocity = slot0._attr.velocity or ys.Battle.BattleFormulas.ConvertAircraftSpeed(slot0._tmpData.speed)
	slot0._attr.maxHP = slot0._attr.maxHP or slot0._tmpData.max_hp + slot0._tmpData.hp_growth / 1000 * ((slot0._attr.level or 1) - 1) + uv0.GetCurrent(slot0, "hiveExtraHP")
	slot0._attr.crashDMG = slot0._tmpData.crash_DMG
	slot0._attr.dodge = slot0._tmpData.dodge
	slot0._attr.dodgeLimit = slot0._tmpData.dodge_limit
end

function ys.Battle.BattleAttr.SetAirFighterAttr(slot0, slot1)
	slot2 = slot0._attr or {}
	slot0._attr = slot2
	slot3 = ys.Battle.BattleDataProxy.GetInstance()
	slot4 = slot3:GetDungeonLevel()
	slot2.battleUID = slot0:GetUniqueID()
	slot2.hostUID = 0
	slot2.id = 0
	slot2.level = slot4
	slot2.formulaLevel = slot4

	if slot3:IsCompletelyRepress() then
		slot2.formulaLevel = math.max(slot2.formulaLevel - 10, 1)
	end

	slot5 = (slot4 - 1) / 1000
	slot2.maxHP = math.floor(slot1.max_hp + slot1.hp_growth * slot5)
	slot2.attackRating = slot1.accuracy + slot1.ACC_growth * slot5
	slot6 = slot1.attack_power + slot1.AP_growth * slot5
	slot2.dodge = slot1.dodge
	slot2.dodgeLimit = slot1.dodge_limit
	slot2.cannonPower = slot6
	slot2.torpedoPower = slot6
	slot2.antiAirPower = slot6
	slot2.antiSubPower = slot6
	slot2.airPower = slot6
	slot2.loadSpeed = 0
	slot2.armorType = 1
	slot2.dodgeRate = 0
	slot2.luck = 50
	slot2.velocity = ys.Battle.BattleFormulas.ConvertAircraftSpeed(slot1.speed)
	slot2.repressReduce = 1
	slot2.crashDMG = slot1.crash_DMG
end

function slot0.FlashByBuff(slot0, slot1, slot2)
	slot0._attr[slot1] = slot2 + (slot0._baseAttr[slot1] or 0)

	if string.find(slot1, uv0.FROM_TAG_EHC_KEY) then
		slot3 = 0

		for slot7, slot8 in pairs(slot0._attr) do
			if string.find(slot7, uv0.FROM_TAG_EHC_KEY) and slot8 ~= 0 then
				slot3 = 1

				break
			end
		end

		uv0.SetCurrent(slot0, uv0.FROM_TAG_EHC_KEY, slot3)
	end
end

function slot0.FlashVelocity(slot0, slot1, slot2)
	uv0.SetCurrent(slot0, "velocity", Mathf.Clamp(slot0._baseAttr.velocity * slot1 + slot2, uv0.GetBase(slot0, "velocity") * 0.2, uv0.GetBase(slot0, "velocity") * 1.8))
end

function slot0.HasSonar(slot0)
	return slot0._attr.sonarRange * slot0._attr.sonarInterval * slot0._attr.sonarDuration ~= 0
end

function slot0.SetCurrent(slot0, slot1, slot2)
	slot0._attr[slot1] = slot2
end

function slot0.GetCurrent(slot0, slot1)
	return slot0._attr[slot1] or 0
end

function slot0.GetBase(slot0, slot1)
	return slot0._baseAttr[slot1] or 0
end

function slot0.GetCurrentTags(slot0)
	return slot0._attr.labelTag or {}
end

function slot0.Increase(slot0, slot1, slot2)
	if slot2 then
		slot0._attr[slot1] = (slot0._attr[slot1] or 0) + slot2
	end
end

function slot0.RatioIncrease(slot0, slot1, slot2)
	if slot2 then
		slot0._attr[slot1] = slot0._attr[slot1] + slot0._baseAttr[slot1] * slot2 / 10000
	end
end

function slot0.GetTagAttr(slot0, slot1)
	for slot7, slot8 in ipairs(slot1:GetLabelTag()) do
		-- Nothing
	end

	for slot8, slot9 in pairs({
		[uv0.TAG_EHC_KEY .. slot8] = true
	}) do
		if uv0.GetCurrent(slot0, slot8) ~= 0 then
			slot4 = 1 * (1 + slot10)
		end
	end

	if uv0.GetCurrent(slot1, uv0.FROM_TAG_EHC_KEY) > 0 then
		for slot12, slot13 in pairs(uv0.GetCurrentTags(slot0)) do
			if slot13 > 0 and uv0.GetCurrent(slot1, uv0.FROM_TAG_EHC_KEY .. slot0:GetWeaponTempData().attack_attribute .. "_" .. slot12) ~= 0 then
				slot4 = slot4 * (1 + slot15)
			end
		end
	end

	return slot4
end
