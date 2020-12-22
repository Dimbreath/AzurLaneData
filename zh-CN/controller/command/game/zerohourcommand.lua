slot0 = class("ZeroHourCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2, slot3 = pcall(slot0.mainHandler, slot0)

	if not slot2 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("zero_hour_command_error"))
		error(slot3)
	end
end

function slot0.mainHandler(slot0, slot1)
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

		if not LOCK_UR_SHIP then
			getProxy(BagProxy):ClearLimitCnt(pg.gameset.urpt_chapter_max.description[1])
		end
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

	slot18 = getProxy(NavalAcademyProxy)

	slot18:setCourse(slot18.course)
	slot0:sendNotification(GAME.CLASS_FORCE_UPDATE)
	getProxy(TechnologyProxy):updateRefreshFlag(0)
	slot0:sendNotification(GAME.ACCEPT_ACTIVITY_TASK)
	getProxy(CommanderProxy):resetBoxUseCnt()

	if slot13:getActivityByType(ActivityConst.ACTIVITY_TYPE_MONOPOLY) and not slot20:isEnd() then
		slot13:updateActivity(slot20)
	end

	if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_CHALLENGE) and not slot21:isEnd() then
		slot0:sendNotification(GAME.CHALLENGE2_INFO, {})
	end

	slot0:sendNotification(GAME.REQUEST_MINI_GAME, {
		type = MiniGameRequestCommand.REQUEST_HUB_DATA
	})

	slot22 = nowWorld

	if pg.TimeMgr.GetInstance():GetServerWeek() == 1 then
		slot22.staminaMgr.staminaExchangeTimes = 0
	end

	if slot22 then
		slot22:GetBossProxy():increasePt()

		if slot13:getActivityByType(ActivityConst.ACTIVITY_TYPE_WORLD_WORLDBOSS) and not slot25:isEnd() then
			slot26 = pg.gameset.joint_boss_ticket.description
			slot25.data1 = math.floor(slot26[1] * slot25.data1 / slot26[math.min(#slot26, slot25.data2 + 1)])
			slot25.data2 = 0

			slot13:updateActivity(slot25)
			nowWorld:GetBossProxy():UpdatedUnlockProgress()
		end
	end

	if slot13:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2) and not slot24:isEnd() then
		slot25 = slot24.data1KeyValueList[1]

		if pg.activity_event_worldboss[slot24:getConfig("config_id")] then
			for slot30, slot31 in ipairs(slot26.normal_expedition_drop_num or {}) do
				for slot35, slot36 in ipairs(slot31[1]) do
					slot25[slot36] = slot31[2] or 0
				end
			end
		end

		slot13:updateActivity(slot24)
	end

	if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_COLLECTION_EVENT) and not slot26:isEnd() then
		slot27, slot28 = getProxy(EventProxy):GetEventByActivityId(slot26.id)

		if not slot27 or slot27 and not slot27:IsStarting() then
			if slot27 and slot28 then
				table.remove(getProxy(EventProxy).eventList, slot28)
			end

			slot29 = slot26:getConfig("config_data")
			slot30 = slot26:getDayIndex()

			print("zero time collection--------------", slot30)

			if slot30 > 0 and slot30 <= #slot29 then
				getProxy(EventProxy):AddActivityEvent(EventInfo.New({
					finish_time = 0,
					over_time = 0,
					id = slot29[slot30],
					ship_id_list = {},
					activity_id = slot26.id
				}))
			end

			pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inEvent")
			slot0:sendNotification(GAME.EVENT_LIST_UPDATE)
		end
	end

	if getProxy(GuildProxy):getRawData() then
		slot27.shouldRefreshDonateList = true

		slot28:ResetTechCancelCnt()

		if slot28:getWeeklyTask() and slot29:isExpire() then
			getProxy(TaskProxy):removeTaskById(slot29:GetPresonTaskId())

			slot28.weeklyTaskFlag = 0
		end

		slot28.donateCount = 0

		if slot28:GetActiveEvent() then
			slot30:GetBossMission():ResetDailyCnt()
		end

		slot27:updateGuild(slot28)
	end

	slot0:sendNotification(GAME.ZERO_HOUR_OP_DONE)
end

return slot0
