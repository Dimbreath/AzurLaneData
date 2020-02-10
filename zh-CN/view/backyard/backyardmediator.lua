slot0 = class("BackYardMediator", import("..base.ContextMediator"))
slot0.GO_SHOP = "BackYardMediator:GO_SHOP"
slot0.GO_GRANARY = "BackYardMediator:GO_GRANARY"
slot0.GO_SHIPINFO = "BackYardMediator:GO_SHIPINFO"
slot0.OPEN_ADD_EXP = "BackYardMediator:OPEN_ADD_EXP"
slot0.RENAME = "BackYardMediator:RENAME"
slot0.OPEN_NOFOOD = "BackYardMediator:OPEN_NOFOOD"
slot0.ON_SWITCH_FLOOR = "BackYardMediator:ON_SWITCH_FLOOR"
slot0.ON_SHOPPING = "BackYardMediator:ON_SHOPPING"
slot0.ITEM_UPDATED = "BackYardMediator:ITEM_UPDATED"

function slot0.register(slot0)
	slot0.backyardPoolMgr = BackyardPoolMgr.New()
	slot2 = slot0
	slot1 = slot0.startUpBackyard
	slot3 = slot0.contextData.floor or 1
	slot5, slot5 = slot1(slot2, slot3)

	slot0:bind(uv0.GO_GRANARY, function (slot0)
		BackYardMediator.isInitAddExpPanel = true
		slot1 = uv0

		slot1:addSubLayers(Context.New({
			mediator = BackyardGranaryMediator,
			viewComponent = BackyardGranaryLayer
		}))
	end)
	slot0:bind(uv0.ON_SHOPPING, function (slot0, slot1, slot2)
		slot3 = uv0

		slot3:sendNotification(GAME.SHOPPING, {
			id = slot1,
			count = slot2
		})
	end)
	slot0:bind(uv0.OPEN_ADD_EXP, function (slot0, slot1)
		if mode == BackYardConst.MODE_VISIT then
			return
		end

		slot2 = uv0

		slot2:sendNotification(GAME.OPEN_ADD_EXP, slot1)
	end)
	slot0:bind(uv0.GO_SHOP, function (slot0)
		BackYardMediator.isInitAddExpPanel = true
		slot1 = uv0

		slot1:addSubLayers(Context.New({
			mediator = BackYardShopMediator,
			viewComponent = BackYardShopLayer
		}))
	end)
	slot0:bind(uv0.GO_SHIPINFO, function (slot0, slot1)
		BackYardMediator.isInitAddExpPanel = true
		slot2 = uv0.viewComponent

		slot2:closeNofoodBox(true)

		slot2 = uv0

		slot2:addSubLayers(Context.New({
			mediator = BackYardShipInfoMediator,
			viewComponent = BackYardShipInfoLayer,
			data = {
				type = slot1
			}
		}))
	end)
	slot0:bind(uv0.RENAME, function (slot0, slot1)
		slot2 = uv0

		slot2:sendNotification(GAME.BACKYARD_RENAME, slot1)
	end)
	slot0:bind(uv0.ON_SWITCH_FLOOR, function (slot0, slot1)
		slot2 = uv0

		slot2:quitBackYard()

		slot2 = uv0

		slot2:startUpBackyard(slot1)
	end)

	slot3 = slot0.viewComponent

	slot3:setPlayerVO(slot1)

	slot3 = slot0.viewComponent

	slot3:setDormVO(slot2)
end

function slot0.startUpBackyard(slot0, slot1)
	if not getProxy(DormProxy) then
		return
	end

	if not slot0.backyardPoolMgr then
		return
	end

	slot3 = slot0.viewComponent

	playBGM(slot3:getBGM())

	if not slot0.contextData.mode then
		slot2 = BackYardConst.MODE_DEFAULT
	end

	slot0.contextData.floor = slot1
	slot3 = slot0.viewComponent

	slot3:updateFloor()

	pg.backyard = pm.Facade.getInstance("m02.backyard")
	slot3 = pg.backyard

	slot3:registerCommand(BACKYARD.START_UP, StartUpBackYardCommand)

	slot3 = pg.backyard

	slot3:registerCommand(BACKYARD.COMMAND_BACKYARD_BOAT, BYBoatCommand)

	slot3 = pg.backyard

	slot3:registerCommand(BACKYARD.COMMAND_BACKYARD_FURNITURE, BYFurnitureCommand)

	slot3 = pg.backyard

	slot3:registerCommand(BACKYARD.COMMAND_BACKYARD_HOUSE, BYHouseCommand)

	slot3 = {}
	slot4 = {}
	slot5 = nil

	if slot2 == BackYardConst.MODE_VISIT then
		if slot1 ~= 1 or not Ship.STATE_TRAIN then
			slot6 = Ship.STATE_REST
		end

		for slot10, slot11 in pairs(slot0.contextData.ships) do
			if slot11.state == slot6 then
				slot3[slot11.id] = slot11
			end
		end

		slot5 = slot0.contextData.dorm
		player = slot0.contextData.player
	elseif slot2 == BackYardConst.MODE_DEFAULT then
		slot0.dormProxy = getProxy(DormProxy)
		slot6 = slot0.dormProxy
		slot5 = slot6:getData()
		slot6 = slot0.dormProxy
		slot6 = slot6:getShipsByState(Ship.STATE_TRAIN)
		slot7 = slot0.dormProxy
		slot7 = slot7:getShipsByState(Ship.STATE_REST)

		if slot1 ~= 1 or not slot6 then
			slot3 = slot7
		end

		slot8 = getProxy(PlayerProxy)
		player = slot8:getData()
		slot9 = slot0.viewComponent

		slot9:setShipIds(slot6, slot7)
	end

	slot6 = pg.backyard.sendNotification

	function pg.backyard.sendNotification(slot0, slot1, slot2, slot3)
		if BackYardConst.MODE_VISIT == uv0 and (BACKYARD.BOAT_ADDITION_DONE == slot1 or slot1 == BACKYARD.BOAT_ADDITION_DONE) then
			return
		end

		uv1(slot0, slot1, slot2, slot3)
	end

	slot7 = pg.backyard

	slot7:sendNotification(BACKYARD.START_UP, {
		ships = slot3,
		furnitures = slot5:getFurnitrues(slot1),
		level = slot5.level
	})

	slot0.viewComponent.isLoadedMainUI = false
	slot7 = nil

	function slot8(slot0)
		if pg.backyard and not IsNil(uv0.viewComponent._tf) then
			uv0.viewComponent.isLoadedMainUI = true
			slot0.name = BackYardConst.MAIN_UI_NAME
			slot1 = uv0.viewComponent
			uv1 = BackYardView.New(slot0, uv2, uv0.backyardPoolMgr, slot1:getBGM())
			slot2 = uv0.viewComponent

			slot2:setBlackyardView(uv1)
			setActive(slot0, true)
			setParent(slot0, uv0.viewComponent._tf)

			slot2 = tf(slot0)

			slot2:SetSiblingIndex(1)

			slot3 = pg.backyard

			slot3:registerMediator(BackyardMainMediator.New(uv1))

			slot3 = uv1

			slot3:init()
		end
	end

	slot9 = slot0.viewComponent._tf

	if not IsNil(slot9:Find(BackYardConst.MAIN_UI_NAME)) then
		slot8(slot9)
	else
		slot10 = PoolMgr.GetInstance()

		slot10:GetUI(BackYardConst.MAIN_UI_NAME, true, slot8)
	end

	getProxy(DormProxy).floor = slot0.contextData.floor

	return player, slot5
end

function slot0.quitBackYard(slot0)
	slot1 = pg.backyard

	slot1:removeMediator(BackyardMainMediator.__cname)

	slot1 = pg.backyard

	slot1:removeProxy(BackYardHouseProxy.__cname)

	slot1 = pg.backyard

	slot1:removeCommand(StartUpBackYardCommand.__cname)

	slot1 = pg.backyard

	slot1:removeCommand(BYBoatCommand.__cname)

	slot1 = pg.backyard

	slot1:removeCommand(BYFurnitureCommand.__cname)

	slot1 = pg.backyard

	slot1:removeCommand(BYHouseCommand.__cname)
	pm.Facade.removeCore("m02.backyard")

	pg.backyard = nil
end

function slot0.remove(slot0)
	slot1 = slot0.viewComponent._tf

	if not IsNil(slot1:Find(BackYardConst.MAIN_UI_NAME)) then
		slot2 = PoolMgr.GetInstance()

		slot2:ReturnUI(BackYardConst.MAIN_UI_NAME, slot1)
	end

	slot2 = slot0.viewComponent

	slot2:emit(BackYardMediator.OPEN_ADD_EXP, 0)
	slot0:quitBackYard()

	slot2 = slot0.backyardPoolMgr

	slot2:clear()

	slot0.backyardPoolMgr = nil
end

function slot0.listNotificationInterests(slot0)
	return {
		DormProxy.DORM_UPDATEED,
		DormProxy.SHIPS_EXP_ADDED,
		PlayerProxy.UPDATED,
		GAME.PUT_FURNITURE_DONE,
		GAME.OPEN_BACKYARD_GARNARY,
		GAME.BACKYARD_RENAME_DONE,
		BackYardMediator.OPEN_NOFOOD,
		GAME.OPEN_BACKYARD_SHOP,
		BagProxy.ITEM_UPDATED,
		BagProxy.ITEM_ADDED,
		GAME.ADD_SHIP_DONE,
		GAME.EXIT_SHIP_DONE
	}
end

function slot0.handleNotification(slot0, slot1)
	slot2 = slot1:getName()
	slot3 = slot1:getBody()

	if slot0.contextData.mode == BackYardConst.MODE_VISIT then
		return
	end

	if slot2 == DormProxy.DORM_UPDATEED then
		slot4 = slot0.dormProxy
		slot5 = slot0.dormProxy
		slot6 = slot0.viewComponent

		slot6:setShipIds(slot4:getShipsByState(Ship.STATE_TRAIN), slot5:getShipsByState(Ship.STATE_REST))

		slot6 = slot0.viewComponent
		slot8 = slot0.dormProxy

		slot6:setDormVO(slot8:getData())
	elseif slot2 == GAME.PUT_FURNITURE_DONE then
		slot4 = slot0.viewComponent
		slot6 = slot0.dormProxy

		slot4:setDormVO(slot6:getData())
	elseif slot2 == BagProxy.ITEM_UPDATED or slot2 == BagProxy.ITEM_ADDED then
		if pg.backyard then
			slot4 = pg.backyard

			slot4:sendNotification(uv0.ITEM_UPDATED)
		end
	elseif slot2 == PlayerProxy.UPDATED then
		if getProxy(PlayerProxy) then
			slot5 = slot0.viewComponent

			slot5:setPlayerVO(slot4:getData())
		end
	elseif slot2 == BackYardMediator.OPEN_NOFOOD then
		slot4 = slot0.viewComponent

		slot4:openNofoodBox()
	elseif slot2 == DormProxy.SHIPS_EXP_ADDED then
		if not BackYardMediator.isInitAddExpPanel then
			BackYardMediator.isInitAddExpPanel = true
			slot4 = slot0.dormProxy
			slot5 = table.getCount(slot4:getShipsByState(Ship.STATE_TRAIN))
			slot6 = slot0.dormProxy
			slot7 = slot6:getData().load_exp * slot5

			if slot5 ~= 0 and (slot7 ~= 0 or slot6.food ~= 0) then
				slot8 = slot0.viewComponent

				slot8:closeNofoodBox(true)
				slot0:addSubLayers(Context.New({
					mediator = BackYardSettlementMediator,
					viewComponent = BackYardSettlementLayer,
					data = {
						oldShips = slot3.oldShips,
						newShips = slot3.newShips
					}
				}))
			elseif slot6.food == 0 and slot5 > 0 then
				slot8 = slot0.viewComponent

				slot8:openNofoodBox()
			end
		end
	elseif slot2 == GAME.BACKYARD_RENAME_DONE then
		slot4 = slot0.viewComponent

		slot4:closeRenameBox()
	elseif slot2 == GAME.OPEN_BACKYARD_GARNARY then
		slot0:addSubLayers(Context.New({
			mediator = BackYardGarnitureMediator,
			viewComponent = BackYardGarnitureLayer
		}), nil, function ()
			if uv0 and uv0.callback then
				uv0.callback()
			end
		end)
	elseif slot2 == GAME.OPEN_BACKYARD_SHOP then
		slot0:addSubLayers(Context.New({
			mediator = BackYardShopMediator,
			viewComponent = BackYardShopLayer
		}))
	elseif slot2 == GAME.ADD_SHIP_DONE then
		if not pg.backyard then
			return
		end

		if slot0.contextData.floor ~= slot3.type then
			return
		end

		slot4 = pg.backyard

		slot4:sendNotification(BACKYARD.COMMAND_BACKYARD_BOAT, {
			name = BACKYARD.SHIP_ADDED,
			id = slot3.id
		})
	elseif slot2 == GAME.EXIT_SHIP_DONE then
		if not pg.backyard then
			return
		end

		slot4 = getBackYardProxy(BackYardHouseProxy)

		if not slot4:existShip(slot3.id) then
			return
		end

		slot5 = pg.backyard

		slot5:sendNotification(BACKYARD.COMMAND_BACKYARD_BOAT, {
			name = BACKYARD.SHIP_EXITED,
			id = slot3.id
		})
	end
end

return slot0
