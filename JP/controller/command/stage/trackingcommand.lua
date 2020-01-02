class("TrackingCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()
	slot3 = slot2.chapterId
	slot4 = slot2.fleetIds
	slot5 = slot2.operationItem or 0
	slot6 = slot2.loopFlag or 0

	if getProxy(ChapterProxy).getChapterById(slot7, slot3).active then
		pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_strategying"))

		return
	end

	if slot8:getMapType() == Map.ESCORT and slot7:getMaxEscortChallengeTimes() <= slot7.escortChallengeTimes then
		pg.TipsMgr.GetInstance():ShowTips(i18n("escort_less_count_to_combat"))

		return
	end

	slot10 = getProxy(BayProxy).getRawData(slot9)

	if not getProxy(PlayerProxy).getData(slot12):isEnough({
		oil = slot8:getConfig("oil")
	}) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))

		return
	end

	slot14 = getProxy(DailyLevelProxy)

	if slot8:isEliteChapter() and not slot14:IsEliteEnabled() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_elite_no_quota"))

		return
	end

	slot15 = slot8:getConfig("map")
	slot17 = slot8:getEliteFleetCommanders()
	slot18 = {}

	for slot22, slot23 in ipairs(slot16) do
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

			for slot33, slot34 in pairs(slot29) do
				table.insert(slot28, {
					pos = slot33,
					id = slot34
				})
			end

			slot24.map_id = slot15
			slot24.main_id = slot25
			slot24.scout_id = slot26
			slot24.submarine_id = slot27
			slot24.commanders = slot28
			slot18[#slot18 + 1] = slot24
		else
			slot18[#slot18 + 1] = {
				main_id = {},
				scout_id = {},
				submarine_id = {},
				commanders = {}
			}
		end
	end

	PlayerPrefs.SetInt("extraOperationItemID", slot5)
	pg.ConnectionMgr.GetInstance():Send(13101, {
		id = slot3,
		group_id_list = slot4,
		elite_fleet_list = slot18,
		operation_item = slot5,
		loop_flag = slot6
	}, 13102, function (slot0)
		if slot0.result == 0 then
			slot0:consume({
				oil = slot0.consume
			})
			slot0:updatePlayer(slot0)
			slot3:update(slot0.current_chapter)

			for slot4, slot5 in pairs(slot3.cells) do
				if ChapterConst.NeedMarkAsLurk(slot5) then
					slot5.trait = ChapterConst.TraitLurk
				end
			end

			for slot4, slot5 in ipairs(slot3.champions) do
				slot5.trait = ChapterConst.TraitLurk
			end

			slot4:updateChapter(slot3)

			if slot3:getMapType() == Map.ESCORT then
				getProxy(ChapterProxy).escortChallengeTimes = getProxy(ChapterProxy).escortChallengeTimes + 1
			end

			slot5:sendNotification(GAME.TRACKING_DONE, )

			getProxy(ChapterProxy).extraFlagUpdate = true

			slot5:sendNotification(ChapterProxy.CHAPTER_EXTAR_FLAG_UPDATED, slot3.extraFlagList)
		elseif slot0.result == 1 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_tracking_error_retry"))
			slot5:sendNotification(GAME.CHAPTER_OP, {
				type = ChapterConst.OpRetreat
			})
		elseif slot0.result == 3010 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_tracking_error_3001"))
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("levelScene_tracking_erro", slot0.result))
		end
	end)
end

return class("TrackingCommand", pm.SimpleCommand)
