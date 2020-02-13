slot0 = class("GuildTaskMediator", import("..base.ContextMediator"))
slot0.ON_TASK_SUBMIT = "GuildTaskMediator:ON_TASK_SUBMIT"

function slot0.register(slot0)
	slot0.viewComponent:setTaskList(slot2)
	slot0:bind(slot0.ON_TASK_SUBMIT, function (slot0, slot1)
		slot0:sendNotification(GAME.SUBMIT_GUILD_TASK, {
			id = slot1.id
		})
	end)
end

function slot0.listNotificationInterests(slot0)
	return {
		GAME.SUBMIT_GUILD_TASK_DONE,
		GuildEvent.TASK_UPDATED
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.SUBMIT_GUILD_TASK_DONE then
		if #slot3 > 0 then
			slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3)
		end
	elseif slot2 == GuildEvent.TASK_UPDATED then
		slot0.viewComponent:updateTask(slot3)
	end
end

return slot0
