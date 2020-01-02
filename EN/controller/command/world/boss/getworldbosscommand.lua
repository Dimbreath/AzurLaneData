class("GetWorldBossCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()

	pg.ConnectionMgr.GetInstance():Send(33501, {
		type = 0
	}, 33502, function (slot0)
		if slot0.result == 0 then
			slot3 = WorldBossProxy.New()
			getProxy(WorldProxy).GetWorld(slot1).worldBossProxy = slot3

			slot3:Setup(slot0)
			slot0:sendNotification(GAME.WORLD_GET_BOSS_DONE)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("world_activate_error_", slot0.result))
		end
	end)
end

return class("GetWorldBossCommand", pm.SimpleCommand)
