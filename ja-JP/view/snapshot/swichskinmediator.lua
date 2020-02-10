slot0 = class("SwichSkinMediator", import("..base.ContextMediator"))
slot0.CHANGE_SKIN = "SwichSkinMediator:CHANGE_SKIN"
slot0.BUY_ITEM = "SwichSkinMediator:BUY_ITEM"
slot0.UPDATE_SKINCONFIG = "SwichSkinMediator:UPDATE_SKINCONFIG"

function slot0.register(slot0)
	slot0.shipVO = slot0.contextData.shipVO

	if slot0.shipVO then
		slot0.viewComponent:setShip(slot0.shipVO)
		slot0.viewComponent:setSkinList(getProxy(ShipSkinProxy):getSkinList())
	end

	slot0:bind(uv0.CHANGE_SKIN, function (slot0, slot1, slot2)
		slot6.shipId = slot1
		slot6.skinId = slot2

		uv0:sendNotification(GAME.SET_SHIP_SKIN, {})
	end)
	slot0:bind(uv0.BUY_ITEM, function (slot0, slot1, slot2)
		slot6.id = slot1
		slot6.count = slot2

		uv0:sendNotification(GAME.SHOPPING, {})
	end)
	slot0:bind(uv0.UPDATE_SKINCONFIG, function (slot0, slot1)
		slot5.skinId = slot1

		uv0:sendNotification(GAME.UPDATE_SKINCONFIG, {})
	end)
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = ShipSkinProxy.SHIP_SKINS_UPDATE
	slot1[2] = GAME.SHOPPING_DONE
	slot1[3] = BayProxy.SHIP_UPDATED

	return {}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.SHOPPING_DONE then
		if slot3.awards and #slot3.awards > 0 then
			slot7.items = slot3.awards

			slot0.viewComponent:emit(BaseUI.ON_AWARD, {})
		end

		if pg.shop_template[slot3.id] and slot4.genre == ShopArgs.SkinShop then
			slot8.mediator = NewSkinMediator
			slot8.viewComponent = NewSkinLayer
			slot9.skinId = slot4.effect_args[1]
			slot8.data = {}

			slot0:addSubLayers(Context.New({}))
		end
	elseif slot2 == ShipSkinProxy.SHIP_SKINS_UPDATE then
		slot0.viewComponent:setSkinList(getProxy(ShipSkinProxy):getSkinList())
		slot0.viewComponent:openSelectSkinPanel()
	elseif slot2 == BayProxy.SHIP_UPDATED and slot3.id == slot0.shipVO.id then
		slot0.viewComponent:setShip(slot3)
		slot0.viewComponent:setSkinList(getProxy(ShipSkinProxy):getSkinList())
		slot0.viewComponent:openSelectSkinPanel()
	end
end

return slot0
