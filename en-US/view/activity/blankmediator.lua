slot0 = class("BlankMediator", import("..base.ContextMediator"))

function slot0.register(slot0)
end

function slot0.listNotificationInterests(slot0)
	return {}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.ANSWER_START_DONE then
		-- Nothing
	end
end

return slot0
