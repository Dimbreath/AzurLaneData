slot0 = class("ExchangeItemCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot11 = getProxy(PlayerProxy):getData()

	if getProxy(BagProxy):getItemById(ITEM_ID_SILVER_HOOK) == nil or slot9.count < pg.item_medal_fetch[getProxy(BuildShipProxy):getExChangeItemInfoByIndex(slot1:getBody().index).id].price then
		pg.TipsMgr.GetInstance():ShowTips(i18n("word_materal_no_enough"))

		return
	end

	slot12, slot17.flash_time = slot4:getExChangeItemInfo()
	slot17.shop_id = slot6.id

	pg.ConnectionMgr.GetInstance():Send(16108, {}, 16109, function (slot0)
		if slot0.result == 0 then
			uv0:removeItemById(ITEM_ID_SILVER_HOOK, uv1)

			slot5.type = DROP_TYPE_ITEM
			slot5.id = uv3.itemid
			slot5.count = uv3.itemquantity

			uv2:sendNotification(GAME.ADD_ITEM, Item.New({}))
			uv4:updateExchangeItem(uv5)
			pg.TipsMgr.GetInstance():ShowTips(i18n("exchange_item_success"))
			uv2:sendNotification(GAME.EXCHANGE_ITEM_DONE)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("ship_exchange_erro", slot0.result))
		end
	end)
end

return slot0
