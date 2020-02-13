class("CommanderUsePrefabCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot5 = getProxy(FleetProxy):getFleetById(slot4)

	if getProxy(CommanderProxy):getPrefabFleetById(slot3):isEmpty() or slot6:isSame(slot5:getCommanders()) then
		return
	end

	seriesAsync({
		function (slot0)
			if slot0:getCommanderByPos(1) then
				slot1:sendNotification(GAME.COOMMANDER_EQUIP_TO_FLEET, {
					commanderId = 0,
					pos = 1,
					fleetId = slot1.sendNotification,
					callback = slot0
				})
			else
				slot0()
			end
		end,
		function (slot0)
			if slot0:getCommanderByPos(2) then
				slot1:sendNotification(GAME.COOMMANDER_EQUIP_TO_FLEET, {
					commanderId = 0,
					pos = 2,
					fleetId = slot1.sendNotification,
					callback = slot0
				})
			else
				slot0()
			end
		end,
		function (slot0)
			if slot0:getCommanderByPos(1) then
				slot1:sendNotification(GAME.SELECT_FLEET_COMMANDER, {
					pos = 1,
					fleetId = slot2,
					commanderId = slot1.id,
					callback = slot0
				})
			else
				slot0()
			end
		end,
		function (slot0)
			if slot0:getCommanderByPos(2) then
				slot1:sendNotification(GAME.SELECT_FLEET_COMMANDER, {
					pos = 2,
					fleetId = slot2,
					commanderId = slot1.id,
					callback = slot0
				})
			else
				slot0()
			end
		end
	}, function ()
		slot0:sendNotification(GAME.USE_COMMANDER_PREFBA_DONE)
	end)
end

return class("CommanderUsePrefabCommand", pm.SimpleCommand)
