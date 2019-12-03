slot0 = class("RefluxMediator", import("..base.ContextMediator"))
slot0.OnTaskSubmit = "RefluxMediator.OnTaskSubmit"
slot0.OnTaskGo = "RefluxMediator.OnTaskGo"
slot0.OnBattlePhaseForward = "RefluxMediator.OnBattlePhaseForward"

function slot0.register(slot0)
	slot2 = getProxy(ActivityProxy).getActivityByType(slot1, ActivityConst.ACTIVITY_TYPE_REFLUX)

	getProxy(TaskProxy).pushAutoSubmitTask(slot3)
	slot0:bind(slot0.OnTaskSubmit, function (slot0, slot1)
		slot0:sendNotification(GAME.SUBMIT_TASK, slot1)
	end)
	slot0:bind(slot0.OnTaskGo, function (slot0, slot1)
		slot0:sendNotification(GAME.TASK_GO, {
			taskVO = slot1
		})
	end)
	slot0:bind(slot0.OnBattlePhaseForward, function (slot0, slot1)
		slot0:sendNotification(GAME.ACTIVITY_OPERATION, {
			cmd = 2,
			activity_id = slot1.id,
			arg1 = slot1
		})
	end)
	slot0.viewComponent:SetActivity(slot2)
	slot0.viewComponent:SetTasks(slot4)
	slot0.viewComponent:SetPlayer(slot6)

	if PlayerPrefs.GetInt(getProxy(PlayerProxy).getRawData(slot5).id .. "_" .. slot2.data2) == 1 then
		slot0:DispatchAutoOpertation()
	else
		PlayerPrefs.SetInt(slot7, 1)
		PlayerPrefs.Save()
		slot0.viewComponent:DisplayLetter(function ()
			slot0:DispatchAutoOpertation()
		end)
	end
end

function slot0.listNotificationInterests(slot0)
	return {
		GAME.SUBMIT_TASK_DONE,
		TaskProxy.TASK_UPDATED,
		TaskProxy.TASK_REMOVED,
		ActivityProxy.ACTIVITY_SHOW_REFLUX_AWARDS,
		ActivityProxy.ACTIVITY_OPERATION_DONE
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.SUBMIT_TASK_DONE then
		slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3)
	elseif slot2 == TaskProxy.TASK_UPDATED or slot2 == TaskProxy.TASK_REMOVED then
		slot0.viewComponent:SetTask(getProxy(TaskProxy):getTaskById(slot3.id) or slot4:getFinishTaskById(slot3.id))

		if slot0.viewComponent:GetTab() == RefluxScene.TabTask then
			slot0.viewComponent:UpdateTask()
		end
	elseif slot2 == ActivityProxy.ACTIVITY_SHOW_REFLUX_AWARDS then
		slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3.awards, slot3.callback)
	elseif slot2 == ActivityProxy.ACTIVITY_OPERATION_DONE and getProxy(ActivityProxy):getActivityById(slot3) and slot5:getConfig("type") == ActivityConst.ACTIVITY_TYPE_REFLUX then
		slot0.viewComponent:SetActivity(slot5)
		slot0:DispatchAutoOpertation()
	end
end

function slot0.DispatchAutoOpertation(slot0)
	if getProxy(ActivityProxy):findRefluxAutoActivity() == 1 then
		slot0:sendNotification(GAME.ACTIVITY_OPERATION, {
			cmd = 1,
			activity_id = slot1:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX).id
		})
		slot0.viewComponent:TriggerTab(RefluxScene.TabSign)
	elseif slot0.viewComponent:GetTab() == nil then
		slot0.viewComponent:TriggerTab(slot0.contextData.tab or RefluxScene.TabSign)
	else
		slot0.viewComponent:UpdateTab()
	end
end

return slot0
