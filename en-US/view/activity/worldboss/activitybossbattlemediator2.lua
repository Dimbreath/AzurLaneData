slot0 = class("ActivityBossBattleMediator2", import("view.base.ContextMediator"))
slot0.ACTIVITY_BOSS_MSG_WORD = "ActivityBossBattleMediator2:ACTIVITY_BOSS_MSG_WORD"
slot0.ON_STAGE = "ActivityBossBattleMediator2:ON_STAGE"
slot0.ON_FORMATION = "ActivityBossBattleMediator2:ON_FORMATION"
slot0.ON_GET = "ActivityBossBattleMediator2:ON_GET"
slot0.ON_RANK = "ActivityBossBattleMediator2:ON_RANK"
slot0.UPDATE_BOSS_INFO = "ActivityBossBattleMediator2:UPDATE_BOSS_INFO"
slot0.UPDATE_ACT_RANK_PT = "ActivityBossBattleMediator2:UPDATE_ACT_RANK_PT"
slot0.ON_OPEN_DOCK = "ActivityBossBattleMediator2:ON_OPEN_DOCK"
slot0.ON_FLEET_SHIPINFO = "ActivityBossBattleMediator2:ON_FLEET_SHIPINFO"
slot0.ON_SELECT_COMMANDER = "ActivityBossBattleMediator2:ON_SELECT_COMMANDER"
slot0.ON_PRECOMBAT = "ActivityBossBattleMediator2:ON_PRECOMBAT"
slot0.ON_TRY_BATTLE = "ActivityBossBattleMediator2:ON_TRY_BATTLE"
slot0.ON_COMMIT_FLEET = "ActivityBossBattleMediator2:ON_COMMIT_FLEET"
slot0.ON_FLEET_RECOMMEND = "ActivityBossBattleMediator2:ON_FLEET_RECOMMEND"
slot0.ON_FLEET_CLEAR = "ActivityBossBattleMediator2:ON_FLEET_CLEAR"

function slot0.register(slot0)
	slot0.activityProxy = getProxy(ActivityProxy)
	slot1 = getProxy(FleetProxy)
	slot2 = slot0.activityProxy:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2)

	slot0:bind(uv0.ON_RANK, function (slot0)
		slot5.index = BillboardLayer.PAGE_BOSS_BATTLE

		uv0:sendNotification(GAME.GO_SCENE, SCENE.BILLBOARD, {})
	end)
	slot0:bind(uv0.ON_GET, function (slot0, slot1)
		uv0:sendNotification(GAME.SUBMIT_TASK, slot1)
	end)
	slot0:bind(uv0.ON_PRECOMBAT, function (slot0, slot1)
		if uv0:checkActivityFleet(uv1.id) ~= true then
			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_no_fleet"))

			return
		end

		slot5.mediator = PreCombatMediator
		slot5.viewComponent = PreCombatLayer
		slot6.system = SYSTEM_HP_SHARE_ACT_BOSS
		slot6.stageId = slot1
		slot6.actID = uv1.id

		function slot6.func()
			uv0:tryBattle()
		end

		slot5.data = {}

		uv2:addSubLayers(Context.New({}))
	end)
	slot0:bind(uv0.ON_TRY_BATTLE, function ()
		uv0:tryBattle()
	end)
	slot0:bind(uv0.ON_COMMIT_FLEET, function ()
		uv0:commitActivityFleet(uv1.id)
	end)
	slot0:bind(uv0.ON_FLEET_RECOMMEND, function (slot0, slot1)
		uv0.activityProxy:recommendActivityFleet(uv1.id, slot1)
		uv0.viewComponent:setFleet(uv2:getActivityFleets()[uv1.id])
		uv0.viewComponent:updateEditPanel()
	end)
	slot0:bind(uv0.ON_FLEET_CLEAR, function (slot0, slot1)
		slot3 = uv0:getActivityFleets()[uv1.id]

		slot3[slot1]:clearFleet()
		uv2.viewComponent:setFleet(slot3)
		uv2.viewComponent:updateEditPanel()
	end)
	slot0:bind(uv0.ON_STAGE, function (slot0, slot1, slot2)
		if uv0:checkActivityFleet(uv1.id) ~= true then
			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_no_fleet"))

			return
		end

		slot6 = {}
		slot8, slot9, slot10 = ipairs(uv0:getActivityFleets()[uv1.id][1].ships)

		for slot11, slot12 in slot8, slot9, slot10 do
			table.insert(slot6, getProxy(BayProxy):getShipById(slot12))
		end

		if Fleet.EnergyCheck(slot6, Fleet.DEFAULT_NAME[1], function ()
			slot3.system = SYSTEM_HP_SHARE_ACT_BOSS
			slot3.stageId = uv1
			slot3.actID = uv2.id
			slot3.bossHP = uv3

			uv0:sendNotification(GAME.BEGIN_STAGE, {})
		end, "ship_energy_low_warn_no_exp") then
			slot8()
		end
	end)
	slot0:bind(uv0.ON_OPEN_DOCK, function (slot0, slot1)
		slot2 = slot1.shipType
		slot3 = slot1.fleetIndex
		slot4 = slot1.shipVO
		slot5 = slot1.fleet
		slot10, slot11, slot12 = pairs(getProxy(BayProxy):getRawData())

		for slot13, slot14 in slot10, slot11, slot12 do
			if slot14:getTeamType() ~= slot1.teamType then
				table.insert({}, slot13)
			end
		end

		uv0.contextData.editFleet = true
		slot10, slot11 = nil

		if slot4 == nil then
			slot10 = false
			slot11 = nil
		else
			slot10 = true
			slot11 = slot4.id
		end

		slot12.inActivity = uv1.id
		slot20.onShip, slot20.confirmSelect, slot20.onSelected = uv0:getDockCallbackFuncs(slot5, slot4, slot3, slot6)
		slot20.ignoredIds = slot9
		slot20.activeShipId = slot11
		slot20.leastLimitMsg = i18n("ship_formationMediator_leastLimit")
		slot20.quitTeam = slot10
		slot20.leftTopInfo = i18n("word_formation")
		slot20.flags = {
			inAdmiral = false,
			inEvent = true,
			inFleet = false,
			inClass = false,
			inTactics = false,
			inBackyard = false
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

		uv0.contextData.editFleet = true
	end)
	slot0:bind(uv0.ON_SELECT_COMMANDER, function (slot0, slot1, slot2)
		slot4 = nil
		slot5, slot6, slot7 = pairs(uv0:getActivityFleets()[uv1.id])

		for slot8, slot9 in slot5, slot6, slot7 do
			if slot8 == slot1 then
				slot4 = slot9
			end
		end

		slot6 = nil

		if slot4:getCommanders()[pos] then
			slot6 = getProxy(CommanderProxy):getCommanderById(slot5[slot2])
		end

		slot11.mode = CommandRoomScene.MODE_SELECT
		slot11.activeCommander = slot6
		slot11.ignoredIds = {}

		function slot11.onCommander(slot0)
			return true
		end

		function slot11.onSelected(slot0, slot1)
			slot5, slot6, slot7 = pairs(uv0)

			for slot8, slot9 in slot5, slot6, slot7 do
				if slot8 == uv1 then
					slot10, slot11, slot12 = pairs(uv2)

					for slot13, slot14 in slot10, slot11, slot12 do
						if slot14.groupId == getProxy(CommanderProxy):getCommanderById(slot0[1]).groupId and slot13 ~= uv3 then
							pg.TipsMgr.GetInstance():ShowTips(i18n("commander_can_not_select_same_group"))

							return
						end
					end
				else
					slot11, slot12, slot13 = pairs(slot9:getCommanders())

					for slot14, slot15 in slot11, slot12, slot13 do
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

		function slot11.onQuit(slot0)
			uv0:updateCommanderByPos(uv1, nil)
			uv2:updateActivityFleet(uv3.id, uv4, uv0)
			slot0()
		end

		uv2:sendNotification(GAME.GO_SCENE, SCENE.COMMANDROOM, {
			maxCount = 1
		})

		uv2.contextData.editFleet = true
	end)
	slot0:bind(uv0.UPDATE_ACT_RANK_PT, function (slot0, slot1)
		slot2 = uv0.activityProxy:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_RANK)
		slot2.data1 = slot1

		uv0.activityProxy:updateActivity(slot2)
	end)

	slot4 = slot0.activityProxy:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2):getConfig("config_id")

	slot0.viewComponent:setPtID(pg.activity_event_worldboss[slot4].damage_resource)

	slot5 = pg.activity_event_worldboss[slot4].reward_pt

	if pg.activity_event_worldboss[slot4].time == "stop" then
		slot6 = 0
	else
		slot6 = pg.activity_event_worldboss[slot4].time[2]
	end

	slot7 = pg.activity_event_worldboss[slot4].boss_id[1]
	slot9 = pg.extraenemy_template[slot7].expedition
	slot9[0] = pg.extraenemy_template[slot7].expedition_dead

	slot0.viewComponent:setInfomation(slot6, slot5, pg.extraenemy_template[slot7].reward_display, slot9)
	slot0.viewComponent:setPlayer(getProxy(PlayerProxy):getData())

	slot14.activity_id = slot3.id

	slot0:sendNotification(GAME.ACTIVITY_BOSS_PAGE_UPDATE, {})

	slot11, slot12 = getProxy(MilitaryExerciseProxy):getRankMsgId(7, slot0.activityProxy:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_RANK).id)

	if slot11 then
		slot0:sendNotification(GAME.GET_POWERRANK, slot12)
	end

	slot0.viewComponent:setFleet(slot1:getActivityFleets()[slot3.id])
	slot0.viewComponent:initMsg(getProxy(ChatProxy).actBossMsg)
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = GAME.SUBMIT_TASK_DONE
	slot1[2] = PlayerProxy.UPDATED
	slot1[3] = GAME.BEGIN_STAGE_DONE
	slot1[4] = ActivityProxy.ACTIVITY_UPDATED
	slot1[5] = GAME.ACTIVITY_BOSS_MSG_ADDED
	slot1[6] = MilitaryExerciseProxy.POWERRANK_UPDATED

	return {}
end

function slot0.handleNotification(slot0, slot1)
	if slot1:getName() == GAME.SUBMIT_TASK_DONE then
		slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot1:getBody(), function ()
			slot3.activity_id = uv0.viewComponent.activity.id

			uv0:sendNotification(GAME.ACTIVITY_BOSS_PAGE_UPDATE, {})
		end)
	elseif slot2 == PlayerProxy.UPDATED then
		slot0.viewComponent:setPlayer(slot3)

		slot7.activity_id = slot0.viewComponent.activity.id

		slot0:sendNotification(GAME.ACTIVITY_BOSS_PAGE_UPDATE, {})
	elseif slot2 == ActivityProxy.ACTIVITY_UPDATED then
		if slot3 then
			if slot3:getConfig("type") == ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2 then
				slot0.viewComponent:setActivity(slot3)
			end
		end
	elseif slot2 == GAME.BEGIN_STAGE_DONE then
		slot0:sendNotification(GAME.GO_SCENE, SCENE.COMBATLOAD, slot3)
	elseif slot2 == GAME.ACTIVITY_BOSS_MSG_ADDED then
		slot0.viewComponent:addMsg(slot3)
	elseif slot2 == MilitaryExerciseProxy.POWERRANK_UPDATED then
		slot0.viewComponent:setRank(slot3.list, slot3.nextTime)
	end
end

function slot0.tryBattle(slot0)
	slot1 = slot0.activityProxy

	if getProxy(FleetProxy):checkActivityFleet(slot1:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2).id) ~= true then
		pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_no_fleet"))

		return
	end

	if slot1:isEnd() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))
	else
		slot0.viewComponent.enterStage = true
		slot6.activity_id = slot1.id

		slot0:sendNotification(GAME.ACTIVITY_BOSS_PAGE_UPDATE, {})
	end
end

function slot0.getDockCallbackFuncs(slot0, slot1, slot2, slot3, slot4)
	slot5 = getProxy(BayProxy)
	slot6 = getProxy(FleetProxy)

	return function (slot0, slot1)
		slot2, slot3 = Ship.ShipStateConflict("inElite", slot0)

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

		slot4, slot5, slot6 = ipairs(uv1)

		for slot7, slot8 in slot4, slot5, slot6 do
			if slot0:isSameKind(uv2:getShipById(slot8)) then
				return false, i18n("event_same_type_not_allowed")
			end
		end

		return true
	end, function (slot0, slot1, slot2)
		slot1()
	end, function (slot0)
		if uv3 then
			uv1:getActivityFleets()[uv0.activityProxy:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2).id][uv2]:removeShip(uv3)
		end

		if #slot0 > 0 then
			slot4:insertShip(uv4:getShipById(slot0[1]), nil, uv5)
		end

		uv1:updateActivityFleet(slot1.id, uv2, slot4)
	end
end

return slot0
