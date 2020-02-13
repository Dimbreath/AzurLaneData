class("EvaluateShipCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(17103, {
		ship_group_id = slot1:getBody().groupId,
		context = slot1.getBody().content
	}, 17104, function (slot0)
		if slot0.result == 0 then
			if getProxy(CollectionProxy):getShipGroup(slot0) then
				slot2.evaluation = ShipEvaluation.New(slot0.ship_discuss)

				slot1:updateShipGroup(slot2)
				slot1:sendNotification(CollectionProxy.GROUP_EVALUATION_UPDATE, slot0)
			end

			pg.TipsMgr.GetInstance():ShowTips(i18n("eva_ship_success"))
		elseif slot0.result == 2011 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("evaluate_too_loog"))
		elseif slot0.result == 2013 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("evaluate_ban_word"))
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("eva_ship", slot0.result))
		end
	end)
end

return class("EvaluateShipCommand", pm.SimpleCommand)
