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

slot0.Ctor = function (slot0, slot1)
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

slot0.updateBaseInfo = function (slot0, slot1)
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

slot0.setJoinColdTime = function (slot0, slot1)
	slot0.joinColdTime = slot1
end

slot0.setContributeFlag = function (slot0, slot1)
	slot0.contributeFlag = slot1
end

slot0.updateBuff = function (slot0, slot1, slot2)
	slot0.buffList[slot1] = {
		id = slot1,
		level = slot2
	}
end

slot0.updateMaxGold = function (slot0, slot1)
	slot0.maxGoldAddition = slot0.maxGoldAddition + slot1
end

slot0.updateMaxOil = function (slot0, slot1)
	slot0.maxOilAddition = slot0.maxOilAddition + slot1
end

slot0.addFacilityLogs = function (slot0, slot1)
	table.insert(slot0.facilityLogs, slot1)
end

slot0.isContributed = function (slot0)
	return slot0.contributeFlag == 1
end

slot0.inJoinColdTime = function (slot0)
	return pg.TimeMgr.GetInstance():GetServerTime() < slot0.joinColdTime
end

slot0.resetGuildContributeFlag = function (slot0)
	slot0.contributeFlag = 0
end

slot0.markGuildContributeFlag = function (slot0)
	slot0.contributeFlag = 1
end

slot0.consumeResource = function (slot0, slot1)
	slot0.resource = math.max(slot0.resource - slot1, 0)
end

slot0.getFacilityConfig = function (slot0)
	return pg.guild_facility_template
end

slot0.updateFacility = function (slot0, slot1)
	slot0.facilitys[slot1.id] = slot1
end

slot0.getFacilityById = function (slot0, slot1)
	return slot0.facilitys[slot1]
end

slot0.updateResource = function (slot0, slot1)
	slot0.resource = slot1
end

slot0.getFinishTime = function (slot0)
	if slot0.finishTime and slot0.finishTime > 0 then
		return "10:00:01"
	else
		return i18n("not yet completed")
	end
end

slot0.setkickLeaderTime = function (slot0, slot1)
	slot0.kickLeaderTime = slot1
end

slot0.getKickLeftTime = function (slot0)
	return slot0.kickLeaderTime - pg.TimeMgr.GetInstance():GetServerTime()
end

slot0.inKickTime = function (slot0)
	return slot0.kickLeaderTime ~= 0
end

slot0.getAssistantMaxCount = function (slot0)
	return pg.guild_data_level[slot0.level].assistant_commander
end

slot0.getAssistantCount = function (slot0)
	slot1 = 0

	for slot5, slot6 in pairs(slot0.member) do
		if slot6.duty == GuildMember.DUTY_DEPUTY_COMMANDER then
			slot1 = slot1 + 1
		end
	end

	return slot1
end

slot0.setMemberCount = function (slot0, slot1)
	slot0.memberCount = slot1
end

slot0.getSortMember = function (slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.member) do
		table.insert(slot1, slot6)
	end

	return slot1
end

slot0.getUIName = function (slot0)
	if slot0.faction == slot0.FACTION_TYPE_BLHX then
		return "NewGuildBlueUI"
	elseif slot0.faction == slot0.FACTION_TYPE_CSZZ then
		return "NewGuildRedUI"
	end
end

slot0.getFacilityUIName = function (slot0)
	if slot0.faction == slot0.FACTION_TYPE_BLHX then
		return "GuildFacilityBlueUI"
	elseif slot0.faction == slot0.FACTION_TYPE_CSZZ then
		return "GuildFacilityRedUI"
	end
end

slot0.getMainUIName = function (slot0)
	if slot0.faction == slot0.FACTION_TYPE_BLHX then
		return "GuildMainBlueUI"
	elseif slot0.faction == slot0.FACTION_TYPE_CSZZ then
		return "GuildMainRedUI"
	end
end

slot0.getBgName = function (slot0)
	if slot0.faction == slot0.FACTION_TYPE_BLHX then
		return "bg/bg_guild_blue"
	elseif slot0.faction == slot0.FACTION_TYPE_CSZZ then
		return "bg/bg_guild_red"
	end
end

slot0.getApplyUIName = function (slot0)
	if slot0.faction == slot0.FACTION_TYPE_BLHX then
		return "GuildApplyBlueUI"
	elseif slot0.faction == slot0.FACTION_TYPE_CSZZ then
		return "GuildApplyRedUI"
	end
end

slot0.addLog = function (slot0, slot1)
	table.insert(slot0.logInfo, 1, slot1)

	if #slot0.logInfo > 100 then
		table.remove(slot0.logInfo, #slot0.logInfo)
	end
end

slot0.getLogs = function (slot0)
	return slot0.logInfo
end

slot0.getMemberById = function (slot0, slot1)
	return slot0.member[slot1]
end

slot0.modifyMember = function (slot0, slot1)
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

slot0.updateMember = function (slot0, slot1)
	slot0.member[slot1.id] = slot1
end

slot0.addMember = function (slot0, slot1)
	slot0.member[slot1.id] = slot1
end

slot0.deleteMember = function (slot0, slot1)
	slot0.member[slot1] = nil
end

slot0.getDutyByMemberId = function (slot0, slot1)
	for slot5, slot6 in pairs(slot0.member) do
		if slot6.id == slot1 then
			return slot6.duty
		end
	end
end

slot0.setId = function (slot0, slot1)
	slot0.id = slot1
end

slot0.setName = function (slot0, slot1)
	slot0.name = slot1
end

slot0.getPolicyName = function (slot0)
	return slot0.POLICY_NAME[slot0.policy]
end

slot0.getFactionName = function (slot0)
	return slot0.FACTION_NAME[slot0.faction]
end

slot0.getName = function (slot0)
	return slot0.name
end

slot0.setPolicy = function (slot0, slot1)
	slot0.policy = slot1
end

slot0.getPolicy = function (slot0)
	return slot0.policy
end

slot0.setFaction = function (slot0, slot1)
	slot0.faction = slot1
end

slot0.getFaction = function (slot0)
	return slot0.faction
end

slot0.setManifesto = function (slot0, slot1)
	slot0.manifesto = slot1
end

slot0.getManifesto = function (slot0)
	return slot0.manifesto or ""
end

slot1 = 86400

slot0.inChangefactionTime = function (slot0)
	slot1 = slot0.changeFactionTime - pg.TimeMgr.GetInstance():GetServerTime()

	if slot0.changeFactionTime ~= 0 and slot1 >= 0 then
		return true
	end
end

slot0.changeFactionLeftTime = function (slot0)
	return pg.TimeMgr.GetInstance():parseTimeFrom(slot0.changeFactionTime - pg.TimeMgr.GetInstance():GetServerTime())
end

slot0.getLevelMaxExp = function (slot0)
	if not pg.guild_data_level[slot0.level] then
		return slot1[slot1.all[#slot1.all]].exp
	else
		return slot1[slot0.level].exp
	end
end

slot0.getMaxMember = function (slot0)
	if not pg.guild_data_level[slot0.level] then
		return slot1[slot1.all[#slot1.all]].exp
	else
		return slot1[slot0.level].member_num
	end
end

slot0.updateExp = function (slot0, slot1)
	slot0.exp = slot1
end

slot0.updateLevel = function (slot0, slot1)
	slot0.level = slot1
end

slot0.getCommader = function (slot0)
	for slot4, slot5 in pairs(slot0.member) do
		if slot5.duty == GuildMember.DUTY_COMMANDER then
			return slot5
		end
	end
end

slot0.getCommaderName = function (slot0)
	if slot0:getCommader() then
		return slot1.name
	else
		return ""
	end
end

slot0.setAnnounce = function (slot0, slot1)
	slot0.announce = slot1
end

slot0.getEnableDuty = function (slot0, slot1, slot2)
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

slot0.warpChatInfo = function (slot0, slot1)
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
