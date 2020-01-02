slot0 = class("AwardInfoLayer", import("..base.BaseUI"))
slot0.TITLE = {
	SHIP = "ship",
	ESCORT = "escort",
	ITEM = "item"
}
slot1 = 4
slot2 = 4
slot3 = 100
slot4 = 0.15

function slot0.getUIName(slot0)
	return "AwardInfoUI"
end

function slot0.setAwards(slot0, slot1)
	return
end

function slot0.init(slot0)
	pg.UIMgr.GetInstance():BlurPanel(slot0._tf, false, {
		weight = LayerWeightConst.THIRD_LAYER
	})

	slot0.awards = _.select(slot0.contextData.awards.items or {}, function (slot0)
		return not (slot0.type == DROP_TYPE_ICON_FRAME or slot0.type == DROP_TYPE_CHAT_FRAME)
	end)
	slot0.onYes = slot0.contextData.awards.onYes
	slot0.title = slot0.contextData.title or slot0.TITLE.ITEM
	slot0._itemsWindow = slot0._tf:Find("items")
	slot0.spriteMask = slot0._itemsWindow:Find("SpriteMask")
	slot1 = {
		items = slot0._itemsWindow:Find("items"),
		items_scroll = slot0._itemsWindow:Find("items_scroll/viewport/content"),
		ships = slot0._itemsWindow:Find("ships")
	}

	if slot0.title == slot0.TITLE.SHIP then
		slot0.container = slot1.ships
	elseif #slot0.awards <= 10 then
		slot0.container = slot1.items
	else
		slot0.container = slot1.items_scroll
	end

	for slot5, slot6 in pairs(slot1) do
		setActive(slot0._itemsWindow:Find(slot5), slot0.container == slot6)
	end

	slot0.containerCG = GetOrAddComponent(slot0.container, "CanvasGroup")
	slot0.containerCG.alpha = 1

	setLocalScale(slot0._itemsWindow, Vector3(0.5, 0.5, 0.5))

	slot0.titleItem = slot0._itemsWindow:Find("titles/title_item")
	slot0.titleShip = slot0._itemsWindow:Find("titles/title_ship")
	slot0.titleEscort = slot0._itemsWindow:Find("titles/title_escort")
	slot0.itemTpl = slot0._itemsWindow:Find("item_tpl")
	slot0.shipTpl = slot0._itemsWindow:Find("ship_tpl")
	slot0.continueBtn = slot0:findTF("items/close")

	setActive(slot0.titleItem, slot0.title == slot0.TITLE.ITEM)
	setActive(slot0.titleShip, slot0.title == slot0.TITLE.SHIP)
	setActive(slot0.titleEscort, slot0.title == slot0.TITLE.ESCORT)

	slot2 = slot0._tf:Find("decorations")

	if slot0.title == slot0.TITLE.SHIP then
		setLocalScale(slot2, Vector3.New(1.25, 1.25, 1))
	else
		setLocalScale(slot2, Vector3.one)
	end

	slot0.blinks = {}
	slot0.tweenItems = {}
	slot0.shipCardTpl = slot0._tf:GetComponent("ItemList").prefabItem[0]

	slot0._tf:SetAsLastSibling()
end

function slot0.doAnim(slot0, slot1)
	LeanTween.scale(rtf(slot0._itemsWindow), Vector3(1, 1, 1), 0.15):setEase(LeanTweenType.linear):setOnComplete(System.Action(function ()
		if slot0 then
			slot0()
		end

		if slot1.exited then
			return
		end

		setLocalScale(slot1.spriteMask, Vector3(slot1.spriteMask.rect.width / slot2 * , slot1.spriteMask.rect.height /  * slot3, 1))
	end))
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0._tf, function ()
		if not slot0.inited then
			return
		end

		if slot0.inAniming then
			for slot3, slot4 in ipairs(slot0.tweenItems) do
				LeanTween.cancel(slot4)
			end

			for slot3 = 1, #slot0.awards, 1 do
				setActive(slot0.container:GetChild(slot3 - 1), true)
			end

			slot0.inAniming = false
		end

		if slot0.onYes then
			slot0.onYes()
		end

		slot0:emit(slot1.ON_CLOSE)

		if slot0 then
			slot0()
		end
	end, SFX_CANCEL, {
		noShip = not slot0.hasShip
	})
	onButton(slot0, slot0.continueBtn, function ()
		triggerButton(slot0._tf)
	end)
	playSoundEffect(SFX_UI_GETITEM)
end

function slot0.onUIAnimEnd(slot0, slot1)
	if slot0.contextData.animation then
		slot0.inAniming = true
		slot0.containerCG.alpha = 0

		setActive(slot0.container, false)
		slot0:doAnim(function ()
			setActive(slot0.container, true)
			setActive:displayAwards()
			setActive.displayAwards:playAnim(setActive.displayAwards)
		end)
	else
		slot0:displayAwards()
		slot0:doAnim(slot1)
	end
end

function slot0.onBackPressed(slot0)
	if LeanTween.isTweening(go(slot0._itemsWindow)) then
		return
	end

	playSoundEffect(SFX_CANCEL)
	triggerButton(slot0._tf)
end

function slot5(slot0, slot1)
	slot2 = pg.ship_data_statistics[slot1.id]
	slot3 = Ship.New({
		configId = slot1.id
	})
	slot3.virgin = slot1.virgin

	ScrollTxt.New(findTF(slot0, "content/info/name_mask"), findTF(slot0, "content/info/name_mask/name")).setText(slot4, slot3:getName())
	flushShipCard(slot0, slot3)
	setActive(findTF(slot0, "content/front/new"), slot1.virgin)
end

function slot0.displayAwards(slot0)
	slot0.inited = false

	for slot4 = #slot0.awards, slot0.container.childCount - 1, 1 do
		Destroy(slot0.container:GetChild(slot4))
	end

	for slot4 = slot0.container.childCount, #slot0.awards - 1, 1 do
		if slot0.title ~= slot0.TITLE.SHIP then
			cloneTplTo(slot0.itemTpl, slot0.container)
		else
			cloneTplTo(slot0.shipCardTpl, cloneTplTo(slot0.shipTpl, slot0.container), "ship_tpl")
		end
	end

	if slot0.title ~= slot0.TITLE.SHIP then
		for slot4 = 1, #slot0.awards, 1 do
			slot5 = slot0.container:GetChild(slot4 - 1):Find("bg")

			if slot0.awards[slot4].type == DROP_TYPE_SHIP then
				slot0.hasShip = true
			end

			updateDrop(slot5, slot6, {
				fromAwardLayer = true
			})
			setActive(findTF(slot5, "bonus"), slot6.riraty)
			setActive(slot7, false)
			setActive(findTF(slot5, "name_mask"), true)
			findTF(slot5, "name_mask/name"):GetComponent("ScrollText"):SetText(slot6.name or getText(slot7))
			onButton(slot0, slot5, function ()
				if slot0.inAniming then
					return
				end

				slot0:emit(AwardInfoMediator.ON_DROP, slot0)
			end, SFX_PANEL)
		end
	else
		for slot4 = 1, #slot0.awards, 1 do
			slot1(slot5, slot0.awards[slot4])

			if #slot0.awards > 5 then
				if slot4 <= 5 then
					slot5.anchoredPosition = Vector2.New(-50, 0)
				else
					slot5.anchoredPosition = Vector2.New(50, 0)
				end
			end
		end
	end

	slot0.inited = true
end

function slot0.playAnim(slot0, slot1)
	slot2 = {}

	for slot6 = 1, #slot0.awards, 1 do
		setActive(slot7, false)
		table.insert(slot2, function (slot0)
			function slot1()
				slot0()
				setLocalScale(slot1.spriteMask, Vector3(slot1.spriteMask.rect.width / slot2 * , slot1.spriteMask.rect.height /  * slot3, 1))
			end

			if not slot0.tweenItems then
				slot1()

				return
			end

			setActive(slot4, true)

			if slot0.title ~= slot5.TITLE.SHIP and #slot0.awards > 10 then
				scrollTo(slot0._itemsWindow:Find("items_scroll"), 0, 0)
			end

			table.insert(slot0.tweenItems, LeanTween.delayedCall(slot6, System.Action(slot1)).id)
		end)
	end

	slot0.containerCG.alpha = 1

	seriesAsync(slot2, function ()
		slot0.inAniming = false

		if false then
			slot1()
		end
	end)
end

function slot0.willExit(slot0)
	if slot0.title ~= slot0.TITLE.SHIP then
		for slot4 = 0, slot0.container.childCount - 1, 1 do
			clearDrop(slot0.container:GetChild(slot4):Find("bg"))
		end
	end

	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf)

	if slot0.contextData.removeFunc then
		slot0.contextData.removeFunc()
	end

	if slot0.blinks and #slot0.blinks > 0 then
		for slot4, slot5 in pairs(slot0.blinks) do
			if not IsNil(slot5) then
				Destroy(slot5)
			end
		end
	end
end

return slot0
