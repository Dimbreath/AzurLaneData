slot0 = class("BatchGetCommanderCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot4 = {}
	slot5 = {}

	for slot10, slot11 in ipairs(slot1:getBody().boxIds) do
		table.insert({}, function (slot0)
			slot4.id = uv1

			function slot4.callback(slot0)
				if slot0 then
					table.insert(uv0, slot0)
					table.insert(uv1, uv2)
				end

				uv3()
			end

			uv0:sendNotification(GAME.COMMANDER_ON_OPEN_BOX, {
				notify = false
			})
		end)
	end

	seriesAsync(slot6, function ()
		slot3.boxIds = uv1
		slot3.commanders = uv2

		uv0:sendNotification(GAME.COMMANDER_ON_BATCH_DONE, {})
	end)
end

return slot0
