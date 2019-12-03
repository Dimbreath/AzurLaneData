slot0 = class("ActivityGoodsCard")
slot0.Color = {
	[ShopsLayer.TYPE_SHAM_SHOP] = {
		0.8745098039215686,
		0.9294117647058824,
		1
	}
}
slot0.DefaultColor = {
	0.8745098039215686,
	0.9294117647058824,
	1
}

function slot0.Ctor(slot0, slot1)
	pg.DelegateInfo.New(slot0)

	slot0.go = slot1
	slot0.tr = tf(slot1)
	slot0.itemTF = findTF(slot0.tr, "item")
	slot0.nameTxt = findTF(slot0.tr, "item/name_mask/name")
	slot0.resIconTF = findTF(slot0.tr, "item/consume/contain/icon"):GetComponent(typeof(Image))
	slot0.mask = slot0.tr:Find("mask")
	slot0.selloutTag = slot0.tr:Find("mask/tag/sellout_tag")
	slot0.countTF = findTF(slot0.tr, "item/consume/contain/Text"):GetComponent(typeof(Text))
	slot0.discountTF = findTF(slot0.tr, "item/discount")

	setActive(slot0.discountTF, false)

	slot0.limitCountTF = findTF(slot0.tr, "item/count_contain/count"):GetComponent(typeof(Text))
	slot0.limitCountLabelTF = findTF(slot0.tr, "item/count_contain/label"):GetComponent(typeof(Text))
end

function slot0.update(slot0, slot1, slot2, slot3)
	slot0.goodsVO = slot1
	slot4, slot5 = slot0.goodsVO:canPurchase()

	setActive(slot0.mask, not slot4)
	setActive(slot0.selloutTag, not slot4)
	updateDrop(slot0.itemTF, {
		type = slot1:getConfig("commodity_type"),
		id = slot1:getConfig("commodity_id"),
		count = slot1:getConfig("num")
	})

	slot9 = ""

	if slot1.getConfig("commodity_type") == DROP_TYPE_SKIN then
		slot9 = pg.ship_skin_template[slot7].name or "??"
	end

	slot0.countTF.text = slot1:getConfig("resource_num")

	if string.match(slot8.cfg.name or "??", "(%d+)") then
		setText(slot0.nameTxt, shortenString(slot9, 4))
	else
		setText(slot0.nameTxt, shortenString(slot9, 6))
	end

	slot10 = nil

	if slot1:getConfig("resource_category") == DROP_TYPE_RESOURCE then
		slot10 = GetSpriteFromAtlas(pg.item_data_statistics[id2ItemId(slot1:getConfig("resource_type"))].icon, "")
	elseif slot11 == DROP_TYPE_ITEM then
		slot10 = GetSpriteFromAtlas(pg.item_data_statistics[slot1:getConfig("resource_type")].icon, "")
	end

	slot0.resIconTF.sprite = slot10

	if slot1:getConfig("num_limit") == 0 then
		slot0.limitCountTF.text = i18n("common_no_limit")
	else
		slot12 = slot1:getConfig("num_limit")

		if slot6 == DROP_TYPE_SKIN and not slot4 then
			slot0.limitCountTF.text = "0/" .. slot12
		else
			slot0.limitCountTF.text = slot12 - slot1.buyCount .. "/" .. slot12
		end
	end

	slot0.limitCountTF.color = slot3 or Color.New(slot0.Color[slot2] or slot0.DefaultColor[1], slot0.Color[slot2] or slot0.DefaultColor[2], slot0.Color[slot2] or slot0.DefaultColor[3], 1)
	slot0.limitCountLabelTF.color = slot3 or Color.New(slot0.Color[slot2] or slot0.DefaultColor[1], slot0.Color[slot2] or slot0.DefaultColor[2], slot0.Color[slot2] or slot0.DefaultColor[3], 1)
end

function slot0.setAsLastSibling(slot0)
	slot0.tr:SetAsLastSibling()
end

function slot0.dispose(slot0)
	pg.DelegateInfo.Dispose(slot0)
end

return slot0
