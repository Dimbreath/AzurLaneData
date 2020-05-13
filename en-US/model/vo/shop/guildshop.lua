slot0 = class("GuildShop", import(".BaseShop"))
slot0.AUTO_REFRESH = 1
slot0.MANUAL_REFRESH = 2

function slot0.Ctor(slot0, slot1)
	slot0.id = slot1.id or 1
	slot0.configId = slot0.id
	slot0.goods = {}

	for slot5, slot6 in ipairs(slot1.good_list) do
		slot7 = Goods.New(slot6, Goods.TYPE_GUILD)
		slot0.goods[slot7.id] = slot7
	end

	slot0.refreshCount = slot1.refresh_count
	slot0.nextRefreshTime = slot1.next_refresh_time
	slot0.type = ShopArgs.ShopGUILD
end

function slot0.IsSameKind(slot0, slot1)
	return isa(slot1, GuildShop)
end

function slot0.GetCommodityById(slot0, slot1)
	return slot0:getGoodsById(slot1)
end

function slot0.GetCommodities(slot0)
	return slot0:getSortGoods()
end

function slot0.bindConfigTable(slot0)
end

function slot0.updateNextRefreshTime(slot0, slot1)
	slot0.nextRefreshTime = slot1
end

function slot0.getSortGoods(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.goods) do
		table.insert(slot1, slot6)
	end

	return slot1
end

function slot0.getGoodsById(slot0, slot1)
	return slot0.goods[slot1]
end

return slot0
