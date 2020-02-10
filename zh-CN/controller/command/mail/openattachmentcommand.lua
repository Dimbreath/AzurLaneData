slot0 = class("OpenAttachmentCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot4 = pg.drop_data_restore
	slot5 = pg.ship_skin_template
	slot6 = pg.item_data_statistics
	slot7 = _.any(slot1:getBody().items or {}, function (slot0)
		return slot0.type == DROP_TYPE_SHIP
	end)

	for slot12 = #slot3, 1, -1 do
		if slot3[slot12].type == DROP_TYPE_ITEM and table.contains(ITEM_ID_FUDAIS, slot13.id) then
			table.insert({}, slot13)
			table.remove(slot3, slot12)
		end
	end

	slot9 = getProxy(BayProxy)

	if #slot3 > 0 then
		table.insert({}, function (slot0)
			uv0:sendNotification(GAME.OPEN_MAIL_ATTACHMENT_DONE, {
				items = uv1,
				callback = slot0
			})
		end)
	end

	if #slot8 > 0 then
		for slot14, slot15 in ipairs(slot8) do
			for slot19 = 1, slot15.count, 1 do
				table.insert(slot10, function (slot0)
					uv0:sendNotification(GAME.USE_FUDAI_ITEM, {
						count = 1,
						id = uv1.id,
						callback = function (slot0)
							if slot0 and #slot0 > 0 then
								uv0:sendNotification(GAME.OPEN_MAIL_ATTACHMENT_DONE, {
									items = slot0,
									callback = uv1
								})
							else
								uv1()
							end
						end
					})
				end)
			end
		end
	end

	seriesAsync(slot10)
end

return slot0
