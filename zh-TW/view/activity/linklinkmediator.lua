slot0 = class("LinkLinkMediator", import("..base.ContextMediator"))
slot0.EVENT_OPERATION = "event operation"

function slot0.register(slot0)
	slot0:bind(uv0.EVENT_OPERATION, function (slot0, slot1)
		uv0:sendNotification(GAME.ACTIVITY_OPERATION, slot1)
	end)
	slot0:SetActivityData()
	slot0:SetPlayerData()
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = ActivityProxy.ACTIVITY_UPDATED
	slot1[2] = PlayerProxy.UPDATED
	slot1[3] = ActivityProxy.ACTIVITY_SHOW_AWARDS
	slot1[4] = ActivityProxy.ACTIVITY_OPERATION_DONE

	return {}
end

function slot0.handleNotification(slot0, slot1)
	if slot1:getName() == PlayerProxy.UPDATED then
		slot0.viewComponent:SetPlayer(slot1:getBody())
	elseif slot2 == ActivityProxy.ACTIVITY_SHOW_AWARDS then
		slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3.awards, slot3.callback)
	elseif slot2 == ActivityProxy.ACTIVITY_OPERATION_DONE then
		slot5 = getProxy(ActivityProxy):getActivityById(slot3)

		if slot5:getConfig("type") == ActivityConst.ACTIVITY_TYPE_LINK_LINK then
			slot0.viewComponent:DisplayResult(slot5)
		end
	end
end

function slot0.SetPlayerData(slot0)
	slot0.viewComponent:SetPlayer(getProxy(PlayerProxy):getRawData())
end

function slot0.SetActivityData(slot0)
	slot0.viewComponent:SetActivity(getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_LINK_LINK))
end

return slot0
