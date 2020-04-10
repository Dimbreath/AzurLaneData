class("GetActivityShopCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot7 = getProxy(ShopsProxy)
	slot8 = {}

	_.each(slot6, function (slot0)
		if slot0 and not slot0:isEnd() then
			slot0[slot0.id] = ActivityShop.New(slot0)

			slot1:addActivityShops(slot0)
		end
	end)
	slot0:sendNotification(GAME.GET_ACTIVITY_SHOP_DONE)

	if slot1:getBody() and slot2.callback then
		slot3(slot8)
	end
end

return class("GetActivityShopCommand", pm.SimpleCommand)
