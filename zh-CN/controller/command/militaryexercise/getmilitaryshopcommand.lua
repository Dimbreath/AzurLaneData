class("GetMilitaryShopCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(18100, {
		type = 0
	}, 18101, function (slot0)
		getProxy(ShopsProxy).addMeritorousShop(slot2, slot1)
		slot0:sendNotification(GAME.GET_MILITARY_SHOP_DONE, Clone(MeritorousShop.New({
			id = 1,
			good_list = slot0.arena_shop_list,
			refreshCount = slot0.flash_count,
			nextTime = slot0.next_flash_time
		})))
	end)
end

return class("GetMilitaryShopCommand", pm.SimpleCommand)
