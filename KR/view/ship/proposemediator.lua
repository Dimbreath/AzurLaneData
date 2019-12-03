slot0 = class("ProposeMediator", import("..base.ContextMediator"))
slot0.ON_PROPOSE = "ProposeMediator:ON_PROPOSE"
slot0.RENAME_SHIP = "ShipMainMediator:RENAME_SHIP"

function slot0.register(slot0)
	slot1 = getProxy(BayProxy)

	if slot0.contextData.shipId then
		slot0.viewComponent:setShip(slot1:getShipById(slot0.contextData.shipId))
	elseif slot0.contextData.review then
		slot0.viewComponent:setShipGroupID(slot0.contextData.group.id)
		slot0.viewComponent:setWeddingReviewSkinID(slot0.contextData.skinID)
	end

	slot0.viewComponent:setBagProxy(slot2)
	slot0.viewComponent:setPlayer(slot3)
	slot0:bind(slot0.ON_PROPOSE, function (slot0, slot1)
		slot0:sendNotification(GAME.PROPOSE_SHIP, {
			shipId = slot1
		})
	end)
	slot0:bind(slot0.RENAME_SHIP, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.RENAME_SHIP, {
			shipId = slot1,
			name = slot2
		})
	end)
end

function slot0.listNotificationInterests(slot0)
	return {
		GAME.PROPOSE_SHIP_DONE,
		GAME.RENAME_SHIP_DONE
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.PROPOSE_SHIP_DONE then
		if slot3.ship:getProposeSkin() then
			slot0:sendNotification(GAME.SET_SHIP_SKIN, {
				hideTip = true,
				shipId = slot3.ship.id,
				skinId = slot4.id
			})
		end

		slot0.viewComponent:setShip(slot3.ship)
		slot0.viewComponent:RingFadeout(function ()
			slot0.viewComponent:displayShipWord("propose")
		end)
	elseif slot2 == GAME.RENAME_SHIP_DONE then
		slot0.viewComponent:close()
	end
end

return slot0
