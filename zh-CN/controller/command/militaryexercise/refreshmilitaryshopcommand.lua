class("RefreshMilitaryShopCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(18102, {
		type = 0
	}, 18103, function (slot0)
		if slot0.result == 0 then
			slot5 = getProxy(PlayerProxy)
			slot6 = slot5:getData()

			slot6:consume({
				gem = pg.arena_data_shop[1].refresh_price[getProxy(ShopsProxy).getMeritorousShop(slot1).refreshCount] or slot3.refresh_price[#slot3.refresh_price]
			})
			slot5:updatePlayer(slot6)
			slot2:increaseRefreshCount()

			slot7 = {}

			for slot11, slot12 in ipairs(slot0.arena_shop_list) do
				slot7[Goods.New(slot12, Goods.TYPE_MILITARY).id] = Goods.New(slot12, Goods.TYPE_MILITARY)
			end

			slot2:updateAllGoods(slot7)
			slot1:updateMeritorousShop(slot2)
			slot0:sendNotification(GAME.REFRESH_MILITARY_SHOP_DONE, Clone(slot2))
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("", slot0.result))
		end
	end)
end

return class("RefreshMilitaryShopCommand", pm.SimpleCommand)
