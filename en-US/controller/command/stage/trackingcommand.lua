slot0 = class("TrackingCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = slot2.fleetIds
	slot5 = slot2.operationItem or 0
	slot6 = slot2.loopFlag or 0
	slot7 = getProxy(ChapterProxy)
	slot8 = slot7:getChapterById(slot2.chapterId)
	slot9 = slot7:getMapById(slot8:getConfig("map"))

	if slot8.active then
		pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_strategying"))

		return
	end

	if slot9:getMapType() == Map.ESCORT and slot7:getMaxEscortChallengeTimes() <= slot7.escortChallengeTimes then
		pg.TipsMgr.GetInstance():ShowTips(i18n("escort_less_count_to_combat"))

		return
	end

	slot11 = getProxy(BayProxy):getRawData()

	if not getProxy(PlayerProxy):getData():isEnough({
		oil = slot8:getConfig("oil")
	}) then
		if not ItemTipPanel.ShowOilBuyTip(slot12) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))
		end

		return
	end

	if slot9:getMapType() == Map.ELITE and not getProxy(DailyLevelProxy):IsEliteEnabled() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_elite_no_quota"))

		return
	end

	slot16 = slot8:getConfig("map")
	slot18 = slot8:getEliteFleetCommanders()
	slot19 = {}

	for slot23, slot24 in ipairs(slot8:getEliteFleetList()) do
		if slot8:singleEliteFleetVertify(slot23) then
			slot25 = {}
			slot26 = {}
			slot27 = {}

			for slot31, slot32 in ipairs(slot24) do
				slot26[#slot26 + 1] = slot32
			end

			for slot32, slot33 in pairs(slot18[slot23]) do
				table.insert(slot27, {
					pos = slot32,
					id = slot33
				})
			end

			slot25.map_id = slot16
			slot25.main_id = slot26
			slot25.commanders = slot27
			slot19[#slot19 + 1] = slot25
		else
			slot19[#slot19 + 1] = {
				main_id = {},
				commanders = {}
			}
		end
	end

	pg.ConnectionMgr.GetInstance():Send(13101, {
		id = slot3,
		group_id_list = slot4,
		elite_fleet_list = slot19,
		operation_item = slot5,
		loop_flag = slot6
	}, 13102, function (slot0)
		if slot0.result == 0 then
			uv0:update(slot0.current_chapter)
			uv1:consume({
				oil = uv2 * uv0:GetExtraCostRate()
			})
			uv3:updatePlayer(uv1)

			if uv4 ~= 0 then
				getProxy(BagProxy):removeItemById(uv4, 1)
			end

			for slot4, slot5 in pairs(uv0.cells) do
				if ChapterConst.NeedMarkAsLurk(slot5) then
					slot5.trait = ChapterConst.TraitLurk
				end
			end

			for slot4, slot5 in ipairs(uv0.champions) do
				slot5.trait = ChapterConst.TraitLurk
			end

			uv5:updateChapter(uv0)

			if uv6:getMapType() == Map.ESCORT then
				slot1 = getProxy(ChapterProxy)
				slot1.escortChallengeTimes = slot1.escortChallengeTimes + 1
			end

			uv7:sendNotification(GAME.TRACKING_DONE, uv0)
			getProxy(ChapterProxy):updateExtraFlag(uv0, uv0.extraFlagList, {}, true)
		elseif slot0.result == 1 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_tracking_error_retry"))
			uv7:sendNotification(GAME.CHAPTER_OP, {
				type = ChapterConst.OpRetreat
			})
		elseif slot0.result == 3010 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_tracking_error_3001"))
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("levelScene_tracking_erro", slot0.result))
		end
	end)
end

return slot0
