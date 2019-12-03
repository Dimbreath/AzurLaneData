class("WorldMapReqCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(33106, {
		id = slot1:getBody().mapId
	}, 33107, function (slot0)
		if slot0.result == 0 then
			getProxy(WorldProxy):NetUpdateMap(slot0.map)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("world_map_req_error_", slot0.result))
		end

		if slot0.callback then
			slot0.callback(slot0.result)
		end

		slot1:sendNotification(GAME.WORLD_MAP_REQ_DONE, {
			result = slot0.result
		})
	end)
end

return class("WorldMapReqCommand", pm.SimpleCommand)
