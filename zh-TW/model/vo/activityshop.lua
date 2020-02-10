slot0 = class("ActivityShop", import(".BaseVO"))

function slot0.Ctor(slot0, slot1)
	slot0.activityId = slot1.id
	slot2 = {}

	for slot6, slot7 in ipairs(slot1.data1_list) do
		slot2[slot7] = slot1.data2_list[slot6]
	end

	slot0.goods = {}

	for slot7, slot8 in ipairs(slot0:bindConfigTable().all) do
		if slot1.id == slot3[slot8].activity then
			slot12.shop_id = slot8
			slot12.buy_count = slot2[slot8] or 0
			slot0.goods[slot8] = Goods.New({}, Goods.TYPE_ACTIVITY)
		end
	end

	slot0.type = ShopArgs.ShopActivity
	slot0.config = pg.activity_template[slot0.activityId]
end

function slot0.getSortGoods(slot0)
	for slot5, slot6 in pairs(slot0.goods) do
		table.insert({}, slot6)
	end

	table.sort(slot1, function (slot0, slot1)
		if (slot0:canPurchase() and 1 or 0) == (slot1:canPurchase() and 1 or 0) then
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

function slot0.bindConfigTable(slot0)
	return pg.activity_shop_template
end

function slot0.getGoodsById(slot0, slot1)
	return slot0.goods[slot1]
end

function slot0.isEnd(slot0)
	slot1 = getProxy(ActivityProxy)

	return not slot1:getActivityById(slot0.activityId) or slot1:isEnd()
end

function slot0.getOpenTime(slot0)
	slot2 = pg.activity_template[slot0.activityId].time
	slot3 = slot2[2][1]
	slot4 = slot2[3][1]

	return string.format("%d.%d.%d~%d.%d.%d", slot3[1], slot3[2], slot3[3], slot4[1], slot4[2], slot4[3])
end

function slot0.getStartTime(slot0)
	if slot0:isEnd() then
		return 0
	end

	return getProxy(ActivityProxy):getActivityById(slot0.activityId):getStartTime()
end

function slot0.getBgPath(slot0)
	slot2 = pg.activity_template[slot0.activityId].config_client[2] or {
		255,
		255,
		255,
		255
	}

	return slot1.config_client[1], Color.New(slot2[1], slot2[2], slot2[3], slot2[4])
end

function slot0.getToggleImage(slot0)
	return pg.activity_template[slot0.activityId].config_client.toggle or "huodongdduihuan_butten"
end

function slot0.getResId(slot0)
	slot1 = nil

	for slot5, slot6 in pairs(slot0.goods) do
		slot1 = slot6

		break
	end

	return slot1:getConfig("resource_type")
end

function slot0.GetEnterVoice(slot0)
	if slot0.config.config_client.enter then
		return slot1[1], slot1[2]
	end
end

function slot0.GetPurchaseVoice(slot0)
	if slot0.config.config_client.purchase then
		return slot1[1], slot1[2]
	end
end

return slot0
