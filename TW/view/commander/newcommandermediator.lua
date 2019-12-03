slot0 = class("NewCommanderMediator", import("..base.ContextMediator"))
slot0.ON_LOCK = "NewCommanderMediator:ON_LOCK"

slot0.register = function (slot0)
	slot0:bind(slot0.ON_LOCK, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.COMMANDER_LOCK, {
			commanderId = slot1,
			flag = slot2
		})
	end)
	slot0.viewComponent:setCommander(slot0.contextData.commander)
end

slot0.listNotificationInterests = function (slot0)
	return {
		GAME.COMMANDER_LOCK_DONE
	}
end

slot0.handleNotification = function (slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.COMMANDER_LOCK_DONE then
		slot0.viewComponent:setCommander(slot3.commander)
		slot0.viewComponent:updateLockState(slot3.flag)
	end
end

return slot0
