slot0 = class("Challenge2InitialRequestCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot3 = slot1:getBody().mode
	slot8 = getProxy(FleetProxy):getActivityFleets()[getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_CHALLENGE).id]
	slot9[slot3 + 1] = slot8[slot3 + 1]
	slot9[slot3 + 11] = slot8[slot3 + 11]
	slot10 = {}

	for slot14, slot15 in pairs({}) do
		if slot15 then
			slot16 = {}

			_.each(slot15.vanguardShips, function (slot0)
				uv0[#uv0 + 1] = slot0
			end)
			_.each(slot15.mainShips, function (slot0)
				uv0[#uv0 + 1] = slot0
			end)
			_.each(slot15.subShips, function (slot0)
				uv0[#uv0 + 1] = slot0
			end)

			for slot21, slot22 in ipairs(slot15.commanderIds) do
				slot25.pos = slot21
				slot25.id = slot22

				table.insert({}, {})
			end

			slot18.id = slot14
			slot18.ship_list = slot16
			slot18.commanders = slot17

			table.insert(slot10, {})
		end
	end

	if not slot5 or slot5:isEnd() then
		return
	end

	slot14.activity_id = slot5.id
	slot14.group_list = slot10
	slot14.mode = slot3

	pg.ConnectionMgr.GetInstance():Send(24002, {}, 24003, function (slot0)
		if slot0.result == 0 then
			function slot5.callback()
				slot3.mode = uv1

				uv0:sendNotification(GAME.CHALLENGE2_INITIAL_DONE, {})
			end

			uv0:sendNotification(GAME.CHALLENGE2_INFO, {})
		end
	end)
end

return slot0
