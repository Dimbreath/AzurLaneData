slot0 = class("NewSkinMediator", import("..base.ContextMediator"))
slot0.SET_SKIN = "NewSkinMediator:SET_SKIN"
slot0.ON_EXIT = "NewSkinMediator:ON_EXIT"

function slot0.register(slot0)
	slot0.viewComponent:setSkin(slot0.contextData.skinId)
	slot0:bind(uv0.SET_SKIN, function (slot0, slot1, slot2)
		for slot6, slot7 in ipairs(slot1) do
			uv0:sendNotification(GAME.SET_SHIP_SKIN, {
				shipId = slot7,
				skinId = uv0.contextData.skinId
			})
		end

		getProxy(SettingsProxy):SetFlagShip(slot2)

		if slot2 then
			uv0:sendNotification(GAME.CHANGE_PLAYER_ICON, {
				skinPage = true,
				characterId = slot1[1]
			})
		end

		uv0.viewComponent:emit(BaseUI.ON_CLOSE)
	end)
	slot0.sendNotification(slot0, GAME.SET_SHIP_FLAG, {
		shipsById = getProxy(BayProxy):getData(),
		flags = slot0.contextData.flags or {}
	})
end

function slot0.listNotificationInterests(slot0)
	return {
		GAME.SET_SHIP_FLAG_DONE
	}
end

function slot0.handleNotification(slot0, slot1)
	if slot1:getName() == GAME.SET_SHIP_FLAG_DONE then
		slot0.viewComponent:setShipVOs(slot1:getBody().shipsById)
	end
end

return slot0
