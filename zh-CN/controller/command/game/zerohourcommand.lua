slot0 = class("ZeroHourCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot3 = getProxy(PlayerProxy):getData()

	slot3:resetBuyOilCount()

	for slot7, slot8 in pairs(slot3.vipCards) do
		if slot8:isExpire() then
			slot3.vipCards[slot8.id] = nil
		end
	end

	slot2:updatePlayer(slot3)

	if getProxy(ShopsProxy):getShopStreet() then
		slot5:resetflashCount()
		slot4:setShopStreet(slot5)
	end

	getProxy(CollectionProxy):resetEvaCount()

	slot7 = getProxy(MilitaryExerciseProxy)
	slot8 = slot7:getSeasonInfo()

	slot8:resetFlashCount()
	slot7:updateSeasonInfo(slot8)
	getProxy(DailyLevelProxy):resetDailyCount()

	slot10 = getProxy(ChapterProxy)

	slot10:resetRepairTimes()
	slot10:resetEscortChallengeTimes()

	for slot15, slot16 in pairs(slot10:getData()) do
		if slot16.todayDefeatCount > 0 then
			slot16.todayDefeatCount = 0

			slot10:updateChapter(slot16)
		end
	end

	getProxy(DailyLevelProxy):clearChaptersDefeatCount()

	if pg.TimeMgr.GetInstance():STimeDescS(pg.TimeMgr.GetInstance():GetServerTime(), "*t").day == 1 then
		slot4.shamShop:update(slot12.month, {})
		slot4:AddShamShop(slot4.shamShop)
		slot4.fragmentShop:update(slot12.month, {})
		slot4:AddFragmentShop(slot4.fragmentShop)
	end

	for slot17, slot18 in ipairs(getProxy(ActivityProxy):getPanelActivities()) do
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
			slot13:updateActivity(slot18)
		end
	end

	if slot13:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX) and not slot14:isEnd() then
		slot14.data1KeyValueList = {
			{}
		}

		slot13:updateActivity(slot14)
	end

	if slot13:getActivityByType(ActivityConst.ACTIVITY_TYPE_TURNTABLE) and not slot15:isEnd() then
		if pg.activity_event_turning[slot15:getConfig("config_id")].total_num <= slot15.data3 then
			return
		end

		if not slot17.task_table[slot15.data4] then
			return
		end

		slot20 = getProxy(TaskProxy)

		for slot24, slot25 in ipairs(slot19) do
			if (slot20:getTaskById(slot25) or slot20:getFinishTaskById(slot25)):getTaskStatus() ~= 2 then
				return
			end
		end

		slot0:sendNotification(GAME.ACTIVITY_OPERATION, {
			cmd = 2,
			activity_id = slot15.id
		})
	end

	if getProxy(VoteProxy):getVoteGroup() then
		slot16.votes = 0

		slot16:updateVoteGroup(slot17)
	end

	if getProxy(GuildProxy):getData() then
		slot19:resetGuildContributeFlag()
		slot18:updateGuild(slot19)
	end

	slot20 = getProxy(NavalAcademyProxy)

	slot20:setCourse(slot20.course)
	slot0:sendNotification(GAME.CLASS_FORCE_UPDATE)
	getProxy(TechnologyProxy):updateRefreshFlag(0)
	PlayerPrefs.SetInt("stop_remind_operation", 0)
	PlayerPrefs.Save()

	slot22 = getProxy(TaskProxy)
	slot23 = getProxy(ActivityProxy)

	_.each(slot23:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_TASK_LIST), function (slot0)
		if slot0 and not slot0:isEnd() and slot0:getConfig("config_id") == 3 then
			slot1 = slot0:getConfig("config_data")

			if slot0.data1 < pg.TimeMgr.GetInstance():GetServerTime() then
				if slot0.data3 == 0 or slot4 < math.clamp(slot2:DiffDay(slot0.data1, slot2:GetServerTime()) + 1, 1, #slot1) and _.all(_.flatten({
					slot1[slot4]
				}), function (slot0)
					return uv0:getFinishTaskById(slot0) ~= nil
				end) then
					pg.m02:sendNotification(GAME.ACTIVITY_OPERATION, {
						cmd = 1,
						activity_id = slot0.id
					})
				end
			end
		end
	end)
	getProxy(CommanderProxy):resetBoxUseCnt()

	if slot23:getActivityByType(ActivityConst.ACTIVITY_TYPE_MONOPOLY) and not slot25:isEnd() then
		slot23:updateActivity(slot25)
	end

	if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_CHALLENGE) and not slot26:isEnd() then
		slot0:sendNotification(GAME.CHALLENGE2_INFO, {})
	end

	slot0:sendNotification(GAME.REQUEST_MINI_GAME, {
		type = MiniGameRequestCommand.REQUEST_HUB_DATA
	})

	if slot23:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2) and not slot27:isEnd() then
		slot28 = slot27.data1KeyValueList[1]

		if pg.activity_event_worldboss[slot27:getConfig("config_id")] then
			for slot33, slot34 in ipairs(slot29.normal_expedition_drop_num or {}) do
				for slot38, slot39 in ipairs(slot34[1]) do
					slot28[slot39] = slot34[2] or 0
				end
			end
		end

		slot23:updateActivity(slot27)
	end
end

return slot0
