slot0 = class("LinkLinkMediator", import("..base.ContextMediator"))
slot0.EVENT_OPERATION = "event operation"

function slot0.register(slot0)
	slot0:bind(slot0.EVENT_OPERATION, function (slot0, slot1)
		slot0:sendNotification(GAME.ACTIVITY_OPERATION, slot1)
	end)
	slot0:SetActivityData()
	slot0:SetPlayerData()
end

function slot0.listNotificationInterests(slot0)
	return {
		ActivityProxy.ACTIVITY_UPDATED,
		PlayerProxy.UPDATED,
		ActivityProxy.ACTIVITY_SHOW_AWARDS,
		ActivityProxy.ACTIVITY_OPERATION_DONE
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == PlayerProxy.UPDATED then
		slot0.viewComponent:SetPlayer(slot3)
	elseif slot2 == ActivityProxy.ACTIVITY_SHOW_AWARDS then
		slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3.awards, slot3.callback)
	elseif slot2 == ActivityProxy.ACTIVITY_OPERATION_DONE and getProxy(ActivityProxy).getActivityById(slot4, slot3).getConfig(slot5, "type") == ActivityConst.ACTIVITY_TYPE_LINK_LINK then
		slot0.viewComponent:DisplayResult(slot5)
	end
end

function slot0.SetPlayerData(slot0)
	slot0.viewComponent:SetPlayer(getProxy(PlayerProxy).getRawData(slot1))
end

function slot0.SetActivityData(slot0)
	slot0.viewComponent:SetActivity(getProxy(ActivityProxy).getActivityByType(slot1, ActivityConst.ACTIVITY_TYPE_LINK_LINK))
end

return slot0
