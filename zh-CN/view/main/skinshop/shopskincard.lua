slot0 = class("ShopSkinCard")
slot1 = pg.ship_data_group
slot2 = pg.shop_template
slot3 = pg.skin_page_template
slot4 = pg.ship_skin_template

function slot0.Ctor(slot0, slot1)
	slot0._go = slot1
	slot0._tf = tf(slot1)
	slot0._content = slot0._tf:Find("content")
	slot0._mask = slot0._tf:Find("mask")
	slot0._icon = slot0._tf:Find("content/main/bg/icon"):GetComponent(typeof(Image))
	slot0._priceTF = slot0._tf:Find("content/main/bg/price")

	setActive(slot0._priceTF, false)

	slot0._priceIcon = slot0._priceTF:Find("gem"):GetComponent(typeof(Image))
	slot0._priceTxt = slot0._priceTF:Find("gem/Text"):GetComponent(typeof(Text))
	slot2 = slot0._priceTF:Find("originalprice")
	slot0._opriceTxt = slot2:GetComponent(typeof(Text))
	slot3 = slot0._tf
	slot3 = slot0._tf
	slot3 = slot0._tf
	slot3 = slot0._tf
	slot3 = slot0._tf
	slot3 = slot0._tf
	slot3 = slot0._tf
	slot3 = slot0._tf
	slot3 = slot0._tf
	slot2[MULTRES] = slot3:Find("content/top/tags/tag_timelimit")
	slot0._tagTFs = {
		slot3:Find("content/top/tags/tag_hot"),
		slot3:Find("content/top/tags/tag_new"),
		slot3:Find("content/top/tags/tag_advice"),
		slot3:Find("content/top/tags/tag_activity"),
		slot3:Find("content/top/tags/tag_discount"),
		slot3:Find("content/top/tags/tag_nothing"),
		slot3:Find("content/top/tags/tag_bought"),
		slot3:Find("content/top/tags/tag_limit"),
		slot3:Find("content/top/tags/tag_timelimit")
	}
end

function slot0.update(slot0, slot1)
	slot0.goodsVO = slot1
	slot2 = slot1:getSkinId()
	slot0.shipSkinConfig = uv0[slot2]

	LoadSpriteAsync("shipYardIcon/" .. uv0[slot2].prefab, function (slot0)
		uv0._icon.sprite = slot0
	end)

	for slot7, slot8 in pairs(slot0._tagTFs) do
		setActive(slot8, false)
	end

	if slot0.goodsVO.type == Goods.TYPE_SKIN then
		slot0._priceIcon.sprite = LoadSprite("props/" .. id2res(slot1:getConfig("resource_type")))

		if slot1:isDisCount() then
			slot0._priceTxt.text = slot1:getConfig("resource_num") * (100 - slot1:getConfig("discount")) / 100
		else
			slot0._priceTxt.text = slot6
		end

		slot0._opriceTxt.text = slot6

		setActive(go(slot0._opriceTxt), slot8 and slot7 < 1)

		slot9 = slot1.buyCount == 0

		if slot1:getConfig("genre") == ShopArgs.SkinShopTimeLimit then
			setActive(slot0._tagTFs[9], true)
		elseif slot9 then
			if slot8 or slot0.goodsVO:getConfig("tag") == 5 then
				setText(slot0._tagTFs[5]:Find("Text"), slot1:getConfig("discount") .. "%")
				setActive(slot0._tagTFs[5], true)
			elseif slot0._tagTFs[slot11] then
				setActive(slot0._tagTFs[slot11], true)
			else
				setActive(slot0._tagTFs[6], true)
			end
		else
			setActive(slot0._tagTFs[7], true)
		end
	end
end

function slot0.updateSelected(slot0, slot1)
	slot0._content.localPosition = Vector3(0, slot1 and -26 or -126, 0)

	setActive(slot0._priceTF, slot1 and slot0.goodsVO.type == Goods.TYPE_SKIN)
	setActive(slot0._mask, not slot1)
end

function slot0.Dispose(slot0)
end

return slot0
