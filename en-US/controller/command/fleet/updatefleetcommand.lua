class("UpdateFleetCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = slot1:getBody().callback
	slot5 = getProxy(PlayerProxy)

	if getProxy(FleetProxy):getFleetById(slot1.getBody().fleet.id) == nil then
		return
	end

	_.each(slot3.vanguardShips, function (slot0)
		slot0[#slot0 + 1] = slot0
	end)
	_.each(slot3.mainShips, function (slot0)
		slot0[#slot0 + 1] = slot0
	end)
	_.each(slot3.subShips, function (slot0)
		slot0[#slot0 + 1] = slot0
	end)
	pg.ConnectionMgr.GetInstance():Send(12102, {
		id = slot3.id,
		ship_list = {}
	}, 12103, function (slot0)
		if slot0.result == 0 then
			slot0.name = slot1.name

			slot1.name:updateFleet(slot0)

			if #slot0.ships == 0 and slot3.combatFleetId == slot0.id then
				slot3.combatFleetId = 1
			end

			slot4:sendNotification(GAME.UPDATE_FLEET_DONE, slot0.id)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("fleet_updateFleet", slot0.result))
		end

		if slot5 ~= nil then
			slot5()
		end
	end)
end

return class("UpdateFleetCommand", pm.SimpleCommand)
