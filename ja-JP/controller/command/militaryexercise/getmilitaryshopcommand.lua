slot0 = class("GetMilitaryShopCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(18100, {
		type = 0
	}, 18101, function (slot0)
		slot2.good_list = slot0.arena_shop_list
		slot2.refreshCount = slot0.flash_count
		slot2.nextTime = slot0.next_flash_time
		slot1 = MeritorousShop.New({
			id = 1
		})

		getProxy(ShopsProxy):addMeritorousShop(slot1)
		uv0:sendNotification(GAME.GET_MILITARY_SHOP_DONE, Clone(slot1))
	end)
end

return slot0
