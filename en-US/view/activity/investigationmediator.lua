slot0 = class("InvestigationMediator", import("..base.ContextMediator"))
slot0.ON_SUBMIT = "InvestigationMediator:ON_SUBMIT"

function slot0.register(slot0)
	slot0:bind(uv0.ON_SUBMIT, function (slot0, slot1, slot2)
		slot6.activityId = uv0.contextData.activityId
		slot6.id = slot1
		slot6.quests = slot2

		uv0:sendNotification(GAME.SUBMIT_INVESTIGATION, {})
	end)
	slot0:updateInfo()
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = GAME.SUBMIT_INVESTIGATION_DONE

	return {}
end

function slot0.handleNotification(slot0, slot1)
	if slot1:getName() == GAME.SUBMIT_INVESTIGATION_DONE then
		slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot1:getBody().items)
		slot0:updateInfo()
	end
end

function slot0.updateInfo(slot0)
	slot2 = getProxy(ActivityProxy):getActivityById(slot0.contextData.activityId)

	slot0.viewComponent:setInvestigation(slot2.data1 > 0, slot2:getConfig("config_data")[1])
end

return slot0
