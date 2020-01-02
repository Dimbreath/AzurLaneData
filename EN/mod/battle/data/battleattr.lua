ys = ys or {}
ys.Battle.BattleAttr = {
	AttrListInheritance = {
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
		"dodgeRateExtra",
		"perfectDodge",
		"immuneDirectHit",
		"chargeBulletAccuracy",
		"dropBombAccuracy",
		"aircraftBooster",
		"manualEnhancement",
		"initialEnhancement"
	},
	InsertInheritedAttr = function (slot0)
		for slot4, slot5 in pairs(slot0) do
			slot0.AttrListInheritance[#slot0.AttrListInheritance + 1] = slot5
		end
	end,
	TAG_EHC_KEY = "DMG_TAG_EHC_",
	FROM_TAG_EHC_KEY = "DMG_FROM_TAG_",
	SetAttr = function (slot0, slot1)
		slot0._attr = setmetatable({}, {
			__index = slot1
		})
	end,
	GetAttr = function (slot0)
		return slot0._attr
	end,
	SetBaseAttr = function (slot0)
		slot0._baseAttr = Clone(slot0._attr)
	end,
	IsInvincible = function (slot0)
		return slot0._attr.isInvincible and slot1 > 0
	end,
	Whosyourdaddy = function (slot0)
		slot0._attr.isInvincible = (slot0._attr.isInvincible or 0) + 1
	end,
	Imyourson = function (slot0)
		slot0._attr.isInvincible = (slot0._attr.isInvincible or 0) - 1
	end,
	AddImmuneAreaLimit = function (slot0, slot1)
		slot0._attr.immuneAreaLimit = (slot0._attr.immuneAreaLimit or 0) + slot1

		slot0._move:ImmuneAreaLimit((slot0._attr.immuneAreaLimit or 0) + slot1 > 0)
	end,
	AddImmuneMaxAreaLimit = function (slot0, slot1)
		slot0._attr.immuneMaxAreaLimit = (slot0._attr.immuneMaxAreaLimit or 0) + slot1

		slot0._move:ImmuneMaxAreaLimit((slot0._attr.immuneMaxAreaLimit or 0) + slot1 > 0)
	end,
	IsImmuneAreaLimit = function (slot0)
		return slot0._attr.immuneAreaLimit and slot1 > 0
	end,
	IsImmuneMaxAreaLimit = function (slot0)
		return slot0._attr.immuneMaxAreaLimit and slot1 > 0
	end,
	IsVisitable = function (slot0)
		return not slot0._attr.isUnVisitable or slot1 <= 0
	end,
	UnVisitable = function (slot0)
		slot0._attr.isUnVisitable = (slot0._attr.isUnVisitable or 0) + 1
	end,
	Visitable = function (slot0)
		slot0._attr.isUnVisitable = (slot0._attr.isUnVisitable or 0) - 1
	end,
	IsSpirit = function (slot0)
		return slot0._attr.isSpirit and slot1 > 0
	end,
	Spirit = function (slot0)
		slot0._attr.isSpirit = (slot0._attr.isSpirit or 0) + 1
	end,
	Entity = function (slot0)
		slot0._attr.isSpirit = (slot0._attr.isSpirit or 0) - 1
	end,
	IsStun = function (slot0)
		return slot0._attr.isStun and slot1 > 0
	end,
	Stun = function (slot0)
		slot0._attr.isStun = (slot0._attr.isStun or 0) + 1
	end,
	CancelStun = function (slot0)
		slot0._attr.isStun = (slot0._attr.isStun or 0) - 1
	end,
	SetPlayerAttrFromOutBattle = function (slot0, slot1)
		slot0._attr = slot0._attr or {}
		slot0._attr or .id = slot1.id
		slot0._attr or .battleUID = slot0:GetUniqueID()
		slot0._attr or .level = slot1.level
		slot0._attr or .formulaLevel = slot1.level
		slot0._attr or .maxHP = slot1.durability
		slot0._attr or .cannonPower = slot1.cannon
		slot0._attr or .torpedoPower = slot1.torpedo
		slot0._attr or .antiAirPower = slot1.antiaircraft
		slot0._attr or .antiSubPower = slot1.antisub
		slot0._attr or .airPower = slot1.air
		slot0._attr or .loadSpeed = slot1.reload
		slot0._attr or .armorType = slot1.armorType
		slot0._attr or .attackRating = slot1.hit
		slot0._attr or .dodgeRate = slot1.dodge
		slot0._attr or .velocity = ys.Battle.BattleFormulas.ConvertShipSpeed(slot1.speed)
		slot0._attr or .luck = slot1.luck
		slot0._attr or .repressReduce = slot0:GetRepressReduce()
		slot0._attr or .oxyMax = slot1.oxy_max
		slot0._attr or .oxyCost = slot1.oxy_cost
		slot0._attr or .oxyRecovery = slot1.oxy_recovery
		slot0._attr or .oxyRecoveryBench = slot1.oxy_recovery_bench
		slot0._attr or .oxyAtkDuration = slot1.attack_duration
		slot0._attr or .raidDist = slot1.raid_distance
		slot0._attr or .sonarRange = slot1.sonarRange or 0
		slot0._attr or .sonarInterval = slot1.sonarInterval or 0
		slot0._attr or .sonarDuration = slot1.sonarDuration or 0
		slot0._attr or .comboTag = "combo_" .. slot0._attr or .battleUID
		slot0._attr or .labelTag = {}

		slot0:SetBaseAttr()
	end,
	InitDOTAttr = function (slot0, slot1)
		slot2 = ys.Battle.BattleConfig.DOT_CONFIG_DEFAULT

		for slot7, slot8 in ipairs(slot3) do
			for slot12, slot13 in pairs(slot8) do
				if slot12 == "hit" then
					slot0[slot13] = slot1[slot13] or slot2[slot12]
				else
					slot0[slot13] = slot2[slot12]
				end
			end
		end
	end,
	SetEnemyAttr = function (slot0, slot1)
		slot0._attr = slot0._attr or {}
		slot0._attr or .battleUID = slot0:GetUniqueID()
		slot0._attr or .level = slot0._level or 1
		slot0._attr or .formulaLevel = math.max(1, (slot0._level or 1) - (slot1 or 0))
		slot0._attr or .maxHP = slot0._tmpData.durability + slot0._tmpData.durability_growth * ((slot0._level or 1) - 1) / 1000
		slot0._attr or .cannonPower = slot0._tmpData.cannon + slot0._tmpData.cannon_growth * ((slot0._level or 1) - 1) / 1000
		slot0._attr or .torpedoPower = slot0._tmpData.torpedo + slot0._tmpData.torpedo_growth * ((slot0._level or 1) - 1) / 1000
		slot0._attr or .antiAirPower = slot0._tmpData.antiaircraft + slot0._tmpData.antiaircraft_growth * ((slot0._level or 1) - 1) / 1000
		slot0._attr or .airPower = slot0._tmpData.air + slot0._tmpData.air_growth * ((slot0._level or 1) - 1) / 1000
		slot0._attr or .antiSubPower = slot0._tmpData.antisub + slot0._tmpData.antisub_growth * ((slot0._level or 1) - 1) / 1000
		slot0._attr or .loadSpeed = slot0._tmpData.reload + slot0._tmpData.reload_growth * ((slot0._level or 1) - 1) / 1000
		slot0._attr or .armorType = slot0._tmpData.armor_type
		slot0._attr or .attackRating = slot0._tmpData.hit + slot0._tmpData.hit_growth * ((slot0._level or 1) - 1) / 1000
		slot0._attr or .dodgeRate = slot0._tmpData.dodge + slot0._tmpData.dodge_growth * ((slot0._level or 1) - 1) / 1000
		slot0._attr or .velocity = ys.Battle.BattleFormulas.ConvertShipSpeed(slot0._tmpData.speed + slot0._tmpData.speed_growth * ((slot0._level or 1) - 1) / 1000)
		slot0._attr or .luck = slot0._tmpData.luck + slot0._tmpData.luck_growth * ((slot0._level or 1) - 1) / 1000
		slot0._attr or .bulletSpeedRatio = 0
		slot0._attr or .id = "enemy_" .. tostring(slot0._tmpData.id)
		slot0._attr or .repressReduce = 1
		slot0._attr or .comboTag = "combo_" .. slot0._attr or .battleUID
		slot0._attr or .labelTag = {}

		slot0:SetBaseAttr()
	end,
	SetAircraftAttFromMother = function (slot0, slot1)
		slot0._attr = slot0._attr or {}
		slot0._attr or .battleUID = slot0:GetUniqueID()
		slot0._attr or .hostUID = slot1:GetUniqueID()

		if type(slot1._attr.id) == "number" then
			slot2.id = slot1._attr.id
		end

		for slot6, slot7 in ipairs(slot0.AttrListInheritance) do
			slot2[slot7] = slot1._attr[slot7]
		end

		slot2.armorType = 0
		slot2.labelTag = setmetatable({}, {
			__index = slot1._attr.labelTag
		})
		slot2.comboTag = "combo_" .. slot2.hostUID
	end,
	SetAircraftAttFromTemp = function (slot0)
		slot0._attr = slot0._attr or {}
		slot0._attr.velocity = slot0._attr.velocity or ys.Battle.BattleFormulas.ConvertAircraftSpeed(slot0._tmpData.speed)
		slot0._attr.maxHP = slot0._attr.maxHP or slot0._tmpData.max_hp + slot0._tmpData.hp_growth / 1000 * ((slot0._attr.level or 1) - 1) + slot0:GetCurrent("hiveExtraHP")
		slot0._attr.crashDMG = slot0._tmpData.crash_DMG
		slot0._attr.dodge = slot0._tmpData.dodge
		slot0._attr.dodgeLimit = slot0._tmpData.dodge_limit
	end,
	FlashByBuff = function (slot0, slot1, slot2)
		slot0._attr[slot1] = slot2 + (slot0._baseAttr[slot1] or 0)

		if string.find(slot1, slot0.FROM_TAG_EHC_KEY) then
			slot3 = 0

			for slot7, slot8 in pairs(slot0._attr) do
				if string.find(slot7, slot0.FROM_TAG_EHC_KEY) and slot8 ~= 0 then
					slot3 = 1

					break
				end
			end

			slot0:SetCurrent(slot0.FROM_TAG_EHC_KEY, slot3)
		end
	end,
	FlashVelocity = function (slot0, slot1, slot2)
		slot0:SetCurrent("velocity", Mathf.Clamp(slot0._baseAttr.velocity * slot1 + slot2, slot4, slot3))
	end,
	HasSonar = function (slot0)
		return slot0._attr.sonarRange * slot0._attr.sonarInterval * slot0._attr.sonarDuration ~= 0
	end,
	SetCurrent = function (slot0, slot1, slot2)
		slot0._attr[slot1] = slot2
	end,
	GetCurrent = function (slot0, slot1)
		return slot0._attr[slot1] or 0
	end,
	GetBase = function (slot0, slot1)
		return slot0._baseAttr[slot1] or 0
	end,
	GetCurrentTags = function (slot0)
		return slot0._attr.labelTag or {}
	end,
	Increase = function (slot0, slot1, slot2)
		if slot2 then
			slot0._attr[slot1] = (slot0._attr[slot1] or 0) + slot2
		end
	end,
	RatioIncrease = function (slot0, slot1, slot2)
		if slot2 then
			slot0._attr[slot1] = slot0._attr[slot1] + (slot0._baseAttr[slot1] * slot2) / 10000
		end
	end,
	GetTagAttr = function (slot0, slot1)
		slot3 = {}

		for slot7, slot8 in ipairs(slot2) do
			slot3[slot0.TAG_EHC_KEY .. slot8] = true
		end

		slot4 = 1

		for slot8, slot9 in pairs(slot3) do
			if slot0:GetCurrent(slot8) ~= 0 then
				slot4 = slot4 * (1 + slot10)
			end
		end

		if slot0.GetCurrent(slot1, slot0.FROM_TAG_EHC_KEY) > 0 then
			slot7 = slot0.FROM_TAG_EHC_KEY .. slot6 .. "_"

			for slot12, slot13 in pairs(slot8) do
				if slot13 > 0 and slot0.GetCurrent(slot1, slot7 .. slot12) ~= 0 then
					slot4 = slot4 * (1 + slot15)
				end
			end
		end

		return slot4
	end
}
slot1 = ys.Battle.BattleConst

()["InsertInheritedAttr"](ys.Battle.BattleConfig.AMMO_DAMAGE_ENHANCE)
()["InsertInheritedAttr"](ys.Battle.BattleConfig.AMMO_DAMAGE_REDUCE)
()["InsertInheritedAttr"](ys.Battle.BattleConfig.SHIP_TYPE_ACCURACY_ENHANCE)

function ys.Battle.BattleAttr.SetAirFighterAttr(slot0, slot1)
	slot0._attr = slot0._attr or {}
	slot3 = ys.Battle.BattleDataProxy.GetInstance()
	slot0._attr or .battleUID = slot0:GetUniqueID()
	slot0._attr or .hostUID = 0
	slot0._attr or .id = 0
	slot0._attr or .level = slot3:GetDungeonLevel()
	slot0._attr or .formulaLevel = slot3.GetDungeonLevel()

	if slot3:IsCompletelyRepress() then
		slot2.formulaLevel = math.max(slot2.formulaLevel - 10, 1)
	end

	slot2.maxHP = math.floor(slot1.max_hp + slot1.hp_growth * (slot4 - 1) / 1000)
	slot2.attackRating = slot1.accuracy + slot1.ACC_growth * (slot4 - 1) / 1000
	slot2.dodge = slot1.dodge
	slot2.dodgeLimit = slot1.dodge_limit
	slot2.cannonPower = slot1.attack_power + slot1.AP_growth * (slot4 - 1) / 1000
	slot2.torpedoPower = slot1.attack_power + slot1.AP_growth * (slot4 - 1) / 1000
	slot2.antiAirPower = slot1.attack_power + slot1.AP_growth * (slot4 - 1) / 1000
	slot2.antiSubPower = slot1.attack_power + slot1.AP_growth * (slot4 - 1) / 1000
	slot2.airPower = slot1.attack_power + slot1.AP_growth * (slot4 - 1) / 1000
	slot2.loadSpeed = 0
	slot2.armorType = 1
	slot2.dodgeRate = 0
	slot2.luck = 50
	slot2.velocity = ys.Battle.BattleFormulas.ConvertAircraftSpeed(slot1.speed)
	slot2.repressReduce = 1
	slot2.crashDMG = slot1.crash_DMG
end

return
