slot0 = class("TriggerTaskCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(20007, {
		id = slot1:getBody()
	}, 20008, function (slot0)
		if slot0.result == 0 then
			getProxy(TaskProxy):addTask(Task.New({
				id = uv0
			}))
			uv1:sendNotification(GAME.TRIGGER_TASK_DONE)
		end
	end)
end

return slot0
