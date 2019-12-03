slot0 = class("ShipCustomMsgBox", import("...base.BaseSubView"))

slot0.getUIName = function (slot0)
	return "ShipCustomMsgBox"
end

slot0.OnInit = function (slot0)
	slot0.customMsgbox = slot0._tf
	slot0.msgBoxItemPanel = slot0.customMsgbox:Find("frame/bg/item_panel")
	slot0.msgboxItemContains = slot0.customMsgbox:Find("frame/bg/item_panel/items")
	slot0.msgBoxItemTpl = slot0.msgboxItemContains:Find("equipmenttpl")
	slot0.msgBoxItemContent = slot0.customMsgbox:Find("frame/bg/item_panel/content")
	slot0.msgBoxItemContent1 = slot0.customMsgbox:Find("frame/bg/item_panel/content_num")
	slot0.msgBoxCancelBtn = slot0.customMsgbox:Find("frame/btns/cancel_btn")
	slot0.msgBoxConfirmBtn = slot0.customMsgbox:Find("frame/btns/confirm_btn")
	slot0.msgBoxContent = slot0.customMsgbox:Find("frame/bg/content")
	slot0.msgBtnBack = slot0.customMsgbox:Find("frame/top/btnBack")

	SetActive(slot0.customMsgbox, false)

	slot0.settings = {}

	onButton(slot0, slot0.msgBoxConfirmBtn, function ()
		if slot0.settings.onYes then
			slot0.settings.onYes()
		else
			slot0:hideCustomMsgBox()
		end
	end, SFX_PANEL)
	SetActive(slot0.msgBoxCancelBtn, not defaultValue(slot0.settings.hideNO, false))
	onButton(slot0, slot0.msgBoxCancelBtn, function ()
		if slot0.settings.onCancel then
			slot0.settings.onCancel()
		else
			slot0:hideCustomMsgBox()
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.customMsgbox, function ()
		slot0:hideCustomMsgBox()
	end, SFX_PANEL)
	onButton(slot0, slot0.msgBtnBack, function ()
		slot0:hideCustomMsgBox()
	end, SFX_CANCEL)
end

slot0.SetShareData = function (slot0, slot1)
	slot0.shareData = slot1
end

slot0.showCustomMsgBox = function (slot0, slot1)
	slot0.isShowCustomMsgBox = true
	slot0.settings = slot1

	setActive(slot0.customMsgbox, true)
	pg.UIMgr.GetInstance():OverlayPanel(slot0.customMsgbox, {
		groupName = LayerWeightConst.GROUP_SHIPINFOUI
	})
	setActive(slot0.msgBoxItemPanel, slot1.items and #slot1.items > 0)
	setActive(slot0.msgBoxContent, not (slot1.items and #slot1.items > 0))

	if slot1.items and #slot1.items > 0 then
		for slot8 = slot0.msgboxItemContains.childCount + 1, #slot1.items, 1 do
			cloneTplTo(slot0.msgBoxItemTpl, slot0.msgboxItemContains)
		end

		for slot8 = 1, slot0.msgboxItemContains.childCount, 1 do
			SetActive(slot0.msgboxItemContains:GetChild(slot8 - 1), slot8 <= #slot3)

			if slot8 <= #slot3 then
				updateDrop(slot9, slot10)

				slot11 = 0

				if slot3[slot8].type == DROP_TYPE_RESOURCE then
					slot11 = slot0.shareData.player:getResById(slot10.id)
				elseif slot10.type == DROP_TYPE_ITEM then
					slot11 = getProxy(BagProxy):getItemCountById(slot10.id)
				end

				setText(slot9:Find("icon_bg/count"), slot11 .. "/" .. ((slot11 < slot10.count and "<color=#ff5c5c>" .. slot10.count .. "</color>") or "<color=#92fc63FF>" .. slot10.count .. "</color>"))
			end
		end

		setText(slot0.msgBoxItemContent, slot1.content or "")
		setText(slot0.msgBoxItemContent1, slot1.content1 or "")
	else
		setText(slot0.msgBoxContent, slot1.content or "")
	end
end

slot0.hideCustomMsgBox = function (slot0)
	slot0.isShowCustomMsgBox = nil

	SetActive(slot0.customMsgbox, false)
end

slot0.OnDestroy = function (slot0)
	pg.UIMgr.GetInstance():UnOverlayPanel(slot0.customMsgbox, slot0._tf)

	slot0.shareData = nil
end

return slot0
