class("Challenge2InitialRequestCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot10 = {}

	for slot14, slot15 in pairs(slot9) do
		if slot15 then
			slot16 = {}

			_.each(slot15.vanguardShips, function (slot0)
				slot0[#slot0 + 1] = slot0
			end)
			_.each(slot15.mainShips, function (slot0)
				slot0[#slot0 + 1] = slot0
			end)
			_.each(slot15.subShips, function (slot0)
				slot0[#slot0 + 1] = slot0
			end)

			slot17 = {}

			for slot21, slot22 in ipairs(slot15.commanderIds) do
				table.insert(slot17, {
					pos = slot21,
					id = slot22
				})
			end

			table.insert(slot10, {
				id = slot14,
				ship_list = slot16,
				commanders = slot17
			})
		end
	end

	if not slot5 or slot5:isEnd() then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(24002, {
		activity_id = slot5.id,
		group_list = slot10,
		mode = slot3
	}, 24003, function (slot0)
		if slot0.result == 0 then
			slot0:sendNotification(GAME.CHALLENGE2_INFO, {
				callback = function ()
					slot0:sendNotification(GAME.CHALLENGE2_INITIAL_DONE, {
						mode = slot0
					})
				end
			})
		end
	end)
end

return class("Challenge2InitialRequestCommand", pm.SimpleCommand)
