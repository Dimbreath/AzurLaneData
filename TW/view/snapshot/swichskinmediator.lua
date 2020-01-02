slot0 = class("SwichSkinMediator", import("..base.ContextMediator"))
slot0.CHANGE_SKIN = "SwichSkinMediator:CHANGE_SKIN"
slot0.BUY_ITEM = "SwichSkinMediator:BUY_ITEM"
slot0.UPDATE_SKINCONFIG = "SwichSkinMediator:UPDATE_SKINCONFIG"

function slot0.register(slot0)
	slot0.shipVO = slot0.contextData.shipVO

	if slot0.shipVO then
		slot0.viewComponent:setShip(slot0.shipVO)
		slot0.viewComponent:setSkinList(getProxy(ShipSkinProxy).getSkinList(slot1))
	end

	slot0:bind(slot0.CHANGE_SKIN, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.SET_SHIP_SKIN, {
			shipId = slot1,
			skinId = slot2
		})
	end)
	slot0:bind(slot0.BUY_ITEM, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.SHOPPING, {
			id = slot1,
			count = slot2
		})
	end)
	slot0:bind(slot0.UPDATE_SKINCONFIG, function (slot0, slot1)
		slot0:sendNotification(GAME.UPDATE_SKINCONFIG, {
			skinId = slot1
		})
	end)
end

function slot0.listNotificationInterests(slot0)
	return {
		ShipSkinProxy.SHIP_SKINS_UPDATE,
		GAME.SHOPPING_DONE,
		BayProxy.SHIP_UPDATED
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.SHOPPING_DONE then
		if slot3.awards and #slot3.awards > 0 then
			slot0.viewComponent:emit(BaseUI.ON_AWARD, {
				items = slot3.awards
			})
		end

		if pg.shop_template[slot3.id] and slot4.genre == ShopArgs.SkinShop then
			slot0:addSubLayers(Context.New({
				mediator = NewSkinMediator,
				viewComponent = NewSkinLayer,
				data = {
					skinId = slot4.effect_args[1]
				}
			}))
		end
	elseif slot2 == ShipSkinProxy.SHIP_SKINS_UPDATE then
		slot0.viewComponent:setSkinList(getProxy(ShipSkinProxy).getSkinList(slot4))
		slot0.viewComponent:openSelectSkinPanel()
	elseif slot2 == BayProxy.SHIP_UPDATED and slot3.id == slot0.shipVO.id then
		slot0.viewComponent:setShip(slot3)
		slot0.viewComponent:setSkinList(getProxy(ShipSkinProxy).getSkinList(slot4))
		slot0.viewComponent:openSelectSkinPanel()
	end
end

return slot0
