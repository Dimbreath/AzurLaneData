slot0 = class("ShopsMediator", import("..base.ContextMediator"))
slot0.REFRESH_MILITARY_SHOP = "ShopsMediator:REFRESH_MILITARY_SHOP"
slot0.BUY_ITEM = "ShopsMediator:BUY_ITEM"
slot0.GET_MILITARY_SHOP = "ShopsMediator:GET_MILITARY_SHOP"
slot0.GET_SHOP_STREEET = "ShopsMediator:GET_SHOP_STREEET"
slot0.REFRESH_SHOP_STREET = "ShopsMediator:REFRESH_SHOP_STREET"
slot0.GO_MALL = "ShopsMediator:GO_MALL"
slot0.OPEN = "ShopsMediator:OPEN"
slot0.GET_ACTIVITY_SHOP = "ShopsMediator:GET_ACTIVITY_SHOP"
slot0.ACTIVITY_OPERATION = "ShopsMediator:ACTIVITY_OPERATION"
slot0.GET_GUILD_SHOP = "ShopsMediator:GET_GUILD_SHOP"
slot0.BUY_SHAM_ITEM = "ShopsMediator:BUY_SHAM_ITEM"
slot0.BUY_ESCORT_ITEM = "ShopsMediator:BUY_ESCORT_ITEM"
slot0.ON_SKIN_SHOP = "ChargeMediator:ON_SKIN_SHOP"
slot0.SELL_BLUEPRINT = "Sell Blueprints"
slot0.BUY_FRAG_ITEM = "BUY_FRAG_ITEM"

function slot0.register(slot0)
	slot0:bind(uv0.ON_SKIN_SHOP, function (slot0, slot1)
		if getProxy(ContextProxy):getCurrentContext() and slot3.scene == SCENE.NAVALACADEMYSCENE then
			-- Nothing
		elseif slot3 and slot3.scene == SCENE.CHARGE then
			uv0.viewComponent:closeView()
		end

		uv0:sendNotification(GAME.GO_SCENE, SCENE.SKINSHOP)
	end)
	slot0:bind(uv0.GET_GUILD_SHOP, function ()
		uv0:sendNotification(GAME.GET_GUILD_SHOP, {
			type = 0
		})
	end)
	slot0:bind(uv0.GET_MILITARY_SHOP, function (slot0)
		uv0:sendNotification(GAME.GET_MILITARY_SHOP)
	end)
	slot0:bind(uv0.REFRESH_MILITARY_SHOP, function (slot0)
		uv0:sendNotification(GAME.REFRESH_MILITARY_SHOP)
	end)
	slot0:bind(uv0.GET_SHOP_STREEET, function (slot0)
		uv0:sendNotification(GAME.GET_SHOPSTREET)
	end)
	slot0:bind(uv0.REFRESH_SHOP_STREET, function (slot0, slot1)
		slot5.id = slot1

		uv0:sendNotification(GAME.SHOPPING, {
			count = 1
		})
	end)
	slot0:bind(uv0.BUY_ITEM, function (slot0, slot1, slot2)
		slot6.id = slot1
		slot6.count = slot2

		uv0:sendNotification(GAME.SHOPPING, {})
	end)
	slot0:bind(uv0.GO_MALL, function (slot0, slot1)
		gotoChargeScene(slot1)
	end)
	slot0:bind(uv0.ACTIVITY_OPERATION, function (slot0, slot1, slot2, slot3, slot4)
		slot8.activity_id = slot1
		slot8.cmd = slot2
		slot8.arg1 = slot3
		slot8.arg2 = slot4

		uv0:sendNotification(GAME.ACTIVITY_OPERATION, {})
	end)
	slot0:bind(uv0.BUY_SHAM_ITEM, function (slot0, slot1, slot2)
		slot6.id = slot1
		slot6.count = slot2

		uv0:sendNotification(GAME.SHAM_SHOPPING, {})
	end)
	slot0:bind(uv0.BUY_FRAG_ITEM, function (slot0, slot1, slot2)
		slot6.id = slot1
		slot6.count = slot2

		uv0:sendNotification(GAME.FRAG_SHOPPING, {})
	end)
	slot0:bind(uv0.BUY_ESCORT_ITEM, function (slot0, slot1, slot2)
		slot6.id = slot1
		slot6.count = slot2

		uv0:sendNotification(GAME.ESCORT_SHOPPING, {})
	end)
	slot0:bind(uv0.SELL_BLUEPRINT, function (slot0, slot1)
		uv0:sendNotification(GAME.FRAG_SELL, slot1)
	end)
	slot0.viewComponent:updatePlayer(getProxy(PlayerProxy):getData())

	slot3 = getProxy(ShopsProxy)
	slot4 = slot3:getMeritorousShop()

	if not slot3:getActivityShops() or #slot5 == 0 then
		slot0:sendNotification(GAME.GET_ACTIVITY_SHOP)
	else
		slot0.viewComponent:setActivityShops(slot5)
	end

	if slot4 then
		slot0.viewComponent:setMilitaryShop(slot4)
	else
		slot0:sendNotification(GAME.GET_MILITARY_SHOP)
	end

	if not slot3:getShopStreet() then
		slot0:sendNotification(GAME.GET_SHOPSTREET)
	else
		slot0.viewComponent:setShopStreet(slot6)
		slot0.viewComponent:updateShopStreet(slot6)
	end

	if slot3:getGuildShop() then
		slot0.viewComponent:setGuildShop(slot7)
	end

	slot0.contextData.shopDatas = slot0.contextData.shopDatas or {}

	slot0.viewComponent:setShamShop(slot3:getShamShop())
	slot0.viewComponent:setEscortShop(getProxy(ChapterProxy):getEscortShop())

	slot0.contextData.shopDatas.fragshop = slot3:getFragmentShop()

	slot0:sendNotification(slot0.OPEN)
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = GAME.SHOPPING_DONE
	slot1[2] = PlayerProxy.UPDATED
	slot1[3] = BagProxy.ITEM_ADDED
	slot1[4] = BagProxy.ITEM_UPDATED
	slot1[5] = GAME.GET_MILITARY_SHOP_DONE
	slot1[6] = GAME.REFRESH_MILITARY_SHOP_DONE
	slot1[7] = ShopsProxy.SHOPPINGSTREET_UPDATE
	slot1[8] = PlayerResource.GO_MALL
	slot1[9] = ShopsProxy.ACTIVITY_SHOP_UPDATED
	slot1[10] = ActivityProxy.ACTIVITY_SHOP_SHOW_AWARDS
	slot1[11] = ShopsProxy.GUILD_SHOP_ADDED
	slot1[12] = ShopsProxy.GUILD_SHOP_UPDATED
	slot1[13] = GAME.USE_ITEM_DONE
	slot1[14] = GAME.ESCORT_SHOPPING_DONE
	slot1[15] = ShopsProxy.ACTIVITY_SHOPS_UPDATED
	slot1[16] = ShopsProxy.SHAM_SHOP_UPDATED
	slot1[17] = GAME.SHAM_SHOPPING_DONE
	slot1[18] = ShopsProxy.FRAGMENT_SHOP_UPDATED
	slot1[19] = GAME.FRAG_SHOPPING_DONE
	slot1[20] = GAME.FRAG_SELL_DONE
	slot1[21] = PlayerProxy.RESOURCE_UPDATED

	return {}
end

function slot0.handleNotification(slot0, slot1)
	if slot1:getName() == GAME.REFRESH_MILITARY_SHOP_DONE then
		pg.TipsMgr.GetInstance():ShowTips(i18n("refresh_shopStreet_ok"))
		slot0.viewComponent:setMilitaryShop(slot1:getBody())
	elseif slot2 == GAME.SHOPPING_DONE then
		slot4 = getProxy(ShopsProxy)

		if getProxy(ContextProxy):getCurrentContext().mediator.__cname ~= ChargeMediator.__cname and slot3.awards and #slot3.awards > 0 then
			slot10.items = slot3.awards

			slot0.viewComponent:emit(BaseUI.ON_AWARD, {})
		end

		slot7 = nil

		if slot3.shopType == ShopArgs.ShopStreet then
			slot7 = slot4:getShopStreet():getGoodsById(slot3.id)

			slot0.viewComponent.shopStreetTFs[slot7.id]:update(slot7)
			slot0.viewComponent:showRandomShipWord(pg.navalacademy_shoppingstreet_template[1].words_buy, true, "buy")
		elseif slot3.shopType == ShopArgs.MilitaryShop then
			slot7 = slot4:getMeritorousShop().goods[slot3.id]

			slot0.viewComponent.milGoodsTFs[slot7.id]:update(slot7)
		end

		if slot7 and slot7:getConfig("type") == DROP_TYPE_SHIP then
			slot13.mediator = NewShipMediator
			slot13.viewComponent = NewShipLayer
			slot14.ship = getProxy(BayProxy):getNewShip(true)[1]
			slot13.data = {}

			slot0:addSubLayers(Context.New({}))
		end

		if slot7 and slot7:getConfig("commodity_type") == DROP_TYPE_SKIN then
			slot11.mediator = NewSkinMediator
			slot11.viewComponent = NewSkinLayer
			slot12.skinId = slot7:getConfig("commodity_id")
			slot11.data = {}

			slot0:addSubLayers(Context.New({}))
		end
	elseif slot2 == PlayerProxy.UPDATED then
		slot0.viewComponent:updatePlayer(slot3)
	elseif slot2 == BagProxy.ITEM_ADDED or slot2 == BagProxy.ITEM_UPDATED then
		if slot3.id == ChapterConst.ShamMoneyItem then
			slot0.viewComponent:updateShamRes()
		end
	elseif slot2 == PlayerProxy.RESOURCE_UPDATED then
		if slot3.id == PlayerConst.ResBlueprintFragment then
			slot0.viewComponent:updateFragRes()
		end
	elseif slot2 == GAME.GET_MILITARY_SHOP_DONE then
		slot0.viewComponent:setMilitaryShop(slot3)
		slot0.viewComponent:closeMsgBox()
	elseif slot2 == ShopsProxy.SHOPPINGSTREET_UPDATE then
		slot0.viewComponent:setShopStreet(slot3.shopStreet)

		if slot3.reset then
			slot0.viewComponent:updateShopStreet(slot3.shopStreet)
			slot0.viewComponent:closeMsgBox()
		end
	elseif slot2 == PlayerResource.GO_MALL then
		slot0.viewComponent:emit(slot0.viewComponent.ON_CLOSE)
	elseif slot2 == ShopsProxy.ACTIVITY_SHOPS_UPDATED then
		slot0.viewComponent:setActivityShops(getProxy(ShopsProxy):getActivityShops())
	elseif slot2 == ShopsProxy.ACTIVITY_SHOP_UPDATED then
		slot0.viewComponent:updateActivityShop(slot3.activityId, slot3.shop)
	elseif slot2 == ActivityProxy.ACTIVITY_SHOP_SHOW_AWARDS then
		if slot2 == ActivityProxy.ACTIVITY_SHOP_SHOW_AWARDS then
			slot0.viewComponent:OnActivtyShopPurchaseDone(slot3.activityId)
		end

		slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3.awards, slot3.callback)
	elseif slot2 == ShopsProxy.GUILD_SHOP_ADDED then
		slot0.viewComponent:setGuildShop(slot3)
		slot0.viewComponent:initGuildShop()
	elseif slot2 == ShopsProxy.GUILD_SHOP_UPDATED then
		slot0.viewComponent:setGuildShop(slot3.shop)

		if slot3.reset then
			slot0.viewComponent:resetGuildCards()
			slot0.viewComponent:closeMsgBox()
		else
			slot0.viewComponent:updateGuildCard()
		end
	elseif slot2 == ShopsProxy.SHAM_SHOP_UPDATED then
		slot0.viewComponent:setShamShop(slot3)
		slot0.viewComponent:updateShamShop()
	elseif slot2 == GAME.USE_ITEM_DONE then
		if getProxy(ContextProxy):getCurrentContext().mediator.__cname ~= ChargeMediator.__cname and table.getCount(slot3) ~= 0 then
			slot9.items = slot3

			slot0.viewComponent:emit(BaseUI.ON_AWARD, {})
		end
	elseif slot2 == GAME.ESCORT_SHOPPING_DONE then
		slot0.viewComponent:setEscortShop(getProxy(ChapterProxy):getEscortShop())
		slot0.viewComponent:updateEscortShop()
		slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3.awards, slot3.callback)
	elseif slot2 == GAME.SHAM_SHOPPING_DONE or slot2 == GAME.FRAG_SHOPPING_DONE then
		slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3.awards)
	elseif slot2 == ShopsProxy.FRAGMENT_SHOP_UPDATED then
		slot0.contextData.shopDatas.fragshop = slot3

		slot0.viewComponent:updateBlueprintFragShop()
	elseif slot2 == GAME.FRAG_SELL_DONE then
		slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3.awards)

		if slot0.viewComponent.resolvePanel then
			slot0.viewComponent.resolvePanel.buffer:Reset()
			slot0.viewComponent.resolvePanel.buffer:Trigger("control")
		end
	end
end

return slot0
