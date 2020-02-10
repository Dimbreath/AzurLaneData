slot0 = class("HololiveMedalCollectionMediator", import("view.base.ContextMediator"))

function slot0.register(slot0)
	slot0:BindEvent()
end

function slot0.BindEvent(slot0)
	slot0:bind(ActivityMediator.ON_TASK_SUBMIT, function (slot0, slot1)
		uv0:sendNotification(GAME.SUBMIT_TASK, slot1.id)
	end)
	slot0:bind(ActivityMediator.ON_TASK_GO, function (slot0, slot1)
		slot5.taskVO = slot1

		uv0:sendNotification(GAME.TASK_GO, {})
	end)
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = GAME.MEMORYBOOK_UNLOCK_DONE
	slot1[2] = ActivityProxy.ACTIVITY_SHOW_AWARDS
	slot1[3] = GAME.SUBMIT_TASK_DONE
	slot1[4] = ActivityProxy.ACTIVITY_OPERATION_DONE

	return {}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.MEMORYBOOK_UNLOCK_DONE then
		slot0.viewComponent:UpdateView()
	elseif slot2 == ActivityProxy.ACTIVITY_SHOW_AWARDS then
		slot0.viewComponent:PlayStory(function ()
			uv0.viewComponent:emit(BaseUI.ON_ACHIEVE, uv1.awards, uv1.callback)
		end)
	elseif slot2 == GAME.SUBMIT_TASK_DONE then
		slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3, function ()
			uv0.viewComponent:UpdateView()
		end)
	elseif slot2 == ActivityProxy.ACTIVITY_OPERATION_DONE then
		slot0.viewComponent:UpdateView()
	end
end

return slot0
