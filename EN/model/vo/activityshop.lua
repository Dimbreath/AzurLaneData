slot0 = class("ActivityShop", import(".BaseVO"))

slot0.Ctor = function (slot0, slot1)
	slot0.activityId = slot1.id
	slot2 = {}

	for slot6, slot7 in ipairs(slot1.data1_list) do
		slot2[slot7] = slot1.data2_list[slot6]
	end

	slot0.goods = {}

	for slot7, slot8 in ipairs(slot0:bindConfigTable().all) do
		if slot1.id == slot3[slot8].activity then
			slot0.goods[slot8] = Goods.New({
				shop_id = slot8,
				buy_count = slot2[slot8] or 0
			}, Goods.TYPE_ACTIVITY)
		end
	end

	slot0.type = ShopArgs.ShopActivity
	slot0.config = pg.activity_template[slot0.activityId]
end

slot0.getSortGoods = function (slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.goods) do
		table.insert(slot1, slot6)
	end

	table.sort(slot1, function (slot0, slot1)
		if ((slot0:canPurchase() and 1) or 0) == ((slot1:canPurchase() and 1) or 0) then
			if slot0:getConfig("order") == slot1:getConfig("order") then
				return slot0.id < slot1.id
			else
				return slot4 < slot5
			end
		else
			return slot3 < slot2
		end
	end)

	return slot1
end

slot0.bindConfigTable = function (slot0)
	return pg.activity_shop_template
end

slot0.getGoodsById = function (slot0, slot1)
	return slot0.goods[slot1]
end

slot0.isEnd = function (slot0)
	return not getProxy(ActivityProxy):getActivityById(slot0.activityId) or slot1:isEnd()
end

slot0.getOpenTime = function (slot0)
	return string.format("%d/%d/%d - %d/%d/%d", pg.activity_template[slot0.activityId].time[2][1][2], pg.activity_template[slot0.activityId].time[2][1][3], pg.activity_template[slot0.activityId].time[2][1][1], pg.activity_template[slot0.activityId].time[3][1][2], pg.activity_template[slot0.activityId].time[3][1][3], pg.activity_template[slot0.activityId].time[3][1][1])
end

slot0.getStartTime = function (slot0)
	if slot0:isEnd() then
		return 0
	end

	return getProxy(ActivityProxy):getActivityById(slot0.activityId):getStartTime()
end

slot0.getBgPath = function (slot0)
	return slot1.config_client[1], Color.New(pg.activity_template[slot0.activityId].config_client[2] or {
		255,
		255,
		255,
		255
	}[1], pg.activity_template[slot0.activityId].config_client[2] or [2], pg.activity_template[slot0.activityId].config_client[2] or [3], pg.activity_template[slot0.activityId].config_client[2] or [4])
end

slot0.getToggleImage = function (slot0)
	return pg.activity_template[slot0.activityId].config_client.toggle or "huodongdduihuan_butten"
end

slot0.getResId = function (slot0)
	slot1 = nil

	for slot5, slot6 in pairs(slot0.goods) do
		slot1 = slot6

		break
	end

	return slot1:getConfig("resource_type")
end

slot0.GetEnterVoice = function (slot0)
	if slot0.config.config_client.enter then
		return slot1[1], slot1[2]
	end
end

slot0.GetPurchaseVoice = function (slot0)
	if slot0.config.config_client.purchase then
		return slot1[1], slot1[2]
	end
end

return slot0
