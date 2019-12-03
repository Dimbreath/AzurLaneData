class("BatchGetCommanderCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = {}
	slot5 = {}
	slot6 = {}

	for slot10, slot11 in ipairs(slot3) do
		table.insert(slot6, function (slot0)
			slot0:sendNotification(GAME.COMMANDER_ON_OPEN_BOX, {
				notify = false,
				id = slot1,
				callback = function (slot0)
					if slot0 then
						table.insert(slot0, slot0)
						table.insert(table.insert, )
					end

					slot3()
				end
			})
		end)
	end

	seriesAsync(slot6, function ()
		slot0:sendNotification(GAME.COMMANDER_ON_BATCH_DONE, {
			boxIds = slot1,
			commanders = GAME.COMMANDER_ON_BATCH_DONE
		})
	end)
end

return class("BatchGetCommanderCommand", pm.SimpleCommand)
