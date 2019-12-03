slot0 = class("BlankMediator", import("..base.ContextMediator"))

slot0.register = function (slot0)
	return
end

slot0.listNotificationInterests = function (slot0)
	return {}
end

slot0.handleNotification = function (slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.ANSWER_START_DONE then
	end
end

return slot0
