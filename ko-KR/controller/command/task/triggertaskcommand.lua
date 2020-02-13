class("TriggerTaskCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(20007, {
		id = slot1:getBody()
	}, 20008, function (slot0)
		if slot0.result == 0 then
			getProxy(TaskProxy):addTask(Task.New({
				id = slot0
			}))
		end
	end)
end

return class("TriggerTaskCommand", pm.SimpleCommand)
