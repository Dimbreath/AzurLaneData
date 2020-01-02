slot0 = class("IndexLayer", import("..base.BaseUI"))

function slot0.getUIName(slot0)
	return "IndexUI"
end

function slot0.init(slot0)
	slot0.panel = slot0:findTF("index_panel")
	slot0.displayTFs = {
		slot0:findTF("layout/sort", slot0.panel),
		slot0:findTF("layout/index", slot0.panel),
		slot0:findTF("layout/camp", slot0.panel),
		slot0:findTF("layout/rarity", slot0.panel)
	}

	_.each(slot0.displayTFs, function (slot0)
		setActive(slot0, false)
	end)

	slot0.displayList = {}
	slot0.typeList = {}
	slot0.btnConfirm = slot0:findTF("layout/btns/ok", slot0.panel)
	slot0.btnCancel = slot0:findTF("layout/btns/cancel", slot0.panel)
	slot0.greySprite = slot0:findTF("resource/grey", slot0.panel):GetComponent(typeof(Image)).sprite
	slot0.blueSprite = slot0:findTF("resource/blue", slot0.panel):GetComponent(typeof(Image)).sprite
	slot0.yellowSprite = slot0:findTF("resource/yellow", slot0.panel):GetComponent(typeof(Image)).sprite
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.btnConfirm, function ()
		if slot0.contextData.callback then
			slot0.contextData.callback({
				sort = Clone(slot0.contextData.sort),
				index = Clone(slot0.contextData.index),
				camp = Clone(slot0.contextData.camp),
				rarity = Clone(slot0.contextData.rarity)
			})

			slot0.contextData.callback.contextData.callback = nil
		end

		slot0:emit(slot1.ON_CLOSE)
	end, SFX_CONFIRM)
	onButton(slot0, slot0.btnCancel, function ()
		slot0:emit(slot1.ON_CLOSE)
	end, SFX_CANCEL)

	slot0.panel.localScale = Vector3.zero

	LeanTween.scale(slot0.panel, Vector3(1, 1, 1), 0.2)
	slot0:initDisplays()
	pg.UIMgr.GetInstance():BlurPanel(slot0._tf)
end

function slot0.initDisplays(slot0)
	slot1 = {
		"sort",
		"index",
		"camp",
		"rarity"
	}

	for slot5, slot6 in ipairs(slot0.displayTFs) do
		setActive(slot6, tobool(slot0.contextData.display[slot1[slot5]]))

		if tobool(slot0.contextData.display[slot1[slot5]]) then
			if slot5 == IndexConst.DisplaySort then
				slot0:initSort()
				slot0:updateSort()
			elseif slot5 == IndexConst.DisplayIndex then
				slot0:initIndex()
				slot0:updateIndex()
			elseif slot5 == IndexConst.DisplayCamp then
				slot0:initCamp()
				slot0:updateCamp()
			elseif slot5 == IndexConst.DisplayRarity then
				slot0:initRarity()
				slot0:updateRarity()
			end
		end
	end
end

function slot0.initSort(slot0)
	_.each(IndexConst.SortTypes, function (slot0)
		if bit.band(slot0.contextData.display.sort, bit.lshift(1, slot0)) > 0 then
			table.insert(slot1, slot0)
		end
	end)

	slot0.typeList[IndexConst.DisplaySort] = {}
	slot3 = UIItemList.New(slot0:findTF("panel", slot2), slot0:findTF("panel/tpl", slot0.displayTFs[IndexConst.DisplaySort]))

	slot3:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			setText(slot6, slot5)
			setImageSprite(slot2, slot1.greySprite)
			GetOrAddComponent(slot2, typeof(Button))
			onButton(slot1, slot2, function ()
				slot0.contextData.sort = slot1

				slot0.contextData:updateSort()
			end, SFX_UI_TAG)
		end
	end)
	slot3:align(#)

	slot0.displayList[IndexConst.DisplaySort] = slot3
end

function slot0.updateSort(slot0)
	slot2 = slot0.typeList[IndexConst.DisplaySort]

	slot0.displayList[IndexConst.DisplaySort]:each(function (slot0, slot1)
		slot3 = findTF(slot1, "Image")

		setImageSprite(slot1, (slot0.contextData.sort == slot1[slot0 + 1] and slot0.yellowSprite) or slot0.greySprite)
	end)
end

function slot0.initIndex(slot0)
	_.each(IndexConst.IndexTypes, function (slot0)
		if bit.band(slot0.contextData.display.index, bit.lshift(1, slot0)) > 0 then
			table.insert(slot1, slot0)
		end
	end)

	slot0.typeList[IndexConst.DisplayIndex] = {}
	slot3 = UIItemList.New(slot0:findTF("panel", slot2), slot0:findTF("panel/tpl", slot0.displayTFs[IndexConst.DisplayIndex]))

	slot3:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			setText(slot6, i18n(slot5))
			setImageSprite(slot2, slot1.greySprite)
			GetOrAddComponent(slot2, typeof(Button))
			onButton(slot1, slot2, function ()
				slot0.contextData.index = IndexConst.ToggleBits(slot0.contextData.index, IndexConst.ToggleBits, IndexConst.IndexAll, )

				slot0.contextData:updateIndex()
			end, SFX_UI_TAG)
		end
	end)
	slot3:align(#)

	slot0.displayList[IndexConst.DisplayIndex] = slot3
end

function slot0.updateIndex(slot0)
	slot2 = slot0.typeList[IndexConst.DisplayIndex]

	slot0.displayList[IndexConst.DisplayIndex]:each(function (slot0, slot1)
		slot4 = findTF(slot1, "Image")

		setImageSprite(slot1, (bit.band(slot1.contextData.index, bit.lshift(1, slot0[slot0 + 1])) > 0 and slot1.yellowSprite) or slot1.greySprite)
	end)
end

function slot0.initCamp(slot0)
	_.each(IndexConst.CampTypes, function (slot0)
		if bit.band(slot0.contextData.display.camp, bit.lshift(1, slot0)) > 0 then
			table.insert(slot1, slot0)
		end
	end)

	slot0.typeList[IndexConst.DisplayCamp] = {}
	slot3 = UIItemList.New(slot0:findTF("panel", slot2), slot0:findTF("panel/tpl", slot0.displayTFs[IndexConst.DisplayCamp]))

	slot3:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			setText(slot6, i18n(slot5))
			setImageSprite(slot2, slot1.greySprite)
			GetOrAddComponent(slot2, typeof(Button))
			onButton(slot1, slot2, function ()
				slot0.contextData.camp = IndexConst.ToggleBits(slot0.contextData.camp, IndexConst.ToggleBits, IndexConst.CampAll, )

				slot0.contextData:updateCamp()
			end, SFX_UI_TAG)
		end
	end)
	slot3:align(#)

	slot0.displayList[IndexConst.DisplayCamp] = slot3
end

function slot0.updateCamp(slot0)
	slot2 = slot0.typeList[IndexConst.DisplayCamp]

	slot0.displayList[IndexConst.DisplayCamp]:each(function (slot0, slot1)
		slot4 = findTF(slot1, "Image")

		setImageSprite(slot1, (bit.band(slot1.contextData.camp, bit.lshift(1, slot0[slot0 + 1])) > 0 and slot1.blueSprite) or slot1.greySprite)
	end)
end

function slot0.initRarity(slot0)
	_.each(IndexConst.RarityTypes, function (slot0)
		if bit.band(slot0.contextData.display.rarity, bit.lshift(1, slot0)) > 0 then
			table.insert(slot1, slot0)
		end
	end)

	slot0.typeList[IndexConst.DisplayRarity] = {}
	slot3 = UIItemList.New(slot0:findTF("panel", slot2), slot0:findTF("panel/tpl", slot0.displayTFs[IndexConst.DisplayRarity]))

	slot3:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			setText(slot6, i18n(slot5))
			setImageSprite(slot2, slot1.greySprite)
			GetOrAddComponent(slot2, typeof(Button))
			onButton(slot1, slot2, function ()
				slot0.contextData.rarity = IndexConst.ToggleBits(slot0.contextData.rarity, IndexConst.ToggleBits, IndexConst.RarityAll, )

				slot0.contextData:updateRarity()
			end, SFX_UI_TAG)
		end
	end)
	slot3:align(#)

	slot0.displayList[IndexConst.DisplayRarity] = slot3
end

function slot0.updateRarity(slot0)
	slot2 = slot0.typeList[IndexConst.DisplayRarity]

	slot0.displayList[IndexConst.DisplayRarity]:each(function (slot0, slot1)
		slot4 = findTF(slot1, "Image")

		setImageSprite(slot1, (bit.band(slot1.contextData.rarity, bit.lshift(1, slot0[slot0 + 1])) > 0 and slot1.blueSprite) or slot1.greySprite)
	end)
end

function slot0.willExit(slot0)
	LeanTween.cancel(go(slot0.panel))
	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf)
end

return slot0
