pg = pg or {}
slot0 = pg
slot1 = singletonClass
slot2 = "MsgboxMgr"
slot1 = slot1(slot2)
slot0.MsgboxMgr = slot1
slot1 = slot0.MsgboxMgr
slot2 = 1
slot1.BUTTON_BLUE = slot2
slot2 = 2
slot1.BUTTON_GRAY = slot2
slot2 = 3
slot1.BUTTON_RED = slot2
slot2 = 4
slot1.BUTTON_MEDAL = slot2
slot2 = 5
slot1.BUTTON_RETREAT = slot2
slot2 = 6
slot1.BUTTON_PREPAGE = slot2
slot2 = 7
slot1.BUTTON_NEXTPAGE = slot2
slot2 = 8
slot1.BUTTON_BLUE_WITH_ICON = slot2
slot2 = "infomation"
slot1.TITLE_INFORMATION = slot2
slot2 = "setting"
slot1.TITLE_SETTING = slot2
slot2 = "warning"
slot1.TITLE_WARNING = slot2
slot2 = "obtain"
slot1.TITLE_OBTAIN = slot2
slot2 = "text_cancel"
slot1.TEXT_CANCEL = slot2
slot2 = "text_confirm"
slot1.TEXT_CONFIRM = slot2
slot2 = 1
MSGBOX_TYPE_NORMAL = slot2
slot2 = 2
MSGBOX_TYPE_INPUT = slot2
slot2 = 3
MSGBOX_TYPE_SINGLE_ITEM = slot2
slot2 = 4
MSGBOX_TYPE_EXCHANGE = slot2
slot2 = 5
MSGBOX_TYPE_DROP_ITEM = slot2
slot2 = 6
MSGBOX_TYPE_ITEM_BOX = slot2
slot2 = 7
MSGBOX_TYPE_HELP = slot2
slot2 = 8
MSGBOX_TYPE_SECONDPWD = slot2
slot2 = 9
MSGBOX_TYPE_OBTAIN = slot2
slot2 = false
slot1.enable = slot2
slot2 = require
slot3 = "Mgr.const.MsgboxBtnNameMap"
slot2 = slot2(slot3)

function slot3(slot0, slot1)
	slot2 = print
	slot3 = "initializing msgbox manager..."

	slot2(slot3)

	slot2 = PoolMgr
	slot2 = slot2.GetInstance
	slot2 = slot2()
	slot3 = slot2
	slot2 = slot2.GetUI
	slot4 = "MsgBox"
	slot5 = true

	function slot6(slot0)
		slot1 = slot0
		slot1._go = slot0
		slot1 = slot0
		slot1 = slot1._go
		slot2 = slot1
		slot1 = slot1.SetActive
		slot3 = false

		slot1(slot2, slot3)

		slot1 = slot0
		slot2 = slot0
		slot2 = slot2._go
		slot2 = slot2.transform
		slot1._tf = slot2
		slot1 = slot1
		slot1 = slot1.UIMgr
		slot1 = slot1.GetInstance
		slot1 = slot1()
		slot1 = slot1.OverlayMain
		slot2 = slot0
		slot2 = slot2._tf
		slot3 = slot2
		slot2 = slot2.SetParent
		slot4 = slot1.transform
		slot5 = false

		slot2(slot3, slot4, slot5)

		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._tf
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window"
		slot3 = slot3(slot4, slot5)
		slot2._window = slot3
		slot2 = setActive
		slot3 = slot0
		slot3 = slot3._window
		slot4 = true

		slot2(slot3, slot4)

		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._window
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "top"
		slot3 = slot3(slot4, slot5)
		slot2._top = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._top
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "bg"
		slot3 = slot3(slot4, slot5)
		slot2._titleList = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._top
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "btnBack"
		slot3 = slot3(slot4, slot5)
		slot2._closeBtn = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._tf
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "res"
		slot3 = slot3(slot4, slot5)
		slot2._res = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._window
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "msg_panel"
		slot3 = slot3(slot4, slot5)
		slot2._msgPanel = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._msgPanel
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "content"
		slot3 = slot3(slot4, slot5)
		slot4 = slot3
		slot3 = slot3.GetComponent
		slot5 = "RichText"
		slot3 = slot3(slot4, slot5)
		slot2.contentText = slot3
		slot2 = slot0
		slot2 = slot2.contentText
		slot3 = slot2
		slot2 = slot2.AddSprite
		slot4 = "diamond"
		slot5 = slot0
		slot5 = slot5._res
		slot6 = slot5
		slot5 = slot5.Find
		slot7 = "diamond"
		slot5 = slot5(slot6, slot7)
		slot6 = slot5
		slot5 = slot5.GetComponent
		slot7 = typeof
		slot8 = Image
		slot5 = slot5(slot6, slot7(slot8))
		slot5 = slot5.sprite

		slot2(slot3, slot4, slot5)

		slot2 = slot0
		slot2 = slot2.contentText
		slot3 = slot2
		slot2 = slot2.AddSprite
		slot4 = "gold"
		slot5 = slot0
		slot5 = slot5._res
		slot6 = slot5
		slot5 = slot5.Find
		slot7 = "gold"
		slot5 = slot5(slot6, slot7)
		slot6 = slot5
		slot5 = slot5.GetComponent
		slot7 = typeof
		slot8 = Image
		slot5 = slot5(slot6, slot7(slot8))
		slot5 = slot5.sprite

		slot2(slot3, slot4, slot5)

		slot2 = slot0
		slot2 = slot2.contentText
		slot3 = slot2
		slot2 = slot2.AddSprite
		slot4 = "oil"
		slot5 = slot0
		slot5 = slot5._res
		slot6 = slot5
		slot5 = slot5.Find
		slot7 = "oil"
		slot5 = slot5(slot6, slot7)
		slot6 = slot5
		slot5 = slot5.GetComponent
		slot7 = typeof
		slot8 = Image
		slot5 = slot5(slot6, slot7(slot8))
		slot5 = slot5.sprite

		slot2(slot3, slot4, slot5)

		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._window
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "exchange_ship_panel"
		slot3 = slot3(slot4, slot5)
		slot2._exchangeShipPanel = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._window
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "item_panel"
		slot3 = slot3(slot4, slot5)
		slot2._itemPanel = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._itemPanel
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "Text"
		slot3 = slot3(slot4, slot5)
		slot4 = slot3
		slot3 = slot3.GetComponent
		slot5 = typeof
		slot6 = Text
		slot3 = slot3(slot4, slot5(slot6))
		slot2._itemsText = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._itemPanel
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "scrollview/item"
		slot3 = slot3(slot4, slot5)
		slot2._itemListItemTpl = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._itemPanel
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "scrollview/list"
		slot3 = slot3(slot4, slot5)
		slot2._itemListItemContainer = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._window
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "single_item_panel"
		slot3 = slot3(slot4, slot5)
		slot2._sigleItemPanel = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._sigleItemPanel
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "name_mode/ship_type"
		slot3 = slot3(slot4, slot5)
		slot2._singleItemshipTypeTF = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._sigleItemPanel
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "name_mode/ship_type_bg"
		slot3 = slot3(slot4, slot5)
		slot2._singleItemshipTypeBgTF = slot3
		slot2 = slot0
		slot3 = {}
		slot2.singleItemIntros = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._sigleItemPanel
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "intro_view/Viewport/Content/intro"
		slot3 = slot3(slot4, slot5)
		slot2.singleItemIntro = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3.singleItemIntro
		slot4 = slot3
		slot3 = slot3.GetComponent
		slot5 = "RichText"
		slot3 = slot3(slot4, slot5)
		slot2.singleItemIntroTF = slot3
		slot2 = slot0
		slot2 = slot2.singleItemIntroTF
		slot3 = slot2
		slot2 = slot2.AddSprite
		slot4 = "diamond"
		slot5 = slot0
		slot5 = slot5._res
		slot6 = slot5
		slot5 = slot5.Find
		slot7 = "diamond"
		slot5 = slot5(slot6, slot7)
		slot6 = slot5
		slot5 = slot5.GetComponent
		slot7 = typeof
		slot8 = Image
		slot5 = slot5(slot6, slot7(slot8))
		slot5 = slot5.sprite

		slot2(slot3, slot4, slot5)

		slot2 = slot0
		slot2 = slot2.singleItemIntroTF
		slot3 = slot2
		slot2 = slot2.AddSprite
		slot4 = "gold"
		slot5 = slot0
		slot5 = slot5._res
		slot6 = slot5
		slot5 = slot5.Find
		slot7 = "gold"
		slot5 = slot5(slot6, slot7)
		slot6 = slot5
		slot5 = slot5.GetComponent
		slot7 = typeof
		slot8 = Image
		slot5 = slot5(slot6, slot7(slot8))
		slot5 = slot5.sprite

		slot2(slot3, slot4, slot5)

		slot2 = slot0
		slot2 = slot2.singleItemIntroTF
		slot3 = slot2
		slot2 = slot2.AddSprite
		slot4 = "oil"
		slot5 = slot0
		slot5 = slot5._res
		slot6 = slot5
		slot5 = slot5.Find
		slot7 = "oil"
		slot5 = slot5(slot6, slot7)
		slot6 = slot5
		slot5 = slot5.GetComponent
		slot7 = typeof
		slot8 = Image
		slot5 = slot5(slot6, slot7(slot8))
		slot5 = slot5.sprite

		slot2(slot3, slot4, slot5)

		slot2 = table
		slot2 = slot2.insert
		slot3 = slot0
		slot3 = slot3.singleItemIntros
		slot4 = slot0
		slot4 = slot4.singleItemIntro

		slot2(slot3, slot4)

		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._window
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "input_panel"
		slot3 = slot3(slot4, slot5)
		slot2._inputPanel = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._inputPanel
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "label"
		slot3 = slot3(slot4, slot5)
		slot4 = slot3
		slot3 = slot3.GetComponent
		slot5 = typeof
		slot6 = Text
		slot3 = slot3(slot4, slot5(slot6))
		slot2._inputTitle = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._inputPanel
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "InputField"
		slot3 = slot3(slot4, slot5)
		slot2._inputTF = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._inputTF
		slot4 = slot3
		slot3 = slot3.GetComponent
		slot5 = typeof
		slot6 = InputField
		slot3 = slot3(slot4, slot5(slot6))
		slot2._inputField = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._inputTF
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "Placeholder"
		slot3 = slot3(slot4, slot5)
		slot4 = slot3
		slot3 = slot3.GetComponent
		slot5 = typeof
		slot6 = Text
		slot3 = slot3(slot4, slot5(slot6))
		slot2._placeholderTF = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._inputPanel
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "btns/confirm_btn"
		slot3 = slot3(slot4, slot5)
		slot2._inputConfirmBtn = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._inputPanel
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "btns/cancel_btn"
		slot3 = slot3(slot4, slot5)
		slot2._inputCancelBtn = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._window
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "help_panel"
		slot3 = slot3(slot4, slot5)
		slot2._helpPanel = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._tf
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "bg_help"
		slot3 = slot3(slot4, slot5)
		slot2._helpBgTF = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._helpPanel
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "list"
		slot3 = slot3(slot4, slot5)
		slot2._helpList = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._helpPanel
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "list/help_tpl"
		slot3 = slot3(slot4, slot5)
		slot2._helpTpl = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._window
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "obtain_panel"
		slot3 = slot3(slot4, slot5)
		slot2._obtainPanel = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._window
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "other_panel"
		slot3 = slot3(slot4, slot5)
		slot2._otherPanel = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._window
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "count_select"
		slot3 = slot3(slot4, slot5)
		slot2._countSelect = slot3
		slot2 = slot0
		slot3 = PageUtil
		slot3 = slot3.New
		slot4 = slot0
		slot4 = slot4._countSelect
		slot5 = slot4
		slot4 = slot4.Find
		slot6 = "value_bg/left"
		slot4 = slot4(slot5, slot6)
		slot5 = slot0
		slot5 = slot5._countSelect
		slot6 = slot5
		slot5 = slot5.Find
		slot7 = "value_bg/right"
		slot5 = slot5(slot6, slot7)
		slot6 = slot0
		slot6 = slot6._countSelect
		slot7 = slot6
		slot6 = slot6.Find
		slot8 = "max"
		slot6 = slot6(slot7, slot8)
		slot7 = slot0
		slot7 = slot7._countSelect
		slot8 = slot7
		slot7 = slot7.Find
		slot9 = "value_bg/value"
		slot3 = slot3(slot4, slot5, slot6, slot7(slot8, slot9))
		slot2._pageUtil = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._countSelect
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "desc_txt"
		slot3 = slot3(slot4, slot5)
		slot2._countDescTxt = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._window
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "sliders"
		slot3 = slot3(slot4, slot5)
		slot2._sliders = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._sliders
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "discountInfo"
		slot3 = slot3(slot4, slot5)
		slot2._discountInfo = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._sliders
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "discountDate"
		slot3 = slot3(slot4, slot5)
		slot2._discountDate = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._sliders
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "discountInfo/discount"
		slot3 = slot3(slot4, slot5)
		slot2._discount = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._sliders
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "strike"
		slot3 = slot3(slot4, slot5)
		slot2._strike = slot3
		slot2 = slot0
		slot3 = {}
		slot2._scrollTxts = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._window
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "stopRemind"
		slot3 = slot3(slot4, slot5)
		slot4 = slot3
		slot3 = slot3.GetComponent
		slot5 = typeof
		slot6 = Toggle
		slot3 = slot3(slot4, slot5(slot6))
		slot2.stopRemindToggle = slot3
		slot2 = slot0
		slot3 = tf
		slot4 = slot0
		slot4 = slot4.stopRemindToggle
		slot4 = slot4.gameObject
		slot3 = slot3(slot4)
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "Label"
		slot3 = slot3(slot4, slot5)
		slot4 = slot3
		slot3 = slot3.GetComponent
		slot5 = typeof
		slot6 = Text
		slot3 = slot3(slot4, slot5(slot6))
		slot2.stopRemindText = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._window
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "button_container"
		slot3 = slot3(slot4, slot5)
		slot2._btnContainer = slot3
		slot2 = slot0
		slot3 = Vector2
		slot4 = 930
		slot5 = 620
		slot3 = slot3(slot4, slot5)
		slot2._defaultSize = slot3
		slot2 = slot0
		slot3 = Vector2
		slot4 = 870
		slot5 = 480
		slot3 = slot3(slot4, slot5)
		slot2._defaultHelpSize = slot3
		slot2 = slot0
		slot3 = Vector2
		slot4 = 0
		slot5 = -40
		slot3 = slot3(slot4, slot5)
		slot2._defaultHelpPos = slot3
		slot2 = onButton
		slot3 = nil
		slot4 = slot0
		slot4 = slot4._inputCancelBtn

		function slot5()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.hide

			slot0(slot1)
		end

		slot6 = SFX_CANCEL

		slot2(slot3, slot4, slot5, slot6)

		slot2 = onButton
		slot3 = nil
		slot4 = slot0
		slot4 = slot4._closeBtn

		function slot5()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.hide

			slot0(slot1)
		end

		slot6 = SFX_CANCEL

		slot2(slot3, slot4, slot5, slot6)

		slot2 = onButton
		slot3 = nil
		slot4 = slot0
		slot4 = slot4._inputConfirmBtn

		function slot5()
			slot0 = slot0
			slot0 = slot0.settings
			slot0 = slot0.onYes

			if slot0 then
				slot0 = slot0
				slot0 = slot0.settings
				slot0 = slot0.onYes
				slot1 = slot0
				slot1 = slot1._inputField
				slot1 = slot1.text

				slot0(slot1)
			end

			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.hide

			slot0(slot1)
		end

		slot6 = SFX_CONFIRM

		slot2(slot3, slot4, slot5, slot6)

		slot2 = slot0
		slot3 = {}
		slot2.pools = slot3
		slot2 = slot0
		slot3 = {}
		slot2.timers = slot3
		slot2 = slot2

		slot2()
	end

	slot2(slot3, slot4, slot5, slot6)
end

slot1.Init = slot3

function slot3(slot0)
	slot1 = slot0._go

	return slot1
end

slot1.getMsgBoxOb = slot3

function slot3(slot0, slot1)
	slot3 = slot0
	slot2 = slot0.commonSetting
	slot4 = slot1

	slot2(slot3, slot4)

	slot2 = SetActive
	slot3 = slot0._msgPanel
	slot4 = true

	slot2(slot3, slot4)

	slot2 = slot0.contentText
	slot3 = slot0.settings
	slot3 = slot3.alignment

	if not slot3 then
		slot3 = TextAnchor
		slot3 = slot3.MiddleCenter
	end

	slot2.alignment = slot3
	slot0.contentText.fontSize = slot0.settings.fontSize or 36
	slot0.contentText.text = slot0.settings.content or ""
	slot3 = slot0
	slot2 = slot0.Loaded
	slot4 = slot1

	slot2(slot3, slot4)
end

function slot4(slot0, slot1)
	slot0:commonSetting(slot1)
	setActive(slot0._inputPanel, true)
	setActive(slot0._btnContainer, false)
	slot0._inputPanel:SetAsLastSibling()

	slot0._inputTitle.text = slot1.title or ""
	slot0._placeholderTF.text = slot1.placeholder or ""
	slot0._inputField.characterLimit = slot1.limit or 0
	slot2 = setActive
	slot3 = slot0._inputCancelBtn
	slot4 = slot1.onNo
	slot4 = not slot4

	slot2(slot3, slot4)

	slot3 = slot0
	slot2 = slot0.updateButton
	slot4 = slot0._inputCancelBtn
	slot5 = slot1.noText

	if not slot5 then
		slot5 = slot0
		slot5 = slot5.TEXT_CANCEL
	end

	slot2(slot3, slot4, slot5)

	slot3 = slot0
	slot2 = slot0.updateButton
	slot4 = slot0._inputConfirmBtn
	slot5 = slot1.yesText

	if not slot5 then
		slot5 = slot0
		slot5 = slot5.TEXT_CONFIRM
	end

	slot2(slot3, slot4, slot5)

	slot2 = slot0._tf
	slot3 = slot2
	slot2 = slot2.SetAsLastSibling

	slot2(slot3)

	slot2 = onButton
	slot3 = slot0
	slot4 = slot0._closeBtn

	function slot5()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.hide

		slot0(slot1)
	end

	slot6 = SFX_CANCEL

	slot2(slot3, slot4, slot5, slot6)

	slot3 = slot0
	slot2 = slot0.Loaded
	slot4 = slot1

	slot2(slot3, slot4)
end

function slot5(slot0, slot1)
	slot3 = slot0
	slot2 = slot0.commonSetting
	slot4 = slot1

	slot2(slot3, slot4)

	slot2 = SetActive
	slot3 = slot0._exchangeShipPanel
	slot4 = true

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = findTF
	slot4 = slot0._exchangeShipPanel
	slot5 = "icon_bg/own"
	slot3 = slot3(slot4, slot5)
	slot4 = false

	slot2(slot3, slot4)

	slot2 = updateDrop
	slot3 = slot0._exchangeShipPanel
	slot4 = slot1.drop

	slot2(slot3, slot4)

	slot2 = slot0._exchangeShipPanel
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "intro_view/Viewport/intro"
	slot2 = slot2(slot3, slot4)
	slot3 = SetActive
	slot4 = slot2
	slot5 = slot1.drop
	slot5 = slot5.type
	slot6 = DROP_TYPE_SHIP

	if slot5 ~= slot6 then
		slot5 = slot1.drop
		slot5 = slot5.type
		slot6 = DROP_TYPE_RESOURCE

		if slot5 ~= slot6 then
			slot5 = slot1.drop
			slot5 = slot5.type
			slot6 = DROP_TYPE_ITEM

			if slot5 ~= slot6 then
				slot5 = slot1.drop
				slot5 = slot5.type
				slot6 = DROP_TYPE_FURNITURE

				if slot5 ~= slot6 then
					slot5 = slot1.drop
					slot5 = slot5.type
					slot6 = DROP_TYPE_STRATEGY

					if slot5 ~= slot6 then
						slot3(slot4, slot1.drop.type == DROP_TYPE_SKIN)
						setActive(slot0.singleItemIntro, slot0.settings.numUpdate == nil)
						setActive(slot0._countDescTxt, slot0.settings.numUpdate ~= nil)

						slot4 = setText
						slot5 = slot0._exchangeShipPanel
						slot6 = slot5
						slot5 = slot5.Find
						slot7 = "name_mode/name"
						slot5 = slot5(slot6, slot7)
						slot6 = HXSet
						slot6 = slot6.hxLan
						slot7 = slot1.name

						if not slot7 then
							slot4(slot5, slot6(slot1.drop.cfg.name or ""))
							setText(slot0._exchangeShipPanel:Find("name_mode/name/name"), getText(slot0._exchangeShipPanel:Find("name_mode/name")))
						end
					end
				end
			end
		end
	end

	slot5, slot6, slot7 = ShipWordHelper.GetWordAndCV(slot4, ShipWordHelper.WORD_TYPE_DROP, nil, PLATFORM_CODE ~= PLATFORM_US)
	slot8 = setText
	slot9 = slot2

	if not slot7 then
		slot10 = i18n
		slot11 = "ship_drop_desc_default"
		slot10 = slot10(slot11)
	end

	slot8(slot9, slot10)

	slot8 = slot1.intro

	if slot8 then
		slot8 = setText
		slot9 = slot2
		slot10 = slot1.intro

		slot8(slot9, slot10)
	end

	slot8 = slot1.enabelYesBtn

	if slot8 ~= nil then
		slot8 = slot0._btnContainer
		slot9 = slot8
		slot8 = slot8.GetChild
		slot10 = 1
		slot8 = slot8(slot9, slot10)
		slot9 = setButtonEnabled
		slot10 = slot8
		slot11 = slot1.enabelYesBtn

		slot9(slot10, slot11)

		slot9 = eachChild
		slot10 = slot8

		function slot11(slot0)
			GetOrAddComponent(slot0, typeof(CanvasGroup)).alpha = (slot0.enabelYesBtn and 1) or 0.3
		end

		slot9(slot10, slot11)
	end

	slot8 = slot1.show_medal

	if slot8 then
		slot9 = slot0
		slot8 = slot0.createBtn
		slot10 = {
			sibling = 0,
			hideEvent = true
		}
		slot11 = slot1.show_medal
		slot11 = slot11.desc
		slot10.text = slot11
		slot11 = slot1
		slot11 = slot11.BUTTON_MEDAL
		slot10.btnType = slot11
		slot11 = SFX_UI_BUILDING_EXCHANGE
		slot10.sound = slot11

		slot8(slot9, slot10)
	end

	slot9 = slot0
	slot8 = slot0.Loaded
	slot10 = slot1

	slot8(slot9, slot10)
end

function slot6(slot0, slot1)
	slot0:commonSetting(slot1)
	SetActive(slot0._itemPanel, true)
	removeAllChildren(slot0._itemListItemContainer)
	setActive(slot0._itemsText, slot1.content)

	slot0._itemsText.text = slot1.content or ""
	slot2 = slot0.settings.items
	slot3 = slot0.settings.itemFunc
	slot4 = ipairs
	slot5 = slot2
	slot4, slot5, slot6 = slot4(slot5)

	for slot7, slot8 in slot4, slot5, slot6 do
		slot9 = cloneTplTo
		slot10 = slot0._itemListItemTpl
		slot11 = slot0._itemListItemContainer
		slot9 = slot9(slot10, slot11)
		slot10 = updateDrop
		slot11 = slot9
		slot12 = slot8
		slot13 = {}
		slot14 = slot8.anonymous
		slot13.anonymous = slot14
		slot14 = slot8.hideName
		slot13.hideName = slot14

		slot10(slot11, slot12, slot13)

		slot10 = findTF
		slot11 = slot9
		slot12 = "name"
		slot10 = slot10(slot11, slot12)
		slot11 = slot8.hideName

		if not slot11 then
			slot11 = findTF
			slot12 = slot9
			slot13 = "name_mask"
			slot11 = slot11(slot12, slot13)
			slot12 = setActive
			slot13 = slot10
			slot14 = false

			slot12(slot13, slot14)

			slot12 = setActive
			slot13 = slot11
			slot14 = true

			slot12(slot13, slot14)

			slot12 = ScrollTxt
			slot12 = slot12.New
			slot13 = slot11
			slot14 = findTF
			slot15 = slot9
			slot16 = "name_mask/name"
			slot12 = slot12(slot13, slot14(slot15, slot16))
			slot14 = slot12
			slot13 = slot12.setText
			slot15 = getText
			slot16 = slot10

			slot13(slot14, slot15(slot16))

			slot13 = table
			slot13 = slot13.insert
			slot14 = slot0._scrollTxts
			slot15 = slot12

			slot13(slot14, slot15)
		end

		slot11 = slot8.anonymous

		if not slot11 then
			slot11 = onButton
			slot12 = slot0
			slot13 = slot9

			function slot14()
				slot0 = slot0

				if slot0 then
					slot0 = slot0
					slot1 = slot1

					slot0(slot1)
				end
			end

			slot15 = SFX_UI_CLICK

			slot11(slot12, slot13, slot14, slot15)
		end
	end

	slot5 = slot0
	slot4 = slot0.Loaded
	slot6 = slot1

	slot4(slot5, slot6)
end

function slot7(slot0, slot1)
	slot0:commonSetting(slot1)
	SetActive(slot0._sigleItemPanel, true)
	SetActive(slot0._singleItemshipTypeTF, false)
	SetActive(slot0._singleItemshipTypeBgTF, false)
	SetActive(slot0._sigleItemPanel:Find("detail"), false)
	setText(slot5, "")
	SetActive(slot6, false)
	SetActive(slot4, true)
	setFrame(slot0._sigleItemPanel:Find("icon_bg/frame"), slot1.frame or 1)
	ScrollTxt.New(setFrame, slot0._sigleItemPanel.Find("icon_bg/frame")).setText(slot1.frame or 1, slot1.name or "")
	setText(slot0._sigleItemPanel:Find("intro_view/Viewport/Content/intro"), slot1.content or "")

	slot10 = SetActive
	slot11 = slot0._sigleItemPanel:Find("icon_bg/icon").parent
	slot12 = slot1.sprite

	slot10(slot11, slot12)

	slot10 = slot1.sprite

	if slot10 then
		slot10 = setImageSprite
		slot11 = slot2
		slot12 = slot1.sprite
		slot13 = false

		slot10(slot11, slot12, slot13)
	end

	slot11 = slot0
	slot10 = slot0.Loaded
	slot12 = slot1

	slot10(slot11, slot12)
end

function slot8(slot0, slot1)
	slot3 = slot0
	slot2 = slot0.commonSetting
	slot4 = slot1

	slot2(slot3, slot4)

	slot2 = SetActive
	slot3 = slot0._sigleItemPanel
	slot4 = true

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = findTF
	slot4 = slot0._sigleItemPanel
	slot5 = "icon_bg/own"
	slot3 = slot3(slot4, slot5)
	slot4 = false

	slot2(slot3, slot4)

	slot2 = slot1.drop

	if slot2 then
		slot6, slot3 = GetOwnedpropCount(slot1.drop)

		setActive(findTF(slot0._sigleItemPanel, "icon_bg/own"), slot3 and slot1.showOwned)
		setText(findTF(slot0._sigleItemPanel, "icon_bg/own/Text"), slot2)
		setText(findTF(slot0._sigleItemPanel, "icon_bg/own/label"), i18n("word_own1"))
	end

	slot2 = setParent
	slot3 = slot0._singleItemshipTypeTF
	slot4 = slot0._sigleItemPanel

	slot2(slot3, slot4)

	slot2 = updateDrop
	slot3 = slot0._sigleItemPanel
	slot4 = slot1.drop

	slot2(slot3, slot4)

	slot2 = slot1.windowSize

	if slot2 then
		slot2 = rtf
		slot3 = slot0._window
		slot2 = slot2(slot3)
		slot3 = Vector2
		slot4 = slot1.windowSize
		slot4 = slot4.x

		if not slot4 then
			slot4 = slot0._defaultSize
			slot4 = slot4.x
		end

		slot5 = slot1.windowSize
		slot5 = slot5.y

		if not slot5 then
			slot5 = slot0._defaultSize
			slot5 = slot5.y
		end

		slot3 = slot3(slot4, slot5)
		slot2.sizeDelta = slot3
	end

	slot2 = slot0._sigleItemPanel
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "intro_view/Viewport/Content/intro"
	slot2 = slot2(slot3, slot4)
	slot3 = 1
	slot4 = SetActive
	slot5 = slot2
	slot6 = slot1.drop
	slot6 = slot6.type
	slot7 = DROP_TYPE_SHIP

	if slot6 ~= slot7 then
		slot6 = slot1.drop
		slot6 = slot6.type
		slot7 = DROP_TYPE_RESOURCE

		if slot6 ~= slot7 then
			slot6 = slot1.drop
			slot6 = slot6.type
			slot7 = DROP_TYPE_ITEM

			if slot6 ~= slot7 then
				slot6 = slot1.drop
				slot6 = slot6.type
				slot7 = DROP_TYPE_FURNITURE

				if slot6 ~= slot7 then
					slot6 = slot1.drop
					slot6 = slot6.type
					slot7 = DROP_TYPE_STRATEGY

					if slot6 ~= slot7 then
						slot4(slot5, slot1.drop.type == DROP_TYPE_SKIN)
						setActive(slot0._countDescTxt, slot0.settings.numUpdate ~= nil)

						slot5 = slot0._sigleItemPanel:Find("name_mode/name_mask")
						slot6 = slot0._sigleItemPanel:Find("name_mode/name_mask/name")
						slot7 = HXSet.hxLan
						slot8 = slot1.name

						if not slot8 then
							slot7 = slot7(slot1.drop.cfg.name or "")
						end
					end
				end
			end
		end
	end

	slot8 = ScrollTxt
	slot8 = slot8.New
	slot9 = slot5
	slot10 = slot6
	slot8 = slot8(slot9, slot10)
	slot10 = slot8
	slot9 = slot8.setText
	slot11 = slot7

	slot9(slot10, slot11)

	slot9 = table
	slot9 = slot9.insert
	slot10 = slot0._scrollTxts
	slot11 = slot8

	slot9(slot10, slot11)

	slot9 = setParent
	slot10 = slot0._singleItemshipTypeTF
	slot11 = slot0._sigleItemPanel
	slot12 = slot11
	slot11 = slot11.Find
	slot13 = "name_mode"

	slot9(slot10, slot11(slot12, slot13))

	slot9 = slot0._singleItemshipTypeTF
	slot10 = slot9
	slot9 = slot9.SetSiblingIndex
	slot11 = 1

	slot9(slot10, slot11)

	slot9 = setActive
	slot10 = slot0._singleItemshipTypeBgTF
	slot11 = isActive
	slot12 = slot0._singleItemshipTypeTF

	slot9(slot10, slot11(slot12))

	slot9 = slot0._sigleItemPanel
	slot10 = slot9
	slot9 = slot9.Find
	slot11 = "detail"
	slot9 = slot9(slot10, slot11)
	slot10 = slot1.drop
	slot10 = slot10.type
	slot11 = DROP_TYPE_ITEM

	if slot10 == slot11 then
		setActive(slot9, slot1.drop.cfg.type == 11)

		if slot1.drop.cfg.type == 11 then
			slot12 = slot9
			slot11 = slot9.GetComponent
			slot13 = "RichText"
			slot11 = slot11(slot12, slot13)
			slot12 = slot11
			slot11 = slot11.AddListener

			function slot13(slot0, slot1)
				slot2 = {}
				slot3 = _
				slot3 = slot3.map
				slot4 = slot0
				slot4 = slot4.drop
				slot4 = slot4.cfg
				slot4 = slot4.display_icon

				function slot5(slot0)
					slot1 = {}
					slot2 = slot0[1]
					slot1.type = slot2
					slot2 = slot0[2]
					slot1.id = slot2

					return slot1
				end

				slot3 = slot3(slot4, slot5)
				slot2.items = slot3
				slot3 = i18n
				slot4 = "equip_skin_detail_tip"
				slot3 = slot3(slot4)
				slot2.content = slot3
				slot3 = true
				slot2.item2Row = slot3
				slot3 = true
				slot2.hideNo = slot3

				function slot3(slot0)
					slot1 = slot0
					slot2 = slot1
					slot3 = {
						drop = slot0
					}

					function slot4()
						slot0 = slot0
						slot1 = slot1
						slot2 = slot2

						slot0(slot1, slot2)
					end

					slot3.onYes = slot4

					function slot4()
						slot0 = slot0
						slot1 = slot1
						slot2 = slot2

						slot0(slot1, slot2)
					end

					slot3.onNo = slot4

					slot1(slot2, slot3)
				end

				slot2.itemFunc = slot3

				function slot3()
					slot0 = slot0
					slot1 = slot1
					slot2 = slot2

					slot0(slot1, slot2)
				end

				slot2.onYes = slot3
				slot3 = slot2.onYes
				slot2.onNo = slot3
				slot3 = slot3
				slot4 = slot2
				slot5 = slot2

				slot3(slot4, slot5)
			end

			slot11(slot12, slot13)
		end
	end

	slot11 = slot1.content

	if slot11 then
		slot11 = slot1.content

		if slot11 ~= "" then
			slot11 = slot0.singleItemIntroTF
			slot12 = slot1.content
			slot11.text = slot12
		end
	else
		slot11 = slot1.drop
		slot11 = slot11.type
		slot12 = DROP_TYPE_RESOURCE

		if slot11 == slot12 then
			slot11 = setText
			slot12 = slot2
			slot13 = HXSet
			slot13 = slot13.hxLan
			slot14 = slot1.drop
			slot14 = slot14.cfg
			slot14 = slot14.display

			slot11(slot12, slot13(slot14))
		else
			slot11 = slot1.drop
			slot11 = slot11.type
			slot12 = DROP_TYPE_ITEM

			if slot11 == slot12 then
				slot11 = setText
				slot12 = slot2
				slot13 = HXSet
				slot13 = slot13.hxLan
				slot14 = slot1.drop
				slot14 = slot14.cfg
				slot14 = slot14.display

				slot11(slot12, slot13(slot14))
			else
				slot11 = slot1.drop
				slot11 = slot11.type
				slot12 = DROP_TYPE_FURNITURE

				if slot11 == slot12 then
					slot11 = setText
					slot12 = slot2
					slot13 = slot1.drop
					slot13 = slot13.cfg
					slot13 = slot13.describe

					slot11(slot12, slot13)
				else
					slot11 = slot1.drop
					slot11 = slot11.type
					slot12 = DROP_TYPE_SHIP

					if slot11 == slot12 then
						slot12, slot13, slot14 = ShipWordHelper.GetWordAndCV(slot11, ShipWordHelper.WORD_TYPE_DROP, nil, PLATFORM_CODE ~= PLATFORM_US)
						slot15 = setText
						slot16 = slot2

						if not slot14 then
							slot17 = i18n
							slot18 = "ship_drop_desc_default"
							slot17 = slot17(slot18)
						end

						slot15(slot16, slot17)
					else
						slot11 = slot1.drop
						slot11 = slot11.type
						slot12 = DROP_TYPE_EQUIP

						if slot11 == slot12 then
						else
							slot11 = slot1.drop
							slot11 = slot11.type
							slot12 = DROP_TYPE_STRATEGY

							if slot11 == slot12 then
								slot11 = setText
								slot12 = slot2
								slot13 = slot1.drop
								slot13 = slot13.cfg
								slot13 = slot13.desc

								slot11(slot12, slot13)

								slot11 = slot1.extendDesc

								if slot11 then
									slot3 = slot3 + 1
									slot11 = slot0.singleItemIntros
									slot12 = slot0.singleItemIntros
									slot12 = slot12[slot3]

									if not slot12 then
										slot12 = cloneTplTo
										slot13 = slot0.singleItemIntro
										slot14 = slot0.singleItemIntro
										slot14 = slot14.parent
										slot12 = slot12(slot13, slot14)
									end

									slot11[slot3] = slot12
									slot11 = setText
									slot12 = slot0.singleItemIntros
									slot12 = slot12[slot3]
									slot13 = slot1.extendDesc

									slot11(slot12, slot13)
								end
							else
								slot11 = slot1.drop
								slot11 = slot11.type
								slot12 = DROP_TYPE_SKIN

								if slot11 == slot12 then
									slot11 = setText
									slot12 = slot2
									slot13 = HXSet
									slot13 = slot13.hxLan
									slot14 = slot1.drop
									slot14 = slot14.cfg
									slot14 = slot14.desc

									slot11(slot12, slot13(slot14))
								else
									slot11 = slot1.drop
									slot11 = slot11.type
									slot12 = DROP_TYPE_EQUIPMENT_SKIN

									if slot11 == slot12 then
										slot11 = slot1.drop
										slot11 = slot11.cfg
										slot11 = slot11.desc
										slot12 = _
										slot12 = slot12.map
										slot13 = slot1.drop
										slot13 = slot13.cfg
										slot13 = slot13.equip_type

										function slot14(slot0)
											slot1 = EquipType
											slot1 = slot1.Type2Name2
											slot2 = slot0

											return slot1(slot2)
										end

										slot12 = slot12(slot13, slot14)
										slot13 = setText
										slot14 = slot2
										slot15 = slot11
										slot16 = "\n\n"
										slot17 = i18n
										slot18 = "word_fit"
										slot17 = slot17(slot18)
										slot18 = ": "
										slot19 = table
										slot19 = slot19.concat
										slot20 = slot12
										slot21 = ","
										slot19 = slot19(slot20, slot21)
										slot15 = slot15 .. slot16 .. slot17 .. slot18 .. slot19

										slot13(slot14, slot15)
									else
										slot11 = slot1.drop
										slot11 = slot11.type
										slot12 = DROP_TYPE_VITEM

										if slot11 == slot12 then
											slot11 = setText
											slot12 = slot2
											slot13 = HXSet
											slot13 = slot13.hxLan
											slot14 = slot1.drop
											slot14 = slot14.cfg
											slot14 = slot14.display

											slot11(slot12, slot13(slot14))
										else
											slot11 = slot1.drop
											slot11 = slot11.type
											slot12 = DROP_TYPE_WORLD_ITEM

											if slot11 == slot12 then
												slot11 = setText
												slot12 = slot2
												slot13 = HXSet
												slot13 = slot13.hxLan
												slot14 = slot1.drop
												slot14 = slot14.cfg
												slot14 = slot14.display

												slot11(slot12, slot13(slot14))
											else
												slot11 = slot1.drop
												slot11 = slot11.type
												slot12 = DROP_TYPE_ICON_FRAME

												if slot11 == slot12 then
													slot11 = setText
													slot12 = slot2
													slot13 = slot1.drop
													slot13 = slot13.cfg
													slot13 = slot13.desc

													slot11(slot12, slot13)
												else
													slot11 = slot1.drop
													slot11 = slot11.type
													slot12 = DROP_TYPE_CHAT_FRAME

													if slot11 == slot12 then
														slot11 = setText
														slot12 = slot2
														slot13 = slot1.drop
														slot13 = slot13.cfg
														slot13 = slot13.desc

														slot11(slot12, slot13)
													else
														slot11 = slot1.drop
														slot11 = slot11.type
														slot12 = DROP_TYPE_EMOJI

														if slot11 == slot12 then
															slot11 = setText
															slot12 = slot2
															slot13 = slot1.drop
															slot13 = slot13.cfg
															slot13 = slot13.item_desc

															slot11(slot12, slot13)
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end

	slot11 = slot1.intro

	if slot11 then
		slot11 = setText
		slot12 = slot2
		slot13 = slot1.intro

		slot11(slot12, slot13)
	end

	slot11 = slot1.enabelYesBtn

	if slot11 ~= nil then
		slot11 = slot0._btnContainer
		slot12 = slot11
		slot11 = slot11.GetChild
		slot13 = 1
		slot11 = slot11(slot12, slot13)
		slot12 = setButtonEnabled
		slot13 = slot11
		slot14 = slot1.enabelYesBtn

		slot12(slot13, slot14)

		slot12 = eachChild
		slot13 = slot11

		function slot14(slot0)
			GetOrAddComponent(slot0, typeof(CanvasGroup)).alpha = (slot0.enabelYesBtn and 1) or 0.3
		end

		slot12(slot13, slot14)
	end

	slot11 = ipairs
	slot12 = slot0.singleItemIntros
	slot11, slot12, slot13 = slot11(slot12)

	for slot14, slot15 in slot11, slot12, slot13 do
		setActive(slot15, slot14 <= slot3 and slot4 == nil)
	end

	slot11 = slot1.show_medal

	if slot11 then
		slot12 = slot0
		slot11 = slot0.createBtn
		slot13 = {
			sibling = 0,
			hideEvent = true
		}
		slot14 = slot1.show_medal
		slot14 = slot14.desc
		slot13.text = slot14
		slot14 = slot3
		slot14 = slot14.BUTTON_MEDAL
		slot13.btnType = slot14
		slot14 = SFX_UI_BUILDING_EXCHANGE
		slot13.sound = slot14

		slot11(slot12, slot13)
	end

	slot12 = slot0
	slot11 = slot0.Loaded
	slot13 = slot1

	slot11(slot12, slot13)
end

function slot9(slot0, slot1)
	slot2 = defaultValue
	slot3 = slot1.hideNo
	slot4 = true
	slot2 = slot2(slot3, slot4)
	slot1.hideNo = slot2
	slot2 = defaultValue
	slot3 = slot1.hideYes
	slot4 = true
	slot2 = slot2(slot3, slot4)
	slot1.hideYes = slot2
	slot3 = slot0
	slot2 = slot0.commonSetting
	slot4 = slot1

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = findTF
	slot4 = slot0._helpPanel
	slot5 = "bg"
	slot3 = slot3(slot4, slot5)
	slot4 = slot1.helps
	slot4 = slot4.pageMode
	slot4 = not slot4

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._helpBgTF
	slot4 = slot1.helps
	slot4 = slot4.pageMode

	slot2(slot3, slot4)

	slot2 = slot1.helps
	slot2 = slot2.helpSize

	if slot2 then
		slot2 = rtf
		slot3 = slot0._helpPanel
		slot2 = slot2(slot3)
		slot3 = Vector2
		slot4 = slot1.helps
		slot4 = slot4.helpSize
		slot4 = slot4.x

		if not slot4 then
			slot4 = slot0._defaultHelpSize
			slot4 = slot4.x
		end

		slot5 = slot1.helps
		slot5 = slot5.helpSize
		slot5 = slot5.y

		if not slot5 then
			slot5 = slot0._defaultHelpSize
			slot5 = slot5.y
		end

		slot3 = slot3(slot4, slot5)
		slot2.sizeDelta = slot3
	end

	slot2 = slot1.helps
	slot2 = slot2.helpPos

	if slot2 then
		slot2 = setAnchoredPosition
		slot3 = slot0._helpPanel
		slot4 = {}
		slot5 = slot1.helps
		slot5 = slot5.helpPos
		slot5 = slot5.x

		if not slot5 then
			slot5 = slot0._defaultHelpPos
			slot5 = slot5.x
		end

		slot4.x = slot5
		slot5 = slot1.helps
		slot5 = slot5.helpPos
		slot5 = slot5.y

		if not slot5 then
			slot5 = slot0._defaultHelpPos
			slot5 = slot5.y
		end

		slot4.y = slot5

		slot2(slot3, slot4)
	end

	slot2 = slot1.helps
	slot2 = slot2.windowSize

	if slot2 then
		slot2 = rtf
		slot3 = slot0._window
		slot2 = slot2(slot3)
		slot3 = Vector2
		slot4 = slot1.helps
		slot4 = slot4.windowSize
		slot4 = slot4.x

		if not slot4 then
			slot4 = slot0._defaultSize
			slot4 = slot4.x
		end

		slot5 = slot1.helps
		slot5 = slot5.windowSize
		slot5 = slot5.y

		if not slot5 then
			slot5 = slot0._defaultSize
			slot5 = slot5.y
		end

		slot3 = slot3(slot4, slot5)
		slot2.sizeDelta = slot3
	end

	slot2 = slot1.helps
	slot2 = slot2.windowPos

	if slot2 then
		slot2 = rtf
		slot3 = slot0._window
		slot2 = slot2(slot3)
		slot3 = Vector2
		slot4 = slot1.helps
		slot4 = slot4.windowSize
		slot4 = slot4.x

		if not slot4 then
			slot4 = slot0._defaultSize
			slot4 = slot4.x
		end

		slot5 = slot1.helps
		slot5 = slot5.windowSize
		slot5 = slot5.y

		if not slot5 then
			slot5 = slot0._defaultSize
			slot5 = slot5.y
		end

		slot2.sizeDelta = slot3(slot4, slot5)

		setAnchoredPosition(slot0._window, {
			x = slot1.helps.windowPos.x or 0,
			y = slot1.helps.windowPos.y or 0
		})
	else
		slot2 = setAnchoredPosition
		slot3 = slot0._window
		slot4 = {
			x = 0,
			y = 0
		}

		slot2(slot3, slot4)
	end

	slot2 = slot1.helps
	slot2 = slot2.buttonsHeight

	if slot2 then
		slot2 = setAnchoredPosition
		slot3 = slot0._btnContainer
		slot4 = {
			x = 0
		}
		slot5 = slot1.helps
		slot5 = slot5.buttonsHeight
		slot4.y = slot5

		slot2(slot3, slot4)
	end

	slot2 = slot1.helps
	slot2 = slot2.disableScroll

	if slot2 then
		slot2 = GetComponent
		slot3 = slot0._helpPanel
		slot4 = typeof
		slot5 = ScrollRect
		slot2 = slot2(slot3, slot4(slot5))
		slot3 = slot1.helps
		slot3 = slot3.disableScroll
		slot3 = not slot3
		slot2.enabled = slot3
		slot3 = setAnchoredPosition
		slot4 = findTF
		slot5 = slot0._helpPanel
		slot6 = "list"
		slot4 = slot4(slot5, slot6)
		slot5 = {
			x = 0,
			y = 0
		}

		slot3(slot4, slot5)

		slot3 = setActive
		slot4 = findTF
		slot5 = slot0._helpPanel
		slot6 = "Scrollbar"
		slot4 = slot4(slot5, slot6)
		slot5 = false

		slot3(slot4, slot5)
	end

	slot2 = slot1.helps
	slot2 = slot2.ImageMode

	if slot2 then
		slot2 = setActive
		slot3 = slot0._top
		slot4 = false

		slot2(slot3, slot4)

		slot2 = setActive
		slot3 = findTF
		slot4 = slot0._window
		slot5 = "bg"
		slot3 = slot3(slot4, slot5)
		slot4 = false

		slot2(slot3, slot4)
	end

	slot2 = slot0.settings
	slot2 = slot2.helps
	slot3 = #slot2
	slot4 = slot0._helpList
	slot4 = slot4.childCount
	slot4 = slot4 - 1
	slot5 = 1

	for slot6 = slot3, slot4, slot5 do
		slot7 = Destroy
		slot8 = slot0._helpList
		slot9 = slot8
		slot8 = slot8.GetChild
		slot10 = slot6

		slot7(slot8(slot9, slot10))
	end

	slot3 = slot0._helpList
	slot3 = slot3.childCount
	slot4 = #slot2
	slot4 = slot4 - 1
	slot5 = 1

	for slot6 = slot3, slot4, slot5 do
		slot7 = cloneTplTo
		slot8 = slot0._helpTpl
		slot9 = slot0._helpList

		slot7(slot8, slot9)
	end

	slot3 = ipairs
	slot4 = slot2
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot8 = slot0._helpList:GetChild(slot6 - 1)

		setActive(slot8, true)
		setText(slot8, slot7.info or "")
		setActive(slot9, slot7.icon)
		setActive(findTF(slot8, "line"), slot7.line)

		slot10 = slot7.icon

		if slot10 then
			slot10 = 1
			slot11 = slot1.helps
			slot11 = slot11.ImageMode

			if slot11 then
				slot10 = 1.5
			end

			slot9.transform.localScale = Vector2(slot7.icon.scale or slot10, slot7.icon.scale or slot10)
			slot11 = slot7.icon.path
			slot12 = slot7.icon.posX

			if slot12 then
				slot12 = slot7.icon.posX or -20
				slot13 = slot7.icon.posY

				if slot13 then
					setImageSprite(slot9:GetComponent(typeof(Image)), slot14, true)
					setAnchoredPosition(slot9, {
						x = slot12,
						y = slot7.icon.posY or 0
					})
					setActive(slot9:Find("corner"), slot1.helps.pageMode)
				end
			end
		end
	end

	slot0.helpPage = slot1.helps.defaultpage or 1
	slot3 = slot1.helps
	slot3 = slot3.pageMode

	if slot3 then
		slot4 = slot0
		slot3 = slot0.switchHelpPage
		slot5 = slot0.helpPage

		slot3(slot4, slot5)
	end

	slot0:Loaded(slot1)
	setActive(slot0._btnContainer, slot0._btnContainer.transform.childCount > 0)
end

function slot10(slot0, slot1)
	slot3 = slot0
	slot2 = slot0.commonSetting
	slot4 = slot1

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._otherPanel
	slot4 = true

	slot2(slot3, slot4)

	slot2 = tf
	slot3 = slot1.secondaryUI
	slot2 = slot2(slot3)
	slot3 = rtf
	slot4 = slot0._window
	slot3 = slot3(slot4)
	slot4 = Vector2
	slot5 = 960
	slot6 = slot0._defaultSize
	slot6 = slot6.y
	slot4 = slot4(slot5, slot6)
	slot3.sizeDelta = slot4
	slot3 = setActive
	slot4 = slot2
	slot5 = true

	slot3(slot4, slot5)

	slot3 = slot1.mode
	slot4 = getProxy
	slot5 = SecondaryPWDProxy
	slot4 = slot4(slot5)
	slot6 = slot4
	slot5 = slot4.getRawData
	slot5 = slot5(slot6)
	slot7 = slot2
	slot6 = slot2.Find
	slot8 = "showresttime"
	slot6 = slot6(slot7, slot8)
	slot8 = slot2
	slot7 = slot2.Find
	slot9 = "settips"
	slot7 = slot7(slot8, slot9)

	if slot3 == "showresttime" then
		slot8 = setActive
		slot9 = slot6
		slot10 = true

		slot8(slot9, slot10)

		slot8 = setActive
		slot9 = slot7
		slot10 = false

		slot8(slot9, slot10)

		slot9 = slot6
		slot8 = slot6.Find
		slot10 = "desc"
		slot8 = slot8(slot9, slot10)
		slot9 = slot8
		slot8 = slot8.GetComponent
		slot10 = typeof
		slot11 = Text
		slot8 = slot8(slot9, slot10(slot11))
		slot9 = slot0.timers
		slot9 = slot9.secondaryUItimer

		if slot9 then
			slot9 = slot0.timers
			slot9 = slot9.secondaryUItimer
			slot10 = slot9
			slot9 = slot9.Stop

			slot9(slot10)
		end

		function slot9()
			slot0 = slot0
			slot0 = slot0.TimeMgr
			slot0 = slot0.GetInstance
			slot0 = slot0()
			slot1 = slot0
			slot0 = slot0.GetServerTime
			slot0 = slot0(slot1)
			slot1 = slot1
			slot1 = slot1.fail_cd

			if slot1 then
				slot1 = slot1
				slot1 = slot1.fail_cd
				slot1 = slot1 - slot0

				if not slot1 then
					slot1 = 0
				end
			end

			slot2 = 0

			if slot1 < slot2 then
				slot1 = 0
			end

			slot2 = math
			slot2 = slot2.floor
			slot3 = slot1 / 86400
			slot2 = slot2(slot3)
			slot3 = 0

			if slot2 > slot3 then
				slot3 = slot2
				slot4 = string
				slot4 = slot4.format
				slot5 = i18n
				slot6 = "tips_fail_secondarypwd_much_times"
				slot5 = slot5(slot6)
				slot6 = slot2
				slot7 = i18n
				slot8 = "word_date"
				slot7 = slot7(slot8)
				slot6 = slot6 .. slot7
				slot4 = slot4(slot5, slot6)
				slot3.text = slot4
			else
				slot3 = math
				slot3 = slot3.floor
				slot4 = slot1 / 3600
				slot3 = slot3(slot4)
				slot4 = 0

				if slot3 > slot4 then
					slot4 = slot2
					slot5 = string
					slot5 = slot5.format
					slot6 = i18n
					slot7 = "tips_fail_secondarypwd_much_times"
					slot6 = slot6(slot7)
					slot7 = slot3
					slot8 = i18n
					slot9 = "word_hour"
					slot8 = slot8(slot9)
					slot7 = slot7 .. slot8
					slot5 = slot5(slot6, slot7)
					slot4.text = slot5
				else
					slot4 = ""
					slot5 = math
					slot5 = slot5.floor
					slot6 = slot1 / 60
					slot5 = slot5(slot6)
					slot6 = 0

					if slot5 > slot6 then
						slot6 = slot4
						slot7 = slot5
						slot8 = i18n
						slot9 = "word_minute"
						slot8 = slot8(slot9)
						slot4 = slot6 .. slot7 .. slot8
					end

					slot6 = math
					slot6 = slot6.max
					slot7 = slot5 * 60
					slot7 = slot1 - slot7
					slot8 = 0
					slot6 = slot6(slot7, slot8)
					slot7 = slot2
					slot8 = string
					slot8 = slot8.format
					slot9 = i18n
					slot10 = "tips_fail_secondarypwd_much_times"
					slot9 = slot9(slot10)
					slot10 = slot4
					slot11 = slot6
					slot12 = i18n
					slot13 = "word_second"
					slot12 = slot12(slot13)
					slot10 = slot10 .. slot11 .. slot12
					slot8 = slot8(slot9, slot10)
					slot7.text = slot8
				end
			end
		end

		slot10 = slot9

		slot10()

		slot10 = Timer
		slot10 = slot10.New
		slot11 = slot9
		slot12 = 1
		slot13 = -1
		slot10 = slot10(slot11, slot12, slot13)
		slot12 = slot10
		slot11 = slot10.Start

		slot11(slot12)

		slot11 = slot0.timers
		slot11.secondaryUItimer = slot10
	elseif slot3 == "settips" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 86-109, warpins: 1 ---
		slot8 = setActive
		slot9 = slot6
		slot10 = false

		slot8(slot9, slot10)

		slot8 = setActive
		slot9 = slot7
		slot10 = true

		slot8(slot9, slot10)

		slot9 = slot7
		slot8 = slot7.Find
		slot10 = "InputField"
		slot8 = slot8(slot9, slot10)
		slot9 = slot8
		slot8 = slot8.GetComponent
		slot10 = typeof
		slot11 = InputField
		slot8 = slot8(slot9, slot10(slot11))
		slot9 = slot1.references
		slot9.inputfield = slot8
		slot9 = slot1.references
		slot9 = slot9.lasttext
		slot9 = slot9 or ""
		slot8.text = slot9
		slot9 = 20
		slot10 = slot8.onValueChanged
		slot11 = slot10
		slot10 = slot10.AddListener

		function slot12()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			slot0 = utf8_to_unicode
			slot1 = slot0
			slot1 = slot1.text
			slot0, slot1 = slot0(slot1)
			slot2 = slot1

			if slot2 < slot1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 8-15, warpins: 1 ---
				slot2 = slot0
				slot3 = SecondaryPasswordMediator
				slot3 = slot3.ClipUnicodeStr
				slot4 = slot0
				slot4 = slot4.text
				slot5 = slot1
				slot3 = slot3(slot4, slot5)
				slot2.text = slot3
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 16-16, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end

		slot10(slot11, slot12)

		function slot10()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-4, warpins: 1 ---
			slot0 = PLATFORM_CODE
			slot1 = PLATFORM_JP

			if slot0 ~= slot1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-8, warpins: 1 ---
				slot0 = PLATFORM_CODE
				slot1 = PLATFORM_US

				if slot0 == slot1 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 9-10, warpins: 2 ---
					slot0 = false

					return slot0
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 11-19, warpins: 2 ---
			slot0 = slot0
			slot0 = slot0.text
			slot1 = wordVer
			slot2 = slot0
			slot3 = {
				isReplace = true
			}
			slot1, slot2 = slot1(slot2, slot3)
			slot3 = 0

			if slot1 > slot3 or slot2 ~= slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 22-36, warpins: 2 ---
				slot3 = slot1
				slot3 = slot3.TipsMgr
				slot3 = slot3.GetInstance
				slot3 = slot3()
				slot4 = slot3
				slot3 = slot3.ShowTips
				slot5 = i18n
				slot6 = "secondarypassword_illegal_tip"

				slot3(slot4, slot5(slot6))

				slot3 = slot0
				slot3.text = slot2
				slot3 = true

				return slot3
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 37-38, warpins: 1 ---
				slot3 = false

				return slot3
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 39-39, warpins: 2 ---
			return
			--- END OF BLOCK #2 ---



		end

		slot12 = slot0
		slot11 = slot0.createBtn
		slot13 = {}
		slot14 = slot1
		slot14 = slot14.TEXT_CONFIRM
		slot13.text = slot14
		slot14 = slot1
		slot14 = slot14.BUTTON_BLUE
		slot13.btnType = slot14
		slot14 = slot0.settings
		slot14 = slot14.onYes
		slot13.onCallback = slot14
		slot14 = SFX_CONFIRM
		slot13.sound = slot14
		slot13.noQuit = slot10

		slot11(slot12, slot13)

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #1 110-110, warpins: 1 ---
		slot9 = ""
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 111-135, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	slot9 = slot0
	slot8 = slot0.Loaded
	slot10 = slot1

	slot8(slot9, slot10)
end

function slot11(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-33, warpins: 1 ---
	slot3 = slot0
	slot2 = slot0.commonSetting
	slot4 = slot1

	slot2(slot3, slot4)

	slot2 = rtf
	slot3 = slot0._window
	slot2 = slot2(slot3)
	slot3 = Vector2
	slot4 = slot0._defaultSize
	slot4 = slot4.x
	slot5 = 520
	slot3 = slot3(slot4, slot5)
	slot2.sizeDelta = slot3
	slot2 = setActive
	slot3 = slot0._obtainPanel
	slot4 = true

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._btnContainer
	slot4 = false

	slot2(slot3, slot4)

	slot2 = {}
	slot3 = DROP_TYPE_SHIP
	slot2.type = slot3
	slot3 = slot1.shipId
	slot2.id = slot3
	slot3 = updateDrop
	slot4 = slot0._obtainPanel
	slot5 = slot2

	slot3(slot4, slot5)

	slot3 = slot0.obtainSkipList

	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 34-46, warpins: 1 ---
		slot3 = UIItemList
		slot3 = slot3.New
		slot4 = slot0._obtainPanel
		slot5 = slot4
		slot4 = slot4.Find
		slot6 = "skipable_list"
		slot4 = slot4(slot5, slot6)
		slot5 = slot0._obtainPanel
		slot6 = slot5
		slot5 = slot5.Find
		slot7 = "skipable_list/tpl"
		slot3 = slot3(slot4, slot5(slot6, slot7))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 47-64, warpins: 2 ---
	slot0.obtainSkipList = slot3
	slot3 = slot0.obtainSkipList
	slot4 = slot3
	slot3 = slot3.make

	function slot5(slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		slot3 = UIItemList
		slot3 = slot3.EventUpdate

		if slot0 == slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-31, warpins: 1 ---
			slot3 = slot0
			slot3 = slot3.list
			slot4 = slot1 + 1
			slot3 = slot3[slot4]
			slot4 = slot3[1]
			slot5 = slot3[2]
			slot6 = slot3[3]
			slot8 = slot2
			slot7 = slot2.Find
			slot9 = "mask/title"
			slot7 = slot7(slot8, slot9)
			slot8 = slot7
			slot7 = slot7.GetComponent
			slot9 = "ScrollText"
			slot7 = slot7(slot8, slot9)
			slot8 = slot7
			slot7 = slot7.SetText
			slot9 = slot4

			slot7(slot8, slot9)

			slot7 = setActive
			slot9 = slot2
			slot8 = slot2.Find
			slot10 = "skip_btn"
			slot8 = slot8(slot9, slot10)
			slot9 = slot5[1]

			if slot9 ~= "" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 32-34, warpins: 1 ---
				slot9 = slot5[1]

				if slot9 == "COLLECTSHIP" then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 35-36, warpins: 2 ---
					slot9 = false
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 37-37, warpins: 1 ---
					slot9 = true
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 38-41, warpins: 2 ---
			slot7(slot8, slot9)

			slot7 = slot5[1]

			if slot7 ~= "" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 42-50, warpins: 1 ---
				slot7 = onButton
				slot8 = slot1
				slot10 = slot2
				slot9 = slot2.Find
				slot11 = "skip_btn"
				slot9 = slot9(slot10, slot11)

				function slot10()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-3, warpins: 1 ---
					slot0 = slot0

					if slot0 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 4-6, warpins: 1 ---
						slot0 = slot0

						if slot0 ~= 0 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 7-15, warpins: 1 ---
							slot0 = getProxy
							slot1 = ActivityProxy
							slot0 = slot0(slot1)
							slot1 = slot0
							slot0 = slot0.getActivityById
							slot2 = slot0
							slot0 = slot0(slot1, slot2)

							if slot0 then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 16-20, warpins: 1 ---
								slot2 = slot0
								slot1 = slot0.isEnd
								slot1 = slot1(slot2)

								if slot1 then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 21-31, warpins: 2 ---
									slot1 = slot1
									slot1 = slot1.TipsMgr
									slot1 = slot1.GetInstance
									slot1 = slot1()
									slot2 = slot1
									slot1 = slot1.ShowTips
									slot3 = i18n
									slot4 = "collection_way_is_unopen"

									slot1(slot2, slot3(slot4))

									return
									--- END OF BLOCK #0 ---

									FLOW; TARGET BLOCK #1



									-- Decompilation error in this vicinity:
									--- BLOCK #1 32-32, warpins: 0 ---
									--- END OF BLOCK #1 ---



								end
								--- END OF BLOCK #0 ---



							end
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 33-36, warpins: 2 ---
						slot0 = slot2
						slot0 = slot0[1]

						if slot0 == "SHOP" then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 37-41, warpins: 1 ---
							slot0 = slot2
							slot0 = slot0[2]
							slot0 = slot0.warp

							if slot0 == "supplies" then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 42-58, warpins: 1 ---
								slot0 = slot1
								slot0 = slot0.SystemOpenMgr
								slot0 = slot0.GetInstance
								slot0 = slot0()
								slot1 = slot0
								slot0 = slot0.isOpenSystem
								slot2 = getProxy
								slot3 = PlayerProxy
								slot2 = slot2(slot3)
								slot3 = slot2
								slot2 = slot2.getData
								slot2 = slot2(slot3)
								slot2 = slot2.level
								slot3 = "MilitaryExerciseMediator"
								slot0 = slot0(slot1, slot2, slot3)

								if not slot0 then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 59-69, warpins: 1 ---
									slot0 = slot1
									slot0 = slot0.TipsMgr
									slot0 = slot0.GetInstance
									slot0 = slot0()
									slot1 = slot0
									slot0 = slot0.ShowTips
									slot2 = i18n
									slot3 = "military_shop_no_open_tip"

									slot0(slot1, slot2(slot3))

									return
									--- END OF BLOCK #0 ---

									FLOW; TARGET BLOCK #1



									-- Decompilation error in this vicinity:
									--- BLOCK #1 70-70, warpins: 0 ---
									--- END OF BLOCK #1 ---



								end
								--- END OF BLOCK #0 ---



							end
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 71-74, warpins: 3 ---
							slot0 = slot2
							slot0 = slot0[1]

							if slot0 == "LEVEL" then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 75-78, warpins: 1 ---
								slot0 = slot2
								slot0 = slot0[2]

								if slot0 then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 79-98, warpins: 1 ---
									slot0 = slot2
									slot0 = slot0[2]
									slot0 = slot0.chapterid
									slot1 = getProxy
									slot2 = ChapterProxy
									slot1 = slot1(slot2)
									slot3 = slot1
									slot2 = slot1.getMaps
									slot2 = slot2(slot3)
									slot4 = slot1
									slot3 = slot1.getChapterById
									slot5 = slot0
									slot3 = slot3(slot4, slot5)
									slot5 = slot3
									slot4 = slot3.getConfig
									slot6 = "map"
									slot4 = slot4(slot5, slot6)
									slot4 = slot2[slot4]

									if slot4 then

										-- Decompilation error in this vicinity:
										--- BLOCK #0 99-104, warpins: 1 ---
										slot6 = slot4
										slot5 = slot4.getChapter
										slot7 = slot0
										slot5 = slot5(slot6, slot7)

										if slot5 then

											-- Decompilation error in this vicinity:
											--- BLOCK #0 105-113, warpins: 1 ---
											slot6 = slot4
											slot5 = slot4.getChapter
											slot7 = slot0
											slot5 = slot5(slot6, slot7)
											slot6 = slot5
											slot5 = slot5.isUnlock
											slot5 = slot5(slot6)

											if slot5 then

												-- Decompilation error in this vicinity:
												--- BLOCK #0 114-118, warpins: 1 ---
												slot6 = slot1
												slot5 = slot1.getActiveChapter
												slot5 = slot5(slot6)

												if slot5 then

													-- Decompilation error in this vicinity:
													--- BLOCK #0 119-121, warpins: 1 ---
													slot6 = slot5.id

													if slot6 ~= slot0 then

														-- Decompilation error in this vicinity:
														--- BLOCK #0 122-135, warpins: 1 ---
														slot6 = slot3
														slot7 = slot6
														slot6 = slot6.ShowMsgBox
														slot8 = {}
														slot9 = i18n
														slot10 = "collect_chapter_is_activation"
														slot9 = slot9(slot10)
														slot8.content = slot9

														function slot9()

															-- Decompilation error in this vicinity:
															--- BLOCK #0 1-12, warpins: 1 ---
															slot0 = slot0
															slot0 = slot0.m02
															slot1 = slot0
															slot0 = slot0.sendNotification
															slot2 = GAME
															slot2 = slot2.CHAPTER_OP
															slot3 = {}
															slot4 = ChapterConst
															slot4 = slot4.OpRetreat
															slot3.type = slot4

															slot0(slot1, slot2, slot3)

															return
															--- END OF BLOCK #0 ---



														end

														slot8.onYes = slot9

														slot6(slot7, slot8)

														return
														--- END OF BLOCK #0 ---



													end
													--- END OF BLOCK #0 ---



												else

													-- Decompilation error in this vicinity:
													--- BLOCK #0 136-144, warpins: 2 ---
													slot6 = {}
													slot8 = slot3
													slot7 = slot3.getConfig
													slot9 = "map"
													slot7 = slot7(slot8, slot9)
													slot6.mapIdx = slot7
													slot7 = slot3.active

													if slot7 then

														-- Decompilation error in this vicinity:
														--- BLOCK #0 145-147, warpins: 1 ---
														slot7 = slot3.id
														slot6.chapterId = slot7
														--- END OF BLOCK #0 ---



													else

														-- Decompilation error in this vicinity:
														--- BLOCK #0 148-148, warpins: 1 ---
														slot6.openChapterId = slot0
														--- END OF BLOCK #0 ---



													end

													--- END OF BLOCK #0 ---

													FLOW; TARGET BLOCK #1



													-- Decompilation error in this vicinity:
													--- BLOCK #1 149-159, warpins: 2 ---
													slot7 = slot1
													slot7 = slot7.m02
													slot8 = slot7
													slot7 = slot7.sendNotification
													slot9 = GAME
													slot9 = slot9.GO_SCENE
													slot10 = SCENE
													slot10 = slot10.LEVEL
													slot11 = slot6

													slot7(slot8, slot9, slot10, slot11)
													--- END OF BLOCK #1 ---



												end
												--- END OF BLOCK #0 ---



											end
											--- END OF BLOCK #0 ---



										end
										--- END OF BLOCK #0 ---



									else

										-- Decompilation error in this vicinity:
										--- BLOCK #0 160-172, warpins: 3 ---
										slot5 = slot1
										slot5 = slot5.TipsMgr
										slot5 = slot5.GetInstance
										slot5 = slot5()
										slot6 = slot5
										slot5 = slot5.ShowTips
										slot7 = i18n
										slot8 = "acquisitionmode_is_not_open"

										slot5(slot6, slot7(slot8))

										return
										--- END OF BLOCK #0 ---



									end
									--- END OF BLOCK #0 ---



								end
								--- END OF BLOCK #0 ---



							else

								-- Decompilation error in this vicinity:
								--- BLOCK #0 173-176, warpins: 2 ---
								slot0 = slot2
								slot0 = slot0[1]

								if slot0 == "COLLECTSHIP" then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 177-182, warpins: 1 ---
									slot0 = slot4
									slot0 = slot0.mediatorName
									slot1 = CollectionMediator
									slot1 = slot1.__cname

									if slot0 == slot1 then

										-- Decompilation error in this vicinity:
										--- BLOCK #0 183-195, warpins: 1 ---
										slot0 = slot1
										slot0 = slot0.m02
										slot1 = slot0
										slot0 = slot0.sendNotification
										slot2 = CollectionMediator
										slot2 = slot2.EVENT_OBTAIN_SKIP
										slot3 = {
											toggle = 2
										}
										slot4 = slot2
										slot4 = slot4[2]
										slot4 = slot4.shipGroupId
										slot3.displayGroupId = slot4

										slot0(slot1, slot2, slot3)
										--- END OF BLOCK #0 ---



									else

										-- Decompilation error in this vicinity:
										--- BLOCK #0 196-210, warpins: 1 ---
										slot0 = slot1
										slot0 = slot0.m02
										slot1 = slot0
										slot0 = slot0.sendNotification
										slot2 = GAME
										slot2 = slot2.GO_SCENE
										slot3 = SCENE
										slot3 = slot3.COLLECTSHIP
										slot4 = {
											toggle = 2
										}
										slot5 = slot2
										slot5 = slot5[2]
										slot5 = slot5.shipGroupId
										slot4.displayGroupId = slot5

										slot0(slot1, slot2, slot3, slot4)
										--- END OF BLOCK #0 ---



									end
									--- END OF BLOCK #0 ---



								else

									-- Decompilation error in this vicinity:
									--- BLOCK #0 211-223, warpins: 1 ---
									slot0 = slot1
									slot0 = slot0.m02
									slot1 = slot0
									slot0 = slot0.sendNotification
									slot2 = GAME
									slot2 = slot2.GO_SCENE
									slot3 = SCENE
									slot4 = slot2
									slot4 = slot4[1]
									slot3 = slot3[slot4]
									slot4 = slot2
									slot4 = slot4[2]

									slot0(slot1, slot2, slot3, slot4)
									--- END OF BLOCK #0 ---



								end
								--- END OF BLOCK #0 ---



							end
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 224-228, warpins: 9 ---
					slot0 = slot3
					slot1 = slot0
					slot0 = slot0.hide

					slot0(slot1)

					return
					--- END OF BLOCK #1 ---

					FLOW; TARGET BLOCK #2



					-- Decompilation error in this vicinity:
					--- BLOCK #2 229-229, warpins: 2 ---
					--- END OF BLOCK #2 ---

					FLOW; TARGET BLOCK #3



					-- Decompilation error in this vicinity:
					--- BLOCK #3 230-230, warpins: 2 ---
					--- END OF BLOCK #3 ---



				end

				slot11 = SFX_PANEL

				slot7(slot8, slot9, slot10, slot11)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 51-51, warpins: 2 ---
			--- END OF BLOCK #2 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 52-52, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end

	slot3(slot4, slot5)

	slot3 = slot0.obtainSkipList
	slot4 = slot3
	slot3 = slot3.align
	slot5 = slot1.list
	slot5 = #slot5

	slot3(slot4, slot5)

	slot4 = slot0
	slot3 = slot0.Loaded
	slot5 = slot1

	slot3(slot4, slot5)

	return
	--- END OF BLOCK #1 ---



end

function slot12(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot1 = slot0.helpPage
	slot1 = slot1 + 1
	slot0.helpPage = slot1
	slot1 = slot0.helpPage
	slot2 = 1

	if slot1 < slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-9, warpins: 1 ---
		slot1 = 1
		slot0.helpPage = slot1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-14, warpins: 2 ---
	slot1 = slot0.helpPage
	slot2 = slot0._helpList
	slot2 = slot2.childCount

	if slot2 < slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-16, warpins: 1 ---
		slot1 = 1
		slot0.helpPage = slot1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 17-21, warpins: 2 ---
	slot2 = slot0
	slot1 = slot0.switchHelpPage
	slot3 = slot0.helpPage

	slot1(slot2, slot3)

	return
	--- END OF BLOCK #2 ---



end

slot1.nextPage = slot12

function slot12(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot1 = slot0.helpPage
	slot1 = slot1 - 1
	slot0.helpPage = slot1
	slot1 = slot0.helpPage
	slot2 = 1

	if slot1 < slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-10, warpins: 1 ---
		slot1 = slot0._helpList
		slot1 = slot1.childCount
		slot0.helpPage = slot1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-15, warpins: 2 ---
	slot1 = slot0.helpPage
	slot2 = slot0._helpList
	slot2 = slot2.childCount

	if slot2 < slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-18, warpins: 1 ---
		slot1 = slot0._helpList
		slot1 = slot1.childCount
		slot0.helpPage = slot1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 19-23, warpins: 2 ---
	slot2 = slot0
	slot1 = slot0.switchHelpPage
	slot3 = slot0.helpPage

	slot1(slot2, slot3)

	return
	--- END OF BLOCK #2 ---



end

slot1.prePage = slot12

function slot12(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot2 = 1
	slot3 = slot0._helpList
	slot3 = slot3.childCount
	slot4 = 1

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-26, warpins: 0 ---
	for slot5 = slot2, slot3, slot4 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-14, warpins: 2 ---
		slot6 = slot0._helpList
		slot7 = slot6
		slot6 = slot6.GetChild
		slot8 = slot5 - 1
		slot6 = slot6(slot7, slot8)
		slot7 = setActive
		slot8 = slot6

		if slot1 ~= slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-16, warpins: 1 ---
			slot9 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 17-17, warpins: 1 ---
			slot9 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 18-26, warpins: 2 ---
		slot7(slot8, slot9)

		slot7 = setText
		slot9 = slot6
		slot8 = slot6.Find
		slot10 = "icon/corner/Text"
		slot8 = slot8(slot9, slot10)
		slot9 = slot5

		slot7(slot8, slot9)
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 27-27, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

slot1.switchHelpPage = slot12

function slot12(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-70, warpins: 1 ---
	slot2 = rtf
	slot3 = slot0._window
	slot2 = slot2(slot3)
	slot3 = slot0._defaultSize
	slot2.sizeDelta = slot3
	slot2 = rtf
	slot3 = slot0._helpPanel
	slot2 = slot2(slot3)
	slot3 = slot0._defaultHelpSize
	slot2.sizeDelta = slot3
	slot2 = true
	slot0.enable = slot2
	slot2 = slot0
	slot2 = slot2.DelegateInfo
	slot2 = slot2.New
	slot3 = slot0

	slot2(slot3)

	slot2 = setActive
	slot3 = slot0._msgPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._exchangeShipPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._itemPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._sigleItemPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._inputPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._obtainPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._otherPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._helpBgTF
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._helpPanel
	slot4 = slot1.helps

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._btnContainer
	slot4 = true

	slot2(slot3, slot4)

	slot2 = slot0.stopRemindToggle
	slot3 = false
	slot2.isOn = slot3
	slot2 = setActive
	slot3 = go
	slot4 = slot0.stopRemindToggle
	slot3 = slot3(slot4)
	slot4 = slot1.showStopRemind

	slot2(slot3, slot4)

	slot2 = slot0.stopRemindText
	slot3 = slot1.stopRamindContent

	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 71-73, warpins: 1 ---
		slot3 = i18n
		slot4 = "dont_remind_today"
		slot3 = slot3(slot4)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 74-86, warpins: 2 ---
	slot2.text = slot3
	slot2 = removeAllChildren
	slot3 = slot0._btnContainer

	slot2(slot3)

	slot0.settings = slot1
	slot2 = SetActive
	slot3 = slot0._go
	slot4 = true

	slot2(slot3, slot4)

	slot2 = slot0.settings
	slot2 = slot2.needCounter

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 87-87, warpins: 1 ---
		slot2 = false
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 88-97, warpins: 2 ---
	slot3 = setActive
	slot4 = slot0._countSelect
	slot5 = slot2

	slot3(slot4, slot5)

	slot3 = slot0.settings
	slot3 = slot3.numUpdate
	slot4 = slot0.settings
	slot4 = slot4.addNum

	if not slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 98-98, warpins: 1 ---
		slot4 = 1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 99-102, warpins: 2 ---
	slot5 = slot0.settings
	slot5 = slot5.maxNum

	if not slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 103-103, warpins: 1 ---
		slot5 = -1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 104-107, warpins: 2 ---
	slot6 = slot0.settings
	slot6 = slot6.defaultNum

	if not slot6 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 108-108, warpins: 1 ---
		slot6 = 1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 109-137, warpins: 2 ---
	slot7 = slot0._pageUtil
	slot8 = slot7
	slot7 = slot7.setNumUpdate

	function slot9(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		slot1 = slot0

		if slot1 ~= nil then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-8, warpins: 1 ---
			slot1 = slot0
			slot2 = slot1
			slot2 = slot2._countDescTxt
			slot3 = slot0

			slot1(slot2, slot3)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 9-9, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end

	slot7(slot8, slot9)

	slot7 = slot0._pageUtil
	slot8 = slot7
	slot7 = slot7.setAddNum
	slot9 = slot4

	slot7(slot8, slot9)

	slot7 = slot0._pageUtil
	slot8 = slot7
	slot7 = slot7.setMaxNum
	slot9 = slot5

	slot7(slot8, slot9)

	slot7 = slot0._pageUtil
	slot8 = slot7
	slot7 = slot7.setDefaultNum
	slot9 = slot6

	slot7(slot8, slot9)

	slot7 = setActive
	slot8 = slot0._sliders
	slot9 = slot0.settings
	slot9 = slot9.discount

	slot7(slot8, slot9)

	slot7 = slot0.settings
	slot7 = slot7.discount

	if slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 138-161, warpins: 1 ---
		slot7 = slot0._discount
		slot8 = slot7
		slot7 = slot7.GetComponent
		slot9 = typeof
		slot10 = Text
		slot7 = slot7(slot8, slot9(slot10))
		slot8 = slot0.settings
		slot8 = slot8.discount
		slot8 = slot8.discount
		slot9 = "%OFF"
		slot8 = slot8 .. slot9
		slot7.text = slot8
		slot7 = slot0._discountDate
		slot8 = slot7
		slot7 = slot7.GetComponent
		slot9 = typeof
		slot10 = Text
		slot7 = slot7(slot8, slot9(slot10))
		slot8 = slot0.settings
		slot8 = slot8.discount
		slot8 = slot8.date
		slot7.text = slot8
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 162-165, warpins: 2 ---
	slot7 = slot0.settings
	slot7 = slot7.hideNo

	if not slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 166-166, warpins: 1 ---
		slot7 = false
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 167-170, warpins: 2 ---
	slot8 = slot0.settings
	slot8 = slot8.hideYes

	if not slot8 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 171-171, warpins: 1 ---
		slot8 = false
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 172-175, warpins: 2 ---
	slot9 = slot0.settings
	slot9 = slot9.modal

	if not slot9 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 176-176, warpins: 1 ---
		slot9 = false
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 177-180, warpins: 2 ---
	slot10 = slot0.settings
	slot10 = slot10.onNo

	if not slot10 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 181-181, warpins: 1 ---
		function slot10()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-1, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #9 ---

	FLOW; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #10 182-183, warpins: 2 ---
	if not slot9 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 184-190, warpins: 1 ---
		slot11 = onButton
		slot12 = slot0
		slot13 = slot0._go

		function slot14()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			slot0 = slot0
			slot0 = slot0.settings
			slot0 = slot0.onClose

			if slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 6-10, warpins: 1 ---
				slot0 = slot0
				slot0 = slot0.settings
				slot0 = slot0.onClose

				slot0()
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-12, warpins: 1 ---
				slot0 = slot1

				slot0()
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 13-17, warpins: 2 ---
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.hide

			slot0(slot1)

			return
			--- END OF BLOCK #1 ---



		end

		slot15 = SFX_CANCEL

		slot11(slot12, slot13, slot14, slot15)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 191-193, warpins: 1 ---
		slot11 = removeOnButton
		slot12 = slot0._go

		slot11(slot12)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #10 ---

	FLOW; TARGET BLOCK #11



	-- Decompilation error in this vicinity:
	--- BLOCK #11 194-196, warpins: 2 ---
	slot11, slot12 = nil

	if not slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 197-203, warpins: 1 ---
		slot14 = slot0
		slot13 = slot0.createBtn
		slot15 = {}
		slot16 = slot0.settings
		slot16 = slot16.noText

		if not slot16 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 204-205, warpins: 1 ---
			slot16 = slot1
			slot16 = slot16.TEXT_CANCEL
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 206-210, warpins: 2 ---
		slot15.text = slot16
		slot16 = slot0.settings
		slot16 = slot16.noBtnType

		if not slot16 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 211-212, warpins: 1 ---
			slot16 = slot1
			slot16 = slot16.BUTTON_GRAY
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 213-217, warpins: 2 ---
		slot15.btnType = slot16
		slot15.onCallback = slot10
		slot16 = slot1.noSound

		if not slot16 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 218-218, warpins: 1 ---
			slot16 = SFX_CANCEL
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 219-221, warpins: 2 ---
		slot15.sound = slot16
		slot13 = slot13(slot14, slot15)
		slot11 = slot13
		--- END OF BLOCK #3 ---



	end

	--- END OF BLOCK #11 ---

	FLOW; TARGET BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #12 222-223, warpins: 2 ---
	if not slot8 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 224-230, warpins: 1 ---
		slot14 = slot0
		slot13 = slot0.createBtn
		slot15 = {}
		slot16 = slot0.settings
		slot16 = slot16.yesText

		if not slot16 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 231-232, warpins: 1 ---
			slot16 = slot1
			slot16 = slot16.TEXT_CONFIRM
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 233-237, warpins: 2 ---
		slot15.text = slot16
		slot16 = slot0.settings
		slot16 = slot16.yesBtnType

		if not slot16 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 238-239, warpins: 1 ---
			slot16 = slot1
			slot16 = slot16.BUTTON_BLUE
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 240-244, warpins: 2 ---
		slot15.btnType = slot16
		slot16 = slot0.settings
		slot16 = slot16.onYes

		if not slot16 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 245-245, warpins: 1 ---
			function slot16()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-1, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 246-249, warpins: 2 ---
		slot15.onCallback = slot16
		slot16 = slot1.yesSound

		if not slot16 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 250-250, warpins: 1 ---
			slot16 = SFX_CONFIRM
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 251-253, warpins: 2 ---
		slot15.sound = slot16
		slot13 = slot13(slot14, slot15)
		slot12 = slot13
		--- END OF BLOCK #4 ---



	end

	--- END OF BLOCK #12 ---

	FLOW; TARGET BLOCK #13



	-- Decompilation error in this vicinity:
	--- BLOCK #13 254-257, warpins: 2 ---
	slot13 = slot0.settings
	slot13 = slot13.yseBtnLetf

	if slot13 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 258-260, warpins: 1 ---
		slot14 = slot12
		slot13 = slot12.SetAsFirstSibling

		slot13(slot14)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #13 ---

	FLOW; TARGET BLOCK #14



	-- Decompilation error in this vicinity:
	--- BLOCK #14 261-266, warpins: 2 ---
	slot13 = nil
	slot14 = slot0.settings
	slot14 = slot14.type
	slot15 = MSGBOX_TYPE_HELP

	if slot14 == slot15 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 267-271, warpins: 1 ---
		slot14 = slot0.settings
		slot14 = slot14.helps
		slot14 = slot14.pageMode

		if slot14 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 272-277, warpins: 1 ---
			slot14 = slot0.settings
			slot14 = slot14.helps
			slot14 = #slot14
			slot15 = 1

			if slot14 > slot15 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 278-291, warpins: 1 ---
				slot15 = slot0
				slot14 = slot0.createBtn
				slot16 = {
					noQuit = true
				}
				slot17 = slot1
				slot17 = slot17.BUTTON_PREPAGE
				slot16.btnType = slot17

				function slot17()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-5, warpins: 1 ---
					slot0 = slot0
					slot1 = slot0
					slot0 = slot0.prePage

					slot0(slot1)

					return
					--- END OF BLOCK #0 ---



				end

				slot16.onCallback = slot17
				slot17 = SFX_CANCEL
				slot16.sound = slot17

				slot14(slot15, slot16)

				slot14 = slot0.settings
				slot14 = slot14.helps
				slot13 = #slot14
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #14 ---

	FLOW; TARGET BLOCK #15



	-- Decompilation error in this vicinity:
	--- BLOCK #15 292-295, warpins: 4 ---
	slot14 = slot0.settings
	slot14 = slot14.custom

	if slot14 ~= nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 296-300, warpins: 1 ---
		slot14 = ipairs
		slot15 = slot0.settings
		slot15 = slot15.custom
		slot14, slot15, slot16 = slot14(slot15)

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 301-306, warpins: 0 ---
		for slot17, slot18 in slot14, slot15, slot16 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 301-304, warpins: 1 ---
			slot20 = slot0
			slot19 = slot0.createBtn
			slot21 = slot18

			slot19(slot20, slot21)
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 305-306, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #15 ---

	FLOW; TARGET BLOCK #16



	-- Decompilation error in this vicinity:
	--- BLOCK #16 307-308, warpins: 2 ---
	if not slot13 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 309-309, warpins: 1 ---
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 310-312, warpins: 1 ---
		slot14 = 1

		if slot13 > slot14 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 313-323, warpins: 1 ---
			slot15 = slot0
			slot14 = slot0.createBtn
			slot16 = {
				noQuit = true
			}
			slot17 = slot1
			slot17 = slot17.BUTTON_NEXTPAGE
			slot16.btnType = slot17

			function slot17()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-5, warpins: 1 ---
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.nextPage

				slot0(slot1)

				return
				--- END OF BLOCK #0 ---



			end

			slot16.onCallback = slot17
			slot17 = SFX_CONFIRM
			slot16.sound = slot17

			slot14(slot15, slot16)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #16 ---

	FLOW; TARGET BLOCK #17



	-- Decompilation error in this vicinity:
	--- BLOCK #17 324-338, warpins: 3 ---
	slot14 = setActive
	slot15 = slot0._closeBtn
	slot16 = slot1.hideClose
	slot16 = not slot16

	slot14(slot15, slot16)

	slot14 = onButton
	slot15 = slot0
	slot16 = slot0._closeBtn

	function slot17()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		slot0 = slot0
		slot0 = slot0.settings
		slot0 = slot0.onClose
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.hide

		slot1(slot2)

		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-12, warpins: 1 ---
			slot1 = slot0

			slot1()
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-14, warpins: 1 ---
			slot1 = slot1

			slot1()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 15-15, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end

	slot18 = SFX_CANCEL

	slot14(slot15, slot16, slot17, slot18)

	slot14 = slot0.settings
	slot14 = slot14.title

	if not slot14 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 339-340, warpins: 1 ---
		slot14 = slot1
		slot14 = slot14.TITLE_INFORMATION
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #17 ---

	FLOW; TARGET BLOCK #18



	-- Decompilation error in this vicinity:
	--- BLOCK #18 341-344, warpins: 2 ---
	slot15 = 0
	slot16 = slot0._titleList
	slot16 = slot16.transform
	slot16 = slot16.childCount

	--- END OF BLOCK #18 ---

	FLOW; TARGET BLOCK #19



	-- Decompilation error in this vicinity:
	--- BLOCK #19 345-346, warpins: 2 ---
	--- END OF BLOCK #19 ---

	FLOW; TARGET BLOCK #20



	-- Decompilation error in this vicinity:
	--- BLOCK #20 347-365, warpins: 0 ---
	while slot15 < slot16 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 347-347, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 348-358, warpins: 1 ---
		slot17 = slot0._titleList
		slot17 = slot17.transform
		slot18 = slot17
		slot17 = slot17.GetChild
		slot19 = slot15
		slot17 = slot17(slot18, slot19)
		slot18 = SetActive
		slot19 = slot17
		slot20 = slot17.name

		if slot20 ~= slot14 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 359-360, warpins: 1 ---
			slot20 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 361-361, warpins: 1 ---
			slot20 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 362-364, warpins: 2 ---
		slot18(slot19, slot20)

		slot15 = slot15 + 1
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 365-365, warpins: 2 ---
		--- END OF BLOCK #3 ---



	end

	--- END OF BLOCK #20 ---

	FLOW; TARGET BLOCK #21



	-- Decompilation error in this vicinity:
	--- BLOCK #21 365-376, warpins: 1 ---
	slot17 = slot0._go
	slot17 = slot17.transform
	slot17 = slot17.localPosition
	slot18 = slot0._go
	slot18 = slot18.transform
	slot19 = Vector3
	slot20 = slot17.x
	slot21 = slot17.y
	slot22 = slot0.settings
	slot22 = slot22.zIndex

	if not slot22 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 377-377, warpins: 1 ---
		slot22 = 0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #21 ---

	FLOW; TARGET BLOCK #22



	-- Decompilation error in this vicinity:
	--- BLOCK #22 378-381, warpins: 2 ---
	slot19 = slot19(slot20, slot21, slot22)
	slot18.localPosition = slot19

	return
	--- END OF BLOCK #22 ---



end

slot1.commonSetting = slot12

function slot12(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot2 = slot1.btnType

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-5, warpins: 1 ---
		slot2 = slot0
		slot2 = slot2.BUTTON_BLUE
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-8, warpins: 2 ---
	slot3 = slot1.onCallback

	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-9, warpins: 1 ---
		function slot3()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-1, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 10-25, warpins: 2 ---
	slot4 = slot1.noQuit
	slot5 = slot0._go
	slot5 = slot5.transform
	slot6 = slot5
	slot5 = slot5.Find
	slot7 = "custom_btn_list/custom_button_"
	slot8 = slot2
	slot7 = slot7 .. slot8
	slot5 = slot5(slot6, slot7)
	slot6 = cloneTplTo
	slot7 = slot5
	slot8 = slot0._btnContainer
	slot6 = slot6(slot7, slot8)
	slot7 = slot1.label

	if slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 26-30, warpins: 1 ---
		slot7 = go
		slot8 = slot6
		slot7 = slot7(slot8)
		slot8 = slot1.label
		slot7.name = slot8
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 31-37, warpins: 2 ---
	slot7 = SetActive
	slot8 = slot6
	slot9 = true

	slot7(slot8, slot9)

	slot7 = slot1.scale

	if slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 38-41, warpins: 1 ---
		slot7 = slot1.scale
		slot7 = slot7.x

		if not slot7 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 42-42, warpins: 1 ---
			slot7 = 1
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 43-46, warpins: 2 ---
		slot8 = slot1.scale
		slot8 = slot8.y

		if not slot8 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 47-47, warpins: 1 ---
			slot8 = 1
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 48-52, warpins: 2 ---
		slot9 = Vector2
		slot10 = slot7
		slot11 = slot8
		slot9 = slot9(slot10, slot11)
		slot6.localScale = slot9
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 53-56, warpins: 2 ---
	slot7 = slot0
	slot7 = slot7.BUTTON_MEDAL

	if slot2 == slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 57-64, warpins: 1 ---
		slot7 = setText
		slot9 = slot6
		slot8 = slot6.Find
		slot10 = "text"
		slot8 = slot8(slot9, slot10)
		slot9 = slot1.text

		slot7(slot8, slot9)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 65-68, warpins: 1 ---
		slot7 = slot0
		slot7 = slot7.BUTTON_RETREAT

		if slot2 ~= slot7 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 69-72, warpins: 1 ---
			slot7 = slot0
			slot7 = slot7.BUTTON_PREPAGE

			if slot2 ~= slot7 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 73-76, warpins: 1 ---
				slot7 = slot0
				slot7 = slot7.BUTTON_NEXTPAGE

				if slot2 ~= slot7 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 77-81, warpins: 1 ---
					slot8 = slot0
					slot7 = slot0.updateButton
					slot9 = slot6
					slot10 = slot1.text

					slot7(slot8, slot9, slot10)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 82-85, warpins: 5 ---
	slot7 = slot0
	slot7 = slot7.BUTTON_BLUE_WITH_ICON

	if slot2 == slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 86-88, warpins: 1 ---
		slot7 = slot1.iconName

		if slot7 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 89-101, warpins: 1 ---
			slot8 = slot6
			slot7 = slot6.Find
			slot9 = "ticket/icon"
			slot7 = slot7(slot8, slot9)
			slot8 = setImageSprite
			slot9 = slot7
			slot10 = LoadSprite
			slot11 = slot1.iconName
			slot11 = slot11[1]
			slot12 = slot1.iconName
			slot12 = slot12[2]

			slot8(slot9, slot10(slot11, slot12))
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 102-104, warpins: 3 ---
	slot7 = slot1.hideEvent

	if not slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 105-111, warpins: 1 ---
		slot7 = onButton
		slot8 = slot0
		slot9 = slot6

		function slot10()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			slot0 = type
			slot1 = slot0
			slot0 = slot0(slot1)

			if slot0 == "function" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 6-9, warpins: 1 ---
				slot0 = slot0
				slot0 = slot0()

				if not slot0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 10-19, warpins: 1 ---
					slot0 = SetActive
					slot1 = slot1
					slot1 = slot1._go
					slot2 = false

					slot0(slot1, slot2)

					slot0 = slot1
					slot1 = slot0
					slot0 = slot0.Clear

					slot0(slot1)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 20-21, warpins: 1 ---
					return
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 22-24, warpins: 1 ---
				slot0 = slot0

				if not slot0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 25-33, warpins: 1 ---
					slot0 = SetActive
					slot1 = slot1
					slot1 = slot1._go
					slot2 = false

					slot0(slot1, slot2)

					slot0 = slot1
					slot1 = slot0
					slot0 = slot0.Clear

					slot0(slot1)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 34-36, warpins: 4 ---
			slot0 = slot2

			slot0()

			return
			--- END OF BLOCK #1 ---



		end

		slot11 = slot1.sound

		if not slot11 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 112-112, warpins: 1 ---
			slot11 = SFX_CONFIRM
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 113-113, warpins: 2 ---
		slot7(slot8, slot9, slot10, slot11)
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 114-116, warpins: 2 ---
	slot7 = slot1.sibling

	if slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 117-120, warpins: 1 ---
		slot8 = slot6
		slot7 = slot6.SetSiblingIndex
		slot9 = slot1.sibling

		slot7(slot8, slot9)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 121-122, warpins: 2 ---
	return slot6
	--- END OF BLOCK #8 ---



end

slot1.createBtn = slot12

function slot12(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot3 = slot0
	slot3 = slot3[slot2]
	slot5 = slot1
	slot4 = slot1.Find
	slot6 = "pic"
	slot4 = slot4(slot5, slot6)
	slot5 = IsNil
	slot6 = slot4
	slot5 = slot5(slot6)

	if slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-12, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 13-14, warpins: 2 ---
	if slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-21, warpins: 1 ---
		slot5 = setText
		slot6 = slot4
		slot7 = i18n
		slot8 = slot3

		slot5(slot6, slot7(slot8))
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 22-28, warpins: 1 ---
		slot5 = string
		slot5 = slot5.len
		slot6 = slot2
		slot5 = slot5(slot6)
		slot6 = 12

		if slot5 > slot6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 29-36, warpins: 1 ---
			slot5 = GetComponent
			slot6 = slot4
			slot7 = typeof
			slot8 = Text
			slot5 = slot5(slot6, slot7(slot8))
			slot6 = true
			slot5.resizeTextForBestFit = slot6
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 37-40, warpins: 2 ---
		slot5 = setText
		slot6 = slot4
		slot7 = slot2

		slot5(slot6, slot7)
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 41-41, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

slot1.updateButton = slot12

function slot12(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot2 = slot1.parent

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-10, warpins: 1 ---
		slot2 = setParent
		slot3 = slot0._tf
		slot4 = slot1.parent

		slot2(slot3, slot4)

		slot2 = slot1.canvasOrder

		if slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 11-21, warpins: 1 ---
			slot2 = GetComponent
			slot3 = slot0._tf
			slot4 = typeof
			slot5 = Canvas
			slot2 = slot2(slot3, slot4(slot5))
			slot3 = slot2.sortingOrder
			slot0.originCanvasOrder = slot3
			slot3 = slot1.canvasOrder
			slot2.sortingOrder = slot3
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 22-37, warpins: 1 ---
		slot2 = slot0
		slot2 = slot2.UIMgr
		slot2 = slot2.GetInstance
		slot2 = slot2()
		slot3 = slot2
		slot2 = slot2.BlurPanel
		slot4 = slot0._tf
		slot5 = false
		slot6 = {}
		slot7 = slot1.groupName
		slot6.groupName = slot7
		slot7 = slot1.weight
		slot6.weight = slot7
		slot7 = slot1.blurLevelCamera
		slot6.blurLevelCamera = slot7

		slot2(slot3, slot4, slot5, slot6)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 38-45, warpins: 3 ---
	slot2 = slot0
	slot2 = slot2.m02
	slot3 = slot2
	slot2 = slot2.sendNotification
	slot4 = GAME
	slot4 = slot4.OPEN_MSGBOX_DONE

	slot2(slot3, slot4)

	return
	--- END OF BLOCK #1 ---



end

slot1.Loaded = slot12

function slot12(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-60, warpins: 1 ---
	slot1 = rtf
	slot2 = slot0._window
	slot1 = slot1(slot2)
	slot2 = slot0._defaultSize
	slot1.sizeDelta = slot2
	slot1 = rtf
	slot2 = slot0._helpPanel
	slot1 = slot1(slot2)
	slot2 = slot0._defaultHelpSize
	slot1.sizeDelta = slot2
	slot1 = setAnchoredPosition
	slot2 = slot0._window
	slot3 = {
		x = 0,
		y = 0
	}

	slot1(slot2, slot3)

	slot1 = setAnchoredPosition
	slot2 = slot0._btnContainer
	slot3 = {
		x = 0,
		y = 0
	}

	slot1(slot2, slot3)

	slot1 = setAnchoredPosition
	slot2 = slot0._helpPanel
	slot3 = {}
	slot4 = slot0._defaultHelpPos
	slot4 = slot4.x
	slot3.x = slot4
	slot4 = slot0._defaultHelpPos
	slot4 = slot4.y
	slot3.y = slot4

	slot1(slot2, slot3)

	slot1 = GetComponent
	slot2 = slot0._helpPanel
	slot3 = typeof
	slot4 = ScrollRect
	slot1 = slot1(slot2, slot3(slot4))
	slot2 = true
	slot1.enabled = slot2
	slot2 = setActive
	slot3 = slot0._top
	slot4 = true

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = findTF
	slot4 = slot0._window
	slot5 = "bg"
	slot3 = slot3(slot4, slot5)
	slot4 = true

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = findTF
	slot4 = slot0._sigleItemPanel
	slot5 = "icon_bg/own"
	slot3 = slot3(slot4, slot5)
	slot4 = false

	slot2(slot3, slot4)

	slot2 = 0
	slot3 = slot0._helpList
	slot3 = slot3.childCount
	slot3 = slot3 - 1
	slot4 = 1

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 61-78, warpins: 0 ---
	for slot5 = slot2, slot3, slot4 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 61-78, warpins: 2 ---
		slot6 = slot0._helpList
		slot7 = slot6
		slot6 = slot6.GetChild
		slot8 = slot5
		slot6 = slot6(slot7, slot8)
		slot7 = slot6
		slot6 = slot6.Find
		slot8 = "icon"
		slot6 = slot6(slot7, slot8)
		slot7 = slot6
		slot6 = slot6.GetComponent
		slot8 = typeof
		slot9 = Image
		slot6 = slot6(slot7, slot8(slot9))
		slot7 = nil
		slot6.sprite = slot7
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 79-83, warpins: 1 ---
	slot2 = slot0._scrollTxts
	slot2 = #slot2
	slot3 = 1
	slot4 = -1

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 84-98, warpins: 0 ---
	for slot5 = slot2, slot3, slot4 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 84-87, warpins: 2 ---
		slot6 = slot0._scrollTxts
		slot6 = slot6[slot5]

		if slot6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 88-97, warpins: 1 ---
			slot6 = slot0._scrollTxts
			slot6 = slot6[slot5]
			slot7 = slot6
			slot6 = slot6.destroy

			slot6(slot7)

			slot6 = table
			slot6 = slot6.remove
			slot7 = slot0._scrollTxts
			slot8 = slot5

			slot6(slot7, slot8)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 98-98, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 99-102, warpins: 1 ---
	slot2 = pairs
	slot3 = slot0.pools
	slot2, slot3, slot4 = slot2(slot3)

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 103-114, warpins: 0 ---
	for slot5, slot6 in slot2, slot3, slot4 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 103-104, warpins: 1 ---
		if slot6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 105-112, warpins: 1 ---
			slot7 = PoolMgr
			slot7 = slot7.GetInstance
			slot7 = slot7()
			slot8 = slot7
			slot7 = slot7.ReturnUI
			slot9 = slot6.name
			slot10 = slot6

			slot7(slot8, slot9, slot10)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 113-114, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 115-120, warpins: 1 ---
	slot2 = {}
	slot0.pools = slot2
	slot2 = pairs
	slot3 = slot0.timers
	slot2, slot3, slot4 = slot2(slot3)

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 121-125, warpins: 0 ---
	for slot5, slot6 in slot2, slot3, slot4 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 121-123, warpins: 1 ---
		slot8 = slot6
		slot7 = slot6.Stop

		slot7(slot8)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 124-125, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 126-138, warpins: 1 ---
	slot2 = {}
	slot0.timers = slot2
	slot2 = slot0
	slot2 = slot2.DelegateInfo
	slot2 = slot2.Dispose
	slot3 = slot0

	slot2(slot3)

	slot2 = removeAllChildren
	slot3 = slot0._btnContainer

	slot2(slot3)

	slot2 = slot0.settings

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 139-142, warpins: 1 ---
		slot2 = slot0.settings
		slot2 = slot2.parent

		if slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 143-159, warpins: 1 ---
			slot2 = slot0
			slot2 = slot2.UIMgr
			slot2 = slot2.GetInstance
			slot2 = slot2()
			slot3 = slot2
			slot2 = slot2.UnblurPanel
			slot4 = slot0._tf
			slot5 = slot0
			slot5 = slot5.UIMgr
			slot5 = slot5.GetInstance
			slot5 = slot5()
			slot5 = slot5.OverlayMain

			slot2(slot3, slot4, slot5)

			slot2 = slot0.settings
			slot2 = slot2.canvasOrder

			if slot2 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 160-168, warpins: 1 ---
				slot2 = GetComponent
				slot3 = slot0._tf
				slot4 = typeof
				slot5 = Canvas
				slot2 = slot2(slot3, slot4(slot5))
				slot3 = slot0.originCanvasOrder
				slot2.sortingOrder = slot3
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 169-181, warpins: 2 ---
		slot2 = slot0
		slot2 = slot2.UIMgr
		slot2 = slot2.GetInstance
		slot2 = slot2()
		slot3 = slot2
		slot2 = slot2.UnblurPanel
		slot4 = slot0._tf
		slot5 = slot0
		slot5 = slot5.UIMgr
		slot5 = slot5.GetInstance
		slot5 = slot5()
		slot5 = slot5.OverlayMain

		slot2(slot3, slot4, slot5)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 182-190, warpins: 3 ---
	slot2 = slot0.contentText
	slot3 = slot2
	slot2 = slot2.RemoveAllListeners

	slot2(slot3)

	slot2 = nil
	slot0.settings = slot2
	slot2 = false
	slot0.enable = slot2

	return
	--- END OF BLOCK #9 ---



end

slot1.Clear = slot12

function slot12(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot2 = slot1.type

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		slot2 = MSGBOX_TYPE_NORMAL
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-7, warpins: 2 ---
	slot3 = MSGBOX_TYPE_NORMAL

	if slot2 == slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-12, warpins: 1 ---
		slot3 = slot0
		slot4 = slot0
		slot5 = slot1

		slot3(slot4, slot5)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-15, warpins: 1 ---
		slot3 = MSGBOX_TYPE_INPUT

		if slot2 == slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-20, warpins: 1 ---
			slot3 = slot1
			slot4 = slot0
			slot5 = slot1

			slot3(slot4, slot5)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 21-23, warpins: 1 ---
			slot3 = MSGBOX_TYPE_SINGLE_ITEM

			if slot2 == slot3 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 24-28, warpins: 1 ---
				slot3 = slot2
				slot4 = slot0
				slot5 = slot1

				slot3(slot4, slot5)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 29-31, warpins: 1 ---
				slot3 = MSGBOX_TYPE_EXCHANGE

				if slot2 == slot3 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 32-36, warpins: 1 ---
					slot3 = slot3
					slot4 = slot0
					slot5 = slot1

					slot3(slot4, slot5)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 37-39, warpins: 1 ---
					slot3 = MSGBOX_TYPE_DROP_ITEM

					if slot2 == slot3 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 40-44, warpins: 1 ---
						slot3 = slot4
						slot4 = slot0
						slot5 = slot1

						slot3(slot4, slot5)
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 45-47, warpins: 1 ---
						slot3 = MSGBOX_TYPE_ITEM_BOX

						if slot2 == slot3 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 48-52, warpins: 1 ---
							slot3 = slot5
							slot4 = slot0
							slot5 = slot1

							slot3(slot4, slot5)
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 53-55, warpins: 1 ---
							slot3 = MSGBOX_TYPE_HELP

							if slot2 == slot3 then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 56-60, warpins: 1 ---
								slot3 = slot6
								slot4 = slot0
								slot5 = slot1

								slot3(slot4, slot5)
								--- END OF BLOCK #0 ---



							else

								-- Decompilation error in this vicinity:
								--- BLOCK #0 61-63, warpins: 1 ---
								slot3 = MSGBOX_TYPE_SECONDPWD

								if slot2 == slot3 then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 64-73, warpins: 1 ---
									slot3 = PoolMgr
									slot3 = slot3.GetInstance
									slot3 = slot3()
									slot4 = slot3
									slot3 = slot3.GetUI
									slot5 = "Msgbox4SECPWD"
									slot6 = true

									function slot7(slot0)

										-- Decompilation error in this vicinity:
										--- BLOCK #0 1-7, warpins: 1 ---
										slot1 = slot0
										slot1 = slot1.pools
										slot1.SedondaryUI = slot0
										slot1 = slot1
										slot1 = slot1.onPreShow

										if slot1 then

											-- Decompilation error in this vicinity:
											--- BLOCK #0 8-10, warpins: 1 ---
											slot1 = slot1
											slot1 = slot1.onPreShow

											slot1()
											--- END OF BLOCK #0 ---



										end

										--- END OF BLOCK #0 ---

										FLOW; TARGET BLOCK #1



										-- Decompilation error in this vicinity:
										--- BLOCK #1 11-23, warpins: 2 ---
										slot1 = slot1
										slot1.secondaryUI = slot0
										slot1 = SetParent
										slot2 = slot0
										slot3 = slot0
										slot3 = slot3._otherPanel
										slot4 = false

										slot1(slot2, slot3, slot4)

										slot1 = slot2
										slot2 = slot0
										slot3 = slot1

										slot1(slot2, slot3)

										return
										--- END OF BLOCK #1 ---



									end

									slot3(slot4, slot5, slot6, slot7)
									--- END OF BLOCK #0 ---



								else

									-- Decompilation error in this vicinity:
									--- BLOCK #0 74-76, warpins: 1 ---
									slot3 = MSGBOX_TYPE_OBTAIN

									if slot2 == slot3 then

										-- Decompilation error in this vicinity:
										--- BLOCK #0 77-79, warpins: 1 ---
										slot3 = slot1.title

										if not slot3 then

											-- Decompilation error in this vicinity:
											--- BLOCK #0 80-81, warpins: 1 ---
											slot3 = slot8
											slot3 = slot3.TITLE_OBTAIN
											--- END OF BLOCK #0 ---



										end

										--- END OF BLOCK #0 ---

										FLOW; TARGET BLOCK #1



										-- Decompilation error in this vicinity:
										--- BLOCK #1 82-86, warpins: 2 ---
										slot1.title = slot3
										slot3 = slot9
										slot4 = slot0
										slot5 = slot1

										slot3(slot4, slot5)
										--- END OF BLOCK #1 ---



									end
									--- END OF BLOCK #0 ---



								end
								--- END OF BLOCK #0 ---



							end
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 87-88, warpins: 10 ---
	return
	--- END OF BLOCK #2 ---



end

slot1.ShowMsgBox = slot12

function slot12(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot1 = slot0.enable

	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-20, warpins: 2 ---
	slot1 = slot0._go
	slot2 = slot1
	slot1 = slot1.SetActive
	slot3 = false

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.Clear

	slot1(slot2)

	slot1 = slot0
	slot1 = slot1.m02
	slot2 = slot1
	slot1 = slot1.sendNotification
	slot3 = GAME
	slot3 = slot3.CLOSE_MSGBOX_DONE

	slot1(slot2, slot3)

	return
	--- END OF BLOCK #1 ---



end

slot1.hide = slot12

return
