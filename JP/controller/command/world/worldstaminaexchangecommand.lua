class("WorldStaminaExchangeCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()
	slot6, slot7 = getProxy(WorldProxy).GetWorld(slot3).staminaMgr.GetExchangeData(slot5)

	pg.ConnectionMgr.GetInstance():Send(33108, {
		type = 1
	}, 33109, function (slot0)
		if slot0.result == 0 then
			slot1 = getProxy(PlayerProxy)
			player = slot1:getRawData()

			player:consume({
				oil = slot0
			})
			slot1:ExchangeStamina(slot1.ExchangeStamina)
			slot1:sendNotification(GAME.WORLD_STAMINA_EXCHANGE_DONE)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("world_stamina_exchange_err_", slot0.result))
		end
	end)
end

return class("WorldStaminaExchangeCommand", pm.SimpleCommand)
