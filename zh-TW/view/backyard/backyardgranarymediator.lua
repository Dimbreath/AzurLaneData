slot0 = class("BackyardGranaryMediator", import("..base.ContextMediator"))
slot0.USE_FOOD = "BackyardGranaryMediator:USE_FOOD"
slot0.BUY_FOOD = "BackyardGranaryMediator:BUY_FOOD"
slot0.EXTEND_GRANARY = "BackyardGranaryMediator:EXTEND_GRANARY"

function slot0.register(slot0)
	slot0:bind(uv0.USE_FOOD, function (slot0, slot1, slot2, slot3)
		if slot3 then
			uv0:setBackyardRemind()
			uv1.viewComponent:setIsRemind(uv0:getBackyardRemind())
		end

		slot7.id = slot1
		slot7.count = slot2

		uv1:sendNotification(GAME.USE_ITEM, {})
	end)
	slot0.viewComponent:setIsRemind(getProxy(SettingsProxy):getBackyardRemind())
	slot0:bind(uv0.BUY_FOOD, function (slot0, slot1, slot2)
		slot6.id = slot1
		slot6.count = slot2

		uv0:sendNotification(GAME.SHOPPING, {})
	end)
	slot0:bind(uv0.EXTEND_GRANARY, function (slot0, slot1, slot2)
		slot6.id = slot1
		slot6.count = slot2

		uv0:sendNotification(GAME.SHOPPING, {})
	end)

	slot0.dormProxy = getProxy(DormProxy)

	slot0.viewComponent:setTrainShipVOs(slot0.dormProxy:getShipsByState(5))
	slot0.viewComponent:setFoodVOs(getProxy(BagProxy):getItemsByType(3))
	slot0.viewComponent:setPlayerVO(getProxy(PlayerProxy):getData())
	slot0.viewComponent:setDormVO(slot0.dormProxy:getData())
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = BagProxy.ITEM_UPDATED
	slot1[2] = BagProxy.ITEM_ADDED
	slot1[3] = PlayerProxy.UPDATED
	slot1[4] = DormProxy.DORM_UPDATEED

	return {}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == BagProxy.ITEM_UPDATED or slot2 == BagProxy.ITEM_ADDED then
		slot0.viewComponent:setFoodVOs(getProxy(BagProxy):getItemsByType(3))
		slot0.viewComponent:updateItems()
	elseif slot2 == PlayerProxy.UPDATED then
		slot0.viewComponent:setPlayerVO(slot3)
	elseif slot2 == DormProxy.DORM_UPDATEED then
		slot4 = slot0.dormProxy:getData()

		slot0.viewComponent:setDormVO(slot4)
		slot0.viewComponent:updateDorm(slot4)
	end
end

return slot0
