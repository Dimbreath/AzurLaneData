class("FragmentSellCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot3 = getProxy(BagProxy)
	slot5 = getProxy(PlayerProxy).getRawData(slot4)
	slot6 = {}
	slot7 = {}

	for slot11, slot12 in pairs(slot2) do
		slot14 = pg.item_data_statistics[slot12.id]

		if slot3:getItemCountById(slot12.id) < slot12.count then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_x", slot14.name))

			return
		end

		slot7[slot14.price[1]] = (slot7[slot14.price[1]] or 0) + slot14.price[2] * slot13.count

		table.insert(slot6, {
			id = slot13.id,
			count = slot13.count
		})
	end

	pg.ConnectionMgr.GetInstance():Send(15008, {
		item_list = slot6
	}, 15009, function (slot0)
		if slot0.result == 0 then
			for slot4, slot5 in ipairs(slot0) do
				reducePlayerOwn(slot5.type, slot5.id, slot5.count)
			end

			for slot5, slot6 in pairs(slot1) do
				addPlayerOwn(DROP_TYPE_RESOURCE, slot5, slot6)
				table.insert(slot1, {
					type = DROP_TYPE_RESOURCE,
					id = slot5,
					count = slot6
				})
			end

			slot2:sendNotification(GAME.FRAG_SELL_DONE, {
				awards = slot1
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("", slot0.result))
		end
	end)
end

return class("FragmentSellCommand", pm.SimpleCommand)
