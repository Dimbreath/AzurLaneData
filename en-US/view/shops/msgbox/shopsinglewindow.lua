slot0 = class("ShopSingleWindow", import("...base.BaseSubView"))

function slot0.getUIName(slot0)
	return "ShopsUISinglebox"
end

function slot0.OnLoaded(slot0)
	slot0.nameTF = slot0:findTF("window/item/display_panel/name_container/name"):GetComponent(typeof(Text))
	slot0.descTF = slot0:findTF("window/item/display_panel/desc/Text"):GetComponent(typeof(Text))
	slot0.itemTF = slot0:findTF("window/item")
	slot0.itemOwnTF = slot0:findTF("icon_bg/own/Text", slot0.itemTF)
	slot0.itemOwnLabelTF = slot0:findTF("icon_bg/own/label", slot0.itemTF)
	slot0.confirmBtn = slot0:findTF("window/actions/confirm_btn")

	setText(slot0:findTF("window/actions/cancel_btn/pic"), i18n("shop_word_cancel"))
	setText(slot0:findTF("window/actions/confirm_btn/pic"), i18n("shop_word_exchange"))
end

function slot0.OnInit(slot0)
	onButton(slot0, slot0:findTF("window/actions/cancel_btn"), function ()
		slot0:Close()
	end, SFX_CANCEL)
	onButton(slot0, slot0._tf, function ()
		slot0:Close()
	end, SFX_CANCEL)
	onButton(slot0, slot0:findTF("window/top/btnBack"), function ()
		slot0:Close()
	end, SFX_CANCEL)
end

function slot0.Open(slot0, slot1, slot2)
	slot0.opening = true

	slot0:Show()
	pg.UIMgr.GetInstance():BlurPanel(slot0._tf)
	slot0:InitWindow(slot1, slot2)
end

function slot0.InitWindow(slot0, slot1, slot2)
	onButton(slot0, slot0.confirmBtn, function ()
		if slot0 then
			slot0(slot1, 1, slot2.cfg.name)
		end

		slot3:Close()
	end, SFX_CANCEL)
	updateDrop(slot0.itemTF, slot3)

	slot8, slot8 = GetOwnedpropCount(slot3)

	setActive(slot0.itemOwnTF.parent, slot5)
	setText(slot0.itemOwnTF, slot4)
	setText(slot0.itemOwnLabelTF, i18n("word_own1"))

	slot0.descTF.text = ({
		id = slot1:getConfig("commodity_id"),
		type = slot1:getConfig("commodity_type"),
		count = slot1:getConfig("num")
	})["desc"]
	slot0.nameTF.text = ()["cfg"].name
end

function slot0.Close(slot0)
	if slot0.opening then
		slot0.opening = false

		pg.UIMgr.GetInstance():UnblurPanel(slot0._tf, slot0._parentTf)
		slot0:Hide()
	end
end

function slot0.OnDestroy(slot0)
	if slot0.opening then
		slot0:Close()
	end
end

return slot0
