class("SelectFleetCommanderCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()
	slot5 = slot2.commanderId
	slot6 = slot2.callback
	slot7 = getProxy(FleetProxy):getFleetById(slot3)
	slot9 = slot7:getCommanders()

	if not slot7:getCommanderByPos(slot4) or slot8.id ~= slot5 then
		slot10 = getProxy(CommanderProxy):getCommanderById(slot5)

		for slot14, slot15 in pairs(slot9) do
			if slot15.groupId == slot10.groupId and slot14 ~= slot4 and slot5 ~= slot15.id then
				pg.TipsMgr.GetInstance():ShowTips(i18n("commander_can_not_select_same_group"))

				return
			end
		end
	end

	function slot11(slot0)
		if (slot0 == 2 and 1) or 2[] and slot2.id == slot0 then
			return true, slot1
		end

		return false
	end

	slot12 = {}
	slot13 = true
	slot14, slot15 = slot10(slot5)

	if slot14 then
		table.insert(slot12, function (slot0)
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("comander_repalce_tip", Fleet.DEFAULT_NAME[slot0.fleetId], (slot0.pos == 1 and i18n("commander_main_pos")) or i18n("commander_assistant_pos")),
				onYes = function ()
					pg.m02:sendNotification(GAME.COOMMANDER_EQUIP_TO_FLEET, {
						commanderId = 0,
						fleetId = slot0.fleetId,
						pos = slot0.pos,
						callback = pg.m02
					})
				end,
				onNo = function ()
					slot0 = false

					slot1()
				end
			})
		end)
	end

	slot16, slot17 = slot11(slot5)

	if slot16 then
		table.insert(slot12, function (slot0)
			pg.m02:sendNotification(GAME.COOMMANDER_EQUIP_TO_FLEET, {
				commanderId = 0,
				fleetId = slot0,
				pos = pg.m02.sendNotification,
				callback = slot0
			})
		end)
	end

	table.insert(slot12, function (slot0)
		if slot0 then
			pg.m02:sendNotification(GAME.COOMMANDER_EQUIP_TO_FLEET, {
				fleetId = slot1,
				pos = slot2,
				commanderId = slot3,
				callback = function (slot0)
					slot0()
				end
			})
		else
			slot0()
		end
	end)
	seriesAsync(slot12, slot6)
end

return class("SelectFleetCommanderCommand", pm.SimpleCommand)
