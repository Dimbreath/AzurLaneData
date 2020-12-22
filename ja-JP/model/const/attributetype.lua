slot0 = class("AttributeType")
slot0.Durability = "durability"
slot0.Cannon = "cannon"
slot0.Torpedo = "torpedo"
slot0.AntiAircraft = "antiaircraft"
slot0.AntiSub = "antisub"
slot0.Air = "air"
slot0.Reload = "reload"
slot0.ArmorType = "armor_type"
slot0.Armor = "armor"
slot0.Hit = "hit"
slot0.Speed = "speed"
slot0.Luck = "luck"
slot0.Dodge = "dodge"
slot0.Expend = "expend"
slot0.Intimacy = "intimacy"
slot0.AirDominate = "AirDominate"
slot0.Damage = "damage"
slot0.CD = "cd"
slot0.Healthy = "healthy"
slot0.Speciality = "speciality"
slot0.Range = "range"
slot0.Angle = "angle"
slot0.Scatter = "scatter"
slot0.Ammo = "ammo"
slot0.HuntingRange = "hunting_range"
slot0.AirDurability = "AirDurability"
slot0.AntiSiren = "anti_siren"
slot0.Corrected = "corrected"
slot0.OxyMax = "oxy_max"
slot0.OxyCost = "oxy_cost"
slot0.OxyRecovery = "oxy_recovery"
slot0.OxyRecoveryBench = "oxy_recovery_bench"
slot0.OxyAttackDuration = "attack_duration"
slot0.OxyRaidDistance = "raid_distance"
slot0.SonarRange = "sonarRange"
slot0.Tactics = "tactics"
slot0.WorldPower = "world_power"

function slot0.Type2Name(slot0)
	return i18n("attribute_" .. slot0)
end

slot0.eliteCondition = {
	level = i18n("elite_condition_level"),
	durability = i18n("elite_condition_durability"),
	cannon = i18n("elite_condition_cannon"),
	torpedo = i18n("elite_condition_torpedo"),
	antiaircraft = i18n("elite_condition_antiaircraft"),
	air = i18n("elite_condition_air"),
	antisub = i18n("elite_condition_antisub"),
	dodge = i18n("elite_condition_dodge"),
	reload = i18n("elite_condition_reload")
}
slot0.eliteConditionCompare = {
	[0] = i18n("common_compare_equal"),
	i18n("common_compare_larger"),
	[-1] = i18n("common_compare_smaller")
}

function slot0.EliteCondition2Name(slot0)
	return uv0.eliteCondition[slot0]
end

return slot0
