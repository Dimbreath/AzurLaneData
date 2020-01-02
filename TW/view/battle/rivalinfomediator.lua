slot0 = class("RivalInfoMediator", import("..base.ContextMediator"))
slot0.START_BATTLE = "RivalInfoMediator:START_BATTLE"

function slot0.register(slot0)
	slot0.viewComponent:setRival(slot0.contextData.rival)
	slot0:bind(slot0.START_BATTLE, function (slot0)
		slot1 = nil

		if slot0.contextData.type == RivalInfoLayer.TYPE_SHAM then
			slot1 = SYSTEM_SHAM
		elseif slot0.contextData.type == RivalInfoLayer.TYPE_BATTLE then
			slot1 = SYSTEM_DUEL
		end

		slot0:sendNotification(GAME.MILITARY_STARTED, {
			rivalId = slot0.contextData.rival.id,
			system = slot1
		})
		slot0.viewComponent:emit(BaseUI.ON_CLOSE)
	end)
end

function slot0.listNotificationInterests(slot0)
	return {}
end

function slot0.handleNotification(slot0, slot1)
	slot2 = slot1:getName()
	slot3 = slot1:getBody()
end

return slot0
