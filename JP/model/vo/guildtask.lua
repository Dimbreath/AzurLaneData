slot0 = class("GuildTask", import(".BaseVO"))
slot0.TYPE_DEMAGE = 1
slot0.TYPE_ATTACK_COUNT = 2

function slot0.Ctor(slot0, slot1)
	slot0.id = slot1.id
	slot0.configId = slot0.id
	slot0.progress = slot1.progress or 0
	slot0.isFetched = slot1.isFetched or false
end

function slot0.setProgress(slot0, slot1)
	slot0.progress = slot1 or 1
end

function slot0.isActive(slot0)
	return
end

function slot0.isFinish(slot0)
	return slot0.progress == slot0:getConfig("target_num")
end

function slot0.hasFetched(slot0)
	return slot0.isFetched
end

function slot0.setFetched(slot0)
	slot0.isFetched = true
end

function slot0.getProgress(slot0)
	return slot0.progress
end

function slot0.getMaxProgress(slot0)
	return
end

function slot0.bindConfigTable(slot0)
	return pg.guild_boss_award
end

return slot0
