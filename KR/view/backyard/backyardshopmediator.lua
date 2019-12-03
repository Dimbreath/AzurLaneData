slot0 = class("BackYardShopMediator", import("..base.ContextMediator"))
slot0.BUY_FURNITURE = "BackYardShopMediator:BUY_FURNITURE"

slot0.register = function (slot0)
	slot0.formGarniture = false

	if getProxy(ContextProxy):getContextByMediator(BackYardGarnitureMediator) then
		slot0:sendNotification(GAME.REMOVE_LAYERS, {
			context = slot2
		})

		slot0.formGarniture = true
	end

	slot0:bind(slot0.BUY_FURNITURE, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.BUY_FURNITURE, {
			furnitureIds = slot1,
			type = slot2
		})
	end)

	slot3 = getProxy(DormProxy)

	slot0.viewComponent:setFurnitures(slot3:getFurnitrues())
	slot0.viewComponent:setDorm(slot3:getData())
	slot0.viewComponent:setPlayerVO(getProxy(PlayerProxy):getData())
end

slot0.listNotificationInterests = function (slot0)
	return {
		DormProxy.FURNITURE_ADDED,
		DormProxy.FURNITURE_UPDATED,
		PlayerProxy.UPDATED,
		BagProxy.ITEM_UPDATED,
		GAME.BUY_FURNITURE_DONE
	}
end

slot0.remove = function (slot0)
	if slot0.formGarniture then
		slot0:sendNotification(GAME.OPEN_BACKYARD_GARNARY)
	end
end

slot0.handleNotification = function (slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == DormProxy.FURNITURE_ADDED or slot2 == DormProxy.FURNITURE_UPDATED then
		slot0.viewComponent:updateFurnitrue(slot3)
		slot0.viewComponent:setDorm(getProxy(DormProxy):getData())
	elseif slot2 == PlayerProxy.UPDATED then
		slot0.viewComponent:updatePlayer(slot3)
	elseif slot2 == GAME.BUY_FURNITURE_DONE then
		slot0.viewComponent:updateThemes()
	end
end

return slot0
