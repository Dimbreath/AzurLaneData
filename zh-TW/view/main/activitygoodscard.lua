slot0 = class("ActivityGoodsCard")
slot1[ShopsLayer.TYPE_SHAM_SHOP] = {
	0.8745098039215686,
	0.9294117647058824,
	1
}
slot0.Color = {}
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

	slot6 = slot1:getConfig("commodity_type")
	slot8.type = slot6
	slot8.id = slot1:getConfig("commodity_id")
	slot8.count = slot1:getConfig("num")

	updateDrop(slot0.itemTF, {})

	slot0.countTF.text = slot1:getConfig("resource_num")

	if string.match(slot6 == DROP_TYPE_SKIN and (pg.ship_skin_template[slot7].name or "??") or slot8.cfg.name or "??", "(%d+)") then
		setText(slot0.nameTxt, shortenString("", 5))
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
	elseif slot6 == DROP_TYPE_SKIN and not slot4 then
		slot0.limitCountTF.text = "0/" .. slot1:getConfig("num_limit")
	else
		slot0.limitCountTF.text = slot12 - slot1.buyCount .. "/" .. slot12
	end

	slot12 = uv0.Color[slot2] or uv0.DefaultColor
	slot0.limitCountTF.color = slot3 or Color.New(slot12[1], slot12[2], slot12[3], 1)
	slot0.limitCountLabelTF.color = slot3 or Color.New(slot12[1], slot12[2], slot12[3], 1)
end

function slot0.setAsLastSibling(slot0)
	slot0.tr:SetAsLastSibling()
end

function slot0.StaticUpdate(slot0, slot1, slot2, slot3)
	slot4 = tf(slot0)
	slot7 = findTF(slot4, "item/consume/contain/icon"):GetComponent(typeof(Image))

	setActive(findTF(slot4, "item/discount"), false)

	slot12 = findTF(slot4, "item/count_contain/count"):GetComponent(typeof(Text))
	slot13 = findTF(slot4, "item/count_contain/label"):GetComponent(typeof(Text))
	slot14, slot15 = slot1:canPurchase()

	setActive(slot4:Find("mask"), not slot14)
	setActive(slot4:Find("mask/tag/sellout_tag"), not slot14)

	slot16 = slot1:getConfig("commodity_type")
	slot18.type = slot16
	slot18.id = slot1:getConfig("commodity_id")
	slot18.count = slot1:getConfig("num")

	updateDrop(findTF(slot4, "item"), {})

	findTF(slot4, "item/consume/contain/Text"):GetComponent(typeof(Text)).text = slot1:getConfig("resource_num")

	if string.match(slot16 == DROP_TYPE_SKIN and (pg.ship_skin_template[slot17].name or "??") or slot18.cfg.name or "??", "(%d+)") then
		setText(findTF(slot4, "item/name_mask/name"), shortenString("", 5))
	else
		setText(slot6, shortenString(slot19, 6))
	end

	slot20 = nil

	if slot1:getConfig("resource_category") == DROP_TYPE_RESOURCE then
		slot20 = GetSpriteFromAtlas(pg.item_data_statistics[id2ItemId(slot1:getConfig("resource_type"))].icon, "")
	elseif slot21 == DROP_TYPE_ITEM then
		slot20 = GetSpriteFromAtlas(pg.item_data_statistics[slot1:getConfig("resource_type")].icon, "")
	end

	slot7.sprite = slot20

	if slot1:getConfig("num_limit") == 0 then
		slot12.text = i18n("common_no_limit")
	elseif slot16 == DROP_TYPE_SKIN and not slot14 then
		slot12.text = "0/" .. slot1:getConfig("num_limit")
	else
		slot12.text = slot22 - slot1.buyCount .. "/" .. slot22
	end

	slot22 = uv0.Color[slot2] or uv0.DefaultColor
	slot12.color = slot3 or Color.New(slot22[1], slot22[2], slot22[3], 1)
	slot13.color = slot3 or Color.New(slot22[1], slot22[2], slot22[3], 1)
end

function slot0.dispose(slot0)
	pg.DelegateInfo.Dispose(slot0)
end

return slot0
