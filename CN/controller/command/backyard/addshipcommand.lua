class("AddShipCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = slot2.type
	slot5 = slot2.callBack
	slot8 = getProxy(BayProxy).getShipById(slot7, slot3)

	if table.contains(getProxy(DormProxy).getData(slot6).shipIds, slot2.id) then
		if slot5 then
			slot5()
		end

		return
	end

	pg.ConnectionMgr.GetInstance():Send(19002, {
		ship_id = slot3,
		type = slot4
	}, 19003, function (slot0)
		if slot0.result == 0 then
			slot1 = getProxy(BayProxy)

			if slot0 == BackYardShipInfoLayer.SHIP_TRAIN_TYPE then
				slot1.state_info_1 = pg.TimeMgr.GetInstance():GetServerTime()
				slot1.state_info_2 = slot1:getTotalExp()

				slot1:updateState(Ship.STATE_TRAIN)

				if slot1.updateState.next_timestamp == 0 then
					slot2:restNextTime()
					slot2:updateDrom(slot2.updateDrom)
				end
			elseif slot0 == BackYardShipInfoLayer.SHIP_REST_TYPE then
				slot1:updateState(Ship.STATE_REST)
			end

			slot1:updateShip(slot1)
			slot1:addShip(slot1.id)
			slot4:sendNotification(GAME.ADD_SHIP_DONE, {
				id = slot5,
				type = slot0
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("backyard_addShip", slot0.result))
		end

		if slot6 then
			slot6()
		end
	end)
end

return class("AddShipCommand", pm.SimpleCommand)
