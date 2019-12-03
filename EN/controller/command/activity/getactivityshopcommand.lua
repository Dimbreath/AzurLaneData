class("GetActivityShopCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()
	slot6 = getProxy(ShopsProxy)
	slot7 = {}

	_.each(slot5, function (slot0)
		if slot0 and not slot0:isEnd() then
			slot0[slot0.id] = ActivityShop.New(slot0)

			slot1:addActivityShops(slot0)
		end
	end)
	slot0:sendNotification(GAME.GET_ACTIVITY_SHOP_DONE)
end

return class("GetActivityShopCommand", pm.SimpleCommand)
