slot0 = class("GuildTechnology", import("..BaseVO"))

function slot0.Ctor(slot0, slot1)
	slot0:Update(slot0:bindConfigTable().get_id_list_by_group[slot1.id][1], slot1)
end

function slot0.Update(slot0, slot1, slot2)
	slot0.group = slot2

	if slot0.group:GuildMemberCntType() then
		slot0.id = slot0.group.pid
	else
		slot0.id = slot1
	end

	slot0.configId = slot0.id
	slot0.level = slot0:getConfig("level")
end

function slot0.GetShipAttrAddition(slot0, slot1, slot2)
	slot3 = slot0:getConfig("effect_args")

	if slot3[1] == slot1 and table.contains(slot3[2], slot2) then
		return slot0:getConfig("num")
	else
		return 0
	end
end

function slot0.GetTargetLivness(slot0)
	if slot0:GetNextLevelId() == 0 then
		return 0
	else
		return pg.guild_technology_template[slot1].need_guild_active
	end
end

function slot0.ReachTargetLiveness(slot0, slot1)
	return slot0:GetTargetLivness() <= slot1:GetLiveness()
end

function slot0.levelUp(slot0)
	if slot0:GetNextLevelId() ~= 0 then
		slot0:Update(slot1, slot0.group)
	end
end

function slot0.GetNextLevelId(slot0)
	return slot0:getConfig("next_tech")
end

function slot0.GetLevel(slot0)
	return slot0.level
end

function slot0.isMaxLevel(slot0)
	return slot0:GetMaxLevel() <= slot0:GetLevel()
end

function slot0.GetMaxLevel(slot0)
	return slot0.group:GetLevel()
end

function slot0.bindConfigTable(slot0)
	return pg.guild_technology_template
end

function slot0.GetDesc(slot0)
	return GuildConst.GET_TECHNOLOGY_DESC(slot0:getConfig("effect_args"), slot0:getConfig("num"))
end

function slot0.getAddition(slot0)
	if slot0:GetLevel() > 0 then
		return slot0:getConfig("num")
	else
		return 0
	end
end

function slot0.GetConsume(slot0)
	return slot0:getConfig("contribution_consume"), slot0:getConfig("gold_consume")
end

function slot0.IsGuildMember(slot0)
	return slot0:getConfig("group") == 1
end

return slot0
