slot0 = class("BackYardGarnitureMediator", import("..base.ContextMediator"))
slot0.ADD_FURNITURE = "BackYardGarnitureMediator:ADD_FURNITURE"
slot0.SAVE_FURNITURE = "BackYardGarnitureMediator:SAVE"
slot0.ClEAR_FURNITURE = "BackYardGarnitureMediator:CLEAR"
slot0.OPEN_SHOP = "BackYardGarnitureMediator:OPEN_SHOP"
slot0.REMOVE_PAPER = "BackYardGarnitureMediator:REMOVE_PAPER"
slot0.SAVE_THEME = "BackYardGarnitureMediator:SAVE_THEME"
slot0.DELETE_THEME = "BackYardGarnitureMediator:DELETE_THEME"

function slot0.register(slot0)
	slot0:bind(uv0.ADD_FURNITURE, function (slot0, slot1, slot2)
		pg.backyard:sendNotification(BACKYARD.COMMAND_BACKYARD_FURNITURE, {
			name = BACKYARD.FURNITURE_ADD,
			furniture = slot1,
			callback = slot2
		})
	end)
	slot0:bind(uv0.REMOVE_PAPER, function (slot0, slot1)
		pg.backyard:sendNotification(BACKYARD.COMMAND_BACKYARD_FURNITURE, {
			name = BACKYARD.REMOVE_PAPER,
			type = slot1
		})
	end)
	slot0:bind(uv0.SAVE_FURNITURE, function (slot0)
		pg.backyard:sendNotification(BACKYARD.GARNITURE_SAVE)
	end)
	slot0:bind(uv0.ClEAR_FURNITURE, function (slot0, slot1)
		pg.backyard:sendNotification(BACKYARD.GARNITURE_CLEAR, {
			tip = slot1
		})
	end)
	slot0:bind(uv0.OPEN_SHOP, function (slot0)
		uv0:sendNotification(GAME.OPEN_BACKYARD_SHOP)
	end)
	slot0:bind(uv0.SAVE_THEME, function (slot0, slot1, slot2)
		uv0:sendNotification(GAME.SAVE_DORMTHEME, {
			id = slot1,
			name = slot2,
			furnitureputList = getBackYardProxy(BackYardHouseProxy):getData():getSaveData()
		})
	end)
	slot0:bind(uv0.DELETE_THEME, function (slot0, slot1)
		uv0:sendNotification(GAME.DELETE_BACKYARD_THEME, slot1)
	end)

	slot2, slot3 = slot0:packHouse(getBackYardProxy(BackYardHouseProxy):getData())

	slot0.viewComponent:setHouseVO(slot2, slot3)

	slot0.dormProxy = getProxy(DormProxy)

	slot0.viewComponent:setdormProxy(slot0.dormProxy)

	slot0.contextData.floor = slot0.dormProxy.floor

	slot0.viewComponent:setFurnitrues(slot0.dormProxy:getTempFurnitrues())

	if not slot0.dormProxy:getThemes() then
		slot0:sendNotification(GAME.GET_DORMTHEME)
	else
		slot0.viewComponent:setUserThemes(slot4)
	end
end

function slot0.listNotificationInterests(slot0)
	return {
		BackyardMainMediator.USED_FURNITURE,
		BackyardMainMediator.NONUSED_FURNITURE,
		GAME.GET_DORMTHEME_DONE,
		DormProxy.THEME_ADDED,
		DormProxy.THEME_DELETED,
		GAME.DELETE_BACKYARD_THEME_DONE
	}
end

function slot0.handleNotification(slot0, slot1)
	if slot1:getName() == BackyardMainMediator.USED_FURNITURE or slot2 == BackyardMainMediator.NONUSED_FURNITURE then
		if slot2 == BackyardMainMediator.NONUSED_FURNITURE then
			slot0.dormProxy:getFurniById(slot1:getBody()):updatePosition(Vector2(0, 0))
		else
			slot4:updatePosition(nil)
		end

		slot6, slot7 = slot0:packHouse(getBackYardProxy(BackYardHouseProxy):getData())

		slot0.viewComponent:setHouseVO(slot6, slot7)
		slot0.viewComponent:updateDecorationTF(slot4)
		slot0.viewComponent:filterTheme()
	elseif slot2 == GAME.GET_DORMTHEME_DONE then
		slot0.viewComponent:setUserThemes(slot0.dormProxy:getThemes())
	elseif slot2 == DormProxy.THEME_ADDED then
		slot0.viewComponent:addTheme(slot3)
	elseif slot2 == DormProxy.THEME_DELETED then
		slot0.viewComponent:closeThemeBox()
		slot0.viewComponent:deleteTheme(slot3)
	elseif slot2 == GAME.DELETE_BACKYARD_THEME_DONE then
		slot0.viewComponent.selectThemeVO = nil
	end
end

function slot0.packHouse(slot0, slot1)
	slot2 = Clone(slot1)
	slot3 = getProxy(DormProxy)

	for slot9, slot10 in pairs(slot3:getData():getOtherFloorFurnitrues(slot3.floor)) do
		slot2:addFurniture(BackyardFurnitureVO.New(slot10))
	end

	if slot2.wallPaper then
		slot2:addFurniture(slot2.wallPaper)
	end

	if slot2.floorPaper then
		slot2:addFurniture(slot2.floorPaper)
	end

	return slot2, Clone(slot1)
end

return slot0
