slot0 = class("AssignedShipMediator", import("..base.ContextMediator"))
slot0.ON_USE_ITEM = "AssignedShipMediator:ON_USE_ITEM"

function slot0.register(slot0)
	slot0:bind(uv0.ON_USE_ITEM, function (slot0, slot1, slot2, slot3)
		slot7.id = slot1
		slot7.count = slot2
		slot7.arg = slot3

		function slot7.callback(slot0)
			slot4.id = slot0[1].id

			uv0:sendNotification(GAME.USE_ITEM, {
				count = 1
			})
		end

		uv0:sendNotification(GAME.USE_ITEM, {})
	end)
	slot0.viewComponent:setItemVO(slot0.contextData.itemVO)
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = GAME.USE_ITEM_DONE

	return {}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.USE_ITEM_DONE and table.getCount(slot3) ~= 0 then
		slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3, function ()
			triggerButton(uv0.viewComponent.backBtn)
		end)
	end
end

return slot0
