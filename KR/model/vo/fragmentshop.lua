slot0 = class("FragmentShop", import(".MonthlyShop"))
slot0.GoodsType = import(".Goods").TYPE_FRAGMENT
slot0.type = ShopArgs.ShopFragment

function slot0.update(slot0, slot1, slot2)
	slot0.id = slot1
	slot0.configId = slot1
	slot3 = {}

	for slot7, slot8 in ipairs(slot2) do
		slot3[slot8.shop_id] = slot8.pay_count
	end

	table.clear(slot0.goods)

	if slot0.id and slot0.id > 0 and slot0:getConfigTable() then
		for slot7, slot8 in ipairs(slot0:getConfig("blueprint_shop_goods")) do
			slot0.goods[slot8] = slot0.New({
				shop_id = slot8,
				buy_count = slot3[slot8] or 0
			}, slot0.GoodsType)
		end
	end
end

return slot0
