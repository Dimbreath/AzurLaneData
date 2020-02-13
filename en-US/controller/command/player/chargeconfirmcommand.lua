class("ChargeConfirmCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot5 = getProxy(ShopsProxy)

	pg.ConnectionMgr.GetInstance():Send(11504, {
		pay_id = slot1:getBody().payId,
		pay_id_bili = slot1.getBody().bsId or ""
	}, 11505, function (slot0)
		if slot0.result == 0 then
			slot0:removeChargeTimer(slot0.removeChargeTimer)
			slot0:sendNotification(GAME.CHARGE_SUCCESS, {
				shopId = slot0.shop_id,
				payId = slot1,
				gem = slot0.gem,
				gem_free = slot0.gem_free
			})
		elseif slot0.result == 4 then
			slot2:sendNotification(GAME.CHARGE_CONFIRM_FAILED, {
				payId = slot1,
				bsId = GAME.CHARGE_CONFIRM_FAILED
			})
		else
			slot0:removeChargeTimer(slot0.removeChargeTimer)

			if slot0.result ~= 1 then
				pg.TipsMgr.GetInstance():ShowTips(errorTip("charge_erro", slot0.result))
			end
		end
	end)
end

return class("ChargeConfirmCommand", pm.SimpleCommand)
