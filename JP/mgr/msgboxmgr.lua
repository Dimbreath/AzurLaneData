pg = pg or {}
pg.MsgboxMgr = singletonClass("MsgboxMgr")
pg.MsgboxMgr.BUTTON_BLUE = 1
pg.MsgboxMgr.BUTTON_GRAY = 2
pg.MsgboxMgr.BUTTON_RED = 3
pg.MsgboxMgr.BUTTON_MEDAL = 4
pg.MsgboxMgr.BUTTON_RETREAT = 5
pg.MsgboxMgr.BUTTON_PREPAGE = 6
pg.MsgboxMgr.BUTTON_NEXTPAGE = 7
pg.MsgboxMgr.BUTTON_BLUE_WITH_ICON = 8
pg.MsgboxMgr.TITLE_GET_ITEMS = "get_items"
pg.MsgboxMgr.TITLE_INFORMATION = "infomation"
pg.MsgboxMgr.TEXT_CANCEL = "text_cancel"
pg.MsgboxMgr.TEXT_CONFIRM = "text_confirm"
MSGBOX_TYPE_NORMAL = 1
MSGBOX_TYPE_INPUT = 2
MSGBOX_TYPE_SINGLE_ITEM = 3
MSGBOX_TYPE_EXCHANGE = 4
MSGBOX_TYPE_DROP_ITEM = 5
MSGBOX_TYPE_ITEM_BOX = 6
MSGBOX_TYPE_HELP = 7
MSGBOX_TYPE_SECONDPWD = 8
pg.MsgboxMgr.enable = false
slot2 = require("Mgr.const.MsgboxBtnNameMap")

function pg.MsgboxMgr.Init(slot0, slot1)
	print("initializing msgbox manager...")
	PoolMgr.GetInstance():GetUI("MsgBox", true, function (slot0)
		slot0._go = slot0

		slot0._go:SetActive(false)

		slot0._tf = slot0._go.transform

		slot0._go.transform:SetParent(slot0.UIMgr.GetInstance().OverlayMain.transform, false)

		slot0._window = slot0._go.transform:Find("window")

		setActive(slot0._window, true)

		slot0._btnContainer = slot0._go.transform:Find("window/button_container")
		slot0._msgPanel = slot0._go.transform:Find("window/content")
		slot0._itemPanel = slot0._go.transform:Find("window/items")
		slot0.itemsText = slot0._go.transform:Find("window/items/Text"):GetComponent(typeof(Text))
		slot0._sigleItemPanel = slot0._go.transform:Find("window/single_item_panel")
		slot0._exchangeShipPanel = slot0._go.transform:Find("window/exchange_ship_panel")
		slot0._SingleItemshipTypeTF = findTF(slot0._sigleItemPanel, "ship_type")
		slot0._SingleItemshipTypeBgTF = findTF(slot0._sigleItemPanel, "ship_type_bg")
		slot0._itemListItemTpl = slot0._go.transform:Find("window/items/scrollview/item")
		slot0._itemListItemContainer = slot0._go.transform:Find("window/items/scrollview/list")
		slot0._top = slot0._tf:Find("window/top")
		slot0._titleList = slot0._top:Find("bg")
		slot0._closeBtn = slot0._top:Find("btnBack")
		slot0.contentText = slot0._go.transform:Find("window/content"):GetComponent("RichText")
		slot0._res = slot0._go.transform:Find("res")

		slot0.contentText:AddSprite("diamond", slot0._res:Find("diamond"):GetComponent(typeof(Image)).sprite)
		slot0.contentText:AddSprite("gold", slot0._res:Find("gold"):GetComponent(typeof(Image)).sprite)
		slot0.contentText:AddSprite("oil", slot0._res:Find("oil"):GetComponent(typeof(Image)).sprite)

		slot0.singleItemIntros = {}
		slot0.singleItemIntro = slot0._tf:Find("window/single_item_panel/name_mode/intro_view/Viewport/Content/intro")
		slot0.singleItemIntroTF = slot0.singleItemIntro:GetComponent("RichText")

		slot0.singleItemIntroTF:AddSprite("diamond", slot0._res:Find("diamond"):GetComponent(typeof(Image)).sprite)
		slot0.singleItemIntroTF:AddSprite("gold", slot0._res:Find("gold"):GetComponent(typeof(Image)).sprite)
		slot0.singleItemIntroTF:AddSprite("oil", slot0._res:Find("oil"):GetComponent(typeof(Image)).sprite)
		table.insert(slot0.singleItemIntros, slot0.singleItemIntro)

		slot0._inputPanel = slot0._go.transform:Find("window/input_panel")
		slot0._inputTitle = slot0._inputPanel:Find("label"):GetComponent(typeof(Text))
		slot0._inputTF = slot0._inputPanel:Find("InputField")
		slot0._inputField = slot0._inputTF:GetComponent(typeof(InputField))
		slot0._placeholderTF = slot0._inputTF:Find("Placeholder"):GetComponent(typeof(Text))
		slot0._inputConfirmBtn = slot0._inputPanel:Find("btns/confirm_btn")
		slot0._inputCancelBtn = slot0._inputPanel:Find("btns/cancel_btn")
		slot0._textPics = slot0._go.transform:Find("text")
		slot0._helpPanel = slot0._go.transform:Find("window/help_panel")
		slot0._helpBgTF = slot0._go.transform:Find("bg_help")
		slot0._helpList = slot0._helpPanel.transform:Find("list")
		slot0._helpTpl = slot0._helpPanel.transform:Find("list/help_tpl")
		slot0._sliders = slot0._go.transform:Find("window/sliders")
		slot0._defaultSize = Vector2(930, 620)
		slot0._defaultHelpSize = Vector2(870, 480)
		slot0._defaultHelpPos = Vector2(0, -40)
		slot0._discountInfo = slot0._sliders.transform:Find("discountInfo")
		slot0._discountDate = slot0._sliders.transform:Find("discountDate")
		slot0._discount = slot0._sliders.transform:Find("discountInfo/discount")
		slot0._strike = slot0._go.transform:Find("window/strike")
		slot0._scrollTxts = {}
		slot0._countSelect = slot0._sigleItemPanel:Find("count_select")
		slot0._pageUtil = PageUtil.New(slot0._countSelect:Find("value_bg/left"), slot0._countSelect:Find("value_bg/right"), slot0._countSelect:Find("max"), slot0._countSelect:Find("value_bg/value"))
		slot0._countDescTxt = slot0._countSelect:Find("desc_txt")
		slot0.stopRemindInitPos = slot0._tf:Find("window/stopRemind").anchoredPosition
		slot0.stopRemindToggle = slot0._tf:Find("window/stopRemind"):GetComponent(typeof(Toggle))
		slot0.stopRemindText = tf(slot0.stopRemindToggle.gameObject):Find("Label"):GetComponent(typeof(Text))

		onButton(nil, slot0._inputCancelBtn, function ()
			slot0:hide()
		end, SFX_CANCEL)
		onButton(nil, slot0._closeBtn, function ()
			print("点击1")
			print:hide()
		end, SFX_CANCEL)
		onButton(nil, slot0._inputConfirmBtn, function ()
			if slot0.settings.onYes then
				slot0.settings.onYes(slot0._inputField.text)
			end

			slot0:hide()
		end, SFX_CONFIRM)

		slot0.pools = {}
		slot0.timers = {}

		slot0()
	end)
end

function pg.MsgboxMgr.getMsgBoxOb(slot0)
	return slot0._go
end

function slot3(slot0, slot1)
	if slot0._go.activeSelf then
		slot0:Clear()
	end

	rtf(slot0._window).sizeDelta = slot0._defaultSize
	rtf(slot0._helpPanel).sizeDelta = slot0._defaultHelpSize

	setAnchoredPosition(slot0._window, {
		x = 0,
		y = 0
	})
	slot0:commonSetting(slot1)
	SetActive(slot0._itemPanel, false)
	SetActive(slot0._msgPanel, true)
	SetActive(slot0._sigleItemPanel, false)
	setActive(slot0._inputPanel, false)

	slot0.contentText.alignment = slot0.settings.alignment or TextAnchor.MiddleCenter
	slot0.contentText.fontSize = slot0.settings.fontSize or 36
	slot0.contentText.text = slot0.settings.content or ""

	slot0:Loaded(slot1)
end

function slot4(slot0, slot1)
	slot0.enable = true

	slot0:commonSetting(slot1)
	slot0.DelegateInfo.New(slot0)

	slot0.settings = slot1

	setActive(slot0._btnContainer, false)
	setActive(slot0.stopRemindToggle, false)
	SetActive(slot0._go, true)
	SetActive(slot0._itemPanel, false)
	SetActive(slot0._msgPanel, false)
	SetActive(slot0._sigleItemPanel, false)
	setActive(slot0._helpPanel, false)
	setActive(slot0._inputPanel, true)
	SetActive(slot0._discountDate, false)
	SetActive(slot0._strike, false)
	SetActive(slot0._discountInfo, false)
	slot0._inputPanel:SetAsLastSibling()

	slot0._inputTitle.text = slot1.title or ""
	slot0._placeholderTF.text = slot1.placeholder or ""
	slot0._inputField.characterLimit = slot1.limit or 0

	setActive(slot0._inputCancelBtn, not slot1.onNo)
	slot0:updateButton(slot0._inputCancelBtn, slot1.noText or slot1.TEXT_CANCEL)
	slot0:updateButton(slot0._inputConfirmBtn, slot1.yesText or slot1.TEXT_CONFIRM)
	slot0._tf:SetAsLastSibling()
	onButton(slot0, slot0._closeBtn, function ()
		print("点击2")
		print:hide()
	end, SFX_CANCEL)
	slot0:Loaded(slot1)
end

function slot5(slot0, slot1)
	rtf(slot0._window).sizeDelta = slot0._defaultSize

	slot0:commonSetting(slot1)
	SetActive(slot0._exchangeShipPanel, true)
	SetActive(slot0._itemPanel, false)
	SetActive(slot0._msgPanel, false)
	setActive(slot0._inputPanel, false)
	setActive(slot0._tf:Find("window/exchange_ship_panel/line_mode"), false)
	setActive(slot0._tf:Find("window/exchange_ship_panel/name_mode"), false)
	setActive(findTF(slot0._exchangeShipPanel, "icon_bg/own"), false)
	updateDrop(slot0._tf:Find("window/exchange_ship_panel"), slot1.drop)
	setActive(slot0._tf:Find("window/exchange_ship_panel/name_mode"), true)
	SetActive(slot0._tf:Find("window/exchange_ship_panel/name_mode/intro_view/Viewport/intro"), slot1.drop.type == DROP_TYPE_SHIP or slot1.drop.type == DROP_TYPE_RESOURCE or slot1.drop.type == DROP_TYPE_ITEM or slot1.drop.type == DROP_TYPE_FURNITURE or slot1.drop.type == DROP_TYPE_STRATEGY or slot1.drop.type == DROP_TYPE_SKIN)
	setActive(slot0.singleItemIntro, slot0.settings.numUpdate == nil)
	setActive(slot0._countDescTxt, SetActive ~= nil)
	setText(slot0._tf:Find("window/exchange_ship_panel/name_mode/name"), HXSet.hxLan(slot1.name or slot1.drop.cfg.name or ""))
	setText(slot0._tf:Find("window/exchange_ship_panel/name_mode/name/name"), getText(slot0._tf:Find("window/exchange_ship_panel/name_mode/name")))

	slot5, slot6, slot7 = ShipWordHelper.GetWordAndCV(slot0.ship_data_statistics[slot1.drop.id].skin_id, ShipWordHelper.WORD_TYPE_DROP, nil, PLATFORM_CODE ~= PLATFORM_US)

	setText(slot2, slot7 or i18n("ship_drop_desc_default"))

	if slot1.intro then
		setText(slot2, slot1.intro)
	end

	if slot1.enabelYesBtn ~= nil then
		setButtonEnabled(slot8, slot1.enabelYesBtn)
		eachChild(slot0._btnContainer:GetChild(1), function (slot0)
			GetOrAddComponent(slot0, typeof(CanvasGroup)).alpha = (slot0.enabelYesBtn and 1) or 0.3
		end)
	end

	if slot1.show_medal then
		slot0:createBtn({
			sibling = 0,
			hideEvent = true,
			text = slot1.show_medal.desc,
			btnType = slot1.BUTTON_MEDAL,
			sound = SFX_UI_BUILDING_EXCHANGE
		})
	end

	slot0:Loaded(slot1)
end

function slot6(slot0, slot1)
	slot0:commonSetting(slot1)
	SetActive(slot0._itemPanel, true)
	SetActive(slot0._msgPanel, false)
	SetActive(slot0._sigleItemPanel, false)
	setActive(slot0._inputPanel, false)
	removeAllChildren(slot0._itemListItemContainer)
	setActive(slot0.itemsText, slot1.content)

	slot0.itemsText.text = slot1.content or ""
	slot3 = slot0.settings.itemFunc

	for slot7, slot8 in ipairs(slot2) do
		updateDrop(slot9, slot8, {
			anonymous = slot8.anonymous,
			hideName = slot8.hideName
		})

		slot10 = findTF(slot9, "name")

		if not slot8.hideName then
			setActive(slot10, false)
			setActive(slot11, true)

			slot12 = ScrollTxt.New(slot11, findTF(slot9, "name_mask/name"))

			slot12:setText(getText(slot10))
			table.insert(slot0._scrollTxts, slot12)
		end

		if not slot8.anonymous then
			onButton(slot0, slot9, function ()
				if slot0 then
					slot0(slot1)
				end
			end, SFX_UI_CLICK)
		end
	end

	slot0:Loaded(slot1)
end

function slot7(slot0, slot1)
	slot0:commonSetting(slot1)
	SetActive(slot0._sigleItemPanel, true)
	SetActive(slot0._itemPanel, false)
	SetActive(slot0._msgPanel, false)
	setActive(slot0._inputPanel, false)
	SetActive(slot0._SingleItemshipTypeTF, false)
	SetActive(slot0._SingleItemshipTypeBgTF, false)
	SetActive(findTF(slot0._sigleItemPanel, "line_mode"), false)
	SetActive(findTF(slot0._sigleItemPanel, "count_select"), false)
	SetActive(findTF(slot0._sigleItemPanel, "detail"), false)
	setText(slot5, "")
	SetActive(slot6, false)
	SetActive(slot4, true)

	slot8 = findTF(slot0._sigleItemPanel, "icon_bg/frame")

	setFrame(slot8, slot1.frame or 1)

	slot7 = findTF(slot0._sigleItemPanel, "name_mode/name_mask")

	SetActive(slot7.parent, true)
	SetActive(slot7, true)
	ScrollTxt.New(slot7, slot8):setText(slot1.name or "")

	slot7.localPosition = Vector2(ScrollTxt.New(slot7, slot8).setText, slot7.localPosition.y)

	setText(slot4, slot1.content or "")
	SetActive(findTF(slot0._sigleItemPanel, "icon_bg/icon").parent, slot1.sprite)

	if slot1.sprite then
		setImageSprite(slot2, slot1.sprite, false)
	end

	slot0:Loaded(slot1)
end

function pg.MsgboxMgr.GetSingleItemIntro(slot0, slot1)
	if not slot0.singleItemIntros[slot1] then
		slot0.singleItemIntros[slot1] = cloneTplTo(slot0.singleItemIntro, slot0.singleItemIntro.parent)
	end

	return slot0.singleItemIntros[slot1]
end

function slot8(slot0, slot1)
	rtf(slot0._window).sizeDelta = slot0._defaultSize

	slot0:commonSetting(slot1)
	SetActive(slot0._sigleItemPanel, true)
	SetActive(slot0._itemPanel, false)
	SetActive(slot0._msgPanel, false)
	setActive(slot0._inputPanel, false)
	setActive(slot0._tf:Find("window/single_item_panel/line_mode"), false)
	setActive(slot0._tf:Find("window/single_item_panel/name_mode"), false)
	setActive(findTF(slot0._sigleItemPanel, "icon_bg/own"), false)

	if slot1.drop then
		slot2, slot3 = GetOwnedpropCount(slot1.drop)

		setActive(findTF(slot0._sigleItemPanel, "icon_bg/own"), slot3 and slot1.showOwned)
		setText(findTF(slot0._sigleItemPanel, "icon_bg/own/Text"), slot2)
		setText(findTF(slot0._sigleItemPanel, "icon_bg/own/label"), i18n("word_own1"))
	end

	updateDrop(slot0._tf:Find("window/single_item_panel"), slot1.drop)

	if slot1.windowSize then
		rtf(slot0._window).sizeDelta = Vector2(slot1.windowSize.x or slot0._defaultSize.x, slot1.windowSize.y or slot0._defaultSize.y)
	end

	setActive(slot0._tf:Find("window/single_item_panel/name_mode"), true)

	slot2 = slot0._tf:Find("window/single_item_panel/name_mode/attrs")
	slot4 = 1

	SetActive(slot0._tf:Find("window/single_item_panel/name_mode/intro_view/Viewport/Content/intro"), slot1.drop.type == DROP_TYPE_SHIP or slot1.drop.type == DROP_TYPE_RESOURCE or slot1.drop.type == DROP_TYPE_ITEM or slot1.drop.type == DROP_TYPE_FURNITURE or slot1.drop.type == DROP_TYPE_STRATEGY or slot1.drop.type == DROP_TYPE_SKIN)
	setActive(slot0._countDescTxt, slot0.settings.numUpdate ~= nil)

	slot9 = slot1.name or slot1.drop.cfg.name or ""
	slot9 = ScrollTxt.New(slot0._tf:Find("window/single_item_panel/name_mode/name_mask"), slot0._tf:Find("window/single_item_panel/name_mode/name_mask/name"))

	slot9:setText(HXSet.hxLan)
	table.insert(slot0._scrollTxts, slot9)

	slot10 = -170

	if not go(slot0._SingleItemshipTypeTF).activeSelf then
		slot10 = -230
	end

	setActive(slot0._SingleItemshipTypeBgTF, slot11)

	slot6.localPosition = Vector2(slot10, slot6.localPosition.y)

	setActive(slot0._tf:Find("window/single_item_panel/detail"), slot1.drop.type == DROP_TYPE_ITEM and slot1.drop.cfg.type == 11)

	if slot13 then
		slot12:GetComponent("RichText"):AddListener(function (slot0, slot1)
			{
				items = _.map(slot0.drop.cfg.display_icon, function (slot0)
					return {
						type = slot0[1],
						id = slot0[2]
					}
				end),
				content = i18n("equip_skin_detail_tip"),
				item2Row = true,
				hideNo = true,
				itemFunc = function (slot0)
					slot0(slot0, {
						drop = slot0,
						onYes = function ()
							slot0(slot1, slot2)
						end,
						onNo = function ()
							slot0(slot1, slot2)
						end
					})
				end,
				onYes = function ()
					slot0(slot1, slot2)
				end,
				onNo = ()["onYes"]
			}:onYes()
		end)
	end

	if slot1.content and slot1.content ~= "" then
		slot0.singleItemIntroTF.text = slot1.content
	elseif slot1.drop.type == DROP_TYPE_RESOURCE then
		setText(slot3, slot1.drop.cfg.display)
	elseif slot1.drop.type == DROP_TYPE_ITEM then
		setText(slot3, HXSet.hxLan(slot1.drop.cfg.display))
	elseif slot1.drop.type == DROP_TYPE_FURNITURE then
		setText(slot3, slot1.drop.cfg.describe)
	elseif slot1.drop.type == DROP_TYPE_SHIP then
		slot15, slot16, slot17 = ShipWordHelper.GetWordAndCV(slot2.ship_data_statistics[slot1.drop.id].skin_id, ShipWordHelper.WORD_TYPE_DROP, nil, PLATFORM_CODE ~= PLATFORM_US)

		setText(slot3, slot17 or i18n("ship_drop_desc_default"))
	elseif slot1.drop.type == DROP_TYPE_EQUIP then
		for slot17 = 1, 4, 1 do
			slot18 = slot2:GetChild(slot17 - 1)

			setActive(slot18:Find("opend"), slot19)
			setActive(slot18:Find("attrLockTpl"), not slot1.drop.cfg["attribute_" .. slot17])

			if slot1.drop.cfg["attribute_" .. slot17] then
				setText(slot18:Find("opend/type_name"), AttributeType.Type2Name(slot19))
				setText(slot18:Find("opend/value"), slot1.drop.cfg["value_" .. slot17])
			end
		end
	elseif slot1.drop.type == DROP_TYPE_STRATEGY then
		setText(slot3, slot1.drop.cfg.desc)

		if slot1.extendDesc then
			setText(slot0:GetSingleItemIntro(slot4 + 1), slot1.extendDesc)
		end
	elseif slot1.drop.type == DROP_TYPE_SKIN then
		setText(slot3, HXSet.hxLan(slot1.drop.cfg.desc))
	elseif slot1.drop.type == DROP_TYPE_EQUIPMENT_SKIN then
		setText(slot3, slot14 .. "\n\n" .. i18n("word_fit") .. ": " .. table.concat(_.map(slot1.drop.cfg.equip_type, function (slot0)
			return EquipType.Type2Name2(slot0)
		end), ","))
	elseif slot1.drop.type == DROP_TYPE_VITEM then
		setText(slot3, HXSet.hxLan(slot1.drop.cfg.display))
	elseif slot1.drop.type == DROP_TYPE_WORLD_ITEM then
		setText(slot3, HXSet.hxLan(slot1.drop.cfg.display))
	elseif slot1.drop.type == DROP_TYPE_ICON_FRAME then
		setText(slot3, slot1.drop.cfg.desc)
	elseif slot1.drop.type == DROP_TYPE_CHAT_FRAME then
		setText(slot3, slot1.drop.cfg.desc)
	elseif slot1.drop.type == DROP_TYPE_EMOJI then
		setText(slot3, slot1.drop.cfg.item_desc)
	end

	if slot1.intro then
		setText(slot3, slot1.intro)
	end

	if slot1.enabelYesBtn ~= nil then
		setButtonEnabled(slot14, slot1.enabelYesBtn)
		eachChild(slot0._btnContainer:GetChild(1), function (slot0)
			GetOrAddComponent(slot0, typeof(CanvasGroup)).alpha = (slot0.enabelYesBtn and 1) or 0.3
		end)
	end

	for slot17, slot18 in ipairs(slot0.singleItemIntros) do
		setActive(slot18, slot17 <= slot4 and slot5 == nil)
	end

	if slot1.show_medal then
		slot0:createBtn({
			sibling = 0,
			hideEvent = true,
			text = slot1.show_medal.desc,
			btnType = slot3.BUTTON_MEDAL,
			sound = SFX_UI_BUILDING_EXCHANGE
		})
	end

	slot0:Loaded(slot1)
end

function slot9(slot0, slot1)
	slot1.hideNo = defaultValue(slot1.hideNo, true)
	slot1.hideYes = defaultValue(slot1.hideYes, true)

	slot0:commonSetting(slot1)
	SetActive(slot0._itemPanel, false)
	SetActive(slot0._msgPanel, false)
	SetActive(slot0._sigleItemPanel, false)
	setActive(slot0._inputPanel, false)
	setActive(slot0._sliders, false)
	setActive(findTF(slot0._helpPanel, "bg"), not slot1.helps.pageMode)
	setActive(slot0._helpBgTF, slot1.helps.pageMode)

	if slot1.helps.helpSize then
		rtf(slot0._helpPanel).sizeDelta = Vector2(slot1.helps.helpSize.x or slot0._defaultHelpSize.x, slot1.helps.helpSize.y or slot0._defaultHelpSize.y)
	end

	if slot1.helps.helpPos then
		setAnchoredPosition(slot0._helpPanel, {
			x = slot1.helps.helpPos.x or slot0._defaultHelpPos.x,
			y = slot1.helps.helpPos.y or slot0._defaultHelpPos.y
		})
	end

	if slot1.helps.windowSize then
		rtf(slot0._window).sizeDelta = Vector2(slot1.helps.windowSize.x or slot0._defaultSize.x, slot1.helps.windowSize.y or slot0._defaultSize.y)
	end

	if slot1.helps.windowPos then
		rtf(slot0._window).sizeDelta = Vector2(slot1.helps.windowSize.x or slot0._defaultSize.x, slot1.helps.windowSize.y or slot0._defaultSize.y)

		setAnchoredPosition(slot0._window, {
			x = slot1.helps.windowPos.x or 0,
			y = slot1.helps.windowPos.y or 0
		})
	else
		setAnchoredPosition(slot0._window, {
			x = 0,
			y = 0
		})
	end

	if slot1.helps.buttonsHeight then
		setAnchoredPosition(slot0._btnContainer, {
			x = 0,
			y = slot1.helps.buttonsHeight
		})
	end

	if slot1.helps.disableScroll then
		GetComponent(slot0._helpPanel, typeof(ScrollRect)).enabled = not slot1.helps.disableScroll

		setAnchoredPosition(findTF(slot0._helpPanel, "list"), {
			x = 0,
			y = 0
		})
		setActive(findTF(slot0._helpPanel, "Scrollbar"), false)
	end

	if slot1.helps.ImageMode then
		setActive(slot0._top, false)
		setActive(findTF(slot0._window, "bg"), false)
	end

	for slot6 = #slot0.settings.helps, slot0._helpList.childCount - 1, 1 do
		Destroy(slot0._helpList:GetChild(slot6))
	end

	for slot6 = slot0._helpList.childCount, #slot2 - 1, 1 do
		cloneTplTo(slot0._helpTpl, slot0._helpList)
	end

	for slot6, slot7 in ipairs(slot2) do
		setActive(slot8, true)
		setText(slot0._helpList:GetChild(slot6 - 1), slot7.info or "")
		setActive(setText, slot7.icon)
		setActive(findTF(slot8, "line"), slot7.line)

		if slot7.icon then
			slot10 = 1

			if slot1.helps.ImageMode then
				slot10 = 1.5
			end

			slot9.transform.localScale = Vector2(slot7.icon.scale or slot10, slot7.icon.scale or slot10)
			slot11 = slot7.icon.path

			setImageSprite(slot9:GetComponent(typeof(Image)), slot7.icon.scale or slot10, true)
			setAnchoredPosition(slot9, {
				x = (slot7.icon.posX and slot7.icon.posX) or -20,
				y = (slot7.icon.posY and slot7.icon.posY) or 0
			})
			setActive(slot9:Find("corner"), slot1.helps.pageMode)
		end
	end

	slot0.helpPage = slot1.helps.defaultpage or 1

	if slot1.helps.pageMode then
		slot0:switchHelpPage(slot0.helpPage)
	end

	slot0:Loaded(slot1)
	setActive(slot0._btnContainer, slot0._btnContainer.transform.childCount > 0)
end

function showSecondaryPassword(slot0, slot1)
	slot0:commonSetting(slot1)
	SetActive(slot0._sigleItemPanel, false)
	SetActive(slot0._itemPanel, false)
	SetActive(slot0._msgPanel, false)
	setActive(slot0._inputPanel, false)

	slot2 = tf(slot1.secondaryUI)
	rtf(slot0._window).sizeDelta = Vector2(960, slot0._defaultSize.y)

	setActive(slot2, true)

	slot5 = getProxy(SecondaryPWDProxy).getRawData(slot4)
	slot6 = slot2:Find("showresttime")
	slot7 = slot2:Find("settips")

	if slot1.mode == "showresttime" then
		setActive(slot6, true)
		setActive(slot7, false)

		slot8 = slot6:Find("desc"):GetComponent(typeof(Text))

		if slot0.timers.secondaryUItimer then
			slot0.timers.secondaryUItimer:Stop()
		end

		slot9()

		slot10 = Timer.New(slot9, 1, -1)

		slot10:Start()

		slot0.timers.secondaryUItimer = slot10
	elseif slot3 == "settips" then
		setActive(slot6, false)
		setActive(slot7, true)

		slot1.references.inputfield = slot7:Find("InputField"):GetComponent(typeof(InputField))
		slot8.text = slot1.references.lasttext or ""
		slot9 = 20

		slot8.onValueChanged:AddListener(function ()
			slot0, slot2 = utf8_to_unicode(slot0.text)

			if slot1 < slot1 then
				slot0.text = SecondaryPasswordMediator.ClipUnicodeStr(slot0.text, slot1)
			end
		end)
		slot0:createBtn({
			text = slot1.TEXT_CONFIRM,
			btnType = slot1.BUTTON_BLUE,
			onCallback = slot0.settings.onYes,
			sound = SFX_CONFIRM,
			noQuit = function ()
				if PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US then
					return false
				end

				slot1, slot2 = wordVer(slot0, {
					isReplace = true
				})

				if slot1 > 0 or slot2 ~= slot0 then
					slot1.TipsMgr.GetInstance():ShowTips(i18n("secondarypassword_illegal_tip"))

					slot0.text = slot2

					return true
				else
					return false
				end
			end
		})
	end

	slot0:Loaded(slot1)
end

function pg.MsgboxMgr.nextPage(slot0)
	slot0.helpPage = slot0.helpPage + 1

	if slot0.helpPage < 1 then
		slot0.helpPage = 1
	end

	if slot0._helpList.childCount < slot0.helpPage then
		slot0.helpPage = 1
	end

	slot0:switchHelpPage(slot0.helpPage)
end

function pg.MsgboxMgr.prePage(slot0)
	slot0.helpPage = slot0.helpPage - 1

	if slot0.helpPage < 1 then
		slot0.helpPage = slot0._helpList.childCount
	end

	if slot0._helpList.childCount < slot0.helpPage then
		slot0.helpPage = slot0._helpList.childCount
	end

	slot0:switchHelpPage(slot0.helpPage)
end

function pg.MsgboxMgr.switchHelpPage(slot0, slot1)
	for slot5 = 1, slot0._helpList.childCount, 1 do
		setActive(slot0._helpList:GetChild(slot5 - 1), slot1 == slot5)
		setText(slot6:Find("icon/corner/Text"), slot5)
	end
end

function pg.MsgboxMgr.commonSetting(slot0, slot1)
	slot0.enable = true

	slot0.DelegateInfo.New(slot0)
	setActive(slot0._exchangeShipPanel, false)
	setActive(slot0._helpBgTF, false)
	setActive(slot0._btnContainer, true)

	slot0.stopRemindToggle.isOn = false

	setActive(go(slot0.stopRemindToggle), slot1.showStopRemind)

	tf(go(slot0.stopRemindToggle)).anchoredPosition = slot1.showStopRamindPos or slot0.stopRemindInitPos
	slot0.stopRemindText.text = slot1.stopRamindContent or i18n("dont_remind_today")

	removeAllChildren(slot0._btnContainer)

	slot0.settings = slot1

	SetActive(slot0._go, true)

	slot3 = slot0.settings.numUpdate

	setActive(slot0._countSelect, slot0.settings.needCounter or false)
	slot0._pageUtil:setNumUpdate(function (slot0)
		if slot0 ~= nil then
			slot0(slot1._countDescTxt, slot0)
		end
	end)
	slot0._pageUtil:setAddNum(slot0.settings.addNum or 1)
	slot0._pageUtil:setMaxNum(slot0.settings.maxNum or -1)
	slot0._pageUtil:setDefaultNum(slot0.settings.defaultNum or 1)

	if slot0.settings.discount ~= nil then
		slot0._discount:GetComponent(typeof(Text)).text = slot0.settings.discount.discount .. "%OFF"
		slot0._discountDate:GetComponent(typeof(Text)).text = slot0.settings.discount.date

		SetActive(slot0._discountDate, true)
		SetActive(slot0._strike, true)
		SetActive(slot0._discountInfo, true)
	else
		SetActive(slot0._discountDate, false)
		SetActive(slot0._strike, false)
		SetActive(slot0._discountInfo, false)
	end

	slot7 = slot0.settings.hideNo or false
	slot8 = slot0.settings.hideYes or false
	slot9 = slot0.settings.modal or false
	slot10 = slot0.settings.onNo or function ()
		return
	end

	if not slot9 then
		onButton(slot0, slot0._go, function ()
			if slot0.settings.onClose then
				slot0.settings.onClose()
			else
				slot1()
			end

			slot0:hide()
		end, SFX_CANCEL)
	else
		removeOnButton(slot0._go)
	end

	slot11, slot12 = nil

	if not slot7 then
		slot11 = slot0:createBtn({
			text = slot0.settings.noText or slot1.TEXT_CANCEL,
			btnType = slot0.settings.noBtnType or slot1.BUTTON_GRAY,
			onCallback = slot10,
			sound = slot1.noSound or SFX_CANCEL
		})
	end

	if not slot8 then
		slot12 = slot0:createBtn({
			text = slot0.settings.yesText or slot1.TEXT_CONFIRM,
			btnType = slot0.settings.yesBtnType or slot1.BUTTON_BLUE,
			onCallback = slot0.settings.onYes or function ()
				return
			end,
			sound = slot1.yesSound or SFX_CONFIRM
		})
	end

	if slot0.settings.yseBtnLetf then
		slot12:SetAsFirstSibling()
	end

	slot13 = nil

	if slot0.settings.type == MSGBOX_TYPE_HELP and slot0.settings.helps.pageMode and #slot0.settings.helps > 1 then
		slot0:createBtn({
			noQuit = true,
			btnType = slot1.BUTTON_PREPAGE,
			onCallback = function ()
				slot0:prePage()
			end,
			sound = SFX_CANCEL
		})

		slot13 = #slot0.settings.helps
	end

	if slot0.settings.custom ~= nil then
		for slot17, slot18 in ipairs(slot0.settings.custom) do
			slot0:createBtn(slot18)
		end
	end

	if not slot13 then
	elseif slot13 > 1 then
		slot0:createBtn({
			noQuit = true,
			btnType = slot1.BUTTON_NEXTPAGE,
			onCallback = function ()
				slot0:nextPage()
			end,
			sound = SFX_CONFIRM
		})
	end

	setActive(slot0._closeBtn, not slot1.hideClose)
	onButton(slot0, slot0._closeBtn, function ()
		print("点击3")
		slot0:hide()

		if slot0.settings.onClose then
			slot0()
		else
			slot1()
		end
	end, SFX_CANCEL)

	slot14 = slot0.settings.title or slot1.TITLE_INFORMATION
	slot15 = 0
	slot16 = slot0._titleList.transform.childCount

	while slot15 < slot16 do
		SetActive(slot0._titleList.transform:GetChild(slot15), slot0._titleList.transform:GetChild(slot15).name == slot14)

		slot15 = slot15 + 1
	end

	slot0._go.transform.localPosition = Vector3(slot0._go.transform.localPosition.x, slot0._go.transform.localPosition.y, slot0.settings.zIndex or 0)

	if slot0._helpPanel then
		setActive(slot0._helpPanel, slot0.settings.helps)
	end

	if slot0._sliders then
		setActive(slot0._sliders, true)
	end
end

function pg.MsgboxMgr.createBtn(slot0, slot1)
	slot2 = slot1.btnType or slot0.BUTTON_BLUE
	slot3 = slot1.onCallback or function ()
		return
	end
	slot4 = slot1.noQuit
	slot6 = cloneTplTo(slot5, slot0._btnContainer)

	if slot1.label then
		go(slot6).name = slot1.label
	end

	SetActive(slot6, true)

	if slot1.scale then
		slot6.localScale = Vector2(slot1.scale.x or 1, slot1.scale.y or 1)
	end

	if slot2 == slot0.BUTTON_MEDAL then
		setText(slot6:Find("text"), slot1.text)
	elseif slot2 ~= slot0.BUTTON_RETREAT and slot2 ~= slot0.BUTTON_PREPAGE and slot2 ~= slot0.BUTTON_NEXTPAGE then
		slot0:updateButton(slot6, slot1.text)
	end

	if not slot1.hideEvent then
		onButton(slot0, slot6, function ()
			if type(type) == "function" then
				if not slot0() then
					SetActive(slot1._go, false)
					slot1._go:Clear()
				else
					return
				end
			elseif not slot0 then
				SetActive(slot1._go, false)
				slot1._go:Clear()
			end

			slot2()
		end, slot1.sound or SFX_CONFIRM)
	end

	if slot1.sibling then
		slot6:SetSiblingIndex(slot1.sibling)
	end

	return slot6
end

function pg.MsgboxMgr.updateButton(slot0, slot1, slot2)
	slot3 = slot0[slot2]

	if IsNil(slot1:Find("pic")) then
		return
	end

	if slot3 then
		setText(slot4, i18n(slot3))
	else
		setText(slot4, slot2)
	end
end

function pg.MsgboxMgr.Loaded(slot0, slot1)
	if slot1.parent then
		setParent(slot0._tf, slot1.parent)

		if slot1.canvasOrder then
			slot0.originCanvasOrder = GetComponent(slot0._tf, typeof(Canvas)).sortingOrder
			GetComponent(slot0._tf, typeof(Canvas)).sortingOrder = slot1.canvasOrder
		end
	else
		slot0.UIMgr.GetInstance():BlurPanel(slot0._tf, false, {
			groupName = slot1.groupName,
			weight = slot1.weight,
			blurLevelCamera = slot1.blurLevelCamera
		})
	end

	slot0.m02:sendNotification(GAME.OPEN_MSGBOX_DONE)
end

function pg.MsgboxMgr.Clear(slot0)
	rtf(slot0._window).sizeDelta = slot0._defaultSize
	rtf(slot0._helpPanel).sizeDelta = slot0._defaultHelpSize

	setAnchoredPosition(slot0._window, {
		x = 0,
		y = 0
	})
	setAnchoredPosition(slot0._btnContainer, {
		x = 0,
		y = 0
	})
	setAnchoredPosition(slot0._helpPanel, {
		x = slot0._defaultHelpPos.x,
		y = slot0._defaultHelpPos.y
	})

	GetComponent(slot0._helpPanel, typeof(ScrollRect)).enabled = true

	setActive(slot0._top, true)
	setActive(findTF(slot0._window, "bg"), true)
	setActive(findTF(slot0._sigleItemPanel, "icon_bg/own"), false)

	for slot5 = 0, slot0._helpList.childCount - 1, 1 do
		slot0._helpList:GetChild(slot5):Find("icon"):GetComponent(typeof(Image)).sprite = nil
	end

	for slot5 = #slot0._scrollTxts, 1, -1 do
		if slot0._scrollTxts[slot5] then
			slot0._scrollTxts[slot5]:destroy()
			table.remove(slot0._scrollTxts, slot5)
		end
	end

	for slot5, slot6 in pairs(slot0.pools) do
		if slot6 then
			PoolMgr.GetInstance():ReturnUI(slot6.name, slot6)
		end
	end

	slot0.pools = {}

	for slot5, slot6 in pairs(slot0.timers) do
		slot6:Stop()
	end

	slot0.timers = {}

	slot0.DelegateInfo.Dispose(slot0)

	for slot6 = 1, slot0._btnContainer.childCount, 1 do
		Destroy(slot0._btnContainer:GetChild(0))
	end

	if slot0.settings and slot0.settings.parent then
		setParent(slot0._tf, slot0.UIMgr.GetInstance().OverlayMain, false)

		if slot0.settings.canvasOrder then
			GetComponent(slot0._tf, typeof(Canvas)).sortingOrder = slot0.originCanvasOrder
		end
	else
		slot0.UIMgr.GetInstance():UnblurPanel(slot0._tf, slot0.UIMgr.GetInstance().OverlayMain)
	end

	if slot0.contentText then
		slot0.contentText:RemoveAllListeners()
	end

	slot0.settings = nil
	slot0.enable = false
end

function pg.MsgboxMgr.ShowMsgBox(slot0, slot1)
	if (slot1.type or MSGBOX_TYPE_NORMAL) == MSGBOX_TYPE_NORMAL then
		slot0(slot0, slot1)
	elseif slot2 == MSGBOX_TYPE_INPUT then
		slot1(slot0, slot1)
	elseif slot2 == MSGBOX_TYPE_SINGLE_ITEM then
		slot2(slot0, slot1)
	elseif slot2 == MSGBOX_TYPE_EXCHANGE then
		slot3(slot0, slot1)
	elseif slot2 == MSGBOX_TYPE_DROP_ITEM then
		slot4(slot0, slot1)
	elseif slot2 == MSGBOX_TYPE_ITEM_BOX then
		slot5(slot0, slot1)
	elseif slot2 == MSGBOX_TYPE_HELP then
		slot6(slot0, slot1)
	elseif slot2 == MSGBOX_TYPE_SECONDPWD then
		PoolMgr.GetInstance():GetUI("Msgbox4SECPWD", true, function (slot0)
			slot0.pools.SedondaryUI = slot0

			if slot0.pools.onPreShow then
				slot1.onPreShow()
			end

			slot1.secondaryUI = slot0

			SetParent(slot0, slot0._sliders, false)
			showSecondaryPassword(slot0, showSecondaryPassword)
		end)
	end

	slot0._tf:SetAsLastSibling()
end

function pg.MsgboxMgr.hide(slot0)
	if not slot0.enable then
		return
	end

	slot0._go:SetActive(false)
	slot0:Clear()
	slot0.m02:sendNotification(GAME.CLOSE_MSGBOX_DONE)
end

return
