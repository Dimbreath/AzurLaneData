slot0 = class("ActivityProxy", import(".NetProxy"))
slot0.ACTIVITY_ADDED = "ActivityProxy ACTIVITY_ADDED"
slot0.ACTIVITY_UPDATED = "ActivityProxy ACTIVITY_UPDATED"
slot0.ACTIVITY_DELETED = "ActivityProxy ACTIVITY_DELETED"
slot0.ACTIVITY_OPERATION_DONE = "ActivityProxy ACTIVITY_OPERATION_DONE"
slot0.ACTIVITY_SHOW_AWARDS = "ActivityProxy ACTIVITY_SHOW_AWARDS"
slot0.ACTIVITY_SHOP_SHOW_AWARDS = "ActivityProxy ACTIVITY_SHOP_SHOW_AWARDS"
slot0.ACTIVITY_SHOW_BB_RESULT = "ActivityProxy ACTIVITY_SHOW_BB_RESULT"
slot0.ACTIVITY_LOTTERY_SHOW_AWARDS = "ActivityProxy ACTIVITY_LOTTERY_SHOW_AWARDS"
slot0.ACTIVITY_HITMONSTER_SHOW_AWARDS = "ActivityProxy ACTIVITY_HITMONSTER_SHOW_AWARDS"
slot0.ACTIVITY_SHOW_REFLUX_AWARDS = "ActivityProxy ACTIVITY_SHOW_REFLUX_AWARDS"
slot0.ACTIVITY_OPERATION_ERRO = "ActivityProxy ACTIVITY_OPERATION_ERRO"
slot0.ACTIVITY_SHOW_LOTTERY_AWARD_RESULT = "ActivityProxy ACTIVITY_SHOW_LOTTERY_AWARD_RESULT"
slot0.ACTIVITY_SHOW_RED_PACKET_AWARDS = "ActivityProxy ACTIVITY_SHOW_RED_PACKET_AWARDS"
slot0.ACTIVITY_PT_ID = 110

function slot0.register(slot0)
	slot0:on(11200, function (slot0)
		slot0.data = {}

		for slot4, slot5 in ipairs(slot0.activity_list) do
			if not pg.activity_template[slot5.id] then
				Debugger.LogError("活动acvitity_template不存在: " .. slot5.id)
			else
				if Activity.Create(slot5).getConfig(slot6, "type") == ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2 or slot7 == ActivityConst.ACTIVITY_TYPE_CHALLENGE then
					slot0:updateActivityFleet(slot5)
				end

				slot0.data[slot5.id] = slot6
			end
		end

		for slot4, slot5 in pairs(slot0.data) do
			slot0:sendNotification(GAME.ACTIVITY_BE_UPDATED, {
				isInit = true,
				activity = slot5
			})
		end

		if slot0.data[ActivityConst.MILITARY_EXERCISE_ACTIVITY_ID] then
			getProxy(MilitaryExerciseProxy):addSeasonOverTimer()
		end

		if ChapterConst.ActivateMirror then
			getProxy(ChapterProxy):checkMirrorCount()
		end

		if slot0:getActivityByType(ActivityConst.ACTIVITY_TYPE_CHALLENGE) and not slot1:isEnd() then
			slot0:sendNotification(GAME.CHALLENGE2_INFO, {})
		end

		if slot0:getActivityByType(ActivityConst.ACTIVITY_TYPE_TASK_LIST_MONITOR) and not slot2:isEnd() and slot2.data1 == 0 then
			slot0:monitorTaskList(slot2)
		end

		if slot0:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2) and not slot3:isEnd() then
			slot0:InitActivityBossData(slot0.data[slot3.id])
		end
	end)
	slot0:on(11201, function (slot0)
		if not slot0.data[Activity.Create(slot0.activity_info).id] then
			slot0:addActivity(slot1)
		else
			slot0:updateActivity(slot1)
		end

		if pg.activity_template[slot1.id].type == ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2 then
			slot0:updateActivityFleet(slot0.activity_info)
		end

		slot0:sendNotification(GAME.ACTIVITY_BE_UPDATED, {
			activity = slot1
		})
	end)

	slot0.requestTime = {}
end

function slot0.getActivityByType(slot0, slot1)
	slot2 = nil

	for slot6, slot7 in pairs(slot0.data) do
		if slot7:getConfig("type") == slot1 then
			slot2 = slot7

			break
		end
	end

	return slot2
end

function slot0.getActivitiesByType(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(slot0.data) do
		if slot7:getConfig("type") == slot1 then
			table.insert(slot2, slot7)
		end
	end

	return slot2
end

function slot0.getActivitiesByTypes(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(slot0.data) do
		if table.contains(slot1, slot7:getConfig("type")) then
			table.insert(slot2, slot7)
		end
	end

	return slot2
end

function slot0.getMilitaryExerciseActivity(slot0)
	slot1 = nil

	for slot5, slot6 in pairs(slot0.data) do
		if slot6:getConfig("type") == ActivityConst.ACTIVITY_TYPE_MILITARY_EXERCISE then
			slot1 = slot6

			break
		end
	end

	return Clone(slot1)
end

function slot0.getPanelActivities(slot0)
	return _(_.values(slot0.data)):chain():filter(function (slot0)
		slot1 = slot0:getConfig("type")

		if slot0:isShow() then
			if slot1 == ActivityConst.ACTIVITY_TYPE_CHARGEAWARD then
				slot2 = slot0.data2 == 0
			elseif slot1 == ActivityConst.ACTIVITY_TYPE_PROGRESSLOGIN then
				if slot0.data1 >= 7 then
					slot2 = not slot0.achieved

					if not slot0.achieved then
						slot2 = false

						if false then
							slot2 = true
						end
					end
				end
			else
				return (slot1 ~= ActivityConst.ACTIVITY_TYPE_DAILY_TASK or false) and not slot0:isEnd()
			end
		end
	end):sort(function (slot0, slot1)
		if slot0:getConfig("login_pop") == slot1:getConfig("login_pop") then
			return slot0.id < slot1.id
		else
			return slot3 < slot2
		end
	end):value()
end

function slot0.getBannerDisplays(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-20, warpins: 1 ---
	return _(pg.activity_banner.all):chain():map(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		return pg.activity_banner[slot0]
		--- END OF BLOCK #0 ---



	end):filter(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		return pg.TimeMgr.GetInstance():inTime(slot0.time)
		--- END OF BLOCK #0 ---



	end):value()
	--- END OF BLOCK #0 ---



end

function slot0.getNoticeBannerDisplays(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	return _.map(pg.activity_banner_notice.all, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		return pg.activity_banner_notice[slot0]
		--- END OF BLOCK #0 ---



	end)
	--- END OF BLOCK #0 ---



end

function slot0.findNextAutoActivity(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	slot1 = nil
	slot3 = pg.TimeMgr.GetInstance().GetServerTime(slot2)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 15-166, warpins: 0 ---
	for slot7, slot8 in ipairs(slot0:getPanelActivities()) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-19, warpins: 1 ---
		if slot8:isShow() and not slot8.autoActionForbidden then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 23-30, warpins: 1 ---
			if slot8:getConfig("type") == ActivityConst.ACTIVITY_TYPE_7DAYSLOGIN then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 31-42, warpins: 1 ---
				slot12 = #pg.activity_7_day_sign[slot8:getConfig("config_id")].front_drops + 1

				if slot8.getConfig("config_id") == 3 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 43-43, warpins: 1 ---
					slot12 = #slot11
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 44-46, warpins: 2 ---
				if slot8.data1 < slot12 and not slot2:IsSameDay(slot3, slot8.data2) then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 54-55, warpins: 1 ---
					slot1 = slot8

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 56-56, warpins: 1 ---
					break
					--- END OF BLOCK #1 ---

					FLOW; TARGET BLOCK #2



					-- Decompilation error in this vicinity:
					--- BLOCK #2 56-56, warpins: 0 ---
					--- END OF BLOCK #2 ---



				end
				--- END OF BLOCK #1 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 57-60, warpins: 1 ---
				if slot9 == ActivityConst.ACTIVITY_TYPE_PROGRESSLOGIN then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 61-67, warpins: 1 ---
					slot10 = getProxy(ChapterProxy)

					if (slot8.data1 < 7 and not slot2:IsSameDay(slot3, slot8.data2)) or (slot8.data1 == 7 and not slot8.achieved and slot10:isClear(204)) then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 87-88, warpins: 2 ---
						slot1 = slot8

						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 89-89, warpins: 2 ---
						break
						--- END OF BLOCK #1 ---

						FLOW; TARGET BLOCK #2



						-- Decompilation error in this vicinity:
						--- BLOCK #2 89-89, warpins: 0 ---
						--- END OF BLOCK #2 ---



					end
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 90-93, warpins: 1 ---
					if slot9 == ActivityConst.ACTIVITY_TYPE_MONTHSIGN then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 94-106, warpins: 1 ---
						if pg.TimeMgr.GetInstance():STimeDescS(slot3, "*t").year ~= slot8.data1 or slot10.month ~= slot8.data2 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 111-118, warpins: 2 ---
							slot8.data1 = slot10.year
							slot8.data2 = slot10.month
							slot8.data1_list = {}
							slot1 = slot8

							--- END OF BLOCK #0 ---

							FLOW; TARGET BLOCK #1



							-- Decompilation error in this vicinity:
							--- BLOCK #1 119-119, warpins: 2 ---
							break
							--- END OF BLOCK #1 ---

							FLOW; TARGET BLOCK #2



							-- Decompilation error in this vicinity:
							--- BLOCK #2 119-119, warpins: 0 ---
							--- END OF BLOCK #2 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 120-126, warpins: 1 ---
							if not table.contains(slot8.data1_list, slot10.day) then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 127-128, warpins: 1 ---
								slot1 = slot8

								--- END OF BLOCK #0 ---

								FLOW; TARGET BLOCK #1



								-- Decompilation error in this vicinity:
								--- BLOCK #1 129-129, warpins: 1 ---
								break
								--- END OF BLOCK #1 ---

								FLOW; TARGET BLOCK #2



								-- Decompilation error in this vicinity:
								--- BLOCK #2 129-129, warpins: 0 ---
								--- END OF BLOCK #2 ---



							end
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 130-134, warpins: 1 ---
						if slot8.id == ActivityConst.SHADOW_PLAY_ID and slot8.clientData1 == 0 and (getProxy(TaskProxy):getTaskById(slot8:getConfig("config_data")[1]) or slot11:getFinishTaskById(slot10)) and not slot12:isReceive() then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 163-164, warpins: 1 ---
							slot1 = slot8

							--- END OF BLOCK #0 ---

							FLOW; TARGET BLOCK #1



							-- Decompilation error in this vicinity:
							--- BLOCK #1 165-165, warpins: 1 ---
							break
							--- END OF BLOCK #1 ---



						end
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 165-166, warpins: 17 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 167-167, warpins: 6 ---
	return slot1
	--- END OF BLOCK #2 ---



end

function slot0.findRefluxAutoActivity(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	if slot0:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX) and not slot1:isEnd() and not slot1.autoActionForbidden then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-27, warpins: 1 ---
		slot2 = pg.TimeMgr.GetInstance()

		if slot1.data1_list[2] < #pg.return_sign_template.all and not slot2:IsSameDay(slot2:GetServerTime(), slot1.data1_list[1]) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 38-39, warpins: 1 ---
			return 1
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 40-40, warpins: 6 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.existRefluxAwards(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	if slot0:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX) and not slot1:isEnd() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-19, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 20-32, warpins: 0 ---
		for slot6 = #pg.return_pt_template.all, 1, -1 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 20-26, warpins: 2 ---
			if slot2[slot2.all[slot6]].pt_require <= slot1.data3 and slot1.data4 < slot7 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 30-31, warpins: 1 ---
				return true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 32-32, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 33-70, warpins: 1 ---
		slot3 = getProxy(TaskProxy)

		if _.any(_(slot1:getConfig("config_data")[7]):chain():map(function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-2, warpins: 1 ---
			return slot0[2]
			--- END OF BLOCK #0 ---



		end):flatten():map(function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			return slot0:getTaskById(slot0) or slot0:getFinishTaskById(slot0) or false
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 16-16, warpins: 3 ---
			--- END OF BLOCK #1 ---



		end):filter(function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-3, warpins: 1 ---
			return not not slot0
			--- END OF BLOCK #0 ---



		end):value(), function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			return slot0:getTaskStatus() == 1
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 9-9, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 71-73, warpins: 1 ---
			return true
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 74-74, warpins: 2 ---
		--- END OF BLOCK #3 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 75-75, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 76-76, warpins: 2 ---
	--- END OF BLOCK #2 ---



end

function slot0.getActivityById(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	return Clone(slot0.data[slot1])
	--- END OF BLOCK #0 ---



end

function slot0.updateActivity(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	slot0.data[slot1.id] = slot1

	slot0.facade:sendNotification(slot0.ACTIVITY_UPDATED, slot1:clone())

	return
	--- END OF BLOCK #0 ---



end

function slot0.addActivity(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	slot0.data[slot1.id] = slot1

	slot0.facade:sendNotification(slot0.ACTIVITY_ADDED, slot1:clone())

	return
	--- END OF BLOCK #0 ---



end

function slot0.deleteActivityById(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot0.data[slot1] = nil

	slot0.facade:sendNotification(slot0.ACTIVITY_DELETED, slot1)

	return
	--- END OF BLOCK #0 ---



end

function slot0.readyToAchieveByType(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	slot2 = false

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-18, warpins: 0 ---
	for slot7, slot8 in ipairs(slot3) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-14, warpins: 1 ---
		if slot8:readyToAchieve() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-16, warpins: 1 ---
			slot2 = true

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 17-17, warpins: 1 ---
			break
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 17-18, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 19-19, warpins: 2 ---
	return slot2
	--- END OF BLOCK #2 ---



end

function slot0.getBuildBgActivityByID(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-27, warpins: 0 ---
	for slot6, slot7 in ipairs(slot2) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-14, warpins: 1 ---
		if not slot7:isEnd() and slot7:getConfig("config_client") and slot8.id == slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 24-25, warpins: 1 ---
			return slot8.bg
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 26-27, warpins: 5 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 28-29, warpins: 1 ---
	return nil
	--- END OF BLOCK #2 ---



end

function slot0.getBuildTipActivityByID(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-27, warpins: 0 ---
	for slot6, slot7 in ipairs(slot2) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-14, warpins: 1 ---
		if not slot7:isEnd() and slot7:getConfig("config_client") and slot8.id == slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 24-25, warpins: 1 ---
			return slot8.rate_tip
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 26-27, warpins: 5 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 28-29, warpins: 1 ---
	return nil
	--- END OF BLOCK #2 ---



end

function slot0.getBuildActivityCfgByID(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-26, warpins: 0 ---
	for slot6, slot7 in ipairs(slot2) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-14, warpins: 1 ---
		if not slot7:isEnd() and slot7:getConfig("config_client") and slot8.id == slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 24-24, warpins: 1 ---
			return slot8
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 25-26, warpins: 5 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 27-28, warpins: 1 ---
	return nil
	--- END OF BLOCK #2 ---



end

function slot0.getBuffList(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-17, warpins: 1 ---
	_.each(slot2, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-2, warpins: 1 ---
		if slot0 and not slot0:isEnd() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-20, warpins: 1 ---
			table.insert(slot0, ActivityBuff.New(slot0.id, slot0:getConfig("config_id")))
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 21-21, warpins: 3 ---
		return
		--- END OF BLOCK #1 ---



	end)

	return _.filter({}, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		return slot0:isActivate()
		--- END OF BLOCK #0 ---



	end)
	--- END OF BLOCK #0 ---



end

function slot0.getBuffShipList(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	_.each(slot0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SHIP_BUFF), function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-2, warpins: 1 ---
		if slot0 and not slot0:isEnd() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-16, warpins: 1 ---
			if not pg.activity_expup_ship[slot0:getConfig("config_id")] then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 17-17, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 18-22, warpins: 2 ---
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 23-28, warpins: 0 ---
			for slot7, slot8 in pairs(slot3) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 23-26, warpins: 1 ---
				slot0[slot8[1]] = slot8[2]
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 27-28, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #2 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 29-29, warpins: 3 ---
		return
		--- END OF BLOCK #1 ---



	end)

	return {}
	--- END OF BLOCK #0 ---



end

function slot0.getVirtualItemNumber(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	if slot0:getActivityByType(ActivityConst.ACTIVITY_TYPE_VIRTUAL_BAG) and not slot2:isEnd() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-17, warpins: 1 ---
		return (slot2.data1KeyValueList[1][slot1] and slot2.data1KeyValueList[1][slot1]) or 0
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 24-24, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 25-26, warpins: 3 ---
	return 0
	--- END OF BLOCK #1 ---



end

function slot0.removeVitemById(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	if slot0:getActivityByType(ActivityConst.ACTIVITY_TYPE_VIRTUAL_BAG) and not slot3:isEnd() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-19, warpins: 1 ---
		slot3.data1KeyValueList[1][slot1] = slot3.data1KeyValueList[1][slot1] - slot2
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 20-24, warpins: 3 ---
	slot0:updateActivity(slot3)

	return
	--- END OF BLOCK #1 ---



end

function slot0.addVitemById(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	if slot0:getActivityByType(ActivityConst.ACTIVITY_TYPE_VIRTUAL_BAG) and not slot3:isEnd() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-17, warpins: 1 ---
		if not slot3.data1KeyValueList[1][slot1] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-21, warpins: 1 ---
			slot3.data1KeyValueList[1][slot1] = 0
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 22-28, warpins: 2 ---
		slot3.data1KeyValueList[1][slot1] = slot3.data1KeyValueList[1][slot1] + slot2
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 29-33, warpins: 3 ---
	slot0:updateActivity(slot3)

	return
	--- END OF BLOCK #1 ---



end

function slot0.monitorTaskList(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if slot1 and not slot1:isEnd() and slot1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_TASK_LIST_MONITOR and getProxy(TaskProxy):isReceiveTasks(slot1:getConfig("config_data")[1] or {}) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 33-42, warpins: 1 ---
		pg.m02:sendNotification(GAME.ACTIVITY_OPERATION, {
			cmd = 1,
			activity_id = slot1.id
		})
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 43-43, warpins: 5 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.updateActivityFleet(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	getProxy(FleetProxy):addActivityFleet(slot1.id, slot1.group_list)

	return
	--- END OF BLOCK #0 ---



end

function slot0.recommendActivityFleet(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-16, warpins: 1 ---
	slot5 = getProxy(BayProxy)
	slot6 = getProxy(FleetProxy):getActivityFleets()[slot1][slot2]

	function slot7(slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-16, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 17-25, warpins: 0 ---
		for slot7, slot8 in ipairs(slot3) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 17-23, warpins: 1 ---
			slot1:insertShip(slot8, nil, slot0)
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 24-25, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 26-26, warpins: 1 ---
		return
		--- END OF BLOCK #2 ---



	end

	if Fleet.SUBMARINE_FLEET_ID <= slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-21, warpins: 1 ---
		if not slot6:isFull() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 22-31, warpins: 1 ---
			slot7(TeamType.Submarine, TeamType.SubmarineMax - #slot6.subShips)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 32-44, warpins: 1 ---
		slot9 = TeamType.MainMax - #slot6.mainShips

		if TeamType.VanguardMax - #slot6.vanguardShips > 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 45-49, warpins: 1 ---
			slot7(TeamType.Vanguard, slot8)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 50-52, warpins: 2 ---
		if slot9 > 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 53-57, warpins: 1 ---
			slot7(TeamType.Main, slot9)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 58-68, warpins: 4 ---
	getProxy(FleetProxy):updateActivityFleet(slot1, slot2, slot6)

	return
	--- END OF BLOCK #1 ---



end

function slot0.GetVoteBookActivty(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	return slot0:getActivityById(ActivityConst.VOTE_ORDER_BOOK_PHASE_1) or slot0:getActivityById(ActivityConst.VOTE_ORDER_BOOK_PHASE_3) or slot0:getActivityById(ActivityConst.VOTE_ORDER_BOOK_PHASE_4) or slot0:getActivityById(ActivityConst.VOTE_ORDER_BOOK_PHASE_5) or slot0:getActivityById(ActivityConst.VOTE_ORDER_BOOK_PHASE_6) or slot0:getActivityById(ActivityConst.VOTE_ORDER_BOOK_PHASE_7) or slot0:getActivityById(ActivityConst.VOTE_ORDER_BOOK_PHASE_8)
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 48-48, warpins: 7 ---
	--- END OF BLOCK #1 ---



end

function slot0.GetVoteActivity(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-18, warpins: 0 ---
	for slot5, slot6 in ipairs(slot1) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-15, warpins: 1 ---
		if slot6:getConfig("config_id") ~= 6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-16, warpins: 1 ---
			return slot6
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 17-18, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 19-19, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

function slot0.InitActivityBossData(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	if not pg.activity_event_worldboss[slot1:getConfig("config_id")] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-10, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-15, warpins: 2 ---
	slot3 = slot1.data1KeyValueList
	slot4 = pairs
	slot5 = slot2.normal_expedition_drop_num or {}

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 17-18, warpins: 2 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 19-46, warpins: 0 ---
	for slot7, slot8 in slot4(slot5) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-22, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 23-44, warpins: 0 ---
		for slot12, slot13 in pairs(slot8[1]) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 23-27, warpins: 1 ---
			slot3[1][slot13] = math.max(slot8[2] - (slot3[1][slot13] or 0), 0)
			slot3[2][slot13] = slot3[2][slot13] or 0
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 29-40, warpins: 2 ---
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 42-42, warpins: 2 ---
			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 43-44, warpins: 2 ---
			--- END OF BLOCK #3 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 45-46, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 47-47, warpins: 1 ---
	return
	--- END OF BLOCK #4 ---



end

function slot0.AddInstagramTimer(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot0:RemoveInstagramTimer()

	slot3, slot4 = slot0.data[slot1].GetNextPushTime(slot2)

	if slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-22, warpins: 1 ---
		function slot7()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-15, warpins: 1 ---
			slot0:sendNotification(GAME.ACT_INSTAGRAM_OP, {
				arg2 = 0,
				activity_id = slot1,
				cmd = ActivityConst.INSTAGRAM_OP_ACTIVE,
				arg1 = GAME.ACT_INSTAGRAM_OP
			})

			return
			--- END OF BLOCK #0 ---



		end

		if slot3 - pg.TimeMgr.GetInstance():GetServerTime() <= 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 23-25, warpins: 1 ---
			slot7()
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 26-36, warpins: 1 ---
			slot0.instagramTimer = Timer.New(function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-7, warpins: 1 ---
				slot0()
				slot1:RemoveInstagramTimer()

				return
				--- END OF BLOCK #0 ---



			end, slot6, 1)

			slot0.instagramTimer:Start()
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 37-37, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 38-39, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.RemoveInstagramTimer(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.instagramTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-9, warpins: 1 ---
		slot0.instagramTimer:Stop()

		slot0.instagramTimer = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-10, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.RegisterRequestTime(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if not slot1 or slot1 <= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-6, warpins: 2 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-9, warpins: 2 ---
	slot0.requestTime[slot1] = slot2

	return
	--- END OF BLOCK #1 ---



end

function slot0.remove(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot0:RemoveInstagramTimer()

	return
	--- END OF BLOCK #0 ---



end

function slot0.ShouldShowInsTip(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	if not slot0:getActivityByType(ActivityConst.ACTIVITY_TYPE_INSTAGRAM) or slot1:isEnd() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-14, warpins: 2 ---
		return false
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 15-17, warpins: 2 ---
	return slot1:ShouldShowTip()
	--- END OF BLOCK #1 ---



end

return slot0
