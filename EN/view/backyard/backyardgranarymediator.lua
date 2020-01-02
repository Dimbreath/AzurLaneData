slot0 = class("BackyardGranaryMediator", import("..base.ContextMediator"))
slot0.USE_FOOD = "BackyardGranaryMediator:USE_FOOD"
slot0.BUY_FOOD = "BackyardGranaryMediator:BUY_FOOD"
slot0.EXTEND_GRANARY = "BackyardGranaryMediator:EXTEND_GRANARY"

function slot0.register(slot0)
	slot0:bind(slot0.USE_FOOD, function (slot0, slot1, slot2, slot3)
		if slot3 then
			slot0:setBackyardRemind()
			slot1.viewComponent:setIsRemind(slot0:getBackyardRemind())
		end

		slot1:sendNotification(GAME.USE_ITEM, {
			id = slot1,
			count = slot2
		})
	end)
	slot0.viewComponent:setIsRemind(getProxy(SettingsProxy).getBackyardRemind(slot1))
	slot0:bind(slot0.BUY_FOOD, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.SHOPPING, {
			id = slot1,
			count = slot2
		})
	end)
	slot0:bind(slot0.EXTEND_GRANARY, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.SHOPPING, {
			id = slot1,
			count = slot2
		})
	end)

	slot0.dormProxy = getProxy(DormProxy)

	slot0.viewComponent:setTrainShipVOs(slot0.dormProxy:getShipsByState(5))
	slot0.viewComponent:setFoodVOs(getProxy(BagProxy).getItemsByType(slot2, 3))
	slot0.viewComponent:setPlayerVO(getProxy(PlayerProxy).getData(slot3))
	slot0.viewComponent:setDormVO(slot0.dormProxy:getData())
end

function slot0.listNotificationInterests(slot0)
	return {
		BagProxy.ITEM_UPDATED,
		BagProxy.ITEM_ADDED,
		PlayerProxy.UPDATED,
		DormProxy.DORM_UPDATEED
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == BagProxy.ITEM_UPDATED or slot2 == BagProxy.ITEM_ADDED then
		slot0.viewComponent:setFoodVOs(getProxy(BagProxy):getItemsByType(3))
		slot0.viewComponent:updateItems()
	elseif slot2 == PlayerProxy.UPDATED then
		slot0.viewComponent:setPlayerVO(slot3)
	elseif slot2 == DormProxy.DORM_UPDATEED then
		slot0.viewComponent:setDormVO(slot4)
		slot0.viewComponent:updateDorm(slot0.dormProxy:getData())
	end
end

return slot0
