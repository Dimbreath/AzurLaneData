slot0 = class("BackYardShopMediator", import("..base.ContextMediator"))
slot0.BUY_FURNITURE = "BackYardShopMediator:BUY_FURNITURE"

function slot0.register(slot0)
	slot0.formGarniture = false

	if getProxy(ContextProxy):getContextByMediator(BackYardGarnitureMediator) then
		slot6.context = slot2

		slot0:sendNotification(GAME.REMOVE_LAYERS, {})

		slot0.formGarniture = true
	end

	slot0:bind(uv0.BUY_FURNITURE, function (slot0, slot1, slot2)
		slot6.furnitureIds = slot1
		slot6.type = slot2

		uv0:sendNotification(GAME.BUY_FURNITURE, {})
	end)

	slot3 = getProxy(DormProxy)

	slot0.viewComponent:setFurnitures(slot3:getFurnitrues())
	slot0.viewComponent:setDorm(slot3:getData())
	slot0.viewComponent:setPlayerVO(getProxy(PlayerProxy):getData())
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = DormProxy.FURNITURE_ADDED
	slot1[2] = DormProxy.FURNITURE_UPDATED
	slot1[3] = PlayerProxy.UPDATED
	slot1[4] = BagProxy.ITEM_UPDATED
	slot1[5] = GAME.BUY_FURNITURE_DONE

	return {}
end

function slot0.remove(slot0)
	if slot0.formGarniture then
		slot0:sendNotification(GAME.OPEN_BACKYARD_GARNARY)
	end
end

function slot0.handleNotification(slot0, slot1)
	if slot1:getName() == DormProxy.FURNITURE_ADDED or slot2 == DormProxy.FURNITURE_UPDATED then
		slot0.viewComponent:updateFurnitrue(slot1:getBody())
		slot0.viewComponent:setDorm(getProxy(DormProxy):getData())
	elseif slot2 == PlayerProxy.UPDATED then
		slot0.viewComponent:updatePlayer(slot3)
	elseif slot2 == GAME.BUY_FURNITURE_DONE then
		slot0.viewComponent:updateThemes()
	end
end

return slot0
