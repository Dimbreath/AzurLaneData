slot0 = class("IdolMedalCollectionMediator", import("view.base.ContextMediator"))

function slot0.register(slot0)
	slot0:BindEvent()
end

function slot0.BindEvent(slot0)
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = GAME.MEMORYBOOK_UNLOCK_DONE
	slot1[2] = ActivityProxy.ACTIVITY_SHOW_AWARDS

	return {}
end

function slot0.handleNotification(slot0, slot1)
	if slot1:getName() == GAME.MEMORYBOOK_UNLOCK_DONE then
		slot0.viewComponent:updateAfterSubmit(slot1:getBody())
	elseif slot2 == ActivityProxy.ACTIVITY_SHOW_AWARDS then
		if getProxy(ContextProxy):getCurrentContext().mediator == ActivityMediator then
			return
		end

		slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3.awards, slot3.callback)
	end
end

return slot0
