slot0 = class("AcceptActivityTaskCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	print("accpet activity task...................")

	slot2 = getProxy(TaskProxy)
	slot6[1] = ActivityConst.ACTIVITY_TYPE_TASK_LIST
	slot6[2] = ActivityConst.ACTIVITY_TYPE_TASK_RES

	_.each(getProxy(ActivityProxy):getActivitiesByTypes({}), function (slot0)
		slot1 = slot0:getConfig("config_id")

		if not slot0:isEnd() and (slot1 == 1 or slot1 == 3) then
			updateActivityTaskStatus(slot0)
		end
	end)
end

return slot0
