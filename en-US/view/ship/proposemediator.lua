slot0 = class("ProposeMediator", import("..base.ContextMediator"))
slot0.ON_PROPOSE = "ProposeMediator:ON_PROPOSE"
slot0.RENAME_SHIP = "ShipMainMediator:RENAME_SHIP"

function slot0.register(slot0)
	if slot0.contextData.shipId then
		slot0.viewComponent:setShip(getProxy(BayProxy):getShipById(slot0.contextData.shipId))
	elseif slot0.contextData.review then
		slot0.viewComponent:setShipGroupID(slot0.contextData.group.id)
		slot0.viewComponent:setWeddingReviewSkinID(slot0.contextData.skinID)
	end

	slot0.viewComponent:setBagProxy(getProxy(BagProxy))
	slot0.viewComponent:setPlayer(getProxy(PlayerProxy):getData())
	slot0:bind(uv0.ON_PROPOSE, function (slot0, slot1)
		slot5.shipId = slot1

		uv0:sendNotification(GAME.PROPOSE_SHIP, {})
	end)
	slot0:bind(uv0.RENAME_SHIP, function (slot0, slot1, slot2)
		slot6.shipId = slot1
		slot6.name = slot2

		uv0:sendNotification(GAME.RENAME_SHIP, {})
	end)
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = GAME.PROPOSE_SHIP_DONE
	slot1[2] = GAME.RENAME_SHIP_DONE

	return {}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.PROPOSE_SHIP_DONE then
		slot4 = slot3.ship

		if slot4:getProposeSkin() then
			slot8.shipId = slot3.ship.id
			slot8.skinId = slot4.id

			slot0:sendNotification(GAME.SET_SHIP_SKIN, {
				hideTip = true
			})
		end

		slot0.viewComponent:setShip(slot3.ship)
		slot0.viewComponent:RingFadeout(function ()
			uv0.viewComponent:displayShipWord("propose")
		end)
	elseif slot2 == GAME.RENAME_SHIP_DONE then
		slot0.viewComponent:close()
	end
end

return slot0
