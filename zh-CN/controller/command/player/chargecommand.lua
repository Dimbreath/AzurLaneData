class("ChargeCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	if (PLATFORM_CODE == PLATFORM_US or PLATFORM_CODE == PLATFORM_JP) and not pg.SdkMgr.GetInstance():CheckAiriCanBuy() then
		print("wait for a second, Do not click quickly~")

		return
	end

	slot3 = slot1:getBody().shopId
	slot5 = getProxy(ShopsProxy):getFirstChargeList() or {}

	if not slot3 then
		return
	end

	slot6 = not table.contains(slot5, slot3)
	slot7 = Goods.New({
		shop_id = slot3
	}, Goods.TYPE_CHARGE)

	pg.TrackerMgr.GetInstance():Tracking(TRACKING_PURCHASE_CLICK, slot3)
	pg.ConnectionMgr.GetInstance():Send(11501, {
		shop_id = slot3
	}, 11502, function (slot0)
		if slot0.result == 0 then
			if (PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US) and pg.SdkMgr.GetInstance():GetIsPlatform() then
				if pg.SdkMgr.GetInstance():CheckAudit() then
					print("serverTag:audit 请求购买物品")
					pg.SdkMgr.GetInstance():AiriBuy(slot0:getConfig("airijp_id"), "audit", slot0.pay_id)
				elseif pg.SdkMgr.GetInstance():CheckPreAudit() then
					print("serverTag:preAudit 请求购买物品")
					pg.SdkMgr.GetInstance():AiriBuy(slot0:getConfig("airijp_id"), "preAudit", slot0.pay_id)
				elseif pg.SdkMgr.GetInstance():CheckPretest() then
					print("serverTag:pretest 请求购买物品")
					AiriBuy(slot0:getConfig("airijp_id"), "pretest", slot0.pay_id)
				else
					print("serverTag:production 请求购买物品")
					pg.SdkMgr.GetInstance():AiriBuy(slot0:getConfig("airijp_id"), "production", slot0.pay_id)
				end

				print("请求购买的airijp_id为：" .. slot0:getConfig("airijp_id"))
				print("请求购买的id为：" .. slot0.pay_id)
			else
				slot7 = 0

				pg.SdkMgr.GetInstance():SdkPay(slot0:getConfig("id_str"), slot0:getConfig("money") * 100, slot0:getConfig("name"), (slot0:firstPayDouble() and slot1 and slot0:getConfig("gem") * 2) or slot0:getConfig("gem") + slot0:getConfig("extra_gem"), slot8, slot0:getConfig("subject"), "-" .. getProxy(PlayerProxy).getData(slot2).id .. "-" .. slot0.pay_id, getProxy(PlayerProxy).getData(slot2).name, slot0.url or "", slot0.order_sign or "")
			end

			pg.TrackerMgr.GetInstance():Tracking(TRACKING_PURCHASE, pg.TrackerMgr.GetInstance())
			getProxy(ShopsProxy):addWaitTimer()
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("charge_erro", slot0.result))
		end
	end)
end

return class("ChargeCommand", pm.SimpleCommand)
