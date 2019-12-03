slot0 = class("WorldPortShoppingCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	if slot1:getBody().goods.count <= 0 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("buy_countLimit"))

		return
	end

	if slot3.moneyItem.type == DROP_TYPE_RESOURCE and getProxy(PlayerProxy):getRawData()[id2res(slot4.id)] < slot4.count then
		pg.TipsMgr.GetInstance():ShowTips(i18n("buyProp_noResource_error", pg.item_data_statistics[id2ItemId(slot4.id)].name))
	end

	if getProxy(WorldProxy).GetWorld(slot5).getInventoryProxy(slot6).GetItemCount(slot7, WorldItem.MoneyId) < slot4.count then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_item_1"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(33403, {
		shop_id = slot3.id
	}, 33404, function (slot0)
		if slot0.result == 0 then
			slot0:UpdateCount(slot0.count - 1)

			slot1 = slot0.UpdateCount:BuildDrop(slot0)
			slot2 = slot0.UpdateCount:GetActiveMap()
			slot4 = slot2:GetPort()
			slot5 = slot3.id

			if slot3.type == DROP_TYPE_RESOURCE then
				slot5 = id2ItemId(slot3.id)
			end

			slot2:AddLog(WorldLog.TypePurchase, {
				fleet = slot3.id,
				port = slot4.id,
				item = slot5
			})
			slot4:RemoveItem(WorldItem.MoneyId, slot3.count)
			slot1:sendNotification(GAME.WORLD_PORT_SHOPPING_DONE, {
				drops = slot1
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("world_port_shopping_error_", slot0.result))
		end
	end)
end

function slot0.BuildDrop(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in ipairs(slot1.drop_list) do
		table.insert(slot2, slot8)
		slot0:sendNotification(GAME.ADD_ITEM, Item.New(slot7))
	end

	return slot2
end

return slot0
