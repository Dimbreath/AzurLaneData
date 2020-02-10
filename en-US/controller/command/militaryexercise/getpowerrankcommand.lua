slot0 = class("GetPowerRankCommand", pm.SimpleCommand)
slot1 = 100
slot2 = 5

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = slot2.activityId
	slot5 = getProxy(BillboardProxy)

	function slot6(slot0, slot1)
		uv0:setRankList(uv1, uv2, slot0)
		uv0:setPlayerRankData(uv1, uv2, slot1)

		slot5.list = slot0
		slot5.type = uv1
		slot5.playerRankinfo = slot1
		slot5.activityId = uv2

		uv3:sendNotification(GAME.GET_POWERRANK_DONE, {})
	end

	if slot2.type == PowerRank.TYPE_MILITARY_RANK then
		pg.ConnectionMgr.GetInstance():Send(18006, {
			type = 0
		}, 18007, function (slot0)
			for slot5, slot6 in ipairs(slot0.arena_rank_lsit) do
				slot7 = PowerRank.New(slot6, uv0)

				slot7:setRank(slot5)
				slot7:setArenaRank(SeasonInfo.getEmblem(slot6.score, slot5))
				table.insert({}, slot7)
			end

			slot2 = getProxy(PlayerProxy):getData()
			slot3 = getProxy(BayProxy):getShipById(slot2.character)
			slot4.id = slot2.id
			slot4.level = slot2.level
			slot4.name = slot2.name
			slot4.score = slot2.score
			slot4.arena_rank = SeasonInfo.getEmblem(slot2.score, slot2.rank)
			slot4.icon = slot3:getConfig("id")
			slot4.skin_id = slot3.skinId
			slot4.propose = slot3.propose and 1 or 0
			slot4.remoulded = slot3:isRemoulded() and 1 or 0
			slot5 = PowerRank.New({}, uv0)

			slot5:setRank(slot2.rank)
			uv1(slot1, slot5)
		end)
	else
		slot7 = {}

		function slot8(slot0, slot1)
			if #uv0 < (slot0 - 1) * uv1 / uv2 then
				slot1()

				return
			end

			slot2 = pg.ConnectionMgr.GetInstance()
			slot5.page = slot0
			slot5.type = uv3
			slot5.act_id = uv4 or 0

			slot2.Send(slot2, 18201, {}, 18202, function (slot0)
				for slot4, slot5 in ipairs(slot0.list) do
					table.insert(uv1, PowerRank.New(slot5, uv0))
				end

				uv2()
			end)
		end

		slot9 = nil

		function slot10(slot0)
			slot1 = pg.ConnectionMgr.GetInstance()
			slot4.type = uv0
			slot4.act_id = uv1 or 0

			slot1.Send(slot1, 18203, {}, 18204, function (slot0)
				slot2 = getProxy(BayProxy):getShipById(getProxy(PlayerProxy):getData().character)
				slot3 = nil
				slot4.user_id = slot1.id
				slot4.point = (uv0 ~= PowerRank.TYPE_POWER or getProxy(BayProxy):getBayPower()) and (uv0 ~= PowerRank.TYPE_COLLECTION or getProxy(CollectionProxy):getCollectionCount()) and (uv0 == PowerRank.TYPE_PT and (getProxy(ActivityProxy):getActivityById(uv1) and slot4.data1 or slot0.point) or uv0 == PowerRank.TYPE_CHALLENGE and (slot4 and PowerRank:getActivityByRankType(PowerRank.TYPE_CHALLENGE) and getProxy(ChallengeProxy):getChallengeInfo():getGradeList().seasonMaxScore or slot0.point) or uv0 == PowerRank.TYPE_EXTRA_CHAPTER and (PowerRank:getActivityByRankType(PowerRank.TYPE_EXTRA_CHAPTER) and slot4.data1 or slot0.point) or slot0.point)
				slot4.name = slot1.name
				slot4.lv = slot1.level
				slot4.arena_rank = slot1.maxRank
				slot4.icon = slot2:getConfig("id")
				slot4.skin_id = slot2.skinId
				slot4.propose = slot2.propose and 1 or 0
				slot4.remoulded = slot2:isRemoulded() and 1 or 0
				uv2 = PowerRank.New({}, uv0)

				uv2:setRank(slot0.rank)
				uv3()
			end)
		end

		for slot15 = 1, uv1, 1 do
			table.insert({}, function (slot0)
				uv0(uv1, slot0)
			end)
		end

		table.insert(slot11, function (slot0)
			uv0(slot0)
		end)
		seriesAsync(slot11, function ()
			if #uv0 > 0 and uv1 then
				for slot5, slot6 in ipairs(uv0) do
					if slot6.power < 0 then
						slot1 = 1 + 1
					end

					slot6:setRank(slot1)

					slot0 = slot6.power
				end
			end

			uv2(uv0, uv1)
		end)
	end
end

return slot0
