class("GetShopStreetCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot3 = slot1:getBody() and slot2.callback

	pg.ConnectionMgr.GetInstance():Send(22101, {
		type = 0
	}, 22102, function (slot0)
		slot0:sendNotification(GAME.GET_SHOPSTREET_DONE)

		if getProxy(ShopsProxy):getShopStreet() then
			slot1(slot1)
		end
	end)
end

return class("GetShopStreetCommand", pm.SimpleCommand)
