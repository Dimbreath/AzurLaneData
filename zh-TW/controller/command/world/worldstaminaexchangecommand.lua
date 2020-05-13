slot0 = class("WorldStaminaExchangeCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot6, slot7 = getProxy(WorldProxy):GetWorld().staminaMgr:GetExchangeData()

	pg.ConnectionMgr.GetInstance():Send(33108, {
		type = 1
	}, 33109, function (slot0)
		if slot0.result == 0 then
			player = getProxy(PlayerProxy):getRawData()

			player:consume({
				oil = uv0
			})
			uv1:ExchangeStamina(uv2)
			uv3:sendNotification(GAME.WORLD_STAMINA_EXCHANGE_DONE)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("world_stamina_exchange_err_", slot0.result))
		end
	end)
end

return slot0
