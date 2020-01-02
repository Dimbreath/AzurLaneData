class("RefreshTechnologysCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()

	if getProxy(TechnologyProxy).refreshTechnologysFlag ~= 0 then
		return
	end

	if _.any(slot3:getTechnologys(), function (slot0)
		return slot0.state ~= Technology.STATE_IDLE
	end) then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(63007, {
		type = 1
	}, 63008, function (slot0)
		if slot0.result == 0 then
			_.each(slot0, function (slot0)
				if slot0:hasCondition() and getProxy(TaskProxy):getTaskById(slot0:getTaskId()) then
					slot2:removeTaskById(slot1)
				end
			end)
			_.each:updateTechnologys(slot0)
			_.each.updateTechnologys:updateRefreshFlag(1)
			_.each.updateTechnologys:sendNotification(GAME.REFRESH_TECHNOLOGYS_DONE)
			pg.TipsMgr.GetInstance():ShowTips(i18n("technology_refresh_sucess"))
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("technology_refresh_erro") .. slot0.result)
		end
	end)
end

return class("RefreshTechnologysCommand", pm.SimpleCommand)
