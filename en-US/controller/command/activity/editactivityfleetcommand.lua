class("EditActivityFleetCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot3 = slot1:getBody().actID
	slot5 = {}

	for slot9, slot10 in pairs(slot4) do
		slot11 = {}

		_.each(slot10.vanguardShips, function (slot0)
			slot0[#slot0 + 1] = slot0
		end)
		_.each(slot10.mainShips, function (slot0)
			slot0[#slot0 + 1] = slot0
		end)
		_.each(slot10.subShips, function (slot0)
			slot0[#slot0 + 1] = slot0
		end)

		slot12 = {}

		for slot16, slot17 in pairs(slot10.commanderIds) do
			table.insert(slot12, {
				pos = slot16,
				id = slot17
			})
		end

		table.insert(slot5, {
			id = slot9,
			ship_list = slot11,
			commanders = slot12
		})
	end

	pg.ConnectionMgr.GetInstance():Send(11204, {
		activity_id = slot3,
		group_list = slot5
	}, 11205, function (slot0)
		if slot0.result == 0 then
		end
	end)
end

return class("EditActivityFleetCommand", pm.SimpleCommand)
