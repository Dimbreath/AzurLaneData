slot0 = class("SkinShopMediator", import("...base.ContextMediator"))
slot0.ON_SHOPPING = "SkinShopMediator:ON_SHOPPING"
slot0.GO_SHOPS_LAYER = "SkinShopMediator:GO_SHOPS_LAYER"
slot0.OPEN_SCENE = "SkinShopMediator:OPEN_SCENE"
slot0.OPEN_ACTIVITY = "SkinShopMediator:OPEN_ACTIVITY"

function slot0.register(slot0)
	slot0:bind(uv0.OPEN_ACTIVITY, function (slot0, slot1)
		slot6.id = slot1

		uv0:sendNotification(GAME.GO_SCENE, SCENE.ACTIVITY, {})
	end)
	slot0:bind(uv0.ON_SHOPPING, function (slot0, slot1, slot2)
		slot6.id = slot1
		slot6.count = slot2

		uv0:sendNotification(GAME.SHOPPING, {})
	end)
	slot0:bind(uv0.GO_SHOPS_LAYER, function ()
		slot3.mediator = ShopsMediator
		slot3.viewComponent = ShopsLayer
		slot4.warp = ShopsLayer.TYPE_ACTIVITY
		slot3.data = {}

		uv0:addSubLayers(Context.New({}))
	end)
	slot0:bind(uv0.OPEN_SCENE, function (slot0, slot1)
		if slot1[1] == SCENE.SHOP then
			uv0:sendNotification(GAME.CLOSE_SHOPS)

			slot5.mediator = ShopsMediator
			slot5.viewComponent = ShopsLayer
			slot5.data = slot1[2]

			uv0:addSubLayers(Context.New({}))
		else
			uv0:sendNotification(GAME.GO_SCENE, slot1[1], slot1[2])
		end
	end)
	slot0.viewComponent:setSkins(getProxy(ShipSkinProxy):getSkinList())
	slot0.viewComponent:setPlayer(getProxy(PlayerProxy):getData())
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = GAME.SHOPPING_DONE
	slot1[2] = PlayerProxy.UPDATED

	return {}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.SHOPPING_DONE then
		slot0.viewComponent:setSkins(getProxy(ShipSkinProxy):getSkinList())
		slot0.viewComponent:onBuyDone(slot3.id)

		slot5 = slot0.viewComponent

		slot5:updateShipRect()

		if pg.shop_template[slot3.id] and slot5.genre == ShopArgs.SkinShop or slot5.genre == ShopArgs.SkinShopTimeLimit then
			slot9.mediator = NewSkinMediator
			slot9.viewComponent = NewSkinLayer
			slot10.skinId = slot5.effect_args[1]
			slot10.timeLimit = slot5.genre == ShopArgs.SkinShopTimeLimit
			slot9.data = {}

			slot0.addSubLayers(slot0, Context.New({}))
		end
	elseif slot2 == PlayerProxy.UPDATED then
		slot0.viewComponent:setPlayer(slot3)
	end
end

return slot0
