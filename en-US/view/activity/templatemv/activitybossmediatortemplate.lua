slot0 = class("ActivityBossMediatorTemplate", import("view.base.ContextMediator"))
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
		slot5 = slot0.contextData

		if slot4.time ~= "stop" then
			slot6 = slot0.timeMgr:parseTimeFromConfig(slot4.time[2])
		else
			slot6 = false

			if false then
				slot6 = true
			end
		end

		slot5.BattleEndTimeStamp = slot6
		slot0.contextData.exStageID = slot4.ex_expedition
		slot0.contextData.normalStageIDs = slot4.normal_expedition or {}
		slot0.contextData.groupNum = slot4.group_num
		slot0.contextData.submarineNum = slot4.submarine_num
		slot6 = slot4.normal_expedition_drop_num or {}
		slot0.contextData.ticketInitPools = slot6
		slot0.contextData.DisplayItems = pg.extraenemy_template[slot4.boss_id[1]] and slot6.reward_display or {}
	end

	slot0.contextData.cbAfterReq = {}

	slot0:RequestAndUpdateView()

	slot0.contextData.actFleets = slot2:getActivityFleets()[slot1.id]
	slot7 = slot0.activityProxy

	if slot7:getActivityById(slot0.viewComponent.PTActID) then
		slot0.contextData.ptData = ActivityBossPtData.New(slot7)
	end

	slot8 = slot0.activityProxy

	if slot8:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_RANK) and not slot8:isEnd() then
		if getProxy(BillboardProxy):canFetch(PowerRank.TYPE_ACT_BOSS_BATTLE, slot8.id) then
			slot15.type = slot10
			slot15.activityId = slot11

			slot0:sendNotification(GAME.GET_POWERRANK, {})
		else
			slot0:UpdateRankData(slot9:getRankList(slot10, slot11))
		end
	end
end

function slot0.BindEvent(slot0)
	slot1 = getProxy(FleetProxy)
	slot2 = slot0.activityProxy:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2)

	slot0:bind(uv0.ON_RANK, function (slot0)
		slot5.index = BillboardLayer.PAGE_BOSS_BATTLE

		uv0:sendNotification(GAME.GO_SCENE, SCENE.BILLBOARD, {})
	end)
	slot0:bind(ActivityMediator.EVENT_PT_OPERATION, function (slot0, slot1)
		uv0:sendNotification(GAME.ACT_NEW_PT, slot1)
	end)
	slot0:bind(uv0.ON_SUBMIT_TASK, function (slot0, slot1)
		uv0:sendNotification(GAME.SUBMIT_TASK, slot1)
	end)
	slot0:bind(uv0.ON_PRECOMBAT, function (slot0, slot1)
		if not uv0:getActivityFleets()[uv1.id] then
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
		slot7[1] = slot2[slot1]
		slot5 = SYSTEM_ACT_BOSS
		slot6 = uv2.contextData.normalStageIDs[slot1]

		slot2[slot1 + 10]:RemoveUnusedItems()

		if slot2[slot1 + 10]:isLegalToFight() == true then
			table.insert({}, slot2[slot1 + 10])
		end

		uv2:RequestAndUpdateView(function ()
			slot3.mediator = PreCombatMediator
			slot3.viewComponent = PreCombatLayer
			slot4.system = uv1
			slot4.stageId = uv2
			slot4.actID = uv3.id
			slot4.fleets = uv4

			function slot4.OnConfirm(slot0)
				if not uv0:CheckInTime() then
					return
				end

				if not getProxy(SettingsProxy):isTipActBossExchangeTicket() and (getProxy(PlayerProxy):getRawData():getResource(uv0.contextData.TicketID) > 0 and (uv0.contextData.stageTickets[uv1] or 0) <= 0) then
					slot4 = id2ItemId
					slot4 = pg.MsgboxMgr.GetInstance()
					slot6.content = i18n("tip_exchange_ticket", i18n(uv2[uv3]))
					slot8.sound = SFX_CONFIRM

					function slot8.onCallback()
						uv0.contextData.ready2battleCb = uv1
						slot3.stageId = uv2

						uv0:sendNotification(GAME.ACT_BOSS_EXCHANGE_TICKET, {})
					end

					slot8.btnType = pg.MsgboxMgr.BUTTON_BLUE_WITH_ICON
					slot9[1] = pg.item_data_statistics[slot4(uv0.contextData.TicketID or 1)].icon
					slot8.iconName = {}
					slot7[1] = {
						text = "text_consume"
					}
					slot6.custom = {}

					function slot6.onNo()
						uv0()
					end

					function slot6.onClose()
					end

					slot4:ShowMsgBox({
						noText = "text_inconsume",
						hideYes = true
					})
				elseif slot2 and slot1 == 1 then
					uv0.contextData.ready2battleCb = slot0
					slot7.stageId = uv1

					uv0:sendNotification(GAME.ACT_BOSS_EXCHANGE_TICKET, {})
				else
					slot0()
				end
			end

			slot3.data = {}

			uv0:addSubLayers(Context.New({}))
		end)
	end)
	slot0:bind(uv0.ON_EX_PRECOMBAT, function (slot0, slot1, slot2)
		if not uv0:getActivityFleets()[uv1.id] then
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

		slot7[1] = function (slot0)
			if not uv0 then
				if not pg.StoryMgr.GetInstance():IsPlayed("NG0017") then
					slot4.helps = pg.gametip.worldbossex_help.tip
					slot4.type = MSGBOX_TYPE_HELP
					slot4.stopRamindContent = i18n("dont_remind")

					function slot4.onYes()
						if pg.MsgboxMgr.GetInstance().stopRemindToggle.isOn then
							slot4.storyId = uv0

							pg.m02:sendNotification(GAME.STORY_UPDATE, {})
						end

						uv1()
					end

					function slot4.onNo()
						if pg.MsgboxMgr.GetInstance().stopRemindToggle.isOn then
							slot4.storyId = uv0

							pg.m02:sendNotification(GAME.STORY_UPDATE, {})
						end
					end

					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						hideYes = false,
						showStopRemind = true,
						hideNo = false
					})
				end
			else
				slot0()
			end
		end

		slot7[2] = function (slot0)
			slot1, slot2 = nil
			slot3[1] = uv0[uv1]
			slot1 = uv2 and SYSTEM_BOSS_EXPERIMENT or SYSTEM_HP_SHARE_ACT_BOSS
			slot2 = uv3.contextData.exStageID

			uv0[uv1 + 10]:RemoveUnusedItems()

			if uv0[uv1 + 10]:isLegalToFight() == true then
				table.insert({}, uv0[uv1 + 10])
			end

			uv3:RequestAndUpdateView(function ()
				slot3.mediator = PreCombatMediator
				slot3.viewComponent = PreCombatLayer
				slot4.system = uv1
				slot4.stageId = uv2
				slot4.actID = uv3.id
				slot4.fleets = uv4

				function slot4.OnConfirm(slot0)
					if not uv0:CheckInTime() then
						return
					end

					slot0()
				end

				slot3.data = {}

				uv0:addSubLayers(Context.New({}))
			end)
		end

		seriesAsync({})
	end)
	slot0:bind(uv0.ON_COMMIT_FLEET, function ()
		uv0:commitActivityFleet(uv1.id)
	end)
	slot0:bind(uv0.ON_FLEET_RECOMMEND, function (slot0, slot1)
		uv0.activityProxy:recommendActivityFleet(uv1.id, slot1)

		uv0.contextData.actFleets = uv2:getActivityFleets()[uv1.id]

		uv0.viewComponent:updateEditPanel()
	end)
	slot0:bind(uv0.ON_FLEET_CLEAR, function (slot0, slot1)
		slot3 = uv0:getActivityFleets()[uv1.id]

		slot3[slot1]:clearFleet()

		uv2.contextData.actFleets = slot3

		uv2.viewComponent:updateEditPanel()
	end)
	slot0:bind(uv0.ON_OPEN_DOCK, function (slot0, slot1)
		slot2 = slot1.fleetIndex
		slot3 = slot1.shipVO
		slot4 = slot1.fleet
		slot8 = {}
		slot9 = {}

		for slot13, slot14 in pairs(getProxy(BayProxy):getRawData()) do
			if slot14:getTeamType() ~= slot1.teamType then
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

		slot20.onShip, slot20.confirmSelect, slot20.onSelected = uv0.getDockCallbackFuncs4ActicityFleet(slot3, slot2, slot5)
		slot20.ignoredIds = slot8
		slot20.activeShipId = slot11
		slot20.leastLimitMsg = i18n("ship_formationMediator_leastLimit")
		slot20.quitTeam = slot10
		slot20.leftTopInfo = i18n("word_formation")
		slot20.flags = {
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

		uv0:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
			selectedMin = 0,
			skipSelect = true,
			selectedMax = 1
		})
	end)
	slot0:bind(uv0.ON_FLEET_SHIPINFO, function (slot0, slot1)
		slot6.shipId = slot1.shipId
		slot6.shipVOs = slot1.shipVOs

		uv0:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {})
	end)
	slot0:bind(uv0.ON_SELECT_COMMANDER, function (slot0, slot1, slot2)
		slot3 = uv0
		slot5 = slot1 < Fleet.SUBMARINE_FLEET_ID and slot1 or slot1 - 10
		slot6 = {
			[slot5] = slot3[slot5],
			[slot5 + 10] = slot3[slot5 + 10]
		}
		slot8 = nil

		if slot3:getActivityFleets()[uv1.id][slot1]:getCommanders()[slot2] then
			slot8 = slot7[slot2]
		end

		slot13.mode = CommandRoomScene.MODE_SELECT
		slot13.activeCommander = slot8
		slot13.ignoredIds = {}

		function slot13.onCommander(slot0)
			return true
		end

		function slot13.onSelected(slot0, slot1)
			slot4 = getProxy(CommanderProxy):getCommanderById(slot0[1])

			for slot8, slot9 in pairs(uv0) do
				if slot8 == uv1 then
					for slot13, slot14 in pairs(uv2) do
						if slot14.groupId == slot4.groupId and slot13 ~= uv3 then
							pg.TipsMgr.GetInstance():ShowTips(i18n("commander_can_not_select_same_group"))

							return
						end
					end
				else
					for slot14, slot15 in pairs(slot9:getCommanders()) do
						if slot2 == slot15.id then
							pg.TipsMgr.GetInstance():ShowTips(i18n("commander_is_in_fleet_already"))

							return
						end
					end
				end
			end

			uv4:updateCommanderByPos(uv3, slot4)
			uv5:updateActivityFleet(uv6.id, uv1, uv4)
			slot1()
		end

		function slot13.onQuit(slot0)
			uv0:updateCommanderByPos(uv1, nil)
			uv2:updateActivityFleet(uv3.id, uv4, uv0)
			slot0()
		end

		uv2:sendNotification(GAME.GO_SCENE, SCENE.COMMANDROOM, {
			maxCount = 1
		})
	end)
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = ActivityProxy.ACTIVITY_ADDED
	slot1[2] = ActivityProxy.ACTIVITY_UPDATED
	slot1[3] = GAME.SUBMIT_TASK_DONE
	slot1[4] = PlayerProxy.UPDATED
	slot1[5] = GAME.BEGIN_STAGE_DONE
	slot1[6] = GAME.ACT_NEW_PT_DONE
	slot1[7] = GAME.ACT_BOSS_EXCHANGE_TICKET_DONE
	slot1[8] = GAME.GET_POWERRANK_DONE

	return {}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == ActivityProxy.ACTIVITY_ADDED or slot2 == ActivityProxy.ACTIVITY_UPDATED then
		if slot3.id == slot0.viewComponent.PTActID then
			if slot0.contextData.ptData then
				slot0.contextData.ptData:Update(slot3)
			else
				slot0.contextData.ptData = ActivityBossPtData.New(slot3)
			end

			slot4 = slot0.contextData.ptData.count
			slot5 = slot0.activityProxy

			if slot5:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_RANK) and slot5.data1 ~= slot4 then
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
	slot5.activity_id = slot0.contextData.activityID

	slot0:sendNotification(GAME.ACTIVITY_BOSS_PAGE_UPDATE, {})
	table.insert(slot0.contextData.cbAfterReq, slot1)
end

function slot0.UpdateView(slot0)
	slot0.viewComponent:UpdateView()
end

function slot0.CheckInTime(slot0)
	slot1 = slot0.activityProxy

	if not slot1:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2) or slot1:isEnd() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

		return false
	end

	if slot0.contextData.BattleEndTimeStamp then
		if slot0.contextData.BattleEndTimeStamp <= slot0.timeMgr:GetServerTime() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

			return false
		end
	end

	return true
end

function slot0.UpdateRankData(slot0, slot1)
	slot0.viewComponent:UpdateRank(slot1)
end

function slot0.getDockCallbackFuncs4ActicityFleet(slot0, slot1, slot2)
	slot3 = getProxy(BayProxy)
	slot8 = getProxy(FleetProxy):getActivityFleets()[getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2).id][slot1]

	return function (slot0, slot1)
		slot2, slot3 = Ship.ShipStateConflict("inActivity", slot0)

		if slot2 == Ship.STATE_CHANGE_FAIL then
			return false, i18n(slot3)
		elseif slot2 == Ship.STATE_CHANGE_CHECK then
			return Ship.ChangeStateCheckBox(slot3, slot0, slot1)
		end

		if uv0 then
			if uv0:isSameKind(slot0) then
				return true
			end
		end

		for slot7, slot8 in ipairs(uv1.ships) do
			if slot0:isSameKind(uv2:getShipById(slot8)) then
				return false, i18n("event_same_type_not_allowed")
			end
		end

		return true
	end, function (slot0, slot1, slot2)
		slot1()
	end, function (slot0)
		if uv0 then
			uv1:removeShip(uv0)
		end

		if #slot0 > 0 then
			slot1 = uv2

			if not uv1:containShip(slot1:getShipById(slot0[1])) then
				uv1:insertShip(slot1, nil, uv3)
			elseif uv0 then
				uv1:insertShip(uv0, nil, uv3)
			end

			uv1:RemoveUnusedItems()
			uv4:updateActivityFleet(uv5.id, uv6, uv1)
		end
	end
end

return slot0
