class("FetchEvaluationCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot3 = pg.TimeMgr.GetInstance():GetServerTime()

	if not getProxy(CollectionProxy):getShipGroup(slot1:getBody()) then
		return
	end

	if ShipGroup.REQ_INTERVAL < slot3 - slot5.lastReqStamp then
		pg.ConnectionMgr.GetInstance():Send(17101, {
			ship_group_id = slot2
		}, 17102, function (slot0)
			if slot0.ship_discuss and slot1.ship_group_id == slot0 then
				if slot1 then
					slot1.evaluation = ShipEvaluation.New(slot1)
					slot1.lastReqStamp = pg.TimeMgr.GetInstance():GetServerTime()

					slot1:updateShipGroup(slot1)
					slot1:sendNotification(GAME.FETCH_EVALUATION_DONE, slot0)
				end
			else
				pg.TipsMgr.GetInstance():ShowTips(errorTip("fetch_ship_eva", slot0.result))
			end
		end)
	elseif slot5.evaluation then
		slot0:sendNotification(GAME.FETCH_EVALUATION_DONE, slot2)
	end
end

return class("FetchEvaluationCommand", pm.SimpleCommand)
