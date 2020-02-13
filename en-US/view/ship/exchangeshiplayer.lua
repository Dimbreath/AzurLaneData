slot0 = class("ExchangeShipLayer", import("..base.BaseUI"))
slot0.PAGE_SHIP = 1
slot0.PAGE_ITEM = 2

function slot0.getUIName(slot0)
	return "exchangeShipUI"
end

function slot0.setExchangeList(slot0, slot1, slot2, slot3)
	slot0.exchangeList = slot1
	slot0.flashTime = slot2
	slot0.flagShipTime = slot3
end

function slot0.setExchangeItemList(slot0, slot1, slot2)
	slot0.exchangeItemList = slot2
	slot0.refreshItemTime = slot1
end

function slot0.setItemVOs(slot0, slot1)
	slot0.itemVO = slot1 or Item.New({
		count = 0,
		id = ITEM_ID_SILVER_HOOK
	})

	setText(slot0.quickCountTF, slot0.itemVO.count)
end

function slot0.init(slot0)
	slot0.paintingTF = slot0:findTF("painting")
	slot0.rarityTF = slot0:findTF("painting/rarity"):GetComponent(typeof(Image))
	slot0.exchangeBtn = slot0:findTF("painting/exchange_btn")
	slot0.shipTypeTF = slot0:findTF("painting/name_bg/shiptype"):GetComponent(typeof(Image))
	slot0.nameTF = slot0:findTF("painting/name_bg/name"):GetComponent(typeof(Text))
	slot0.resIconTF = slot0:findTF("painting/name_bg/res_icon"):GetComponent(typeof(Image))
	slot0.resCountTF = slot0:findTF("painting/name_bg/res_icon/Text"):GetComponent(typeof(Text))
	slot0.shipsContainer = slot0:findTF("frame/content_ship")
	slot0.shipsScrolltxt = {}
	slot0.itemContainer = slot0:findTF("frame/content_item")
	slot0.itemScrolltxt = {}
	slot0.quickCountTF = slot0:findTF("quick_count/value")
	slot0.quickLableTF = slot0:findTF("quick_count/label")
	slot0.leftTimeTF = slot0:findTF("title/ship_timer")
	slot0.bottomTF = slot0:findTF("frame/bottom")
	slot0.flagShipchangeTimeTF = slot0:findTF("left_time/contain/Text", slot0.paintingTF):GetComponent(typeof(Text))
	slot0.itemExchangeCfg = pg.item_medal_fetch
end

function slot0.didEnter(slot0)
	slot0.toggles = {
		[slot0.PAGE_SHIP] = slot0.bottomTF:Find("ship_btn"),
		[slot0.PAGE_ITEM] = slot0.bottomTF:Find("item_btn")
	}

	onToggle(slot0, slot0.toggles[slot0.PAGE_SHIP], function (slot0)
		if slot0 then
			slot0:switchPage(slot1.PAGE_SHIP)
		end

		slot0.toggles[slot1.PAGE_SHIP]:GetComponent(typeof(Image)).color = Color(1, 1, 1, (slot0 and 0) or 1)
	end, SFX_PANEL)
	onToggle(slot0, slot0.toggles[slot0.PAGE_ITEM], function (slot0)
		if slot0 then
			slot0:switchPage(slot1.PAGE_ITEM)
		end

		slot0.toggles[slot1.PAGE_ITEM]:GetComponent(typeof(Image)).color = Color(1, 1, 1, (slot0 and 0) or 1)
	end, SFX_PANEL)
	triggerToggle(slot0.toggles[slot0.contextData.page or slot0.PAGE_SHIP], true)
end

function slot0.onBackPressed(slot0)
	slot0:emit(slot0.ON_BACK_PRESSED, true)
end

function slot0.switchPage(slot0, slot1)
	if slot1 == slot0.PAGE_SHIP then
		if slot0.exchangeList and not slot0.isInitExchangeShip then
			slot0.isInitExchangeShip = true

			slot0:updateExchangeShips(slot0.exchangeList, slot0.flashTime, slot0.flagShipTime)
		elseif not slot0.exchangeList then
			slot0:emit(ExchangeShipMediator.GET_EXCHANGE_SHIPS, 0)
		end
	elseif slot1 == slot0.PAGE_ITEM then
		if slot0.exchangeItemList and not slot0.isInitExchangeItem then
			slot0.isInitExchangeItem = true

			slot0:updateExchangeItems(slot0.refreshItemTime, slot0.exchangeItemList)
		elseif not slot0.exchangeItemList then
			slot0:emit(ExchangeShipMediator.GET_EXCHANGE_ITEMS)
		end
	end
end

function slot0.updateExchangeItems(slot0, slot1, slot2)
	slot0.exchangeItemList = slot2
	slot0.refreshItemTime = slot1

	for slot6, slot7 in pairs(slot0.exchangeItemList) do
		slot0:updateItem(slot6, slot7)
	end

	slot0:addItemTimer(slot0.refreshItemTime)
end

function slot0.addItemTimer(slot0, slot1)
	slot2 = slot0:findTF("title/item_timer"):GetComponent(typeof(Text))

	if slot0.itemRefreshTimer then
		slot0.itemRefreshTimer:Stop()

		slot0.itemRefreshTimer = nil
	end

	slot0.itemRefreshTimer = Timer.New(function ()
		if (slot0 + 1) - pg.TimeMgr.GetInstance():GetServerTime() <= 0 then
			slot1.text = ""

			slot2.itemRefreshTimer:Stop()

			slot2.itemRefreshTimer.itemRefreshTimer = nil
		else
			pg.TimeMgr.GetInstance():DescCDTime(slot0).text = pg.TimeMgr.GetInstance().DescCDTime(slot0)
		end
	end, 1, -1)

	slot0.itemRefreshTimer:Start()
	slot0.itemRefreshTimer.func()
end

function slot0.updateItem(slot0, slot1, slot2)
	updateDrop(slot0.itemContainer:GetChild(slot1 - 1).Find(slot4, "icon"), {
		type = DROP_TYPE_ITEM,
		id = slot0.itemExchangeCfg[slot2.id].itemid,
		count = slot0.itemExchangeCfg[slot2.id].itemquantity
	})

	if not slot0.itemScrolltxt[slot1] then
		slot0.itemScrolltxt[slot1] = ScrollTxt:changeToScroll(slot4:Find("icon/name"))
	end

	slot0.itemScrolltxt[slot1]:setText(getText(slot4:Find("icon/name")))
	setText(slot0:findTF("price_bg/Text", slot4), slot3.price)
	slot0:activeItem(slot1, slot2.isFetched)
	onButton(slot0, slot4, function ()
		if slot0.isFetched then
			return
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			yesText = "text_exchange",
			showOwned = true,
			hideNo = true,
			type = MSGBOX_TYPE_SINGLE_ITEM,
			drop = {
				type = DROP_TYPE_ITEM,
				id = slot1.itemid,
				count = slot1.itemquantity
			},
			show_medal = {
				desc = slot1.price
			},
			onYes = function ()
				slot0:emit(ExchangeShipMediator.ITEM_EXCHANGE, slot0)
			end
		})
	end, SFX_PANEL)
end

function slot0.activeItem(slot0, slot1, slot2)
	setActive(slot0.itemContainer:GetChild(slot1 - 1).Find(slot3, "mask"), slot2)
end

function slot0.updateExchangeShips(slot0, slot1, slot2, slot3)
	slot0:setExchangeList(slot1, slot2, slot3)

	for slot7, slot8 in ipairs(slot1) do
		if slot7 == 1 then
			slot0:updateMainShip(slot7, slot8)
		else
			slot0:updateShips(slot7, slot8)
		end

		slot0:activeExchangeShip(slot7, slot8.isFetched)
	end

	function slot4()
		slot0.exchangeTiemr:Stop()

		slot0.exchangeTiemr.Stop.exchangeTiemr = nil

		setText(slot0.leftTimeTF, "")
		setText:emit(ExchangeShipMediator.GET_EXCHANGE_SHIPS, setText)
	end

	if slot0.exchangeTiemr then
		slot0.exchangeTiemr:Stop()

		slot0.exchangeTiemr = nil
	end

	slot0.exchangeTiemr = Timer.New(function ()
		if slot0 - pg.TimeMgr.GetInstance():GetServerTime() > 0 then
			setText(slot1.leftTimeTF, pg.TimeMgr.GetInstance():DescCDTime(slot1))
		else
			slot2()
		end
	end, 1, -1)

	slot0.exchangeTiemr:Start()
	slot0.exchangeTiemr.func()
	slot0:updateFlagShipChangeTime()
end

function slot0.updateFlagShipChangeTime(slot0)
	slot2 = slot0.flagShipTime - pg.TimeMgr.GetInstance():GetServerTime()
	slot3 = ""

	if slot0.downCountTimer then
		slot0.downCountTimer:Stop()

		slot0.downCountTimer = nil
	end

	if slot2 < 86400 then
		slot0.downCountTimer = Timer.New(function ()
			slot1 = pg.TimeMgr.GetInstance():DescCDTime(slot0.flagShipTime - pg.TimeMgr.GetInstance():GetServerTime())

			if slot0.flagShipTime - pg.TimeMgr.GetInstance().GetServerTime() > 0 then
				slot0.flagShipchangeTimeTF.text = slot0.flagShipchangeTimeTF
			else
				slot0.downCountTimer:Stop()

				slot0.downCountTimer = nil
				slot0.flagShipchangeTimeTF.text = ""

				slot0:emit(ExchangeShipMediator.GET_EXCHANGE_SHIPS, slot0.flashTime)
			end
		end, 1, -1)

		slot0.downCountTimer:Start()
	else
		slot0.flagShipchangeTimeTF.text = slot4 .. i18n("word_date")
	end
end

function slot0.updateMainShip(slot0, slot1, slot2)
	slot3 = Ship.New({
		configId = slot2.id
	})

	setPaintingPrefabAsync(slot0.paintingTF, slot3:getPainting(), "build")

	slot0.rarityTF.sprite = LoadSprite("shiprarity/" .. slot3:getRarity())
	slot4 = slot3:getExchangePrice()

	onButton(slot0, slot0.exchangeBtn, function ()
		if slot0.isFetched then
			return
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			yesText = "text_exchange",
			hideNo = true,
			type = MSGBOX_TYPE_SINGLE_ITEM,
			drop = {
				type = DROP_TYPE_SHIP,
				id = slot1.configId
			},
			show_medal = {
				desc = "X" .. 
			},
			onYes = function ()
				slot0:emit(ExchangeShipMediator.SHIP_EXCHANGE, slot0)
			end
		})
	end, SFX_PANEL)

	if not GetSpriteFromAtlas("shiptype", shipType2print(slot3:getShipType())) then
		warning("找不到船形, shipConfigId: " .. slot3.configId)
	end

	slot0.shipTypeTF.sprite = slot5
	slot0.nameTF.text = slot3:getConfig("name")
	slot0.resCountTF.text = slot4
end

function slot0.updateShips(slot0, slot1, slot2)
	slot3 = Ship.New({
		configId = slot2.id
	})

	updateDrop(slot0.shipsContainer:GetChild(slot4).Find(slot5, "icon"), {
		type = DROP_TYPE_SHIP,
		id = slot2.id
	}, {
		initStar = true
	})

	if not slot0.shipsScrolltxt[slot1 - 2 + 1] then
		slot0.shipsScrolltxt[slot4 + 1] = ScrollTxt:changeToScroll(slot5:Find("icon/name"))
	end

	slot0.shipsScrolltxt[slot4 + 1]:setText(getText(slot5:Find("icon/name")))
	setText(slot0:findTF("price_bg/Text", slot5), slot6)

	slot7 = slot0:findTF("icon/icon_bg/shiptype", slot5):GetComponent(typeof(Image))

	if not GetSpriteFromAtlas("shiptype", shipType2print(slot3:getShipType())) then
		warning("找不到船形, shipConfigId: " .. slot3.configId)
	end

	slot7.sprite = slot8

	onButton(slot0, slot5, function ()
		if slot0.exchangeList[slot1].isFetched then
			return
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			yesText = "text_exchange",
			hideNo = true,
			type = MSGBOX_TYPE_SINGLE_ITEM,
			drop = {
				type = DROP_TYPE_SHIP,
				id = slot2.configId
			},
			show_medal = {
				desc = "X" .. 
			},
			onYes = function ()
				slot0:emit(ExchangeShipMediator.SHIP_EXCHANGE, slot0)
			end
		})
	end, SFX_PANEL)
end

function slot0.closeMsgBox(slot0)
	if pg.MsgboxMgr.GetInstance()._go.activeSelf then
		slot1:hide()
	end
end

function slot0.activeExchangeShip(slot0, slot1, slot2)
	if slot1 == 1 then
		setButtonEnabled(slot0.exchangeBtn, not slot2)
		setGray(slot0.exchangeBtn, slot2)
	else
		setActive(slot0.shipsContainer:GetChild(slot1 - 2).Find(slot3, "mask"), slot2)
	end

	slot0.exchangeList[slot1].isFetched = slot2
end

function slot0.willExit(slot0)
	if slot0.itemScrolltxt then
		for slot4, slot5 in pairs(slot0.itemScrolltxt) do
			slot5:destroy()
		end

		slot0.itemScrolltxt = {}
	end

	if slot0.shipsScrolltxt then
		for slot4, slot5 in pairs(slot0.shipsScrolltxt) do
			slot5:destroy()
		end

		slot0.shipsScrolltxt = {}
	end

	if slot0.exchangeTiemr then
		slot0.exchangeTiemr:Stop()

		slot0.exchangeTiemr = nil
	end

	if slot0.downCountTimer then
		slot0.downCountTimer:Stop()

		slot0.downCountTimer = nil
	end

	if slot0.itemRefreshTimer then
		slot0.itemRefreshTimer:Stop()

		slot0.itemRefreshTimer = nil
	end
end

return slot0
