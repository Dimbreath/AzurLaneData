slot0 = class("ComposeItemCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot7 = getProxy(BagProxy):getItemById(slot2.id):getTempCfgTable()

	if slot2.count == 0 then
		return
	end

	slot8 = slot7.target_id

	if slot4 > slot6.count / slot7.compose_number then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_item_1"))

		return
	end

	slot14.id = slot3
	slot14.num = slot4

	pg.ConnectionMgr.GetInstance():Send(15006, {}, 15007, function (slot0)
		if slot0.result == 0 then
			slot1 = {}

			uv0:removeItemById(uv1, uv2 * uv3)

			slot3.type = DROP_TYPE_ITEM
			slot3.id = uv4
			slot3.count = uv2
			slot2 = Item.New({})

			table.insert(slot1, slot2)
			uv5:sendNotification(GAME.ADD_ITEM, slot2)
			uv5:sendNotification(GAME.USE_ITEM_DONE, slot1)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("", slot0.result))
		end
	end)
end

return slot0
