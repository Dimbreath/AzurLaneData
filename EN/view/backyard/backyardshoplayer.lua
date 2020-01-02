slot0 = class("BackYardShopLayer", import("..base.BaseUI"))
slot1 = Furniture.INDEX_TO_SHOP_TYPE

function slot0.getUIName(slot0)
	return "BackyardshopUI1"
end

function slot0.preload(slot0, slot1)
	PoolMgr.GetInstance():GetUI("BackYardIndexUI", true, function (slot0)
		slot0.filterTF = tf(slot0)

		slot0()
	end)
end

function slot0.setPlayerVO(slot0, slot1)
	slot0:updatePlayer(slot1)
end

function slot0.setFurnitures(slot0, slot1)
	slot0.furnitureVOs = slot1
end

function slot0.setDorm(slot0, slot1)
	slot0.dromVO = slot1
end

slot2 = {
	i18n("word_theme"),
	i18n("word_wallpaper"),
	i18n("word_floorpaper"),
	i18n("word_furniture"),
	i18n("word_decorate"),
	i18n("word_wall")
}

function slot0.SORT_FURNITURE_FUNC(slot0, slot1, slot2, slot3)
	slot3 = slot3 or 1

	if ((slot0:getConfig("gem_price") > 0 and slot0:getConfig("dorm_icon_price") <= 0 and 2) or (slot0:getConfig("gem_price") > 0 and 1) or 0) == ((slot1:getConfig("gem_price") > 0 and slot1:getConfig("dorm_icon_price") <= 0 and 2) or (slot1:getConfig("gem_price") > 0 and 1) or 0) then
		if ((slot0:isTimeLimit() and slot0:inTime() and slot0:canPurchase() and 1) or 0) == ((slot1:isTimeLimit() and slot1:inTime() and slot1:canPurchase() and 1) or 0) then
			if ((slot0:canPurchase() and 1) or 0) == ((slot1:canPurchase() and 1) or 0) then
				if slot0:getSortCurrency() == slot1:getSortCurrency() then
					if ((slot0:isLock(slot2) and 1) or 0) == ((slot1:isLock(slot2) and 1) or 0) then
						if slot3 == 1 then
							slot12 = {
								slot1.id < slot0.id
							}

							if not slot12 then
								slot12 = {
									slot0.id < slot1.id
								}
							end
						end

						return slot12[1]
					else
						return slot10 < slot11
					end
				else
					return slot0:getSortCurrency() < slot1:getSortCurrency()
				end
			else
				return slot9 < slot8
			end
		else
			return slot7 < slot6
		end
	else
		return slot5 < slot4
	end
end

function slot0.init(slot0)
	slot0.shopPanel = slot0:findTF("shopPanel")

	setParent(slot0.filterTF, slot0._tf)

	slot0.tagsPanel = slot0.shopPanel:Find("bg/tags")
	slot0.themePanel = slot0:findTF("bg/frame/theme", slot0.shopPanel)
	slot0.themeView = slot0:findTF("bg/frame/theme/bg", slot0.shopPanel)
	slot0.furnitureTypePanel = slot0:findTF("bg/frame/furniture_type", slot0.shopPanel)
	slot0.furnitureTypeView = slot0:findTF("bg/frame/furniture_type/bg", slot0.shopPanel)
	slot0.descPanel = slot0:findTF("descPanel")
	slot0.themDesc = slot0.descPanel:Find("frame/theme_desc")
	slot0.themDescBtn = slot0.descPanel:Find("frame/theme_desc/buy_btn")
	slot0.descView = slot0.descPanel:Find("frame/bg/themeView")

	setActive(slot0.descPanel, false)

	slot0.resGem = slot0:findTF("shopPanel/res_gem/Text")
	slot0.resDormMoney = slot0:findTF("shopPanel/res_dorm/Text")
	slot0._overlayUIMain = pg.UIMgr.GetInstance().OverlayMain
	slot0.msgBoxPanel = slot0:findTF("msgBox")
	slot0.orderFlag = nil
	slot0.searchInput = slot0:findTF("bg/filter_panel/InputField", slot0.shopPanel)
	slot0.ascToggle = slot0:findTF("shopPanel/bg/filter_panel/order_btn")
	slot0.ascTxt = slot0:findTF("asc", slot0.ascToggle)
	slot0.dascTxt = slot0:findTF("dasc", slot0.ascToggle)
	slot0.filterBtn = slot0:findTF("shopPanel/bg/filter_panel/filter_btn")

	setActive(slot0.filterTF, false)
	setActive(slot0.msgBoxPanel, false)

	slot0.UIMgr = pg.UIMgr.GetInstance()

	slot0.UIMgr:BlurPanel(slot0.shopPanel)

	slot0.cardItems = {}
	slot0.descItems = {}
end

function slot0.didEnter(slot0)
	slot0:initTags()
	onToggle(slot0, slot0.ascToggle, function (slot0)
		slot0:updateFurnitureOrder(slot0)
	end, SFX_PANEL)
	onButton(slot0, slot0.filterBtn, function ()
		slot0:openIndexPanel()
	end, SFX_PANEL)
	onButton(slot0, slot0.descPanel, function ()
		slot0:closeItemDesc()
	end, SFX_PANEL)
	onButton(slot0, slot0._tf, function ()
		slot0:emit(slot1.ON_CLOSE)
	end, SFX_CANCEL)

	slot0.searchKey = ""

	onInputChanged(slot0, slot0.searchInput, function (slot0)
		slot0.searchKey = slot0

		if (slot0.index or 1) ~= 1 then
			slot0:setFurnitrues(slot1[slot1 - 1])
			slot0.viewRect:SetTotalCount(#slot0.furnitures, -1)
		else
			slot0:sortThemes()
		end
	end)
	triggerToggle(slot0.tagsPanel:Find("tag_1"), true)
	slot0:setFurnitrues()
	slot0:initSubFurnitureType()
	triggerToggle(slot0.ascToggle, true)
end

function slot0.updateFurnitureOrder(slot0, slot1)
	slot0.orderFlag = (slot1 and BackYardShopFilterPanel.ORDER_MODE_ASC) or BackYardShopFilterPanel.ORDER_MODE_DASC

	setActive(slot0.ascTxt, slot1)
	setActive(slot0.dascTxt, not slot1)

	if slot0.indexPanel then
		slot0.indexPanel:filterFurnitures(slot0.furnitures, slot0.orderFlag)
	else
		slot0:setFurnitrues(slot0[(slot0.index or 1) - 1])
	end

	slot0.viewRect:SetTotalCount(#slot0.furnitures, -1)
end

function slot0.updatePlayer(slot0, slot1)
	slot0.playerVO = slot1

	setText(slot0.resGem, slot0.playerVO:getTotalGem())
	setText(slot0.resDormMoney, slot0.playerVO.dormMoney)
end

function slot0.initTags(slot0)
	for slot4, slot5 in ipairs(slot0) do
		slot6 = slot0.tagsPanel:Find("tag_" .. slot4)

		setText(slot6:Find("Text"), slot5)
		onToggle(slot0, slot6, function (slot0)
			if slot0 then
				slot0:filter(slot0.filter)
			end
		end, SFX_PANEL)
	end
end

function slot0.filter(slot0, slot1)
	setActive(slot0.themePanel, slot1 == 1)
	setActive(slot0.furnitureTypePanel, slot1 ~= 1)

	if slot1 == 1 then
		slot0.index = nil

		slot0:initTheme()
	else
		slot0.index = slot1

		slot0:setFurnitrues(slot0[slot1 - 1])

		if slot0.indexPanel then
			slot0.indexPanel:filterFurnitures(slot0.furnitures)
		end

		slot0.viewRect:SetTotalCount(#slot0.furnitures, -1)
	end
end

function slot0.initTheme(slot0)
	slot0.themeVOs = {}

	for slot5, slot6 in pairs(pg.backyard_theme_template.all) do
		if BackYardTheme.New({
			id = slot6
		}):getConfig("is_view") == 1 then
			table.insert(slot0.themeVOs, slot7)
		end
	end

	slot0.themVewRect = slot0.themeView:GetComponent("LScrollRect")

	function slot0.themVewRect.onInitItem(slot0)
		slot0:initThemeItem(slot0)
	end

	function slot0.themVewRect.onUpdateItem(slot0, slot1)
		slot0:updateThemeItem(slot0, slot1)
	end

	slot0.themeItems = {}

	slot0:sortThemes()
end

function slot0.createThemeItem(slot0, slot1)
	slot3 = findTF(({
		tr = tf(slot1),
		_go = slot1,
		maskBought = findTF(()["tr"], "bought"),
		maskLocked = findTF(()["tr"], "mask"),
		update = function (slot0, slot1, slot2, slot3, slot4)
			slot0.themeVO = slot1
			slot0.text = slot1:getConfig("desc")
			slot1.text = slot1:getConfig("name")

			SetActive(slot2, slot1:getConfig("new") == 1)
			SetActive(slot3, slot1:getConfig("hot") == 1)
			SetActive(slot4, defaultValue(SetActive, 0) > 0 and pg.TimeMgr.GetInstance():inTime(slot1:getConfig("discount_time")))
			setText(findTF(slot4, "Text"), defaultValue(SetActive, 0) .. "%off")

			if not slot4 then
				SetActive(slot5.maskBought, slot1:isBought(slot3))
				SetActive(slot5.maskLocked, not slot1:isUnLock(slot2))
			end

			slot6.sprite = GetSpriteFromAtlas("furnitureicon/" .. slot1:getConfig("icon"), "")
		end
	})["tr"], "desc"):GetComponent(typeof(Text))
	slot4 = findTF(()["tr"], "name/Text"):GetComponent(typeof(Text))
	slot5 = findTF(()["tr"], "icon"):GetComponent(typeof(Image))
	slot6 = findTF(()["tr"], "tags/tag_discount")
	slot7 = findTF(()["tr"], "tags/tag_new")
	slot8 = findTF(()["tr"], "tags/tag_hot")

	return 
end

function slot0.initThemeItem(slot0, slot1)
	slot2 = slot0:createThemeItem(slot1)

	onButton(slot0, slot2.maskLocked, function ()
		slot0:showMsgBox({
			icon = slot1.themeVO:getConfig("icon"),
			content = i18n("backyard_theme_lock_tip"),
			desc = i18n("backyard_theme_open_tip", slot1.themeVO:getConfig("deblocking"))
		}, nil, true)
	end)
	onButton(slot0, slot2.tr, function ()
		if not slot0.themeVO or (not slot0.themeVO:isUnLock(slot1.playerVO) and not slot0.themeVO:isBought(slot1.furnitureVOs)) then
			return
		end

		slot1:openItemDesc(slot0.themeVO)
	end)

	slot0.themeItems[slot1] = slot2
end

function slot0.sortThemes(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.themeVOs) do
		if not slot6:isOverTime() and slot6:isMatchSearchKey(slot0.searchKey) then
			table.insert(slot1, slot6)
		end
	end

	slot0.tempThemeVOs = slot1

	table.sort(slot0.tempThemeVOs, function (slot0, slot1)
		if ((slot0:isBought(slot0.furnitureVOs) and 0) or 1) == ((slot1:isBought(slot0.furnitureVOs) and 0) or 1) then
			if ((slot0:isUnLock(slot0.playerVO) and 1) or 0) == ((slot1:isUnLock(slot0.playerVO) and 1) or 0) then
				if slot0:getConfig("deblocking") == slot1:getConfig("deblocking") then
					if slot0:getConfig("new") == slot1:getConfig("new") then
						if slot0:GetDisCount() == slot1:GetDisCount() then
							return slot1:getConfig("id") < slot0:getConfig("id")
						else
							return slot11 < slot10
						end
					else
						return slot9 < slot8
					end
				else
					return slot6 < slot7
				end
			else
				return slot5 < slot4
			end
		else
			return slot3 < slot2
		end
	end)
	slot0.themVewRect:SetTotalCount(#slot0.tempThemeVOs, -1)
end

function slot0.updateThemeItem(slot0, slot1, slot2)
	if not slot0.themeItems[slot2] then
		slot0:initThemeItem(slot2)

		slot3 = slot0.themeItems[slot2]
	end

	slot3:update(slot0.tempThemeVOs[slot1 + 1], slot0.playerVO, slot0.furnitureVOs)
end

function slot0.openItemDesc(slot0, slot1)
	slot0.selectedThemeVO = slot1
	slot0.isOpenItemDesc = true

	SetActive(slot0.descPanel, true)
	setParent(slot0.descPanel, pg.UIMgr.GetInstance().OverlayMain)
	slot0:updateThemeDesc(slot1)
	slot0:updateSubThemeList(slot1:getConfig("ids"))
end

function slot0.updateThemeDesc(slot0, slot1)
	slot0:createThemeItem(slot0.themDesc).update(slot2, slot1, slot0.playerVO, slot0.furnitureVOs, true)
	setActive(slot0.themDescBtn, not slot1:isBought(slot0.furnitureVOs))
	onButton(slot0, slot0.themDescBtn, function ()
		slot0:showMsgBox({
			number = 0,
			isShowCalc = true,
			maxNumber = 1,
			isTheme = true,
			hideGem = true,
			max = 1,
			ids = slot1:getRemainFurIds(slot0.furnitureVOs),
			icon = slot1:getConfig("icon"),
			desc = slot1:getConfig("desc"),
			content = slot1:getConfig("name")
		}, function (slot0, slot1)
			slot0:emit(BackYardShopMediator.BUY_FURNITURE, slot1:getRemainFurIds(slot0.furnitureVOs), slot0)
		end)
	end)
end

function slot0.updateSubThemeList(slot0, slot1)
	slot0.descItemVOs = {}

	for slot5, slot6 in ipairs(slot1) do
		if slot0:getActiveFurnitureById(slot6) ~= nil then
			table.insert(slot0.descItemVOs, slot7)
		end
	end

	slot0.descRect = slot0.descView:GetComponent("LScrollRect")

	function slot0.descRect.onInitItem(slot0)
		slot0:onInitThemeDesc(slot0)
	end

	function slot0.descRect.onUpdateItem(slot0, slot1)
		slot0:onUpdateTheme(slot0, slot1)
	end

	slot0:sortSubTheme()
end

function slot0.getDescItem(slot0, slot1)
	for slot5, slot6 in pairs(slot0.descItems) do
		if slot5 == slot1 then
			return slot6
		end
	end

	return nil
end

function slot0.onInitThemeDesc(slot0, slot1)
	if slot0:getDescItem(slot1) == nil then
		function slot3()
			slot0 = slot0.furnitureVO:getConfig("name")

			return {
				isShowCalc = true,
				ids = {
					slot0.furnitureVO.id
				},
				icon = slot0.furnitureVO:getConfig("icon"),
				desc = slot0.furnitureVO:getConfig("describe"),
				content = slot0.furnitureVO:getConfig("name"),
				dormMoney = slot0.furnitureVO:getPrice(6),
				gem = slot0.furnitureVO:getPrice(4),
				max = slot0.furnitureVO:getConfig("count") - slot0.furnitureVO.count,
				maxNumber = slot0.furnitureVO:getConfig("count"),
				number = slot0.furnitureVO.count,
				purchased = not slot0.furnitureVO:canPurchase(),
				comfortable = slot0.furnitureVO:getConfig("comfortable")
			}
		end

		onButton(slot0, FurnitureCard.New(slot1) or slot2.tr, function ()
			if not slot0.furnitureVO then
				return
			end

			if not slot0.furnitureVO:inTime() then
				pg.TipsMgr.GetInstance():ShowTips(i18n("buy_furniture_overtime"))

				return
			end

			slot1:showMsgBox(slot2(), function (slot0, slot1)
				slot0:purchase(slot0, slot1, slot1)
			end)
		end)
		onButton(slot0, FurnitureCard.New(slot1) or slot2.maskTF, function ()
			slot0:showMsgBox(slot1(), nil, true)
		end)

		slot0.descItems[slot1] = FurnitureCard.New(slot1) or slot2

		return
	end
end

function slot0.purchase(slot0, slot1, slot2, slot3)
	slot4 = {}

	for slot8 = 1, slot2, 1 do
		table.insert(slot4, slot3.furnitureVO.id)
	end

	slot0:emit(BackYardShopMediator.BUY_FURNITURE, slot4, slot1)
end

function slot0.onUpdateTheme(slot0, slot1, slot2)
	if not slot0.descItems[slot2] then
		slot0:onInitThemeDesc(slot2)

		slot3 = slot0.descItems[slot2]
	end

	slot3:update(slot0.descItemVOs[slot1 + 1], slot0.playerVO)
end

function slot0.sortSubTheme(slot0)
	table.sort(slot0.descItemVOs, function (slot0, slot1)
		return slot0:SORT_FURNITURE_FUNC(slot1, slot1.playerVO.level)
	end)
	slot0.descRect:SetTotalCount(#slot0.descItemVOs, -1)
end

function slot0.closeItemDesc(slot0)
	if not go(slot0.descPanel).activeSelf then
		return
	end

	SetActive(slot0.descPanel, false)
	setParent(slot0.descPanel, slot0._tf)

	slot0.isOpenItemDesc = nil
	slot0.selectedThemeVO = nil
end

function slot0.getActiveFurnitureById(slot0, slot1)
	slot2 = nil
	slot3 = false

	if not slot0.furnitureVOs[slot1] then
		slot2 = Furniture.New({
			id = slot1
		})
	else
		slot2 = slot0.furnitureVOs[slot1]
		slot3 = true
	end

	if not slot2:isNotForSale() and (not slot2:isForActivity() or slot3) and not not slot2:inTime() then
		return slot2
	end
end

function slot0.setFurnitrues(slot0, slot1)
	slot0:setAllFurnitrues(slot1)

	if slot0.indexPanel then
		slot0.indexPanel:filterFurnitures(slot0.furnitures)
	else
		table.sort(slot0.furnitures, function (slot0, slot1)
			return slot0:SORT_FURNITURE_FUNC(slot1, slot1.playerVO.level, slot1.orderFlag)
		end)
	end
end

function slot0.setAllFurnitrues(slot0, slot1)
	slot0.furnitures = {}

	for slot6, slot7 in pairs(pg.furniture_shop_template.all) do
		if slot0:getActiveFurnitureById(slot7) and slot8:isMatchSearchKey(slot0.searchKey) then
			slot9 = slot8:getConfig("type")

			if slot1 and table.contains(slot1, slot9) then
				table.insert(slot0.furnitures, slot8)
			end
		end
	end
end

function slot0.initSubFurnitureType(slot0)
	slot0.viewRect = slot0.furnitureTypeView:GetComponent("LScrollRect")

	function slot0.viewRect.onInitItem(slot0)
		slot0:onInitFurnitrue(slot0)
	end

	function slot0.viewRect.onUpdateItem(slot0, slot1)
		slot0:onUpdateCard(slot0, slot1)
	end
end

function slot0.getCardItem(slot0, slot1)
	for slot5, slot6 in pairs(slot0.cardItems) do
		if slot5 == slot1 then
			return slot6
		end
	end

	return nil
end

function slot0.onInitFurnitrue(slot0, slot1)
	if slot0:getCardItem(slot1) == nil then
		function slot3()
			return {
				isShowCalc = true,
				ids = {
					slot0.furnitureVO.id
				},
				icon = slot0.furnitureVO:getConfig("icon"),
				desc = slot0.furnitureVO:getConfig("describe"),
				content = slot0.furnitureVO:getConfig("name"),
				max = slot0.furnitureVO:getConfig("count") - slot0.furnitureVO.count,
				maxNumber = slot0.furnitureVO:getConfig("count"),
				number = slot0.furnitureVO.count,
				dormMoney = slot0.furnitureVO:getPrice(6),
				gem = slot0.furnitureVO:getPrice(4),
				comfortable = slot0.furnitureVO:getConfig("comfortable"),
				purchased = not slot0.furnitureVO:canPurchase()
			}
		end

		onButton(slot0, FurnitureCard.New(slot1) or slot2.go, function ()
			if slot0.furnitureVO then
				slot1:showMsgBox(slot2(), function (slot0, slot1)
					slot0:purchase(slot0, slot1, slot1)
				end)
			end
		end, SOUND_PANEL)
		onButton(slot0, FurnitureCard.New(slot1) or slot2.maskTF, function ()
			if slot0.furnitureVO then
				slot1 = pg.backyard_theme_template[slot0.furnitureVO:getConfig("themeId")]

				if slot0.furnitureVO:inTheme() and slot1.playerVO.level < slot1.deblocking then
					pg.TipsMgr.GetInstance():ShowTips(i18n("backyard_theme_lock_tip"))

					return
				end

				slot1:showMsgBox(slot2(), nil, true)
			end
		end)

		slot0.cardItems[slot1] = FurnitureCard.New(slot1) or slot2

		return
	end
end

function slot0.onUpdateCard(slot0, slot1, slot2)
	if slot0.cardItems then
		if not slot0.cardItems[slot2] then
			slot0:onInitFurnitrue(slot2)

			slot3 = slot0.cardItems[slot2]
		end

		slot3:update(slot0.furnitures[slot1 + 1], slot0.playerVO)
	end
end

function slot0.showMsgBox(slot0, slot1, slot2, slot3)
	slot0.isShowMsgBox = true

	setParent(slot0.msgBoxPanel, slot0._overlayUIMain)
	setActive(slot0.msgBoxPanel, true)

	slot6 = slot0:findTF("frame/border/infoPanel", slot0.msgBoxPanel)

	setActive(slot7, true)
	setActive(slot8, true)
	setActive(slot9, false)
	setActive(slot10, false)
	setActive(slot5, slot1.isShowCalc)
	setImageSprite(slot0:findTF("frame/border/icon", slot0.msgBoxPanel), GetSpriteFromAtlas("furnitureicon/" .. slot1.icon, ""))
	setText(slot0:findTF("frame/border/desc", slot0.msgBoxPanel), slot1.content or "")
	setText(slot0:findTF("frame/border/desc_1", slot0.msgBoxPanel), slot1.desc or "")

	slot11, slot12 = nil

	setActive(slot0:findTF("frame/border/express", slot0.msgBoxPanel), slot1.ids)

	if slot1.ids then
		slot13 = {}

		for slot17, slot18 in ipairs(slot1.ids) do
			table.insert(slot13, Furniture.New({
				id = slot18
			}))
		end

		slot14 = slot0.dromVO:getComfortable()

		slot15(slot13)

		if not slot1.isTheme then
			function slot11(slot0)
				for slot4 = table.getCount(slot0), slot0 - 1, 1 do
					table.insert(slot0, Furniture.New({
						id = slot1.ids[1]
					}))
				end

				for slot4 = 1, table.getCount(slot0) - slot0, 1 do
					table.remove(slot0, #slot0)
				end

				slot2(slot0)
			end
		end
	end

	slot13 = 1

	if slot1.isShowCalc then
		slot14, slot15 = slot0.calcFurnituresPrice(slot1.ids)

		if slot1.hideGem then
			slot14 = 0
		end

		slot16 = slot0:findTF("value/Text", slot5)

		setText(slot0:findTF("max/Text", slot5), "+" .. slot1.max)
		setActive(slot0:findTF("price/dm_icon/Text", slot5).parent, slot15 > 0)
		setActive(slot0:findTF("price/gem_icon/Text", slot5).parent, slot14 > 0)
		setActive(slot0:findTF("price/line", slot5), slot15 > 0 and slot14 > 0)
		setText(slot17, slot15)
		setText(slot0.findTF("price/gem_icon/Text", slot5), slot14)

		if not slot1.isTheme then
			slot20()
			onButton(slot0, slot0:findTF("arr_left", slot5), function ()
				if slot0.max == slot1 then
					return
				end

				slot1 = math.min(slot1 + 1, slot0.max)

				slot0.max()
			end)
			onButton(slot0, slot0:findTF("arr_right", slot5), function ()
				if slot0 == 1 then
					return
				end

				slot0 = math.max(slot0 - 1, 1)

				slot0 - 1()
			end)
			onButton(slot0, slot0:findTF("max", slot5), function ()
				if slot0.max == slot1 then
					return
				end

				slot1 = slot0.max

				slot2()
			end)
		else
			setText(slot16, 1)
			removeOnButton(slot0:findTF("arr_left", slot5))
			removeOnButton(slot0:findTF("arr_right", slot5))
			removeOnButton(slot0:findTF("max", slot5))
		end

		setActive(slot9, slot15 > 0)
		setActive(slot10, slot14 > 0)
		setActive(slot7, false)
	end

	setActive(slot6, slot1.purchased)
	setActive(slot5, not slot1.purchased and slot1.isShowCalc)
	setActive(slot4, not slot1.purchased and slot1.isShowCalc)
	setActive(slot8, not slot3)

	if slot1.purchased then
		slot14, slot15 = slot0.calcFurnituresPrice(slot1.ids)

		if slot1.hideGem then
			slot14 = 0
		end

		setActive(slot0:findTF("price/dm_icon/Text", slot6).parent, slot15 > 0)
		setActive(slot0:findTF("price/gem_icon/Text", slot6).parent, slot14 > 0)
		setActive(slot0:findTF("price/line", slot6), slot15 > 0 and slot14 > 0)
		setText(slot19, slot15)
		setText(slot0.findTF("price/gem_icon/Text", slot6), slot14)
		setText(setActive, slot1.number .. "/" .. slot1.maxNumber)
		setText(slot0.findTF("price/line", slot6), slot1.comfortable)
		setActive(slot7, true)
		setActive(slot8, not slot3)
		setActive(slot9, false)
		setActive(slot10, false)
	end

	onButton(slot0, slot7, function ()
		slot0:closeMsgBox()
	end, SFX_CONFIRM)
	onButton(slot0, slot8, function ()
		slot0:closeMsgBox()
	end, SFX_CANCEL)
	onButton(slot0, slot10, function ()
		slot0:closeMsgBox()

		if slot0 then
			slot1(4, slot2)
		end
	end, SFX_CANCEL)
	onButton(slot0, slot9, function ()
		slot0:closeMsgBox()

		if slot0 then
			slot1(6, slot2)
		end
	end, SFX_CANCEL)
end

function slot0.calcFurnituresPrice(slot0)
	slot1 = 0
	slot2 = 0

	for slot6, slot7 in ipairs(slot0) do
		slot8 = Furniture.New({
			id = slot7
		})
		slot1 = slot1 + slot8:getPrice(4)
		slot2 = slot2 + slot8:getPrice(6)
	end

	return slot1, slot2
end

function slot0.updateFurnitrue(slot0, slot1)
	slot0.furnitureVOs[slot1.id] = slot1

	if slot0.descItemVOs then
		for slot5, slot6 in ipairs(slot0.descItemVOs) do
			if slot6.id == slot1.id then
				slot0.descItemVOs[slot5] = slot1

				break
			end
		end

		slot0:sortSubTheme()
	end

	if slot0.furnitures then
		for slot5, slot6 in ipairs(slot0.furnitures) do
			if slot6.id == slot1.id then
				slot0.furnitures[slot5] = slot1

				break
			end
		end

		if slot0.index then
			slot0:filter(slot0.index)
		end
	end

	if slot0.isOpenItemDesc and slot0.selectedThemeVO then
		slot0:updateThemeDesc(slot0.selectedThemeVO)
	end
end

function slot0.updateThemes(slot0)
	slot0:sortThemes()
end

function slot0.closeMsgBox(slot0)
	slot0.isShowMsgBox = nil

	setParent(slot0.msgBoxPanel, slot0._tf)
	setActive(slot0.msgBoxPanel, false)
end

function slot0.openIndexPanel(slot0)
	if not slot0.indexPanel then
		slot0.indexPanel = BackYardShopFilterPanel.New(slot0.filterTF, BackYardShopFilterPanel.TYPE_SHOP)

		slot0.indexPanel:attach(slot0)
		slot0.indexPanel:updateOrderMode(slot0.orderFlag)
	end

	setParent(slot0.filterTF, slot0._overlayUIMain)
	slot0.indexPanel:show()

	if (slot0.index or 1) ~= 1 then
		slot0.index = slot1

		slot0:setAllFurnitrues(slot0[slot1 - 1])
		slot0.indexPanel:setFilterData(slot0.furnitures)
	end

	function slot0.indexPanel.confirmFunc()
		if slot0 ~= 1 then
			slot1.viewRect:SetTotalCount(#slot1.furnitures, -1)
		end

		setText(slot1.filterBtn:Find("Text"), slot1.indexPanel.sortTxt)
	end

	function slot0.indexPanel.onHideFunc()
		setParent(slot0.filterTF, slot0._tf)
	end
end

function slot0.onBackPressed(slot0)
	if slot0.isShowMsgBox then
		slot0:closeMsgBox()
	elseif slot0.isOpenItemDesc then
		slot0:closeItemDesc()
	elseif slot0.indexPanel and go(slot0.indexPanel._go).activeSelf then
		slot0.indexPanel:hide()
	else
		triggerButton(slot0._tf)
	end
end

function slot0.willExit(slot0)
	slot0.UIMgr:UnblurPanel(slot0.shopPanel, slot0._tf)
	setParent(slot0.descPanel, slot0._tf)

	if slot0.isShowMsgBox then
		slot0:closeMsgBox()
	end

	slot1 = pairs
	slot2 = slot0.cardItems or {}

	for slot4, slot5 in slot1(slot2) do
		slot5:dispose()
	end

	slot1 = pairs
	slot2 = slot0.descItems or {}

	for slot4, slot5 in slot1(slot2) do
		slot5:dispose()
	end

	if slot0.indexPanel then
		slot0.indexPanel:hide()
		slot0.indexPanel:detach()
	end

	slot0.indexPanel = nil

	PoolMgr.GetInstance():ReturnUI("BackYardIndexUI", slot0.filterTF)
end

return slot0
