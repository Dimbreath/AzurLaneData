class("EquipCommanderToFleetCommande", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = slot2.pos
	slot5 = slot2.fleetId
	slot6 = slot2.callback
	slot7 = nil

	if slot2.commanderId ~= 0 and not getProxy(CommanderProxy):getCommanderById(slot3) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("commander_not_exist"))

		return
	end

	if not getProxy(FleetProxy):getFleetById(slot5) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("commander_fleet_not_exist"))

		return
	end

	if slot3 == 0 and not slot9:getCommanderByPos(slot4) then
		if slot6 then
			slot6()
		end

		return
	end

	pg.ConnectionMgr.GetInstance():Send(25006, {
		groupid = slot5,
		pos = slot4,
		commanderid = slot3
	}, 25007, function (slot0)
		if slot0.result == 0 then
			slot0:updateCommanderByPos(slot0.updateCommanderByPos, slot0)
			slot3:updateFleet(slot0)

			if slot0 then
				slot4(slot0)
			end

			slot5:sendNotification(GAME.COOMMANDER_EQUIP_TO_FLEET_DONE)
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("commander_equip_to_fleet_erro", slot0.result))
		end
	end)
end

return class("EquipCommanderToFleetCommande", pm.SimpleCommand)
