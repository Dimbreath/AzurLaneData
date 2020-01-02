class("OpenAttachmentCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = pg.drop_data_restore
	slot5 = pg.ship_skin_template
	slot6 = pg.item_data_statistics
	slot7 = _.any(slot1:getBody().items or {}, function (slot0)
		return slot0.type == DROP_TYPE_SHIP
	end)
	slot8 = {}

	for slot12 = #slot3, 1, -1 do
		if slot3[slot12].type == DROP_TYPE_ITEM and table.contains(ITEM_ID_FUDAIS, slot13.id) then
			table.insert(slot8, slot13)
			table.remove(slot3, slot12)
		end
	end

	slot9 = getProxy(BayProxy)
	slot10 = {}

	if #slot3 > 0 then
		table.insert(slot10, function (slot0)
			slot0:sendNotification(GAME.OPEN_MAIL_ATTACHMENT_DONE, {
				items = slot0.sendNotification,
				callback = slot0
			})
		end)
	end

	if #slot8 > 0 then
		for slot14, slot15 in ipairs(slot8) do
			for slot19 = 1, slot15.count, 1 do
				table.insert(slot10, function (slot0)
					slot0:sendNotification(GAME.USE_FUDAI_ITEM, {
						count = 1,
						id = slot1.id,
						callback = function (slot0)
							if slot0 and #slot0 > 0 then
								slot0:sendNotification(GAME.OPEN_MAIL_ATTACHMENT_DONE, {
									items = slot0,
									callback = slot0.sendNotification
								})
							else
								slot1()
							end
						end
					})
				end)
			end
		end
	end

	seriesAsync(slot10)
end

return class("OpenAttachmentCommand", pm.SimpleCommand)
