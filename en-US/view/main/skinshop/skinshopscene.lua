slot0 = class("SkinShopScene", import("...base.BaseUI"))
slot1 = pg.skin_page_template
slot2 = pg.ship_skin_template
slot0.SHOP_TYPE_COMMON = 1
slot0.SHOP_TYPE_TIMELIMIT = 2
slot0.PAGE_ALL = -1
slot0.PAGE_TIME_LIMIT = -2
slot0.MSGBOXNAME = "SkinShopMsgbox"
slot0.EXSKINNAME = "ExSkinListUI"
slot0.OVERDUENAME = "SkinOverDueUI"
slot3 = {
	{
		"huanzhuangshagndian",
		"huanzhuangshagndian_en"
	},
	{
		"title_01",
		"title_en_01"
	}
}

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

	slot0._resPanel:setResources(slot1, {
		false,
		false,
		true
	})
end

function slot0.filterSkins(slot0)
	slot0.skinGoodsVOs = getProxy(ShipSkinProxy):GetAllSkins()

	slot0:updateShipRect()
end

function slot0.init(slot0)
	slot0.bottomTF = slot0:findTF("bottom")
	slot0.topTF = slot0:findTF("blur_panel/adapt/top")
	slot0.leftPanel = slot0:findTF("noadapt/left_panel")
	slot0.title = slot0:findTF("title", slot0.topTF)
	slot0.titleEn = slot0:findTF("title_en", slot0.topTF)
	slot0.live2dFilter = slot0.topTF:Find("live2d")
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
	slot0.bgRoot = slot0:findTF("bg")
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
	slot0.viewMode = slot0.contextData.type or slot0.SHOP_TYPE_COMMON
	slot0.hideObjToggleTF = slot0:findTF("hideObjToggle", slot0.rightPanel)

	setActive(slot0.hideObjToggleTF, false)

	slot0.hideObjToggle = GetComponent(slot0.hideObjToggleTF, typeof(Toggle))
end

function slot0.didEnter(slot0)
	setActive(slot0.mainPanel, true)
	slot0:initShips()
	slot0:initSkinPage()
	onButton(slot0, slot0.topTF:Find("back_btn"), function ()
		slot0:emit(slot1.ON_BACK)
	end, SFX_CANCEL)
	onButton(slot0, slot0.bottomTF:Find("bg/right_arr"), function ()
		slot0:onNext()
	end, SFX_PANEL)
	onButton(slot0, slot0.bottomTF:Find("bg/left_arr"), function ()
		slot0:onPrev()
	end, SFX_PANEL)

	slot0.isShowLive2dOnly = false

	onButton(slot0, slot0.live2dFilter, function ()
		if #slot0.displays == 0 or not _.any(slot0.displays, function (slot0)
			return slot0:isLive2DSkin(slot0:getSkinId())
		end) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("skinshop_live2d_fliter_failed"))

			return
		end

		if slot0.card then
			slot0 = slot0:isLive2DSkin(slot0.card.shipSkinConfig.id)
		end

		slot0:UpdateLive2dBtn(not slot0.isShowLive2dOnly)
		slot0:updateShipRect()

		if not slot0 then
			slot0:UpdateSelected()
		end
	end, SFX_PANEL)
end

function slot0.UpdateLive2dBtn(slot0, slot1)
	slot0.isShowLive2dOnly = slot1

	setActive(slot0.live2dFilter:Find("selected"), slot0.isShowLive2dOnly)
end

function slot0.UpdateSelected(slot0)
	if slot0.isShowLive2dOnly then
		slot1 = slot0.displays[1]

		for slot5, slot6 in pairs(slot0.cards) do
			if slot6.goodsVO.id == slot1.id then
				triggerButton(slot6._tf)

				break
			end
		end
	end
end

function slot0.initSkinPage(slot0)
	slot0.countByIds = {}

	for slot4, slot5 in ipairs(slot0.all) do
		slot0.countByIds[slot5] = 0
	end

	for slot4, slot5 in ipairs(slot0.skinGoodsVOs) do
		slot0.countByIds[(slot1[slot5:getSkinId()].shop_type_id == 0 and 9999) or slot7] = slot0.countByIds[(slot1[slot5.getSkinId()].shop_type_id == 0 and 9999) or slot7] + 1
	end

	slot1 = slot0:findTF("toggles/mask/content", slot0.leftPanel)
	slot2 = {}

	for slot6, slot7 in ipairs(slot0.all) do
		if slot0.countByIds[slot7] > 0 then
			table.insert(slot2, slot7)
		end
	end

	if slot0.viewMode == slot2.SHOP_TYPE_TIMELIMIT then
		table.insert(slot2, 1, slot2.PAGE_TIME_LIMIT)
	end

	table.insert(slot2, 1, slot2.PAGE_ALL)

	function slot3(slot0)
		slot0.contextData.pageId = slot0
		slot0.isSwitch = true

		slot0:updateShipRect(0)
		triggerToggle(slot0.skinPageToggles[slot0], true)
	end

	slot4 = {}
	slot5 = math.floor(#slot2 / 2)

	function slot6(slot0)
		if slot0 > 0 then
			slot1 = table.remove(slot0, 1)

			slot1:SetAsLastSibling()
			table.insert(slot0, slot1)
		else
			slot1 = table.remove(slot0, #slot0)

			slot1:SetAsFirstSibling()
			table.insert(slot0, 1, slot1)
		end

		triggerToggle(slot0[slot1]:Find("toggle"), true)
	end

	function slot7()
		slot0:UpdateLive2dBtn(false)
		slot1(tonumber(go(slot1[]).name))
	end

	slot8 = slot1.parent:Find("0")
	slot0.skinPageToggles = {}

	for slot12, slot13 in ipairs(slot2) do
		slot14 = cloneTplTo(slot8, slot1, slot13)

		setActive(slot14, true)

		slot0.skinPageToggles[slot13] = slot14:Find("toggle")

		onButton(slot0, slot14, function ()
			for slot4, slot5 in ipairs(slot0) do
				if tonumber(go(slot5).name) == slot1 then
					slot0 = slot4

					break
				end
			end

			for slot5 = 1, math.abs(slot1), 1 do
				slot3(slot1)
			end

			slot4()
		end, SFX_PANEL)
		slot0:UpdateTagStyle(slot14, slot0, slot13)
	end

	eachChild(slot1, function (slot0)
		if slot0.gameObject.activeSelf then
			table.insert(slot0, 1, slot0)
		end
	end)
	slot0:addVerticalDrag(slot0.leftPanel, slot6, slot7)
	slot0:UpdateViewMode(slot1)
end

function slot0.UpdateViewMode(slot0, slot1)
	slot2, slot3, slot4 = nil

	if slot0.viewMode == slot0.SHOP_TYPE_TIMELIMIT then
		slot2 = slot0.PAGE_TIME_LIMIT
		slot3 = Vector2(35.8, 605.6)
		slot4 = Vector2(-250, -88.3)
	elseif slot0.viewMode == slot0.SHOP_TYPE_COMMON then
		slot2 = slot0.PAGE_ALL
		slot3 = Vector2(217.41, 605.6)
		slot4 = Vector2(-100, -88.3)
	end

	setActive(slot0.leftPanel, slot0.viewMode == slot0.SHOP_TYPE_COMMON)
	triggerButton(slot1:Find(slot2), true)
	setAnchoredPosition(slot0.namePanel, slot3)
	setAnchoredPosition(slot0.paintingTF, slot4)
	setImageSprite(slot0.title, GetSpriteFromAtlas("ui/SkinShopUI_atlas", slot1[slot0.viewMode][1]), true)
	setImageSprite(slot0.titleEn, GetSpriteFromAtlas("ui/SkinShopUI_atlas", slot1[slot0.viewMode][2]), true)
end

function slot0.UpdateTagStyle(slot0, slot1, slot2, slot3)
	if slot2[slot3] then
		setImageSprite(slot1:Find("name"), GetSpriteFromAtlas("ui/SkinShopUI_atlas", "text_" .. slot2[slot3].res .. "01"), true)
		setImageSprite(slot1:Find("selected/Image"), GetSpriteFromAtlas("ui/SkinShopUI_atlas", "text_" .. slot2[slot3].res), true)
		setText(slot1:Find("eng"), string.upper(slot2[slot3].english_name or ""))
	elseif slot3 == slot0.PAGE_ALL then
		setImageSprite(slot1:Find("name"), GetSpriteFromAtlas("ui/SkinShopUI_atlas", "view_all01"), true)
		setImageSprite(slot1:Find("selected/Image"), GetSpriteFromAtlas("ui/SkinShopUI_atlas", "view_all02"), true)
		setText(slot1:Find("eng"), "ALL")
	end
end

function slot0.updateMainView(slot0, slot1)
	slot0.showCardId = slot1.goodsVO.id
	slot0.nameTxt.text = HXSet.hxLan(ShipGroup.getDefaultShipConfig(slot1.shipSkinConfig.ship_group).name)
	slot0.skinNameTxt.text = HXSet.hxLan(slot1.shipSkinConfig.name)

	if slot0.prefabName ~= slot1.shipSkinConfig.prefab then
		slot0:loadChar(slot4)

		slot0.prefabName = slot4
	end

	if slot0.painting ~= slot2.painting then
		slot0:loadPainting(slot5, true)

		slot0.painting = slot5
	end

	setActive(slot0.hideObjToggle, slot6)

	slot0.hideObjToggle.isOn = true
	slot7 = false

	eachChild(slot0.tags, function (slot0)
		if table.contains(slot0.tag, tonumber(go(slot0).name)) then
			slot1 = true
		end

		setActive(slot0, slot2)
	end)
	slot0:setBg(slot3, slot2, PathMgr.FileExists(PathMgr.getAssetBundle("painting/" .. slot5 .. "_n")))
	slot0:updatePrice(slot1.goodsVO)
	slot0:removeShopTimer()
	slot0:addShopTimer(slot1)
	slot0:updateBuyBtn(slot1.goodsVO)
end

function slot0.setBg(slot0, slot1, slot2, slot3)
	slot5 = Ship.New({
		configId = slot1.id,
		skin_id = slot2.id
	}):getShipBgPrint(true)

	if slot3 and slot2.bg_sp ~= "" then
		slot5 = slot2.bg_sp
	end

	if slot5 ~= slot4:rarity2bgPrintForGet() then
		pg.DynamicBgMgr.GetInstance():LoadBg(slot0, slot5, slot0.bgRoot, slot0:GetCurBgTransform(), function (slot0)
			return
		end, function (slot0)
			slot0:AnimBg()
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

	LeanTween.cancel(go(slot0.bg2))
	LeanTween.cancel(go(slot0.bg1))
	setActive(slot1, true)
	slot1:SetAsLastSibling()
	LeanTween.alpha(slot1, 1, 0.8):setFrom(0):setOnComplete(System.Action(function ()
		setImageAlpha(setImageAlpha, 1)
		setImageAlpha(setImageAlpha, 0)
	end))
end

function slot0.onBuyDone(slot0, slot1)
	if _.detect(slot0.skinGoodsVOs, function (slot0)
		return slot0.id == slot0
	end) then
		slot0:updateBuyBtn(slot2)
		slot0:updatePrice(slot2)
	end
end

function slot0.updateBuyBtn(slot0, slot1)
	slot3 = nil

	if slot1:getConfig("genre") == ShopArgs.SkinShopTimeLimit then
		onButton(slot0, slot0.timelimitBtn, function ()
			if getProxy(ShipSkinProxy):getSkinById(slot0:getSkinId()) and not slot1:isExpireType() then
				pg.TipsMgr:GetInstance():ShowTips(i18n("already_have_the_skin"))

				return
			end

			slot1:showTimeLimitSkinWindow(slot0)
		end, SFX_PANEL)

		slot3 = slot0[slot1:getSkinId()]
	else
		slot3 = slot0[slot1:getSkinId()]

		setActive(slot0.buyBtn, not (slot1.type == Goods.TYPE_ACTIVITY or slot5 == Goods.TYPE_ACTIVITY_EXTRA) and slot1.buyCount == 0)
		setActive(slot0.gotBtn, not (slot1.type == Goods.TYPE_ACTIVITY or slot5 == Goods.TYPE_ACTIVITY_EXTRA) and not (slot1.buyCount == 0))
		setActive(slot0.activityBtn, slot1.type == Goods.TYPE_ACTIVITY or slot5 == Goods.TYPE_ACTIVITY_EXTRA)
		onButton(slot0, slot0.buyBtn, function ()
			if slot0.type == Goods.TYPE_SKIN then
				if slot1.showCardId == slot0.id then
					slot1 = (100 - slot0:getConfig("discount")) / 100
					slot2 = slot0:getConfig("resource_num")

					if slot0:isDisCount() then
						slot2 = slot1 * slot2
					end

					pg.MsgboxMgr:GetInstance():ShowMsgBox({
						content = i18n("charge_scene_buy_confirm", slot2, HXSet.hxLan(slot2.name)),
						onYes = function ()
							slot0:emit(SkinShopMediator.ON_SHOPPING, slot1.id, 1)
						end
					})
				else
					pg.TipsMgr:GetInstance():ShowTips(ERROR_MESSAGE[9999])

					return
				end
			end
		end, SFX_PANEL)
		onButton(slot0, slot0.activityBtn, function ()
			slot1 = slot0:getConfig("time")
			slot3 = getProxy(ActivityProxy):getActivityById(slot0:getConfig("activity"))

			if (slot0.getConfig("activity") == 0 and pg.TimeMgr.GetInstance():inTime(slot1)) or (slot3 and not slot3:isEnd()) then
				if slot0.type == Goods.TYPE_ACTIVITY then
					slot1:emit(SkinShopMediator.GO_SHOPS_LAYER)
				elseif slot0.type == Goods.TYPE_ACTIVITY_EXTRA then
					if slot0:getConfig("scene") and #slot4 > 0 then
						slot1:emit(SkinShopMediator.OPEN_SCENE, slot4)
					else
						slot1:emit(SkinShopMediator.OPEN_ACTIVITY, slot2)
					end
				end
			else
				pg.TipsMgr:GetInstance():ShowTips(i18n("common_activity_not_start"))
			end
		end, SFX_PANEL)
	end

	slot4 = ShipGroup.getDefaultShipConfig(slot3.ship_group)

	onToggle(slot0, slot0.hideObjToggleTF, function (slot0)
		slot0:loadPainting(slot0.painting, slot0)
		slot0:setBg(slot0.setBg, slot0, slot0)
	end, SFX_PANEL)
end

function slot0.showTimeLimitSkinWindow(slot0, slot1)
	slot17, slot18, slot8, slot9 = pg.TimeMgr.GetInstance():parseTimeFrom(slot3)

	pg.MsgboxMgr:GetInstance():ShowMsgBox({
		content = i18n("exchange_limit_skin_tip", slot1:getConfig("resource_num"), pg.ship_skin_template[slot1:getSkinId()].name, slot6, slot7),
		onYes = function ()
			if slot0.skinTicket < slot1 then
				pg.TipsMgr:GetInstance():ShowTips(i18n("common_no_item_1"))

				return
			end

			slot0:emit(SkinShopMediator.ON_SHOPPING, slot2.id, 1)
		end
	})
end

function slot0.addShopTimer(slot0, slot1)
	slot3 = slot1.goodsVO.getSkinId(slot2)

	if slot0.skinTimer then
		slot0.skinTimer:Stop()
	end

	setActive(tf(go(slot0.limitTxt)).parent, true)

	if slot2:getConfig("genre") == ShopArgs.SkinShopTimeLimit then
		setActive(tf(go(slot0.limitTxt)).parent, getProxy(ShipSkinProxy):getSkinById(slot3) and slot4:isExpireType() and not slot4:isExpired())

		if getProxy(ShipSkinProxy).getSkinById(slot3) and slot4.isExpireType() and not slot4.isExpired() then
			slot0.skinTimer = Timer.New(function ()
				slot0.getRemainTime.limitTxt.text = skinTimeStamp(slot0:getRemainTime())
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

	slot7 = pg.TimeMgr:GetInstance().Table2ServerTime(slot6, slot5)
	slot0.shopTimer = Timer.New(function ()
		if slot0 < slot0:GetServerTime() then
			slot2:removeShopTimer()
		end

		if slot1 - slot0 < 0 then
			slot1 = 0
		end

		if math.floor(slot1 / 86400) > 0 then
			slot2.limitTxt.text = i18n("time_remaining_tip") .. slot2 .. i18n("word_date")
		elseif math.floor(slot1 / 3600) > 0 then
			slot2.limitTxt.text = i18n("time_remaining_tip") .. slot3 .. i18n("word_hour")
		elseif math.floor(slot1 / 60) > 0 then
			slot2.limitTxt.text = i18n("time_remaining_tip") .. slot4 .. i18n("word_minute")
		else
			slot2.limitTxt.text = i18n("time_remaining_tip") .. slot1 .. i18n("word_second")
		end
	end, 1, -1)

	slot0.shopTimer:Start()
	slot0.shopTimer.func()
end

function slot0.removeShopTimer(slot0)
	if slot0.shopTimer then
		slot0.shopTimer:Stop()

		slot0.shopTimer = nil
	end
end

function slot0.updatePrice(slot0, slot1)
	slot3 = slot0[slot1:getSkinId()]

	setActive(slot0.commonPanel, not (slot1.getConfig(slot4, "genre") == ShopArgs.SkinShopTimeLimit))
	setActive(slot0.timelimtPanel, slot1.getConfig(slot4, "genre") == ShopArgs.SkinShopTimeLimit)

	if slot5 then
		slot8 = slot0.skinTicket
		slot9 = (slot0.skinTicket < slot6 and "</color>") or ""
		slot0.timelimitPriceTxt.text = ((slot0.skinTicket < slot4:getConfig("resource_num") and "<color=" .. COLOR_RED .. ">") or "") .. "/" .. slot6
	else
		setActive(slot0.commonBGTF, slot4.type == Goods.TYPE_SKIN)
		setActive(slot0.commonLabelTF, slot4.type == Goods.TYPE_SKIN)
		setActive(slot0.commonConsumeTF, slot4.type == Goods.TYPE_SKIN)

		if slot4.type == Goods.TYPE_SKIN then
			slot7 = (100 - slot4:getConfig("discount")) / 100
			slot8 = slot4:getConfig("resource_num")

			if slot4:isDisCount() then
				slot0.priceTxt.text = slot8 * slot7
			else
				slot0.priceTxt.text = slot8
			end

			slot0.originalPriceTxt.text = slot8

			setActive(tf(go(slot0.originalPriceTxt)).parent, slot4:isDisCount())
		end
	end
end

function slot0.loadPainting(slot0, slot1, slot2)
	slot0:recyclePainting()
	slot0:setPaintingPrefab(slot0.paintingTF, slot1, "chuanwu", slot2)
end

function slot0.setPaintingPrefab(slot0, slot1, slot2, slot3, slot4)
	removeAllChildren(slot5)

	GetOrAddComponent(findTF(slot1, "fitter"), "PaintingScaler").FrameName = slot3 or ""
	GetOrAddComponent(findTF(slot1, "fitter"), "PaintingScaler").Tween = 1
	slot7 = slot2

	if not slot4 and PathMgr.FileExists(PathMgr.getAssetBundle("painting/" .. slot2 .. "_n")) then
		slot2 = slot2 .. "_n"
	end

	PoolMgr.GetInstance():GetPainting(slot2, false, function (slot0)
		setParent(slot0, slot0, false)

		if not IsNil(findTF(slot0, "Touch")) then
			setActive(slot1, false)
		end

		Ship.SetExpression(slot0:GetChild(0), slot1)
	end)
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

		slot0.modelTf = tf(slot0)
		slot0.modelTf.localScale = Vector3(0.9, 0.9, 1)
		slot0.modelTf.localPosition = Vector3(0, 0, 0)

		pg.ViewUtils.SetLayer(slot0.modelTf, Layer.UI)
		setParent(slot0.modelTf, slot0.charParent)
		slot0:GetComponent("SpineAnimUI"):SetAction("normal", 0)
	end)
end

function slot0.recycleChar(slot0)
	if not IsNil(slot0.modelTf) then
		slot0.modelTf.gameObject:GetComponent("SpineAnimUI").SetActionCallBack(slot1, nil)
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
		slot0.cards[slot0] = ShopSkinCard.New(slot0)

		onButton(slot0, ShopSkinCard.New(slot0)._tf, function ()
			if slot0.card and slot0.contextData.key == slot1.goodsVO:getKey() then
				return
			end

			if slot0.contextData.key then
				for slot3, slot4 in pairs(slot0.cards) do
					if slot4.goodsVO:getKey() == slot0.contextData.key then
						slot4:updateSelected(false)
					end
				end
			end

			slot1:updateSelected(true)

			slot1.updateSelected.contextData.key = slot1.goodsVO:getKey()
			slot1.updateSelected.contextData.card = slot1.goodsVO.getKey()

			slot1.updateSelected.contextData:updateMainView(slot1.updateSelected.contextData)

			for slot3, slot4 in ipairs(slot0.displays) do
				if slot4 == slot0.card.goodsVO then
					slot0.index = slot3
				end
			end
		end, SFX_PANEL)
	end

	function slot0.shipRect.onUpdateItem(slot0, slot1)
		if not slot0.cards[slot1] then
			slot0.cards[slot1] = ShopSkinCard.New(slot1)
		end

		slot2:update(slot3)
		slot2:updateSelected(slot0.contextData.key == slot2.goodsVO:getKey())
	end

	function slot0.shipRect.onItemsUpdated()
		for slot4, slot5 in pairs(slot0.cards) do
			if slot0.isSwitch and slot0 and slot5.goodsVO.id == slot0.id then
				slot0.isSwitch = nil

				triggerButton(slot5._tf)
			end
		end

		setActive(slot0.mainPanel, slot0)
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
		slot0.index = math.min(slot1 + 1, #slot0.displays)
		slot4 = nil
		slot5 = slot0.displays[math.min(slot1 + 1, #slot0.displays)]

		for slot9, slot10 in pairs(slot0.cards) do
			if slot10.goodsVO:getKey() == slot5:getKey() and slot10._tf.gameObject.name ~= "-1" then
				triggerButton(slot10._tf)

				slot2 = true
				slot4 = slot10

				break
			end
		end

		function slot6()
			slot0 = getBounds(slot0.bottomTF:Find("scroll"))
			slot2 = getBounds(slot0.card._tf)

			return getBounds(slot1._tf).GetMax(slot1).x - slot0:GetMax().x > 2
		end

		if slot2 and slot6() then
			slot0.shipRect:ScrollTo(slot0.shipRect.value - (slot0.shipRect:HeadIndexToValue(slot3 - 1) - slot0.shipRect:HeadIndexToValue(slot3)))
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
		slot0.index = math.max(slot1 - 1, 1)
		slot4 = slot0.displays[math.max(slot1 - 1, 1)]

		for slot8, slot9 in pairs(slot0.cards) do
			if slot9.goodsVO:getKey() == slot4:getKey() and slot9._tf.gameObject.name ~= "-1" then
				triggerButton(slot9._tf)

				slot2 = true

				break
			end
		end

		function slot5()
			slot0 = getBounds(slot0.bottomTF:Find("scroll"))

			return getBounds(slot0.bottomTF:Find("scroll/content")).GetMin(slot1).x < slot0:GetMin().x and getBounds(slot0.card._tf):GetMin().x < slot0:GetMin().x
		end

		if slot2 and slot5() then
			slot0.shipRect:ScrollTo(slot0.shipRect:HeadIndexToValue(slot3 - 1))
		end
	end
end

function slot0.isLive2DSkin(slot0, slot1)
	return table.contains(pg.ship_skin_template[slot1].tag, 1)
end

function slot0.updateShipRect(slot0, slot1)
	slot0.card = nil

	if slot0.contextData.pageId and slot0.shipRect then
		slot0.displays = {}

		function slot2(slot0)
			if slot0.isShowLive2dOnly and not slot0:isLive2DSkin(slot0) then
				return false
			else
				return true
			end
		end

		for slot6, slot7 in ipairs(slot0.skinGoodsVOs) do

			-- Decompilation error in this vicinity:
			slot10 = (slot0[slot7:getSkinId()].shop_type_id == 0 and 9999) or slot9
			slot11 = slot7:getConfig("genre") == ShopArgs.SkinShopTimeLimit
		end

		table.sort(slot0.displays, function (slot0, slot1)
			if ((slot0.buyCount == 0 and 1) or 0) == ((slot1.buyCount == 0 and 1) or 0) then
				if slot0:getConfig("order") == slot1:getConfig("order") then
					return slot0.id < slot1.id
				else
					return slot4 < slot5
				end
			else
				return slot3 < slot2
			end
		end)
		slot0.shipRect:SetTotalCount(#slot0.displays, slot1)
	end
end

function slot0.addVerticalDrag(slot0, slot1, slot2, slot3)
	slot4 = GetOrAddComponent(slot1, "EventTriggerListener")
	slot5 = 90
	slot6 = nil
	slot7 = 0
	slot8 = 0

	slot4:AddBeginDragFunc(function (slot0, slot1)
		slot0 = 0
		prev = 0.position.y

		if onBegin then
			onBegin()
		end
	end)
	slot4:AddDragFunc(function (slot0, slot1)
		if slot1.position.y < prev and slot0 ~= 0 then
			slot1 = slot1.position
			slot0 = 0
		elseif prev < slot1.position.y and slot2 ~= 0 then
			slot1 = slot1.position
			slot2 = 0
		end

		slot3 = math.abs(math.floor((slot1.position.y - slot1.y) / slot3))

		if math.floor and slot2 < slot3 then
			slot4(slot3)
		end

		if slot4 and slot3 < slot0 then
			slot0 = slot3

			slot4(slot2)
		end

		prev = slot1.y
	end)
	slot4:AddDragEndFunc(function (slot0, slot1)
		if slot0 then
			slot0()
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
