slot0 = class("MilitaryExerciseMediator", import("..base.ContextMediator"))
slot0.OPEN_RANK = "MilitaryExerciseMediator:OPEN_RANK"
slot0.OPEN_SHOP = "MilitaryExerciseMediator:OPEN_SHOP"
slot0.OPEN_DOCKYARD = "MilitaryExerciseMediator:OPEN_DOCKYARD"
slot0.REPLACE_RIVALS = "MilitaryExerciseMediator:REPLACE_RIVALS"
slot0.RECOVER_UP = "MilitaryExerciseMediator:RECOVER_UP"
slot0.START_BATTLE = "MilitaryExerciseMediator:START_BATTLE"
slot0.OPEN_RIVAL_INFO = "MilitaryExerciseMediator:OPEN_RIVAL_INFO"

function slot0.register(slot0)
	slot0.viewComponent:updatePlayer(getProxy(PlayerProxy):getData())
	slot0.viewComponent:setShips(getProxy(BayProxy):getRawData())
	slot0:bind(uv0.OPEN_RANK, function (slot0)
		slot5.page = PowerRank.TYPE_MILITARY_RANK

		uv0:sendNotification(GAME.GO_SCENE, SCENE.BILLBOARD, {})
	end)
	slot0:bind(uv0.OPEN_RIVAL_INFO, function (slot0, slot1)
		slot5.viewComponent = RivalInfoLayer
		slot5.mediator = RivalInfoMediator
		slot6.rival = slot1
		slot6.type = RivalInfoLayer.TYPE_BATTLE
		slot5.data = {}

		uv0:addSubLayers(Context.New({}))
	end)
	slot0:bind(uv0.OPEN_DOCKYARD, function (slot0, slot1, slot2)
		uv0:sendNotification(GAME.GO_SCENE, SCENE.EXERCISEFORMATION)
	end)
	slot0:bind(uv0.OPEN_SHOP, function (slot0)
		slot4.mediator = ShopsMediator
		slot4.viewComponent = ShopsLayer
		slot5.warp = ShopsLayer.TYPE_MILITARY_SHOP
		slot4.data = {}

		uv0:addSubLayers(Context.New({}))
	end)
	slot0:bind(uv0.REPLACE_RIVALS, function (slot0)
		uv0:sendNotification(GAME.REPLACE_RIVALS)
	end)

	slot8 = slot0.viewComponent

	slot8:setActivity(getProxy(ActivityProxy):getMilitaryExerciseActivity())

	if getProxy(MilitaryExerciseProxy):getSeasonInfo() then
		slot0.viewComponent:setSeasonInfo(slot8)
	else
		slot0:sendNotification(GAME.GET_SEASON_INFO)
	end
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = GAME.REPLACE_RIVALS_DONE
	slot1[2] = GAME.GET_SEASON_INFO_DONE
	slot1[3] = MilitaryExerciseProxy.EXERCISE_FLEET_UPDATED
	slot1[4] = PlayerProxy.UPDATED
	slot1[5] = MilitaryExerciseProxy.SEASON_INFO_UPDATED
	slot1[6] = GAME.MILITARY_STARTED
	slot1[7] = GAME.REMOVE_LAYERS
	slot1[8] = ActivityProxy.ACTIVITY_UPDATED

	return {}
end

function slot0.handleNotification(slot0, slot1)
	if slot1:getName() == GAME.REPLACE_RIVALS_DONE then
		slot0.viewComponent:setRivals(slot1:getBody())
		slot0.viewComponent:updateRivals()
		pg.TipsMgr.GetInstance():ShowTips(i18n("exercise_replace_rivals_ok_tip"))
	elseif slot2 == GAME.GET_SEASON_INFO_DONE then
		slot0.viewComponent:setSeasonInfo(slot3)
	elseif slot2 == MilitaryExerciseProxy.EXERCISE_FLEET_UPDATED then
		slot0.viewComponent:setFleet(slot3)
		slot0.viewComponent:initPlayerFleet()
	elseif slot2 == PlayerProxy.UPDATED then
		slot0.viewComponent:updatePlayer(slot3)
	elseif slot2 == MilitaryExerciseProxy.SEASON_INFO_UPDATED then
		slot0.viewComponent:updateSeaInfoVO(slot3)
		slot0.viewComponent:updateSeasonTime()
	elseif slot2 == GAME.MILITARY_STARTED then
		slot7.mediator = PreCombatMediator
		slot7.viewComponent = PreCombatLayer
		slot8.system = slot3.system
		slot8.rivalId = slot3.rivalId
		slot7.data = {
			stageId = 80000
		}

		slot0:addSubLayers(Context.New({}))
	elseif slot2 == GAME.REMOVE_LAYERS then
		-- Nothing
	elseif slot2 == ActivityProxy.ACTIVITY_UPDATED and slot3.id == ActivityConst.MILITARY_EXERCISE_ACTIVITY_ID then
		slot0.viewComponent:setActivity(slot3)
		slot0.viewComponent:updateSeasonLeftTime(slot3.stopTime)
	end
end

return slot0
