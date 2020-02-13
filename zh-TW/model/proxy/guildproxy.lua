slot0 = class("GuildProxy", import(".NetProxy"))
slot0.NEW_GUILD_ADDED = "GuildProxy:NEW_GUILD_ADDED"
slot0.GUILD_UPDATED = "GuildProxy:GUILD_UPDATED"
slot0.EXIT_GUILD = "GuildProxy:EXIT_GUILD"
slot0.REQUEST_ADDED = "GuildProxy:REQUEST_ADDED"
slot0.REQUEST_DELETED = "GuildProxy:REQUEST_DELETED"
slot0.NEW_MSG_ADDED = "GuildProxy:NEW_MSG_ADDED"
slot0.REQUEST_COUNT_UPDATED = "GuildProxy:REQUEST_COUNT_UPDATED"
slot0.LOG_ADDED = "GuildProxy:LOG_ADDED"
slot0.ADDED_EVENT = "GuildProxy:ADD_EVENT"
slot0.UPDATED_EVENT = "GuildProxy:UPDATED_EVENT"
slot0.GUILD_EVENT_END = "GuildProxy:GUILD_EVENT_END"
slot0.UPDATE_FACILITYLOG = "GuildProxy:UPDATE_FACILITYLOG"
slot0.FACILITY_ADDITION_UPDATED = "GuildProxy:FACILITY_ADDITION_UPDATED"

function slot0.register(slot0)
	slot0.data = nil
	slot0.chatMsgs = {}
	slot0.eventTip = false
	slot0.isGetChatMsg = false

	slot0:on(60000, function (slot0)
		if Guild.New(slot0.guild).id == 0 then
			slot0:exitGuild()
		elseif slot0.data == nil then
			slot0:addGuild(slot1)
		else
			slot0:updateGuild(slot1)
		end

		if slot0.data and not slot0.isGetChatMsg then
			slot0:sendNotification(GAME.GET_GUILD_CHAT_LIST)
		end
	end)

	slot0.requestCount = 0

	slot0:on(60009, function (slot0)
		slot0.requestCount = slot0.count

		slot0:sendNotification(slot1.REQUEST_COUNT_UPDATED, slot0.count)
	end)
	slot0:on(60030, function (slot0)
		slot1 = slot0:getData()

		slot1:updateBaseInfo({
			base = slot0.guild
		})
		slot0:updateGuild(slot1)
	end)
	slot0:on(60031, function (slot0)
		slot1 = slot0:getData()

		for slot5, slot6 in ipairs(slot0.member_list) do
			slot1:modifyMember(GuildMember.New(slot6))
		end

		for slot5, slot6 in ipairs(slot0.log_list) do
			slot1:addLog(slot7)
			slot0:sendNotification(slot1.LOG_ADDED, Clone(GuildLogInfo.New(slot6)))
		end

		slot1:setMemberCount(table.getCount(slot1.member or {}))
		slot0:updateGuild(slot1)
	end)
	slot0:on(60032, function (slot0)
		slot1 = slot0:getData()

		slot1:updateExp(slot0.exp)
		slot1:updateLevel(slot0.lv)
		slot0:updateGuild(slot1)
	end)
	slot0:on(60008, function (slot0)
		if slot0.data:warpChatInfo(slot0.chat) then
			slot0:addMsg(slot2)
			slot0:sendNotification(slot1.NEW_MSG_ADDED, slot2)
		end
	end)
	slot0:on(60043, function (slot0)
		slot1 = GuildEvent.New(slot0)

		if slot0.data and slot1.bossId ~= 0 then
			if slot0.guildEvent then
				slot0:updateGuildEvent(slot1)
			else
				slot0:addGuildEvent(slot1)
			end
		end
	end)
	slot0:on(62045, function (slot0)
		slot1 = slot0.data:clone()

		for slot5, slot6 in ipairs(slot0.facility_list) do
			slot1:updateFacility(GuildFacility.New(slot6))
		end

		slot0:updateGuild(slot1)
	end)
	slot0:on(62048, function (slot0)
		slot0:updateFacilityAddition(slot0)
	end)
	slot0:on(62051, function (slot0)
		slot0:updateFaclityLogs(slot0)
	end)
	slot0:on(62053, function (slot0)
		slot0.data:updateResource(slot0.resource or 0)
		slot0:updateGuild(slot1)
	end)
	slot0:on(62054, function (slot0)
		if slot0.data then
			slot0.data:setJoinColdTime(slot0.join_cold_time)
			slot0.data:setContributeFlag(slot0.contribute_flag)
		end
	end)
end

function slot0.updateFaclityLogs(slot0, slot1)
	if not slot0.data then
		return
	end

	slot2 = {}

	for slot6, slot7 in ipairs(slot1.log_list) do
		table.insert(slot2, slot8)
		slot0.data:addFacilityLogs(GuildLogInfo.New(slot7))
	end

	slot0:sendNotification(slot0.UPDATE_FACILITYLOG, slot2)
end

function slot0.updateFacilityAddition(slot0, slot1)
	if not slot0.data then
		return
	end

	slot2 = slot0:getData()

	for slot6, slot7 in ipairs(slot1.addition_info) do
		if slot7.type == GuildFacility.MAX_OIL_ADDITION then
			slot2:updateMaxOil(slot7.addition[1])
		elseif slot7.type == GuildFacility.MAX_GOLD_ADDITION then
			slot2:updateMaxGold(slot7.addition[1])
		elseif slot7.type == GuildFacility.BUFF_ADDITION then
			slot2:updateBuff(slot7.addition[1], slot7.addition[2])
		end
	end

	slot0:updateGuild(slot2)
	slot0:sendNotification(slot0.FACILITY_ADDITION_UPDATED)
end

function slot0.getGuildEvent(slot0)
	return slot0.guildEvent
end

function slot0.addGuildEvent(slot0, slot1)
	slot0.guildEvent = slot1

	slot0:sendNotification(slot0.ADDED_EVENT, slot1)
end

function slot0.updateGuildEvent(slot0, slot1)
	slot0.guildEvent = slot1

	slot0:sendNotification(slot0.UPDATED_EVENT, slot1)
end

function slot0.setRequestList(slot0, slot1)
	slot0.requests = slot1
end

function slot0.addGuild(slot0, slot1)
	slot0.data = slot1

	slot0:sendNotification(slot0.NEW_GUILD_ADDED, Clone(slot1))
end

function slot0.updateGuild(slot0, slot1)
	slot0.data = slot1

	slot0:sendNotification(slot0.GUILD_UPDATED, Clone(slot1))
end

function slot0.exitGuild(slot0)
	slot0.data = nil

	slot0:clearEvent()
	slot0:sendNotification(slot0.EXIT_GUILD)
end

function slot0.clearEvent(slot0)
	if slot0.guildEvent then
		slot0.guildEvent = nil

		slot0:sendNotification(slot0.GUILD_EVENT_END)
	end
end

function slot0.isNoticesApply(slot0)
	if not slot0.requests then
		return false
	end

	return table.getCount(slot0.requests) + slot0.requestCount > 0
end

function slot0.getRequests(slot0)
	return slot0.requests
end

function slot0.getSortRequest(slot0)
	if not slot0.requests then
		return nil
	end

	slot1 = {}

	for slot5, slot6 in pairs(slot0.requests) do
		table.insert(slot1, slot6)
	end

	return slot1
end

function slot0.deleteRequest(slot0, slot1)
	if not slot0.requests then
		return
	end

	slot0.requests[slot1] = nil

	slot0:sendNotification(slot0.REQUEST_DELETED, slot1)
end

function slot0.addMsg(slot0, slot1)
	table.insert(slot0.chatMsgs, slot1)

	if Guild.CHAT_LOG_MAX_COUNT < #slot0.chatMsgs then
		table.remove(slot0.chatMsgs, 1)
	end
end

function slot0.getChatMsgs(slot0)
	return slot0.chatMsgs
end

return slot0
