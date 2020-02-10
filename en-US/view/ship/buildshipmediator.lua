slot0 = class("BuildShipMediator", import("..base.ContextMediator"))
slot0.OPEN_DESTROY = "BuildShipMediator OPEN_CHUANWUSTART"
slot0.OPEN_START_PROJECT = "BuildShipMediator OPEN_START_PROJECT"
slot0.GET_BATCH_SHIP = "BuildShipMediator GET_BATCH_SHIP"
slot0.ACTIVITY_OPERATION = "BuildShipMediator ACTIVITY_OPERATION"
slot0.OPEN_PROJECT_LIST = "BuildShipMediator OPEN_PROJECT_LIST"
slot0.REMOVE_PROJECT_LIST = "BuildShipMediator REMOVE_PROJECT_LIST"
slot0.ON_BUILD = "BuildShipMediator ON_BUILD"
slot0.ACT_ON_BUILD = "BuildShipMediator ACT_ON_BUILD"
slot0.OPEN_EXCHANGE = "BuildShipMediator OPEN_EXCHANGE"
slot0.CLOSE_EXCHANGE = "BuildShipMediator CLOSE_EXCHANGE"
slot0.ON_UPDATE_ACT = "BuildShipMediator ON_UPDATE_ACT"
slot0.SIMULATION_BATTLE = "BuildShipMediator SIMULATION_BATTLE"
slot0.OPEN_PRAY_PAGE = "BuildShipMediator OPEN_PRAY_PAGE"
slot0.CLOSE_PRAY_PAGE = "BuildShipMediator CLOSE_PRAY_PAGE"

function slot0.register(slot0)
	slot2 = getProxy(PlayerProxy):getData()

	slot0.viewComponent:setPlayer(slot2)

	slot0.useItem = pg.ship_data_create_material[1].use_item

	slot0.viewComponent:setUseItem(getProxy(BagProxy):getItemById(slot0.useItem))
	slot0.viewComponent:setFlagShip(getProxy(BayProxy):getShipById(slot2.character))

	slot7 = getProxy(BuildShipProxy)

	slot0.viewComponent:setStartCount(table.getCount(slot7:getRawData()))
	slot0:checkActivityBuild()
	slot0:bind(uv0.OPEN_DESTROY, function (slot0)
		slot6.mode = DockyardScene.MODE_DESTROY
		slot6.leftTopInfo = i18n("word_destroy")
		slot6.onShip = Ship.canDestroyShip
		slot6.ignoredIds = uv0:fileterShips(ShipStatus.FILTER_SHIPS_FLAGS_1)
		slot6.preView = uv1.viewComponent.__cname

		uv1:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
			blockLock = true,
			prevFlag = false,
			selectedMax = 10
		})
	end)
	slot0:bind(uv0.OPEN_PROJECT_LIST, function (slot0)
		if uv0.facade:hasMediator(BuildShipDetailMediator.__cname) then
			return
		end

		slot4.mediator = BuildShipDetailMediator
		slot4.viewComponent = BuildShipDetailLayer
		slot5.LayerWeightMgr_groupName = LayerWeightConst.GROUP_BUILDSHIPSCENE
		slot4.data = {}

		uv0:addSubLayers(Context.New({}))
	end)
	slot0:bind(uv0.REMOVE_PROJECT_LIST, function (slot0)
		if getProxy(ContextProxy):getCurrentContext():getContextByMediator(BuildShipDetailMediator) then
			slot7.context = slot3

			uv0:sendNotification(GAME.REMOVE_LAYERS, {})
		end
	end)
	slot0:bind(uv0.ON_BUILD, function (slot0, slot1, slot2)
		slot6.buildId = slot1
		slot6.count = slot2

		uv0:sendNotification(GAME.BUILD_SHIP, {})
	end)
	slot0:bind(uv0.ACT_ON_BUILD, function (slot0, slot1, slot2, slot3)
		slot7.activity_id = slot1
		slot7.arg1 = slot3
		slot7.buildId = slot2

		uv0:sendNotification(GAME.ACTIVITY_OPERATION, {
			cmd = 1
		})
	end)
	slot0:bind(uv0.OPEN_EXCHANGE, function (slot0)
		if uv0.facade:hasMediator(ExchangeShipMediator.__cname) then
			return
		end

		slot4.mediator = ExchangeShipMediator
		slot4.viewComponent = ExchangeShipLayer
		slot5.LayerWeightMgr_groupName = LayerWeightConst.GROUP_BUILDSHIPSCENE
		slot4.data = {}

		uv0:addSubLayers(Context.New({}))
	end)
	slot0:bind(uv0.ON_UPDATE_ACT, function (slot0)
		uv0.viewComponent:setActivity(getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BUILDSHIP_1))
		uv0.viewComponent:updateActivityBuildPage()
	end)
	slot0:bind(uv0.CLOSE_EXCHANGE, function (slot0)
		if getProxy(ContextProxy):getCurrentContext():getContextByMediator(ExchangeShipMediator) then
			slot7.context = slot3

			uv0:sendNotification(GAME.REMOVE_LAYERS, {})
		end
	end)
	slot0:bind(uv0.OPEN_PRAY_PAGE, function (slot0)
		slot4.mediator = PrayPoolMediator
		slot4.viewComponent = PrayPoolScene
		slot5.LayerWeightMgr_groupName = LayerWeightConst.GROUP_BUILDSHIPSCENE
		slot4.data = {}

		uv0:addSubLayers(Context.New({}))
	end)
	slot0:bind(uv0.CLOSE_PRAY_PAGE, function (slot0)
		if getProxy(ContextProxy):getCurrentContext():getContextByMediator(PrayPoolMediator) then
			slot7.context = slot3

			uv0:sendNotification(GAME.REMOVE_LAYERS, {})
		end
	end)
	slot0:bind(uv0.SIMULATION_BATTLE, function (slot0, slot1)
		slot5.system = SYSTEM_SIMULATION
		slot5.stageId = slot1

		uv0:sendNotification(GAME.BEGIN_STAGE, {})
	end)
	slot0.viewComponent:updateQueueTip(slot7:getFinishCount())

	if slot0.contextData.goToPray == true then
		slot0.viewComponent:switchPage(slot0.viewComponent.PAGE_PRAY, true)
	end
end

function slot0.checkActivityBuild(slot0)
	if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BUILDSHIP_1) and not slot2:isEnd() then
		slot0.viewComponent:setActivity(slot2)
	elseif slot0.contextData.projectName == BuildShipScene.PROJECTS.ACTIVITY then
		slot0.contextData.projectName = nil
	end
end

function slot0.buildFinishComeback(slot0)
	slot1 = getProxy(BuildShipProxy)

	if table.getCount(slot1:getData()) == 0 and slot0.viewComponent then
		if (BuildShip.getPageFromPoolType(slot1:getLastBuildShipPoolType()) or BuildShipScene.PAGE_BUILD) == BuildShipScene.PAGE_PRAY then
			slot3 = getProxy(ActivityProxy)

			if not slot3:getActivityById(ActivityConst.ACTIVITY_PRAY_POOL) or slot3:isEnd() then
				slot2 = BuildShipScene.PAGE_BUILD
			end
		end

		triggerToggle(slot0.viewComponent.toggles[slot2], true)
	end
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = GAME.BUILD_SHIP_DONE
	slot1[2] = BagProxy.ITEM_UPDATED
	slot1[3] = BagProxy.ITEM_ADDED
	slot1[4] = PlayerProxy.UPDATED
	slot1[5] = GAME.EXCHANGE_SHIP_DONE
	slot1[6] = GAME.GET_SHIP_DONE
	slot1[7] = GAME.SKIP_SHIP_DONE
	slot1[8] = GAME.SKIP_BATCH_DONE
	slot1[9] = BuildShipProxy.ADDED
	slot1[10] = BuildShipProxy.REMOVED
	slot1[11] = ActivityProxy.ACTIVITY_ADDED
	slot1[12] = GAME.BEGIN_STAGE_DONE

	return {}
end

function slot0.handleNotification(slot0, slot1)
	if slot1:getName() == PlayerProxy.UPDATED then
		slot0.viewComponent:setPlayer(slot1:getBody())
	elseif slot2 == GAME.GET_SHIP_DONE then
		slot8.mediator = NewShipMediator
		slot8.viewComponent = NewShipLayer
		slot9.ship = slot3.ship
		slot9.quitCallBack = slot3.quitCallBack
		slot9.canSkipBatch = slot3.canSkipBatch
		slot8.data = {}

		function slot8.onRemoved()
			if not uv0.isBatch then
				uv1:buildFinishComeback()
			end
		end

		slot0:addSubLayers(Context.New({}))
		slot0.viewComponent:updateQueueTip(getProxy(BuildShipProxy):getFinishCount())
	elseif slot2 == GAME.SKIP_SHIP_DONE then
		slot0.viewComponent:updateQueueTip(getProxy(BuildShipProxy):getFinishCount())
	elseif slot2 == GAME.SKIP_BATCH_DONE then
		if #slot3 > 0 then
			slot7.items = slot3

			slot0.viewComponent:emit(BaseUI.ON_AWARD, {}, AwardInfoLayer.TITLE.SHIP, function ()
				uv0:buildFinishComeback()
			end)
		else
			slot0:buildFinishComeback()
		end
	elseif slot2 == GAME.BUILD_SHIP_DONE then
		triggerToggle(slot0.viewComponent.toggles[BuildShipScene.PAGE_QUEUE], true)
	elseif slot2 == GAME.EXCHANGE_SHIP_DONE then
		slot7.mediator = NewShipMediator
		slot7.viewComponent = NewShipLayer
		slot8.ship = slot3
		slot7.data = {}

		slot0:addSubLayers(Context.New({}))
	elseif slot2 == BagProxy.ITEM_UPDATED or slot2 == BagProxy.ITEM_ADDED then
		slot0.viewComponent:setUseItem(getProxy(BagProxy):getItemById(slot0.useItem))
	elseif slot2 == BuildShipProxy.ADDED or slot2 == BuildShipProxy.REMOVED then
		slot0.viewComponent:setStartCount(table.getCount(getProxy(BuildShipProxy):getRawData()))
	elseif slot2 == ActivityProxy.ACTIVITY_ADDED then
		slot0:checkActivityBuild()
	elseif slot2 == GAME.BEGIN_STAGE_DONE then
		slot0:sendNotification(GAME.GO_SCENE, SCENE.COMBATLOAD, slot3)
	end
end

return slot0
