slot0 = class("GuildTaskMediator", import("..base.ContextMediator"))
slot0.ON_TASK_SUBMIT = "GuildTaskMediator:ON_TASK_SUBMIT"

function slot0.register(slot0)
	slot0.viewComponent:setTaskList(getProxy(GuildProxy):getGuildEvent():getTasks())
	slot0:bind(uv0.ON_TASK_SUBMIT, function (slot0, slot1)
		slot5.id = slot1.id

		uv0:sendNotification(GAME.SUBMIT_GUILD_TASK, {})
	end)
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = GAME.SUBMIT_GUILD_TASK_DONE
	slot1[2] = GuildEvent.TASK_UPDATED

	return {}
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
