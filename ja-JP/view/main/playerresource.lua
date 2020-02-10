slot0 = class("PlayerResource", import("..base.BaseUI"))
slot1 = 12
slot0.GO_MALL = "PlayerResource:GO_MALL"

function slot0.Ctor(slot0)
	uv0.super.Ctor(slot0)
	PoolMgr.GetInstance():GetUI("ResPanel", false, function (slot0)
		slot0.transform:SetParent(pg.UIMgr.GetInstance().UIMain.transform, false)
		uv0:onUILoaded(slot0)
	end)
end

function slot0.init(slot0)
	slot0.oilAddBtn = slot0:findTF("oil")
	slot0.goldAddBtn = slot0:findTF("gold")
	slot0.gemAddBtn = slot0:findTF("gem")
	slot0.goldMax = slot0:findTF("gold/gold_max_value")
	slot0.goldValue = slot0:findTF("gold/gold_value")
	slot0.oilMax = slot0:findTF("oil/oil_max_value")
	slot0.oilValue = slot0:findTF("oil/oil_value")
	slot0.gemValue = slot0:findTF("gem/gem_value")
	slot1 = pg.shop_template

	onButton(slot0, slot0.goldAddBtn, function ()
		if not pg.goldExchangeMgr then
			pg.goldExchangeMgr = GoldExchangeView.New()
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.oilAddBtn, function ()
		if not ShoppingStreet.getRiseShopId(ShopArgs.BuyOil, uv0.player.buyOilCount) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_today_buy_limit"))

			return
		end

		slot1 = pg.shop_template[slot0]
		slot2 = slot1.num

		if slot1.num == -1 and slot1.genre == ShopArgs.BuyOil then
			slot2 = ShopArgs.getOilByLevel(uv0.player.level)
		end

		if uv0.player.buyOilCount < pg.gameset.buy_oil_limit.key_value then
			slot6.type = MSGBOX_TYPE_SINGLE_ITEM
			slot6.windowSize = {
				y = 570
			}
			slot6.content = i18n("oil_buy_tip", slot1.resource_num, slot2, uv0.player.buyOilCount)
			slot7.type = DROP_TYPE_RESOURCE
			slot7.count = slot2
			slot6.drop = {
				id = 2
			}

			function slot6.onYes()
				slot3.id = uv0

				pg.m02:sendNotification(GAME.SHOPPING, {
					count = 1
				})
			end

			slot6.weight = LayerWeightConst.TOP_LAYER

			pg.MsgboxMgr.GetInstance():ShowMsgBox({})
		else
			slot6.type = MSGBOX_TYPE_HELP
			slot6.helps = i18n("help_oil_buy_limit")
			slot8.sound = SFX_CANCEL
			slot7[1] = {
				text = "text_iknow"
			}
			slot6.custom = {}

			pg.MsgboxMgr.GetInstance():ShowMsgBox({})
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.gemAddBtn, function ()
		if PLATFORM_CODE == PLATFORM_JP then
			slot3.content = i18n("word_diamond_tip", uv1.player:getFreeGem(), uv1.player:getChargeGem(), uv1.player:getTotalGem())

			function slot3.onYes()
				if not pg.m02:hasMediator(ChargeMediator.__cname) then
					slot4.wrap = ChargeScene.TYPE_DIAMOND

					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.CHARGE, {})
				else
					pg.m02:sendNotification(uv0.GO_MALL)
				end
			end

			slot3.alignment = TextAnchor.UpperLeft
			slot3.weight = LayerWeightConst.TOP_LAYER

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				fontSize = 32,
				yesText = "text_buy"
			})
		else
			slot0()
		end
	end, SFX_PANEL)
end

function slot0.setParent(slot0, slot1, slot2)
	setParent(slot0._go, slot1, slot2)
end

function slot0.setResources(slot0, slot1, slot2)
	slot0.player = slot1
	slot3 = slot1.level

	setText(slot0.goldMax, "MAX: " .. pg.user_level[slot3].max_gold)
	setText(slot0.goldValue, slot1.gold)
	setText(slot0.oilMax, "MAX: " .. pg.user_level[slot3].max_oil)
	setText(slot0.oilValue, slot1.oil)
	setText(slot0.gemValue, slot1:getTotalGem())

	slot2 = slot2 or {
		true,
		true,
		true
	}

	setActive(slot0.oilAddBtn, slot2[1])
	setActive(slot0.goldAddBtn, slot2[2])
	setActive(slot0.gemAddBtn, slot2[3])
end

function slot0.willExit(slot0)
	if pg.goldExchangeMgr then
		pg.goldExchangeMgr:exit()

		pg.goldExchangeMgr = nil
	end

	PoolMgr.GetInstance():ReturnUI("ResPanel", slot0._go)
end

return slot0
