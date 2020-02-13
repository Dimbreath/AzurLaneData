slot0 = class("ActivityBossBattleMediator3", import("view.base.ContextMediator"))
slot0.ON_SUBMIT_TASK = "ActivityBossBattleMediator3:ON_SUBMIT_TASK"
slot0.ON_RANK = "ActivityBossBattleMediator3:ON_RANK"
slot0.ON_PRECOMBAT = "ActivityBossBattleMediator3:ON_PRECOMBAT"
slot0.ON_EX_PRECOMBAT = "ActivityBossBattleMediator3:ON_EX_PRECOMBAT"
slot0.ON_COMMIT_FLEET = "ActivityBossBattleMediator3:ON_COMMIT_FLEET"
slot0.ON_FLEET_RECOMMEND = "ActivityBossBattleMediator3:ON_FLEET_RECOMMEND"
slot0.ON_FLEET_CLEAR = "ActivityBossBattleMediator3:ON_FLEET_CLEAR"
slot0.ON_OPEN_DOCK = "ActivityBossBattleMediator3:ON_OPEN_DOCK"
slot0.ON_FLEET_SHIPINFO = "ActivityBossBattleMediator3:ON_FLEET_SHIPINFO"
slot0.ON_SELECT_COMMANDER = "ActivityBossBattleMediator3:ON_SELECT_COMMANDER"
slot1 = {
	"word_easy",
	"word_normal_junhe",
	"word_hard"
}

function slot0.register(slot0)
	slot0.activityProxy = getProxy(ActivityProxy)
	slot0.timeMgr = pg.TimeMgr.GetInstance()

	if not slot0.activityProxy:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2) then
		return
	end

	slot0:BindEvent()

	slot2 = getProxy(FleetProxy)
	slot0.contextData.activity = slot1
	slot0.contextData.activityID = slot1 and slot1.id

	if pg.activity_event_worldboss[slot1 and slot1:getConfig("config_id")] then
		slot0.contextData.TicketID = slot4.ticket
		slot0.contextData.BattleEndTimeStamp = slot4.time ~= "stop" and slot0.timeMgr:parseTimeFromConfig(slot4.time[2])
		slot0.contextData.exStageID = slot4.ex_expedition
		slot0.contextData.normalStageIDs = slot4.normal_expedition or {}
		slot0.contextData.groupNum = slot4.group_num
		slot0.contextData.submarineNum = slot4.submarine_num
		slot0.contextData.ticketInitPools = slot4.normal_expedition_drop_num or {}
		slot0.contextData.DisplayItems = (pg.extraenemy_template[slot4.boss_id[1]] and slot4.normal_expedition_drop_num or .reward_display) or {}
	end

	slot0.contextData.cbAfterReq = {}

	slot0:RequestAndUpdateView()

	slot0.contextData.actFleets = slot2:getActivityFleets()[slot1.id]

	slot0.viewComponent:initMsg(slot7)

	if slot0.activityProxy:getActivityById(ActivityConst.ACTIVITY_BOSS_PT_ID) then
		slot0.contextData.ptData = ActivityBossPtData.New(slot8)
	end

	if slot0.activityProxy:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_RANK) and not slot9:isEnd() then
		if getProxy(BillboardProxy):canFetch(PowerRank.TYPE_ACT_BOSS_BATTLE, slot9.id) then
			slot0:sendNotification(GAME.GET_POWERRANK, {
				type = slot11,
				activityId = slot12
			})
		else
			slot0:UpdateRankData(slot10:getRankList(slot11, slot12))
		end
	end
end

function slot0.BindEvent(slot0)
	slot1 = getProxy(FleetProxy)
	slot2 = slot0.activityProxy:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2)

	slot0:bind(slot0.ON_RANK, function (slot0)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.BILLBOARD, {
			index = BillboardLayer.PAGE_BOSS_BATTLE
		})
	end)
	slot0:bind(ActivityMediator.EVENT_PT_OPERATION, function (slot0, slot1)
		slot0:sendNotification(GAME.ACT_NEW_PT, slot1)
	end)
	slot0:bind(slot0.ON_SUBMIT_TASK, function (slot0, slot1)
		slot0:sendNotification(GAME.SUBMIT_TASK, slot1)
	end)
	slot0:bind(slot0.ON_PRECOMBAT, function (slot0, slot1)
		if not slot0:getActivityFleets()[slot1.id] then
			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_no_fleet"))

			return
		end

		slot2[slot1]:RemoveUnusedItems()

		if slot2[slot1]:isLegalToFight() ~= true then
			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_formation_unsatisfied"))

			return
		end

		slot3, slot4 = slot2[slot1]:HaveShipsInEvent()

		if slot3 then
			pg.TipsMgr.GetInstance():ShowTips(slot4)

			return
		end

		slot5, slot6 = nil
		slot7 = {
			slot2[slot1]
		}
		slot5 = SYSTEM_ACT_BOSS
		slot6 = slot2.contextData.normalStageIDs[slot1]

		slot2[slot1 + 10]:RemoveUnusedItems()

		if slot2[slot1 + 10]:isLegalToFight() == true then
			table.insert(slot7, slot2[slot1 + 10])
		end

		slot2:RequestAndUpdateView(function ()
			slot0:addSubLayers(Context.New({
				mediator = PreCombatMediator,
				viewComponent = PreCombatLayer,
				data = {
					system = slot1,
					stageId = slot2,
					actID = slot3.id,
					fleets = slot4,
					OnConfirm = function (slot0)
						if not slot0:CheckInTime() then
							return
						end

						slot2 = getProxy(PlayerProxy):getRawData():getResource(slot0.contextData.TicketID) > 0 and (slot0.contextData.stageTickets[getProxy(SettingsProxy):isTipActBossExchangeTicket()] or 0) <= 0

						if not slot1 and slot2 then
							pg.MsgboxMgr.GetInstance():ShowMsgBox({
								yesText = "text_consume",
								noText = "text_inconsume",
								content = i18n("tip_exchange_ticket", i18n(slot2[pg.MsgboxMgr.GetInstance().ShowMsgBox])),
								onYes = function ()
									if pg.MsgboxMgr.GetInstance().stopRemindToggle.isOn then
									end

									slot0.contextData.ready2battleCb = slot0.contextData

									slot0:sendNotification(GAME.ACT_BOSS_EXCHANGE_TICKET, {
										stageId = slot0
									})
								end,
								yesBtnType = pg.MsgboxMgr.BUTTON_BLUE_WITH_ICON,
								onNo = function ()
									if pg.MsgboxMgr.GetInstance().stopRemindToggle.isOn then
									end

									slot0()
								end,
								onClose = function ()
									return
								end
							})
						else
							slot3 = slot1 == 1

							if slot2 and slot3 then
								slot0.contextData.ready2battleCb = slot0

								slot0:sendNotification(GAME.ACT_BOSS_EXCHANGE_TICKET, {
									stageId = slot1
								})
							else
								slot0()
							end
						end
					end
				}
			}))
		end)
	end)
	slot0:bind(slot0.ON_EX_PRECOMBAT, function (slot0, slot1, slot2)
		if not slot0:getActivityFleets()[slot1.id] then
			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_no_fleet"))

			return
		end

		slot3[slot1]:RemoveUnusedItems()

		if slot3[slot1]:isLegalToFight() ~= true then
			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_formation_unsatisfied"))

			return
		end

		slot4, slot5 = slot3[slot1]:HaveShipsInEvent()

		if slot4 then
			pg.TipsMgr.GetInstance():ShowTips(slot5)

			return
		end

		seriesAsync({
			function (slot0)
				slot1 = "NG0017"

				if not slot0 and not pg.StoryMgr.GetInstance():IsPlayed(slot1) then
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						hideYes = false,
						showStopRemind = true,
						hideNo = false,
						helps = pg.gametip.worldbossex_help.tip,
						type = MSGBOX_TYPE_HELP,
						stopRamindContent = i18n("dont_remind"),
						onYes = function ()
							if pg.MsgboxMgr.GetInstance().stopRemindToggle.isOn then
								pg.m02:sendNotification(GAME.STORY_UPDATE, {
									storyId = slot0
								})
							end

							slot1()
						end,
						onNo = function ()
							if pg.MsgboxMgr.GetInstance().stopRemindToggle.isOn then
								pg.m02:sendNotification(GAME.STORY_UPDATE, {
									storyId = slot0
								})
							end
						end
					})
				else
					slot0()
				end
			end,
			function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-9, warpins: 1 ---
				slot5, slot4 = nil
				slot3 = {
					slot0[slot1]
				}
				slot1 = (slot2 and SYSTEM_BOSS_EXPERIMENT) or SYSTEM_HP_SHARE_ACT_BOSS
				slot2 = ()["contextData"].exStageID

				slot0[((slot2 and SYSTEM_BOSS_EXPERIMENT) or SYSTEM_HP_SHARE_ACT_BOSS) + 10]:RemoveUnusedItems()

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #1 10-12, warpins: 1 ---
				if not SYSTEM_BOSS_EXPERIMENT then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 13-13, warpins: 2 ---
					slot1 = SYSTEM_HP_SHARE_ACT_BOSS
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 14-32, warpins: 2 ---
				if slot0[slot1 + 10]:isLegalToFight() == true then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 33-40, warpins: 1 ---
					table.insert(slot3, slot0[slot1 + 10])
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #2 ---

				FLOW; TARGET BLOCK #3



				-- Decompilation error in this vicinity:
				--- BLOCK #3 41-47, warpins: 2 ---
				slot3:RequestAndUpdateView(function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-26, warpins: 1 ---
					slot0:addSubLayers(Context.New({
						mediator = PreCombatMediator,
						viewComponent = PreCombatLayer,
						data = {
							system = slot1,
							stageId = slot2,
							actID = slot3.id,
							fleets = slot4,
							OnConfirm = function (slot0)

								-- Decompilation error in this vicinity:
								--- BLOCK #0 1-6, warpins: 1 ---
								if not slot0:CheckInTime() then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 7-7, warpins: 1 ---
									return
									--- END OF BLOCK #0 ---



								end

								--- END OF BLOCK #0 ---

								FLOW; TARGET BLOCK #1



								-- Decompilation error in this vicinity:
								--- BLOCK #1 8-10, warpins: 2 ---
								slot0()

								return
								--- END OF BLOCK #1 ---



							end
						}
					}))

					return
					--- END OF BLOCK #0 ---



				end)

				return
				--- END OF BLOCK #3 ---



			end
		})
	end)
	slot0:bind(slot0.ON_COMMIT_FLEET, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		slot0:commitActivityFleet(slot1.id)

		return
		--- END OF BLOCK #0 ---



	end)
	slot0:bind(slot0.ON_FLEET_RECOMMEND, function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-24, warpins: 1 ---
		slot0.activityProxy:recommendActivityFleet(slot1.id, slot1)

		slot0.contextData.actFleets = slot0.activityProxy.recommendActivityFleet:getActivityFleets()[slot1.id]

		slot0.viewComponent:updateEditPanel()

		return
		--- END OF BLOCK #0 ---



	end)
	slot0:bind(slot0.ON_FLEET_CLEAR, function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-20, warpins: 1 ---
		slot2 = slot0:getActivityFleets()

		slot2[slot1.id][slot1].clearFleet(slot4)

		slot2.contextData.actFleets = slot2[slot1.id]

		slot2.viewComponent:updateEditPanel()

		return
		--- END OF BLOCK #0 ---



	end)
	slot0:bind(slot0.ON_OPEN_DOCK, function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-16, warpins: 1 ---
		slot2 = slot1.fleetIndex
		slot3 = slot1.shipVO
		slot4 = slot1.fleet
		slot5 = slot1.teamType
		slot8 = {}
		slot9 = {}

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 17-25, warpins: 0 ---
		for slot13, slot14 in pairs(slot7) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 17-21, warpins: 1 ---
			if slot14:getTeamType() ~= slot5 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 22-23, warpins: 1 ---
				slot9[slot13] = true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 24-25, warpins: 3 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 26-29, warpins: 1 ---
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 30-38, warpins: 0 ---
		for slot13, slot14 in pairs(slot4) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 30-31, warpins: 1 ---
			if slot3 and slot14 ~= slot3.id then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 35-36, warpins: 1 ---
				slot9[slot14] = true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 37-38, warpins: 4 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 39-42, warpins: 1 ---
		--- END OF BLOCK #4 ---

		FLOW; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #5 43-49, warpins: 0 ---
		for slot13, slot14 in pairs(slot9) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 43-47, warpins: 1 ---
			table.insert(slot8, slot13)
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 48-49, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #5 ---

		FLOW; TARGET BLOCK #6



		-- Decompilation error in this vicinity:
		--- BLOCK #6 50-52, warpins: 1 ---
		slot10, slot11 = nil

		if slot3 == nil then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 53-55, warpins: 1 ---
			slot10 = false
			slot11 = nil
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 56-57, warpins: 1 ---
			slot10 = true
			slot11 = slot3.id
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #6 ---

		FLOW; TARGET BLOCK #7



		-- Decompilation error in this vicinity:
		--- BLOCK #7 58-89, warpins: 2 ---
		slot20.onShip, slot20.confirmSelect, slot20.onSelected = slot0.getDockCallbackFuncs4ActicityFleet(slot3, slot2, slot5)

		slot0:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
			selectedMin = 0,
			skipSelect = true,
			selectedMax = 1,
			ignoredIds = slot8,
			activeShipId = slot11,
			leastLimitMsg = i18n("ship_formationMediator_leastLimit"),
			quitTeam = slot10,
			leftTopInfo = i18n("word_formation"),
			onShip = slot13,
			confirmSelect = slot14,
			onSelected = slot15,
			flags = {
				inExercise = false,
				inChapter = false,
				inPvp = false,
				inFleet = false,
				inClass = false,
				inTactics = false,
				inBackyard = false,
				inSham = false,
				inEvent = true,
				inAdmiral = false
			}
		})

		return
		--- END OF BLOCK #7 ---



	end)
	slot0:bind(slot0.ON_FLEET_SHIPINFO, function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-14, warpins: 1 ---
		slot0:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
			shipId = slot1.shipId,
			shipVOs = slot1.shipVOs
		})

		return
		--- END OF BLOCK #0 ---



	end)
	slot0:bind(slot0.ON_SELECT_COMMANDER, function (slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-12, warpins: 1 ---
		slot4 = slot0:getActivityFleets()[slot1.id][slot1]

		if slot1 >= Fleet.SUBMARINE_FLEET_ID or not slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-15, warpins: 2 ---
			slot5 = slot1 - 10
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 16-29, warpins: 2 ---
		slot6 = {
			[slot5] = slot3[slot5],
			[slot5 + 10] = slot3[slot5 + 10]
		}
		slot8 = nil

		if slot4:getCommanders()[slot2] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 30-30, warpins: 1 ---
			slot8 = slot7[slot2]
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 31-53, warpins: 2 ---
		slot2:sendNotification(GAME.GO_SCENE, SCENE.COMMANDROOM, {
			maxCount = 1,
			mode = CommandRoomScene.MODE_SELECT,
			activeCommander = slot8,
			ignoredIds = {},
			onCommander = function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-2, warpins: 1 ---
				return true
				--- END OF BLOCK #0 ---



			end,
			onSelected = function (slot0, slot1)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-12, warpins: 1 ---
				slot4 = getProxy(CommanderProxy).getCommanderById(slot3, slot2)

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 13-65, warpins: 0 ---
				for slot8, slot9 in pairs(slot0) do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 13-15, warpins: 1 ---
					if slot8 == slot1 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 16-19, warpins: 1 ---
						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 20-39, warpins: 0 ---
						for slot13, slot14 in pairs(slot2) do

							-- Decompilation error in this vicinity:
							--- BLOCK #0 20-23, warpins: 1 ---
							if slot14.groupId == slot4.groupId and slot13 ~= slot3 then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 27-37, warpins: 1 ---
								pg.TipsMgr.GetInstance():ShowTips(i18n("commander_can_not_select_same_group"))

								return
								--- END OF BLOCK #0 ---



							end
							--- END OF BLOCK #0 ---

							FLOW; TARGET BLOCK #1



							-- Decompilation error in this vicinity:
							--- BLOCK #1 38-39, warpins: 4 ---
							--- END OF BLOCK #1 ---



						end
						--- END OF BLOCK #1 ---

						FLOW; TARGET BLOCK #2



						-- Decompilation error in this vicinity:
						--- BLOCK #2 40-40, warpins: 1 ---
						--- END OF BLOCK #2 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 41-47, warpins: 1 ---
						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 48-63, warpins: 0 ---
						for slot14, slot15 in pairs(slot10) do

							-- Decompilation error in this vicinity:
							--- BLOCK #0 48-50, warpins: 1 ---
							if slot2 == slot15.id then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 51-61, warpins: 1 ---
								pg.TipsMgr.GetInstance():ShowTips(i18n("commander_is_in_fleet_already"))

								return
								--- END OF BLOCK #0 ---



							end
							--- END OF BLOCK #0 ---

							FLOW; TARGET BLOCK #1



							-- Decompilation error in this vicinity:
							--- BLOCK #1 62-63, warpins: 3 ---
							--- END OF BLOCK #1 ---



						end
						--- END OF BLOCK #1 ---



					end
					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 64-65, warpins: 3 ---
					--- END OF BLOCK #1 ---



				end

				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 66-82, warpins: 1 ---
				slot4:updateCommanderByPos(slot3, slot4)
				slot4.updateCommanderByPos:updateActivityFleet(slot6.id, slot1, slot4)
				slot1()

				return
				--- END OF BLOCK #2 ---



			end,
			onQuit = function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-17, warpins: 1 ---
				slot0:updateCommanderByPos(slot0.updateCommanderByPos, nil)
				slot0:updateActivityFleet(slot0.updateCommanderByPos.id, nil, slot0)
				slot0()

				return
				--- END OF BLOCK #0 ---



			end
		})

		return
		--- END OF BLOCK #2 ---



	end)
end

function slot0.listNotificationInterests(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-29, warpins: 1 ---
	return {
		ActivityProxy.ACTIVITY_ADDED,
		ActivityProxy.ACTIVITY_UPDATED,
		GAME.SUBMIT_TASK_DONE,
		PlayerProxy.UPDATED,
		GAME.BEGIN_STAGE_DONE,
		GAME.ACT_NEW_PT_DONE,
		GAME.ACTIVITY_BOSS_MSG_ADDED,
		GAME.ACT_BOSS_EXCHANGE_TICKET_DONE,
		GAME.GET_POWERRANK_DONE
	}
	--- END OF BLOCK #0 ---



end

function slot0.handleNotification(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot3 = slot1:getBody()

	if slot1:getName() == ActivityProxy.ACTIVITY_ADDED or slot2 == ActivityProxy.ACTIVITY_UPDATED then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-19, warpins: 2 ---
		if slot3.id == ActivityConst.ACTIVITY_BOSS_PT_ID then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 20-23, warpins: 1 ---
			if slot0.contextData.ptData then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 24-30, warpins: 1 ---
				slot0.contextData.ptData:Update(slot3)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 31-36, warpins: 1 ---
				slot0.contextData.ptData = ActivityBossPtData.New(slot3)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 37-47, warpins: 2 ---
			slot4 = slot0.contextData.ptData.count

			if slot0.activityProxy:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_RANK) and slot5.data1 ~= slot4 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 51-56, warpins: 1 ---
				slot5.data1 = slot4

				slot0.activityProxy:updateActivity(slot5)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 57-60, warpins: 3 ---
			slot0:UpdateView()
			--- END OF BLOCK #2 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 61-65, warpins: 1 ---
			if slot3.id == slot0.contextData.activityID then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 66-80, warpins: 1 ---
				slot0.contextData.bossHP = slot3.data1
				slot0.contextData.mileStones = slot3.data1_list
				slot0.contextData.stageTickets = {}
				slot4 = slot0.contextData.stageTickets

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 81-94, warpins: 0 ---
				for slot8, slot9 in pairs(slot3.data1KeyValueList) do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 81-84, warpins: 1 ---
					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 85-92, warpins: 0 ---
					for slot13, slot14 in pairs(slot9) do

						-- Decompilation error in this vicinity:
						--- BLOCK #0 85-87, warpins: 1 ---
						if not slot4[slot13] then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 88-88, warpins: 1 ---
							slot15 = 0
							--- END OF BLOCK #0 ---



						end

						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 89-90, warpins: 2 ---
						slot4[slot13] = slot15 + slot14
						--- END OF BLOCK #1 ---

						FLOW; TARGET BLOCK #2



						-- Decompilation error in this vicinity:
						--- BLOCK #2 91-92, warpins: 2 ---
						--- END OF BLOCK #2 ---



					end
					--- END OF BLOCK #1 ---

					FLOW; TARGET BLOCK #2



					-- Decompilation error in this vicinity:
					--- BLOCK #2 93-94, warpins: 2 ---
					--- END OF BLOCK #2 ---



				end

				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 95-100, warpins: 1 ---
				if #slot0.contextData.cbAfterReq > 0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 101-105, warpins: 1 ---
					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 106-109, warpins: 0 ---
					for slot8, slot9 in ipairs(slot0.contextData.cbAfterReq) do

						-- Decompilation error in this vicinity:
						--- BLOCK #0 106-107, warpins: 1 ---
						slot9()
						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 108-109, warpins: 2 ---
						--- END OF BLOCK #1 ---



					end

					--- END OF BLOCK #1 ---

					FLOW; TARGET BLOCK #2



					-- Decompilation error in this vicinity:
					--- BLOCK #2 110-115, warpins: 1 ---
					--- END OF BLOCK #2 ---

					FLOW; TARGET BLOCK #3



					-- Decompilation error in this vicinity:
					--- BLOCK #3 116-122, warpins: 0 ---
					for slot8 = #slot0.contextData.cbAfterReq, 1, -1 do

						-- Decompilation error in this vicinity:
						--- BLOCK #0 116-122, warpins: 2 ---
						table.remove(slot0.contextData.cbAfterReq, slot8)
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #3 ---



				end

				--- END OF BLOCK #2 ---

				FLOW; TARGET BLOCK #3



				-- Decompilation error in this vicinity:
				--- BLOCK #3 123-126, warpins: 2 ---
				slot0:UpdateView()
				--- END OF BLOCK #3 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 127-130, warpins: 1 ---
		if slot2 == PlayerProxy.UPDATED then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 131-134, warpins: 1 ---
			slot0:RequestAndUpdateView()
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 135-138, warpins: 1 ---
			if slot2 == GAME.BEGIN_STAGE_DONE then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 139-141, warpins: 1 ---
				if slot0.contextData then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 142-144, warpins: 1 ---
					slot0.contextData.editFleet = nil
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 145-153, warpins: 2 ---
				if not getProxy(ContextProxy):getContextByMediator(PreCombatMediator) then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 154-162, warpins: 1 ---
					slot0:sendNotification(GAME.GO_SCENE, SCENE.COMBATLOAD, slot3)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #1 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 163-166, warpins: 1 ---
				if slot2 == GAME.ACTIVITY_BOSS_MSG_ADDED then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 167-172, warpins: 1 ---
					slot0.viewComponent:addMsg(slot3)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 173-176, warpins: 1 ---
					if slot2 == GAME.ACT_BOSS_EXCHANGE_TICKET_DONE then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 177-180, warpins: 1 ---
						if slot0.contextData.ready2battleCb then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 181-187, warpins: 1 ---
							slot0.contextData.ready2battleCb()

							slot0.contextData.ready2battleCb = nil
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 188-191, warpins: 1 ---
						if slot2 == GAME.GET_POWERRANK_DONE then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 192-196, warpins: 1 ---
							if slot3.type == PowerRank.TYPE_ACT_BOSS_BATTLE then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 197-201, warpins: 1 ---
								slot0:UpdateRankData(slot3.list)
								--- END OF BLOCK #0 ---



							end
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 202-205, warpins: 1 ---
							if slot2 == GAME.ACT_NEW_PT_DONE then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 206-212, warpins: 1 ---
								slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3.awards)
								--- END OF BLOCK #0 ---



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



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 213-213, warpins: 13 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.RequestAndUpdateView(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0:RequestNewData(slot1)

	return
	--- END OF BLOCK #0 ---



end

function slot0.RequestNewData(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-16, warpins: 1 ---
	slot0:sendNotification(GAME.ACTIVITY_BOSS_PAGE_UPDATE, {
		activity_id = slot0.contextData.activityID
	})
	table.insert(slot0.contextData.cbAfterReq, slot1)

	return
	--- END OF BLOCK #0 ---



end

function slot0.UpdateView(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0.viewComponent:UpdateView()

	return
	--- END OF BLOCK #0 ---



end

function slot0.CheckInTime(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	if not slot0.activityProxy:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2) or slot1:isEnd() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-25, warpins: 2 ---
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

		return false
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 26-29, warpins: 2 ---
	if not slot0.contextData.BattleEndTimeStamp or slot0.contextData.BattleEndTimeStamp <= slot0.timeMgr:GetServerTime() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 38-49, warpins: 2 ---
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

		return false
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 50-51, warpins: 2 ---
	return true
	--- END OF BLOCK #2 ---



end

function slot0.UpdateRankData(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot0.viewComponent:UpdateRank(slot1)

	return
	--- END OF BLOCK #0 ---



end

function slot0.getDockCallbackFuncs4ActicityFleet(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-28, warpins: 1 ---
	slot3 = getProxy(BayProxy)
	slot8 = getProxy(FleetProxy).getActivityFleets(slot4)[getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2).id][slot1]

	return function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		slot2, slot3 = Ship.ShipStateConflict("inActivity", slot0)

		if slot2 == Ship.STATE_CHANGE_FAIL then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-15, warpins: 1 ---
			return false, i18n(slot3)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-19, warpins: 1 ---
			if slot2 == Ship.STATE_CHANGE_CHECK then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 20-25, warpins: 1 ---
				return Ship.ChangeStateCheckBox(slot3, slot0, slot1)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 26-28, warpins: 3 ---
		if slot0 and slot0:isSameKind(slot0) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 36-37, warpins: 1 ---
			return true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 38-42, warpins: 3 ---
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 43-59, warpins: 0 ---
		for slot7, slot8 in ipairs(slot1.ships) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 43-52, warpins: 1 ---
			if slot0:isSameKind(slot2:getShipById(slot8)) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 53-57, warpins: 1 ---
				return false, i18n("event_same_type_not_allowed")
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 58-59, warpins: 3 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 60-61, warpins: 1 ---
		return true
		--- END OF BLOCK #4 ---



	end, function (slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		slot1()

		return
		--- END OF BLOCK #0 ---



	end, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-8, warpins: 1 ---
			slot1:removeShip(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 9-12, warpins: 2 ---
		if #slot0 > 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-24, warpins: 1 ---
			if not slot1:containShip(slot2:getShipById(slot0[1])) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 25-32, warpins: 1 ---
				slot1:insertShip(slot1, nil, slot1)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 33-35, warpins: 1 ---
				if slot0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 36-42, warpins: 1 ---
					slot1:insertShip(slot0, nil, slot1)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 43-54, warpins: 3 ---
			slot1:RemoveUnusedItems()
			slot4:updateActivityFleet(slot5.id, slot6, slot1)
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 55-55, warpins: 2 ---
		return
		--- END OF BLOCK #2 ---



	end
	--- END OF BLOCK #0 ---



end

return slot0
