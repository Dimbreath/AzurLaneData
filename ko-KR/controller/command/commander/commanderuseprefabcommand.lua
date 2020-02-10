slot0 = class("CommanderUsePrefabCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot6 = getProxy(CommanderProxy):getPrefabFleetById(slot2.pid)

	if slot6:isEmpty() or slot6:isSame(getProxy(FleetProxy):getFleetById(slot2.fleetId):getCommanders()) then
		return
	end

	slot7[1] = function (slot0)
		if uv0:getCommanderByPos(1) then
			slot5.fleetId = uv2
			slot5.callback = slot0

			uv1:sendNotification(GAME.COOMMANDER_EQUIP_TO_FLEET, {
				commanderId = 0,
				pos = 1
			})
		else
			slot0()
		end
	end

	slot7[2] = function (slot0)
		if uv0:getCommanderByPos(2) then
			slot5.fleetId = uv2
			slot5.callback = slot0

			uv1:sendNotification(GAME.COOMMANDER_EQUIP_TO_FLEET, {
				commanderId = 0,
				pos = 2
			})
		else
			slot0()
		end
	end

	slot7[3] = function (slot0)
		slot1 = uv0

		if slot1:getCommanderByPos(1) then
			slot5.fleetId = uv2
			slot5.commanderId = slot1.id
			slot5.callback = slot0

			uv1:sendNotification(GAME.SELECT_FLEET_COMMANDER, {
				pos = 1
			})
		else
			slot0()
		end
	end

	slot7[4] = function (slot0)
		slot1 = uv0

		if slot1:getCommanderByPos(2) then
			slot5.fleetId = uv2
			slot5.commanderId = slot1.id
			slot5.callback = slot0

			uv1:sendNotification(GAME.SELECT_FLEET_COMMANDER, {
				pos = 2
			})
		else
			slot0()
		end
	end

	seriesAsync({}, function ()
		uv0:sendNotification(GAME.USE_COMMANDER_PREFBA_DONE)
	end)
end

return slot0
