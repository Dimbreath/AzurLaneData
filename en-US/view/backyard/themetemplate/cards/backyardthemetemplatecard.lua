slot0 = class("BackYardThemeTemplateCard", import("...Shop.cards.BackYardThemeCard"))

function slot0.Ctor(slot0, slot1)
	uv0.super.Ctor(slot0, slot1)
	setActive(slot0.discountTF, false)

	slot0.discountTxt.text = ""
	slot0.iconRaw = slot0.content:Find("icon_raw"):GetComponent(typeof(RawImage))

	setActive(slot0.icon.gameObject, false)
	setActive(slot0.hotTF, false)
	setActive(slot0.newTF, false)
	setActive(slot0.label, true)
	setAnchoredPosition(slot0.mask, {
		y = 33
	})
end

function slot0.Update(slot0, slot1)
	slot0.template = slot1
	slot0.themeVO = slot1

	setActive(slot0.iconRaw.gameObject, false)
	BackYardThemeTempalteUtil.GetTexture(slot1:GetTextureIconName(), function (slot0)
		if slot0 then
			setActive(uv0.iconRaw.gameObject, true)

			uv0.iconRaw.texture = slot0
		end
	end)
	setActive(slot0.mask, slot1:IsPushed() and slot1:IsSelfUsage())
end

function slot0.UpdateSelected(slot0, slot1)
	uv0.super.UpdateSelected(slot0, slot1)
	setAnchoredPosition(slot0.mask, {
		y = slot1 and slot1.id == slot0.themeVO.id and 0 or 33
	})
end

return slot0
