class("GetShipEvaluationCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(99999, {
		shipId = slot1:getBody().shipId
	}, 99999, function (slot0)
		if slot0.result == 0 then
			slot1 = getProxy(BayProxy)
			slot3 = slot1:getShipById(slot0).evaluation

			slot1:sendNotification(GAME.GET_SHIP_EVALUATION_DONE, slot1.getShipById(slot0))
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("get_ship_evaluation", slot0.result))
		end
	end)
end

return class("GetShipEvaluationCommand", pm.SimpleCommand)
