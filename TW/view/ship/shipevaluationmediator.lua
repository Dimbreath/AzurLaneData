slot0 = class("ShipEvaluationMediator", import("..base.ContextMediator"))

function slot0.register(slot0)
	slot0.showTrans = slot0.contextData.showTrans
	slot0.groupId = slot0.contextData.groupId

	slot0.viewComponent:setShipGroup(slot2)
	slot0.viewComponent:setShowTrans(slot0.showTrans)
	slot0.viewComponent:flushAll()
	slot0:bind(ShipEvaluationLayer.EVENT_LIKE, function (slot0)
		slot0:sendNotification(GAME.LIKE_SHIP, slot0.groupId)
	end)
	slot0:bind(ShipEvaluationLayer.EVENT_EVA, function (slot0, slot1)
		slot0:sendNotification(GAME.EVALUATE_SHIP, {
			groupId = slot0.groupId,
			content = slot1
		})
	end)
	slot0:bind(ShipEvaluationLayer.EVENT_ZAN, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.ZAN_SHIP_EVALUATION, {
			groupId = slot0.groupId,
			evaId = slot1,
			operation = slot2
		})
	end)
end

function slot0.listNotificationInterests(slot0)
	return {
		CollectionProxy.GROUP_INFO_UPDATE,
		CollectionProxy.GROUP_EVALUATION_UPDATE
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == CollectionProxy.GROUP_INFO_UPDATE then
		if slot0.groupId == slot3 then
			slot0.viewComponent:setShipGroup(getProxy(CollectionProxy).getShipGroup(slot5, slot4))
			slot0.viewComponent:flushHeart()
		end
	elseif slot2 == CollectionProxy.GROUP_EVALUATION_UPDATE and slot0.groupId == slot3 then
		slot0.viewComponent:setShipGroup(getProxy(CollectionProxy).getShipGroup(slot5, slot4))
		slot0.viewComponent:flushEva()
	end
end

return slot0
