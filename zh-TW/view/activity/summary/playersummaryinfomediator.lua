slot0 = class("PlayerSummaryInfoMediator", import("...base.ContextMediator"))
slot0.GET_PLAYER_SUMMARY_INFO = "PlayerSummaryInfoMediator:GET_PLAYER_SUMMARY_INFO"

function slot0.register(slot0)
	slot0:bind(uv0.GET_PLAYER_SUMMARY_INFO, function (slot0)
		slot1 = uv0

		if slot1:getActivityByType(ActivityConst.ACTIVITY_TYPE_SUMMARY) and not slot1:isEnd() then
			slot5.activityId = slot1.id

			uv1:sendNotification(GAME.GET_PLAYER_SUMMARY_INFO, {})
		end
	end)
	slot0.viewComponent:setActivity(getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_SUMMARY))

	slot3 = getProxy(PlayerProxy)

	slot0.viewComponent:setPlayer(slot3:getData())
	slot0.viewComponent:setSummaryInfo(slot3:getSummaryInfo())
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = GAME.GET_PLAYER_SUMMARY_INFO_DONE

	return {}
end

function slot0.handleNotification(slot0, slot1)
	if slot1:getName() == GAME.GET_PLAYER_SUMMARY_INFO_DONE then
		slot0.viewComponent:setSummaryInfo(slot1:getBody())
		slot0.viewComponent:initSummaryInfo()
	end
end

return slot0
