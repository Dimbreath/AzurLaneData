slot0 = class("InvestigationMediator", import("..base.ContextMediator"))
slot0.ON_SUBMIT = "InvestigationMediator:ON_SUBMIT"

function slot0.register(slot0)
	slot0:bind(slot0.ON_SUBMIT, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.SUBMIT_INVESTIGATION, {
			activityId = slot0.contextData.activityId,
			id = slot1,
			quests = slot2
		})
	end)
	slot0:updateInfo()
end

function slot0.listNotificationInterests(slot0)
	return {
		GAME.SUBMIT_INVESTIGATION_DONE
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.SUBMIT_INVESTIGATION_DONE then
		slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3.items)
		slot0:updateInfo()
	end
end

function slot0.updateInfo(slot0)
	slot2 = getProxy(ActivityProxy).getActivityById(slot1, slot0.contextData.activityId)

	slot0.viewComponent:setInvestigation(slot2.data1 > 0, slot2:getConfig("config_data")[1])
end

return slot0
