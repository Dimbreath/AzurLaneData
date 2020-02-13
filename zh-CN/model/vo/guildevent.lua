slot0 = class("GuildEvent", import(".BaseVO"))
slot0.TASK_UPDATED = "GuildEvent:TASK_UPDATED"

function slot0.Ctor(slot0, slot1)
	slot0.bossId = slot1.boss_id
	slot0.bossLevel = slot1.level
	slot0.bossHp = slot1.hp
	slot0.count = slot1.count
	slot0.startTime = slot1.start_time
	slot0.endTime = slot1.end_time
	slot0.attackCount = slot1.attack_count
	slot0.taskList = {}

	slot0:initTasks(slot1.got_award_list)
end

function slot0.initTasks(slot0, slot1)
	for slot6, slot7 in pairs(pg.guild_boss_award.all) do
		slot11 = getProxy(GuildProxy):getData()

		if GuildTask.New({
			id = slot7,
			isFetched = table.contains(slot1, slot7)
		}).getConfig(slot9, "type") == GuildTask.TYPE_DEMAGE then
			slot9:setProgress(slot11.totalDamage)
		elseif slot10 == GuildTask.TYPE_ATTACK_COUNT then
			slot9:setProgress(slot0.attackCount)
		end

		slot0.taskList[slot9.id] = slot9
	end
end

function slot0.reduceCount(slot0)
	slot0.count = slot0.count - 1
end

function slot0.getTasks(slot0)
	return slot0.taskList
end

function slot0.getTaskById(slot0, slot1)
	return slot0.taskList[slot1]
end

function slot0.updateTask(slot0, slot1)
	slot0.taskList[slot1.id] = slot1

	pg.m02:sendNotification(slot0.TASK_UPDATED, slot1)
end

function slot0.isEnd(slot0)
	slot1 = pg.TimeMgr.GetInstance():GetServerTime()

	if slot0.endTime > 0 and slot0.endTime < slot1 then
		return true
	end

	return false
end

function slot0.setMemberRankList(slot0, slot1)
	slot0.memberRankList = slot1
end

function slot0.getMemberRankList(slot0)
	if slot0.memberRankList then
		return slot0.memberRankList
	end

	return {}
end

function slot0.setMemberRank(slot0, slot1)
	slot0.memberRank = slot1
end

function slot0.getMemberRank(slot0)
	if slot0.memberRank then
		return slot0.memberRank
	end

	return 0
end

function slot0.setRankList(slot0, slot1)
	slot0.guildRankList = slot1
end

function slot0.getRankList(slot0)
	if slot0.guildRankList then
		return slot0.guildRankList
	end

	return {}
end

function slot0.setRank(slot0, slot1)
	slot0.rank = slot1
end

function slot0.getRank(slot0)
	if slot0.rank then
		return slot0.rank
	end

	return 0
end

function slot0.inGuildRank(slot0, slot1)
	if not slot0.guildRankList then
		return false
	end

	for slot5, slot6 in ipairs(slot0.guildRankList) do
		if slot1 == slot6.id then
			return true
		end
	end

	return false
end

return slot0
