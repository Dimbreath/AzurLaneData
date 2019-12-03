slot0 = class("ItemInfoLayer", import("..base.BaseUI"))
slot1 = 5
slot2 = 11

function slot0.getUIName(slot0)
	return "ItemInfoUI"
end

function slot0.init(slot0)
	pg.UIMgr.GetInstance():BlurPanel(slot0._tf, false, {
		weight = slot0:getWeightFromData()
	})

	slot0.desc = slot0:findTF("window/item/display_panel/desc")
	slot0.name = slot0:findTF("window/item/display_panel/name_container/name")
	slot0.iconType = slot0:findTF("window/item/display_panel/name_container/shiptype"):GetComponent(typeof(Image))
	slot0.count = slot0:findTF("window/item/display_panel/icon_bg/count")
	slot0.shipIcon = slot0:findTF("window/item/display_panel/icon_bg/icon/icon")
	slot0.okBtn = slot0:findTF("window/actions/ok_button")
	slot0.useBtn = slot0:findTF("window/actions/use_button")
	slot0.batchUseBtn = slot0:findTF("window/actions/batch_use_button")
	slot0.useOneBtn = slot0:findTF("window/actions/use_one_button")
	slot0.composeBtn = slot0:findTF("window/actions/compose_button")
	slot0.itemTF = slot0:findTF("window/item")
	slot0.stars = slot0.itemTF:Find("icon_bg/stars")

	SetActive(slot0.batchUseBtn, false)
	SetActive(slot0.useBtn, false)
	setActive(slot0.okBtn, true)
	setActive(slot0.composeBtn, false)
	setActive(slot0.useOneBtn, false)

	slot0.window = slot0:findTF("window")
	slot0.top = slot0:findTF("window/top")
	slot0.composePanel = slot0:findTF("compose")
	slot0.countTF = slot0:findTF("compose/item/icon_bg/count"):GetComponent(typeof(Text))
	slot0.composeConfirm = slot0:findTF("actions/compose_button", slot0.composePanel)
	slot0.composeCancel = slot0:findTF("actions/cancel_button", slot0.composePanel)

	SetActive(slot0.composePanel, false)
	SetActive(slot0.window, true)
	SetActive(slot0.top, true)

	slot0.composeBonusList = slot0:findTF("got/panel_bg/list", slot0.composePanel)
	slot0.composeBonusTpl = slot0:findTF("got/panel_bg/list/item", slot0.composePanel)
	slot0.composeValue = slot0:findTF("count/number_panel/value", slot0.composePanel)
	slot0.composeLeftButton = slot0:findTF("count/number_panel/left", slot0.composePanel)
	slot0.composeRightButton = slot0:findTF("count/number_panel/right", slot0.composePanel)
	slot0.composeMaxButton = slot0:findTF("count/max", slot0.composePanel)
end

function slot0.setItemInfo(slot0, slot1, slot2)
	slot3 = slot2:Find("icon_bg/stars")
	slot4 = slot2:Find("display_panel/scroll/desc") or slot2:Find("display_panel/desc")
	slot5 = slot2:Find("display_panel/name_container/name")
	slot6 = slot2:Find("display_panel/name_container/shiptype"):GetComponent(typeof(Image))
	slot7 = slot2:Find("icon_bg/count")
	slot8 = slot2:Find("icon_bg/icon/icon")

	if slot2:Find("detail") then
		if slot1:getConfig("type") == 11 then
			onButton(slot0, slot9, function ()
				slot0:emit(BaseUI.ON_DROP_LIST, {
					item2Row = true,
					itemList = _.map(slot1:getConfig("display_icon"), function (slot0)
						return {
							type = slot0[1],
							id = slot0[2]
						}
					end),
					content = slot1:getConfig("display")
				})
			end, SFX_PANEL)
		end

		setActive(slot9, slot10)
	end

	setText(slot4, HXSet.hxLan(slot1:getConfig("display")))
	setText(slot5, HXSet.hxLan(slot1:getConfig("name")))
	SetActive(slot6, false)

	if not IsNil(slot8) then
		SetActive(slot8, false)
	end

	setActive(slot7, slot1.count > 0)
	setText(slot7, slot1.count)
	SetActive(slot3, false)
	updateItem(slot2, slot1)
end

function slot0.updateItemCount(slot0, slot1)
	slot0.countTF.text = slot1
end

function slot0.setItem(slot0, slot1)
	slot0.itemVO = slot1

	slot0:setItemInfo(slot1, slot0.itemTF)
	setActive(slot0.okBtn, false)
	setActive(slot0.useBtn, false)
	setActive(slot0.batchUseBtn, false)
	setActive(slot0.composeBtn, false)
	setActive(slot0.useOneBtn, false)

	slot2 = true

	if slot0.contextData.mine and slot0.itemVO:getTempCfgTable() then
		if slot3.compose_number > 0 and slot3.compose_number <= slot0.itemVO.count then
			setActive(slot0.composeBtn, true)
			slot0:setItemInfo(slot1, slot0:findTF("item", slot0.composePanel))

			slot0.composeMax = slot0.itemVO.count / slot3.compose_number
			slot2 = false
		end

		if slot3.usage == ItemUsage.SOS then
			setActive(slot0.useBtn, true)
			setText(slot0.useBtn:Find("text"), 1)

			slot2 = false
		end

		if slot0.itemVO:getConfig("type") == slot0 or slot1 == slot4 then
			setActive(slot0.useBtn, true)
			setText(slot0.useBtn:Find("text"), 1)

			if slot0.itemVO.count > 1 then
				setActive(slot0.batchUseBtn, true)
				setText(slot0.batchUseBtn:Find("text"), math.min(slot0.itemVO.count, 10))
			end

			slot2 = false
		end
	end

	setActive(slot0.okBtn, slot2)

	if slot0.itemVO:isBluePrintType() and slot0.contextData.fromMediatorName == EquipmentMediator.__cname then
		setActive(slot0.okBtn, false)
		setActive(slot0.useBtn, false)
		setActive(slot0.batchUseBtn, false)
		setActive(slot0.composeBtn, false)
		setActive(slot0.useOneBtn, true)
		onButton(slot0, slot0.useOneBtn, function ()
			slot0:emit(ItemInfoMediator.ON_BLUEPRINT_SCENE)
		end, SFX_PANEL)
	end
end

function slot0.setShipId(slot0, slot1)
	slot0.shipId = slot1

	SetActive(slot0.iconType, true)

	if not IsNil(slot0.shipIcon) then
		SetActive(slot0.shipIcon, true)
	end

	updateShip(slot0.itemTF, slot3)
	setText(slot0.desc, pg.ship_data_statistics[slot1].desc or "")
	setText(slot0.name, slot2.name)
	SetActive(slot0.stars, true)
	setText(slot0.desc, Ship.getWords(slot2.skin_id, "drop_descrip") or i18n("ship_drop_desc_default"))

	slot5 = slot0.itemTF:Find("icon_bg/startpl")
	slot7 = slot3:getStar()

	for slot12 = slot0.stars.childCount, slot3:getMaxStar() - 1, 1 do
		cloneTplTo(slot5, slot0.stars)
	end

	slot9 = slot8 - slot7

	for slot13 = 0, slot0.stars.childCount - 1, 1 do
		slot0.stars:GetChild(slot13).gameObject:SetActive(slot13 < slot8)
		SetActive(slot14:Find("star_tpl"), slot9 <= slot13)
		SetActive(slot14:Find("star_empty_tpl"), slot13 < slot9)
	end

	slot0.iconType.sprite = GetSpriteFromAtlas("shiptype", shipType2print(slot3:getShipType()))

	setText(slot0.count, "")
end

function slot0.doClose(slot0)
	if slot0.playing then
		return
	end

	slot0:emit(slot0.ON_CLOSE)
end

function slot0.didEnter(slot0)
	if slot0:findTF("OpenBox(Clone)") then
		SetActive(slot1, false)
	end

	onButton(slot0, slot0._tf, function ()
		if slot0.playing then
			return
		end

		slot0:emit(slot1.ON_CLOSE)
	end, SFX_CANCEL)
	onButton(slot0, slot0._tf:Find("window/top/btnBack"), function ()
		if slot0.playing then
			return
		end

		slot0:emit(slot1.ON_CLOSE)
	end, SFX_CANCEL)
	onButton(slot0, slot0.okBtn, function ()
		if slot0.playing then
			return
		end

		slot0:emit(slot1.ON_CLOSE)
	end, SFX_CONFIRM)
	onButton(slot0, slot0.useBtn, function ()
		slot0:emit(ItemInfoMediator.USE_ITEM, slot0.itemVO.id, 1)
	end, SFX_CONFIRM)
	onButton(slot0, slot0.batchUseBtn, function ()
		slot0:emit(ItemInfoMediator.USE_ITEM, slot0.itemVO.id, math.min(slot0.itemVO.count, 10))
	end, SFX_CONFIRM)
	onButton(slot0, slot0.composeBtn, function ()
		SetActive(slot0.composePanel, true)
		SetActive(slot0.window, false)
		SetActive(slot0.top, false)
		SetActive:setComposeCount(1)
	end, SFX_CONFIRM)
	onButton(slot0, slot0.composeLeftButton, function ()
		slot0:setComposeCount(slot0.composeCount - 1)
	end)
	onButton(slot0, slot0.composeRightButton, function ()
		slot0:setComposeCount(slot0.composeCount + 1)
	end)
	onButton(slot0, slot0.composeMaxButton, function ()
		slot0:setComposeCount(slot0.composeMax)
	end, SFX_PANEL)
	onButton(slot0, slot0.composeCancel, function ()
		SetActive(slot0.composePanel, false)
		SetActive(slot0.window, true)
		SetActive(slot0.top, true)
	end, SFX_CANCEL)
	onButton(slot0, slot0.composeConfirm, function ()
		slot0:emit(ItemInfoMediator.COMPOSE_ITEM, slot0.itemVO.id, slot0.composeCount)

		slot0 = slot0.emit.itemVO:getTempCfgTable()

		if slot0.itemVO.count - slot0.composeCount * slot0.compose_number < slot0.compose_number then
			triggerButton(slot0.composeCancel)
		else
			slot0:setComposeCount(1)
		end
	end, SFX_CONFIRM)
end

function slot0.setComposeCount(slot0, slot1)
	if not slot0.itemVO:getTempCfgTable().target_id or slot2.target_id <= 0 then
		return
	end

	if slot0.composeCount ~= math.clamp(slot1, 1, math.floor(slot0.itemVO.count / slot2.compose_number)) then
		slot0.composeCount = slot1

		slot0:updateComposeCount()
	end

	slot0:updateItemCount(slot0.itemVO.count - slot0.composeCount * slot2.compose_number)
end

function slot0.updateComposeCount(slot0)
	setText(slot0.composeValue, slot1)
	table.insert(slot3, {
		type = DROP_TYPE_ITEM,
		id = slot0.itemVO:getTempCfgTable().target_id,
		count = slot0.composeCount
	})

	for slot7 = #{}, slot0.composeBonusList.childCount - 1, 1 do
		Destroy(slot0.composeBonusList:GetChild(slot7))
	end

	for slot7 = slot0.composeBonusList.childCount, #slot3 - 1, 1 do
		cloneTplTo(slot0.composeBonusTpl, slot0.composeBonusList)
	end

	for slot7 = 1, #slot3, 1 do
		slot8 = slot0.composeBonusList:GetChild(slot7 - 1)

		updateDrop(slot8, slot9)
		setText(slot8:Find("name"), slot3[slot7].cfg.name)
		onButton(slot0, slot8, function ()
			if slot0.type == DROP_TYPE_RESOURCE or slot0.type == DROP_TYPE_ITEM then
				slot1:emit(AwardInfoMediator.ON_ITEM, slot0.cfg.id)
			elseif slot0.type == DROP_TYPE_EQUIP then
				slot1:emit(slot2.ON_EQUIPMENT, {
					equipmentId = slot0.cfg.id,
					type = EquipmentInfoMediator.TYPE_DISPLAY
				})
			end
		end, SFX_PANEL)
	end
end

function slot0.willExit(slot0)
	if slot0.leftEventTrigger then
		ClearEventTrigger(slot0.leftEventTrigger)
	end

	if slot0.rightEventTrigger then
		ClearEventTrigger(slot0.rightEventTrigger)
	end

	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf)
end

function slot0.PlayOpenBox(slot0, slot1, slot2)
	if not slot1 or slot1 == "" then
		slot2()

		return
	end

	function slot3()
		if slot0.playing or not slot0[slot1] then
			return
		end

		slot0.playing = true

		slot0[true]:SetActive(true)
		SetActive(slot0.window, false)
		SetActive(slot0.top, false)

		slot0 = tf(slot0[])

		slot0:SetParent(slot0._tf, false)
		slot0:SetAsLastSibling()

		slot1 = slot0:GetComponent("DftAniEvent")

		slot1:SetTriggerEvent(function (slot0)
			slot0()
		end)
		slot1:SetEndEvent(function (slot0)
			if slot0[] then
				SetActive(slot0[slot1], false)

				slot0.playing = false
			end

			slot0:emit(slot2.ON_CLOSE)
		end)
		playSoundEffect(SFX_UI_EQUIPMENT_OPEN)
	end

	if slot0:findTF(slot1 .. "(Clone)") then
		slot0[slot1] = go(slot4)
	end

	if not slot0[slot1] then
		PoolMgr.GetInstance():GetPrefab("ui/" .. string.lower(slot1), "", true, function (slot0)
			slot0:SetActive(true)

			slot0[] = slot0

			slot0()
		end)
	else
		slot3()
	end
end

return slot0
