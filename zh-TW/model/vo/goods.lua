slot0 = class("Goods", import(".BaseVO"))
slot0.TYPE_SHOPSTREET = 1
slot0.TYPE_MILITARY = 2
slot0.TYPE_CHARGE = 3
slot0.TYPE_GIFT_PACKAGE = 4
slot0.TYPE_SKIN = 6
slot0.TYPE_ACTIVITY = 7
slot0.TYPE_ACTIVITY_EXTRA = 8
slot0.TYPE_GUILD = 9
slot0.TYPE_SHAM_BATTLE = 10
slot0.TYPE_ESCORT = 11
slot0.TYPE_FRAGMENT = 12
slot0.GIFT_BOX = 1
slot0.MONTH_CARD = 2
slot0.GEM = 0
slot0.ITEM_BOX = 3
slot0.EQUIP_BAG_SIZE_ITEM = 59100
slot0.SHIP_BAG_SIZE_ITEM = 59101
slot0.COMMANDER_BAG_SIZE_ITEM = 59114
slot0.CUR_PACKET_ID = 23

function slot0.Ctor(slot0, slot1, slot2)
	slot0.id = slot1.goods_id or slot1.shop_id or slot1.id
	slot0.configId = slot0.id
	slot0.discount = slot1.discount or 100
	slot0.buyCount = slot1.buy_count or slot1.count or slot1.pay_count or 0
	slot0.type = slot2
	slot0.groupCount = slot1.groupCount or 0
end

function slot0.bindConfigTable(slot0)
	if slot0.type == uv0.TYPE_CHARGE then
		return pg.pay_data_display
	elseif slot0.type == uv0.TYPE_ACTIVITY or slot0.type == uv0.TYPE_SHAM_BATTLE or slot0.type == uv0.TYPE_FRAGMENT or slot0.type == uv0.TYPE_ESCORT then
		return pg.activity_shop_template
	elseif slot0.type == uv0.TYPE_ACTIVITY_EXTRA then
		return pg.activity_shop_extra
	else
		return pg.shop_template
	end
end

function slot0.isChargeType(slot0)
	return slot0.type == uv0.TYPE_CHARGE
end

function slot0.reduceBuyCount(slot0)
	slot0.buyCount = slot0.buyCount - 1
end

function slot0.increaseBuyCount(slot0)
	if not slot0.buyCount then
		slot0.buyCount = 0
	end

	slot0.buyCount = slot0.buyCount + 1
end

function slot0.addBuyCount(slot0, slot1)
	slot0.buyCount = slot0.buyCount + slot1
end

function slot0.canPurchase(slot0)
	if slot0.type == slot0.TYPE_MILITARY then
		return slot0.buyCount == 0
	elseif slot0.type == slot0.TYPE_CHARGE or slot0.type == slot0.TYPE_GIFT_PACKAGE or slot0.type == slot0.TYPE_SKIN then
		return slot0:getLimitCount() <= 0 or slot0.buyCount < slot1
	elseif slot0.type == slot0.TYPE_SHOPSTREET or slot0.type == slot0.TYPE_GUILD then
		return slot0.buyCount > 0
	elseif slot0.type == slot0.TYPE_ACTIVITY or slot0.type == slot0.TYPE_ACTIVITY_EXTRA or slot0.type == slot0.TYPE_SHAM_BATTLE or slot0.type == slot0.TYPE_FRAGMENT or slot0.type == slot0.TYPE_ESCORT then
		if slot0:getConfig("num_limit") == 0 then
			return true
		end

		if slot0:getConfig("commodity_type") == DROP_TYPE_SKIN then
			slot2 = slot0:getConfig("commodity_id")
			slot3 = pg.ship_skin_template[slot2]

			if getProxy(ShipSkinProxy):hasSkin(slot2) then
				return false, i18n("common_already owned")
			end

			return slot0.buyCount < slot0:getConfig("num_limit")
		elseif slot1 == DROP_TYPE_FURNITURE then
			slot2 = slot0:getConfig("commodity_id")

			return getProxy(DormProxy):getFurnitrueCount(slot2) < pg.furniture_data_template[slot2].count and slot0.buyCount < slot0:getConfig("num_limit")
		else
			return slot0.buyCount < slot0:getConfig("num_limit")
		end
	end
end

function slot0.hasDiscount(slot0)
	return slot0.discount < 100
end

function slot0.isDisCount(slot0)
	if slot0.type ~= uv0.TYPE_CHARGE and slot0.type ~= uv0.TYPE_ACTIVITY and slot0.type ~= uv0.TYPE_ACTIVITY_EXTRA and slot0.type ~= uv0.TYPE_SHAM_BATTLE and slot0.type ~= uv0.TYPE_FRAGMENT and slot0.type ~= slot0.TYPE_ESCORT then
		slot2 = true

		if table.getCount(slot0:getConfig("discount_time")) ~= 0 then
			slot2 = pg.TimeMgr.GetInstance():inTime(slot1)
		end

		if slot0:IsItemDiscountType() then
			return slot2
		else
			return slot0:getConfig("discount") ~= 0 and slot2
		end
	end

	return false
end

function slot0.GetPrice(slot0)
	slot1 = 0
	slot2 = slot0:getConfig("resource_num")

	if slot0:isDisCount() and slot0:IsItemDiscountType() then
		slot4 = pg.shop_discount_coupon_template[slot0.id].discounted_price
		slot1 = (slot2 - slot4) / slot2 * 100
		slot2 = slot4
	elseif slot3 then
		slot2 = (100 - slot0:getConfig("discount")) / 100 * slot2
	end

	return slot2, slot1
end

function slot0.IsItemDiscountType(slot0)
	return slot0:getConfig("genre") == ShopArgs.SkinShop and pg.shop_discount_coupon_template[slot0.id] ~= nil and function ()
		return getProxy(ActivityProxy):ExistSkinCouponActivityAndShopId(uv0.id)
	end()
end

function slot0.GetDiscountItem(slot0)
	return pg.item_data_statistics[pg.shop_discount_coupon_template[slot0.id].item]
end

function slot0.isLevelLimit(slot0, slot1, slot2)
	slot3, slot4 = slot0:getLevelLimit()

	if slot2 and slot4 then
		return false
	end

	return slot3 > 0 and slot1 < slot3
end

function slot0.getLevelLimit(slot0)
	for slot5, slot6 in ipairs(slot0:getConfig("limit_args")) do
		if type(slot6) == "table" and slot6[1] == "level" then
			return slot6[2], slot6[3]
		end
	end

	return 0
end

function slot0.isTimeLimit(slot0)
	return slot0:getLimitCount() <= 0 or slot1 < slot0.buyCount
end

function slot0.firstPayDouble(slot0)
	return slot0:isChargeType() and slot0:getConfig("first_pay_double") ~= 0
end

function slot0.hasExtraGem(slot0)
	return slot0:getConfig("extra_gem") ~= 0
end

function slot0.isGiftBox(slot0)
	return slot0:getConfig("extra_service") == uv0.GIFT_BOX
end

function slot0.isMonthCard(slot0)
	return slot0:getConfig("extra_service") == uv0.MONTH_CARD
end

function slot0.isGem(slot0)
	return slot0:getConfig("extra_service") == uv0.GEM
end

function slot0.isItemBox(slot0)
	return slot0:getConfig("extra_service") == uv0.ITEM_BOX
end

function slot0.isGiftPackage(slot0)
	return slot0.type == uv0.TYPE_GIFT_PACKAGE
end

function slot0.isSham(slot0)
	return slot0.type == uv0.TYPE_SHAM_BATTLE
end

function slot0.checkCommodityType(slot0, slot1)
	return slot0:getConfig("commodity_type") == slot1
end

function slot0.getSkinId(slot0)
	if slot0.type == uv0.TYPE_ACTIVITY_EXTRA or slot0.type == uv0.TYPE_ACTIVITY then
		return slot0:getConfig("commodity_id")
	elseif slot0.type == uv0.TYPE_SKIN then
		return slot0:getConfig("effect_args")[1]
	end
end

function slot0.getKey(slot0)
	return slot0.id .. "_" .. slot0.type
end

function slot0.getLimitCount(slot0)
	if slot0.type == uv0.TYPE_CHARGE then
		return slot0:getConfig("limit_arg")
	else
		for slot5, slot6 in ipairs(slot0:getConfig("limit_args") or {}) do
			if slot6[1] == "time" then
				return slot6[2]
			end
		end
	end

	return 0
end

function slot0.updateBuyCount(slot0, slot1)
	slot0.buyCount = slot1
end

function slot0.updateGroupCount(slot0, slot1)
	slot0.groupCount = slot1
end

function slot0.inTime(slot0)
	if not slot0:getConfig("time") then
		return true
	end

	if type(slot1) == "string" then
		return slot1 == "always"
	else
		slot2 = nil

		if #slot1 > 0 then
			slot2 = pg.TimeMgr.GetInstance():ParseTimeEx(slot1[1][1][1] .. "-" .. slot1[1][1][2] .. "-" .. slot1[1][1][3] .. " " .. slot1[1][2][1] .. ":" .. slot1[1][2][2] .. ":" .. slot1[1][2][3], nil, true)
		end

		slot3 = nil

		if #slot1 > 1 then
			slot3 = pg.TimeMgr.GetInstance():ParseTimeEx(slot1[2][1][1] .. "-" .. slot1[2][1][2] .. "-" .. slot1[2][1][3] .. " " .. slot1[2][2][1] .. ":" .. slot1[2][2][2] .. ":" .. slot1[2][2][3], nil, true)
		end

		if slot2 and slot3 then
			return slot2 <= pg.TimeMgr.GetInstance():GetServerTime() and slot4 <= slot3, slot3 - slot4
		end

		return true
	end
end

function slot0.calDayLeft(slot0)
	slot1, slot2 = slot0:inTime()

	if slot1 and slot2 and slot2 > 0 then
		return slot1, pg.TimeMgr.GetInstance():parseTimeFrom(slot2) + 1
	end
end

return slot0
