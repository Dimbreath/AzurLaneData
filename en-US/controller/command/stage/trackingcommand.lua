slot0 = class("TrackingCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = slot2.fleetIds
	slot5 = slot2.operationItem or 0
	slot6 = slot2.loopFlag or 0

	if getProxy(ChapterProxy):getChapterById(slot2.chapterId).active then
		pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_strategying"))

		return
	end

	if slot8:getMapType() == Map.ESCORT and slot7:getMaxEscortChallengeTimes() <= slot7.escortChallengeTimes then
		pg.TipsMgr.GetInstance():ShowTips(i18n("escort_less_count_to_combat"))

		return
	end

	slot10 = getProxy(BayProxy):getRawData()
	slot16.oil = slot8:getConfig("oil")

	if not getProxy(PlayerProxy):getData():isEnough({}) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))

		return
	end

	if slot8:isEliteChapter() and not getProxy(DailyLevelProxy):IsEliteEnabled() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_elite_no_quota"))

		return
	end

	slot15 = slot8:getConfig("map")
	slot17 = slot8:getEliteFleetCommanders()
	slot18 = {}

	for slot22, slot23 in ipairs(slot8:getEliteFleetList()) do
		if slot8:singleEliteFleetVertify(slot22) then
			slot24 = {}
			slot25 = {}
			slot26 = {}
			slot27 = {}
			slot28 = {}

			for slot32, slot33 in ipairs(slot23) do
				if pg.ship_data_by_type[slot10[slot33]:getShipType()].team_type == TeamType.Vanguard then
					slot26[#slot26 + 1] = slot33
				elseif slot35 == TeamType.Main then
					slot25[#slot25 + 1] = slot33
				elseif slot35 == TeamType.Submarine then
					slot27[#slot27 + 1] = slot33
				end
			end

			for slot33, slot34 in pairs(slot17[slot22]) do
				slot37.pos = slot33
				slot37.id = slot34

				table.insert(slot28, {})
			end

			slot24.map_id = slot15
			slot24.main_id = slot25
			slot24.scout_id = slot26
			slot24.submarine_id = slot27
			slot24.commanders = slot28
			slot18[#slot18 + 1] = slot24
		else
			slot25.main_id = {}
			slot25.scout_id = {}
			slot25.submarine_id = {}
			slot25.commanders = {}
			slot18[#slot18 + 1] = {}
		end
	end

	PlayerPrefs.SetInt("extraOperationItemID", slot5)

	slot22.id = slot3
	slot22.group_id_list = slot4
	slot22.elite_fleet_list = slot18
	slot22.operation_item = slot5
	slot22.loop_flag = slot6

	pg.ConnectionMgr.GetInstance():Send(13101, {}, 13102, function (slot0)
		if slot0.result == 0 then
			slot3.oil = uv1

			uv0:consume({})
			uv2:updatePlayer(uv0)
			uv3:update(slot0.current_chapter)

			for slot4, slot5 in pairs(uv3.cells) do
				if ChapterConst.NeedMarkAsLurk(slot5) then
					slot5.trait = ChapterConst.TraitLurk
				end
			end

			for slot4, slot5 in ipairs(uv3.champions) do
				slot5.trait = ChapterConst.TraitLurk
			end

			uv4:updateChapter(uv3)

			if uv3:getMapType() == Map.ESCORT then
				slot1 = getProxy(ChapterProxy)
				slot1.escortChallengeTimes = slot1.escortChallengeTimes + 1
			end

			uv5:sendNotification(GAME.TRACKING_DONE, uv3)

			getProxy(ChapterProxy).extraFlagUpdate = true

			uv5:sendNotification(ChapterProxy.CHAPTER_EXTAR_FLAG_UPDATED, uv3.extraFlagList)
		elseif slot0.result == 1 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_tracking_error_retry"))

			slot4.type = ChapterConst.OpRetreat

			uv5:sendNotification(GAME.CHAPTER_OP, {})
		elseif slot0.result == 3010 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_tracking_error_3001"))
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("levelScene_tracking_erro", slot0.result))
		end
	end)
end

return slot0
