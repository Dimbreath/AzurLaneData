class("ChangeRefreshTechnologysTendencyCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(63009, {
		id = slot1:getBody().pool_id,
		target = slot1.getBody().tendency
	}, 63010, function (slot0)
		if slot0.result == 0 then
			getProxy(TechnologyProxy):setTendency(slot0, getProxy(TechnologyProxy).setTendency)
			getProxy(TechnologyProxy):sendNotification(GAME.CHANGE_REFRESH_TECHNOLOGYS_TENDENCY_DONE)
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("change_technology_refresh_erro") .. slot0.result)
		end
	end)
end

return class("ChangeRefreshTechnologysTendencyCommand", pm.SimpleCommand)
