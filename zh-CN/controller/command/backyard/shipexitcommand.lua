class("ShipExitCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot6 = getProxy(BayProxy).getShipById(slot5, slot4)
	slot7 = slot1:getBody().callback

	if not getProxy(DormProxy):getShipById(slot1.getBody().shipId) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("backyard_no_ship_tip"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(19004, {
		ship_id = slot4
	}, 19005, function (slot0)
		slot1 = 0

		if slot0.result == 0 then
			if slot0.state == Ship.STATE_REST then
			elseif slot2 == Ship.STATE_TRAIN then
				slot0.state_info_2 = slot0:getTotalExp()
			end

			slot0:updateStateInfo34(0, 0)
			slot1:exitYardById(slot2)
			slot0:updateState(Ship.STATE_NORMAL)
			slot0:addExp(slot1)
			slot0.addExp:updateShip(slot0)
			slot0.addExp:sendNotification(GAME.EXIT_SHIP_DONE, slot0)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("backyard_shipExit", slot0.result))
		end

		if slot5 ~= nil then
			slot5(slot1)
		end
	end)
end

return class("ShipExitCommand", pm.SimpleCommand)
