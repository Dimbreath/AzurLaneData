class("ZanShipEvaCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()

	pg.ConnectionMgr.GetInstance():Send(17105, {
		ship_group_id = slot2.groupId,
		discuss_id = slot2.evaId,
		good_or_bad = slot2.operation
	}, 17106, function (slot0)
		slot3 = nil

		if getProxy(CollectionProxy).getShipGroup(slot1, slot0) and slot2.evaluation then
			slot3 = _.detect(slot4.evas, function (slot0)
				return slot0.id == slot0
			end)
		end

		if slot0.result == 0 then
			if slot3 then
				if slot2 == 0 then
					slot3.good_count = slot3.good_count + 1
				elseif slot2 == 1 then
					slot3.bad_count = slot3.bad_count + 1
				end

				slot3.izan = true

				slot2.evaluation:sortEvas()
				slot1:updateShipGroup(slot2)
				slot3:sendNotification(CollectionProxy.GROUP_EVALUATION_UPDATE, slot0)
			end

			pg.TipsMgr.GetInstance():ShowTips(i18n("zan_ship_eva_success"))
		elseif slot0.result == 7 then
			if slot3 then
				slot3.izan = true

				slot1:updateShipGroup(slot2)
				slot3:sendNotification(CollectionProxy.GROUP_EVALUATION_UPDATE, slot0)
			end

			pg.TipsMgr.GetInstance():ShowTips(i18n("zan_ship_eva_error_7"))
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("zan_ship_eva", slot0.result))
		end
	end)
end

return class("ZanShipEvaCommand", pm.SimpleCommand)
