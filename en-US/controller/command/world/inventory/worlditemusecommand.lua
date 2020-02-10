slot0 = class("WorldItemUseCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot9.id = slot2.itemID
	slot9.count = slot2.count
	slot9.arg = slot2.args

	pg.ConnectionMgr.GetInstance():Send(33301, {}, 33302, function (slot0)
		if slot0.result == 0 then
			slot1 = {}

			getProxy(WorldProxy):GetWorld():getInventoryProxy():RemoveItem(uv0, uv1)

			if pg.world_item_data_template[uv0].usage == WorldItem.UsageBuff then
				for slot11, slot12 in ipairs(uv2) do
					slot3:GetShip(slot12):AddBuff(WorldItem.getItemBuffID(uv0), 1)
				end
			elseif slot6 == WorldItem.UsageHPRegenerate then
				for slot11, slot12 in ipairs(uv2) do
					slot3:GetShip(slot12):Regenerate(WorldItem.getItemRegenerate(uv0))
				end
			elseif slot6 == WorldItem.UsageDrop or slot6 == WorldItem.UsageLoot then
				for slot10, slot11 in ipairs(slot0.drop_list) do
					slot12 = Item.New(slot11)

					table.insert(slot1, slot12)
					uv3:sendNotification(GAME.ADD_ITEM, slot12)
				end
			end

			slot10.item = uv0

			slot3:AddLog(WorldLog.TypeItemUsage, {})

			slot10.drops = slot1
			slot10.item = uv0

			uv3:sendNotification(GAME.WORLD_ITEM_USE_DONE, {})
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n1("大世界物品使用失败：" .. slot0.result))
		end
	end)
end

return slot0
