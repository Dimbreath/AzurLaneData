class("GetGuildShopCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot3 = slot1:getBody().type or 0

	pg.ConnectionMgr.GetInstance():Send(60033, {
		type = 0
	}, 60034, function ()
		slot0:sendNotification(GAME.GET_GUILD_SHOP_DONE)
	end)
end

return class("GetGuildShopCommand", pm.SimpleCommand)
