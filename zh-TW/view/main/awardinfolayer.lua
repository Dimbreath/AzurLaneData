slot0 = class("AwardInfoLayer", import("..base.BaseUI"))
slot0.TITLE = {
	SHIP = "ship",
	ESCORT = "escort",
	ITEM = "item"
}
slot1 = 4
slot2 = 4
slot3 = 0.15

function slot0.getUIName(slot0)
	return "AwardInfoUI"
end

function slot0.setAwards(slot0, slot1)
end

function slot0.init(slot0)
	pg.UIMgr.GetInstance():BlurPanel(slot0._tf, false, {
		weight = LayerWeightConst.THIRD_LAYER
	})

	slot0.awards = _.select(slot0.contextData.awards.items or {}, function (slot0)
		return not (slot0.type == DROP_TYPE_ICON_FRAME or slot0.type == DROP_TYPE_CHAT_FRAME)
	end)
	slot0.onYes = slot0.contextData.awards.onYes
	slot0.title = slot0.contextData.title or uv0.TITLE.ITEM
	slot0._itemsWindow = slot0._tf:Find("items")
	slot0.spriteMask = slot0._itemsWindow:Find("SpriteMask")

	if slot0.title == uv0.TITLE.SHIP then
		slot0.container = ({
			items = slot0._itemsWindow:Find("items"),
			items_scroll = slot0._itemsWindow:Find("items_scroll/viewport/content"),
			ships = slot0._itemsWindow:Find("ships")
		}).ships
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

	setActive(slot0.titleItem, slot0.title == uv0.TITLE.ITEM)
	setActive(slot0.titleShip, slot0.title == uv0.TITLE.SHIP)
	setActive(slot0.titleEscort, slot0.title == uv0.TITLE.ESCORT)

	if slot0.title == uv0.TITLE.SHIP then
		setLocalScale(slot0._tf:Find("decorations"), Vector3.New(1.25, 1.25, 1))
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
		if uv0 then
			uv0()
		end

		if uv1.exited then
			return
		end

		setLocalScale(uv1.spriteMask, Vector3(uv1.spriteMask.rect.width / uv2 * PIXEL_PER_UNIT, uv1.spriteMask.rect.height / uv3 * PIXEL_PER_UNIT, 1))
	end))
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0._tf, function ()
		if not uv0.inited then
			return
		end

		if uv0.inAniming then
			for slot3, slot4 in ipairs(uv0.tweenItems) do
				LeanTween.cancel(slot4)
			end

			for slot3 = 1, #uv0.awards do
				setActive(uv0.container:GetChild(slot3 - 1), true)
			end

			uv0.inAniming = false
		end

		slot0 = uv0.contextData.onClose

		if uv0.onYes then
			uv0.onYes()
		end

		uv0:emit(uv1.ON_CLOSE)

		if slot0 then
			slot0()
		end
	end, SFX_CANCEL, {
		noShip = not slot0.hasShip
	})
	onButton(slot0, slot0.continueBtn, function ()
		triggerButton(uv0._tf)
	end)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_GETITEM)
end

function slot0.onUIAnimEnd(slot0, slot1)
	if slot0.contextData.animation then
		slot0.inAniming = true
		slot0.containerCG.alpha = 0

		setActive(slot0.container, false)
		slot0:doAnim(function ()
			setActive(uv0.container, true)
			uv0:displayAwards()
			uv0:playAnim(uv1)
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

	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)
	triggerButton(slot0._tf)
end

function slot4(slot0, slot1)
	slot2 = pg.ship_data_statistics[slot1.id]
	slot3 = Ship.New({
		configId = slot1.id
	})
	slot3.virgin = slot1.virgin

	setScrollText(findTF(slot0, "content/info/name_mask/name"), slot3:getName())
	flushShipCard(slot0, slot3)
	setActive(findTF(slot0, "content/front/new"), slot1.virgin)
end

function slot0.displayAwards(slot0)
	slot0.inited = false

	for slot4 = #slot0.awards, slot0.container.childCount - 1 do
		Destroy(slot0.container:GetChild(slot4))
	end

	for slot4 = slot0.container.childCount, #slot0.awards - 1 do
		if slot0.title ~= uv0.TITLE.SHIP then
			cloneTplTo(slot0.itemTpl, slot0.container)
		else
			cloneTplTo(slot0.shipCardTpl, cloneTplTo(slot0.shipTpl, slot0.container), "ship_tpl")
		end
	end

	if slot0.title ~= uv0.TITLE.SHIP then
		for slot4 = 1, #slot0.awards do
			slot5 = slot0.container:GetChild(slot4 - 1):Find("bg")

			if slot0.awards[slot4].type == DROP_TYPE_SHIP then
				slot0.hasShip = true
			end

			updateDrop(slot5, slot6, {
				fromAwardLayer = true
			})
			setActive(findTF(slot5, "bonus"), slot6.riraty)
			setActive(findTF(slot5, "name"), false)
			setActive(findTF(slot5, "name_mask"), true)
			setScrollText(findTF(slot5, "name_mask/name"), slot6.name or getText(slot7))
			onButton(slot0, slot5, function ()
				if uv0.inAniming then
					return
				end

				uv0:emit(AwardInfoMediator.ON_DROP, uv1)
			end, SFX_PANEL)
		end
	else
		for slot4 = 1, #slot0.awards do
			uv1(slot0.container:GetChild(slot4 - 1):Find("ship_tpl"), slot0.awards[slot4])

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

	for slot6 = 1, #slot0.awards do
		setActive(slot0.container:GetChild(slot6 - 1), false)
		table.insert(slot2, function (slot0)
			if not uv0.tweenItems then
				function ()
					uv0()
					setLocalScale(uv1.spriteMask, Vector3(uv1.spriteMask.rect.width / uv2 * PIXEL_PER_UNIT, uv1.spriteMask.rect.height / uv3 * PIXEL_PER_UNIT, 1))
				end()

				return
			end

			setActive(uv3, true)

			if uv0.title ~= uv4.TITLE.SHIP and #uv0.awards > 10 then
				scrollTo(uv0._itemsWindow:Find("items_scroll"), 0, 0)
			end

			table.insert(uv0.tweenItems, LeanTween.delayedCall(uv5, System.Action(slot1)).id)
		end)
	end

	slot0.containerCG.alpha = 1

	seriesAsync(slot2, function ()
		uv0.inAniming = false

		if uv1 then
			uv1()
		end
	end)
end

function slot0.willExit(slot0)
	if slot0.title ~= uv0.TITLE.SHIP then
		for slot4 = 0, slot0.container.childCount - 1 do
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
