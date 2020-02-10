slot0 = class("ZeroHourCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	getProxy(PlayerProxy):getData():resetBuyOilCount()

	for slot7, slot8 in pairs(slot3.vipCards) do
		if slot8:isExpire() then
			slot3.vipCards[slot8.id] = nil
		end
	end

	slot2:updatePlayer(slot3)
	getProxy(EventProxy):resetFlushTimes()

	slot5 = getProxy(ShopsProxy)

	if slot5:getShopStreet() then
		slot6:resetflashCount()
		slot5:setShopStreet(slot6)
	end

	getProxy(CollectionProxy):resetEvaCount()

	slot8 = getProxy(MilitaryExerciseProxy)
	slot9 = slot8:getSeasonInfo()

	slot9:resetFlashCount()
	slot8:updateSeasonInfo(slot9)
	getProxy(DailyLevelProxy):resetDailyCount()

	slot11 = getProxy(ChapterProxy)

	slot11:resetRepairTimes()
	slot11:resetShamChapter()
	slot11:resetEscortChallengeTimes()

	for slot16, slot17 in pairs(slot11:getData()) do
		if slot17.todayDefeatCount > 0 then
			slot17.todayDefeatCount = 0

			slot11:updateChapter(slot17)
		end
	end

	getProxy(DailyLevelProxy):clearChaptersDefeatCount()

	slot13 = pg.TimeMgr.GetInstance()

	if slot13:STimeDescS(pg.TimeMgr.GetInstance():GetServerTime(), "*t").day == 1 and not ChapterConst.ActivateMirror then
		slot15 = slot11:getShamChapter()
		slot15.simId = slot13.month

		slot11:updateShamChapter(slot15)
	end

	if slot13.day == 1 then
		slot5.shamShop:update(slot13.month, {})
		slot5:updateShamShop(slot5.shamShop)
		slot5.fragmentShop:update(slot13.month, {})
		slot5:updateFragmentShop(slot5.fragmentShop)
	end

	slot14 = getProxy(ActivityProxy)

	for slot18, slot19 in ipairs(slot14:getPanelActivities()) do
		if function ()
			slot0 = {
				ActivityConst.ACTIVITY_TYPE_7DAYSLOGIN,
				ActivityConst.ACTIVITY_TYPE_PROGRESSLOGIN,
				ActivityConst.ACTIVITY_TYPE_MONTHSIGN,
				ActivityConst.ACTIVITY_TYPE_REFLUX,
				ActivityConst.ACTIVITY_TYPE_HITMONSTERNIAN,
				ActivityConst.ACTIVITY_TYPE_BB,
				ActivityConst.ACTIVITY_TYPE_LOTTERY_AWARD
			}
			uv0.autoActionForbidden = false

			if uv0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_BB then
				uv0.data2 = 0
			elseif uv0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_LOTTERY_AWARD then
				uv0.data2 = 0
			end

			return table.contains(slot0, uv0:getConfig("type"))
		end() then
			slot14:updateActivity(slot19)
		end
	end

	if slot14:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX) and not slot15:isEnd() then
		slot16[1] = {}
		slot15.data1KeyValueList = {}

		slot14:updateActivity(slot15)
	end

	if slot14:getActivityByType(ActivityConst.ACTIVITY_TYPE_TURNTABLE) and not slot16:isEnd() then
		if pg.activity_event_turning[slot16:getConfig("config_id")].total_num <= slot16.data3 then
			return
		end

		slot21 = getProxy(TaskProxy)

		for slot25, slot26 in ipairs(slot18.task_table[slot16.data4]) do
			if slot21:getTaskById(slot26) or slot21:getFinishTaskById(slot26):getTaskStatus() ~= 2 then
				return
			end
		end

		slot25.activity_id = slot16.id

		slot0:sendNotification(GAME.ACTIVITY_OPERATION, {
			cmd = 2
		})
	end

	slot17 = getProxy(VoteProxy)

	if slot17:getVoteGroup() then
		slot17.votes = 0

		slot17:updateVoteGroup(slot18)
	end

	slot19 = getProxy(GuildProxy)

	if slot19:getData() then
		slot20:resetGuildContributeFlag()
		slot19:updateGuild(slot20)
	end

	slot0:sendNotification(GAME.CLASS_FORCE_UPDATE)
	getProxy(TechnologyProxy):updateRefreshFlag(0)
	PlayerPrefs.SetInt("stop_remind_operation", 0)
	PlayerPrefs.Save()

	slot22 = getProxy(TaskProxy)
	slot23 = getProxy(ActivityProxy)

	_.each(slot23:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_TASK_LIST), function (slot0)
		if slot0 and not slot0:isEnd() and slot0:getConfig("config_id") == 3 then
			slot1 = slot0:getConfig("config_data")
			slot2 = pg.TimeMgr.GetInstance()

			if slot0.data1 < slot2:GetServerTime() then
				if slot0.data3 ~= 0 and slot4 < math.clamp(slot2:DiffDay(slot0.data1, slot2:GetServerTime()) + 1, 1, #slot1) then
					slot7[1] = slot1[slot4]

					if _.all(_.flatten({}), function (slot0)
						return uv0:getFinishTaskById(slot0) ~= nil
					end) then
						slot8.activity_id = slot0.id

						pg.m02:sendNotification(GAME.ACTIVITY_OPERATION, {
							cmd = 1
						})
					end
				end
			end
		end
	end)

	slot25 = getProxy(CommanderProxy)

	slot25:resetBoxUseCnt()

	if slot23:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE) and not slot25:isEnd() then
		slot25.data1KeyValueList = {}

		slot23:updateActivity(slot25)
	end

	if slot23:getActivityByType(ActivityConst.ACTIVITY_TYPE_MONOPOLY) and not slot26:isEnd() then
		slot23:updateActivity(slot26)
	end

	slot27 = getProxy(ActivityProxy)

	if slot27:getActivityByType(ActivityConst.ACTIVITY_TYPE_CHALLENGE) and not slot27:isEnd() then
		slot0:sendNotification(GAME.CHALLENGE2_INFO, {})
	end

	slot31.type = MiniGameRequestCommand.REQUEST_HUB_DATA

	slot0:sendNotification(GAME.REQUEST_MINI_GAME, {})

	if slot23:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2) and not slot28:isEnd() then
		slot29 = slot28.data1KeyValueList[1]

		if pg.activity_event_worldboss[slot28:getConfig("config_id")] then
			for slot34, slot35 in ipairs(slot30.normal_expedition_drop_num or {}) do
				for slot39, slot40 in ipairs(slot35[1]) do
					slot29[slot40] = slot35[2] or 0
				end
			end
		end

		slot23:updateActivity(slot28)
	end
end

return slot0
