slot0 = class
slot1 = "ShopsScene"
slot2 = import
slot3 = "..base.BaseUI"
slot0 = slot0(slot1, slot2(slot3))
slot1 = "activity"
slot0.TYPE_ACTIVITY = slot1
slot1 = "shopstreet"
slot0.TYPE_SHOP_STREET = slot1
slot1 = "supplies"
slot0.TYPE_MILITARY_SHOP = slot1
slot1 = "guild"
slot0.TYPE_GUILD = slot1
slot1 = "sham"
slot0.TYPE_SHAM_SHOP = slot1
slot1 = "escort"
slot0.TYPE_ESCORT_SHOP = slot1
slot1 = "fragment"
slot0.TYPE_FRAGMENT = slot1

function slot1(slot0)
	slot1 = "shopsUI"

	return slot1
end

slot0.getUIName = slot1

function slot1(slot0)
	slot1 = {}
	slot0.bgs = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "blur_panel/adapt/top"
	slot1 = slot1(slot2, slot3)
	slot0.top = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "frame/item_tpl"
	slot1 = slot1(slot2, slot3)
	slot0.goodTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "frame/item_activity_tpl"
	slot1 = slot1(slot2, slot3)
	slot0.goodActivityTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "frame/item_sham_tpl"
	slot1 = slot1(slot2, slot3)
	slot0.goodShamTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "frame/item_fragment_tpl"
	slot1 = slot1(slot2, slot3)
	slot0.goodFragTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "frame/bottom"
	slot1 = slot1(slot2, slot3)
	slot0.bottomPanel = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "frame/switch_btn"
	slot1 = slot1(slot2, slot3)
	slot0.switchBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "frame/skin_btn"
	slot1 = slot1(slot2, slot3)
	slot0.skinBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "frame/chat"
	slot1 = slot1(slot2, slot3)
	slot0.chat = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "Text"
	slot4 = slot0.chat
	slot1 = slot1(slot2, slot3, slot4)
	slot0.chatText = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "paint_touch"
	slot1 = slot1(slot2, slot3)
	slot0.buzhihuoTouch = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "activity_bg"
	slot1 = slot1(slot2, slot3)
	slot0.activityBg = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "back_button"
	slot4 = slot0.top
	slot1 = slot1(slot2, slot3, slot4)
	slot0.backBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "option"
	slot4 = slot0.top
	slot1 = slot1(slot2, slot3, slot4)
	slot0.homeBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "paint"
	slot1 = slot1(slot2, slot3)
	slot0.painting = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "bili_bg"
	slot1 = slot1(slot2, slot3)
	slot0.biliBg = slot1
	slot1 = slot0.biliBg

	if slot1 then
		slot1 = setActive
		slot2 = slot0.biliBg
		slot3 = false

		slot1(slot2, slot3)
	end

	slot1 = PlayerResource
	slot1 = slot1.New
	slot1 = slot1()
	slot0.resPanel = slot1
	slot1 = slot0.resPanel
	slot2 = slot1
	slot1 = slot1.setParent
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "res"
	slot6 = slot0.top
	slot3 = slot3(slot4, slot5, slot6)
	slot4 = false

	slot1(slot2, slot3, slot4)

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "frame/bottom/left_arr"
	slot1 = slot1(slot2, slot3)
	slot0.leftArr = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "frame/bottom/right_arr"
	slot1 = slot1(slot2, slot3)
	slot0.rightArr = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "frame"
	slot1 = slot1(slot2, slot3)
	slot0.frame = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "frame/viewContainer"
	slot1 = slot1(slot2, slot3)
	slot0.viewContainer = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "military_shop"
	slot4 = slot0.viewContainer
	slot1 = slot1(slot2, slot3, slot4)
	slot0.militaryShopTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "shop_street"
	slot4 = slot0.viewContainer
	slot1 = slot1(slot2, slot3, slot4)
	slot0.shopStreetTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "activity_shop"
	slot4 = slot0.viewContainer
	slot1 = slot1(slot2, slot3, slot4)
	slot0.activityShopTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "guild_shop"
	slot4 = slot0.viewContainer
	slot1 = slot1(slot2, slot3, slot4)
	slot0.guildShopTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "sham_shop"
	slot4 = slot0.viewContainer
	slot1 = slot1(slot2, slot3, slot4)
	slot0.shamShopTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "escort_shop"
	slot4 = slot0.viewContainer
	slot1 = slot1(slot2, slot3, slot4)
	slot0.escortShopTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "frag_shop"
	slot4 = slot0.viewContainer
	slot1 = slot1(slot2, slot3, slot4)
	slot0.fragShopTF = slot1
	slot1 = {}
	slot0.cards = slot1
	slot1 = setText
	slot2 = slot0.goodTF
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "mask/tag/sellout_tag"
	slot2 = slot2(slot3, slot4)
	slot3 = i18n
	slot4 = "word_sell_out"

	slot1(slot2, slot3(slot4))

	slot1 = setText
	slot2 = slot0.goodActivityTF
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "mask/tag/sellout_tag"
	slot2 = slot2(slot3, slot4)
	slot3 = i18n
	slot4 = "word_sell_out"

	slot1(slot2, slot3(slot4))

	slot1 = setText
	slot2 = slot0.goodShamTF
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "mask/tag/sellout_tag"
	slot2 = slot2(slot3, slot4)
	slot3 = i18n
	slot4 = "word_sell_out"

	slot1(slot2, slot3(slot4))

	slot1 = setText
	slot2 = slot0.goodFragTF
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "mask/tag/sellout_tag"
	slot2 = slot2(slot3, slot4)
	slot3 = i18n
	slot4 = "word_sell_out"

	slot1(slot2, slot3(slot4))

	slot1 = setText
	slot2 = slot0.shamShopTF
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "time"
	slot2 = slot2(slot3, slot4)
	slot3 = i18n
	slot4 = "title_limit_time"

	slot1(slot2, slot3(slot4))

	slot1 = setText
	slot2 = slot0.shamShopTF
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "time/text"
	slot2 = slot2(slot3, slot4)
	slot3 = i18n
	slot4 = "shops_rest_day"

	slot1(slot2, slot3(slot4))

	slot1 = setText
	slot2 = slot0.shamShopTF
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "time/text_day"
	slot2 = slot2(slot3, slot4)
	slot3 = i18n
	slot4 = "word_date"

	slot1(slot2, slot3(slot4))

	slot1 = setText
	slot2 = slot0.fragShopTF
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "time"
	slot2 = slot2(slot3, slot4)
	slot3 = i18n
	slot4 = "title_limit_time"

	slot1(slot2, slot3(slot4))

	slot1 = setText
	slot2 = slot0.fragShopTF
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "time/text"
	slot2 = slot2(slot3, slot4)
	slot3 = i18n
	slot4 = "shops_rest_day"

	slot1(slot2, slot3(slot4))

	slot1 = setText
	slot2 = slot0.fragShopTF
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "time/text_day"
	slot2 = slot2(slot3, slot4)
	slot3 = i18n
	slot4 = "word_date"

	slot1(slot2, slot3(slot4))
end

slot0.init = slot1

function slot1(slot0, slot1)
	slot0.militaryShop = slot1
	slot3 = slot0
	slot2 = slot0.updateMilitaryShop

	slot2(slot3)
end

slot0.setMilitaryShop = slot1

function slot1(slot0, slot1)
	slot0.guildShop = slot1
	slot2 = slot1.nextRefreshTime
	slot0.guildShopRefreshTime = slot2
end

slot0.setGuildShop = slot1

function slot1(slot0, slot1)
	slot0.shamShop = slot1
end

slot0.setShamShop = slot1

function slot1(slot0, slot1)
	slot0.escortShop = slot1
end

slot0.setEscortShop = slot1

function slot1(slot0, slot1)
	slot0.player = slot1
	slot2 = slot1.exploit
	slot0.exploit = slot2
	slot3 = slot0
	slot2 = slot0.updateExploit

	slot2(slot3)

	slot2 = slot0.resPanel
	slot3 = slot2
	slot2 = slot2.setResources
	slot4 = slot1

	slot2(slot3, slot4)

	slot3 = slot0
	slot2 = slot0.updateActivityRes

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.updateGuildRes

	slot2(slot3)
end

slot0.updatePlayer = slot1

function slot1(slot0)
	slot1 = pg
	slot1 = slot1.UIMgr
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot2 = slot1
	slot1 = slot1.OverlayPanelPB
	slot3 = slot0.viewContainer
	slot4 = {}
	slot5 = {}
	slot7 = slot0
	slot6 = slot0.findTF
	slot8 = "blurBg"
	slot9 = slot0.viewContainer
	slot5[MULTRES] = slot6(slot7, slot8, slot9)
	slot4.pbList = slot5

	slot1(slot2, slot3, slot4)
end

slot0.blurView = slot1

function slot1(slot0)
	slot1 = pg
	slot1 = slot1.UIMgr
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot2 = slot1
	slot1 = slot1.UnOverlayPanel
	slot3 = slot0.viewContainer
	slot4 = slot0.frame

	slot1(slot2, slot3, slot4)
end

slot0.unBlurView = slot1

function slot1(slot0)
	slot1 = pg
	slot1 = slot1.arena_data_shop
	slot1 = slot1[1]
	slot0.millitaryShopCfg = slot1
	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.backBtn

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.closeView

		slot0(slot1)
	end

	slot5 = SFX_CANCEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = setActive
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "stamp"
	slot2 = slot2(slot3, slot4)
	slot3 = getProxy
	slot4 = TaskProxy
	slot3 = slot3(slot4)
	slot4 = slot3
	slot3 = slot3.mingshiTouchFlagEnabled

	slot1(slot2, slot3(slot4))

	slot1 = LOCK_CLICK_MINGSHI

	if slot1 then
		slot1 = setActive
		slot3 = slot0
		slot2 = slot0.findTF
		slot4 = "stamp"
		slot2 = slot2(slot3, slot4)
		slot3 = false

		slot1(slot2, slot3)
	end

	onButton(slot0, slot0:findTF("stamp"), function ()
		getProxy(TaskProxy):dealMingshiTouchFlag(4)
	end, SFX_CONFIRM)
	onButton(slot0, slot0.switchBtn, function ()
		if slot0.contextData ~= nil and slot0.contextData.chargePage ~= nil then
			slot0 = slot0.contextData.chargePage
		end

		slot0:emit(ShopsMediator.GO_MALL, slot0)
	end, SFX_CANCEL)
	onButton(slot0, slot0.skinBtn, function ()
		slot0:emit(ShopsMediator.ON_SKIN_SHOP)
	end, SFX_PANEL)
	onButton(slot0, slot0:findTF("refresh_btn", slot0.militaryShopTF), function ()
		if slot0.militaryShop.refreshCount - 1 >= #slot0.millitaryShopCfg.refresh_price then
			pg.TipsMgr.GetInstance():ShowTips(i18n("shopStreet_refresh_max_count"))

			return
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("refresh_shopStreet_question", i18n("word_gem_icon"), slot0.millitaryShopCfg.refresh_price[slot0.militaryShop.refreshCount] or slot0.millitaryShopCfg.refresh_price[#slot0.millitaryShopCfg.refresh_price], slot0.millitaryShopCfg.refresh_price[slot0.militaryShop.refreshCount] or slot0.millitaryShopCfg.refresh_price[#slot0.millitaryShopCfg.refresh_price].militaryShop.refreshCount - 1),
			onYes = function ()
				if slot0.player:getTotalGem() < slot0.player then
					pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))

					return
				else
					slot0:emit(ShopsMediator.REFRESH_MILITARY_SHOP)
				end
			end
		})
	end, SFX_PANEL)
	setActive(slot0.chat, false)
	onButton(slot0, slot0.buzhihuoTouch, function ()
		slot0:showRandomShipWord(pg.navalacademy_shoppingstreet_template[1].words_touch, false, "touch")
	end, SFX_PANEL)

	slot0.toggles = {}
	slot2 = slot0:getTpl("activity", slot1)
	slot0.curPage = nil

	table.sort(slot3, function (slot0, slot1)
		return slot0:getStartTime() < slot1:getStartTime()
	end)

	slot4, slot5, slot6 = ipairs(slot3)

	for slot7, slot8 in slot4, slot5, slot6 do
		slot10 = slot8
		slot9 = slot8.isEnd
		slot9 = slot9(slot10)

		if not slot9 then
			slot9 = cloneTplTo
			slot10 = slot2
			slot11 = slot1
			slot12 = slot8.activityId
			slot9 = slot9(slot10, slot11, slot12)
			slot10 = GetImageSpriteFromAtlasAsync
			slot11 = "ui/shopsui_atlas"
			slot13 = slot8
			slot12 = slot8.getToggleImage
			slot12 = slot12(slot13)
			slot13 = "02"
			slot12 = slot12 .. slot13
			slot13 = slot9

			slot10(slot11, slot12, slot13)

			slot10 = GetImageSpriteFromAtlasAsync
			slot11 = "ui/shopsui_atlas"
			slot13 = slot8
			slot12 = slot8.getToggleImage
			slot12 = slot12(slot13)
			slot13 = "01"
			slot12 = slot12 .. slot13
			slot14 = slot0
			slot13 = slot0.findTF
			slot15 = "Image"
			slot16 = slot9

			slot10(slot11, slot12, slot13(slot14, slot15, slot16))

			slot10 = onToggle
			slot11 = slot0
			slot12 = slot9

			function slot13(slot0)
				if slot0 then
					slot1 = slot0
					slot2 = slot1
					slot1 = slot1.clearShipWord

					slot1(slot2)

					slot1 = slot0
					slot1 = slot1.activityShops
					slot2 = slot1
					slot2 = slot2.activityId
					slot1 = slot1[slot2]
					slot2 = slot0
					slot3 = slot2
					slot2 = slot2.PlayActivityShopEnterVoice
					slot4 = slot1

					slot2(slot3, slot4)

					slot2 = slot0
					slot3 = slot2
					slot3 = slot3.TYPE_ACTIVITY
					slot2.curPage = slot3
					slot2 = slot0
					slot3 = slot2
					slot2 = slot2.intActivityShop
					slot4 = slot1
					slot4 = slot4.activityId

					slot2(slot3, slot4)

					slot2 = slot0
					slot3 = slot2
					slot2 = slot2.updatePainting
					slot4 = slot2
					slot4 = slot4.TYPE_ACTIVITY
					slot5 = slot1
					slot5 = slot5.activityId

					slot2(slot3, slot4, slot5)
				else
					slot1 = setActive
					slot2 = slot0
					slot2 = slot2.biliBg
					slot3 = false

					slot1(slot2, slot3)
				end
			end

			slot14 = SFX_PANEL

			slot10(slot11, slot12, slot13, slot14)
		end
	end

	slot4 = eachChild
	slot5 = slot1

	function slot6(slot0)
		slot1 = slot0
		slot1 = slot1.toggles
		slot2 = slot0.name
		slot1[slot2] = slot0
	end

	slot4(slot5, slot6)

	slot4 = onToggle
	slot5 = slot0
	slot6 = slot0.toggles
	slot7 = slot0
	slot7 = slot7.TYPE_GUILD
	slot6 = slot6[slot7]

	function slot7(slot0)
		if slot0 then
			slot1 = slot0
			slot1 = slot1.curPage
			slot2 = slot1
			slot2 = slot2.TYPE_GUILD

			if slot1 == slot2 then
				return
			end

			slot1 = slot0
			slot1 = slot1.guildShop

			if slot1 then
				slot1 = slot0
				slot2 = slot1
				slot1 = slot1.initGuildShop

				slot1(slot2)
			else
				slot1 = slot0
				slot2 = slot1
				slot1 = slot1.emit
				slot3 = ShopsMediator
				slot3 = slot3.GET_GUILD_SHOP

				slot1(slot2, slot3)
			end

			slot1 = slot0
			slot1 = slot1.curPage

			if slot1 ~= nil then
				slot1 = slot0
				slot1 = slot1.curPage
				slot2 = slot1
				slot2 = slot2.TYPE_ACTIVITY

				if slot1 == slot2 then
					slot1 = slot0
					slot2 = slot1
					slot1 = slot1.showRandomShipWord
					slot3 = pg
					slot3 = slot3.navalacademy_shoppingstreet_template
					slot3 = slot3[1]
					slot3 = slot3.words_enter
					slot4 = true
					slot5 = "enter"

					slot1(slot2, slot3, slot4, slot5)
				end
			end

			slot1 = slot0
			slot2 = slot1
			slot2 = slot2.TYPE_GUILD
			slot1.curPage = slot2
			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.updatePainting
			slot3 = slot1
			slot3 = slot3.TYPE_GUILD

			slot1(slot2, slot3)
		end
	end

	slot8 = SFX_PANEL

	slot4(slot5, slot6, slot7, slot8)

	slot4 = onToggle
	slot5 = slot0
	slot6 = slot0.toggles
	slot7 = slot0
	slot7 = slot7.TYPE_MILITARY_SHOP
	slot6 = slot6[slot7]

	function slot7(slot0)
		if slot0 then
			slot1 = slot0
			slot1 = slot1.curPage
			slot2 = slot1
			slot2 = slot2.TYPE_MILITARY_SHOP

			if slot1 == slot2 then
				return
			end

			slot1 = slot0
			slot1 = slot1.player

			if not slot1 then
				return
			end

			slot1 = pg
			slot1 = slot1.SystemOpenMgr
			slot1 = slot1.GetInstance
			slot1 = slot1()
			slot2 = slot1
			slot1 = slot1.isOpenSystem
			slot3 = slot0
			slot3 = slot3.player
			slot3 = slot3.level
			slot4 = "MilitaryExerciseMediator"
			slot1, slot2 = slot1(slot2, slot3, slot4)

			if not slot1 then
				slot3 = pg
				slot3 = slot3.TipsMgr
				slot3 = slot3.GetInstance
				slot3 = slot3()
				slot4 = slot3
				slot3 = slot3.ShowTips
				slot5 = i18n
				slot6 = "military_shop_no_open_tip"

				slot3(slot4, slot5(slot6))

				slot3 = slot0
				slot4 = slot3
				slot3 = slot3.getCurrPage
				slot3 = slot3(slot4)

				if not slot3 then
					slot3 = slot1
					slot3 = slot3.TYPE_SHOP_STREET
				end

				if slot3 then
					slot4 = triggerToggle
					slot5 = slot0
					slot5 = slot5.toggles
					slot5 = slot5[slot3]
					slot6 = true

					slot4(slot5, slot6)
				end

				return
			end

			slot3 = slot0
			slot3 = slot3.curPage

			if slot3 ~= nil then
				slot3 = slot0
				slot3 = slot3.curPage
				slot4 = slot1
				slot4 = slot4.TYPE_ACTIVITY

				if slot3 == slot4 then
					slot3 = slot0
					slot4 = slot3
					slot3 = slot3.showRandomShipWord
					slot5 = pg
					slot5 = slot5.navalacademy_shoppingstreet_template
					slot5 = slot5[1]
					slot5 = slot5.words_enter
					slot6 = true
					slot7 = "enter"

					slot3(slot4, slot5, slot6, slot7)
				end
			end

			slot3 = slot0
			slot4 = slot1
			slot4 = slot4.TYPE_MILITARY_SHOP
			slot3.curPage = slot4
			slot3 = slot0
			slot4 = slot3
			slot3 = slot3.updatePainting
			slot5 = slot1
			slot5 = slot5.TYPE_MILITARY_SHOP

			slot3(slot4, slot5)
		end
	end

	slot8 = SFX_PANEL

	slot4(slot5, slot6, slot7, slot8)

	slot4 = onToggle
	slot5 = slot0
	slot6 = slot0.toggles
	slot7 = slot0
	slot7 = slot7.TYPE_SHOP_STREET
	slot6 = slot6[slot7]

	function slot7(slot0)
		if slot0 then
			slot1 = slot0
			slot1 = slot1.curPage
			slot2 = slot1
			slot2 = slot2.TYPE_SHOP_STREET

			if slot1 == slot2 then
				return
			end

			slot1 = slot0
			slot1 = slot1.curPage

			if slot1 ~= nil then
				slot1 = slot0
				slot1 = slot1.curPage
				slot2 = slot1
				slot2 = slot2.TYPE_ACTIVITY

				if slot1 == slot2 then
					slot1 = slot0
					slot2 = slot1
					slot1 = slot1.showRandomShipWord
					slot3 = pg
					slot3 = slot3.navalacademy_shoppingstreet_template
					slot3 = slot3[1]
					slot3 = slot3.words_enter
					slot4 = true
					slot5 = "enter"

					slot1(slot2, slot3, slot4, slot5)
				end
			end

			slot1 = slot0
			slot2 = slot1
			slot2 = slot2.TYPE_SHOP_STREET
			slot1.curPage = slot2
			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.updatePainting
			slot3 = slot1
			slot3 = slot3.TYPE_SHOP_STREET

			slot1(slot2, slot3)
		end
	end

	slot8 = SFX_PANEL

	slot4(slot5, slot6, slot7, slot8)

	slot4 = LOCK_SHAM_CHAPTER

	if not slot4 then
		slot4 = slot0.shamShop

		if slot4 then
			slot4 = slot0.shamShop
			slot5 = slot4
			slot4 = slot4.isOpen
			slot4 = slot4(slot5)
		end
	else
		slot4 = false

		if false then
			slot4 = true
		end
	end

	slot5 = setActive
	slot6 = slot0.toggles
	slot7 = slot0
	slot7 = slot7.TYPE_SHAM_SHOP
	slot6 = slot6[slot7]
	slot7 = slot4

	slot5(slot6, slot7)

	slot5 = onToggle
	slot6 = slot0
	slot7 = slot0.toggles
	slot8 = slot0
	slot8 = slot8.TYPE_SHAM_SHOP
	slot7 = slot7[slot8]

	function slot8(slot0)
		if slot0 then
			slot1 = pg
			slot1 = slot1.SystemOpenMgr
			slot1 = slot1.GetInstance
			slot1 = slot1()
			slot2 = slot1
			slot1 = slot1.isOpenSystem
			slot3 = slot0
			slot3 = slot3.player
			slot3 = slot3.level
			slot4 = "ShamShop"
			slot1, slot2 = slot1(slot2, slot3, slot4)

			if not slot1 then
				slot3 = pg
				slot3 = slot3.TipsMgr
				slot3 = slot3.GetInstance
				slot3 = slot3()
				slot4 = slot3
				slot3 = slot3.ShowTips
				slot5 = slot2

				slot3(slot4, slot5)

				slot3 = slot0
				slot4 = slot3
				slot3 = slot3.getCurrPage
				slot3 = slot3(slot4)

				if not slot3 then
					slot3 = slot1
					slot3 = slot3.TYPE_SHOP_STREET
				end

				if slot3 then
					slot4 = triggerToggle
					slot5 = slot0
					slot5 = slot5.toggles
					slot5 = slot5[slot3]
					slot6 = true

					slot4(slot5, slot6)
				end

				return
			end

			slot3 = slot0
			slot3 = slot3.curPage
			slot4 = slot1
			slot4 = slot4.TYPE_SHAM_SHOP

			if slot3 == slot4 then
				return
			end

			slot3 = slot0
			slot3 = slot3.curPage

			if slot3 ~= nil then
				slot3 = slot0
				slot3 = slot3.curPage
				slot4 = slot1
				slot4 = slot4.TYPE_ACTIVITY

				if slot3 == slot4 then
					slot3 = slot0
					slot4 = slot3
					slot3 = slot3.showRandomShipWord
					slot5 = pg
					slot5 = slot5.navalacademy_shoppingstreet_template
					slot5 = slot5[1]
					slot5 = slot5.words_enter
					slot6 = true
					slot7 = "enter"

					slot3(slot4, slot5, slot6, slot7)
				end
			end

			slot3 = slot0
			slot4 = slot1
			slot4 = slot4.TYPE_SHAM_SHOP
			slot3.curPage = slot4
			slot3 = slot0
			slot4 = slot3
			slot3 = slot3.updateShamShop

			slot3(slot4)

			slot3 = slot0
			slot4 = slot3
			slot3 = slot3.updateShamRes

			slot3(slot4)

			slot3 = slot0
			slot4 = slot3
			slot3 = slot3.updatePainting
			slot5 = slot1
			slot5 = slot5.TYPE_SHAM_SHOP

			slot3(slot4, slot5)
		end
	end

	slot9 = SFX_PANEL

	slot5(slot6, slot7, slot8, slot9)

	slot5 = LOCK_FRAGMENT_SHOP

	if not slot5 then
		slot5 = slot0.contextData
		slot5 = slot5.shopDatas
		slot5 = slot5.fragshop

		if slot5 then
			slot5 = slot0.contextData
			slot5 = slot5.shopDatas
			slot5 = slot5.fragshop
			slot6 = slot5
			slot5 = slot5.isOpen
			slot5 = slot5(slot6)
		end
	else
		slot5 = false

		if false then
			slot5 = true
		end
	end

	slot6 = setActive
	slot7 = slot0.toggles
	slot8 = slot0
	slot8 = slot8.TYPE_FRAGMENT
	slot7 = slot7[slot8]
	slot8 = slot5

	slot6(slot7, slot8)

	slot6 = onToggle
	slot7 = slot0
	slot8 = slot0.toggles
	slot9 = slot0
	slot9 = slot9.TYPE_FRAGMENT
	slot8 = slot8[slot9]

	function slot9(slot0)
		if slot0 then
			slot1 = pg
			slot1 = slot1.SystemOpenMgr
			slot1 = slot1.GetInstance
			slot1 = slot1()
			slot2 = slot1
			slot1 = slot1.isOpenSystem
			slot3 = slot0
			slot3 = slot3.player
			slot3 = slot3.level
			slot4 = "FragmentShop"
			slot1, slot2 = slot1(slot2, slot3, slot4)

			if not slot1 then
				slot3 = pg
				slot3 = slot3.TipsMgr
				slot3 = slot3.GetInstance
				slot3 = slot3()
				slot4 = slot3
				slot3 = slot3.ShowTips
				slot5 = slot2

				slot3(slot4, slot5)

				slot3 = slot0
				slot4 = slot3
				slot3 = slot3.getCurrPage
				slot3 = slot3(slot4)

				if not slot3 then
					slot3 = slot1
					slot3 = slot3.TYPE_SHOP_STREET
				end

				if slot3 then
					slot4 = triggerToggle
					slot5 = slot0
					slot5 = slot5.toggles
					slot5 = slot5[slot3]
					slot6 = true

					slot4(slot5, slot6)
				end

				return
			end

			slot3 = slot0
			slot3 = slot3.curPage
			slot4 = slot1
			slot4 = slot4.TYPE_FRAGMENT

			if slot3 == slot4 then
				return
			end

			slot3 = slot0
			slot3 = slot3.curPage

			if slot3 ~= nil then
				slot3 = slot0
				slot3 = slot3.curPage
				slot4 = slot1
				slot4 = slot4.TYPE_ACTIVITY

				if slot3 == slot4 then
					slot3 = slot0
					slot4 = slot3
					slot3 = slot3.showRandomShipWord
					slot5 = pg
					slot5 = slot5.navalacademy_shoppingstreet_template
					slot5 = slot5[1]
					slot5 = slot5.words_enter
					slot6 = true
					slot7 = "enter"

					slot3(slot4, slot5, slot6, slot7)
				end
			end

			slot3 = slot0
			slot4 = slot1
			slot4 = slot4.TYPE_FRAGMENT
			slot3.curPage = slot4
			slot3 = slot0
			slot4 = slot3
			slot3 = slot3.updateBlueprintFragShop

			slot3(slot4)

			slot3 = slot0
			slot4 = slot3
			slot3 = slot3.updateFragRes

			slot3(slot4)

			slot3 = slot0
			slot4 = slot3
			slot3 = slot3.updatePainting
			slot5 = slot1
			slot5 = slot5.TYPE_FRAGMENT

			slot3(slot4, slot5)
		end
	end

	slot10 = SFX_PANEL

	slot6(slot7, slot8, slot9, slot10)

	slot6 = onButton
	slot7 = slot0
	slot8 = slot0.top
	slot9 = slot8
	slot8 = slot8.Find
	slot10 = "res_fragment/resolve"
	slot8 = slot8(slot9, slot10)

	function slot9()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.CallFragResolve

		slot0(slot1)
	end

	slot6(slot7, slot8, slot9)

	slot6 = slot0.contextData
	slot6 = slot6.warp
	slot0.warp = slot6
	slot6 = slot0.warp
	slot7 = slot0
	slot7 = slot7.TYPE_SHAM_SHOP

	if slot6 == slot7 then
		slot6 = pg
		slot6 = slot6.SystemOpenMgr
		slot6 = slot6.GetInstance
		slot6 = slot6()
		slot7 = slot6
		slot6 = slot6.isOpenSystem
		slot8 = slot0.player
		slot8 = slot8.level
		slot9 = "ShamShop"
		slot6, slot7 = slot6(slot7, slot8, slot9)

		if not slot6 then
			slot8 = nil
			slot0.warp = slot8
			slot8 = pg
			slot8 = slot8.TipsMgr
			slot8 = slot8.GetInstance
			slot8 = slot8()
			slot9 = slot8
			slot8 = slot8.ShowTips
			slot10 = slot7

			slot8(slot9, slot10)
		end

		if not slot4 then
			slot8 = nil
			slot0.warp = slot8
			slot8 = pg
			slot8 = slot8.TipsMgr
			slot8 = slot8.GetInstance
			slot8 = slot8()
			slot9 = slot8
			slot8 = slot8.ShowTips
			slot10 = i18n
			slot11 = "common_activity_not_start"

			slot8(slot9, slot10(slot11))
		end
	end

	slot6 = slot0.warp

	if slot6 then
		slot6 = slot0.warp
		slot7 = slot0
		slot7 = slot7.TYPE_ACTIVITY

		if slot6 == slot7 then
			slot6 = #slot3
			slot7 = 0

			if slot6 > slot7 then
				slot6 = slot0.contextData
				slot6 = slot6.actId

				if slot6 then
					slot6 = slot0.toggles
					slot7 = tostring
					slot8 = slot0.contextData
					slot8 = slot8.actId
					slot7 = slot7(slot8)
					slot6 = slot6[slot7]

					if slot6 then
						slot6 = triggerToggle
						slot7 = slot0.toggles
						slot8 = tostring
						slot9 = slot0.contextData
						slot9 = slot9.actId
						slot8 = slot8(slot9)
						slot7 = slot7[slot8]
						slot8 = true

						slot6(slot7, slot8)
					end
				else
					slot6 = #slot3
					slot6 = slot3[slot6]
					slot7 = triggerToggle
					slot8 = slot0.toggles
					slot9 = tostring
					slot10 = slot6.activityId
					slot9 = slot9(slot10)
					slot8 = slot8[slot9]
					slot9 = true

					slot7(slot8, slot9)
				end
			end
		else
			slot6 = slot0.warp

			if not slot6 then
				slot6 = slot0
				slot6 = slot6.TYPE_SHOP_STREET
			end

			slot0.warp = slot6
			slot6 = triggerToggle
			slot7 = slot0.toggles
			slot8 = slot0.warp
			slot7 = slot7[slot8]
			slot8 = true

			slot6(slot7, slot8)
		end
	end

	slot6 = onButton
	slot7 = slot0
	slot9 = slot0
	slot8 = slot0.findTF
	slot10 = "refresh_btn"
	slot11 = slot0.shopStreetTF
	slot8 = slot8(slot9, slot10, slot11)

	function slot9()
		slot0 = ShoppingStreet
		slot0 = slot0.getRiseShopId
		slot1 = ShopArgs
		slot1 = slot1.ShoppingStreetUpgrade
		slot2 = slot0
		slot2 = slot2.shopStreet
		slot2 = slot2.flashCount
		slot0 = slot0(slot1, slot2)

		if not slot0 then
			slot1 = pg
			slot1 = slot1.TipsMgr
			slot1 = slot1.GetInstance
			slot1 = slot1()
			slot2 = slot1
			slot1 = slot1.ShowTips
			slot3 = i18n
			slot4 = "shopStreet_refresh_max_count"

			slot1(slot2, slot3(slot4))

			return
		end

		slot1 = pg
		slot1 = slot1.shop_template
		slot1 = slot1[slot0]
		slot2 = pg
		slot2 = slot2.MsgboxMgr
		slot2 = slot2.GetInstance
		slot2 = slot2()
		slot3 = slot2
		slot2 = slot2.ShowMsgBox
		slot4 = {
			yesText = "text_confirm",
			hideNo = false,
			noText = "text_cancel"
		}
		slot5 = i18n
		slot6 = "refresh_shopStreet_question"
		slot7 = i18n
		slot8 = "word_"
		slot9 = id2res
		slot10 = slot1.resource_type
		slot9 = slot9(slot10)
		slot10 = "_icon"
		slot8 = slot8 .. slot9 .. slot10
		slot7 = slot7(slot8)
		slot8 = slot1.resource_num
		slot9 = slot0
		slot9 = slot9.shopStreet
		slot9 = slot9.flashCount
		slot5 = slot5(slot6, slot7, slot8, slot9)
		slot4.content = slot5

		function slot5()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.emit
			slot2 = ShopsMediator
			slot2 = slot2.REFRESH_SHOP_STREET
			slot3 = slot1

			slot0(slot1, slot2, slot3)
		end

		slot4.onYes = slot5

		slot2(slot3, slot4)
	end

	slot10 = SFX_PANEL

	slot6(slot7, slot8, slot9, slot10)

	slot7 = slot0
	slot6 = slot0.blurView

	slot6(slot7)

	slot7 = slot0
	slot6 = slot0.AddDragEvent

	slot6(slot7)

	slot6 = AprilFoolBulinSubView
	slot6 = slot6.ShowAprilFoolBulin
	slot7 = slot0
	slot8 = 60038
	slot9 = slot0.viewContainer
	slot6 = slot6(slot7, slot8, slot9)
	slot0.bulinTip = slot6
end

slot0.didEnter = slot1

function slot1(slot0)
	slot1 = slot0.bottomPanel
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "scrollrect"
	slot1 = slot1(slot2, slot3)
	slot3 = slot1
	slot2 = slot1.Find
	slot4 = "toggle_list"
	slot2 = slot2(slot3, slot4)
	slot3 = 0
	slot4 = 1
	slot5 = slot2.childCount
	slot6 = 1

	for slot7 = slot4, slot5, slot6 do
		slot8 = isActive
		slot10 = slot2
		slot9 = slot2.GetChild
		slot11 = slot7 - 1
		slot8 = slot8(slot9(slot10, slot11))

		if slot8 then
			slot3 = slot3 + 1
		end
	end

	slot4 = 5

	if slot3 > slot4 then
		slot4 = -1
		slot0.prevPos = slot4
		slot4 = onScroll
		slot5 = slot0
		slot6 = slot1

		function slot7(slot0)
			slot1 = math
			slot1 = slot1.abs
			slot2 = slot0
			slot2 = slot2.prevPos
			slot3 = slot0.x
			slot2 = slot2 - slot3
			slot1 = slot1(slot2)
			slot2 = 0.1

			if slot1 > slot2 then
				slot0.prevPos = slot0.x

				setActive(slot0.rightArr, slot0.x >= 0.9)
				setActive(slot0.leftArr, slot0.x <= 0.1)
			end
		end

		slot4(slot5, slot6, slot7)
	end

	slot1:GetComponent(typeof(ScrollRect)).enabled = slot3 > 5
	slot4 = scrollTo
	slot5 = slot1
	slot6 = 1
	slot7 = 0

	slot4(slot5, slot6, slot7)

	slot4 = setActive
	slot5 = slot1
	slot6 = false

	slot4(slot5, slot6)

	slot4 = setActive
	slot5 = slot1
	slot6 = true

	slot4(slot5, slot6)
end

slot0.AddDragEvent = slot1

function slot1(slot0, slot1, slot2)
	slot3 = slot0.patingName
	slot5 = slot0
	slot4 = slot0.getPaintingName
	slot6 = slot1
	slot7 = slot2
	slot4 = slot4(slot5, slot6, slot7)

	if slot3 ~= slot4 then
		if slot3 then
			slot5 = retPaintingPrefab
			slot6 = slot0.painting
			slot7 = slot3

			slot5(slot6, slot7)
		end

		slot5 = setPaintingPrefabAsync
		slot6 = slot0.painting
		slot7 = slot4
		slot8 = "chuanwu"

		slot5(slot6, slot7, slot8)
	end

	setActive(slot0.buzhihuoTouch, slot4 == "buzhihuo_shop")
end

slot0.updatePainting = slot1

function slot1(slot0, slot1, slot2)
	slot3 = slot0
	slot3 = slot3.TYPE_ACTIVITY

	if slot1 == slot3 then
		if slot2 then
			slot3 = pg
			slot3 = slot3.activity_template
			slot3 = slot3[slot2]

			if slot3 then
				slot0.patingName = slot3.config_client.painting or "aijiang_pt"
				slot4 = slot0.patingName

				return slot4
			end
		end

		slot3 = "aijiang_pt"
		slot0.patingName = slot3
	else
		slot3 = "buzhihuo_shop"
		slot0.patingName = slot3
	end

	slot3 = slot0.patingName

	return slot3
end

slot0.getPaintingName = slot1

function slot1(slot0)
	slot1 = slot0.curPage
	slot2 = slot0
	slot2 = slot2.TYPE_ACTIVITY

	if slot1 == slot2 then
		slot1 = tostring
		slot2 = slot0.currActivityShop
		slot2 = slot2.activityId

		return slot1(slot2)
	else
		slot1 = slot0.curPage

		return slot1
	end
end

slot0.getCurrPage = slot1

function slot1(slot0)
	slot1 = playSoundEffect
	slot2 = SFX_CANCEL

	slot1(slot2)

	slot1 = IsNil
	slot2 = slot0.singleBoxTF
	slot1 = slot1(slot2)

	if not slot1 then
		slot1 = isActive
		slot2 = slot0.singleBoxTF
		slot1 = slot1(slot2)

		if slot1 then
			slot1 = triggerButton
			slot2 = slot0.singleBoxTF

			slot1(slot2)

			return
		end
	end

	slot1 = IsNil
	slot2 = slot0.msgBoxTF
	slot1 = slot1(slot2)

	if not slot1 then
		slot1 = isActive
		slot2 = slot0.msgBoxTF
		slot1 = slot1(slot2)

		if slot1 then
			slot1 = triggerButton
			slot2 = slot0.msgBoxTF

			slot1(slot2)

			return
		end
	end

	slot1 = triggerButton
	slot2 = slot0.backBtn

	slot1(slot2)
end

slot0.onBackPressed = slot1

function slot1(slot0, slot1)
	slot2 = string
	slot2 = slot2.split
	slot3 = slot1
	slot4 = "|"
	slot2 = slot2(slot3, slot4)
	slot3 = math
	slot3 = slot3.random
	slot4 = #slot2
	slot3 = slot3(slot4)
	slot4 = slot2[slot3]
	slot5 = slot3

	return slot4, slot5
end

slot0.randomShipWord = slot1

function slot1(slot0)
	slot1 = slot0.wordTweenId

	if slot1 then
		slot1 = LeanTween
		slot1 = slot1.cancel
		slot2 = slot0.wordTweenId

		slot1(slot2)

		slot1 = nil
		slot0.wordTweenId = slot1
	end

	slot1 = nil
	slot0.chatFlag = slot1
	slot1 = setActive
	slot2 = slot0.chat
	slot3 = false

	slot1(slot2, slot3)
end

slot0.clearShipWord = slot1

function slot1(slot0, slot1, slot2, slot3)
	slot4 = slot0.chatFlag

	if not slot4 or slot2 then
		slot4 = true
		slot0.chatFlag = slot4
		slot4 = slot0.wordTweenId

		if slot4 then
			slot4 = LeanTween
			slot4 = slot4.cancel
			slot5 = slot0.wordTweenId

			slot4(slot5)

			slot4 = nil
			slot0.wordTweenId = slot4
		end

		slot4 = nil
		slot6 = slot0
		slot5 = slot0.randomShipWord
		slot7 = slot1
		slot5, slot6 = slot5(slot6, slot7)
		slot4 = slot6
		slot1 = slot5

		if slot3 then
			slot6 = slot0
			slot5 = slot0.playCV
			slot7 = slot3
			slot8 = "_"
			slot9 = slot4
			slot7 = slot7 .. slot8 .. slot9

			slot5(slot6, slot7)
		end

		slot6 = slot0
		slot5 = slot0.ShowShipWord
		slot7 = slot1

		slot5(slot6, slot7)
	end
end

slot0.showRandomShipWord = slot1

function slot1(slot0, slot1)
	slot2 = slot0.wordTweenId

	if slot2 then
		slot2 = LeanTween
		slot2 = slot2.cancel
		slot3 = slot0.wordTweenId

		slot2(slot3)

		slot2 = nil
		slot0.wordTweenId = slot2
	end

	slot2 = 0.3
	slot3 = 3
	slot4 = setActive
	slot5 = slot0.chat
	slot6 = true

	slot4(slot5, slot6)

	slot4 = setText
	slot5 = slot0.chatText
	slot6 = slot1

	slot4(slot5, slot6)

	slot4 = LeanTween
	slot4 = slot4.scale
	slot5 = slot0.chat
	slot5 = slot5.gameObject
	slot6 = Vector3
	slot6 = slot6.New
	slot7 = 1
	slot8 = 1
	slot9 = 1
	slot6 = slot6(slot7, slot8, slot9)
	slot7 = slot2
	slot4 = slot4(slot5, slot6, slot7)
	slot5 = slot4
	slot4 = slot4.setFrom
	slot6 = Vector3
	slot6 = slot6.New
	slot7 = 0
	slot8 = 0
	slot9 = 0
	slot4 = slot4(slot5, slot6(slot7, slot8, slot9))
	slot5 = slot4
	slot4 = slot4.setEase
	slot6 = LeanTweenType
	slot6 = slot6.easeOutBack
	slot4 = slot4(slot5, slot6)
	slot5 = slot4
	slot4 = slot4.setOnComplete
	slot6 = System
	slot6 = slot6.Action

	function slot7()
		slot0 = IsNil
		slot1 = slot0
		slot1 = slot1.chat
		slot0 = slot0(slot1)

		if slot0 then
			return
		end

		slot0 = slot0
		slot1 = LeanTween
		slot1 = slot1.scale
		slot2 = slot0
		slot2 = slot2.chat
		slot2 = slot2.gameObject
		slot3 = Vector3
		slot3 = slot3.New
		slot4 = 0
		slot5 = 0
		slot6 = 1
		slot3 = slot3(slot4, slot5, slot6)
		slot4 = slot1
		slot1 = slot1(slot2, slot3, slot4)
		slot2 = slot1
		slot1 = slot1.setFrom
		slot3 = Vector3
		slot3 = slot3.New
		slot4 = 1
		slot5 = 1
		slot6 = 1
		slot1 = slot1(slot2, slot3(slot4, slot5, slot6))
		slot2 = slot1
		slot1 = slot1.setEase
		slot3 = LeanTweenType
		slot3 = slot3.easeInBack
		slot1 = slot1(slot2, slot3)
		slot2 = slot1
		slot1 = slot1.setDelay
		slot3 = slot2
		slot1 = slot1(slot2, slot3)
		slot2 = slot1
		slot1 = slot1.setOnComplete
		slot3 = System
		slot3 = slot3.Action

		function slot4()
			slot0 = IsNil
			slot1 = slot0
			slot1 = slot1.chat
			slot0 = slot0(slot1)

			if slot0 then
				return
			end

			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.clearShipWord

			slot0(slot1)
		end

		slot1 = slot1(slot2, slot3(slot4))
		slot1 = slot1.uniqueId
		slot0.wordTweenId = slot1
	end

	slot4 = slot4(slot5, slot6(slot7))
	slot4 = slot4.uniqueId
	slot0.wordTweenId = slot4
end

slot0.ShowShipWord = slot1

function slot1(slot0, slot1)
	slot2 = "event:/cv/shop/"
	slot3 = slot1
	slot2 = slot2 .. slot3

	if slot2 then
		function slot3()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.stopCV

			slot0(slot1)

			slot0 = slot0
			slot1 = playSoundEffect
			slot2 = slot1
			slot1 = slot1(slot2)
			slot0._currentVoice = slot1
		end

		slot4 = slot0.loadedCVBankName

		if slot4 then
			slot4 = slot3

			slot4()
		else
			slot4 = "shop"

			function slot5()
				slot0 = pg
				slot0 = slot0.CriMgr
				slot0 = slot0.GetCVBankName
				slot1 = slot0
				slot0 = slot0(slot1)
				slot1 = slot1
				slot1 = slot1.exited

				if slot1 then
					slot1 = pg
					slot1 = slot1.CriMgr
					slot1 = slot1.UnloadCVBank
					slot2 = slot0

					slot1(slot2)
				else
					slot1 = slot2

					slot1()

					slot1 = slot1
					slot1 = slot1._currentVoice

					if slot1 then
						slot1 = slot1
						slot1.loadedCVBankName = slot0
					end
				end
			end

			slot6 = pg
			slot6 = slot6.CriMgr
			slot7 = slot6
			slot6 = slot6.LoadCV
			slot8 = slot4
			slot9 = slot5

			slot6(slot7, slot8, slot9)
		end
	end
end

slot0.playCV = slot1

function slot1(slot0)
	slot1 = setText
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "res_exploit/bg/Text"
	slot5 = slot0.top
	slot2 = slot2(slot3, slot4, slot5)
	slot3 = slot0.exploit

	slot1(slot2, slot3)
end

slot0.updateExploit = slot1

function slot1(slot0)
	slot1 = slot0.currActivityShop

	if slot1 then
		slot1 = slot0.currActivityShop
		slot2 = slot1
		slot1 = slot1.getResId
		slot1 = slot1(slot2)
		slot2 = setText
		slot4 = slot0
		slot3 = slot0.findTF
		slot5 = "res_battery/Text"
		slot6 = slot0.top
		slot3 = slot3(slot4, slot5, slot6)
		slot4 = slot0.player
		slot5 = id2res
		slot6 = slot1
		slot5 = slot5(slot6)
		slot4 = slot4[slot5]

		slot2(slot3, slot4)
	end
end

slot0.updateActivityRes = slot1

function slot1(slot0)
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "scrollView/view"
	slot4 = slot0.militaryShopTF
	slot1 = slot1(slot2, slot3, slot4)
	slot2 = removeAllChildren
	slot3 = slot1

	slot2(slot3)

	slot2 = {}
	slot0.milGoodsTFs = slot2
	slot2 = table
	slot2 = slot2.getCount
	slot3 = slot0.militaryShop
	slot3 = slot3.goods
	slot2 = slot2(slot3)
	slot3 = pairs
	slot4 = slot0.militaryShop
	slot4 = slot4.goods
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot8 = cloneTplTo
		slot9 = slot0.goodTF
		slot10 = slot1
		slot8 = slot8(slot9, slot10)
		slot9 = slot0.milGoodsTFs
		slot10 = GoodsCard
		slot10 = slot10.New
		slot11 = slot8
		slot10 = slot10(slot11)
		slot9[slot6] = slot10
		slot9 = table
		slot9 = slot9.insert
		slot10 = slot0.cards
		slot11 = slot0.milGoodsTFs
		slot11 = slot11[slot6]

		slot9(slot10, slot11)

		slot9 = slot0.milGoodsTFs
		slot9 = slot9[slot6]
		slot10 = slot9
		slot9 = slot9.update
		slot11 = slot7

		slot9(slot10, slot11)

		slot9 = onButton
		slot10 = slot0
		slot11 = slot0.milGoodsTFs
		slot12 = slot7.id
		slot11 = slot11[slot12]
		slot11 = slot11.itemTF

		function slot12()
			slot0 = pg
			slot0 = slot0.MsgboxMgr
			slot0 = slot0.GetInstance
			slot0 = slot0()
			slot1 = slot0
			slot0 = slot0.ShowMsgBox
			slot2 = {
				showOwned = true,
				hideLine = true,
				yesText = "text_exchange"
			}
			slot3 = MSGBOX_TYPE_SINGLE_ITEM
			slot2.type = slot3
			slot3 = {}
			slot4 = slot0
			slot5 = slot4
			slot4 = slot4.getConfig
			slot6 = "effect_args"
			slot4 = slot4(slot5, slot6)
			slot4 = slot4[1]
			slot3.id = slot4
			slot4 = slot0
			slot5 = slot4
			slot4 = slot4.getConfig
			slot6 = "type"
			slot4 = slot4(slot5, slot6)
			slot3.type = slot4
			slot2.drop = slot3

			function slot3()
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.canPurchase
				slot0 = slot0(slot1)

				if not slot0 then
					slot0 = pg
					slot0 = slot0.TipsMgr
					slot0 = slot0.GetInstance
					slot0 = slot0()
					slot1 = slot0
					slot0 = slot0.ShowTips
					slot2 = i18n
					slot3 = "buy_countLimit"

					slot0(slot1, slot2(slot3))

					return
				end

				slot0 = slot1
				slot1 = slot0
				slot0 = slot0.emit
				slot2 = ShopsMediator
				slot2 = slot2.BUY_ITEM
				slot3 = slot0
				slot3 = slot3.id
				slot4 = 1

				slot0(slot1, slot2, slot3, slot4)
			end

			slot2.onYes = slot3

			slot0(slot1, slot2)
		end

		slot13 = SFX_PANEL

		slot9(slot10, slot11, slot12, slot13)
	end

	slot3 = slot0.militaryShop
	slot3 = slot3.nextTime
	slot5 = slot0
	slot4 = slot0.addRefreshTimer
	slot6 = slot3 + 1

	slot4(slot5, slot6)
end

slot0.updateMilitaryShop = slot1

function slot1(slot0)
	slot1 = slot0._currentVoice

	if slot1 then
		slot1 = slot0._currentVoice
		slot2 = slot1
		slot1 = slot1.Stop
		slot3 = true

		slot1(slot2, slot3)
	end

	slot1 = nil
	slot0._currentVoice = slot1
end

slot0.stopCV = slot1

function slot1(slot0, slot1)
	function slot2()
		slot0 = slot0
		slot0 = slot0.refreshTimer

		if slot0 then
			slot0 = slot0
			slot0 = slot0.refreshTimer
			slot1 = slot0
			slot0 = slot0.Stop

			slot0(slot1)

			slot0 = slot0
			slot1 = nil
			slot0.refreshTimer = slot1
		end
	end

	slot3 = slot2

	slot3()

	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "timer_bg/Text"
	slot6 = slot0.militaryShopTF
	slot3 = slot3(slot4, slot5, slot6)
	slot4 = Timer
	slot4 = slot4.New

	function slot5()
		slot0 = slot0
		slot1 = pg
		slot1 = slot1.TimeMgr
		slot1 = slot1.GetInstance
		slot1 = slot1()
		slot2 = slot1
		slot1 = slot1.GetServerTime
		slot1 = slot1(slot2)
		slot0 = slot0 - slot1
		slot1 = 0

		if slot0 <= slot1 then
			slot1 = slot1

			slot1()

			slot1 = slot2
			slot2 = slot1
			slot1 = slot1.emit
			slot3 = ShopsMediator
			slot3 = slot3.GET_MILITARY_SHOP

			slot1(slot2, slot3)
		else
			slot1 = pg
			slot1 = slot1.TimeMgr
			slot1 = slot1.GetInstance
			slot1 = slot1()
			slot2 = slot1
			slot1 = slot1.DescCDTime
			slot3 = slot0
			slot1 = slot1(slot2, slot3)
			slot2 = setText
			slot3 = slot3
			slot4 = slot1

			slot2(slot3, slot4)
		end
	end

	slot6 = 1
	slot7 = -1
	slot4 = slot4(slot5, slot6, slot7)
	slot0.refreshTimer = slot4
	slot4 = slot0.refreshTimer
	slot5 = slot4
	slot4 = slot4.Start

	slot4(slot5)

	slot4 = slot0.refreshTimer
	slot4 = slot4.func

	slot4()
end

slot0.addRefreshTimer = slot1

function slot1(slot0, slot1)
	slot0.shopStreet = slot1
end

slot0.setShopStreet = slot1

function slot1(slot0, slot1)
	slot2 = pg
	slot2 = slot2.navalacademy_shoppingstreet_template
	slot3 = slot1.level
	slot2 = slot2[slot3]
	slot4 = slot0
	slot3 = slot0.displayShopSteet
	slot5 = 1

	slot3(slot4, slot5)

	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "timer_bg/Text"
	slot6 = slot0.shopStreetTF
	slot3 = slot3(slot4, slot5, slot6)
	slot4 = pg
	slot4 = slot4.TimeMgr
	slot4 = slot4.GetInstance
	slot4 = slot4()
	slot5 = slot4
	slot4 = slot4.GetServerTime
	slot4 = slot4(slot5)
	slot5 = setText
	slot6 = slot3
	slot7 = pg
	slot7 = slot7.TimeMgr
	slot7 = slot7.GetInstance
	slot7 = slot7()
	slot8 = slot7
	slot7 = slot7.DescCDTime
	slot9 = slot1.nextFlashTime
	slot9 = slot9 - slot4

	slot5(slot6, slot7(slot8, slot9))

	slot5 = getProxy
	slot6 = ActivityProxy
	slot5 = slot5(slot6)
	slot7 = slot5
	slot6 = slot5.getActivityByType
	slot8 = ActivityConst
	slot8 = slot8.ACTIVITY_TYPE_SHOP_STREET
	slot6 = slot6(slot7, slot8)
	slot8 = slot0
	slot7 = slot0.findTF
	slot9 = "tip_activity"
	slot10 = slot0.shopStreetTF
	slot7 = slot7(slot8, slot9, slot10)
	slot8 = setActive
	slot9 = slot7

	if slot6 then
		slot11 = slot6
		slot10 = slot6.isEnd
		slot10 = slot10(slot11)
		slot10 = not slot10
	end

	slot8(slot9, slot10)

	slot8 = setText
	slot9 = slot7
	slot10 = i18n
	slot11 = "shop_street_activity_tip"

	slot8(slot9, slot10(slot11))

	slot8 = slot0.shopStreetTimer

	if slot8 then
		slot8 = slot0.shopStreetTimer
		slot9 = slot8
		slot8 = slot8.Stop

		slot8(slot9)

		slot8 = nil
		slot0.shopStreetTimer = slot8
	end

	slot8 = Timer
	slot8 = slot8.New

	function slot9()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.isUpdateGoods
		slot0 = slot0(slot1)

		if slot0 then
			slot0 = slot1
			slot0 = slot0.shopStreetTimer
			slot1 = slot0
			slot0 = slot0.Stop

			slot0(slot1)

			slot0 = slot1
			slot1 = nil
			slot0.shopStreetTimer = slot1
			slot0 = slot1
			slot1 = slot0
			slot0 = slot0.emit
			slot2 = ShopsMediator
			slot2 = slot2.GET_SHOP_STREEET

			slot0(slot1, slot2)
		else
			slot0 = pg
			slot0 = slot0.TimeMgr
			slot0 = slot0.GetInstance
			slot0 = slot0()
			slot1 = slot0
			slot0 = slot0.GetServerTime
			slot0 = slot0(slot1)
			slot1 = slot0
			slot1 = slot1.nextFlashTime
			slot1 = slot1 - slot0
			slot2 = setText
			slot3 = slot2
			slot4 = pg
			slot4 = slot4.TimeMgr
			slot4 = slot4.GetInstance
			slot4 = slot4()
			slot5 = slot4
			slot4 = slot4.DescCDTime
			slot6 = slot1

			slot2(slot3, slot4(slot5, slot6))
		end
	end

	slot10 = 1
	slot11 = -1
	slot8 = slot8(slot9, slot10, slot11)
	slot0.shopStreetTimer = slot8
	slot8 = slot0.shopStreetTimer
	slot9 = slot8
	slot8 = slot8.Start

	slot8(slot9)
end

slot0.updateShopStreet = slot1
slot1 = 2
slot2 = 5

function slot3(slot0, slot1)
	slot2 = slot0.shopStreet
	slot2 = slot2.goods
	slot2 = #slot2
	slot3 = slot0
	slot2 = slot2 / slot3
	slot3 = math
	slot3 = slot3.floor
	slot4 = slot2
	slot3 = slot3(slot4)

	if slot3 < slot2 then
		slot3 = math
		slot3 = slot3.floor
		slot4 = slot2
		slot3 = slot3(slot4)
		slot2 = slot3 + 1
	end

	slot3 = math
	slot3 = slot3.max
	slot4 = slot1
	slot5 = slot2
	slot3 = slot3(slot4, slot5)
	slot2 = slot3
	slot3 = slot0
	slot3 = slot2 * slot3
	slot5 = slot0
	slot4 = slot0.findTF
	slot6 = "scrollView/view"
	slot7 = slot0.shopStreetTF
	slot4 = slot4(slot5, slot6, slot7)
	slot5 = removeAllChildren
	slot6 = slot4

	slot5(slot6)

	slot5 = {}
	slot0.shopStreetTFs = slot5
	slot5 = getProxy
	slot6 = ActivityProxy
	slot5 = slot5(slot6)
	slot6 = slot5
	slot5 = slot5.getActivityByType
	slot7 = ActivityConst
	slot7 = slot7.ACTIVITY_TYPE_SHOP_DISCOUNT
	slot5 = slot5(slot6, slot7)

	if slot5 then
		slot7 = slot5
		slot6 = slot5.isEnd
		slot6 = slot6(slot7)
		slot6 = not slot6
	end

	slot7 = 1
	slot8 = slot3
	slot9 = 1

	for slot10 = slot7, slot8, slot9 do
		slot11 = slot0.shopStreet
		slot11 = slot11.goods
		slot11 = slot11[slot10]
		slot12 = cloneTplTo
		slot13 = slot0.goodTF
		slot14 = slot4
		slot12 = slot12(slot13, slot14)
		slot13 = slot0.shopStreetTFs
		slot14 = slot11.id
		slot15 = GoodsCard
		slot15 = slot15.New
		slot16 = slot12
		slot15 = slot15(slot16)
		slot13[slot14] = slot15
		slot13 = table
		slot13 = slot13.insert
		slot14 = slot0.cards
		slot15 = slot0.shopStreetTFs
		slot16 = slot11.id
		slot15 = slot15[slot16]

		slot13(slot14, slot15)

		if slot11 then
			slot11.activityDiscount = slot6
			slot13 = slot0.shopStreetTFs
			slot14 = slot11.id
			slot13 = slot13[slot14]
			slot14 = slot13
			slot13 = slot13.update
			slot15 = slot11

			slot13(slot14, slot15)

			slot13 = onButton
			slot14 = slot0
			slot15 = slot0.shopStreetTFs
			slot16 = slot11.id
			slot15 = slot15[slot16]
			slot15 = slot15.itemTF

			function slot16()
				slot0 = pg
				slot0 = slot0.MsgboxMgr
				slot0 = slot0.GetInstance
				slot0 = slot0()
				slot1 = slot0
				slot0 = slot0.ShowMsgBox
				slot2 = {
					hideLine = true,
					yesText = "text_exchange",
					showOwned = true
				}
				slot3 = MSGBOX_TYPE_SINGLE_ITEM
				slot2.type = slot3
				slot3 = {}
				slot4 = slot0
				slot5 = slot4
				slot4 = slot4.getConfig
				slot6 = "effect_args"
				slot4 = slot4(slot5, slot6)
				slot4 = slot4[1]
				slot3.id = slot4
				slot4 = slot0
				slot5 = slot4
				slot4 = slot4.getConfig
				slot6 = "type"
				slot4 = slot4(slot5, slot6)
				slot3.type = slot4
				slot2.drop = slot3

				function slot3()
					slot0 = slot0
					slot1 = slot0
					slot0 = slot0.canPurchase
					slot0 = slot0(slot1)

					if not slot0 then
						slot0 = pg
						slot0 = slot0.TipsMgr
						slot0 = slot0.GetInstance
						slot0 = slot0()
						slot1 = slot0
						slot0 = slot0.ShowTips
						slot2 = i18n
						slot3 = "buy_countLimit"

						slot0(slot1, slot2(slot3))

						return
					end

					slot0 = slot0
					slot1 = slot0
					slot0 = slot0.getConfig
					slot2 = "resource_type"
					slot0 = slot0(slot1, slot2)

					if slot0 == 4 or slot0 == 14 then
						slot1 = slot1
						slot1 = slot1.player
						slot2 = slot1
						slot1 = slot1.getResById
						slot3 = slot0
						slot1 = slot1(slot2, slot3)
						slot2 = Item
						slot2 = slot2.New
						slot3 = {}
						slot4 = slot0
						slot5 = slot4
						slot4 = slot4.getConfig
						slot6 = "effect_args"
						slot4 = slot4(slot5, slot6)
						slot4 = slot4[1]
						slot3.id = slot4
						slot2 = slot2(slot3)
						slot3 = slot0
						slot4 = slot3
						slot3 = slot3.getConfig
						slot5 = "resource_num"
						slot3 = slot3(slot4, slot5)
						slot4 = slot0
						slot4 = slot4.discount
						slot4 = slot4 / 100
						slot3 = slot3 * slot4
						slot4 = pg
						slot4 = slot4.MsgboxMgr
						slot4 = slot4.GetInstance
						slot4 = slot4()
						slot5 = slot4
						slot4 = slot4.ShowMsgBox
						slot6 = {}
						slot7 = i18n
						slot8 = "charge_scene_buy_confirm"
						slot9 = slot3
						slot11 = slot2
						slot10 = slot2.getConfig
						slot12 = "name"
						slot7 = slot7(slot8, slot9, slot10(slot11, slot12))
						slot6.content = slot7

						function slot7()
							slot0 = slot0
							slot1 = slot0
							slot0 = slot0.emit
							slot2 = ShopsMediator
							slot2 = slot2.BUY_ITEM
							slot3 = slot1
							slot3 = slot3.id
							slot4 = 1

							slot0(slot1, slot2, slot3, slot4)
						end

						slot6.onYes = slot7

						slot4(slot5, slot6)
					else
						slot1 = slot1
						slot2 = slot1
						slot1 = slot1.emit
						slot3 = ShopsMediator
						slot3 = slot3.BUY_ITEM
						slot4 = slot0
						slot4 = slot4.id
						slot5 = 1

						slot1(slot2, slot3, slot4, slot5)
					end
				end

				slot2.onYes = slot3

				slot0(slot1, slot2)
			end

			slot17 = SFX_PANEL

			slot13(slot14, slot15, slot16, slot17)
		else
			slot13 = setActive
			slot14 = findTF
			slot15 = slot12
			slot16 = "item"
			slot14 = slot14(slot15, slot16)
			slot15 = false

			slot13(slot14, slot15)

			slot13 = setActive
			slot14 = findTF
			slot15 = slot12
			slot16 = "empty"
			slot14 = slot14(slot15, slot16)
			slot15 = true

			slot13(slot14, slot15)
		end
	end
end

slot0.displayShopSteet = slot3

function slot3(slot0, slot1)
	slot0.activityShops = slot1
end

slot0.setActivityShops = slot3

function slot3(slot0, slot1, slot2)
	slot3 = slot0.activityShops
	slot3[slot1] = slot2
	slot3 = slot0.currActivityShop

	if slot3 then
		slot3 = slot0.currActivityShop
		slot3 = slot3.id
		slot4 = slot2.id

		if slot3 == slot4 then
			slot4 = slot0
			slot3 = slot0.intActivityShop
			slot5 = slot1

			slot3(slot4, slot5)
		end
	end
end

slot0.updateActivityShop = slot3

function slot3(slot0, slot1)
	slot2 = slot0.biliBg

	if slot2 then
		setActive(slot0.biliBg, slot1 == ActivityConst.BILIBILI_PT_SHOP_ID)
	end

	slot2 = slot0.activityShops
	slot2 = slot2[slot1]

	if slot2 then
		slot3 = slot0.currActivityShop

		if slot3 == slot2 then
			return
		end
	end

	slot4 = slot2
	slot3 = slot2.getBgPath
	slot3, slot4, slot5 = slot3(slot4)
	slot7 = slot2
	slot6 = slot2.getSortGoods
	slot6 = slot6(slot7)
	slot7 = slot0.activityCards

	if slot7 then
		slot7 = slot0.activityCards
		slot7 = #slot7
		slot8 = 0

		if slot7 > slot8 then
			slot7 = _
			slot7 = slot7.each
			slot8 = slot0.activityCards

			function slot9(slot0)
				slot2 = slot0
				slot1 = slot0.dispose

				slot1(slot2)
			end

			slot7(slot8, slot9)
		end
	end

	slot7 = {}
	slot0.activityCards = slot7
	slot7 = slot0.uilist

	if not slot7 then
		slot8 = slot0
		slot7 = slot0.findTF
		slot9 = "scrollView/view"
		slot10 = slot0.activityShopTF
		slot7 = slot7(slot8, slot9, slot10)
		slot8 = UIItemList
		slot8 = slot8.New
		slot9 = slot7
		slot10 = slot0.goodActivityTF
		slot8 = slot8(slot9, slot10)
		slot0.uilist = slot8
	end

	slot7 = slot0.uilist
	slot9 = slot7
	slot8 = slot7.make

	function slot10(slot0, slot1, slot2)
		slot3 = UIItemList
		slot3 = slot3.EventUpdate

		if slot0 == slot3 then
			slot3 = slot0
			slot4 = slot1 + 1
			slot3 = slot3[slot4]
			slot4 = ActivityGoodsCard
			slot4 = slot4.New
			slot5 = slot2
			slot4 = slot4(slot5)
			slot6 = slot4
			slot5 = slot4.update
			slot7 = slot3
			slot8 = nil
			slot9 = slot1
			slot10 = slot2

			slot5(slot6, slot7, slot8, slot9, slot10)

			slot5 = table
			slot5 = slot5.insert
			slot6 = slot3
			slot6 = slot6.activityCards
			slot7 = slot4

			slot5(slot6, slot7)

			slot5 = onButton
			slot6 = slot3
			slot7 = slot4.tr

			function slot8()
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.showMsgBox
				slot2 = slot1

				slot0(slot1, slot2)
			end

			slot9 = SFX_PANEL

			slot5(slot6, slot7, slot8, slot9)
		end
	end

	slot8(slot9, slot10)

	slot9 = slot7
	slot8 = slot7.align
	slot10 = #slot6

	slot8(slot9, slot10)

	slot0.currActivityShop = slot2
	slot8 = setText
	slot10 = slot0
	slot9 = slot0.findTF
	slot11 = "Text"
	slot12 = slot0.activityShopTF
	slot9 = slot9(slot10, slot11, slot12)
	slot10 = i18n
	slot11 = "activity_shop_lable"
	slot13 = slot2
	slot12 = slot2.getOpenTime

	slot8(slot9, slot10(slot11, slot12(slot13)))

	slot9 = slot2
	slot8 = slot2.getResId
	slot8 = slot8(slot9)
	slot9 = setText
	slot11 = slot0
	slot10 = slot0.findTF
	slot12 = "res_battery/Text"
	slot13 = slot0.top
	slot10 = slot10(slot11, slot12, slot13)
	slot11 = slot0.player
	slot12 = slot11
	slot11 = slot11.getResource
	slot13 = slot8

	slot9(slot10, slot11(slot12, slot13))

	slot9 = setText
	slot11 = slot0
	slot10 = slot0.findTF
	slot12 = "res_battery/label"
	slot13 = slot0.top
	slot10 = slot10(slot11, slot12, slot13)
	slot11 = pg
	slot11 = slot11.item_data_statistics
	slot12 = id2ItemId
	slot13 = slot8
	slot12 = slot12(slot13)
	slot11 = slot11[slot12]
	slot11 = slot11.name

	slot9(slot10, slot11)

	slot10 = slot0
	slot9 = slot0.findTF
	slot11 = "res_battery/icon"
	slot12 = slot0.top
	slot9 = slot9(slot10, slot11, slot12)
	slot10 = slot9
	slot9 = slot9.GetComponent
	slot11 = typeof
	slot12 = Image
	slot9 = slot9(slot10, slot11(slot12))
	slot10 = GetSpriteFromAtlas
	slot11 = pg
	slot11 = slot11.item_data_statistics
	slot12 = id2ItemId
	slot13 = slot8
	slot12 = slot12(slot13)
	slot11 = slot11[slot12]
	slot11 = slot11.icon
	slot12 = ""
	slot10 = slot10(slot11, slot12)
	slot9.sprite = slot10
	slot11 = slot0.bgs
	slot12 = slot2.activityId
	slot11 = slot11[slot12]
	slot12 = nil

	if slot11 then
		slot12 = slot11
	else
		slot13 = GetSpriteFromAtlas
		slot14 = slot3
		slot15 = ""
		slot13 = slot13(slot14, slot15)
		slot12 = slot13
		slot13 = slot0.bgs
		slot14 = slot2.activityId
		slot13[slot14] = slot12
	end

	slot13 = setImageSprite
	slot14 = slot0.activityBg
	slot15 = slot12

	slot13(slot14, slot15)

	slot13 = setActive
	slot14 = slot0.activityBg
	slot15 = true

	slot13(slot14, slot15)
end

slot0.intActivityShop = slot3

function slot3(slot0, slot1)
	slot3 = slot1
	slot2 = slot1.getConfig
	slot4 = "num_limit"
	slot2 = slot2(slot3, slot4)

	if slot2 ~= 1 then
		slot3 = slot1
		slot2 = slot1.getConfig
		slot4 = "commodity_type"
		slot2 = slot2(slot3, slot4)

		if slot2 == 4 then
			slot3 = slot0
			slot2 = slot0.openSingleBox
			slot4 = slot1

			slot2(slot3, slot4)
		else
			slot3 = slot0
			slot2 = slot0.initMsgBox
			slot4 = slot1

			slot2(slot3, slot4)
		end
	end
end

slot0.showMsgBox = slot3

function slot3(slot0, slot1)
	slot2 = {}
	slot4 = slot1
	slot3 = slot1.getConfig
	slot5 = "commodity_id"
	slot3 = slot3(slot4, slot5)
	slot2.id = slot3
	slot4 = slot1
	slot3 = slot1.getConfig
	slot5 = "commodity_type"
	slot3 = slot3(slot4, slot5)
	slot2.type = slot3
	slot4 = slot1
	slot3 = slot1.getConfig
	slot5 = "num"
	slot3 = slot3(slot4, slot5)
	slot2.count = slot3

	function slot3()
		slot0 = pg
		slot0 = slot0.UIMgr
		slot0 = slot0.GetInstance
		slot0 = slot0()
		slot1 = slot0
		slot0 = slot0.BlurPanel
		slot2 = slot0
		slot2 = slot2.singleBoxTF

		slot0(slot1, slot2)

		slot0 = onButton
		slot1 = slot0
		slot2 = slot0
		slot3 = slot2
		slot2 = slot2.findTF
		slot4 = "window/actions/confirm_btn"
		slot5 = slot0
		slot5 = slot5.singleBoxTF
		slot2 = slot2(slot3, slot4, slot5)

		function slot3()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.getConfig
			slot2 = "commodity_type"
			slot0 = slot0(slot1, slot2)

			if slot0 == 4 then
				slot0 = slot1
				slot0 = slot0.curPage
				slot1 = slot2
				slot1 = slot1.TYPE_ACTIVITY

				if slot0 == slot1 then
					slot1:closeSingleBox()
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = i18n("pt_reconfirm", slot3.cfg.name or "??"),
						onYes = function ()
							slot0:purchase(slot0, 1)
						end
					})
				end
			else
				slot0 = slot1
				slot1 = slot0
				slot0 = slot0.purchase
				slot2 = slot0
				slot3 = 1

				slot0(slot1, slot2, slot3)

				slot0 = slot1
				slot1 = slot0
				slot0 = slot0.closeSingleBox

				slot0(slot1)
			end
		end

		slot4 = SFX_CANCEL

		slot0(slot1, slot2, slot3, slot4)

		slot0 = updateDrop
		slot1 = slot0
		slot1 = slot1.singleItemTF
		slot2 = slot3

		slot0(slot1, slot2)

		slot0 = GetOwnedpropCount
		slot1 = slot3
		slot0, slot1 = slot0(slot1)
		slot2 = setActive
		slot3 = slot0
		slot3 = slot3.singleItemOwnTF
		slot3 = slot3.parent
		slot4 = slot1

		slot2(slot3, slot4)

		slot2 = setText
		slot3 = slot0
		slot3 = slot3.singleItemOwnTF
		slot4 = slot0

		slot2(slot3, slot4)

		slot2 = setText
		slot3 = slot0
		slot3 = slot3.singleItemOwnLabelTF
		slot4 = i18n
		slot5 = "word_own1"

		slot2(slot3, slot4(slot5))

		slot2 = slot0
		slot2 = slot2.singleDescTF
		slot3 = slot3
		slot3 = slot3.desc
		slot2.text = slot3
		slot2 = slot0
		slot2 = slot2.singleNameTF
		slot3 = slot3
		slot3 = slot3.cfg
		slot3 = slot3.name
		slot2.text = slot3
		slot2 = setActive
		slot3 = slot0
		slot3 = slot3.singleBoxTF
		slot4 = true

		slot2(slot3, slot4)

		slot2 = slot0
		slot3 = slot2
		slot2 = slot2.unBlurView

		slot2(slot3)
	end

	slot4 = slot0.singleBoxTF

	if not slot4 then
		slot4 = LoadAndInstantiateAsync
		slot5 = "ui"
		slot6 = "ShopsUISinglebox"

		function slot7(slot0)
			slot1 = "singlebox"
			slot0.name = slot1
			slot1 = slot0
			slot2 = rtf
			slot3 = slot0
			slot2 = slot2(slot3)
			slot1.singleBoxTF = slot2
			slot1 = setParent
			slot2 = slot0
			slot2 = slot2.singleBoxTF
			slot3 = slot0
			slot3 = slot3._tf

			slot1(slot2, slot3)

			slot1 = slot0
			slot2 = slot0
			slot3 = slot2
			slot2 = slot2.findTF
			slot4 = "window/item/display_panel/name_container/name"
			slot5 = slot0
			slot5 = slot5.singleBoxTF
			slot2 = slot2(slot3, slot4, slot5)
			slot3 = slot2
			slot2 = slot2.GetComponent
			slot4 = typeof
			slot5 = Text
			slot2 = slot2(slot3, slot4(slot5))
			slot1.singleNameTF = slot2
			slot1 = slot0
			slot2 = slot0
			slot3 = slot2
			slot2 = slot2.findTF
			slot4 = "window/item/display_panel/desc/Text"
			slot5 = slot0
			slot5 = slot5.singleBoxTF
			slot2 = slot2(slot3, slot4, slot5)
			slot3 = slot2
			slot2 = slot2.GetComponent
			slot4 = typeof
			slot5 = Text
			slot2 = slot2(slot3, slot4(slot5))
			slot1.singleDescTF = slot2
			slot1 = slot0
			slot2 = slot0
			slot3 = slot2
			slot2 = slot2.findTF
			slot4 = "window/item"
			slot5 = slot0
			slot5 = slot5.singleBoxTF
			slot2 = slot2(slot3, slot4, slot5)
			slot1.singleItemTF = slot2
			slot1 = slot0
			slot2 = slot0
			slot3 = slot2
			slot2 = slot2.findTF
			slot4 = "icon_bg/own/Text"
			slot5 = slot0
			slot5 = slot5.singleItemTF
			slot2 = slot2(slot3, slot4, slot5)
			slot1.singleItemOwnTF = slot2
			slot1 = slot0
			slot2 = slot0
			slot3 = slot2
			slot2 = slot2.findTF
			slot4 = "icon_bg/own/label"
			slot5 = slot0
			slot5 = slot5.singleItemTF
			slot2 = slot2(slot3, slot4, slot5)
			slot1.singleItemOwnLabelTF = slot2
			slot1 = onButton
			slot2 = slot0
			slot3 = slot0
			slot4 = slot3
			slot3 = slot3.findTF
			slot5 = "window/actions/cancel_btn"
			slot6 = slot0
			slot6 = slot6.singleBoxTF
			slot3 = slot3(slot4, slot5, slot6)

			function slot4()
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.closeSingleBox

				slot0(slot1)
			end

			slot5 = SFX_CANCEL

			slot1(slot2, slot3, slot4, slot5)

			slot1 = onButton
			slot2 = slot0
			slot3 = slot0
			slot3 = slot3.singleBoxTF

			function slot4()
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.closeSingleBox

				slot0(slot1)
			end

			slot5 = SFX_CANCEL

			slot1(slot2, slot3, slot4, slot5)

			slot1 = onButton
			slot2 = slot0
			slot3 = slot0
			slot4 = slot3
			slot3 = slot3.findTF
			slot5 = "window/top/btnBack"
			slot6 = slot0
			slot6 = slot6.singleBoxTF
			slot3 = slot3(slot4, slot5, slot6)

			function slot4()
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.closeSingleBox

				slot0(slot1)
			end

			slot5 = SFX_CANCEL

			slot1(slot2, slot3, slot4, slot5)

			slot1 = slot1

			slot1()
		end

		slot4(slot5, slot6, slot7)
	else
		slot4 = slot3

		slot4()
	end
end

slot0.openSingleBox = slot3

function slot3(slot0)
	slot1 = slot0.singleBoxTF

	if slot1 then
		slot1 = pg
		slot1 = slot1.UIMgr
		slot1 = slot1.GetInstance
		slot1 = slot1()
		slot2 = slot1
		slot1 = slot1.UnblurPanel
		slot3 = slot0.singleBoxTF
		slot4 = slot0._tf

		slot1(slot2, slot3, slot4)

		slot1 = setActive
		slot2 = slot0.singleBoxTF
		slot3 = false

		slot1(slot2, slot3)

		slot2 = slot0
		slot1 = slot0.blurView

		slot1(slot2)
	end
end

slot0.closeSingleBox = slot3

function slot3(slot0, slot1, slot2)
	slot4 = slot1
	slot3 = slot1.canPurchase
	slot3 = slot3(slot4)

	if not slot3 then
		slot3 = pg
		slot3 = slot3.TipsMgr
		slot3 = slot3.GetInstance
		slot3 = slot3()
		slot4 = slot3
		slot3 = slot3.ShowTips
		slot5 = i18n
		slot6 = "buy_countLimit"

		slot3(slot4, slot5(slot6))

		return
	end

	slot3 = getPlayerOwn
	slot5 = slot1
	slot4 = slot1.getConfig
	slot6 = "resource_category"
	slot4 = slot4(slot5, slot6)
	slot6 = slot1
	slot5 = slot1.getConfig
	slot7 = "resource_type"
	slot3, slot4 = slot3(slot4, slot5(slot6, slot7))
	slot6 = slot1
	slot5 = slot1.getConfig
	slot7 = "resource_num"
	slot5 = slot5(slot6, slot7)
	slot5 = slot5 * slot2

	if slot4 < slot5 then
		slot5 = pg
		slot5 = slot5.TipsMgr
		slot5 = slot5.GetInstance
		slot5 = slot5()
		slot6 = slot5
		slot5 = slot5.ShowTips
		slot7 = i18n
		slot8 = "common_no_x"
		slot9 = slot3

		slot5(slot6, slot7(slot8, slot9))

		return
	end

	slot5 = slot0.curPage
	slot6 = slot0
	slot6 = slot6.TYPE_ACTIVITY

	if slot5 == slot6 then
		slot6 = slot0
		slot5 = slot0.emit
		slot7 = ShopsMediator
		slot7 = slot7.ACTIVITY_OPERATION
		slot8 = slot0.currActivityShop
		slot8 = slot8.activityId
		slot9 = 1
		slot10 = slot1.id
		slot11 = slot2

		slot5(slot6, slot7, slot8, slot9, slot10, slot11)
	else
		slot5 = slot0.curPage
		slot6 = slot0
		slot6 = slot6.TYPE_SHAM_SHOP

		if slot5 == slot6 then
			slot6 = slot0
			slot5 = slot0.emit
			slot7 = ShopsMediator
			slot7 = slot7.BUY_SHAM_ITEM
			slot8 = slot1.id
			slot9 = slot2

			slot5(slot6, slot7, slot8, slot9)
		else
			slot5 = slot0.curPage
			slot6 = slot0
			slot6 = slot6.TYPE_ESCORT_SHOP

			if slot5 == slot6 then
				slot6 = slot0
				slot5 = slot0.emit
				slot7 = ShopsMediator
				slot7 = slot7.BUY_ESCORT_ITEM
				slot8 = slot1.id
				slot9 = slot2

				slot5(slot6, slot7, slot8, slot9)
			else
				slot5 = slot0.curPage
				slot6 = slot0
				slot6 = slot6.TYPE_FRAGMENT

				if slot5 == slot6 then
					slot6 = slot0
					slot5 = slot0.emit
					slot7 = ShopsMediator
					slot7 = slot7.BUY_FRAG_ITEM
					slot8 = slot1.id
					slot9 = slot2

					slot5(slot6, slot7, slot8, slot9)
				end
			end
		end
	end
end

slot0.purchase = slot3

function slot3(slot0, slot1)
	slot2 = {}
	slot4 = slot1
	slot3 = slot1.getConfig
	slot5 = "commodity_id"
	slot3 = slot3(slot4, slot5)
	slot2.id = slot3
	slot4 = slot1
	slot3 = slot1.getConfig
	slot5 = "commodity_type"
	slot3 = slot3(slot4, slot5)
	slot2.type = slot3
	slot4 = slot1
	slot3 = slot1.getConfig
	slot5 = "num"
	slot3 = slot3(slot4, slot5)
	slot2.count = slot3
	slot3 = getPlayerOwn
	slot5 = slot1
	slot4 = slot1.getConfig
	slot6 = "resource_category"
	slot4 = slot4(slot5, slot6)
	slot6 = slot1
	slot5 = slot1.getConfig
	slot7 = "resource_type"
	slot3, slot4 = slot3(slot4, slot5(slot6, slot7))
	slot5 = math
	slot5 = slot5.max
	slot6 = math
	slot6 = slot6.floor
	slot8 = slot1
	slot7 = slot1.getConfig
	slot9 = "resource_num"
	slot7 = slot7(slot8, slot9)
	slot7 = slot4 / slot7
	slot6 = slot6(slot7)
	slot7 = 1
	slot5 = slot5(slot6, slot7)
	slot7 = slot1
	slot6 = slot1.getConfig
	slot8 = "num_limit"
	slot6 = slot6(slot7, slot8)

	if slot6 ~= 0 then
		slot6 = math
		slot6 = slot6.min
		slot7 = slot5
		slot9 = slot1
		slot8 = slot1.getConfig
		slot10 = "num_limit"
		slot8 = slot8(slot9, slot10)
		slot9 = slot1.buyCount
		slot8 = slot8 - slot9
		slot6 = slot6(slot7, slot8)
		slot5 = slot6
	end

	function slot6(slot0)
		slot1 = math
		slot1 = slot1.max
		slot2 = slot0
		slot3 = 1
		slot1 = slot1(slot2, slot3)
		slot0 = slot1
		slot1 = math
		slot1 = slot1.min
		slot2 = slot0
		slot3 = slot0
		slot1 = slot1(slot2, slot3)
		slot0 = slot1
		slot1 = slot1
		slot1 = slot1.countTF
		slot1.text = slot0
		slot1 = slot1
		slot1.curCount = slot0
		slot1 = slot1
		slot1 = slot1.itemCountTF
		slot2 = slot2
		slot3 = slot2
		slot2 = slot2.getConfig
		slot4 = "num"
		slot2 = slot2(slot3, slot4)
		slot2 = slot0 * slot2
		slot1.text = slot2
	end

	function slot7()
		slot0 = pg
		slot0 = slot0.UIMgr
		slot0 = slot0.GetInstance
		slot0 = slot0()
		slot1 = slot0
		slot0 = slot0.BlurPanel
		slot2 = slot0
		slot2 = slot2.msgBoxTF

		slot0(slot1, slot2)

		slot0 = 0.5
		slot1 = onButton
		slot2 = slot0
		slot3 = slot0
		slot4 = slot3
		slot3 = slot3.findTF
		slot5 = "actions/confirm_button"
		slot6 = slot0
		slot6 = slot6.msgBoxTF
		slot3 = slot3(slot4, slot5, slot6)

		function slot4()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.purchase
			slot2 = slot1
			slot3 = slot0
			slot3 = slot3.curCount

			slot0(slot1, slot2, slot3)

			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.closeActivityMsg

			slot0(slot1)
		end

		slot5 = SFX_PANEL

		slot1(slot2, slot3, slot4, slot5)

		slot1 = onButton
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3.leftBtn

		function slot4()
			slot0 = slot0
			slot1 = slot1
			slot1 = slot1.curCount
			slot1 = slot1 - 1

			slot0(slot1)
		end

		slot1(slot2, slot3, slot4)

		slot1 = onButton
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3.rightBtn

		function slot4()
			slot0 = slot0
			slot1 = slot1
			slot1 = slot1.curCount
			slot1 = slot1 + 1

			slot0(slot1)
		end

		slot1(slot2, slot3, slot4)

		slot1 = onButton
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3.maxBtn

		function slot4()
			slot0 = slot0
			slot1 = slot1

			slot0(slot1)
		end

		slot1(slot2, slot3, slot4)

		slot1 = slot2
		slot2 = 1

		slot1(slot2)

		slot1 = setActive
		slot2 = slot0
		slot2 = slot2.msgBoxTF
		slot3 = true

		slot1(slot2, slot3)

		slot1 = updateDrop
		slot2 = slot0
		slot2 = slot2.topItem
		slot3 = slot4

		slot1(slot2, slot3)

		slot1 = updateDrop
		slot2 = slot0
		slot2 = slot2.bottomItem
		slot3 = slot4

		slot1(slot2, slot3)

		slot1 = GetOwnedpropCount
		slot2 = slot4
		slot1, slot2 = slot1(slot2)
		slot3 = setActive
		slot4 = slot0
		slot4 = slot4.ownerTF
		slot4 = slot4.parent
		slot5 = slot2

		slot3(slot4, slot5)

		slot3 = setText
		slot4 = slot0
		slot4 = slot4.ownerTF
		slot5 = slot1

		slot3(slot4, slot5)

		slot3 = setText
		slot4 = slot0
		slot4 = slot4.ownerLabelTF
		slot5 = i18n
		slot6 = "word_own1"

		slot3(slot4, slot5(slot6))

		slot3 = slot0
		slot3 = slot3.nameTF
		slot4 = slot4
		slot4 = slot4.cfg
		slot4 = slot4.name
		slot3.text = slot4
		slot3 = slot0
		slot3 = slot3.descTF
		slot4 = slot4
		slot4 = slot4.desc
		slot3.text = slot4
		slot3 = slot0
		slot4 = slot3
		slot3 = slot3.unBlurView

		slot3(slot4)
	end

	slot8 = slot0.msgBoxTF

	if not slot8 then
		slot8 = LoadAndInstantiateAsync
		slot9 = "ui"
		slot10 = "ShopsUIMsgbox"

		function slot11(slot0)
			slot1 = "msgbox"
			slot0.name = slot1
			slot1 = slot0
			slot2 = rtf
			slot3 = slot0
			slot2 = slot2(slot3)
			slot1.msgBoxTF = slot2
			slot1 = setParent
			slot2 = slot0
			slot2 = slot2.msgBoxTF
			slot3 = slot0
			slot3 = slot3._tf

			slot1(slot2, slot3)

			slot1 = slot0
			slot2 = slot0
			slot3 = slot2
			slot2 = slot2.findTF
			slot4 = "item"
			slot5 = slot0
			slot5 = slot5.msgBoxTF
			slot2 = slot2(slot3, slot4, slot5)
			slot1.topItem = slot2
			slot1 = slot0
			slot2 = slot0
			slot3 = slot2
			slot2 = slot2.findTF
			slot4 = "got/panel_bg/list/item"
			slot5 = slot0
			slot5 = slot5.msgBoxTF
			slot2 = slot2(slot3, slot4, slot5)
			slot1.bottomItem = slot2
			slot1 = slot0
			slot2 = slot0
			slot3 = slot2
			slot2 = slot2.findTF
			slot4 = "count/max"
			slot5 = slot0
			slot5 = slot5.msgBoxTF
			slot2 = slot2(slot3, slot4, slot5)
			slot1.maxBtn = slot2
			slot1 = slot0
			slot2 = slot0
			slot3 = slot2
			slot2 = slot2.findTF
			slot4 = "count/number_panel/left"
			slot5 = slot0
			slot5 = slot5.msgBoxTF
			slot2 = slot2(slot3, slot4, slot5)
			slot1.leftBtn = slot2
			slot1 = slot0
			slot2 = slot0
			slot3 = slot2
			slot2 = slot2.findTF
			slot4 = "count/number_panel/right"
			slot5 = slot0
			slot5 = slot5.msgBoxTF
			slot2 = slot2(slot3, slot4, slot5)
			slot1.rightBtn = slot2
			slot1 = slot0
			slot2 = slot0
			slot3 = slot2
			slot2 = slot2.findTF
			slot4 = "item/display_panel/name_container/name"
			slot5 = slot0
			slot5 = slot5.msgBoxTF
			slot2 = slot2(slot3, slot4, slot5)
			slot3 = slot2
			slot2 = slot2.GetComponent
			slot4 = typeof
			slot5 = Text
			slot2 = slot2(slot3, slot4(slot5))
			slot1.nameTF = slot2
			slot1 = slot0
			slot2 = slot0
			slot3 = slot2
			slot2 = slot2.findTF
			slot4 = "item/display_panel/desc/Text"
			slot5 = slot0
			slot5 = slot5.msgBoxTF
			slot2 = slot2(slot3, slot4, slot5)
			slot3 = slot2
			slot2 = slot2.GetComponent
			slot4 = typeof
			slot5 = Text
			slot2 = slot2(slot3, slot4(slot5))
			slot1.descTF = slot2
			slot1 = slot0
			slot2 = slot0
			slot3 = slot2
			slot2 = slot2.findTF
			slot4 = "icon_bg/count"
			slot5 = slot0
			slot5 = slot5.bottomItem
			slot2 = slot2(slot3, slot4, slot5)
			slot3 = slot2
			slot2 = slot2.GetComponent
			slot4 = typeof
			slot5 = Text
			slot2 = slot2(slot3, slot4(slot5))
			slot1.itemCountTF = slot2
			slot1 = slot0
			slot2 = slot0
			slot3 = slot2
			slot2 = slot2.findTF
			slot4 = "count/number_panel/value"
			slot5 = slot0
			slot5 = slot5.msgBoxTF
			slot2 = slot2(slot3, slot4, slot5)
			slot3 = slot2
			slot2 = slot2.GetComponent
			slot4 = typeof
			slot5 = Text
			slot2 = slot2(slot3, slot4(slot5))
			slot1.countTF = slot2
			slot1 = slot0
			slot2 = slot0
			slot3 = slot2
			slot2 = slot2.findTF
			slot4 = "icon_bg/own/Text"
			slot5 = slot0
			slot5 = slot5.topItem
			slot2 = slot2(slot3, slot4, slot5)
			slot1.ownerTF = slot2
			slot1 = slot0
			slot2 = slot0
			slot3 = slot2
			slot2 = slot2.findTF
			slot4 = "icon_bg/own/label"
			slot5 = slot0
			slot5 = slot5.topItem
			slot2 = slot2(slot3, slot4, slot5)
			slot1.ownerLabelTF = slot2
			slot1 = onButton
			slot2 = slot0
			slot3 = slot0
			slot4 = slot3
			slot3 = slot3.findTF
			slot5 = "actions/cancel_button"
			slot6 = slot0
			slot6 = slot6.msgBoxTF
			slot3 = slot3(slot4, slot5, slot6)

			function slot4()
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.closeActivityMsg

				slot0(slot1)
			end

			slot5 = SFX_PANEL

			slot1(slot2, slot3, slot4, slot5)

			slot1 = onButton
			slot2 = slot0
			slot3 = slot0
			slot3 = slot3.msgBoxTF

			function slot4()
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.closeActivityMsg

				slot0(slot1)
			end

			slot5 = SFX_PANEL

			slot1(slot2, slot3, slot4, slot5)

			slot1 = slot1

			slot1()
		end

		slot8(slot9, slot10, slot11)
	else
		slot8 = slot7

		slot8()
	end
end

slot0.initMsgBox = slot3

function slot3(slot0)
	slot1 = slot0.msgBoxTF

	if slot1 then
		slot1 = pg
		slot1 = slot1.UIMgr
		slot1 = slot1.GetInstance
		slot1 = slot1()
		slot2 = slot1
		slot1 = slot1.UnblurPanel
		slot3 = slot0.msgBoxTF
		slot4 = slot0._tf

		slot1(slot2, slot3, slot4)

		slot1 = setActive
		slot2 = slot0.msgBoxTF
		slot3 = false

		slot1(slot2, slot3)

		slot2 = slot0
		slot1 = slot0.blurView

		slot1(slot2)
	end
end

slot0.closeActivityMsg = slot3

function slot3(slot0)
	slot1 = IsNil
	slot2 = slot0.guildResTxt
	slot1 = slot1(slot2)

	if not slot1 then
		slot1 = slot0.guildResTxt
		slot2 = slot0.player
		slot2 = slot2.guildCoin
		slot1.text = slot2
	end
end

slot0.updateGuildRes = slot3

function slot3(slot0)
	slot1 = slot0.guildShop

	if slot1 then
		slot1 = slot0.isInitGuildShop

		if slot1 then
			return
		end
	end

	slot1 = true
	slot0.isInitGuildShop = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "scrollView/view"
	slot4 = slot0.guildShopTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.guildGoodsContain = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "timer_bg/Text"
	slot4 = slot0.guildShopTF
	slot1 = slot1(slot2, slot3, slot4)
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = Text
	slot1 = slot1(slot2, slot3(slot4))
	slot0.guildTimerTxt = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "res_guild/bg/Text"
	slot4 = slot0.top
	slot1 = slot1(slot2, slot3, slot4)
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = Text
	slot1 = slot1(slot2, slot3(slot4))
	slot0.guildResTxt = slot1
	slot2 = slot0
	slot1 = slot0.resetGuildCards

	slot1(slot2)

	slot2 = slot0
	slot1 = slot0.updateGuildRes

	slot1(slot2)

	slot1 = onButton
	slot2 = slot0
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "refresh_btn"
	slot6 = slot0.guildShopTF
	slot3 = slot3(slot4, slot5, slot6)

	function slot4()
		slot0 = ShoppingStreet
		slot0 = slot0.getRiseShopId
		slot1 = ShopArgs
		slot1 = slot1.guildShopFlash
		slot2 = slot0
		slot2 = slot2.guildShop
		slot2 = slot2.refreshCount
		slot0 = slot0(slot1, slot2)

		if not slot0 then
			return
		end

		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.emit
		slot3 = ShopsMediator
		slot3 = slot3.BUY_ITEM
		slot4 = slot0
		slot5 = 1

		slot1(slot2, slot3, slot4, slot5)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)
end

slot0.initGuildShop = slot3

function slot3(slot0)
	slot1 = slot0.isInitGuildShop

	if not slot1 then
		return
	end

	slot1 = slot0.guildTimer

	if slot1 then
		slot1 = slot0.guildTimer
		slot2 = slot1
		slot1 = slot1.Stop

		slot1(slot2)

		slot1 = nil
		slot0.guildTimer = slot1
	end

	slot1 = Timer
	slot1 = slot1.New

	function slot2()
		slot0 = slot0
		slot0 = slot0.guildShop
		slot0 = slot0.nextRefreshTime
		slot1 = pg
		slot1 = slot1.TimeMgr
		slot1 = slot1.GetInstance
		slot1 = slot1()
		slot2 = slot1
		slot1 = slot1.GetServerTime
		slot1 = slot1(slot2)
		slot0 = slot0 - slot1
		slot1 = 0

		if slot0 > slot1 then
			slot1 = slot0
			slot1 = slot1.guildTimerTxt
			slot2 = pg
			slot2 = slot2.TimeMgr
			slot2 = slot2.GetInstance
			slot2 = slot2()
			slot3 = slot2
			slot2 = slot2.DescCDTime
			slot4 = slot0
			slot2 = slot2(slot3, slot4)
			slot1.text = slot2
		else
			slot1 = slot0
			slot1 = slot1.guildTimerTxt
			slot2 = ""
			slot1.text = slot2
			slot1 = slot0
			slot1 = slot1.guildTimer
			slot2 = slot1
			slot1 = slot1.Stop

			slot1(slot2)

			slot1 = slot0
			slot2 = nil
			slot1.guildTimer = slot2
		end
	end

	slot3 = 1
	slot4 = -1
	slot1 = slot1(slot2, slot3, slot4)
	slot0.guildTimer = slot1
	slot1 = slot0.guildTimer
	slot2 = slot1
	slot1 = slot1.Start

	slot1(slot2)

	slot1 = slot0.guildTimer
	slot1 = slot1.func

	slot1()
end

slot0.addGuidTimer = slot3

function slot3(slot0)
	slot1 = pg
	slot1 = slot1.MsgboxMgr
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot2 = slot1._go
	slot2 = slot2.activeSelf

	if slot2 then
		slot3 = slot1
		slot2 = slot1.hide

		slot2(slot3)
	end
end

slot0.closeMsgBox = slot3

function slot3(slot0)
	slot1 = slot0.isInitGuildShop

	if not slot1 then
		return
	end

	slot1 = slot0.guildShop
	slot2 = slot1
	slot1 = slot1.getSortGoods
	slot1 = slot1(slot2)
	slot2 = {}
	slot0.guildShopCards = slot2
	slot2 = slot0.guildGoodsContain
	slot2 = slot2.childCount
	slot3 = #slot1
	slot4 = slot2 + 1
	slot5 = slot3
	slot6 = 1

	for slot7 = slot4, slot5, slot6 do
		slot8 = cloneTplTo
		slot9 = slot0.goodTF
		slot10 = slot0.guildGoodsContain

		slot8(slot9, slot10)
	end

	slot4 = slot0.guildGoodsContain
	slot2 = slot4.childCount
	slot4 = 1
	slot5 = slot2
	slot6 = 1

	for slot7 = slot4, slot5, slot6 do
		setActive(slot0.guildGoodsContain:GetChild(slot7 - 1), slot7 <= slot3)

		if slot7 <= slot3 then
			slot9 = slot1[slot7]
			slot10 = GoodsCard
			slot10 = slot10.New
			slot11 = slot8
			slot10 = slot10(slot11)
			slot11 = table
			slot11 = slot11.insert
			slot12 = slot0.cards
			slot13 = slot10

			slot11(slot12, slot13)

			slot12 = slot10
			slot11 = slot10.update
			slot13 = slot9

			slot11(slot12, slot13)

			slot11 = onButton
			slot12 = slot0
			slot13 = slot10.tr

			function slot14()
				slot0 = pg
				slot0 = slot0.MsgboxMgr
				slot0 = slot0.GetInstance
				slot0 = slot0()
				slot1 = slot0
				slot0 = slot0.ShowMsgBox
				slot2 = {
					showOwned = true,
					hideLine = true,
					yesText = "text_exchange"
				}
				slot3 = MSGBOX_TYPE_SINGLE_ITEM
				slot2.type = slot3
				slot3 = {}
				slot4 = slot0
				slot5 = slot4
				slot4 = slot4.getConfig
				slot6 = "effect_args"
				slot4 = slot4(slot5, slot6)
				slot4 = slot4[1]
				slot3.id = slot4
				slot4 = slot0
				slot5 = slot4
				slot4 = slot4.getConfig
				slot6 = "type"
				slot4 = slot4(slot5, slot6)
				slot3.type = slot4
				slot2.drop = slot3

				function slot3()
					slot0 = slot0
					slot1 = slot0
					slot0 = slot0.canPurchase
					slot0 = slot0(slot1)

					if not slot0 then
						slot0 = pg
						slot0 = slot0.TipsMgr
						slot0 = slot0.GetInstance
						slot0 = slot0()
						slot1 = slot0
						slot0 = slot0.ShowTips
						slot2 = i18n
						slot3 = "buy_countLimit"

						slot0(slot1, slot2(slot3))

						return
					end

					slot0 = slot1
					slot1 = slot0
					slot0 = slot0.emit
					slot2 = ShopsMediator
					slot2 = slot2.BUY_ITEM
					slot3 = slot0
					slot3 = slot3.id
					slot4 = 1

					slot0(slot1, slot2, slot3, slot4)
				end

				slot2.onYes = slot3

				slot0(slot1, slot2)
			end

			slot15 = SFX_PANEL

			slot11(slot12, slot13, slot14, slot15)

			slot11 = slot0.guildShopCards
			slot12 = slot9.id
			slot11[slot12] = slot10
		end
	end
end

slot0.initGuildGoodsCards = slot3

function slot3(slot0)
	slot1 = slot0.isInitGuildShop

	if not slot1 then
		return
	end

	slot1 = pairs
	slot2 = slot0.guildShopCards
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot6 = slot0.guildShop
		slot7 = slot6
		slot6 = slot6.getGoodsById
		slot8 = slot4
		slot6 = slot6(slot7, slot8)

		if slot6 then
			slot8 = slot5
			slot7 = slot5.update
			slot9 = slot6

			slot7(slot8, slot9)
		end
	end
end

slot0.updateGuildCard = slot3

function slot3(slot0)
	slot2 = slot0
	slot1 = slot0.initGuildGoodsCards

	slot1(slot2)

	slot2 = slot0
	slot1 = slot0.addGuidTimer

	slot1(slot2)
end

slot0.resetGuildCards = slot3

function slot3(slot0)
	slot1 = slot0.shamItemList

	if not slot1 then
		slot2 = slot0
		slot1 = slot0.findTF
		slot3 = "scrollView/view"
		slot4 = slot0.shamShopTF
		slot1 = slot1(slot2, slot3, slot4)
		slot2 = UIItemList
		slot2 = slot2.New
		slot3 = slot1
		slot4 = slot0.goodShamTF
		slot2 = slot2(slot3, slot4)
		slot0.shamItemList = slot2
	end

	slot1 = slot0.shamShop
	slot2 = slot1
	slot1 = slot1.getSortGoods
	slot1 = slot1(slot2)
	slot2 = slot0.shamItemList
	slot3 = slot2
	slot2 = slot2.make

	function slot4(slot0, slot1, slot2)
		slot3 = UIItemList
		slot3 = slot3.EventUpdate

		if slot0 == slot3 then
			slot3 = ActivityGoodsCard
			slot3 = slot3.New
			slot4 = slot2
			slot3 = slot3(slot4)
			slot4 = slot0
			slot5 = slot1 + 1
			slot4 = slot4[slot5]
			slot6 = slot3
			slot5 = slot3.update
			slot7 = slot4
			slot8 = slot1
			slot8 = slot8.TYPE_SHAM_SHOP

			slot5(slot6, slot7, slot8)

			slot5 = onButton
			slot6 = slot2
			slot7 = slot3.tr

			function slot8()
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.getConfig
				slot2 = "num_limit"
				slot0 = slot0(slot1, slot2)

				if slot0 ~= 1 then
					slot0 = slot0
					slot1 = slot0
					slot0 = slot0.getConfig
					slot2 = "commodity_type"
					slot0 = slot0(slot1, slot2)

					if slot0 == 4 then
						slot0 = slot1
						slot1 = slot0
						slot0 = slot0.openSingleBox
						slot2 = slot0

						slot0(slot1, slot2)
					else
						slot0 = slot1
						slot1 = slot0
						slot0 = slot0.initMsgBox
						slot2 = slot0

						slot0(slot1, slot2)
					end
				end
			end

			slot9 = SFX_PANEL

			slot5(slot6, slot7, slot8, slot9)
		end
	end

	slot2(slot3, slot4)

	slot2 = slot0.shamItemList
	slot3 = slot2
	slot2 = slot2.align
	slot4 = #slot1

	slot2(slot3, slot4)

	slot2 = setText
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "time/day"
	slot6 = slot0.shamShopTF
	slot3 = slot3(slot4, slot5, slot6)
	slot4 = string
	slot4 = slot4.format
	slot5 = "%02d"
	slot6 = slot0.shamShop
	slot7 = slot6
	slot6 = slot6.getRestDays

	slot2(slot3, slot4(slot5, slot6(slot7)))
end

slot0.updateShamShop = slot3

function slot3(slot0)
	slot1 = getProxy
	slot2 = BagProxy
	slot1 = slot1(slot2)
	slot3 = slot1
	slot2 = slot1.getItemCountById
	slot4 = ChapterConst
	slot4 = slot4.ShamMoneyItem
	slot2 = slot2(slot3, slot4)
	slot3 = setText
	slot5 = slot0
	slot4 = slot0.findTF
	slot6 = "res_nano/Text"
	slot7 = slot0.top
	slot4 = slot4(slot5, slot6, slot7)
	slot5 = slot2

	slot3(slot4, slot5)
end

slot0.updateShamRes = slot3

function slot3(slot0)
	slot1 = slot0.escortItemList

	if not slot1 then
		slot2 = slot0
		slot1 = slot0.findTF
		slot3 = "scrollView/view"
		slot4 = slot0.escortShopTF
		slot1 = slot1(slot2, slot3, slot4)
		slot2 = UIItemList
		slot2 = slot2.New
		slot3 = slot1
		slot4 = slot0.goodActivityTF
		slot2 = slot2(slot3, slot4)
		slot0.escortItemList = slot2
	end

	slot1 = slot0.escortShop
	slot2 = slot1
	slot1 = slot1.getSortGoods
	slot1 = slot1(slot2)
	slot2 = slot0.escortItemList
	slot3 = slot2
	slot2 = slot2.make

	function slot4(slot0, slot1, slot2)
		slot3 = UIItemList
		slot3 = slot3.EventUpdate

		if slot0 == slot3 then
			slot3 = ActivityGoodsCard
			slot3 = slot3.New
			slot4 = slot2
			slot3 = slot3(slot4)
			slot4 = slot0
			slot5 = slot1 + 1
			slot4 = slot4[slot5]
			slot6 = slot3
			slot5 = slot3.update
			slot7 = slot4

			slot5(slot6, slot7)

			slot5 = onButton
			slot6 = slot1
			slot7 = slot3.tr

			function slot8()
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.getConfig
				slot2 = "num_limit"
				slot0 = slot0(slot1, slot2)

				if slot0 ~= 1 then
					slot0 = slot0
					slot1 = slot0
					slot0 = slot0.getConfig
					slot2 = "commodity_type"
					slot0 = slot0(slot1, slot2)

					if slot0 == 4 then
						slot0 = slot1
						slot1 = slot0
						slot0 = slot0.openSingleBox
						slot2 = slot0

						slot0(slot1, slot2)
					else
						slot0 = slot1
						slot1 = slot0
						slot0 = slot0.initMsgBox
						slot2 = slot0

						slot0(slot1, slot2)
					end
				end
			end

			slot9 = SFX_PANEL

			slot5(slot6, slot7, slot8, slot9)
		end
	end

	slot2(slot3, slot4)

	slot2 = slot0.escortItemList
	slot3 = slot2
	slot2 = slot2.align
	slot4 = #slot1

	slot2(slot3, slot4)

	slot2 = setText
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "time/day"
	slot6 = slot0.escortShopTF
	slot3 = slot3(slot4, slot5, slot6)
	slot4 = string
	slot4 = slot4.format
	slot5 = "%02d"
	slot6 = slot0.escortShop
	slot7 = slot6
	slot6 = slot6.getRestDays

	slot2(slot3, slot4(slot5, slot6(slot7)))
end

slot0.updateEscortShop = slot3

function slot3(slot0)
	slot1 = getProxy
	slot2 = BagProxy
	slot1 = slot1(slot2)
	slot3 = slot1
	slot2 = slot1.getItemCountById
	slot4 = ChapterConst
	slot4 = slot4.EscortMoneyItem
	slot2 = slot2(slot3, slot4)
	slot3 = setText
	slot5 = slot0
	slot4 = slot0.findTF
	slot6 = "res_nano/Text"
	slot7 = slot0.top
	slot4 = slot4(slot5, slot6, slot7)
	slot5 = slot2

	slot3(slot4, slot5)
end

slot0.updateEscortRes = slot3

function slot3(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.shopDatas
	slot1 = slot1.fragshop

	if not slot1 then
		return
	end

	slot1 = slot0.contextData
	slot1 = slot1.shopDatas
	slot1 = slot1.fragshop
	slot2 = slot1
	slot1 = slot1.getSortGoods
	slot1 = slot1(slot2)
	slot2 = UIItemList
	slot2 = slot2.StaticAlign
	slot3 = slot0.fragShopTF
	slot4 = slot3
	slot3 = slot3.Find
	slot5 = "scrollView/view"
	slot3 = slot3(slot4, slot5)
	slot4 = slot0.goodFragTF
	slot5 = #slot1

	function slot6(slot0, slot1, slot2)
		slot3 = UIItemList
		slot3 = slot3.EventUpdate

		if slot0 == slot3 then
			slot3 = slot0
			slot4 = slot1 + 1
			slot3 = slot3[slot4]
			slot4 = ActivityGoodsCard
			slot4 = slot4.StaticUpdate
			slot5 = slot2
			slot6 = slot3
			slot7 = slot1
			slot7 = slot7.TYPE_FRAGMENT

			slot4(slot5, slot6, slot7)

			slot4 = onButton
			slot5 = slot2
			slot6 = slot2

			function slot7()
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.getConfig
				slot2 = "num_limit"
				slot0 = slot0(slot1, slot2)

				if slot0 ~= 1 then
					slot0 = slot0
					slot1 = slot0
					slot0 = slot0.getConfig
					slot2 = "commodity_type"
					slot0 = slot0(slot1, slot2)

					if slot0 == 4 then
						slot0 = slot1
						slot1 = slot0
						slot0 = slot0.openSingleBox
						slot2 = slot0

						slot0(slot1, slot2)
					else
						slot0 = slot1
						slot1 = slot0
						slot0 = slot0.initMsgBox
						slot2 = slot0

						slot0(slot1, slot2)
					end
				end
			end

			slot8 = SFX_PANEL

			slot4(slot5, slot6, slot7, slot8)
		end
	end

	slot2(slot3, slot4, slot5, slot6)

	slot2 = slot0.contextData
	slot2 = slot2.shopDatas
	slot2 = slot2.fragshop
	slot3 = slot2
	slot2 = slot2.getRestDays
	slot2 = slot2(slot3)
	slot3 = setText
	slot5 = slot0
	slot4 = slot0.findTF
	slot6 = "time/day"
	slot7 = slot0.fragShopTF
	slot4 = slot4(slot5, slot6, slot7)
	slot5 = string
	slot5 = slot5.format
	slot6 = "%02d"
	slot7 = slot2

	slot3(slot4, slot5(slot6, slot7))
end

slot0.updateBlueprintFragShop = slot3

function slot3(slot0)
	slot1 = getProxy
	slot2 = PlayerProxy
	slot1 = slot1(slot2)
	slot3 = slot1
	slot2 = slot1.getRawData
	slot2 = slot2(slot3)
	slot3 = slot2
	slot2 = slot2.getResource
	slot4 = PlayerConst
	slot4 = slot4.ResBlueprintFragment
	slot2 = slot2(slot3, slot4)
	slot3 = setText
	slot5 = slot0
	slot4 = slot0.findTF
	slot6 = "res_fragment/count"
	slot7 = slot0.top
	slot4 = slot4(slot5, slot6, slot7)
	slot5 = slot2

	slot3(slot4, slot5)
end

slot0.updateFragRes = slot3

function slot3(slot0)
	slot1 = slot0.resolvePanel

	if not slot1 then
		slot1 = FragResolvePanel
		slot1 = slot1.New
		slot2 = slot0
		slot1 = slot1(slot2)
		slot0.resolvePanel = slot1
		slot1 = slot0.resolvePanel
		slot2 = slot1
		slot1 = slot1.Load

		slot1(slot2)
	end

	slot1 = slot0.resolvePanel
	slot1 = slot1.buffer
	slot2 = slot1
	slot1 = slot1.Reset

	slot1(slot2)

	slot1 = slot0.resolvePanel
	slot1 = slot1.buffer
	slot2 = slot1
	slot1 = slot1.Trigger
	slot3 = "control"

	slot1(slot2, slot3)
end

slot0.CallFragResolve = slot3

function slot3(slot0, slot1)
	slot3 = slot1
	slot2 = slot1.GetEnterVoice
	slot2, slot3 = slot2(slot3)

	if slot2 then
		slot5 = slot0
		slot4 = slot0.playCV
		slot6 = slot2

		slot4(slot5, slot6)
	end

	if slot3 then
		slot5 = slot0
		slot4 = slot0.ShowShipWord
		slot6 = slot3

		slot4(slot5, slot6)
	end
end

slot0.PlayActivityShopEnterVoice = slot3

function slot3(slot0, slot1)
	slot3 = slot1
	slot2 = slot1.GetPurchaseVoice
	slot2, slot3 = slot2(slot3)

	if slot2 then
		slot5 = slot0
		slot4 = slot0.playCV
		slot6 = slot2

		slot4(slot5, slot6)
	end

	if slot3 then
		slot5 = slot0
		slot4 = slot0.ShowShipWord
		slot6 = slot3

		slot4(slot5, slot6)
	end
end

slot0.PlayActivityShopPurchaseVoice = slot3

function slot3(slot0, slot1)
	slot2 = nil
	slot3, slot4, slot5 = pairs(slot0.activityShops or {})

	for slot6, slot7 in slot3, slot4, slot5 do
		slot8 = slot7.activityId

		if slot8 == slot1 then
			shop = slot7

			break
		end
	end

	slot3 = shop

	if slot3 then
		slot4 = slot0
		slot3 = slot0.PlayActivityShopPurchaseVoice
		slot5 = shop

		slot3(slot4, slot5)
	end
end

slot0.OnActivtyShopPurchaseDone = slot3

function slot3(slot0)
	slot1 = slot0.bulinTip

	if slot1 then
		slot1 = slot0.bulinTip
		slot2 = slot1
		slot1 = slot1.Destroy

		slot1(slot2)

		slot1 = nil
		slot0.bulinTip = slot1
	end

	slot2 = slot0
	slot1 = slot0.stopCV

	slot1(slot2)

	slot1 = ipairs
	slot2 = slot0.cards
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot7 = slot5
		slot6 = slot5.dispose

		slot6(slot7)
	end

	slot1 = ipairs
	slot2 = slot0.activityCards or {}
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot7 = slot5
		slot6 = slot5.dispose

		slot6(slot7)
	end

	slot1 = slot0.refreshTimer

	if slot1 then
		slot1 = slot0.refreshTimer
		slot2 = slot1
		slot1 = slot1.Stop

		slot1(slot2)

		slot1 = nil
		slot0.refreshTimer = slot1
	end

	slot1 = slot0.shopStreetTimer

	if slot1 then
		slot1 = slot0.shopStreetTimer
		slot2 = slot1
		slot1 = slot1.Stop

		slot1(slot2)

		slot1 = nil
		slot0.shopStreetTimer = slot1
	end

	slot1 = slot0.guildTimer

	if slot1 then
		slot1 = slot0.guildTimer
		slot2 = slot1
		slot1 = slot1.Stop

		slot1(slot2)

		slot1 = nil
		slot0.guildTimer = slot1
	end

	slot1 = slot0.resolvePanel

	if slot1 then
		slot1 = slot0.resolvePanel
		slot2 = slot1
		slot1 = slot1.Destroy

		slot1(slot2)

		slot1 = nil
		slot0.resolvePanel = slot1
	end

	slot1 = slot0.resPanel

	if slot1 then
		slot1 = slot0.resPanel
		slot2 = slot1
		slot1 = slot1.exit

		slot1(slot2)

		slot1 = nil
		slot0.resPanel = slot1
	end

	slot1 = slot0.tweens

	if slot1 then
		slot1 = cancelTweens
		slot2 = slot0.tweens

		slot1(slot2)

		slot1 = nil
		slot0.tweens = slot1
	end

	slot2 = slot0
	slot1 = slot0.closeSingleBox

	slot1(slot2)

	slot2 = slot0
	slot1 = slot0.closeActivityMsg

	slot1(slot2)

	slot2 = slot0
	slot1 = slot0.unBlurView

	slot1(slot2)

	slot1 = slot0.paintingName

	if slot1 then
		slot1 = retPaintingPrefab
		slot2 = slot0.painting
		slot3 = slot0.paintingName

		slot1(slot2, slot3)
	end
end

slot0.willExit = slot3

return slot0
