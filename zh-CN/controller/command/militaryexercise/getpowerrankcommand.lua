slot1 = 100
slot2 = 5

class("GetPowerRankCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = slot1:getBody().activityId
	slot5 = getProxy(BillboardProxy)

	function slot6(slot0, slot1)
		slot0:setRankList(slot1, slot0.setRankList, slot0)
		slot0:setPlayerRankData(slot1, slot0.setPlayerRankData, slot1)
		slot0:sendNotification(GAME.GET_POWERRANK_DONE, {
			list = slot0,
			type = slot1,
			playerRankinfo = slot1,
			activityId = slot0.sendNotification
		})
	end

	if slot1.getBody().type == PowerRank.TYPE_MILITARY_RANK then
		pg.ConnectionMgr.GetInstance():Send(18006, {
			type = 0
		}, 18007, function (slot0)
			slot1 = {}

			for slot5, slot6 in ipairs(slot0.arena_rank_lsit) do
				slot7 = PowerRank.New(slot6, slot0)

				slot7:setRank(slot5)
				slot7:setArenaRank(SeasonInfo.getEmblem(slot6.score, slot5))
				table.insert(slot1, slot7)
			end

			slot2 = getProxy(PlayerProxy):getData()
			slot3 = getProxy(BayProxy):getShipById(slot2.character)
			slot4 = {
				id = slot2.id,
				level = slot2.level,
				name = slot2.name,
				score = slot2.score,
				arena_rank = SeasonInfo.getEmblem(slot2.score, slot2.rank),
				icon = slot3:getConfig("id"),
				skin_id = slot3.skinId,
				propose = (slot3.propose and 1) or 0,
				remoulded = (slot3:isRemoulded() and 1) or 0
			}
			slot5 = PowerRank.New(slot4, slot0)

			slot5:setRank(slot2.rank)
			slot1(slot1, slot5)
		end)
	else
		slot7 = {}

		function slot8(slot0, slot1)
			if #slot0 < (slot0 - 1) * slot1 / #slot0 then
				slot1()

				return
			end

			pg.ConnectionMgr.GetInstance().Send(slot3, slot4, {
				page = slot0,
				type = slot3,
				act_id = 18201 or 0
			}, 18202, function (slot0)
				for slot4, slot5 in ipairs(slot0.list) do
					table.insert(slot1, PowerRank.New(slot5, slot0))
				end

				slot2()
			end)
		end

		slot9 = nil

		function slot10(slot0)
			slot1(pg.ConnectionMgr.GetInstance(), 18203, {
				type = slot0,
				act_id = pg.ConnectionMgr.GetInstance().Send or 0
			}, 18204, function (slot0)
				slot2 = getProxy(BayProxy):getShipById(getProxy(PlayerProxy):getData().character)
				slot3 = nil

				if slot0 == PowerRank.TYPE_POWER then
					slot3 = getProxy(BayProxy):getBayPower()
				elseif slot0 == PowerRank.TYPE_COLLECTION then
					slot3 = getProxy(CollectionProxy):getCollectionCount()
				elseif slot0 == PowerRank.TYPE_PT then
					slot3 = (getProxy(ActivityProxy):getActivityById(slot1) and slot4.data1) or slot0.point
				elseif slot0 == PowerRank.TYPE_CHALLENGE then
					slot3 = (slot4 and PowerRank:getActivityByRankType(PowerRank.TYPE_CHALLENGE) and getProxy(ChallengeProxy):getChallengeInfo():getGradeList().seasonMaxScore) or slot0.point
				elseif slot0 == PowerRank.TYPE_EXTRA_CHAPTER then
					slot3 = (PowerRank:getActivityByRankType(PowerRank.TYPE_EXTRA_CHAPTER) and slot4.data1) or slot0.point
				else
					slot3 = slot0.point
				end

				slot4 = {
					user_id = slot1.id,
					point = slot3,
					name = slot1.name,
					lv = slot1.level,
					arena_rank = slot1.maxRank,
					icon = slot2:getConfig("id"),
					skin_id = slot2.skinId,
					propose = (slot2.propose and 1) or 0,
					remoulded = (slot2:isRemoulded() and 1) or 0
				}

				slot2:setRank(slot0.rank)
				slot3()
			end)
		end

		slot11 = {}

		for slot15 = 1, slot1, 1 do
			table.insert(slot11, function (slot0)
				slot0(slot0, slot0)
			end)
		end

		table.insert(slot11, function (slot0)
			slot0(slot0)
		end)
		seriesAsync(slot11, function ()
			if #slot0 > 0 and slot1 then
				slot1 = 1

				for slot5, slot6 in ipairs(slot0) do
					if slot6.power < slot0 then
						slot1 = slot1 + 1
					end

					slot6:setRank(slot1)

					slot0 = slot6.power
				end
			end

			slot2(slot2, )
		end)
	end
end

return class("GetPowerRankCommand", pm.SimpleCommand)
