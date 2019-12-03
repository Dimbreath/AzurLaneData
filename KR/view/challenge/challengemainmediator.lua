slot0 = class("ChallengeMainMediator", import("..base.ContextMediator"))
slot0.ON_COMMIT_FLEET = "ChallengeMainMediator:ON_COMMIT_FLEET"
slot0.ON_FLEET_SHIPINFO = "ChallengeMainMediator:ON_FLEET_SHIPINFO"
slot0.ON_PRECOMBAT = "ChallengeMainMediator:ON_PRECOMBAT"
slot0.ON_SELECT_ELITE_COMMANDER = "ChallengeMainMediator:ON_SELECT_ELITE_COMMANDER"
slot0.ON_OPEN_RANK = "ChallengeMainMediator:ON_OPEN_RANK"
slot0.COMMANDER_FORMATION_OP = "ChallengeMainMediator:COMMANDER_FORMATION_OP"

function slot0.register(slot0)
	slot3 = getProxy(ChallengeProxy)

	slot0:bind(slot0.ON_OPEN_RANK, function ()
		slot0:sendNotification(GAME.GO_SCENE, SCENE.BILLBOARD, {
			page = PowerRank.TYPE_CHALLENGE
		})
	end)
	slot0:bind(ChallengeConst.CLICK_GET_AWARD_BTN, function (slot0, slot1)
		slot0:sendNotification(GAME.SUBMIT_TASK, slot1)
	end)
	slot0:bind(ChallengeConst.RESET_DATA_EVENT, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.CHALLENGE2_RESET, {
			mode = slot1,
			isInfiniteSeasonClear = slot2
		})
	end)
	slot0:bind(ActivityBossBattleMediator2.ON_OPEN_DOCK, function (slot0, slot1)
		slot2 = slot1.shipType
		slot3 = slot1.fleetIndex
		slot4 = slot1.shipVO
		slot5 = slot1.fleet
		slot6 = slot1.teamType
		slot9 = {}

		for slot13, slot14 in pairs(slot8) do
			if slot14:getTeamType() ~= slot6 or slot14:isActivityNpc() then
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
	slot0:bind(slot0.ON_COMMIT_FLEET, function ()
		slot0:commitActivityFleet(slot1.id)
	end)
	slot0:bind(slot0.ON_FLEET_SHIPINFO, function (slot0, slot1)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
			shipId = slot1.shipId,
			shipVOs = slot1.shipVOs
		})

		slot0.contextData.editFleet = true
	end)
	slot0:bind(slot0.COMMANDER_FORMATION_OP, function (slot0, slot1)
		slot0:sendNotification(GAME.COMMANDER_FORMATION_OP, {
			data = slot1
		})
	end)
	slot0:bind(ActivityBossBattleMediator2.ON_FLEET_RECOMMEND, function (slot0, slot1)
		slot0:recommendActivityFleet(slot1.id, slot1)
		slot3.viewComponent:setFleet(slot0.recommendActivityFleet:getActivityFleets()[slot1.id])
		slot3.viewComponent:updateEditPanel()
	end)
	slot0:bind(ActivityBossBattleMediator2.ON_FLEET_CLEAR, function (slot0, slot1)
		slot2 = slot0:getActivityFleets()

		slot2[slot1.id][slot1].clearFleet(slot4)
		slot2.viewComponent:setFleet(slot2[slot1.id])
		slot2.viewComponent:updateEditPanel()
	end)
	slot0:bind(slot0.ON_SELECT_ELITE_COMMANDER, function (slot0, slot1, slot2)
		slot4 = nil

		for slot8, slot9 in pairs(slot3) do
			if slot8 == slot1 then
				slot4 = slot9
			end
		end

		slot2:sendNotification(GAME.GO_SCENE, SCENE.COMMANDROOM, {
			maxCount = 1,
			mode = CommandRoomScene.MODE_SELECT,
			activeCommanderId = slot4:getCommanders()[pos],
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
	slot0:bind(slot0.ON_PRECOMBAT, function (slot0, slot1)
		if slot0:checkActivityFleet(slot1.id) ~= true then
			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_no_fleet"))

			return
		end

		if slot0:getActivityFleets()[slot1.id][slot1 + 1].isLegalToFight(slot4) == TeamType.Vanguard then
			pg.TipsMgr.GetInstance():ShowTips(i18n("ship_vo_vanguardFleet_must_hasShip"))

			return
		elseif slot5 == TeamType.Main then
			pg.TipsMgr.GetInstance():ShowTips(i18n("ship_vo_mainFleet_must_hasShip"))

			return
		end

		slot2.viewComponent:hideFleetEdit()

		if not slot3:getUserChallengeInfo(slot1) then
			slot2:sendNotification(GAME.CHALLENGE2_INITIAL, {
				mode = slot1
			})

			return
		end

		slot2:addSubLayers(Context.New({
			mediator = ChallengePreCombatMediator,
			viewComponent = ChallengePreCombatLayer,
			data = {
				system = SYSTEM_CHALLENGE,
				actID = slot1.id,
				mode = slot1,
				func = function ()
					slot0:tryBattle()
				end
			}
		}))
	end)
	slot0.viewComponent:setFleet(slot6)
	slot0.viewComponent:setCommanderPrefabs(getProxy(CommanderProxy):getPrefabFleet())
end

function slot0.listNotificationInterests(slot0)
	return {
		GAME.CHALLENGE2_INITIAL_DONE,
		GAME.CHALLENGE2_RESET_DONE,
		GAME.CHALLENGE2_INFO_DONE,
		GAME.SUBMIT_TASK_DONE,
		CommanderProxy.PREFAB_FLEET_UPDATE
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()
	slot4 = getProxy(ChallengeProxy)

	if slot1:getName() == GAME.CHALLENGE2_INITIAL_DONE then
		slot6 = slot4:getUserChallengeInfo(slot5)

		slot0:addSubLayers(Context.New({
			mediator = ChallengePreCombatMediator,
			viewComponent = ChallengePreCombatLayer,
			data = {
				system = SYSTEM_CHALLENGE,
				actID = getProxy(ActivityProxy).getActivityByType(slot7, ActivityConst.ACTIVITY_TYPE_CHALLENGE).id,
				mode = slot3.mode,
				func = function ()
					slot0:tryBattle()
				end
			}
		}))
		slot0.viewComponent:updateData()
		slot0.viewComponent:updatePaintingList()
		slot0.viewComponent:updateRoundText()
		slot0.viewComponent:updateSlider()
		slot0.viewComponent:updateFuncBtns()
	elseif slot2 == GAME.CHALLENGE2_RESET_DONE then
		if slot0.viewComponent.curMode == ChallengeProxy.MODE_INFINITE and not slot0.viewComponent:isFinishedCasualMode() then
			slot4:setCurMode(ChallengeProxy.MODE_CASUAL)
		end

		slot0.viewComponent:updateData()
		slot0.viewComponent:updateGrade(slot4:getChallengeInfo():getGradeList())
		slot0.viewComponent:updateSwitchModBtn()
		slot0.viewComponent:updatePaintingList()
		slot0.viewComponent:updateRoundText()
		slot0.viewComponent:updateSlider()
		slot0.viewComponent:updateFuncBtns()
	elseif slot2 == GAME.CHALLENGE2_INFO_DONE then
		if slot0.viewComponent.curMode == ChallengeProxy.MODE_INFINITE and not slot0.viewComponent:isFinishedCasualMode() then
			slot4:setCurMode(ChallengeProxy.MODE_CASUAL)
		end

		slot0.viewComponent:updateData()
		slot0.viewComponent:updateGrade(slot4:getChallengeInfo():getGradeList())
		slot0.viewComponent:updateTimePanel()
		slot0.viewComponent:updateSwitchModBtn()
		slot0.viewComponent:updatePaintingList()
		slot0.viewComponent:updateRoundText()
		slot0.viewComponent:updateSlider()
		slot0.viewComponent:updateFuncBtns()
	elseif slot2 == GAME.SUBMIT_TASK_DONE then
		slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3, function ()
			slot0.viewComponent:updateAwardPanel()
		end)
	elseif slot2 == CommanderProxy.PREFAB_FLEET_UPDATE then
		slot0.viewComponent:setCommanderPrefabs(getProxy(CommanderProxy):getPrefabFleet())
		slot0.viewComponent:updateCommanderPrefab()
	end
end

function slot0.getDockCallbackFuncs(slot0, slot1, slot2, slot3, slot4)
	slot5 = getProxy(BayProxy)
	slot6 = getProxy(FleetProxy)
	slot10 = getProxy(ActivityProxy).getActivityByType(slot7, ActivityConst.ACTIVITY_TYPE_CHALLENGE)

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
		slot4 = slot1:getActivityFleets()[slot0:getActivityByType(ActivityConst.ACTIVITY_TYPE_CHALLENGE).id][slot2]

		if slot1.getActivityFleets()[slot0.getActivityByType(ActivityConst.ACTIVITY_TYPE_CHALLENGE).id] then
			slot4:removeShip(slot3)
		end

		if #slot0 > 0 then
			slot4:insertShip(slot4:getShipById(slot0[1]), nil, slot4.insertShip)
		end

		slot1:updateActivityFleet(slot1.id, slot2, slot4)
	end
end

return slot0
