slot0 = class("Guild", import(".BaseVO"))
slot0.POLICY_TYPE_POWER = 1
slot0.POLICY_TYPE_RELAXATION = 2
slot0.FACTION_TYPE_BLHX = 1
slot0.FACTION_TYPE_CSZZ = 2
slot0.CHAT_LOG_MAX_COUNT = 100
slot0.POLICY_NAME = {
	i18n("guild_policy_power"),
	i18n("guild_policy_relax")
}
slot0.FACTION_NAME = {
	i18n("guild_faction_blhx"),
	i18n("guild_faction_cszz")
}

function slot0.Ctor(slot0, slot1)
	slot0.member = {}
	slot2 = ipairs
	slot3 = slot1.member or {}

	for slot5, slot6 in slot2(slot3) do
		slot0.member[GuildMember.New(slot6).id] = GuildMember.New(slot6)
	end

	slot0.logInfo = {}
	slot2 = ipairs
	slot3 = slot1.log or {}

	for slot5, slot6 in slot2(slot3) do
		table.insert(slot0.logInfo, GuildLogInfo.New(slot6))
	end

	slot0.facilityLogs = {}

	slot0:updateBaseInfo(slot1)
end

function slot0.updateBaseInfo(slot0, slot1)
	slot0.id = slot1.base or {}.id
	slot0.policy = slot1.base or .policy
	slot0.faction = slot1.base or .faction
	slot0.name = slot1.base or .name
	slot0.manifesto = slot1.base or .manifesto
	slot0.level = slot1.base or .level or 1
	slot0.memberCount = slot1.base or .member_count or 1
	slot0.announce = slot1.base or .announce or ""
	slot0.exp = slot1.base or .exp or 0
	slot0.changeFactionTime = slot1.base or .change_faction_cd or 0
	slot0.kickLeaderTime = slot1.base or .kick_leader_cd or 0

	slot0:updateResource(slot1.base or .resource or 0)

	slot0.totalDamage = slot1.base or .total_damage or 0
	slot0.finishTime = slot1.base or .finish_time or 0
	slot0.playerName = slot1.base or .player_name or slot0:getCommaderName() or ""
	slot0.facilitys = {}

	for slot7, slot8 in ipairs(slot0:getFacilityConfig().all) do
		slot0.facilitys[slot8] = GuildFacility.New({
			level = 0,
			id = slot8
		})
	end

	slot0.buffList = {}
	slot4 = ipairs
	slot5 = slot2.buff_list or {}

	for slot7, slot8 in slot4(slot5) do
		slot0.buffList[slot8.buff_id] = {
			id = slot8.buff_id,
			level = slot8.level
		}
	end

	slot0.maxOilAddition = slot2.max_oil_addition or 0
	slot0.maxGoldAddition = slot2.max_gold_addition or 0
	slot0.joinColdTime = 0
	slot0.contributeFlag = 0
end

function slot0.setJoinColdTime(slot0, slot1)
	slot0.joinColdTime = slot1
end

function slot0.setContributeFlag(slot0, slot1)
	slot0.contributeFlag = slot1
end

function slot0.updateBuff(slot0, slot1, slot2)
	slot0.buffList[slot1] = {
		id = slot1,
		level = slot2
	}
end

function slot0.updateMaxGold(slot0, slot1)
	slot0.maxGoldAddition = slot0.maxGoldAddition + slot1
end

function slot0.updateMaxOil(slot0, slot1)
	slot0.maxOilAddition = slot0.maxOilAddition + slot1
end

function slot0.addFacilityLogs(slot0, slot1)
	table.insert(slot0.facilityLogs, slot1)
end

function slot0.isContributed(slot0)
	return slot0.contributeFlag == 1
end

function slot0.inJoinColdTime(slot0)
	return pg.TimeMgr.GetInstance():GetServerTime() < slot0.joinColdTime
end

function slot0.resetGuildContributeFlag(slot0)
	slot0.contributeFlag = 0
end

function slot0.markGuildContributeFlag(slot0)
	slot0.contributeFlag = 1
end

function slot0.consumeResource(slot0, slot1)
	slot0.resource = math.max(slot0.resource - slot1, 0)
end

function slot0.getFacilityConfig(slot0)
	return pg.guild_facility_template
end

function slot0.updateFacility(slot0, slot1)
	slot0.facilitys[slot1.id] = slot1
end

function slot0.getFacilityById(slot0, slot1)
	return slot0.facilitys[slot1]
end

function slot0.updateResource(slot0, slot1)
	slot0.resource = slot1
end

function slot0.getFinishTime(slot0)
	if slot0.finishTime and slot0.finishTime > 0 then
		return "10:00:01"
	else
		return i18n("not yet completed")
	end
end

function slot0.setkickLeaderTime(slot0, slot1)
	slot0.kickLeaderTime = slot1
end

function slot0.getKickLeftTime(slot0)
	return slot0.kickLeaderTime - pg.TimeMgr.GetInstance():GetServerTime()
end

function slot0.inKickTime(slot0)
	return slot0.kickLeaderTime ~= 0
end

function slot0.getAssistantMaxCount(slot0)
	return pg.guild_data_level[slot0.level].assistant_commander
end

function slot0.getAssistantCount(slot0)
	slot1 = 0

	for slot5, slot6 in pairs(slot0.member) do
		if slot6.duty == GuildMember.DUTY_DEPUTY_COMMANDER then
			slot1 = slot1 + 1
		end
	end

	return slot1
end

function slot0.setMemberCount(slot0, slot1)
	slot0.memberCount = slot1
end

function slot0.getSortMember(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.member) do
		table.insert(slot1, slot6)
	end

	return slot1
end

function slot0.getUIName(slot0)
	if slot0.faction == slot0.FACTION_TYPE_BLHX then
		return "NewGuildBlueUI"
	elseif slot0.faction == slot0.FACTION_TYPE_CSZZ then
		return "NewGuildRedUI"
	end
end

function slot0.getFacilityUIName(slot0)
	if slot0.faction == slot0.FACTION_TYPE_BLHX then
		return "GuildFacilityBlueUI"
	elseif slot0.faction == slot0.FACTION_TYPE_CSZZ then
		return "GuildFacilityRedUI"
	end
end

function slot0.getMainUIName(slot0)
	if slot0.faction == slot0.FACTION_TYPE_BLHX then
		return "GuildMainBlueUI"
	elseif slot0.faction == slot0.FACTION_TYPE_CSZZ then
		return "GuildMainRedUI"
	end
end

function slot0.getBgName(slot0)
	if slot0.faction == slot0.FACTION_TYPE_BLHX then
		return "bg/bg_guild_blue"
	elseif slot0.faction == slot0.FACTION_TYPE_CSZZ then
		return "bg/bg_guild_red"
	end
end

function slot0.getApplyUIName(slot0)
	if slot0.faction == slot0.FACTION_TYPE_BLHX then
		return "GuildApplyBlueUI"
	elseif slot0.faction == slot0.FACTION_TYPE_CSZZ then
		return "GuildApplyRedUI"
	end
end

function slot0.addLog(slot0, slot1)
	table.insert(slot0.logInfo, 1, slot1)

	if #slot0.logInfo > 100 then
		table.remove(slot0.logInfo, #slot0.logInfo)
	end
end

function slot0.getLogs(slot0)
	return slot0.logInfo
end

function slot0.getMemberById(slot0, slot1)
	return slot0.member[slot1]
end

function slot0.modifyMember(slot0, slot1)
	if slot1.duty == 0 then
		slot0:deleteMember(slot1.id)

		return
	end

	if slot0.member[slot1.id] then
		slot0:updateMember(slot1)
	else
		slot0:addMember(slot1)
	end
end

function slot0.updateMember(slot0, slot1)
	slot0.member[slot1.id] = slot1
end

function slot0.addMember(slot0, slot1)
	slot0.member[slot1.id] = slot1
end

function slot0.deleteMember(slot0, slot1)
	slot0.member[slot1] = nil
end

function slot0.getDutyByMemberId(slot0, slot1)
	for slot5, slot6 in pairs(slot0.member) do
		if slot6.id == slot1 then
			return slot6.duty
		end
	end
end

function slot0.setId(slot0, slot1)
	slot0.id = slot1
end

function slot0.setName(slot0, slot1)
	slot0.name = slot1
end

function slot0.getPolicyName(slot0)
	return slot0.POLICY_NAME[slot0.policy]
end

function slot0.getFactionName(slot0)
	return slot0.FACTION_NAME[slot0.faction]
end

function slot0.getName(slot0)
	return slot0.name
end

function slot0.setPolicy(slot0, slot1)
	slot0.policy = slot1
end

function slot0.getPolicy(slot0)
	return slot0.policy
end

function slot0.setFaction(slot0, slot1)
	slot0.faction = slot1
end

function slot0.getFaction(slot0)
	return slot0.faction
end

function slot0.setManifesto(slot0, slot1)
	slot0.manifesto = slot1
end

function slot0.getManifesto(slot0)
	return slot0.manifesto or ""
end

slot1 = 86400

function slot0.inChangefactionTime(slot0)
	slot1 = slot0.changeFactionTime - pg.TimeMgr.GetInstance():GetServerTime()

	if slot0.changeFactionTime ~= 0 and slot1 >= 0 then
		return true
	end
end

function slot0.changeFactionLeftTime(slot0)
	return pg.TimeMgr.GetInstance():parseTimeFrom(slot0.changeFactionTime - pg.TimeMgr.GetInstance():GetServerTime())
end

function slot0.getLevelMaxExp(slot0)
	if not pg.guild_data_level[slot0.level] then
		return slot1[slot1.all[#slot1.all]].exp
	else
		return slot1[slot0.level].exp
	end
end

function slot0.getMaxMember(slot0)
	if not pg.guild_data_level[slot0.level] then
		return slot1[slot1.all[#slot1.all]].exp
	else
		return slot1[slot0.level].member_num
	end
end

function slot0.updateExp(slot0, slot1)
	slot0.exp = slot1
end

function slot0.updateLevel(slot0, slot1)
	slot0.level = slot1
end

function slot0.getCommader(slot0)
	for slot4, slot5 in pairs(slot0.member) do
		if slot5.duty == GuildMember.DUTY_COMMANDER then
			return slot5
		end
	end
end

function slot0.getCommaderName(slot0)
	if slot0:getCommader() then
		return slot1.name
	else
		return ""
	end
end

function slot0.setAnnounce(slot0, slot1)
	slot0.announce = slot1
end

function slot0.getEnableDuty(slot0, slot1, slot2)
	slot3 = {}

	if slot1 == GuildMember.DUTY_COMMANDER then
		if slot0:getAssistantMaxCount() == slot0:getAssistantCount() then
			slot3 = (slot2 == GuildMember.DUTY_DEPUTY_COMMANDER and {
				GuildMember.DUTY_COMMANDER,
				GuildMember.DYTY_PICKED,
				GuildMember.DUTY_ORDINARY
			}) or {
				GuildMember.DYTY_PICKED,
				GuildMember.DUTY_ORDINARY
			}
		else
			slot3 = (slot2 == GuildMember.DUTY_DEPUTY_COMMANDER and {
				GuildMember.DUTY_COMMANDER,
				GuildMember.DUTY_DEPUTY_COMMANDER,
				GuildMember.DYTY_PICKED,
				GuildMember.DUTY_ORDINARY
			}) or {
				GuildMember.DUTY_DEPUTY_COMMANDER,
				GuildMember.DYTY_PICKED,
				GuildMember.DUTY_ORDINARY
			}
		end
	elseif slot1 == GuildMember.DUTY_DEPUTY_COMMANDER then
		slot3 = {
			GuildMember.DYTY_PICKED,
			GuildMember.DUTY_ORDINARY
		}
	end

	for slot7, slot8 in ipairs(slot3) do
		if slot8 == slot2 then
			table.remove(slot3, slot7)

			break
		end
	end

	return slot3
end

function slot0.warpChatInfo(slot0, slot1)
	slot2, slot3 = wordVer(slot1.content, {
		isReplace = true
	})

	if GuildMember.New(slot1.player) then
		slot4:setDuty(slot5)
		string.gsub(slot3, ChatConst.EmojiCodeMatch, function (slot0)
			slot0 = tonumber(slot0)
		end)

		if nil then
			if slot6 == 64 then
				slot6 = 66
			end

			if pg.emoji_template[slot6] then
				slot3 = slot7.desc
			else
				slot6 = nil
			end
		end

		return ChatMsg.New(ChatConst.ChannelGuild, {
			player = slot4,
			content = slot3,
			emojiId = slot6,
			timestamp = slot1.time
		})
	end
end

return slot0
