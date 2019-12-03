slot0 = class("DailyLevelMediator", import("..base.ContextMediator"))
slot0.ON_STAGE = "DailyLevelMediator:ON_STAGE"
slot0.ON_CHALLENGE = "DailyLevelMediator:ON_CHALLENGE"
slot0.ON_RESET_CHALLENGE = "DailyLevelMediator:ON_RESET_CHALLENGE"
slot0.ON_CONTINUE_CHALLENGE = "DailyLevelMediator:ON_CONTINUE_CHALLENGE"
slot0.ON_CHALLENGE_EDIT_FLEET = "DailyLevelMediator:ON_CHALLENGE_EDIT_FLEET"
slot0.ON_REQUEST_CHALLENGE = "DailyLevelMediator:ON_REQUEST_CHALLENGE"
slot0.ON_CHALLENGE_FLEET_CLEAR = "DailyLevelMediator.ON_CHALLENGE_FLEET_CLEAR"
slot0.ON_CHALLENGE_FLEET_RECOMMEND = "DailyLevelMediator.ON_CHALLENGE_FLEET_RECOMMEND"
slot0.ON_CHALLENGE_OPEN_DOCK = "DailyLevelMediator:ON_CHALLENGE_OPEN_DOCK"
slot0.ON_CHALLENGE_OPEN_RANK = "DailyLevelMediator:ON_CHALLENGE_OPEN_RANK"

slot0.register = function (slot0)
	slot0.viewComponent:setDailyCounts(getProxy(DailyLevelProxy).getRawData(slot1))

	slot2 = getProxy(BayProxy)

	slot2:setSelectShipId(nil)

	slot0.ships = slot2:getRawData()

	slot0.viewComponent:setShips(slot0.ships)
	slot0.viewComponent:updateRes(slot4)
	slot0:bind(slot0.ON_STAGE, function (slot0, slot1)
		slot0.dailyLevelId = slot1.contextData.dailyLevelId
		slot2 = PreCombatLayer
		slot3 = SYSTEM_ROUTINE

		if pg.expedition_data_template[slot1.id].type == Stage.SubmarinStage then
			slot2 = PreCombatLayerSubmarine
			slot3 = SYSTEM_SUB_ROUTINE
		end

		slot1:addSubLayers(Context.New({
			mediator = PreCombatMediator,
			viewComponent = slot2,
			data = {
				stageId = slot1.id,
				system = slot3
			}
		}))
	end)
	slot0:bind(slot0.ON_CHALLENGE, function ()
		slot0.viewComponent:openChallengeView()
	end)
	slot0:bind(slot0.ON_CHALLENGE_EDIT_FLEET, function (slot0, slot1)
		slot2 = challengeProxy:getCurrentChallengeInfo()

		slot2:setDamageRateID(slot1.damageRateID)
		slot2:setLevelRateID(slot1.levelRateID)
		challengeProxy:updateChallenge(slot2)
		slot0.viewComponent:openChallengeFleetEditView()
	end)
	slot0:bind(slot0.ON_CONTINUE_CHALLENGE, function ()
		slot0:addSubLayers(Context.New({
			mediator = ChallengePreCombatMediator,
			viewComponent = ChallengePreCombatLayer,
			data = {}
		}))
	end)
	slot0:bind(slot0.ON_RESET_CHALLENGE, function ()
		slot0:sendNotification(GAME.CHALLENGE_RESET)
	end)
	slot0:bind(slot0.ON_CHALLENGE_FLEET_CLEAR, function ()
		challengeProxy:clearEdittingFleet()
		challengeProxy.clearEdittingFleet.viewComponent:flushFleetEditButton()
	end)
	slot0:bind(slot0.ON_CHALLENGE_FLEET_RECOMMEND, function ()
		challengeProxy:recommendChallengeFleet()
		challengeProxy.recommendChallengeFleet.viewComponent:flushFleetEditButton()
	end)
	slot0:bind(slot0.ON_REQUEST_CHALLENGE, function ()
		slot1 = challengeProxy:getCurrentChallengeInfo().getGSRateID(slot0)

		for slot5 = 1, 4, 1 do
			PlayerPrefs.SetInt("challengeShipUID_" .. slot5, nil)
		end

		for slot5 = 1, #slot0:getShips(), 1 do
			PlayerPrefs.SetInt("challengeShipUID_" .. slot5, slot0:getShips()[slot5].id)
		end

		slot0:sendNotification(GAME.CHALLENGE_REQUEST, {
			shipIDList = slot0:getShips(),
			levelRate = slot0:getLevelRateID(),
			damageRate = slot0:getDamageRateID(),
			gsRate = slot1
		})
	end)
	slot0:bind(slot0.ON_CHALLENGE_OPEN_RANK, function ()
		slot0:sendNotification(GAME.GO_SCENE, SCENE.BILLBOARD, {
			page = PowerRank.TYPE_CHALLENGE
		})
	end)
	slot0:bind(slot0.ON_CHALLENGE_OPEN_DOCK, function (slot0, slot1)
		slot2 = slot1.shipType
		slot3 = slot1.shipVO
		slot4 = slot1.fleet
		slot5 = slot1.teamType
		slot8 = {}

		for slot12, slot13 in pairs(slot7) do
			if slot13:getTeamType() ~= slot5 or (slot2 ~= 0 and not table.contains({
				slot2
			}, slot13:getShipType())) then
				table.insert(slot8, slot12)
			end
		end

		slot9, slot10 = nil

		if slot3 == nil then
			slot9 = false
			slot10 = nil
		else
			slot9 = true
			slot10 = slot3.id
		end

		slot0.contextData.challenge = true
		slot19.onShip, slot19.confirmSelect, slot19.onSelected = slot0:getDockCallbackFuncs(slot4, slot3)

		slot0:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
			selectedMin = 0,
			selectedMax = 1,
			ignoredIds = slot8,
			activeShipId = slot10,
			leastLimitMsg = i18n("ship_formationMediator_leastLimit"),
			quitTeam = slot9,
			leftTopInfo = i18n("word_formation"),
			onShip = slot12,
			confirmSelect = slot13,
			onSelected = slot14,
			flags = {
				inAdmiral = false,
				inEvent = false,
				inChallenge = true,
				inFleet = false,
				inClass = false,
				inTactics = false,
				inBackyard = false
			}
		})
	end)

	if slot0.contextData.loadBillBoard then
		slot0.contextData.loadBillBoard = nil

		slot0.viewComponent:emit(slot0.ON_CHALLENGE_OPEN_RANK)
	end
end

slot0.listNotificationInterests = function (slot0)
	return {
		PlayerProxy.UPDATED,
		ChallengeProxy.PRECOMBAT,
		ChallengeProxy.CHALLENGE_UPDATED,
		GAME.CHALLENGE_REQUEST_DONE,
		GAME.CHALLENGE_RESET_DONE
	}
end

slot0.handleNotification = function (slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == PlayerProxy.UPDATED then
		slot0.viewComponent:updateRes(slot3)
	elseif slot2 == ChallengeProxy.PRECOMBAT then
		slot0:addSubLayers(Context.New({
			mediator = ChallengePreCombatMediator,
			viewComponent = ChallengePreCombatLayer,
			data = {
				stageId = stage.id,
				system = SYSTEM_ROUTINE
			}
		}))
	elseif slot2 == GAME.CHALLENGE_REQUEST_DONE then
		slot0:addSubLayers(Context.New({
			mediator = ChallengePreCombatMediator,
			viewComponent = ChallengePreCombatLayer,
			data = {}
		}))
		slot0.viewComponent:closeChallengeFleetEditView()
	elseif slot2 == GAME.CHALLENGE_RESET_DONE then
		slot0.viewComponent:closeChallengeSettingView()
		slot0.viewComponent:openChallengeSettingView()
	elseif slot2 == ChallengeProxy.CHALLENGE_UPDATED then
		slot0.viewComponent:setChallengeInfo(getProxy(ChallengeProxy).getCurrentChallengeInfo(slot4))
	end
end

slot0.getDockCallbackFuncs = function (slot0, slot1, slot2)
	slot3 = getProxy(BayProxy)
	slot6 = getProxy(ChallengeProxy).getCurrentChallengeInfo(slot4).getShips(slot5)

	return function (slot0, slot1)
		if slot0 and slot0:isSameKind(slot0) then
			return true
		end

		slot2 = Challenge.shipTypeFixer(slot0:getShipType())
		slot3 = 0

		for slot7, slot8 in pairs(slot1) do
			if Challenge.shipTypeFixer(slot7:getShipType()) == slot2 then
				slot3 = slot3 + 1
			end

			if slot0:isSameKind(slot7) then
				return false, i18n("event_same_type_not_allowed")
			end
		end

		if slot0 and Challenge.shipTypeFixer(slot0:getShipType()) == slot2 then
			slot3 = slot3 - 1
		end

		if Challenge.SAME_TYPE_LIMIT <= slot3 then
			return false, i18n("challenge_fleet_type_fail")
		end

		return true
	end, function (slot0, slot1, slot2)
		slot1()
	end, function (slot0)
		if slot0 then
			for slot5, slot6 in ipairs(slot1) do
				if slot6.id == slot0.id then
					slot1 = slot5

					break
				end
			end

			table.remove(slot1, slot1)
		end

		if #slot0 > 0 then
			slot1[#slot1 + 1] = {
				id = slot0[1]
			}
		end

		slot2:updateChallenge(slot3)
	end
end

return slot0
