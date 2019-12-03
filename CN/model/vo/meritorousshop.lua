slot0 = class("MeritorousShop", import(".BaseVO"))
slot0.REFRESH_TYPE_AUTO = 1
slot0.REFRESH_TYPE_MANUAL = 2

slot0.Ctor = function (slot0, slot1)
	slot0.id = slot1.id
	slot0.configId = slot0.id
	slot0.goods = {}

	for slot5, slot6 in ipairs(slot1.good_list) do
		slot0.goods[Goods.New(slot6, Goods.TYPE_MILITARY).id] = Goods.New(slot6, Goods.TYPE_MILITARY)
	end

	slot0.nextTime = slot1.nextTime
	slot0.refreshCount = slot1.refreshCount + 1
	slot0.type = ShopArgs.MilitaryShop
end

slot0.bindConfigTable = function (slot0)
	return pg.arena_data_shop
end

slot0.getRefreshCount = function (slot0)
	return slot0.refreshCount
end

slot0.resetRefreshCount = function (slot0)
	slot0.refreshCount = 1
end

slot0.increaseRefreshCount = function (slot0)
	slot0.refreshCount = slot0.refreshCount + 1
end

slot0.updateAllGoods = function (slot0, slot1)
	slot0.goods = slot1
end

slot0.getGoodsById = function (slot0, slot1)
	return Clone(slot0.goods[slot1])
end

slot0.updateGoods = function (slot0, slot1)
	slot0.goods[slot1.id] = slot1
end

return slot0
