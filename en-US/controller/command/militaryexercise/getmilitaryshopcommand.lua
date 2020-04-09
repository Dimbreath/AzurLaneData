class("GetMilitaryShopCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot3 = slot1:getBody() and slot2.callback

	pg.ConnectionMgr.GetInstance():Send(18100, {
		type = 0
	}, 18101, function (slot0)
		getProxy(ShopsProxy):addMeritorousShop(MeritorousShop.New({
			id = 1,
			good_list = slot0.arena_shop_list,
			refreshCount = slot0.flash_count,
			nextTime = slot0.next_flash_time
		}))

		if slot0 then
			slot0(slot1)
		end

		slot1:sendNotification(GAME.GET_MILITARY_SHOP_DONE, Clone(slot1))
	end)
end

return class("GetMilitaryShopCommand", pm.SimpleCommand)
