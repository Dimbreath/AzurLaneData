class("WorldItemUseCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()

	pg.ConnectionMgr.GetInstance():Send(33301, {
		id = slot2.itemID,
		count = slot2.count,
		arg = slot2.args
	}, 33302, function (slot0)
		if slot0.result == 0 then
			getProxy(WorldProxy).GetWorld(slot2).getInventoryProxy(slot3).RemoveItem(slot4, slot0, {})

			if pg.world_item_data_template[slot0].usage == WorldItem.UsageBuff then
				slot7 = WorldItem.getItemBuffID(slot0)

				for slot11, slot12 in ipairs(slot2) do
					slot3:GetShip(slot12):AddBuff(slot7, 1)
				end
			elseif slot6 == WorldItem.UsageHPRegenerate then
				slot7 = WorldItem.getItemRegenerate(slot0)

				for slot11, slot12 in ipairs(slot2) do
					slot3:GetShip(slot12):Regenerate(slot7)
				end
			elseif slot6 == WorldItem.UsageDrop or slot6 == WorldItem.UsageLoot then
				for slot10, slot11 in ipairs(slot0.drop_list) do
					table.insert(slot1, slot12)
					slot3:sendNotification(GAME.ADD_ITEM, Item.New(slot11))
				end
			end

			slot3:AddLog(WorldLog.TypeItemUsage, {
				item = slot0
			})
			slot3:sendNotification(GAME.WORLD_ITEM_USE_DONE, {
				drops = slot1,
				item = slot0
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n1("大世界物品使用失败：" .. slot0.result))
		end
	end)
end

return class("WorldItemUseCommand", pm.SimpleCommand)
