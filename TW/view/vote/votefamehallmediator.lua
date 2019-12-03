slot0 = class("VoteFameHallMediator", import("..base.ContextMediator"))
slot0.ON_SUBMIT_TASK = "VoteFameHallMediator:ON_SUBMIT_TASK"

slot0.register = function (slot0)
	slot0:bind(slot0.ON_SUBMIT_TASK, function (slot0, slot1)
		slot0:sendNotification(GAME.SUBMIT_TASK, slot1)
	end)
end

slot0.listNotificationInterests = function (slot0)
	return {
		GAME.SUBMIT_TASK_DONE
	}
end

slot0.handleNotification = function (slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.SUBMIT_TASK_DONE then
		slot0.viewComponent:updateTips()
	end
end

return slot0
