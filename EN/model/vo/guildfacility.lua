slot0 = class("GuildFacility", import(".BaseVO"))
slot0.MAX_OIL_ADDITION = 1
slot0.MAX_GOLD_ADDITION = 2
slot0.BUFF_ADDITION = 3

slot0.Ctor = function (slot0, slot1)
	slot0.id = slot1.id
	slot0.configId = slot0.id
	slot0.level = slot1.level
end

slot0.bindConfigTable = function (slot0)
	return pg.guild_facility_template
end

slot0.isMaxLevel = function (slot0)
	return slot0.level > 0 and #slot0:getConfig("levels") <= slot0.level
end

slot0.getLevelCfg = function (slot0)
	return slot0:getConfig("levels")[slot0.level]
end

slot0.getNextLevelCfg = function (slot0)
	if slot0.level + 1 <= #slot0:getConfig("levels") then
		return slot1[slot2]
	end
end

slot0.canUpgrade = function (slot0, slot1, slot2)
	if slot0:isMaxLevel() then
		return false, i18n("guid_facility_level_max")
	elseif slot1 < slot0:getUpgradeConsume() then
		return false, i18n("guild_facility_res_onenough")
	elseif slot2 <= slot0.level then
		return false, i18n("guild_facility_level_more_than_guild_level")
	end

	return true
end

slot0.upgrade = function (slot0)
	if not slot0:isMaxLevel() then
		slot0.level = slot0.level + 1
	end
end

slot0.getUpgradeConsume = function (slot0)
	if slot0:getNextLevelCfg() then
		return slot1[2]
	end
end

slot0.getAddition = function (slot0)
	if slot0.level == 0 then
		return 0
	end

	return slot0:getLevelCfg()[1]
end

slot0.getAdditionDesc = function (slot0)
	if slot0:getAddition() == 0 then
		return i18n("guild_facility_no_addition")
	end

	if slot0:getConfig("type") == slot0.MAX_OIL_ADDITION then
		return i18n("guild_facility_oil_addition", slot1)
	elseif slot2 == slot0.MAX_GOLD_ADDITION then
		return i18n("guild_facility_gold_addition", slot1)
	elseif slot2 == slot0.BUFF_ADDITION then
		slot3 = ""

		for slot7, slot8 in ipairs(slot0:getConfig("buffs")) do
			slot3 = slot3 .. getSkillDesc(slot8, slot1)
		end

		return slot3
	end
end

return slot0
