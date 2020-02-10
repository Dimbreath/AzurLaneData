slot0 = class("ChargeCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	if PLATFORM_CODE == PLATFORM_US or PLATFORM_CODE == PLATFORM_JP then
		if not pg.SdkMgr.GetInstance():CheckAiriCanBuy() then
			print("wait for a second, Do not click quickly~")

			return
		end
	end

	slot5 = getProxy(ShopsProxy):getFirstChargeList() or {}

	if not slot1:getBody().shopId then
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
			if PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US then
				if pg.SdkMgr.GetInstance():GetIsPlatform() then
					if pg.SdkMgr.GetInstance():CheckAudit() then
						print("serverTag:audit 请求购买物品")
						pg.SdkMgr.GetInstance():AiriBuy(uv0:getConfig("airijp_id"), "audit", slot0.pay_id)
					elseif pg.SdkMgr.GetInstance():CheckPreAudit() then
						print("serverTag:preAudit 请求购买物品")
						pg.SdkMgr.GetInstance():AiriBuy(uv0:getConfig("airijp_id"), "preAudit", slot0.pay_id)
					elseif pg.SdkMgr.GetInstance():CheckPretest() then
						print("serverTag:pretest 请求购买物品")
						AiriBuy(uv0:getConfig("airijp_id"), "pretest", slot0.pay_id)
					else
						print("serverTag:production 请求购买物品")
						pg.SdkMgr.GetInstance():AiriBuy(uv0:getConfig("airijp_id"), "production", slot0.pay_id)
					end

					print("请求购买的airijp_id为：" .. uv0:getConfig("airijp_id"))
					print("请求购买的id为：" .. slot0.pay_id)
				end
			else
				slot3 = getProxy(PlayerProxy):getData()
				slot5 = uv0:getConfig("money") * 100
				slot6 = uv0:getConfig("name")
				slot7 = 0

				if uv0:firstPayDouble() and uv1 then
					slot7 = uv0:getConfig("gem") * 2
				else
					slot7 = uv0:getConfig("gem") + uv0:getConfig("extra_gem")
				end

				pg.SdkMgr.GetInstance():SdkPay(uv0:getConfig("id_str"), slot5, slot6, slot7, slot8, uv0:getConfig("subject"), "-" .. slot3.id .. "-" .. slot0.pay_id, slot3.name, slot0.url or "", slot0.order_sign or "")
			end

			pg.TrackerMgr.GetInstance():Tracking(TRACKING_PURCHASE, uv2)
			getProxy(ShopsProxy):addWaitTimer()
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("charge_erro", slot0.result))
		end
	end)
end

return slot0
