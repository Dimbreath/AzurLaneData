slot0 = class("ChargeConfirmCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot5 = getProxy(ShopsProxy)
	slot9.pay_id = slot2.payId
	slot9.pay_id_bili = slot2.bsId or ""

	pg.ConnectionMgr.GetInstance():Send(11504, {}, 11505, function (slot0)
		if slot0.result == 0 then
			uv0:removeChargeTimer(uv1)

			slot4.shopId = slot0.shop_id
			slot4.payId = uv1
			slot4.gem = slot0.gem
			slot4.gem_free = slot0.gem_free

			uv2:sendNotification(GAME.CHARGE_SUCCESS, {})
		elseif slot0.result == 4 then
			slot4.payId = uv1
			slot4.bsId = uv3

			uv2:sendNotification(GAME.CHARGE_CONFIRM_FAILED, {})
		else
			uv0:removeChargeTimer(uv1)

			if slot0.result ~= 1 then
				pg.TipsMgr.GetInstance():ShowTips(errorTip("charge_erro", slot0.result))
			end
		end
	end)
end

return slot0
