slot0 = class("NewCommanderMediator", import("..base.ContextMediator"))
slot0.ON_LOCK = "NewCommanderMediator:ON_LOCK"

function slot0.register(slot0)
	slot0:bind(uv0.ON_LOCK, function (slot0, slot1, slot2)
		slot6.commanderId = slot1
		slot6.flag = slot2

		uv0:sendNotification(GAME.COMMANDER_LOCK, {})
	end)
	slot0.viewComponent:setCommander(slot0.contextData.commander)
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = GAME.COMMANDER_LOCK_DONE

	return {}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.COMMANDER_LOCK_DONE then
		slot0.viewComponent:setCommander(slot3.commander)
		slot0.viewComponent:updateLockState(slot3.flag)
	end
end

return slot0
