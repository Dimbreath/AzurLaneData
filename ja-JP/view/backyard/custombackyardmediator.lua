slot0 = class("CustomBackyardMediator", import("..base.ContextMediator"))

function slot0.register(slot0)
	slot1 = {}
	slot5 = {}
	slot6, slot7 = nil

	for slot11, slot12 in pairs(require("GameCfg.backyardTheme.theme_" .. 9)["furnitures_" .. 4]) do
		slot13 = Furniture.New(slot12)

		if slot13.position and slot13:getConfig("type") == Furniture.TYPE_WALLPAPER then
			slot6 = BackyardFurnitureVO.New(slot13)
		elseif slot13.position and slot14 == Furniture.TYPE_FLOORPAPER then
			slot7 = BackyardFurnitureVO.New(slot13)
		elseif slot13.position then
			slot5[slot11] = BackyardFurnitureVO.New(slot13)
		end
	end

	slot9.ships = slot1
	slot9.furnitures = slot5
	slot9.level = slot3
	slot9.wallPaper = slot6
	slot9.floorPaper = slot7
	slot0.contextData.house = BackYardHouseVO.New({})
	slot9 = slot0:getFacade()

	slot9:registerProxy(BackYardHouseProxy.New(slot0.contextData.house))
	slot9:registerCommand(BACKYARD.COMMAND_BACKYARD_BOAT, BYBoatCommand)
	slot0.viewComponent:setHouse(slot9:retrieveProxy(BackYardHouseProxy.__cname):getData())
	slot0:bind(BackyardMainMediator.END_DRAG_SHIP, function (slot0, slot1, slot2)
		slot6.name = BACKYARD.END_DRAG_BOAT
		slot6.id = slot1
		slot6.pos = slot2

		uv0:sendNotification(BACKYARD.COMMAND_BACKYARD_BOAT, {})
	end)
	slot0:bind(BackyardMainMediator.ADD_BOAT_MOVE, function (slot0, slot1)
		slot5.name = BACKYARD.ADD_BOAT_MOVE
		slot5.id = slot1

		uv0:sendNotification(BACKYARD.COMMAND_BACKYARD_BOAT, {})
	end)
	slot0:bind(BackyardMainMediator.CANCEL_SHIP_MOVE, function (slot0, slot1)
		slot5.name = BACKYARD.CANCEL_BOAT_MOVE
		slot5.id = slot1

		uv0:sendNotification(BACKYARD.COMMAND_BACKYARD_BOAT, {})
	end)
	slot0:bind(BackyardMainMediator.INTERACTION, function (slot0, slot1, slot2)
		slot6.name = BACKYARD.INTERACTION
		slot6.shipId = slot1
		slot6.furnitureId = slot2

		uv0:sendNotification(BACKYARD.COMMAND_BACKYARD_BOAT, {})
	end)
	slot0:bind(BackyardMainMediator.INTERACTION_SPINE, function (slot0, slot1, slot2)
		slot6.name = BACKYARD.INTERACTION_SPINE
		slot6.shipId = slot1
		slot6.furnitureId = slot2

		uv0:sendNotification(BACKYARD.COMMAND_BACKYARD_BOAT, {})
	end)
	slot0:bind(BackyardMainMediator.CLEAR_SPINE, function (slot0, slot1)
		slot5.name = BACKYARD.CLEAR_SPINE
		slot5.shipId = slot1

		uv0:sendNotification(BACKYARD.COMMAND_BACKYARD_BOAT, {})
	end)
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = BackYardHouseProxy.BACKYARD_SHIP_MOVE
	slot1[2] = BackYardHouseProxy.BACKYARD_EXIT_SHIP
	slot1[3] = BackYardHouseProxy.SHIP_POS_CHANGE
	slot1[4] = BackYardHouseProxy.CANCEL_SHIP_MOVE
	slot1[5] = BackYardHouseProxy.BACKYARD_INTERACTION_DONE
	slot1[6] = BackYardHouseProxy.SPINE_INTERACTION_START

	return {}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == BackYardHouseProxy.BACKYARD_SHIP_MOVE then
		slot0.viewComponent:boatMove(slot3.id, slot3.pos, slot3.isLastStep)
	elseif slot2 == BackYardHouseProxy.BACKYARD_EXIT_SHIP then
		slot0.viewComponent:exitBoat(slot3)
	elseif slot2 == BackYardHouseProxy.SHIP_POS_CHANGE then
		slot0.viewComponent:updateShipPos(slot3)
	elseif slot2 == BackYardHouseProxy.CANCEL_SHIP_MOVE then
		slot0.viewComponent:cancelShipMove(slot3.id)
	elseif slot2 == BackYardHouseProxy.BACKYARD_INTERACTION_DONE then
		slot0.viewComponent:setInterAction(false, slot3.shipId, slot3.furnitureId, slot3.order)
	elseif slot2 == BackYardHouseProxy.SPINE_INTERACTION_START then
		slot0.viewComponent:setInterAction(true, slot3.shipId, slot3.furnitureId)
	end
end

function slot0.remove(slot0)
	slot1 = slot0:getFacade()

	slot1:removeProxy(BackYardHouseProxy.__cname)
	slot1:removeCommand(BACKYARD.COMMAND_BACKYARD_BOAT)
end

return slot0
