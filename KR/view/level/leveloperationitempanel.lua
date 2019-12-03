slot0 = class("LevelOperationItemPanel", import("..base.BasePanel"))

slot0.init = function (slot0)
	slot0.super.init(slot0)

	slot0.operationButton = slot0:findTF("panel/operation_button")
	slot0.toggleMask = slot0:findTF("operation_mask")
	slot0.toggleList = slot0:findTF("operation_mask/list")
	slot0.toggles = {}
	slot0.buttonIcon = slot0:findTF("panel/operation_button/item/icon")
	slot0.buttonCount = slot0:findTF("panel/operation_button/item/count")
	slot0.buttonDesc = slot0:findTF("panel/operation_button/item/desc")
	slot0.cancelBtn = slot0:findTF("operation_mask/cancel_button")

	setText(slot0.buttonCount, "")

	for slot4 = 0, slot0.toggleList.childCount - 1, 1 do
		setActive(slot5, false)
		table.insert(slot0.toggles, slot0.toggleList:Find("item" .. slot4 + 1))
	end

	setActive(slot0.toggleMask, false)
end

slot0.setData = function (slot0, slot1, slot2)
	slot0.itemList = slot1
	slot0.chapter = slot2
end

slot0.configCallback = function (slot0, slot1)
	slot0._callback = slot1

	onButton(slot0, slot0.operationButton, function ()
		slot0:showToggleMask()
	end, SFX_PANEL)
	onButton(slot0, slot0.toggleMask, function ()
		slot0:hideToggleMask()
	end)
	slot0:setButtonView(PlayerPrefs.GetInt("extraOperationItemID", 0))
end

slot0.showToggleMask = function (slot0)
	setActive(slot0.toggleMask, true)

	slot1 = slot0.chapter:getOperationList()

	onButton(slot0, slot0.cancelBtn, function ()
		slot0._callback(0)
		slot0._callback:hideToggleMask()
		slot0._callback.hideToggleMask:setButtonView(0)
	end)

	slot2 = 0

	for slot6, slot7 in pairs(slot0.itemList) do
		setActive(slot8, true)

		slot9 = slot0.toggles[slot2 + 1].Find(slot8, "lock")

		if table.contains(slot1, slot6) then
			setActive(slot9, false)
			setButtonEnabled(slot8, true)
			onButton(slot0, slot8, function ()
				slot0._callback(slot1)
				slot0._callback:hideToggleMask()
				slot0._callback.hideToggleMask:setButtonView(slot0._callback.hideToggleMask)
			end, SFX_PANEL)
		else
			setActive(slot9, true)
			setButtonEnabled(slot8, false)
		end

		setImageSprite(slot8:Find("item/icon"), GetSpriteFromAtlas(itemId2icon(slot6), ""), true)

		if slot7 == true then
			setText(slot8:Find("item/count"), "x0")
			setButtonEnabled(slot8, false)
		else
			setText(slot8:Find("item/count"), "x" .. slot7.count)
		end

		setText(slot8:Find("item/desc"), pg.item_data_statistics[slot6].display)
	end
end

slot0.setButtonView = function (slot0, slot1)
	if slot1 == 0 then
		setText(slot0.buttonDesc, "使用特别作战")
	else
		setText(slot0.buttonDesc, pg.item_data_statistics[slot1].display)
	end
end

slot0.hideToggleMask = function (slot0)
	setActive(slot0.toggleMask, false)
end

return slot0
