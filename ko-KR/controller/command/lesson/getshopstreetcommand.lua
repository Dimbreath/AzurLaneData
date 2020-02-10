slot0 = class("GetShopStreetCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(22101, {
		type = 0
	}, 22102, function (slot0)
		uv0:sendNotification(GAME.GET_SHOPSTREET_DONE)
	end)
end

return slot0
