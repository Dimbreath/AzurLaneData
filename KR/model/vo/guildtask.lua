slot0 = class("GuildTask", import(".BaseVO"))
slot0.TYPE_DEMAGE = 1
slot0.TYPE_ATTACK_COUNT = 2

slot0.Ctor = function (slot0, slot1)
	slot0.id = slot1.id
	slot0.configId = slot0.id
	slot0.progress = slot1.progress or 0
	slot0.isFetched = slot1.isFetched or false
end

slot0.setProgress = function (slot0, slot1)
	slot0.progress = slot1 or 1
end

slot0.isActive = function (slot0)
	return
end

slot0.isFinish = function (slot0)
	return slot0.progress == slot0:getConfig("target_num")
end

slot0.hasFetched = function (slot0)
	return slot0.isFetched
end

slot0.setFetched = function (slot0)
	slot0.isFetched = true
end

slot0.getProgress = function (slot0)
	return slot0.progress
end

slot0.getMaxProgress = function (slot0)
	return
end

slot0.bindConfigTable = function (slot0)
	return pg.guild_boss_award
end

return slot0
