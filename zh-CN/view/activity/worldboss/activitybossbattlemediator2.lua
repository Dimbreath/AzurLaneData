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

	slot0:bind(slot0.ON_RANK, function (slot0)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.BILLBOARD, {
			index = BillboardLayer.PAGE_BOSS_BATTLE
		})
	end)
	slot0:bind(slot0.ON_GET, function (slot0, slot1)
		slot0:sendNotification(GAME.SUBMIT_TASK, slot1)
	end)
	slot0:bind(slot0.ON_PRECOMBAT, function (slot0, slot1)
		if slot0:checkActivityFleet(slot1.id) ~= true then
			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_no_fleet"))

			return
		end

		slot2:addSubLayers(Context.New({
			mediator = PreCombatMediator,
			viewComponent = PreCombatLayer,
			data = {
				system = SYSTEM_HP_SHARE_ACT_BOSS,
				stageId = slot1,
				actID = slot1.id,
				func = function ()
					slot0:tryBattle()
				end
			}
		}))
	end)
	slot0:bind(slot0.ON_TRY_BATTLE, function ()
		slot0:tryBattle()
	end)
	slot0:bind(slot0.ON_COMMIT_FLEET, function ()
		slot0:commitActivityFleet(slot1.id)
	end)
	slot0:bind(slot0.ON_FLEET_RECOMMEND, function (slot0, slot1)
		slot0.activityProxy:recommendActivityFleet(slot1.id, slot1)
		slot0.viewComponent:setFleet(slot0.activityProxy.recommendActivityFleet:getActivityFleets()[slot1.id])
		slot0.viewComponent:updateEditPanel()
	end)
	slot0:bind(slot0.ON_FLEET_CLEAR, function (slot0, slot1)
		slot2 = slot0:getActivityFleets()

		slot2[slot1.id][slot1].clearFleet(slot4)
		slot2.viewComponent:setFleet(slot2[slot1.id])
		slot2.viewComponent:updateEditPanel()
	end)
	slot0:bind(slot0.ON_STAGE, function (slot0, slot1, slot2)
		if slot0:checkActivityFleet(slot1.id) ~= true then
			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_no_fleet"))

			return
		end

		slot6 = {}
		slot7 = getProxy(BayProxy)

		for slot11, slot12 in ipairs(slot0:getActivityFleets()[slot1.id][1].ships) do
			table.insert(slot6, slot7:getShipById(slot12))
		end

		if Fleet.EnergyCheck(slot6, Fleet.DEFAULT_NAME[1], function ()
			slot0:sendNotification(GAME.BEGIN_STAGE, {
				system = SYSTEM_HP_SHARE_ACT_BOSS,
				stageId = slot1,
				actID = slot2.id,
				bossHP = 
			})
		end, "ship_energy_low_warn_no_exp") then
			slot8()
		end
	end)
	slot0:bind(slot0.ON_OPEN_DOCK, function (slot0, slot1)
		slot2 = slot1.shipType
		slot3 = slot1.fleetIndex
		slot4 = slot1.shipVO
		slot5 = slot1.fleet
		slot6 = slot1.teamType
		slot9 = {}

		for slot13, slot14 in pairs(slot8) do
			if slot14:getTeamType() ~= slot6 then
				table.insert(slot9, slot13)
			end
		end

		slot0.contextData.editFleet = true
		slot10, slot11 = nil

		if slot4 == nil then
			slot10 = false
			slot11 = nil
		else
			slot10 = true
			slot11 = slot4.id
		end

		slot20.onShip, slot20.confirmSelect, slot20.onSelected = slot0:getDockCallbackFuncs(slot5, slot4, slot3, slot6)

		slot0:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
			selectedMin = 0,
			skipSelect = true,
			selectedMax = 1,
			ignoredIds = slot9,
			activeShipId = slot11,
			leastLimitMsg = i18n("ship_formationMediator_leastLimit"),
			quitTeam = slot10,
			leftTopInfo = i18n("word_formation"),
			onShip = slot13,
			confirmSelect = slot14,
			onSelected = slot15,
			flags = {
				inAdmiral = false,
				inEvent = true,
				inFleet = false,
				inClass = false,
				inTactics = false,
				inBackyard = false,
				inActivity = slot1.id
			}
		})
	end)
	slot0:bind(slot0.ON_FLEET_SHIPINFO, function (slot0, slot1)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
			shipId = slot1.shipId,
			shipVOs = slot1.shipVOs
		})

		slot0.contextData.editFleet = true
	end)
	slot0:bind(slot0.ON_SELECT_COMMANDER, function (slot0, slot1, slot2)
		slot4 = nil

		for slot8, slot9 in pairs(slot3) do
			if slot8 == slot1 then
				slot4 = slot9
			end
		end

		slot6 = nil

		if slot4:getCommanders()[pos] then
			slot6 = getProxy(CommanderProxy):getCommanderById(slot5[slot2])
		end

		slot2:sendNotification(GAME.GO_SCENE, SCENE.COMMANDROOM, {
			maxCount = 1,
			mode = CommandRoomScene.MODE_SELECT,
			activeCommander = slot6,
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

		slot2.contextData.editFleet = true
	end)
	slot0:bind(slot0.UPDATE_ACT_RANK_PT, function (slot0, slot1)
		slot0.activityProxy:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_RANK).data1 = slot1

		slot0.activityProxy:updateActivity(slot0.activityProxy.getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_RANK))
	end)

	slot4 = slot0.activityProxy:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2).getConfig(slot3, "config_id")

	slot0.viewComponent:setPtID(pg.activity_event_worldboss[slot4].damage_resource)

	pg.extraenemy_template[pg.activity_event_worldboss[slot4].boss_id[1]].expedition[0] = pg.extraenemy_template[pg.activity_event_worldboss[slot4].boss_id[1]].expedition_dead

	slot0.viewComponent:setInfomation((pg.activity_event_worldboss[slot4].time == "stop" and 0) or pg.activity_event_worldboss[slot4].time[2], pg.activity_event_worldboss[slot4].reward_pt, slot8, slot9)
	slot0.viewComponent:setPlayer(slot10)
	slot0:sendNotification(GAME.ACTIVITY_BOSS_PAGE_UPDATE, {
		activity_id = slot3.id
	})

	slot11, slot12 = getProxy(MilitaryExerciseProxy):getRankMsgId(7, slot0.activityProxy:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_RANK).id)

	if slot11 then
		slot0:sendNotification(GAME.GET_POWERRANK, slot12)
	end

	slot0.viewComponent:setFleet(slot14)
	slot0.viewComponent:initMsg(getProxy(ChatProxy).actBossMsg)
end

function slot0.listNotificationInterests(slot0)
	return {
		GAME.SUBMIT_TASK_DONE,
		PlayerProxy.UPDATED,
		GAME.BEGIN_STAGE_DONE,
		ActivityProxy.ACTIVITY_UPDATED,
		GAME.ACTIVITY_BOSS_MSG_ADDED,
		MilitaryExerciseProxy.POWERRANK_UPDATED
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.SUBMIT_TASK_DONE then
		slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3, function ()
			slot0:sendNotification(GAME.ACTIVITY_BOSS_PAGE_UPDATE, {
				activity_id = slot0.viewComponent.activity.id
			})
		end)
	elseif slot2 == PlayerProxy.UPDATED then
		slot0.viewComponent:setPlayer(slot3)
		slot0:sendNotification(GAME.ACTIVITY_BOSS_PAGE_UPDATE, {
			activity_id = slot0.viewComponent.activity.id
		})
	elseif slot2 == ActivityProxy.ACTIVITY_UPDATED then
		if slot3 and slot3:getConfig("type") == ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2 then
			slot0.viewComponent:setActivity(slot3)
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
	if getProxy(FleetProxy):checkActivityFleet(slot0.activityProxy:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2).id) ~= true then
		pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_no_fleet"))

		return
	end

	if slot1:isEnd() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))
	else
		slot0.viewComponent.enterStage = true

		slot0:sendNotification(GAME.ACTIVITY_BOSS_PAGE_UPDATE, {
			activity_id = slot1.id
		})
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

		if slot0 and slot0:isSameKind(slot0) then
			return true
		end

		for slot7, slot8 in ipairs(slot1) do
			if slot0:isSameKind(slot2:getShipById(slot8)) then
				return false, i18n("event_same_type_not_allowed")
			end
		end

		return true
	end, function (slot0, slot1, slot2)
		slot1()
	end, function (slot0)
		slot4 = slot1:getActivityFleets()[slot0.activityProxy:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2).id][slot2]

		if slot1.getActivityFleets()[slot0.activityProxy.getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2).id] then
			slot4:removeShip(slot3)
		end

		if #slot0 > 0 then
			slot4:insertShip(slot4:getShipById(slot0[1]), nil, slot4.insertShip)
		end

		slot1:updateActivityFleet(slot1.id, slot2, slot4)
	end
end

return slot0
