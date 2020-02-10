slot0 = class("TriggerTaskCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot6.id = slot1:getBody()

	pg.ConnectionMgr.GetInstance():Send(20007, {}, 20008, function (slot0)
		if slot0.result == 0 then
			slot4.id = uv0

			getProxy(TaskProxy):addTask(Task.New({}))
		end
	end)
end

return slot0
