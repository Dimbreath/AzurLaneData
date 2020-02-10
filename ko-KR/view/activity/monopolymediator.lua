slot0 = class("MonopolyMediator", import("..base.ContextMediator"))
slot0.ON_START = "MonopolyMediator:ON_START"
slot0.ON_MOVE = "MonopolyMediator:ON_MOVE"
slot0.ON_TRIGGER = "MonopolyMediator:ON_TRIGGER"
slot0.ON_AWARD = "MonopolyMediator:ON_AWARD"

function slot0.register(slot0)
	slot0:bind(uv0.ON_START, function (slot0, slot1, slot2)
		slot6.activity_id = slot1
		slot6.cmd = ActivityConst.MONOPOLY_OP_THROW
		slot6.callback = slot2

		uv0:sendNotification(GAME.MONOPOLY_OP, {})
	end)
	slot0:bind(uv0.ON_MOVE, function (slot0, slot1, slot2)
		slot6.activity_id = slot1
		slot6.cmd = ActivityConst.MONOPOLY_OP_MOVE
		slot6.callback = slot2

		uv0:sendNotification(GAME.MONOPOLY_OP, {})
	end)
	slot0:bind(uv0.ON_TRIGGER, function (slot0, slot1, slot2)
		slot6.activity_id = slot1
		slot6.cmd = ActivityConst.MONOPOLY_OP_TRIGGER
		slot6.callback = slot2

		uv0:sendNotification(GAME.MONOPOLY_OP, {})
	end)
	slot0:bind(uv0.ON_AWARD, function (slot0, slot1)
		slot5.activity_id = slot1
		slot5.cmd = ActivityConst.MONOPOLY_OP_AWARD

		uv0:sendNotification(GAME.MONOPOLY_OP, {})
	end)
	slot0.viewComponent:setActivity(getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_MONOPOLY))
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = ActivityProxy.ACTIVITY_UPDATED
	slot1[2] = GAME.MONOPOLY_AWARD_DONE

	return {}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == ActivityProxy.ACTIVITY_UPDATED then
		if slot3:getConfig("type") == ActivityConst.ACTIVITY_TYPE_MONOPOLY then
			slot0.viewComponent:updateActivity(slot3)
		end
	elseif slot2 == GAME.MONOPOLY_AWARD_DONE then
		slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3.awards, slot3.callback)
	end
end

return slot0
