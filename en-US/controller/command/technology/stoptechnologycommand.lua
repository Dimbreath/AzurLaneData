class("StopTechnologyCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = slot1:getBody().pool_id

	if not getProxy(TechnologyProxy):getTechnologyById(slot1.getBody().id) then
		return
	end

	if not slot6:isStarting() then
		print("the technology is not active")

		return
	end

	pg.ConnectionMgr.GetInstance():Send(63005, {
		tech_id = slot3,
		refresh_id = slot4
	}, 63006, function (slot0)
		if slot0.result == 0 then
			slot0:reset()

			if slot0:hasCondition() and slot0:getTaskId() then
				getProxy(TaskProxy):removeTaskById(slot1)
			end

			slot1:updateTechnology(slot0)
			slot1:sendNotification(GAME.STOP_TECHNOLOGY_DONE)
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("blueprint_stop_erro") .. slot0.result)
		end
	end)
end

return class("StopTechnologyCommand", pm.SimpleCommand)
