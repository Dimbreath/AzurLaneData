slot0 = class("IdolMedalCollectionMediator", import("view.base.ContextMediator"))

slot0.register = function (slot0)
	slot0:BindEvent()
end

slot0.BindEvent = function (slot0)
	return
end

slot0.listNotificationInterests = function (slot0)
	return {
		GAME.MEMORYBOOK_UNLOCK_DONE,
		ActivityProxy.ACTIVITY_SHOW_AWARDS
	}
end

slot0.handleNotification = function (slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.MEMORYBOOK_UNLOCK_DONE then
		slot0.viewComponent:updateAfterSubmit(slot3)
	elseif slot2 == ActivityProxy.ACTIVITY_SHOW_AWARDS then
		if getProxy(ContextProxy):getCurrentContext().mediator == ActivityMediator then
			return
		end

		slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3.awards, slot3.callback)
	end
end

return slot0
