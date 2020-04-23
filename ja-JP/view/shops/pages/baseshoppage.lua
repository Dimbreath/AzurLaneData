slot0 = class
slot1 = "BaseShopPage"
slot2 = import
slot3 = "...base.BaseSubView"
slot0 = slot0(slot1, slot2(slot3))

function slot1(slot0)
	slot1 = slot0._state
	slot2 = slot0
	slot2 = slot2.STATES
	slot2 = slot2.NONE

	if slot1 ~= slot2 then
		return
	end

	slot1 = slot0
	slot1 = slot1.STATES
	slot1 = slot1.LOADING
	slot0._state = slot1
	slot1 = pg
	slot1 = slot1.UIMgr
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot2 = slot1
	slot1 = slot1.LoadingOn

	slot1(slot2)

	slot1 = GameObject
	slot1 = slot1.Find
	slot2 = "__Pool__"
	slot1 = slot1(slot2)
	slot2 = findTF
	slot3 = slot1
	slot5 = slot0
	slot4 = slot0.getUIName
	slot2 = slot2(slot3, slot4(slot5))
	slot3 = IsNil
	slot4 = slot2
	slot3 = slot3(slot4)

	if slot3 then
		slot3 = PoolMgr
		slot3 = slot3.GetInstance
		slot3 = slot3()
		slot4 = slot3
		slot3 = slot3.GetUI
		slot6 = slot0
		slot5 = slot0.getUIName
		slot5 = slot5(slot6)
		slot6 = true

		function slot7(slot0)
			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.Loaded
			slot3 = slot0

			slot1(slot2, slot3)

			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.Init

			slot1(slot2)
		end

		slot3(slot4, slot5, slot6, slot7)
	else
		slot4 = slot0
		slot3 = slot0.Loaded
		slot5 = slot2.gameObject

		slot3(slot4, slot5)

		slot4 = slot0
		slot3 = slot0.Init

		slot3(slot4)
	end
end

slot0.Load = slot1

function slot1(slot0, slot1)
	slot0.shop = slot1
end

slot0.SetShop = slot1

function slot1(slot0, slot1)
	slot0.player = slot1
	slot3 = slot0
	slot2 = slot0.OnUpdatePlayer

	slot2(slot3)
end

slot0.SetPlayer = slot1

function slot1(slot0, slot1)
	slot0.items = slot1
	slot3 = slot0
	slot2 = slot0.OnUpdateItems

	slot2(slot3)
end

slot0.SetItems = slot1

function slot1(slot0, slot1, slot2, slot3)
	slot5 = slot0
	slot4 = slot0.SetShop
	slot6 = slot1

	slot4(slot5, slot6)

	slot5 = slot0
	slot4 = slot0.SetPlayer
	slot6 = slot2

	slot4(slot5, slot6)

	slot5 = slot0
	slot4 = slot0.SetItems
	slot6 = slot3

	slot4(slot5, slot6)

	slot5 = slot0
	slot4 = slot0.OnSetUp

	slot4(slot5)

	slot5 = slot0
	slot4 = slot0.SetPainting

	slot4(slot5)

	slot5 = slot0
	slot4 = slot0.Show

	slot4(slot5)
end

slot0.SetUp = slot1

function slot1(slot0)
	slot2 = slot0
	slot1 = slot0.GetPaintingName
	slot1 = slot1(slot2)
	slot2 = slot0.contextData
	slot2 = slot2.paintingView
	slot2 = slot2.name

	if slot2 ~= slot1 then
		slot2 = slot0.contextData
		slot2 = slot2.paintingView
		slot3 = slot2
		slot2 = slot2.Init
		slot4 = slot1

		slot2(slot3, slot4)

		slot3 = slot0
		slot2 = slot0.GetPaintingEnterVoice
		slot2, slot3 = slot2(slot3)
		slot4 = slot0.contextData
		slot4 = slot4.paintingView
		slot5 = slot4
		slot4 = slot4.Chat
		slot6 = slot2
		slot7 = slot3
		slot8 = true

		slot4(slot5, slot6, slot7, slot8)

		slot4 = onButton
		slot5 = slot0
		slot6 = slot0.contextData
		slot6 = slot6.paintingView
		slot6 = slot6.touch

		function slot7()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.GetPaintingTouchVoice
			slot0, slot1 = slot0(slot1)
			slot2 = slot0
			slot2 = slot2.contextData
			slot2 = slot2.paintingView
			slot3 = slot2
			slot2 = slot2.Chat
			slot4 = slot0
			slot5 = slot1
			slot6 = false

			slot2(slot3, slot4, slot5, slot6)
		end

		slot8 = SFX_PANEL

		slot4(slot5, slot6, slot7, slot8)
	end
end

slot0.SetPainting = slot1

function slot1(slot0, slot1)
	slot3 = slot0
	slot2 = slot0.SetShop
	slot4 = slot1

	slot2(slot3, slot4)

	slot2 = pg
	slot2 = slot2.MsgboxMgr
	slot3 = slot2
	slot2 = slot2.GetInstance
	slot2 = slot2(slot3)
	slot3 = slot2
	slot2 = slot2.hide

	slot2(slot3)

	slot2 = slot0.contextData
	slot2 = slot2.singleWindow
	slot3 = slot2
	slot2 = slot2.ExecuteAction
	slot4 = "Close"

	slot2(slot3, slot4)

	slot2 = slot0.contextData
	slot2 = slot2.multiWindow
	slot3 = slot2
	slot2 = slot2.ExecuteAction
	slot4 = "Close"

	slot2(slot3, slot4)

	slot3 = slot0
	slot2 = slot0.OnUpdateAll

	slot2(slot3)
end

slot0.UpdateShop = slot1

function slot1(slot0, slot1, slot2)
	slot4 = slot0
	slot3 = slot0.SetShop
	slot5 = slot1

	slot3(slot4, slot5)

	slot4 = slot1
	slot3 = slot1.GetCommodityById
	slot5 = slot2
	slot3 = slot3(slot4, slot5)
	slot5 = slot0
	slot4 = slot0.OnUpdateCommodity
	slot6 = slot3

	slot4(slot5, slot6)

	slot5 = slot0
	slot4 = slot0.GetPaintingCommodityUpdateVoice
	slot4, slot5 = slot4(slot5)
	slot6 = slot0.contextData
	slot6 = slot6.paintingView
	slot7 = slot6
	slot6 = slot6.Chat
	slot8 = slot4
	slot9 = slot5
	slot10 = true

	slot6(slot7, slot8, slot9, slot10)
end

slot0.UpdateCommodity = slot1

function slot1(slot0, slot1, slot2)
	function slot3(slot0, slot1)
		slot3 = slot0
		slot2 = slot0.canPurchase
		slot2 = slot2(slot3)

		if not slot2 then
			slot2 = pg
			slot2 = slot2.TipsMgr
			slot2 = slot2.GetInstance
			slot2 = slot2()
			slot3 = slot2
			slot2 = slot2.ShowTips
			slot4 = i18n
			slot5 = "buy_countLimit"

			slot2(slot3, slot4(slot5))

			slot2 = false

			return slot2
		end

		slot2 = getPlayerOwn
		slot4 = slot0
		slot3 = slot0.getConfig
		slot5 = "resource_category"
		slot3 = slot3(slot4, slot5)
		slot5 = slot0
		slot4 = slot0.getConfig
		slot6 = "resource_type"
		slot2, slot3 = slot2(slot3, slot4(slot5, slot6))
		slot5 = slot0
		slot4 = slot0.getConfig
		slot6 = "resource_num"
		slot4 = slot4(slot5, slot6)
		slot4 = slot4 * slot1

		if slot3 < slot4 then
			slot4 = ItemTipPanel
			slot4 = slot4.ShowItemTip
			slot6 = slot0
			slot5 = slot0.getConfig
			slot7 = "resource_category"
			slot5 = slot5(slot6, slot7)
			slot7 = slot0
			slot6 = slot0.getConfig
			slot8 = "resource_type"
			slot4 = slot4(slot5, slot6(slot7, slot8))

			if not slot4 then
				slot4 = pg
				slot4 = slot4.TipsMgr
				slot4 = slot4.GetInstance
				slot4 = slot4()
				slot5 = slot4
				slot4 = slot4.ShowTips
				slot6 = i18n
				slot7 = "common_no_x"
				slot8 = slot2

				slot4(slot5, slot6(slot7, slot8))
			end

			slot4 = false

			return slot4
		end

		slot4 = true

		return slot4
	end

	function slot4(slot0, slot1, slot2)
		slot4 = slot0
		slot3 = slot0.getConfig
		slot5 = "commodity_type"
		slot3 = slot3(slot4, slot5)

		if slot3 ~= 4 then
			slot3 = slot0
			slot3 = slot3.shop
			slot3 = slot3.type
			slot4 = ShopArgs
			slot4 = slot4.ShopActivity

			if slot3 == slot4 then
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("pt_reconfirm", slot2 or "??"),
					onYes = function ()
						if slot0(slot1, slot2) then
							slot3(slot1, slot2)
						end
					end
				})
			else
				slot3 = slot1
				slot4 = slot0
				slot5 = slot1
				slot3 = slot3(slot4, slot5)

				if slot3 then
					slot3 = slot2
					slot4 = slot0
					slot5 = slot1

					slot3(slot4, slot5)
				end
			end
		end
	end

	slot6 = slot1
	slot5 = slot1.getConfig
	slot7 = "num_limit"
	slot5 = slot5(slot6, slot7)

	if slot5 ~= 1 then
		slot6 = slot1
		slot5 = slot1.getConfig
		slot7 = "commodity_type"
		slot5 = slot5(slot6, slot7)

		if slot5 == 4 then
			slot5 = slot0.contextData
			slot5 = slot5.singleWindow
			slot6 = slot5
			slot5 = slot5.ExecuteAction
			slot7 = "Open"
			slot8 = slot1
			slot9 = slot4

			slot5(slot6, slot7, slot8, slot9)
		else
			slot5 = slot0.contextData
			slot5 = slot5.multiWindow
			slot6 = slot5
			slot5 = slot5.ExecuteAction
			slot7 = "Open"
			slot8 = slot1
			slot9 = slot4

			slot5(slot6, slot7, slot8, slot9)
		end
	end
end

slot0.OnClickCommodity = slot1

function slot1(slot0, slot1, slot2)
	slot3 = true

	return slot3
end

slot0.CanOpen = slot1

function slot1(slot0)
	slot1 = "buzhihuo_shop"

	return slot1
end

slot0.GetPaintingName = slot1

function slot1(slot0)
	slot1 = pg
	slot1 = slot1.navalacademy_shoppingstreet_template
	slot1 = slot1[1]
	slot1 = slot1.words_enter
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
	slot5 = "enter_"
	slot6 = slot3
	slot5 = slot5 .. slot6

	return slot4, slot5
end

slot0.GetPaintingEnterVoice = slot1

function slot1(slot0)
	slot1 = pg
	slot1 = slot1.navalacademy_shoppingstreet_template
	slot1 = slot1[1]
	slot1 = slot1.words_buy
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
	slot5 = "buy_"
	slot6 = slot3
	slot5 = slot5 .. slot6

	return slot4, slot5
end

slot0.GetPaintingCommodityUpdateVoice = slot1

function slot1(slot0)
	slot1 = pg
	slot1 = slot1.navalacademy_shoppingstreet_template
	slot1 = slot1[1]
	slot1 = slot1.words_touch
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
	slot5 = "touch_"
	slot6 = slot3
	slot5 = slot5 .. slot6

	return slot4, slot5
end

slot0.GetPaintingTouchVoice = slot1

function slot1(slot0, slot1)
	return
end

slot0.GetBg = slot1

function slot1(slot0)
	return
end

slot0.OnSetUp = slot1

function slot1(slot0)
	return
end

slot0.OnUpdateAll = slot1

function slot1(slot0, slot1)
	return
end

slot0.OnUpdateCommodity = slot1

function slot1(slot0)
	return
end

slot0.OnUpdatePlayer = slot1

function slot1(slot0)
	return
end

slot0.OnUpdateItems = slot1

return slot0
