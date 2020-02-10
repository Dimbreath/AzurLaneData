function slot2.condition()
	slot0 = getProxy(TaskProxy)

	return slot0:getTaskById(10302) and slot0:isFinish() and not slot0:isReceive() and getProxy(FleetProxy):getFleetById(11):isEmpty()
end

function slot2.args()
	return _.any(getProxy(BayProxy):getShips(), function (slot0)
		return slot0 and slot0.configId == 308031
	end) and {} or {
		1
	}
end

slot1[1] = {
	id = "NG002"
}

function slot2.condition()
	slot0 = getProxy(ActivityProxy)
	slot2 = false

	if slot0:getActivityByType(ActivityConst.ACTIVITY_TYPE_GUIDE_TASKS) and not slot0:isEnd() then
		slot4 = getProxy(ChapterProxy)
		slot2 = slot4:getChapterById(slot0:getConfig("config_data")[1]) and slot4:isClear()
	end

	return slot1 and slot2
end

function slot2.args(slot0)
	return {}
end

slot1[2] = {
	id = "NG004"
}

function slot2.condition()
	return getProxy(PlayerProxy):getData().level >= 40
end

function slot2.args(slot0)
	return {}
end

slot1[3] = {
	id = "NG005"
}
slot0.MainUIMediator = {}

function slot2.condition()
	slot0 = getProxy(ChapterProxy)

	return slot0.subRefreshCount > 0 and getProxy(PlayerProxy):getData().level >= 20 and slot0:getChapterById(304):isClear()
end

function slot2.args(slot0)
	if getProxy(ChapterProxy):getActiveChapter() then
		slot5.type = ChapterConst.OpRetreat

		slot0:emit(LevelMediator2.ON_OP, {})
	end

	if slot0.contextData.map:isActivity() then
		slot0:emit(LevelMediator2.ON_SWITCH_NORMAL_MAP)
	end

	return {}
end

slot1[1] = {
	id = "NG001"
}

function slot2.condition()
	slot0 = getProxy(TaskProxy)

	return slot0:getTaskById(10302) and slot0:isFinish() and not slot0:isReceive() and getProxy(FleetProxy):getFleetById(11):isEmpty()
end

function slot2.args(slot0)
	if getProxy(ChapterProxy):getActiveChapter() then
		slot0:switchToMap()
	end

	return _.any(getProxy(BayProxy):getShips(), function (slot0)
		return slot0 and slot0.configId == 308031
	end) and {
		2
	} or {
		2,
		1
	}
end

slot1[2] = {
	id = "NG002"
}
slot0.LevelScene = {}

function slot2.condition()
	return true
end

function slot2.args()
	return {}
end

slot1[1] = {
	id = "NG0014"
}
slot0.ChallengeMainScene = {}

function slot2.condition()
	return true
end

function slot2.args()
	return {}
end

slot1[1] = {
	id = "NG0018"
}
slot0.InstagramLayer = {}

return {}
