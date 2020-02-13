class("GetShopStreetCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(22101, {
		type = 0
	}, 22102, function (slot0)
		slot0:sendNotification(GAME.GET_SHOPSTREET_DONE)
	end)
end

return class("GetShopStreetCommand", pm.SimpleCommand)
