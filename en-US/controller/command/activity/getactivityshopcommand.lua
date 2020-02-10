slot0 = class("GetActivityShopCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot6 = getProxy(ShopsProxy)
	slot7 = {}

	_.each(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SHOP), function (slot0)
		if slot0 and not slot0:isEnd() then
			uv0[slot0.id] = ActivityShop.New(slot0)

			uv1:addActivityShops(uv0)
		end
	end)
	slot0:sendNotification(GAME.GET_ACTIVITY_SHOP_DONE)
end

return slot0
