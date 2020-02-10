slot0 = class("ShopsLayer", import("..base.BaseUI"))
slot0.TYPE_ACTIVITY = "activity"
slot0.TYPE_SHOP_STREET = "shopstreet"
slot0.TYPE_MILITARY_SHOP = "supplies"
slot0.TYPE_GUILD = "guild"
slot0.TYPE_SHAM_SHOP = "sham"
slot0.TYPE_ESCORT_SHOP = "escort"
slot0.TYPE_FRAGMENT = "fragment"

function slot0.getUIName(slot0)
	return "shopsUI"
end

function slot0.init(slot0)
	slot0.bgs = {}
	slot0.top = slot0:findTF("blur_panel/adapt/top")
	slot0.goodTF = slot0:findTF("frame/item_tpl")
	slot0.goodActivityTF = slot0:findTF("frame/item_activity_tpl")
	slot0.goodFragTF = slot0:findTF("frame/item_fragment_tpl")
	slot0.bottomPanel = slot0:findTF("frame/bottom")
	slot0.switchBtn = slot0:findTF("frame/switch_btn")
	slot0.skinBtn = slot0:findTF("frame/skin_btn")
	slot0.chat = slot0:findTF("frame/chat")
	slot0.chatText = slot0:findTF("Text", slot0.chat)
	slot0.buzhihuoTouch = slot0:findTF("paint_touch")
	slot0.activityBg = slot0:findTF("activity_bg")
	slot0.backBtn = slot0:findTF("back_button", slot0.top)
	slot0.homeBtn = slot0:findTF("option", slot0.top)
	slot0.painting = slot0:findTF("paint")
	slot0.biliBg = slot0:findTF("bili_bg")

	if slot0.biliBg then
		setActive(slot0.biliBg, false)
	end

	slot0.resPanel = PlayerResource.New()
	slot1 = slot0.resPanel

	slot1:setParent(slot0:findTF("res", slot0.top), false)

	slot0.frame = slot0:findTF("frame")
	slot0.viewContainer = slot0:findTF("frame/viewContainer")
	slot0.militaryShopTF = slot0:findTF("military_shop", slot0.viewContainer)
	slot0.shopStreetTF = slot0:findTF("shop_street", slot0.viewContainer)
	slot0.activityShopTF = slot0:findTF("activity_shop", slot0.viewContainer)
	slot0.guildShopTF = slot0:findTF("guild_shop", slot0.viewContainer)
	slot0.shamShopTF = slot0:findTF("sham_shop", slot0.viewContainer)
	slot0.escortShopTF = slot0:findTF("escort_shop", slot0.viewContainer)
	slot0.fragShopTF = slot0:findTF("frag_shop", slot0.viewContainer)
	slot0.cards = {}
	slot2 = slot0.goodTF

	setText(slot2:Find("mask/tag/sellout_tag"), i18n("word_sell_out"))

	slot2 = slot0.goodActivityTF

	setText(slot2:Find("mask/tag/sellout_tag"), i18n("word_sell_out"))

	slot2 = slot0.goodFragTF

	setText(slot2:Find("mask/tag/sellout_tag"), i18n("word_sell_out"))

	slot2 = slot0.shamShopTF

	setText(slot2:Find("time"), i18n("title_limit_time"))

	slot2 = slot0.shamShopTF

	setText(slot2:Find("time/text"), i18n("shops_rest_day"))

	slot2 = slot0.shamShopTF

	setText(slot2:Find("time/text_day"), i18n("word_date"))

	slot2 = slot0.fragShopTF

	setText(slot2:Find("time"), i18n("title_limit_time"))

	slot2 = slot0.fragShopTF

	setText(slot2:Find("time/text"), i18n("shops_rest_day"))

	slot2 = slot0.fragShopTF

	setText(slot2:Find("time/text_day"), i18n("word_date"))
end

function slot0.setMilitaryShop(slot0, slot1)
	slot0.militaryShop = slot1

	slot0:updateMilitaryShop()
end

function slot0.setGuildShop(slot0, slot1)
	slot0.guildShop = slot1
	slot0.guildShopRefreshTime = slot1.nextRefreshTime
end

function slot0.setShamShop(slot0, slot1)
	slot0.shamShop = slot1
end

function slot0.setEscortShop(slot0, slot1)
	slot0.escortShop = slot1
end

function slot0.updatePlayer(slot0, slot1)
	slot0.player = slot1
	slot0.exploit = slot1.exploit

	slot0:updateExploit()

	slot2 = slot0.resPanel

	slot2:setResources(slot1)
	slot0:updateActivityRes()
	slot0:updateGuildRes()
end

function slot0.blurView(slot0)
	slot1 = pg.UIMgr.GetInstance()
	slot5[MULTRES] = slot0:findTF("blurBg", slot0.viewContainer)
	slot4.pbList = {}

	slot1:OverlayPanelPB(slot0.viewContainer, {})
end

function slot0.unBlurView(slot0)
	slot1 = pg.UIMgr.GetInstance()

	slot1:UnOverlayPanel(slot0.viewContainer, slot0.frame)
end

function slot0.didEnter(slot0)
	slot0.millitaryShopCfg = pg.arena_data_shop[1]

	onButton(slot0, slot0.backBtn, function ()
		slot0 = getProxy(ContextProxy)

		if slot0:getCurrentContext() and slot1.scene == SCENE.SHOP then
			slot2 = uv0

			slot2:emit(uv1.ON_BACK)
		elseif slot1 and slot1.scene == SCENE.CHARGE then
			slot2 = uv0

			slot2:emit(ShopsMediator.GO_MALL, ChargeScene.TYPE_MENU)
		else
			slot2 = uv0

			slot2:emit(uv1.ON_CLOSE)
		end
	end, SFX_CANCEL)

	slot3 = getProxy(TaskProxy)

	setActive(slot0:findTF("stamp"), slot3:mingshiTouchFlagEnabled())

	if LOCK_CLICK_MINGSHI then
		setActive(slot0:findTF("stamp"), false)
	end

	onButton(slot0, slot0:findTF("stamp"), function ()
		getProxy(TaskProxy):dealMingshiTouchFlag(4)
	end, SFX_CONFIRM)
	onButton(slot0, slot0.switchBtn, function ()
		slot0 = ChargeScene.TYPE_MENU

		if uv0.contextData ~= nil and uv0.contextData.chargePage ~= nil then
			slot0 = uv0.contextData.chargePage
		end

		uv0:emit(ShopsMediator.GO_MALL, slot0)
	end, SFX_CANCEL)
	onButton(slot0, slot0.skinBtn, function ()
		uv0:emit(ShopsMediator.ON_SKIN_SHOP)
	end, SFX_PANEL)
	onButton(slot0, slot0:findTF("refresh_btn", slot0.militaryShopTF), function ()
		if uv0.militaryShop.refreshCount - 1 >= #uv0.millitaryShopCfg.refresh_price then
			pg.TipsMgr.GetInstance():ShowTips(i18n("shopStreet_refresh_max_count"))

			return
		end

		slot3.content = i18n("refresh_shopStreet_question", i18n("word_gem_icon"), uv0.millitaryShopCfg.refresh_price[uv0.militaryShop.refreshCount] or uv0.millitaryShopCfg.refresh_price[#uv0.millitaryShopCfg.refresh_price], uv0.militaryShop.refreshCount - 1)

		function slot3.onYes()
			if uv0.player:getTotalGem() < uv1 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))

				return
			else
				uv0:emit(ShopsMediator.REFRESH_MILITARY_SHOP)
			end
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({})
	end, SFX_PANEL)
	setActive(slot0.chat, false)
	onButton(slot0, slot0.buzhihuoTouch, function ()
		uv0:showRandomShipWord(pg.navalacademy_shoppingstreet_template[1].words_touch, false, "touch")
	end, SFX_PANEL)

	slot0.toggles = {}
	slot2 = slot0:getTpl("activity", slot0.bottomPanel:Find("toggle_list"))
	slot0.curPage = nil

	table.sort(_.values(slot0.activityShops or {}), function (slot0, slot1)
		return slot0:getStartTime() < slot1:getStartTime()
	end)

	for slot7, slot8 in ipairs(slot3) do
		if not slot8:isEnd() then
			slot9 = cloneTplTo(slot2, slot1, slot8.activityId)

			GetImageSpriteFromAtlasAsync("ui/shopsui_atlas", slot8:getToggleImage() .. "02", slot9)
			GetImageSpriteFromAtlasAsync("ui/shopsui_atlas", slot8:getToggleImage() .. "01", slot0:findTF("Image", slot9))
			onToggle(slot0, slot9, function (slot0)
				if slot0 then
					print(uv0.activityId)

					slot1 = uv1

					slot1:clearShipWord()

					slot2 = uv1

					slot2:PlayActivityShopEnterVoice(uv1.activityShops[uv0.activityId])

					uv1.curPage = uv2.TYPE_ACTIVITY
					slot2 = uv1

					slot2:intActivityShop(uv0.activityId)

					slot2 = uv1

					slot2:updatePainting(uv2.TYPE_ACTIVITY, uv0.activityId)
				else
					setActive(uv1.biliBg, false)
				end
			end, SFX_PANEL)
		end
	end

	eachChild(slot1, function (slot0)
		uv0.toggles[slot0.name] = slot0
	end)
	onToggle(slot0, slot0.toggles[uv0.TYPE_GUILD], function (slot0)
		if slot0 then
			if uv0.curPage == uv1.TYPE_GUILD then
				return
			end

			if uv0.guildShop then
				slot1 = uv0

				slot1:initGuildShop()
			else
				slot1 = uv0

				slot1:emit(ShopsMediator.GET_GUILD_SHOP)
			end

			if uv0.curPage == nil or uv0.curPage == uv1.TYPE_ACTIVITY then
				slot1 = uv0

				slot1:showRandomShipWord(pg.navalacademy_shoppingstreet_template[1].words_enter, true, "enter")
			end

			uv0.curPage = uv1.TYPE_GUILD
			slot1 = uv0

			slot1:updatePainting(uv1.TYPE_GUILD)
		end
	end, SFX_PANEL)
	onToggle(slot0, slot0.toggles[uv0.TYPE_MILITARY_SHOP], function (slot0)
		if slot0 then
			if uv0.curPage == uv1.TYPE_MILITARY_SHOP then
				return
			end

			if not uv0.player then
				return
			end

			slot1 = pg.SystemOpenMgr.GetInstance()
			slot1, slot2 = slot1:isOpenSystem(uv0.player.level, "MilitaryExerciseMediator")

			if not slot1 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("military_shop_no_open_tip"))

				if uv0:getCurrPage() or uv1.TYPE_SHOP_STREET then
					triggerToggle(uv0.toggles[slot3], true)
				end

				return
			end

			if uv0.curPage == nil or uv0.curPage == uv1.TYPE_ACTIVITY then
				slot3 = uv0

				slot3:showRandomShipWord(pg.navalacademy_shoppingstreet_template[1].words_enter, true, "enter")
			end

			uv0.curPage = uv1.TYPE_MILITARY_SHOP
			slot3 = uv0

			slot3:updatePainting(uv1.TYPE_MILITARY_SHOP)
		end
	end, SFX_PANEL)
	onToggle(slot0, slot0.toggles[uv0.TYPE_SHOP_STREET], function (slot0)
		if slot0 then
			if uv0.curPage == uv1.TYPE_SHOP_STREET then
				return
			end

			if uv0.curPage == nil or uv0.curPage == uv1.TYPE_ACTIVITY then
				slot1 = uv0

				slot1:showRandomShipWord(pg.navalacademy_shoppingstreet_template[1].words_enter, true, "enter")
			end

			uv0.curPage = uv1.TYPE_SHOP_STREET
			slot1 = uv0

			slot1:updatePainting(uv1.TYPE_SHOP_STREET)
		end
	end, SFX_PANEL)

	if not LOCK_SHAM_CHAPTER then
		if slot0.shamShop then
			slot4 = slot0.shamShop
			slot4 = slot4:isOpen()
		end
	else
		slot4 = false

		if false then
			slot4 = true
		end
	end

	setActive(slot0.toggles[uv0.TYPE_SHAM_SHOP], slot4)
	onToggle(slot0, slot0.toggles[uv0.TYPE_SHAM_SHOP], function (slot0)
		if slot0 then
			slot1 = pg.SystemOpenMgr.GetInstance()
			slot1, slot2 = slot1:isOpenSystem(uv0.player.level, "ShamShop")

			if not slot1 then
				pg.TipsMgr.GetInstance():ShowTips(slot2)

				if uv0:getCurrPage() or uv1.TYPE_SHOP_STREET then
					triggerToggle(uv0.toggles[slot3], true)
				end

				return
			end

			if uv0.curPage == uv1.TYPE_SHAM_SHOP then
				return
			end

			if uv0.curPage == nil or uv0.curPage == uv1.TYPE_ACTIVITY then
				slot3 = uv0

				slot3:showRandomShipWord(pg.navalacademy_shoppingstreet_template[1].words_enter, true, "enter")
			end

			uv0.curPage = uv1.TYPE_SHAM_SHOP
			slot3 = uv0

			slot3:updateShamShop()

			slot3 = uv0

			slot3:updateShamRes()

			slot3 = uv0

			slot3:updatePainting(uv1.TYPE_SHAM_SHOP)
		end
	end, SFX_PANEL)

	if not LOCK_FRAGMENT_SHOP then
		if slot0.contextData.shopDatas.fragshop then
			slot5 = slot0.contextData.shopDatas.fragshop
			slot5 = slot5:isOpen()
		end
	else
		slot5 = false

		if false then
			slot5 = true
		end
	end

	setActive(slot0.toggles[uv0.TYPE_FRAGMENT], slot5)
	onToggle(slot0, slot0.toggles[uv0.TYPE_FRAGMENT], function (slot0)
		if slot0 then
			slot1 = pg.SystemOpenMgr.GetInstance()
			slot1, slot2 = slot1:isOpenSystem(uv0.player.level, "FragmentShop")

			if not slot1 then
				pg.TipsMgr.GetInstance():ShowTips(slot2)

				if uv0:getCurrPage() or uv1.TYPE_SHOP_STREET then
					triggerToggle(uv0.toggles[slot3], true)
				end

				return
			end

			if uv0.curPage == uv1.TYPE_FRAGMENT then
				return
			end

			if uv0.curPage == nil or uv0.curPage == uv1.TYPE_ACTIVITY then
				slot3 = uv0

				slot3:showRandomShipWord(pg.navalacademy_shoppingstreet_template[1].words_enter, true, "enter")
			end

			uv0.curPage = uv1.TYPE_FRAGMENT
			slot3 = uv0

			slot3:updateBlueprintFragShop()

			slot3 = uv0

			slot3:updateFragRes()

			slot3 = uv0

			slot3:updatePainting(uv1.TYPE_FRAGMENT)
		end
	end, SFX_PANEL)

	slot8 = slot0.top

	onButton(slot0, slot8:Find("res_fragment/resolve"), function ()
		slot0 = uv0

		slot0:CallFragResolve()
	end)

	slot0.warp = slot0.contextData.warp

	if slot0.warp == uv0.TYPE_SHAM_SHOP then
		slot6 = pg.SystemOpenMgr.GetInstance()
		slot6, slot7 = slot6:isOpenSystem(slot0.player.level, "ShamShop")

		if not slot6 then
			slot0.warp = nil
			slot8 = pg.TipsMgr.GetInstance()

			slot8:ShowTips(slot7)
		end

		if not slot4 then
			slot0.warp = nil
			slot8 = pg.TipsMgr.GetInstance()

			slot8:ShowTips(i18n("common_activity_not_start"))
		end
	end

	if (not slot0.warp or slot0.warp == uv0.TYPE_ACTIVITY) and #slot3 > 0 then
		if slot0.contextData.actId and slot0.toggles[tostring(slot0.contextData.actId)] then
			triggerToggle(slot0.toggles[tostring(slot0.contextData.actId)], true)
		else
			triggerToggle(slot0.toggles[tostring(slot3[#slot3].activityId)], true)
		end
	else
		slot0.warp = slot0.warp or uv0.TYPE_SHOP_STREET

		triggerToggle(slot0.toggles[slot0.warp], true)
	end

	onButton(slot0, slot0:findTF("refresh_btn", slot0.shopStreetTF), function ()
		if not ShoppingStreet.getRiseShopId(ShopArgs.ShoppingStreetUpgrade, uv0.shopStreet.flashCount) then
			slot1 = pg.TipsMgr.GetInstance()

			slot1:ShowTips(i18n("shopStreet_refresh_max_count"))

			return
		end

		slot1 = pg.shop_template[slot0]
		slot2 = pg.MsgboxMgr.GetInstance()
		slot4.content = i18n("refresh_shopStreet_question", i18n("word_" .. id2res(slot1.resource_type) .. "_icon"), slot1.resource_num, uv0.shopStreet.flashCount)

		function slot4.onYes()
			slot0 = uv0

			slot0:emit(ShopsMediator.REFRESH_SHOP_STREET, uv1)
		end

		slot2:ShowMsgBox({
			yesText = "text_confirm",
			hideNo = false,
			noText = "text_cancel"
		})
	end, SFX_PANEL)
	slot0:blurView()
end

function slot0.updatePainting(slot0, slot1, slot2)
	if slot0.patingName ~= slot0:getPaintingName(slot1, slot2) then
		if slot3 then
			retPaintingPrefab(slot0.painting, slot3)
		end

		setPaintingPrefabAsync(slot0.painting, slot4, "chuanwu")
	end

	setActive(slot0.buzhihuoTouch, slot4 == "buzhihuo_shop")
end

function slot0.getPaintingName(slot0, slot1, slot2)
	if slot1 == uv0.TYPE_ACTIVITY then
		if slot2 and pg.activity_template[slot2] then
			slot0.patingName = slot3.config_client.painting or "aijiang_pt"

			return slot0.patingName
		end

		slot0.patingName = "aijiang_pt"
	else
		slot0.patingName = "buzhihuo_shop"
	end

	return slot0.patingName
end

function slot0.getCurrPage(slot0)
	if slot0.curPage == uv0.TYPE_ACTIVITY then
		return tostring(slot0.currActivityShop.activityId)
	else
		return slot0.curPage
	end
end

function slot0.onBackPressed(slot0)
	playSoundEffect(SFX_CANCEL)

	if not IsNil(slot0.singleBoxTF) and isActive(slot0.singleBoxTF) then
		triggerButton(slot0.singleBoxTF)

		return
	end

	if not IsNil(slot0.msgBoxTF) and isActive(slot0.msgBoxTF) then
		triggerButton(slot0.msgBoxTF)

		return
	end

	triggerButton(slot0.backBtn)
end

function slot0.randomShipWord(slot0, slot1)
	slot2 = string.split(slot1, "|")
	slot3 = math.random(#slot2)

	return slot2[slot3], slot3
end

function slot0.clearShipWord(slot0)
	if slot0.wordTweenId then
		LeanTween.cancel(slot0.wordTweenId)

		slot0.wordTweenId = nil
	end

	slot0.chatFlag = nil

	setActive(slot0.chat, false)
end

function slot0.showRandomShipWord(slot0, slot1, slot2, slot3)
	if not slot0.chatFlag or slot2 then
		slot0.chatFlag = true

		if slot0.wordTweenId then
			LeanTween.cancel(slot0.wordTweenId)

			slot0.wordTweenId = nil
		end

		slot4 = nil
		slot1, slot4 = slot0:randomShipWord(slot1)

		if slot3 then
			slot0:playCV(slot3 .. "_" .. slot4)
		end

		slot0:ShowShipWord(slot1)
	end
end

function slot0.ShowShipWord(slot0, slot1)
	if slot0.wordTweenId then
		LeanTween.cancel(slot0.wordTweenId)

		slot0.wordTweenId = nil
	end

	slot3 = 5

	setActive(slot0.chat, true)
	setText(slot0.chatText, slot1)

	slot4 = LeanTween.scale(slot0.chat.gameObject, Vector3.New(1, 1, 1), 0.3)
	slot4 = slot4:setFrom(Vector3.New(0, 0, 0))
	slot4 = slot4:setEase(LeanTweenType.easeOutBack)
	slot0.wordTweenId = slot4:setOnComplete(System.Action(function ()
		if IsNil(uv0.chat) then
			return
		end

		slot1 = LeanTween.scale(uv0.chat.gameObject, Vector3.New(0, 0, 1), uv1)
		slot1 = slot1:setFrom(Vector3.New(1, 1, 1))
		slot1 = slot1:setEase(LeanTweenType.easeInBack)
		slot1 = slot1:setDelay(uv2)
		uv0.wordTweenId = slot1:setOnComplete(System.Action(function ()
			if IsNil(uv0.chat) then
				return
			end

			slot0 = uv0

			slot0:clearShipWord()
		end)).uniqueId
	end)).uniqueId
end

function slot0.playCV(slot0, slot1)
	if "event:/cv/shop/" .. slot1 then
		function slot3()
			slot0 = uv0

			slot0:stopCV()

			uv0._currentVoice = playSoundEffect(uv1)
		end

		if slot0.loadedCVBankName then
			slot3()
		else
			slot6 = pg.CriMgr

			slot6:LoadCV("shop", function ()
				slot0 = pg.CriMgr.GetCVBankName(uv0)

				if uv1.exited then
					pg.CriMgr.UnloadCVBank(slot0)
				else
					uv2()

					if uv1._currentVoice then
						uv1.loadedCVBankName = slot0
					end
				end
			end)
		end
	end
end

function slot0.updateExploit(slot0)
	setText(slot0:findTF("res_exploit/bg/Text", slot0.top), slot0.exploit)
end

function slot0.updateActivityRes(slot0)
	if slot0.currActivityShop then
		slot1 = slot0.currActivityShop

		setText(slot0:findTF("res_battery/Text", slot0.top), slot0.player[id2res(slot1:getResId())])
	end
end

function slot0.updateMilitaryShop(slot0)
	removeAllChildren(slot0:findTF("scrollView/view", slot0.militaryShopTF))

	slot0.milGoodsTFs = {}
	slot2 = table.getCount(slot0.militaryShop.goods)

	for slot6, slot7 in pairs(slot0.militaryShop.goods) do
		slot0.milGoodsTFs[slot6] = GoodsCard.New(cloneTplTo(slot0.goodTF, slot1))

		table.insert(slot0.cards, slot0.milGoodsTFs[slot6])

		slot9 = slot0.milGoodsTFs[slot6]

		slot9:update(slot7)
		onButton(slot0, slot0.milGoodsTFs[slot7.id].itemTF, function ()
			slot0 = pg.MsgboxMgr.GetInstance()
			slot2.type = MSGBOX_TYPE_SINGLE_ITEM
			slot4 = uv0
			slot3.id = slot4:getConfig("effect_args")[1]
			slot4 = uv0
			slot3.type = slot4:getConfig("type")
			slot2.drop = {}

			function slot2.onYes()
				slot0 = uv0

				if not slot0:canPurchase() then
					slot0 = pg.TipsMgr.GetInstance()

					slot0:ShowTips(i18n("buy_countLimit"))

					return
				end

				slot0 = uv1

				slot0:emit(ShopsMediator.BUY_ITEM, uv0.id, 1)
			end

			slot0:ShowMsgBox({
				showOwned = true,
				hideLine = true,
				yesText = "text_exchange"
			})
		end, SFX_PANEL)
	end

	slot0:addRefreshTimer(slot0.militaryShop.nextTime + 1)
end

function slot0.stopCV(slot0)
	if slot0._currentVoice then
		slot1 = slot0._currentVoice

		slot1:Stop(true)
	end

	slot0._currentVoice = nil
end

function slot0.addRefreshTimer(slot0, slot1)
	function ()
		if uv0.refreshTimer then
			slot0 = uv0.refreshTimer

			slot0:Stop()

			uv0.refreshTimer = nil
		end
	end()

	slot3 = slot0:findTF("timer_bg/Text", slot0.militaryShopTF)
	slot0.refreshTimer = Timer.New(function ()
		slot1 = pg.TimeMgr.GetInstance()

		if uv0 - slot1:GetServerTime() <= 0 then
			uv1()

			slot1 = uv2

			slot1:emit(ShopsMediator.GET_MILITARY_SHOP)
		else
			slot1 = pg.TimeMgr.GetInstance()

			setText(uv3, slot1:DescCDTime(slot0))
		end
	end, 1, -1)
	slot4 = slot0.refreshTimer

	slot4:Start()
	slot0.refreshTimer.func()
end

function slot0.setShopStreet(slot0, slot1)
	slot0.shopStreet = slot1
end

function slot0.updateShopStreet(slot0, slot1)
	slot2 = pg.navalacademy_shoppingstreet_template[slot1.level]

	slot0:displayShopSteet(1)

	slot7 = pg.TimeMgr.GetInstance()

	setText(slot0:findTF("timer_bg/Text", slot0.shopStreetTF), slot7:DescCDTime(slot1.nextFlashTime - pg.TimeMgr.GetInstance():GetServerTime()))
	setActive(slot0:findTF("tip_activity", slot0.shopStreetTF), getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_SHOP_STREET) and not slot6:isEnd())
	setText(slot7, i18n("shop_street_activity_tip"))

	if slot0.shopStreetTimer then
		slot8 = slot0.shopStreetTimer

		slot8:Stop()

		slot0.shopStreetTimer = nil
	end

	slot0.shopStreetTimer = Timer.New(function ()
		slot0 = uv0

		if slot0:isUpdateGoods() then
			slot0 = uv1.shopStreetTimer

			slot0:Stop()

			uv1.shopStreetTimer = nil
			slot0 = uv1

			slot0:emit(ShopsMediator.GET_SHOP_STREEET)
		else
			slot0 = pg.TimeMgr.GetInstance()
			slot4 = pg.TimeMgr.GetInstance()

			setText(uv2, slot4:DescCDTime(uv0.nextFlashTime - slot0:GetServerTime()))
		end
	end, 1, -1)
	slot8 = slot0.shopStreetTimer

	slot8:Start()
end

slot1 = 2
slot2 = 5

function slot0.displayShopSteet(slot0, slot1)
	slot2 = #slot0.shopStreet.goods / uv0

	if math.floor(slot2) < slot2 then
		slot2 = math.floor(slot2) + 1
	end

	slot3 = math.max(uv1, slot2) * uv0

	removeAllChildren(slot0:findTF("scrollView/view", slot0.shopStreetTF))

	slot0.shopStreetTFs = {}
	slot5 = getProxy(ActivityProxy)
	slot6 = slot5:getActivityByType(ActivityConst.ACTIVITY_TYPE_SHOP_DISCOUNT) and not slot5:isEnd()

	for slot10 = 1, slot3, 1 do
		slot11 = slot0.shopStreet.goods[slot10]
		slot0.shopStreetTFs[slot11.id] = GoodsCard.New(cloneTplTo(slot0.goodTF, slot4))

		table.insert(slot0.cards, slot0.shopStreetTFs[slot11.id])

		if slot11 then
			slot11.activityDiscount = slot6
			slot13 = slot0.shopStreetTFs[slot11.id]

			slot13:update(slot11)
			onButton(slot0, slot0.shopStreetTFs[slot11.id].itemTF, function ()
				slot0 = pg.MsgboxMgr.GetInstance()
				slot2.type = MSGBOX_TYPE_SINGLE_ITEM
				slot4 = uv0
				slot3.id = slot4:getConfig("effect_args")[1]
				slot4 = uv0
				slot3.type = slot4:getConfig("type")
				slot2.drop = {}

				function slot2.onYes()
					slot0 = uv0

					if not slot0:canPurchase() then
						slot0 = pg.TipsMgr.GetInstance()

						slot0:ShowTips(i18n("buy_countLimit"))

						return
					end

					slot0 = uv0

					if slot0:getConfig("resource_type") == 4 or slot0 == 14 then
						slot1 = uv1.player
						slot1 = slot1:getResById(slot0)
						slot4 = uv0
						slot3.id = slot4:getConfig("effect_args")[1]
						slot2 = Item.New({})
						slot3 = uv0
						slot4 = pg.MsgboxMgr.GetInstance()
						slot6.content = i18n("charge_scene_buy_confirm", slot3:getConfig("resource_num") * uv0.discount / 100, slot2:getConfig("name"))

						function slot6.onYes()
							slot0 = uv0

							slot0:emit(ShopsMediator.BUY_ITEM, uv1.id, 1)
						end

						slot4:ShowMsgBox({})
					else
						slot1 = uv1

						slot1:emit(ShopsMediator.BUY_ITEM, uv0.id, 1)
					end
				end

				slot0:ShowMsgBox({
					hideLine = true,
					yesText = "text_exchange",
					showOwned = true
				})
			end, SFX_PANEL)
		else
			setActive(findTF(slot12, "item"), false)
			setActive(findTF(slot12, "empty"), true)
		end
	end
end

function slot0.setActivityShops(slot0, slot1)
	slot0.activityShops = slot1
end

function slot0.updateActivityShop(slot0, slot1, slot2)
	slot0.activityShops[slot1] = slot2

	if slot0.currActivityShop and slot0.currActivityShop.id == slot2.id then
		slot0:intActivityShop(slot1)
	end
end

function slot0.intActivityShop(slot0, slot1)
	if slot0.biliBg then
		setActive(slot0.biliBg, slot1 == ActivityConst.BILIBILI_PT_SHOP_ID)
	end

	if not slot0.activityShops[slot1] or slot0.currActivityShop == slot2 then
		return
	end

	slot3, slot4 = slot2:getBgPath()
	slot5 = slot2:getSortGoods()

	if slot0.activityCards and #slot0.activityCards > 0 then
		_.each(slot0.activityCards, function (slot0)
			slot0:dispose()
		end)
	end

	slot0.activityCards = {}

	if not slot0.uilist then
		slot0.uilist = UIItemList.New(slot0:findTF("scrollView/view", slot0.activityShopTF), slot0.goodActivityTF)
	end

	slot6 = slot0.uilist

	slot6:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot4 = ActivityGoodsCard.New(slot2)

			slot4:update(uv0[slot1 + 1], nil, uv1)
			table.insert(uv2.activityCards, slot4)
			onButton(uv2, slot4.tr, function ()
				slot0 = uv0

				slot0:showMsgBox(uv1)
			end, SFX_PANEL)
		end
	end)
	slot6:align(#slot5)

	slot0.currActivityShop = slot2

	setText(slot0:findTF("Text", slot0.activityShopTF), i18n("activity_shop_lable", slot2:getOpenTime()))

	slot7 = slot2:getResId()
	slot10 = slot0.player

	setText(slot0:findTF("res_battery/Text", slot0.top), slot10:getResource(slot7))
	setText(slot0:findTF("res_battery/label", slot0.top), pg.item_data_statistics[id2ItemId(slot7)].name)

	slot8 = slot0:findTF("res_battery/icon", slot0.top)
	slot8:GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas(pg.item_data_statistics[id2ItemId(slot7)].icon, "")
	slot11 = nil

	if slot0.bgs[slot2.activityId] then
		slot11 = slot10
	else
		slot0.bgs[slot2.activityId] = GetSpriteFromAtlas(slot3, "")
	end

	setImageSprite(slot0.activityBg, slot11)
	setActive(slot0.activityBg, true)
end

function slot0.showMsgBox(slot0, slot1)
	if slot1:getConfig("num_limit") == 1 or slot1:getConfig("commodity_type") == 4 then
		slot0:openSingleBox(slot1)
	else
		slot0:initMsgBox(slot1)
	end
end

function slot0.openSingleBox(slot0, slot1)
	slot2 = {
		id = slot1:getConfig("commodity_id"),
		type = slot1:getConfig("commodity_type"),
		count = slot1:getConfig("num")
	}

	function slot3()
		slot0 = pg.UIMgr.GetInstance()

		slot0:BlurPanel(uv0.singleBoxTF)

		slot2 = uv0

		onButton(uv0, slot2:findTF("window/actions/confirm_btn", uv0.singleBoxTF), function ()
			slot0 = uv0

			if slot0:getConfig("commodity_type") == 4 and uv1.curPage == uv2.TYPE_ACTIVITY then
				uv1:closeSingleBox()

				slot0 = pg.MsgboxMgr.GetInstance()
				slot2.content = i18n("pt_reconfirm", uv3.cfg.name or "??")

				function slot2.onYes()
					uv0:purchase(uv1, 1)
				end

				slot0.ShowMsgBox(slot0, {})
			else
				slot0 = uv1

				slot0:purchase(uv0, 1)

				slot0 = uv1

				slot0:closeSingleBox()
			end
		end, SFX_CANCEL)
		updateDrop(uv0.singleItemTF, uv3)

		slot4, slot4 = GetOwnedpropCount(uv3)

		setActive(uv0.singleItemOwnTF.parent, slot1)
		setText(uv0.singleItemOwnTF, slot0)
		setText(uv0.singleItemOwnLabelTF, i18n("word_own1"))

		uv0.singleDescTF.text = uv3.desc
		uv0.singleNameTF.text = uv3.cfg.name

		setActive(uv0.singleBoxTF, true)

		slot2 = uv0

		slot2:unBlurView()
	end

	if not slot0.singleBoxTF then
		LoadAndInstantiateAsync("ui", "ShopsUISinglebox", function (slot0)
			slot0.name = "singlebox"
			uv0.singleBoxTF = rtf(slot0)

			setParent(uv0.singleBoxTF, uv0._tf)

			slot2 = uv0
			slot2 = slot2:findTF("window/item/display_panel/name_container/name", uv0.singleBoxTF)
			uv0.singleNameTF = slot2:GetComponent(typeof(Text))
			slot2 = uv0
			slot2 = slot2:findTF("window/item/display_panel/desc/Text", uv0.singleBoxTF)
			uv0.singleDescTF = slot2:GetComponent(typeof(Text))
			slot2 = uv0
			uv0.singleItemTF = slot2:findTF("window/item", uv0.singleBoxTF)
			slot2 = uv0
			uv0.singleItemOwnTF = slot2:findTF("icon_bg/own/Text", uv0.singleItemTF)
			slot2 = uv0
			uv0.singleItemOwnLabelTF = slot2:findTF("icon_bg/own/label", uv0.singleItemTF)
			slot3 = uv0

			onButton(uv0, slot3:findTF("window/actions/cancel_btn", uv0.singleBoxTF), function ()
				slot0 = uv0

				slot0:closeSingleBox()
			end, SFX_CANCEL)
			onButton(uv0, uv0.singleBoxTF, function ()
				slot0 = uv0

				slot0:closeSingleBox()
			end, SFX_CANCEL)

			slot3 = uv0

			onButton(uv0, slot3:findTF("window/top/btnBack", uv0.singleBoxTF), function ()
				slot0 = uv0

				slot0:closeSingleBox()
			end, SFX_CANCEL)
			uv1()
		end)
	else
		slot3()
	end
end

function slot0.closeSingleBox(slot0)
	if slot0.singleBoxTF then
		slot1 = pg.UIMgr.GetInstance()

		slot1:UnblurPanel(slot0.singleBoxTF, slot0._tf)
		setActive(slot0.singleBoxTF, false)
		slot0:blurView()
	end
end

function slot0.purchase(slot0, slot1, slot2)
	if not slot1:canPurchase() then
		slot3 = pg.TipsMgr.GetInstance()

		slot3:ShowTips(i18n("buy_countLimit"))

		return
	end

	slot3, slot4 = getPlayerOwn(slot1:getConfig("resource_category"), slot1:getConfig("resource_type"))

	if slot4 < slot1:getConfig("resource_num") * slot2 then
		slot5 = pg.TipsMgr.GetInstance()

		slot5:ShowTips(i18n("common_no_x", slot3))

		return
	end

	if slot0.curPage == uv0.TYPE_ACTIVITY then
		slot0:emit(ShopsMediator.ACTIVITY_OPERATION, slot0.currActivityShop.activityId, 1, slot1.id, slot2)
	elseif slot0.curPage == uv0.TYPE_SHAM_SHOP then
		slot0:emit(ShopsMediator.BUY_SHAM_ITEM, slot1.id, slot2)
	elseif slot0.curPage == uv0.TYPE_ESCORT_SHOP then
		slot0:emit(ShopsMediator.BUY_ESCORT_ITEM, slot1.id, slot2)
	elseif slot0.curPage == uv0.TYPE_FRAGMENT then
		slot0:emit(ShopsMediator.BUY_FRAG_ITEM, slot1.id, slot2)
	end
end

function slot0.initMsgBox(slot0, slot1)
	slot2 = {
		id = slot1:getConfig("commodity_id"),
		type = slot1:getConfig("commodity_type"),
		count = slot1:getConfig("num")
	}
	slot3, slot4 = getPlayerOwn(slot1:getConfig("resource_category"), slot1:getConfig("resource_type"))
	slot5 = math.max(math.floor(slot4 / slot1:getConfig("resource_num")), 1)

	if slot1:getConfig("num_limit") ~= 0 then
		slot5 = math.min(slot5, slot1:getConfig("num_limit") - slot1.buyCount)
	end

	function slot6(slot0)
		slot0 = math.min(math.max(slot0, 1), uv0)
		uv1.countTF.text = slot0
		uv1.curCount = slot0
		slot2 = uv2
		uv1.itemCountTF.text = slot0 * slot2:getConfig("num")
	end

	function slot7()
		slot0 = pg.UIMgr.GetInstance()

		slot0:BlurPanel(uv0.msgBoxTF)

		slot0 = 0.5
		slot3 = uv0

		onButton(uv0, slot3:findTF("actions/confirm_button", uv0.msgBoxTF), function ()
			slot0 = uv0

			slot0:purchase(uv1, uv0.curCount)

			slot0 = uv0

			slot0:closeActivityMsg()
		end, SFX_PANEL)
		onButton(uv0, uv0.leftBtn, function ()
			uv0(uv1.curCount - 1)
		end)
		onButton(uv0, uv0.rightBtn, function ()
			uv0(uv1.curCount + 1)
		end)
		onButton(uv0, uv0.maxBtn, function ()
			uv0(uv1)
		end)
		uv2(1)
		setActive(uv0.msgBoxTF, true)
		updateDrop(uv0.topItem, uv4)
		updateDrop(uv0.bottomItem, uv4)

		slot5, slot5 = GetOwnedpropCount(uv4)

		setActive(uv0.ownerTF.parent, slot2)
		setText(uv0.ownerTF, slot1)
		setText(uv0.ownerLabelTF, i18n("word_own1"))

		uv0.nameTF.text = uv4.cfg.name
		uv0.descTF.text = uv4.desc
		slot3 = uv0

		slot3:unBlurView()
	end

	if not slot0.msgBoxTF then
		LoadAndInstantiateAsync("ui", "ShopsUIMsgbox", function (slot0)
			slot0.name = "msgbox"
			uv0.msgBoxTF = rtf(slot0)

			setParent(uv0.msgBoxTF, uv0._tf)

			slot2 = uv0
			uv0.topItem = slot2:findTF("item", uv0.msgBoxTF)
			slot2 = uv0
			uv0.bottomItem = slot2:findTF("got/panel_bg/list/item", uv0.msgBoxTF)
			slot2 = uv0
			uv0.maxBtn = slot2:findTF("count/max", uv0.msgBoxTF)
			slot2 = uv0
			uv0.leftBtn = slot2:findTF("count/number_panel/left", uv0.msgBoxTF)
			slot2 = uv0
			uv0.rightBtn = slot2:findTF("count/number_panel/right", uv0.msgBoxTF)
			slot2 = uv0
			slot2 = slot2:findTF("item/display_panel/name_container/name", uv0.msgBoxTF)
			uv0.nameTF = slot2:GetComponent(typeof(Text))
			slot2 = uv0
			slot2 = slot2:findTF("item/display_panel/desc/Text", uv0.msgBoxTF)
			uv0.descTF = slot2:GetComponent(typeof(Text))
			slot2 = uv0
			slot2 = slot2:findTF("icon_bg/count", uv0.bottomItem)
			uv0.itemCountTF = slot2:GetComponent(typeof(Text))
			slot2 = uv0
			slot2 = slot2:findTF("count/number_panel/value", uv0.msgBoxTF)
			uv0.countTF = slot2:GetComponent(typeof(Text))
			slot2 = uv0
			uv0.ownerTF = slot2:findTF("icon_bg/own/Text", uv0.topItem)
			slot2 = uv0
			uv0.ownerLabelTF = slot2:findTF("icon_bg/own/label", uv0.topItem)
			slot3 = uv0

			onButton(uv0, slot3:findTF("actions/cancel_button", uv0.msgBoxTF), function ()
				slot0 = uv0

				slot0:closeActivityMsg()
			end, SFX_PANEL)
			onButton(uv0, uv0.msgBoxTF, function ()
				slot0 = uv0

				slot0:closeActivityMsg()
			end, SFX_PANEL)
			uv1()
		end)
	else
		slot7()
	end
end

function slot0.closeActivityMsg(slot0)
	if slot0.msgBoxTF then
		slot1 = pg.UIMgr.GetInstance()

		slot1:UnblurPanel(slot0.msgBoxTF, slot0._tf)
		setActive(slot0.msgBoxTF, false)
		slot0:blurView()
	end
end

function slot0.updateGuildRes(slot0)
	if not IsNil(slot0.guildResTxt) then
		slot0.guildResTxt.text = slot0.player.guildCoin
	end
end

function slot0.initGuildShop(slot0)
	if not slot0.guildShop or slot0.isInitGuildShop then
		return
	end

	slot0.isInitGuildShop = true
	slot0.guildGoodsContain = slot0:findTF("scrollView/view", slot0.guildShopTF)
	slot1 = slot0:findTF("timer_bg/Text", slot0.guildShopTF)
	slot0.guildTimerTxt = slot1:GetComponent(typeof(Text))
	slot1 = slot0:findTF("res_guild/bg/Text", slot0.top)
	slot0.guildResTxt = slot1:GetComponent(typeof(Text))

	slot0:resetGuildCards()
	slot0:updateGuildRes()
	onButton(slot0, slot0:findTF("refresh_btn", slot0.guildShopTF), function ()
		if not ShoppingStreet.getRiseShopId(ShopArgs.guildShopFlash, uv0.guildShop.refreshCount) then
			return
		end

		slot1 = uv0

		slot1:emit(ShopsMediator.BUY_ITEM, slot0, 1)
	end, SFX_PANEL)
end

function slot0.addGuidTimer(slot0)
	if not slot0.isInitGuildShop then
		return
	end

	if slot0.guildTimer then
		slot1 = slot0.guildTimer

		slot1:Stop()

		slot0.guildTimer = nil
	end

	slot0.guildTimer = Timer.New(function ()
		slot1 = pg.TimeMgr.GetInstance()

		if uv0.guildShop.nextRefreshTime - slot1:GetServerTime() > 0 then
			slot2 = pg.TimeMgr.GetInstance()
			uv0.guildTimerTxt.text = slot2:DescCDTime(slot0)
		else
			uv0.guildTimerTxt.text = ""
			slot1 = uv0.guildTimer

			slot1:Stop()

			uv0.guildTimer = nil
		end
	end, 1, -1)
	slot1 = slot0.guildTimer

	slot1:Start()
	slot0.guildTimer.func()
end

function slot0.closeMsgBox(slot0)
	if pg.MsgboxMgr.GetInstance()._go.activeSelf then
		slot1:hide()
	end
end

function slot0.initGuildGoodsCards(slot0)
	if not slot0.isInitGuildShop then
		return
	end

	slot1 = slot0.guildShop
	slot0.guildShopCards = {}

	for slot7 = slot0.guildGoodsContain.childCount + 1, #slot1:getSortGoods(), 1 do
		cloneTplTo(slot0.goodTF, slot0.guildGoodsContain)
	end

	for slot7 = 1, slot0.guildGoodsContain.childCount, 1 do
		setActive(slot0.guildGoodsContain:GetChild(slot7 - 1), slot7 <= slot3)

		if slot7 <= slot3 then
			slot9 = slot1[slot7]
			slot10 = GoodsCard.New(slot8)

			table.insert(slot0.cards, slot10)
			slot10:update(slot9)
			onButton(slot0, slot10.tr, function ()
				slot0 = pg.MsgboxMgr.GetInstance()
				slot2.type = MSGBOX_TYPE_SINGLE_ITEM
				slot4 = uv0
				slot3.id = slot4:getConfig("effect_args")[1]
				slot4 = uv0
				slot3.type = slot4:getConfig("type")
				slot2.drop = {}

				function slot2.onYes()
					slot0 = uv0

					if not slot0:canPurchase() then
						slot0 = pg.TipsMgr.GetInstance()

						slot0:ShowTips(i18n("buy_countLimit"))

						return
					end

					slot0 = uv1

					slot0:emit(ShopsMediator.BUY_ITEM, uv0.id, 1)
				end

				slot0:ShowMsgBox({
					showOwned = true,
					hideLine = true,
					yesText = "text_exchange"
				})
			end, SFX_PANEL)

			slot0.guildShopCards[slot9.id] = slot10
		end
	end
end

function slot0.updateGuildCard(slot0)
	if not slot0.isInitGuildShop then
		return
	end

	for slot4, slot5 in pairs(slot0.guildShopCards) do
		slot6 = slot0.guildShop

		if slot6:getGoodsById(slot4) then
			slot5:update(slot6)
		end
	end
end

function slot0.resetGuildCards(slot0)
	slot0:initGuildGoodsCards()
	slot0:addGuidTimer()
end

function slot0.updateShamShop(slot0)
	if not slot0.shamItemList then
		slot0.shamItemList = UIItemList.New(slot0:findTF("scrollView/view", slot0.shamShopTF), slot0.goodActivityTF)
	end

	slot1 = slot0.shamShop
	slot2 = slot0.shamItemList

	slot2:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot3 = ActivityGoodsCard.New(slot2)

			slot3:update(uv0[slot1 + 1], uv1.TYPE_SHAM_SHOP)
			onButton(uv2, slot3.tr, function ()
				slot0 = uv0

				if slot0:getConfig("num_limit") ~= 1 then
					slot0 = uv0

					if slot0:getConfig("commodity_type") == 4 then
						slot0 = uv1

						slot0:openSingleBox(uv0)
					else
						slot0 = uv1

						slot0:initMsgBox(uv0)
					end
				end
			end, SFX_PANEL)
		end
	end)

	slot2 = slot0.shamItemList

	slot2:align(#slot1:getSortGoods())

	slot6 = slot0.shamShop

	setText(slot0:findTF("time/day", slot0.shamShopTF), string.format("%02d", slot6:getRestDays()))
end

function slot0.updateShamRes(slot0)
	slot1 = getProxy(BagProxy)

	setText(slot0:findTF("res_nano/Text", slot0.top), slot1:getItemCountById(ChapterConst.ShamMoneyItem))
end

function slot0.updateEscortShop(slot0)
	if not slot0.escortItemList then
		slot0.escortItemList = UIItemList.New(slot0:findTF("scrollView/view", slot0.escortShopTF), slot0.goodActivityTF)
	end

	slot1 = slot0.escortShop
	slot2 = slot0.escortItemList

	slot2:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot3 = ActivityGoodsCard.New(slot2)

			slot3:update(uv0[slot1 + 1])
			onButton(uv1, slot3.tr, function ()
				slot0 = uv0

				if slot0:getConfig("num_limit") ~= 1 then
					slot0 = uv0

					if slot0:getConfig("commodity_type") == 4 then
						slot0 = uv1

						slot0:openSingleBox(uv0)
					else
						slot0 = uv1

						slot0:initMsgBox(uv0)
					end
				end
			end, SFX_PANEL)
		end
	end)

	slot2 = slot0.escortItemList

	slot2:align(#slot1:getSortGoods())

	slot6 = slot0.escortShop

	setText(slot0:findTF("time/day", slot0.escortShopTF), string.format("%02d", slot6:getRestDays()))
end

function slot0.updateEscortRes(slot0)
	slot1 = getProxy(BagProxy)

	setText(slot0:findTF("res_nano/Text", slot0.top), slot1:getItemCountById(ChapterConst.EscortMoneyItem))
end

function slot0.updateBlueprintFragShop(slot0)
	if not slot0.contextData.shopDatas.fragshop then
		return
	end

	slot1 = slot0.contextData.shopDatas.fragshop
	slot3 = slot0.fragShopTF

	UIItemList.StaticAlign(slot3:Find("scrollView/view"), slot0.goodFragTF, #slot1:getSortGoods(), function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			ActivityGoodsCard.StaticUpdate(slot2, uv0[slot1 + 1], uv1.TYPE_FRAGMENT)
			onButton(uv2, slot2, function ()
				slot0 = uv0

				if slot0:getConfig("num_limit") ~= 1 then
					slot0 = uv0

					if slot0:getConfig("commodity_type") == 4 then
						slot0 = uv1

						slot0:openSingleBox(uv0)
					else
						slot0 = uv1

						slot0:initMsgBox(uv0)
					end
				end
			end, SFX_PANEL)
		end
	end)

	slot2 = slot0.contextData.shopDatas.fragshop

	setText(slot0:findTF("time/day", slot0.fragShopTF), string.format("%02d", slot2:getRestDays()))
end

function slot0.updateFragRes(slot0)
	slot1 = getProxy(PlayerProxy)
	slot2 = slot1:getRawData()

	setText(slot0:findTF("res_fragment/count", slot0.top), slot2:getResource(PlayerConst.ResBlueprintFragment))
end

function slot0.CallFragResolve(slot0)
	if not slot0.resolvePanel then
		slot0.resolvePanel = FragResolvePanel.New(slot0)
		slot1 = slot0.resolvePanel

		slot1:Load()
	end

	slot1 = slot0.resolvePanel.buffer

	slot1:Reset()

	slot1 = slot0.resolvePanel.buffer

	slot1:Trigger("control")
end

function slot0.PlayActivityShopEnterVoice(slot0, slot1)
	slot2, slot3 = slot1:GetEnterVoice()

	if slot2 then
		slot0:playCV(slot2)
	end

	if slot3 then
		slot0:ShowShipWord(slot3)
	end
end

function slot0.PlayActivityShopPurchaseVoice(slot0, slot1)
	slot2, slot3 = slot1:GetPurchaseVoice()

	if slot2 then
		slot0:playCV(slot2)
	end

	if slot3 then
		slot0:ShowShipWord(slot3)
	end
end

function slot0.OnActivtyShopPurchaseDone(slot0, slot1)
	slot2 = nil
	slot3 = pairs
	slot4 = slot0.activityShops or {}

	for slot6, slot7 in slot3(slot4) do
		if slot7.activityId == slot1 then
			shop = slot7

			break
		end
	end

	if shop then
		slot0:PlayActivityShopPurchaseVoice(shop)
	end
end

function slot0.willExit(slot0)
	slot0:stopCV()

	for slot4, slot5 in ipairs(slot0.cards) do
		slot5:dispose()
	end

	slot1 = ipairs
	slot2 = slot0.activityCards or {}

	for slot4, slot5 in slot1(slot2) do
		slot5:dispose()
	end

	if slot0.refreshTimer then
		slot1 = slot0.refreshTimer

		slot1:Stop()

		slot0.refreshTimer = nil
	end

	if slot0.shopStreetTimer then
		slot1 = slot0.shopStreetTimer

		slot1:Stop()

		slot0.shopStreetTimer = nil
	end

	if slot0.guildTimer then
		slot1 = slot0.guildTimer

		slot1:Stop()

		slot0.guildTimer = nil
	end

	if slot0.resolvePanel then
		slot1 = slot0.resolvePanel

		slot1:Destroy()

		slot0.resolvePanel = nil
	end

	if slot0.resPanel then
		slot1 = slot0.resPanel

		slot1:exit()

		slot0.resPanel = nil
	end

	if slot0.tweens then
		cancelTweens(slot0.tweens)

		slot0.tweens = nil
	end

	slot0:closeSingleBox()
	slot0:closeActivityMsg()
	slot0:unBlurView()

	if slot0.paintingName then
		retPaintingPrefab(slot0.painting, slot0.paintingName)
	end
end

return slot0
