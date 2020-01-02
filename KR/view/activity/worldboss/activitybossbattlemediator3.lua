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
				slot5, slot4 = nil
				slot2 = ({
					slot0[slot1]
				})["contextData"].exStageID

				slot0[((slot2 and SYSTEM_BOSS_EXPERIMENT) or SYSTEM_HP_SHARE_ACT_BOSS) + 10]:RemoveUnusedItems()

				if slot0[slot1 + 10]:isLegalToFight() == true then
					table.insert(slot3, slot0[slot1 + 10])
				end

				slot3:RequestAndUpdateView(function ()
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

								slot0()
							end
						}
					}))
				end)
			end
		})
	end)
	slot0:bind(slot0.ON_COMMIT_FLEET, function ()
		slot0:commitActivityFleet(slot1.id)
	end)
	slot0:bind(slot0.ON_FLEET_RECOMMEND, function (slot0, slot1)
		slot0.activityProxy:recommendActivityFleet(slot1.id, slot1)

		slot0.contextData.actFleets = slot0.activityProxy.recommendActivityFleet:getActivityFleets()[slot1.id]

		slot0.viewComponent:updateEditPanel()
	end)
	slot0:bind(slot0.ON_FLEET_CLEAR, function (slot0, slot1)
		slot2 = slot0:getActivityFleets()

		slot2[slot1.id][slot1].clearFleet(slot4)

		slot2.contextData.actFleets = slot2[slot1.id]

		slot2.viewComponent:updateEditPanel()
	end)
	slot0:bind(slot0.ON_OPEN_DOCK, function (slot0, slot1)
		slot2 = slot1.fleetIndex
		slot3 = slot1.shipVO
		slot4 = slot1.fleet
		slot5 = slot1.teamType
		slot8 = {}
		slot9 = {}

		for slot13, slot14 in pairs(slot7) do
			if slot14:getTeamType() ~= slot5 then
				slot9[slot13] = true
			end
		end

		for slot13, slot14 in pairs(slot4) do
			if slot3 and slot14 ~= slot3.id then
				slot9[slot14] = true
			end
		end

		for slot13, slot14 in pairs(slot9) do
			table.insert(slot8, slot13)
		end

		slot10, slot11 = nil

		if slot3 == nil then
			slot10 = false
			slot11 = nil
		else
			slot10 = true
			slot11 = slot3.id
		end

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
	end)
	slot0:bind(slot0.ON_FLEET_SHIPINFO, function (slot0, slot1)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
			shipId = slot1.shipId,
			shipVOs = slot1.shipVOs
		})
	end)
	slot0:bind(slot0.ON_SELECT_COMMANDER, function (slot0, slot1, slot2)
		slot4 = slot0:getActivityFleets()[slot1.id][slot1]
		slot6 = {
			[(slot1 < Fleet.SUBMARINE_FLEET_ID and slot1) or slot1 - 10] = slot3[(slot1 < Fleet.SUBMARINE_FLEET_ID and slot1) or slot1 - 10],
			[((slot1 < Fleet.SUBMARINE_FLEET_ID and slot1) or slot1 - 10) + 10] = slot3[((slot1 < Fleet.SUBMARINE_FLEET_ID and slot1) or slot1 - 10) + 10]
		}
		slot8 = nil

		if slot4:getCommanders()[slot2] then
			slot8 = slot7[slot2]
		end

		slot2:sendNotification(GAME.GO_SCENE, SCENE.COMMANDROOM, {
			maxCount = 1,
			mode = CommandRoomScene.MODE_SELECT,
			activeCommander = slot8,
			ignoredIds = {},
			onCommander = function (slot0)
				return true
			end,
			onSelected = function (slot0, slot1)
				slot4 = getProxy(CommanderProxy).getCommanderById(slot3, slot2)

				for slot8, slot9 in pairs(slot0) do
					if slot8 == slot1 then
						for slot13, slot14 in pairs(slot2) do
							if slot14.groupId == slot4.groupId and slot13 ~= slot3 then
								pg.TipsMgr.GetInstance():ShowTips(i18n("commander_can_not_select_same_group"))

								return
							end
						end
					else
						for slot14, slot15 in pairs(slot10) do
							if slot2 == slot15.id then
								pg.TipsMgr.GetInstance():ShowTips(i18n("commander_is_in_fleet_already"))

								return
							end
						end
					end
				end

				slot4:updateCommanderByPos(slot3, slot4)
				slot4.updateCommanderByPos:updateActivityFleet(slot6.id, slot1, slot4)
				slot1()
			end,
			onQuit = function (slot0)
				slot0:updateCommanderByPos(slot0.updateCommanderByPos, nil)
				slot0:updateActivityFleet(slot0.updateCommanderByPos.id, nil, slot0)
				slot0()
			end
		})
	end)
end

function slot0.listNotificationInterests(slot0)
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
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == ActivityProxy.ACTIVITY_ADDED or slot2 == ActivityProxy.ACTIVITY_UPDATED then
		if slot3.id == ActivityConst.ACTIVITY_BOSS_PT_ID then
			if slot0.contextData.ptData then
				slot0.contextData.ptData:Update(slot3)
			else
				slot0.contextData.ptData = ActivityBossPtData.New(slot3)
			end

			slot4 = slot0.contextData.ptData.count

			if slot0.activityProxy:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_RANK) and slot5.data1 ~= slot4 then
				slot5.data1 = slot4

				slot0.activityProxy:updateActivity(slot5)
			end

			slot0:UpdateView()
		elseif slot3.id == slot0.contextData.activityID then
			slot0.contextData.bossHP = slot3.data1
			slot0.contextData.mileStones = slot3.data1_list
			slot0.contextData.stageTickets = {}
			slot4 = slot0.contextData.stageTickets

			for slot8, slot9 in pairs(slot3.data1KeyValueList) do
				for slot13, slot14 in pairs(slot9) do
					slot4[slot13] = (slot4[slot13] or 0) + slot14
				end
			end

			if #slot0.contextData.cbAfterReq > 0 then
				for slot8, slot9 in ipairs(slot0.contextData.cbAfterReq) do
					slot9()
				end

				for slot8 = #slot0.contextData.cbAfterReq, 1, -1 do
					table.remove(slot0.contextData.cbAfterReq, slot8)
				end
			end

			slot0:UpdateView()
		end
	elseif slot2 == PlayerProxy.UPDATED then
		slot0:RequestAndUpdateView()
	elseif slot2 == GAME.BEGIN_STAGE_DONE then
		if slot0.contextData then
			slot0.contextData.editFleet = nil
		end

		if not getProxy(ContextProxy):getContextByMediator(PreCombatMediator) then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.COMBATLOAD, slot3)
		end
	elseif slot2 == GAME.ACTIVITY_BOSS_MSG_ADDED then
		slot0.viewComponent:addMsg(slot3)
	elseif slot2 == GAME.ACT_BOSS_EXCHANGE_TICKET_DONE then
		if slot0.contextData.ready2battleCb then
			slot0.contextData.ready2battleCb()

			slot0.contextData.ready2battleCb = nil
		end
	elseif slot2 == GAME.GET_POWERRANK_DONE then
		if slot3.type == PowerRank.TYPE_ACT_BOSS_BATTLE then
			slot0:UpdateRankData(slot3.list)
		end
	elseif slot2 == GAME.ACT_NEW_PT_DONE then
		slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3.awards)
	end
end

function slot0.RequestAndUpdateView(slot0, slot1)
	slot0:RequestNewData(slot1)
end

function slot0.RequestNewData(slot0, slot1)
	slot0:sendNotification(GAME.ACTIVITY_BOSS_PAGE_UPDATE, {
		activity_id = slot0.contextData.activityID
	})
	table.insert(slot0.contextData.cbAfterReq, slot1)
end

function slot0.UpdateView(slot0)
	slot0.viewComponent:UpdateView()
end

function slot0.CheckInTime(slot0)
	if not slot0.activityProxy:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2) or slot1:isEnd() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

		return false
	end

	if not slot0.contextData.BattleEndTimeStamp or slot0.contextData.BattleEndTimeStamp <= slot0.timeMgr:GetServerTime() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

		return false
	end

	return true
end

function slot0.UpdateRankData(slot0, slot1)
	slot0.viewComponent:UpdateRank(slot1)
end

function slot0.getDockCallbackFuncs4ActicityFleet(slot0, slot1, slot2)
	slot3 = getProxy(BayProxy)
	slot8 = getProxy(FleetProxy).getActivityFleets(slot4)[getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2).id][slot1]

	return function (slot0, slot1)
		slot2, slot3 = Ship.ShipStateConflict("inActivity", slot0)

		if slot2 == Ship.STATE_CHANGE_FAIL then
			return false, i18n(slot3)
		elseif slot2 == Ship.STATE_CHANGE_CHECK then
			return Ship.ChangeStateCheckBox(slot3, slot0, slot1)
		end

		if slot0 and slot0:isSameKind(slot0) then
			return true
		end

		for slot7, slot8 in ipairs(slot1.ships) do
			if slot0:isSameKind(slot2:getShipById(slot8)) then
				return false, i18n("event_same_type_not_allowed")
			end
		end

		return true
	end, function (slot0, slot1, slot2)
		slot1()
	end, function (slot0)
		if slot0 then
			slot1:removeShip(slot0)
		end

		if #slot0 > 0 then
			if not slot1:containShip(slot2:getShipById(slot0[1])) then
				slot1:insertShip(slot1, nil, slot1)
			elseif slot0 then
				slot1:insertShip(slot0, nil, slot1)
			end

			slot1:RemoveUnusedItems()
			slot4:updateActivityFleet(slot5.id, slot6, slot1)
		end
	end
end

return slot0
