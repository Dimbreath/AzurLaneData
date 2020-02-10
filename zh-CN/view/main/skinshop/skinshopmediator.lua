slot0 = class("SkinShopMediator", import("...base.ContextMediator"))
slot0.ON_SHOPPING = "SkinShopMediator:ON_SHOPPING"
slot0.GO_SHOPS_LAYER = "SkinShopMediator:GO_SHOPS_LAYER"
slot0.OPEN_SCENE = "SkinShopMediator:OPEN_SCENE"
slot0.OPEN_ACTIVITY = "SkinShopMediator:OPEN_ACTIVITY"

function slot0.register(slot0)
	slot0:bind(uv0.OPEN_ACTIVITY, function (slot0, slot1)
		uv0:sendNotification(GAME.GO_SCENE, SCENE.ACTIVITY, {
			id = slot1
		})
	end)
	slot0:bind(uv0.ON_SHOPPING, function (slot0, slot1, slot2)
		uv0:sendNotification(GAME.SHOPPING, {
			id = slot1,
			count = slot2
		})
	end)
	slot0:bind(uv0.GO_SHOPS_LAYER, function ()
		uv0:addSubLayers(Context.New({
			mediator = ShopsMediator,
			viewComponent = ShopsLayer,
			data = {
				warp = ShopsLayer.TYPE_ACTIVITY
			}
		}))
	end)
	slot0:bind(uv0.OPEN_SCENE, function (slot0, slot1)
		if slot1[1] == SCENE.SHOP then
			uv0:sendNotification(GAME.CLOSE_SHOPS)
			uv0:addSubLayers(Context.New({
				mediator = ShopsMediator,
				viewComponent = ShopsLayer,
				data = slot1[2]
			}))
		else
			uv0:sendNotification(GAME.GO_SCENE, slot1[1], slot1[2])
		end
	end)
	slot0.viewComponent:setSkins(getProxy(ShipSkinProxy):getSkinList())
	slot0.viewComponent:setPlayer(getProxy(PlayerProxy):getData())
end

function slot0.listNotificationInterests(slot0)
	return {
		GAME.SHOPPING_DONE,
		PlayerProxy.UPDATED
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.SHOPPING_DONE then
		slot0.viewComponent:setSkins(getProxy(ShipSkinProxy):getSkinList())
		slot0.viewComponent:onBuyDone(slot3.id)

		slot5 = slot0.viewComponent

		slot5:updateShipRect()

		if pg.shop_template[slot3.id] and slot5.genre == ShopArgs.SkinShop or slot5.genre == ShopArgs.SkinShopTimeLimit then
			slot0.addSubLayers(slot0, Context.New({
				mediator = NewSkinMediator,
				viewComponent = NewSkinLayer,
				data = {
					skinId = slot5.effect_args[1],
					timeLimit = slot5.genre == ShopArgs.SkinShopTimeLimit
				}
			}))
		end
	elseif slot2 == PlayerProxy.UPDATED then
		slot0.viewComponent:setPlayer(slot3)
	end
end

return slot0
