slot0 = class("WorldMapReqCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot6.id = slot1:getBody().mapId

	pg.ConnectionMgr.GetInstance():Send(33106, {}, 33107, function (slot0)
		if slot0.result == 0 then
			getProxy(WorldProxy):NetUpdateMap(slot0.map)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("world_map_req_error_", slot0.result))
		end

		if uv0.callback then
			uv0.callback(slot0.result)
		end

		slot4.result = slot0.result

		uv1:sendNotification(GAME.WORLD_MAP_REQ_DONE, {})
	end)
end

return slot0
