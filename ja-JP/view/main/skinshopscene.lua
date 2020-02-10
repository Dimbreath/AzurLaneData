slot0 = class("SkinShopScene", import("..base.BaseUI"))
slot1 = pg.ship_data_group
slot2 = pg.skin_page_template
slot3 = pg.ship_skin_template
slot4 = pg.shop_template
slot0.SHOP_TYPE_COMMON = 1
slot0.SHOP_TYPE_TIMELIMIT = 2
slot0.PAGE_ALL = -1
slot0.PAGE_TIME_LIMIT = -2
slot0.MSGBOXNAME = "SkinShopMsgbox"
slot0.EXSKINNAME = "ExSkinListUI"
slot0.OVERDUENAME = "SkinOverDueUI"
slot5 = {
	{
		"huanzhuangshagndian",
		"huanzhuangshagndian_en"
	},
	{
		"title_01",
		"title_en_01"
	}
}

function slot6(slot0)
	slot1 = {
		_go = slot0,
		_tf = tf(slot0),
		_content = slot1._tf:Find("content"),
		_mask = slot1._tf:Find("mask"),
		_icon = slot1._tf:Find("content/main/bg/icon"):GetComponent(typeof(Image)),
		_priceTF = slot1._tf:Find("content/main/bg/price")
	}

	setActive(slot1._priceTF, false)

	slot1._priceIcon = slot1._priceTF:Find("gem"):GetComponent(typeof(Image))
	slot1._priceTxt = slot1._priceTF:Find("gem/Text"):GetComponent(typeof(Text))
	slot2 = slot1._priceTF:Find("originalprice")
	slot1._opriceTxt = slot2:GetComponent(typeof(Text))
	slot2[1] = slot1._tf:Find("content/top/tags/tag_hot")
	slot2[2] = slot1._tf:Find("content/top/tags/tag_new")
	slot2[3] = slot1._tf:Find("content/top/tags/tag_advice")
	slot2[4] = slot1._tf:Find("content/top/tags/tag_activity")
	slot2[5] = slot1._tf:Find("content/top/tags/tag_discount")
	slot2[6] = slot1._tf:Find("content/top/tags/tag_nothing")
	slot2[7] = slot1._tf:Find("content/top/tags/tag_bought")
	slot2[8] = slot1._tf:Find("content/top/tags/tag_limit")
	slot2[MULTRES] = slot1._tf:Find("content/top/tags/tag_timelimit")
	slot1._tagTFs = {}

	function slot1.update(slot0, slot1)
		slot0.goodsVO = slot1
		slot2 = slot1:getSkinId()
		slot0.shipSkinConfig = uv0[slot2]

		LoadSpriteAsync("shipYardIcon/" .. uv0[slot2].prefab, function (slot0)
			uv0._icon.sprite = slot0
		end)

		for slot7, slot8 in pairs(slot0._tagTFs) do
			setActive(slot8, false)
		end

		if slot0.goodsVO.type == Goods.TYPE_SKIN then
			slot0._priceIcon.sprite = LoadSprite("props/" .. id2res(slot1:getConfig("resource_type")))

			if slot1:isDisCount() then
				slot0._priceTxt.text = slot1:getConfig("resource_num") * (100 - slot1:getConfig("discount")) / 100
			else
				slot0._priceTxt.text = slot6
			end

			uv1._opriceTxt.text = slot6

			setActive(go(uv1._opriceTxt), slot8 and slot7 < 1)

			slot9 = slot1.buyCount == 0

			if slot1:getConfig("genre") == ShopArgs.SkinShopTimeLimit then
				setActive(slot0._tagTFs[9], true)
			elseif slot9 then
				if slot8 or slot0.goodsVO:getConfig("tag") == 5 then
					setText(slot0._tagTFs[5]:Find("Text"), slot1:getConfig("discount") .. "%")
					setActive(slot0._tagTFs[5], true)
				elseif slot0._tagTFs[slot11] then
					setActive(slot0._tagTFs[slot11], true)
				else
					setActive(slot0._tagTFs[6], true)
				end
			else
				setActive(slot0._tagTFs[7], true)
			end
		end
	end

	function slot1.updateSelected(slot0, slot1)
		uv0._content.localPosition = Vector3(0, slot1 and -26 or -126, 0)

		setActive(uv0._priceTF, slot1 and slot0.goodsVO.type == Goods.TYPE_SKIN)
		setActive(uv0._mask, not slot1)
	end

	return slot1
end

function slot0.getUIName(slot0)
	return "SkinShopUI"
end

function slot0.setSkins(slot0, slot1)
	slot0.skinList = slot1

	slot0:filterSkins()
end

function slot0.setPlayer(slot0, slot1)
	slot0.playerVO = slot1
	slot0.skinTicket = slot0.playerVO:getSkinTicket()

	slot0._resPanel:setResources(slot1)
end

function slot0.filterSkins(slot0)
	slot0.skinGoodsVOs = {}

	for slot5, slot6 in ipairs(pg.shop_template.all) do
		if pg.shop_template[slot6].genre == ShopArgs.SkinShop or slot7 == ShopArgs.SkinShopTimeLimit then
			slot9.shop_id = slot6

			function (slot0)
				slot2 = getProxy(ShipSkinProxy)

				slot0:updateBuyCount(slot2:getSkinById(slot0:getSkinId()) and not slot2:isExpireType() and 1 or 0)
			end(Goods.New({}, Goods.TYPE_SKIN))

			slot9, slot10 = pg.TimeMgr.GetInstance():inTime(pg.shop_template[slot6].time)

			if slot9 then
				table.insert(slot0.skinGoodsVOs, slot8)
			end
		end
	end

	for slot6, slot7 in ipairs(pg.activity_shop_template.all) do
		if pg.activity_shop_template[slot7].commodity_type == DROP_TYPE_SKIN and getProxy(ActivityProxy):getActivityById(slot8.activity) and not slot9:isEnd() then
			slot11.shop_id = slot7
			slot10 = Goods.New({}, Goods.TYPE_ACTIVITY)

			slot1(slot10)
			table.insert(slot0.skinGoodsVOs, slot10)
		end
	end

	for slot6, slot7 in ipairs(pg.activity_shop_extra.all) do
		if pg.activity_shop_extra[slot7].commodity_type == DROP_TYPE_SKIN then
			slot9 = slot2:getActivityById(slot8.activity)

			if slot8.activity == 0 then
				if pg.TimeMgr.GetInstance():inTime(slot8.time) or slot9 and not slot9:isEnd() then
					slot11.shop_id = slot7
					slot10 = Goods.New({}, Goods.TYPE_ACTIVITY_EXTRA)

					slot1(slot10)
					table.insert(slot0.skinGoodsVOs, slot10)
				end
			end
		end
	end

	slot0:updateShipRect()
end

function slot0.init(slot0)
	slot0.bottomTF = slot0:findTF("bottom")
	slot0.topTF = slot0:findTF("blur_panel/adapt/top")
	slot0.leftPanel = slot0:findTF("noadapt/left_panel")
	slot0.title = slot0:findTF("title", slot0.topTF)
	slot0.titleEn = slot0:findTF("title_en", slot0.topTF)
	slot0.mainPanel = slot0:findTF("noadapt/main_panel")
	slot0.namePanel = slot0:findTF("name_bg", slot0.mainPanel)
	slot0.nameTxt = slot0:findTF("name_bg/name", slot0.mainPanel):GetComponent(typeof(Text))
	slot0.skinNameTxt = slot0:findTF("name_bg/skin_name", slot0.mainPanel):GetComponent(typeof(Text))
	slot0.rightPanel = slot0:findTF("right")
	slot0.charParent = slot0:findTF("char", slot0.rightPanel)
	slot0.paintingTF = slot0:findTF("paint", slot0.mainPanel)
	slot0.charBg = slot0:findTF("char_info", slot0.rightPanel)
	slot0.tags = slot0:findTF("char_info/tags", slot0.rightPanel)
	slot0.limitTxt = slot0:findTF("name_bg/limit_time/Text", slot0.mainPanel):GetComponent(typeof(Text))
	slot0.commonPanel = slot0:findTF("common", slot0.rightPanel)
	slot0.commonBGTF = slot0:findTF("bg", slot0.commonPanel)
	slot0.commonLabelTF = slot0:findTF("label", slot0.commonPanel)
	slot0.commonConsumeTF = slot0:findTF("consume", slot0.commonPanel)
	slot0.buyBtn = slot0:findTF("buy_btn", slot0.commonPanel)
	slot0.activityBtn = slot0:findTF("activty_btn", slot0.commonPanel)
	slot0.gotBtn = slot0:findTF("got_btn", slot0.commonPanel)
	slot0.priceTxt = slot0:findTF("consume/Text", slot0.commonPanel):GetComponent(typeof(Text))
	slot0.originalPriceTxt = slot0:findTF("consume/originalprice/Text", slot0.commonPanel):GetComponent(typeof(Text))
	slot0.timelimtPanel = slot0:findTF("timelimt", slot0.rightPanel)
	slot0.timelimitBtn = slot0:findTF("timelimit_btn", slot0.timelimtPanel)
	slot0.timelimitPriceTxt = slot0:findTF("consume/Text", slot0.timelimtPanel):GetComponent(typeof(Text))
	slot0.bg1 = slot0:findTF("bg/bg_1")
	slot0.bg2 = slot0:findTF("bg/bg_2")
	slot0.bgType = false
	slot0.defaultBg = slot0.bg1:GetComponent(typeof(Image)).sprite
	slot0.blurPanel = slot0:findTF("blur_panel")
	slot0._playerResOb = slot0:findTF("blur_panel/adapt/top/playerRes")
	slot0._resPanel = PlayerResource.New()

	tf(slot0._resPanel._go):SetParent(tf(slot0._playerResOb), false)
	setActive(slot0.mainPanel, false)

	Input.multiTouchEnabled = false
	slot0.viewMode = slot0.contextData.type or uv0.SHOP_TYPE_COMMON
	slot0.hideObjToggleTF = slot0:findTF("hideObjToggle", slot0.rightPanel)

	setActive(slot0.hideObjToggleTF, false)

	slot0.hideObjToggle = GetComponent(slot0.hideObjToggleTF, typeof(Toggle))
end

function slot0.didEnter(slot0)
	setActive(slot0.mainPanel, true)
	slot0:initShips()
	slot0:initSkinPage()
	onButton(slot0, slot0.topTF:Find("back_btn"), function ()
		uv0:emit(uv1.ON_BACK)
	end, SFX_CANCEL)
	onButton(slot0, slot0.bottomTF:Find("bg/right_arr"), function ()
		uv0:onNext()
	end, SFX_PANEL)
	onButton(slot0, slot0.bottomTF:Find("bg/left_arr"), function ()
		uv0:onPrev()
	end, SFX_PANEL)
end

function slot0.initSkinPage(slot0)
	slot0.countByIds = {}

	for slot4, slot5 in ipairs(uv0.all) do
		slot0.countByIds[slot5] = 0
	end

	for slot4, slot5 in ipairs(slot0.skinGoodsVOs) do
		slot8 = uv1[slot5:getSkinId()].shop_type_id == 0 and 9999 or slot7
		slot0.countByIds[slot8] = slot0.countByIds[slot8] + 1
	end

	slot1 = slot0:findTF("toggles/mask/content", slot0.leftPanel)

	for slot6, slot7 in ipairs(uv0.all) do
		if slot0.countByIds[slot7] > 0 then
			table.insert({}, slot7)
		end
	end

	if slot0.viewMode == uv2.SHOP_TYPE_TIMELIMIT then
		table.insert(slot2, 1, uv2.PAGE_TIME_LIMIT)
	end

	table.insert(slot2, 1, uv2.PAGE_ALL)

	function slot3(slot0)
		uv0.contextData.pageId = slot0
		uv0.isSwitch = true

		uv0:updateShipRect()
		triggerToggle(uv0.skinPageToggles[slot0], true)
	end

	slot4 = {}
	slot5 = math.floor(#slot2 / 2)

	function slot6(slot0)
		if slot0 > 0 then
			slot1 = table.remove(uv0, 1)

			slot1:SetAsLastSibling()
			table.insert(uv0, slot1)
		else
			slot1 = table.remove(uv0, #uv0)

			slot1:SetAsFirstSibling()
			table.insert(uv0, 1, slot1)
		end

		triggerToggle(uv0[uv1]:Find("toggle"), true)
	end

	function slot7()
		uv2(tonumber(go(uv0[uv1]).name))
	end

	slot0.skinPageToggles = {}

	for slot12, slot13 in ipairs(slot2) do
		slot14 = cloneTplTo(slot1.parent:Find("0"), slot1, slot13)

		setActive(slot14, true)

		slot0.skinPageToggles[slot13] = slot14:Find("toggle")

		onButton(slot0, slot14, function ()
			slot0 = nil

			for slot4, slot5 in ipairs(uv0) do
				if tonumber(go(slot5).name) == uv1 then
					slot0 = slot4

					break
				end
			end

			for slot5 = 1, math.abs(slot0 - uv2), 1 do
				uv3(slot1)
			end

			uv4()
		end, SFX_PANEL)
		slot0:UpdateTagStyle(slot14, uv0, slot13)
	end

	eachChild(slot1, function (slot0)
		if slot0.gameObject.activeSelf then
			table.insert(uv0, 1, slot0)
		end
	end)
	slot0:addVerticalDrag(slot0.leftPanel, slot6, slot7)
	slot0:UpdateViewMode(slot1)
end

function slot0.UpdateViewMode(slot0, slot1)
	slot2, slot3, slot4 = nil

	if slot0.viewMode == uv0.SHOP_TYPE_TIMELIMIT then
		slot2 = uv0.PAGE_TIME_LIMIT
		slot3 = Vector2(35.8, 605.6)
		slot4 = Vector2(-250, -88.3)
	elseif slot0.viewMode == uv0.SHOP_TYPE_COMMON then
		slot2 = uv0.PAGE_ALL
		slot3 = Vector2(217.41, 605.6)
		slot4 = Vector2(-100, -88.3)
	end

	setActive(slot0.leftPanel, slot0.viewMode == uv0.SHOP_TYPE_COMMON)
	triggerButton(slot1:Find(slot2), true)
	setAnchoredPosition(slot0.namePanel, slot3)
	setAnchoredPosition(slot0.paintingTF, slot4)
	setImageSprite(slot0.title, GetSpriteFromAtlas("ui/SkinShopUI_atlas", uv1[slot0.viewMode][1]), true)
	setImageSprite(slot0.titleEn, GetSpriteFromAtlas("ui/SkinShopUI_atlas", uv1[slot0.viewMode][2]), true)
end

function slot0.UpdateTagStyle(slot0, slot1, slot2, slot3)
	if slot2[slot3] then
		setImageSprite(slot1:Find("name"), GetSpriteFromAtlas("ui/SkinShopUI_atlas", "text_" .. slot2[slot3].res .. "01"), true)
		setImageSprite(slot1:Find("selected/Image"), GetSpriteFromAtlas("ui/SkinShopUI_atlas", "text_" .. slot2[slot3].res), true)
		setText(slot1:Find("eng"), string.upper(slot2[slot3].english_name or ""))
	elseif slot3 == uv0.PAGE_ALL then
		setImageSprite(slot1:Find("name"), GetSpriteFromAtlas("ui/SkinShopUI_atlas", "view_all01"), true)
		setImageSprite(slot1:Find("selected/Image"), GetSpriteFromAtlas("ui/SkinShopUI_atlas", "view_all02"), true)
		setText(slot1:Find("eng"), "ALL")
	end
end

function slot0.updateMainView(slot0, slot1)
	slot2 = slot1.shipSkinConfig
	slot0.showCardId = slot1.goodsVO.id
	slot0.nameTxt.text = HXSet.hxLan(ShipGroup.getDefaultShipConfig(slot2.ship_group).name)
	slot0.skinNameTxt.text = HXSet.hxLan(slot2.name)

	if slot0.prefabName ~= slot2.prefab then
		slot0:loadChar(slot4)

		slot0.prefabName = slot4
	end

	if slot0.painting ~= slot2.painting then
		slot0:loadPainting(slot5)

		slot0.painting = slot5
	end

	setActive(slot0.hideObjToggle, PathMgr.FileExists(PathMgr.getAssetBundle("painting/" .. slot5 .. "_n")))

	slot0.hideObjToggle.isOn = true
	slot7 = false

	eachChild(slot0.tags, function (slot0)
		if table.contains(uv0.tag, tonumber(go(slot0).name)) then
			uv1 = true
		end

		setActive(slot0, slot2)
	end)

	slot9.configId = slot3.id
	slot9.skin_id = slot2.id
	slot8 = Ship.New({})

	if slot8:getShipBgPrint() ~= slot8:rarity2bgPrintForGet() then
		GetSpriteFromAtlasAsync("bg/star_level_bg_" .. slot9, "", function (slot0)
			if not uv0.exited then
				setImageSprite(uv0:GetCurBgTransform(), slot0)
				uv0:AnimBg()
			end
		end)
	else
		setImageSprite(slot0:GetCurBgTransform(), slot0.defaultBg)
		slot0:AnimBg()
	end

	slot0:setBg(slot3, slot2, slot6)
	slot0:updatePrice(slot1.goodsVO)
	slot0:removeShopTimer()
	slot0:addShopTimer(slot1)
	slot0:updateBuyBtn(slot1.goodsVO)
end

function slot0.setBg(slot0, slot1, slot2, slot3)
	slot5.configId = slot1.id
	slot5.skin_id = slot2.id
	slot5 = Ship.New({}):getShipBgPrint(true)

	if slot3 and slot2.bg_sp ~= "" then
		slot5 = slot2.bg_sp
	end

	if slot5 ~= slot4:rarity2bgPrintForGet() then
		GetSpriteFromAtlasAsync("bg/star_level_bg_" .. slot5, "", function (slot0)
			if not uv0.exited then
				setImageSprite(uv0:GetCurBgTransform(), slot0)
				uv0:AnimBg()
			end
		end)
	else
		setImageSprite(slot0:GetCurBgTransform(), slot0.defaultBg)
		slot0:AnimBg()
	end

	slot0:setBg(slot1, slot2, slot3)
	slot0:updatePrice(card.goodsVO)
	slot0:removeShopTimer()
	slot0:addShopTimer(card)
	slot0:updateBuyBtn(card.goodsVO)
end

function slot0.setBg(slot0, slot1, slot2, slot3)
	slot5.configId = slot1.id
	slot5.skin_id = slot2.id
	slot5 = Ship.New({}):getShipBgPrint(true)

	if slot3 and slot2.bg_sp ~= "" then
		slot5 = slot2.bg_sp
	end

	if slot5 ~= slot4:rarity2bgPrintForGet() then
		GetSpriteFromAtlasAsync("bg/star_level_bg_" .. slot5, "", function (slot0)
			if not uv0.exited then
				setImageSprite(uv0:GetCurBgTransform(), slot0)
				uv0:AnimBg()
			end
		end)
	else
		setImageSprite(slot0:GetCurBgTransform(), slot0.defaultBg)
		slot0:AnimBg()
	end
end

function slot0.GetCurBgTransform(slot0)
	slot1 = nil
	slot0.bgType = not slot0.bgType

	return (slot0.bgType or slot0.bg2) and slot0.bg1
end

function slot0.AnimBg(slot0)
	slot1, slot2 = nil

	if slot0.bgType then
		slot1 = slot0.bg2
		slot2 = slot0.bg1
	else
		slot1 = slot0.bg1
		slot2 = slot0.bg2
	end

	slot1:SetAsLastSibling()
	LeanTween.alpha(slot1, 1, 0.8):setFrom(0):setOnComplete(System.Action(function ()
		setImageAlpha(uv0, 1)
		setImageAlpha(uv1, 0)
	end))
end

function slot0.onBuyDone(slot0, slot1)
	if _.detect(slot0.skinGoodsVOs, function (slot0)
		return slot0.id == uv0
	end) then
		slot0:updateBuyBtn(slot2)
		slot0:updatePrice(slot2)
	end
end

function slot0.updateBuyBtn(slot0, slot1)
	slot3 = nil

	if slot1:getConfig("genre") == ShopArgs.SkinShopTimeLimit then
		onButton(slot0, slot0.timelimitBtn, function ()
			slot1 = getProxy(ShipSkinProxy)

			if slot1:getSkinById(uv0:getSkinId()) and not slot1:isExpireType() then
				pg.TipsMgr:GetInstance():ShowTips(i18n("already_have_the_skin"))

				return
			end

			uv1:showTimeLimitSkinWindow(uv0)
		end, SFX_PANEL)

		slot3 = uv0[slot1:getSkinId()]
	else
		slot3 = uv0[slot1:getSkinId()]
		slot6 = slot1.type == Goods.TYPE_ACTIVITY or slot5 == Goods.TYPE_ACTIVITY_EXTRA
		slot7 = slot1.buyCount == 0

		setActive(slot0.buyBtn, not slot6 and slot7)
		setActive(slot0.gotBtn, not slot6 and not slot7)
		setActive(slot0.activityBtn, slot6)
		onButton(slot0, slot0.buyBtn, function ()
			if uv0.type == Goods.TYPE_SKIN then
				print(uv1.showCardId, "--", slot0.id)

				if uv1.showCardId == slot0.id then
					if slot0:isDisCount() then
						slot2 = (100 - slot0:getConfig("discount")) / 100 * slot0:getConfig("resource_num")
					end

					slot6.content = i18n("charge_scene_buy_confirm", slot2, HXSet.hxLan(uv2.name))

					function slot6.onYes()
						uv0:emit(SkinShopMediator.ON_SHOPPING, uv1.id, 1)
					end

					pg.MsgboxMgr:GetInstance():ShowMsgBox({})
				else
					pg.TipsMgr:GetInstance():ShowTips(ERROR_MESSAGE[9999])

					return
				end
			end
		end, SFX_PANEL)
		onButton(slot0, slot0.activityBtn, function ()
			slot0 = uv0
			slot2 = slot0:getConfig("activity")
			slot3 = getProxy(ActivityProxy):getActivityById(slot2)

			if slot2 == 0 and pg.TimeMgr.GetInstance():inTime(slot0:getConfig("time")) or slot3 and not slot3:isEnd() then
				if slot0.type == Goods.TYPE_ACTIVITY then
					uv1:emit(SkinShopMediator.GO_SHOPS_LAYER)
				elseif slot0.type == Goods.TYPE_ACTIVITY_EXTRA then
					if slot0:getConfig("scene") and #slot4 > 0 then
						uv1:emit(SkinShopMediator.OPEN_SCENE, slot4)
					else
						uv1:emit(SkinShopMediator.OPEN_ACTIVITY, slot2)
					end
				end
			else
				pg.TipsMgr:GetInstance():ShowTips(i18n("common_activity_not_start"))
			end
		end, SFX_PANEL)
	end

	slot4 = ShipGroup.getDefaultShipConfig(slot3.ship_group)

	onToggle(slot0, slot0.hideObjToggleTF, function (slot0)
		slot1 = uv0

		slot1.loadPainting(slot1, uv0.painting .. (slot0 and "" or "_n"))
		uv0:setBg(uv1, uv2, slot0)
	end, SFX_PANEL)
end

function slot0.showTimeLimitSkinWindow(slot0, slot1)
	slot2 = slot1:getConfig("resource_num")
	slot6 = pg.TimeMgr.GetInstance()
	slot17, slot18, slot8, slot9 = slot6:parseTimeFrom(slot1:getConfig("time_second") * slot2)
	slot12.content = i18n("exchange_limit_skin_tip", slot2, pg.ship_skin_template[slot1:getSkinId()].name, slot6, slot7)

	function slot12.onYes()
		if uv0.skinTicket < uv1 then
			pg.TipsMgr:GetInstance():ShowTips(i18n("common_no_item_1"))

			return
		end

		uv0:emit(SkinShopMediator.ON_SHOPPING, uv2.id, 1)
	end

	pg.MsgboxMgr:GetInstance():ShowMsgBox({})
end

function slot0.addShopTimer(slot0, slot1)
	slot3 = slot1.goodsVO:getSkinId()

	if slot0.skinTimer then
		slot0.skinTimer:Stop()
	end

	setActive(tf(go(slot0.limitTxt)).parent, true)

	if slot2:getConfig("genre") == ShopArgs.SkinShopTimeLimit then
		slot4 = getProxy(ShipSkinProxy)
		slot5 = slot4:getSkinById(slot3) and slot4:isExpireType() and not slot4:isExpired()

		setActive(tf(go(slot0.limitTxt)).parent, slot5)

		if slot5 then
			slot0.skinTimer = Timer.New(function ()
				uv1.limitTxt.text = skinTimeStamp(uv0:getRemainTime())
			end, 1, -1)

			slot0.skinTimer:Start()
			slot0.skinTimer.func()
		else
			setActive(tf(go(slot0.limitTxt)).parent, false)
		end

		return
	end

	slot4, slot5 = pg.TimeMgr.GetInstance():inTime(slot2:getConfig("time"))

	if not slot5 then
		setActive(tf(go(slot0.limitTxt)).parent, false)

		return
	end

	slot7 = pg.TimeMgr:GetInstance():Table2ServerTime(slot5)
	slot0.shopTimer = Timer.New(function ()
		if uv1 < uv0:GetServerTime() then
			uv2:removeShopTimer()
		end

		if uv1 - slot0 < 0 then
			slot1 = 0
		end

		if math.floor(slot1 / 86400) > 0 then
			uv2.limitTxt.text = i18n("time_remaining_tip") .. slot2 .. i18n("word_date")
		elseif math.floor(slot1 / 3600) > 0 then
			uv2.limitTxt.text = i18n("time_remaining_tip") .. slot3 .. i18n("word_hour")
		elseif math.floor(slot1 / 60) > 0 then
			uv2.limitTxt.text = i18n("time_remaining_tip") .. slot4 .. i18n("word_minute")
		else
			uv2.limitTxt.text = i18n("time_remaining_tip") .. slot1 .. i18n("word_second")
		end
	end, 1, -1)

	slot0.shopTimer:Start()
end

function slot0.removeShopTimer(slot0)
	if slot0.shopTimer then
		slot0.shopTimer:Stop()

		slot0.shopTimer = nil
	end
end

function slot0.updatePrice(slot0, slot1)
	slot3 = uv0[slot1:getSkinId()]
	slot5 = slot1:getConfig("genre") == ShopArgs.SkinShopTimeLimit

	setActive(slot0.commonPanel, not slot5)
	setActive(slot0.timelimtPanel, slot5)

	if slot5 then
		slot0.timelimitPriceTxt.text = (slot0.skinTicket < slot4:getConfig("resource_num") and "<color=" .. COLOR_RED .. ">" or "") .. slot0.skinTicket .. (slot0.skinTicket < slot6 and "</color>" or "") .. "/" .. slot6
	else
		slot6 = slot4.type == Goods.TYPE_SKIN

		setActive(slot0.commonBGTF, slot6)
		setActive(slot0.commonLabelTF, slot6)
		setActive(slot0.commonConsumeTF, slot6)

		if slot6 then
			if slot4:isDisCount() then
				slot0.priceTxt.text = slot4:getConfig("resource_num") * (100 - slot4:getConfig("discount")) / 100
			else
				slot0.priceTxt.text = slot8
			end

			slot0.originalPriceTxt.text = slot8

			setActive(tf(go(slot0.originalPriceTxt)).parent, slot4:isDisCount())
		end
	end
end

function slot0.loadPainting(slot0, slot1)
	slot0:recyclePainting()
	setPaintingPrefab(slot0.paintingTF, slot1, "chuanwu", true)
end

function slot0.recyclePainting(slot0)
	if slot0.painting then
		retPaintingPrefab(slot0.paintingTF, slot0.painting)
	end
end

function slot0.loadChar(slot0, slot1)
	slot0:recycleChar()
	pg.UIMgr:GetInstance():LoadingOn()
	PoolMgr.GetInstance():GetSpineChar(slot1, true, function (slot0)
		pg.UIMgr:GetInstance():LoadingOff()

		uv0.modelTf = tf(slot0)
		uv0.modelTf.localScale = Vector3(0.9, 0.9, 1)
		uv0.modelTf.localPosition = Vector3(0, 0, 0)

		pg.ViewUtils.SetLayer(uv0.modelTf, Layer.UI)
		setParent(uv0.modelTf, uv0.charParent)
		slot0:GetComponent("SpineAnimUI"):SetAction("normal", 0)
	end)
end

function slot0.recycleChar(slot0)
	if not IsNil(slot0.modelTf) then
		slot0.modelTf.gameObject:GetComponent("SpineAnimUI"):SetActionCallBack(nil)
		PoolMgr.GetInstance():ReturnSpineChar(slot0.prefabName, slot0.modelTf.gameObject)
	end

	if slot0.timer then
		slot0.timer:Stop()

		slot0.timer = nil
	end
end

function slot0.initShips(slot0)
	slot0.cards = {}
	slot0.shipRect = slot0.bottomTF:Find("scroll"):GetComponent("LScrollRect")

	function slot0.shipRect.onInitItem(slot0)
		slot1 = uv0(slot0)
		uv1.cards[slot0] = slot1

		onButton(uv1, slot1._tf, function ()
			if uv0.card then
				if uv0.contextData.key == uv1.goodsVO:getKey() then
					return
				end
			end

			if uv0.contextData.key then
				for slot3, slot4 in pairs(uv0.cards) do
					if slot4.goodsVO:getKey() == uv0.contextData.key then
						slot4:updateSelected(false)
					end
				end
			end

			uv1:updateSelected(true)

			uv0.contextData.key = uv1.goodsVO:getKey()
			uv0.card = uv1

			uv0:updateMainView(uv1)
		end, SFX_PANEL)
	end

	function slot0.shipRect.onUpdateItem(slot0, slot1)
		if not uv0.cards[slot1] then
			uv0.cards[slot1] = uv1(slot1)
		end

		slot2:update(uv0.displays[slot0 + 1])
		slot2.updateSelected(slot2, uv0.contextData.key == slot2.goodsVO:getKey())
	end

	function slot0.shipRect.onItemsUpdated()
		slot0 = uv0.displays[1]

		for slot4, slot5 in pairs(uv0.cards) do
			if uv0.isSwitch and slot0 and slot5.goodsVO.id == slot0.id then
				uv0.isSwitch = nil

				triggerButton(slot5._tf)
			end
		end

		setActive(uv0.mainPanel, slot0)
	end
end

function slot0.onNext(slot0)
	if slot0.index == #slot0.displays then
		return
	end

	slot1 = nil

	for slot5, slot6 in ipairs(slot0.displays) do
		if slot6:getKey() == slot0.contextData.key then
			slot1 = slot5

			break
		end
	end

	if slot1 then
		slot2 = false
		slot3 = math.min(slot1 + 1, #slot0.displays)
		slot0.index = slot3

		for slot8, slot9 in pairs(slot0.cards) do
			if slot9.goodsVO:getKey() == slot0.displays[slot3]:getKey() then
				triggerButton(slot9._tf)

				slot2 = true

				break
			end
		end

		if slot2 and function ()
			return getBounds(uv0.bottomTF:Find("scroll")):GetMax().x < getBounds(uv0.bottomTF:Find("scroll/content")):GetMax().x
		end() then
			slot0.shipRect:ScrollTo(slot0.shipRect:HeadIndexToValue(slot3 - 1))
		end
	end
end

function slot0.onPrev(slot0)
	if slot0.index == 1 then
		return
	end

	slot1 = nil

	for slot5, slot6 in ipairs(slot0.displays) do
		if slot6:getKey() == slot0.contextData.key then
			slot1 = slot5

			break
		end
	end

	if slot1 then
		slot2 = false
		slot3 = math.max(slot1 - 1, 1)
		slot0.index = slot3

		for slot8, slot9 in pairs(slot0.cards) do
			if slot9.goodsVO:getKey() == slot0.displays[slot3]:getKey() then
				triggerButton(slot9._tf)

				slot2 = true

				break
			end
		end

		if slot2 and function ()
			slot0 = getBounds(uv0.bottomTF:Find("scroll"))

			return getBounds(uv0.bottomTF:Find("scroll/content")):GetMin().x < slot0:GetMin().x and getBounds(uv0.card._tf):GetMin().x < slot0:GetMin().x
		end() then
			slot0.shipRect:ScrollTo(slot0.shipRect:HeadIndexToValue(slot3 - 1))
		end
	end
end

function slot0.updateShipRect(slot0)
	slot0.card = nil

	if slot0.contextData.pageId and slot0.shipRect then
		slot0.displays = {}

		for slot4, slot5 in ipairs(slot0.skinGoodsVOs) do
			slot9 = slot5:getConfig("genre") == ShopArgs.SkinShopTimeLimit

			if slot0.contextData.pageId == uv1.PAGE_TIME_LIMIT and slot9 or not slot9 and (slot0.contextData.pageId == uv1.PAGE_ALL or (uv0[slot5:getSkinId()].shop_type_id == 0 and 9999 or slot7) == slot0.contextData.pageId) then
				table.insert(slot0.displays, slot5)
			end
		end

		table.sort(slot0.displays, function (slot0, slot1)
			if (slot0.buyCount == 0 and 1 or 0) == (slot1.buyCount == 0 and 1 or 0) then
				if slot0:getConfig("order") == slot1:getConfig("order") then
					return slot0.id < slot1.id
				else
					return slot4 < slot5
				end
			else
				return slot3 < slot2
			end
		end)
		slot0.shipRect:SetTotalCount(#slot0.displays)
	end
end

function slot0.addVerticalDrag(slot0, slot1, slot2, slot3)
	slot4 = GetOrAddComponent(slot1, "EventTriggerListener")
	slot5 = 90
	slot6 = nil
	slot7 = 0
	slot8 = 0

	slot4:AddBeginDragFunc(function (slot0, slot1)
		uv0 = 0
		uv1 = 0
		uv2 = slot1.position
		prev = uv2.y

		if onBegin then
			onBegin()
		end
	end)
	slot4:AddDragFunc(function (slot0, slot1)
		if slot1.position.y < prev and uv0 ~= 0 then
			uv1 = slot1.position
			uv0 = 0
		elseif prev < slot1.position.y and uv2 ~= 0 then
			uv1 = slot1.position
			uv2 = 0
		end

		slot3 = math.abs(math.floor((slot1.position.y - uv1.y) / uv3))

		if uv4 and uv2 < slot3 then
			uv2 = slot3

			uv4(slot2)
		end

		if uv4 and slot3 < uv0 then
			uv0 = slot3

			uv4(slot2)
		end

		prev = uv1.y
	end)
	slot4:AddDragEndFunc(function (slot0, slot1)
		if uv0 then
			uv0()
		end
	end)
end

function slot0.willExit(slot0)
	slot0:recycleChar()
	slot0:recyclePainting()
	slot0:removeShopTimer()
	LeanTween.cancel(go(slot0.bg1))
	LeanTween.cancel(go(slot0.bg2))

	Input.multiTouchEnabled = true

	if slot0.skinTimer then
		slot0.skinTimer:Stop()
	end

	slot0.skinTimer = nil
	slot0.contextData.key = nil
end

return slot0
