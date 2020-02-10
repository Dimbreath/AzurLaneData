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

function slot0.register(slot0)
	slot0.viewComponent:setDailyCounts(getProxy(DailyLevelProxy):getRawData())

	slot2 = getProxy(BayProxy)

	slot2:setSelectShipId(nil)

	slot0.ships = slot2:getRawData()

	slot0.viewComponent:setShips(slot0.ships)
	slot0.viewComponent:updateRes(getProxy(PlayerProxy):getData())
	slot0:bind(uv0.ON_STAGE, function (slot0, slot1)
		uv0.dailyLevelId = uv1.contextData.dailyLevelId
		slot2 = PreCombatLayer
		slot3 = SYSTEM_ROUTINE

		if pg.expedition_data_template[slot1.id].type == Stage.SubmarinStage then
			slot2 = PreCombatLayerSubmarine
			slot3 = SYSTEM_SUB_ROUTINE
		end

		slot8.mediator = PreCombatMediator
		slot8.viewComponent = slot2
		slot9.stageId = slot1.id
		slot9.system = slot3
		slot8.data = {}

		uv1:addSubLayers(Context.New({}))
	end)
	slot0:bind(uv0.ON_CHALLENGE, function ()
		uv0.viewComponent:openChallengeView()
	end)
	slot0:bind(uv0.ON_CHALLENGE_EDIT_FLEET, function (slot0, slot1)
		slot2 = challengeProxy:getCurrentChallengeInfo()

		slot2:setDamageRateID(slot1.damageRateID)
		slot2:setLevelRateID(slot1.levelRateID)
		challengeProxy:updateChallenge(slot2)
		uv0.viewComponent:openChallengeFleetEditView()
	end)
	slot0:bind(uv0.ON_CONTINUE_CHALLENGE, function ()
		slot3.mediator = ChallengePreCombatMediator
		slot3.viewComponent = ChallengePreCombatLayer
		slot3.data = {}

		uv0:addSubLayers(Context.New({}))
	end)
	slot0:bind(uv0.ON_RESET_CHALLENGE, function ()
		uv0:sendNotification(GAME.CHALLENGE_RESET)
	end)
	slot0:bind(uv0.ON_CHALLENGE_FLEET_CLEAR, function ()
		challengeProxy:clearEdittingFleet()
		uv0.viewComponent:flushFleetEditButton()
	end)
	slot0:bind(uv0.ON_CHALLENGE_FLEET_RECOMMEND, function ()
		challengeProxy:recommendChallengeFleet()
		uv0.viewComponent:flushFleetEditButton()
	end)
	slot0:bind(uv0.ON_REQUEST_CHALLENGE, function ()
		slot1 = challengeProxy:getCurrentChallengeInfo():getGSRateID()

		for slot5 = 1, 4, 1 do
			PlayerPrefs.SetInt("challengeShipUID_" .. slot5, nil)
		end

		for slot5 = 1, #slot0:getShips(), 1 do
			PlayerPrefs.SetInt("challengeShipUID_" .. slot5, slot0:getShips()[slot5].id)
		end

		slot5.shipIDList = slot0:getShips()
		slot5.levelRate = slot0:getLevelRateID()
		slot5.damageRate = slot0:getDamageRateID()
		slot5.gsRate = slot1

		uv0:sendNotification(GAME.CHALLENGE_REQUEST, {})
	end)
	slot0:bind(uv0.ON_CHALLENGE_OPEN_RANK, function ()
		slot4.page = PowerRank.TYPE_CHALLENGE

		uv0:sendNotification(GAME.GO_SCENE, SCENE.BILLBOARD, {})
	end)
	slot0:bind(uv0.ON_CHALLENGE_OPEN_DOCK, function (slot0, slot1)
		slot2 = slot1.shipType
		slot3 = slot1.shipVO
		slot4 = slot1.fleet

		for slot12, slot13 in pairs(getProxy(BayProxy):getRawData()) do
			if slot13:getTeamType() == slot1.teamType and slot2 ~= 0 then
				slot15[1] = slot2

				if not table.contains({}, slot13:getShipType()) then
					table.insert({}, slot12)
				end
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

		uv0.contextData.challenge = true
		slot19.onShip, slot19.confirmSelect, slot19.onSelected = uv0:getDockCallbackFuncs(slot4, slot3)
		slot19.ignoredIds = slot8
		slot19.activeShipId = slot10
		slot19.leastLimitMsg = i18n("ship_formationMediator_leastLimit")
		slot19.quitTeam = slot9
		slot19.leftTopInfo = i18n("word_formation")
		slot19.flags = {
			inAdmiral = false,
			inEvent = false,
			inChallenge = true,
			inFleet = false,
			inClass = false,
			inTactics = false,
			inBackyard = false
		}

		uv0:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
			selectedMin = 0,
			selectedMax = 1
		})
	end)

	if slot0.contextData.loadBillBoard then
		slot0.contextData.loadBillBoard = nil

		slot0.viewComponent:emit(uv0.ON_CHALLENGE_OPEN_RANK)
	end
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = PlayerProxy.UPDATED
	slot1[2] = ChallengeProxy.PRECOMBAT
	slot1[3] = ChallengeProxy.CHALLENGE_UPDATED
	slot1[4] = GAME.CHALLENGE_REQUEST_DONE
	slot1[5] = GAME.CHALLENGE_RESET_DONE

	return {}
end

function slot0.handleNotification(slot0, slot1)
	if slot1:getName() == PlayerProxy.UPDATED then
		slot0.viewComponent:updateRes(slot1:getBody())
	elseif slot2 == ChallengeProxy.PRECOMBAT then
		slot7.mediator = ChallengePreCombatMediator
		slot7.viewComponent = ChallengePreCombatLayer
		slot8.stageId = stage.id
		slot8.system = SYSTEM_ROUTINE
		slot7.data = {}

		slot0:addSubLayers(Context.New({}))
	elseif slot2 == GAME.CHALLENGE_REQUEST_DONE then
		slot7.mediator = ChallengePreCombatMediator
		slot7.viewComponent = ChallengePreCombatLayer
		slot7.data = {}

		slot0:addSubLayers(Context.New({}))
		slot0.viewComponent:closeChallengeFleetEditView()
	elseif slot2 == GAME.CHALLENGE_RESET_DONE then
		slot0.viewComponent:closeChallengeSettingView()
		slot0.viewComponent:openChallengeSettingView()
	elseif slot2 == ChallengeProxy.CHALLENGE_UPDATED then
		slot0.viewComponent:setChallengeInfo(getProxy(ChallengeProxy):getCurrentChallengeInfo())
	end
end

function slot0.getDockCallbackFuncs(slot0, slot1, slot2)
	slot3 = getProxy(BayProxy)
	slot6 = getProxy(ChallengeProxy):getCurrentChallengeInfo():getShips()

	return function (slot0, slot1)
		if uv0 then
			if uv0:isSameKind(slot0) then
				return true
			end
		end

		for slot7, slot8 in pairs(uv1) do
			if Challenge.shipTypeFixer(slot7:getShipType()) == Challenge.shipTypeFixer(slot0:getShipType()) then
				slot3 = 0 + 1
			end

			if slot0:isSameKind(slot7) then
				return false, i18n("event_same_type_not_allowed")
			end
		end

		if uv0 then
			if Challenge.shipTypeFixer(uv0:getShipType()) == slot2 then
				slot3 = slot3 - 1
			end
		end

		if Challenge.SAME_TYPE_LIMIT <= slot3 then
			return false, i18n("challenge_fleet_type_fail")
		end

		return true
	end, function (slot0, slot1, slot2)
		slot1()
	end, function (slot0)
		if uv0 then
			slot1 = nil

			for slot5, slot6 in ipairs(uv1) do
				if slot6.id == uv0.id then
					slot1 = slot5

					break
				end
			end

			table.remove(uv1, slot1)
		end

		if #slot0 > 0 then
			slot3.id = slot0[1]
			uv1[#uv1 + 1] = {}
		end

		uv2:updateChallenge(uv3)
	end
end

return slot0
