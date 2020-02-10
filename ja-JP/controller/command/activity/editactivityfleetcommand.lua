slot0 = class("EditActivityFleetCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot3 = slot1:getBody().actID
	slot5 = {}

	for slot9, slot10 in pairs(slot2.fleets) do
		slot11 = {}

		_.each(slot10.vanguardShips, function (slot0)
			uv0[#uv0 + 1] = slot0
		end)
		_.each(slot10.mainShips, function (slot0)
			uv0[#uv0 + 1] = slot0
		end)
		_.each(slot10.subShips, function (slot0)
			uv0[#uv0 + 1] = slot0
		end)

		for slot16, slot17 in pairs(slot10.commanderIds) do
			slot20.pos = slot16
			slot20.id = slot17

			table.insert({}, {})
		end

		slot13.id = slot9
		slot13.ship_list = slot11
		slot13.commanders = slot12

		table.insert(slot5, {})
	end

	slot9.activity_id = slot3
	slot9.group_list = slot5

	pg.ConnectionMgr.GetInstance():Send(11204, {}, 11205, function (slot0)
		if slot0.result == 0 then
			-- Nothing
		end
	end)
end

return slot0
