slot0 = class("MilitaryExerciseProxy", import(".NetProxy"))
slot0.SEASON_INFO_ADDED = "MilitaryExerciseProxy SEASON_INFO_ADDED"
slot0.SEASON_INFO_UPDATED = "MilitaryExerciseProxy SEASON_INFO_UPDATED"
slot0.ARENARANK_UPDATED = "MilitaryExerciseProxy ARENARANK_UPDATED"
slot0.EXERCISE_FLEET_UPDATED = "MilitaryExerciseProxy EXERCISE_FLEET_UPDATED"
slot0.RIVALS_UPDATED = "MilitaryExerciseProxy RIVALS_UPDATED"

slot0.register = function (slot0)
	slot0:on(18005, function (slot0)
		slot1 = {}

		for slot5, slot6 in ipairs(slot0.target_list) do
			table.insert(slot1, Rival.New(slot6))
		end

		slot2 = slot0:getSeasonInfo()

		slot2:updateScore(slot0.score + SeasonInfo.INIT_POINT)
		slot2:updateRank(slot0.rank)
		slot2:updateRivals(slot1)
		slot0:updateSeasonInfo(slot2)

		slot3 = getProxy(PlayerProxy)
		slot4 = slot3:getData()

		slot4:updateScoreAndRank(slot2.score, slot2.rank)
		slot3:updatePlayer(slot4)
	end)
end

slot0.addSeasonInfo = function (slot0, slot1)
	slot0.seasonInfo = slot1

	slot0:sendNotification(slot0.SEASON_INFO_ADDED, slot1:clone())
	slot0:addRefreshCountTimer()
end

slot0.addRefreshCountTimer = function (slot0)
	slot0:removeRefreshTimer()

	function slot1()
		slot0:sendNotification(GAME.EXERCISE_COUNT_RECOVER_UP)
	end

	if slot0.seasonInfo.resetTime - pg.TimeMgr.GetInstance():GetServerTime() > 0 then
		slot0.refreshCountTimer = Timer.New(function ()
			slot0()
		end, slot2, 1)

		slot0.refreshCountTimer:Start()
	else
		slot1()
	end
end

slot0.addSeasonOverTimer = function (slot0)
	slot0:removeSeasonOverTimer()

	if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_MILITARY_EXERCISE) and not slot2:isEnd() then
		function slot3()
			slot0:sendNotification(GAME.GET_SEASON_INFO)
			slot0.sendNotification:removeSeasonOverTimer()

			slot0 = slot0.sendNotification.removeSeasonOverTimer:getSeasonInfo()

			slot0:setExerciseCount(SeasonInfo.RECOVER_UP_COUNT)
			slot0:updateSeasonInfo(slot0)
		end

		if slot2.stopTime - pg.TimeMgr.GetInstance():GetServerTime() > 0 then
			slot0.SeasonOverTimer = Timer.New(function ()
				slot0()
			end, slot5, 1)

			slot0.SeasonOverTimer:Start()
		else
			slot3()
		end
	end
end

slot0.removeRefreshTimer = function (slot0)
	if slot0.refreshCountTimer then
		slot0.refreshCountTimer:Stop()

		slot0.refreshCountTimer = nil
	end
end

slot0.removeSeasonOverTimer = function (slot0)
	if slot0.SeasonOverTimer then
		slot0.SeasonOverTimer:Stop()

		slot0.SeasonOverTimer = nil
	end
end

slot0.remove = function (slot0)
	slot0:removeRefreshTimer()
	slot0:removeSeasonOverTimer()
end

slot0.updateSeasonInfo = function (slot0, slot1)
	slot0.seasonInfo = slot1

	slot0:sendNotification(slot0.SEASON_INFO_UPDATED, slot1:clone())
end

slot0.getSeasonInfo = function (slot0)
	return Clone(slot0.seasonInfo)
end

slot0.updateRivals = function (slot0, slot1)
	slot0.seasonInfo:updateRivals(slot1)
	slot0:sendNotification(slot0.RIVALS_UPDATED, Clone(slot1))
end

slot0.getRivals = function (slot0)
	return Clone(slot0.seasonInfo.rivals)
end

slot0.getRivalById = function (slot0, slot1)
	for slot5, slot6 in ipairs(slot0:getRivals()) do
		if slot6.id == slot1 then
			return slot6
		end
	end
end

slot0.getPreRivalById = function (slot0, slot1)
	for slot5, slot6 in ipairs(slot0.seasonInfo.preRivals) do
		if slot6.id == slot1 then
			return Clone(slot6)
		end
	end
end

slot0.getExerciseFleet = function (slot0)
	return Clone(slot0.seasonInfo.fleet)
end

slot0.updateExerciseFleet = function (slot0, slot1)
	slot0.seasonInfo:updateFleet(slot1)
	slot0:sendNotification(slot0.EXERCISE_FLEET_UPDATED, slot1:clone())
end

slot0.increaseExerciseCount = function (slot0)
	slot0.seasonInfo:increaseExerciseCount()
end

slot0.reduceExerciseCount = function (slot0)
	slot0.seasonInfo:reduceExerciseCount()
end

slot0.updateArenaRankLsit = function (slot0, slot1)
	slot0.arenaRankLsit = slot1

	slot0:sendNotification(slot0.ARENARANK_UPDATED, Clone(slot1))
end

slot0.getArenaRankList = function (slot0)
	return slot0.arenaRankLsit
end

slot0.getData = function (slot0)
	return Clone(slot0.seasonInfo)
end

slot0.buildRankMsg = function (slot0)
	slot0.rankMsgList = {}
	slot0.rankMsgInfo = {}
	slot1 = getProxy(ActivityProxy)

	for slot5, slot6 in ipairs(slot0.RANK_TYPE_LIST) do
		slot8 = nil

		if slot0.RANK_TYPE_LIST[slot6].act_type then
			for slot12, slot13 in ipairs(slot8) do
				slot0.rankMsgInfo[slot13.id] = {
					type = slot7.type,
					act_id = slot13.id,
					medal_small = slot7.medal_small
				}

				table.insert(slot0.rankMsgList, slot13.id)
			end
		else
			slot0.rankMsgInfo[slot7.type] = {
				type = slot7.type,
				medal_small = slot7.medal_small
			}

			table.insert(slot0.rankMsgList, slot7.type)
		end
	end
end

slot0.getRankMsgId = function (slot0, slot1, slot2)
	for slot6, slot7 in ipairs(slot0.rankMsgList) do
		if slot0.rankMsgInfo[slot7].type == slot1 and (not slot2 or slot2 == slot8.act_id) then
			return slot2 or slot1
		end
	end

	return nil
end

return slot0
