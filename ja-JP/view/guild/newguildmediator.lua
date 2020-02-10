slot0 = class("NewGuildMediator", import("..base.ContextMediator"))
slot0.OPEN_GUILD_LIST = "NewGuildMediator:OPEN_GUILD_LIST"
slot0.CREATE = "NewGuildMediator:CREATE"

function slot0.register(slot0)
	slot0.viewComponent:setPlayer(getProxy(PlayerProxy):getData())
	slot0:bind(uv0.OPEN_GUILD_LIST, function (slot0)
		slot4.viewComponent = JoinGuildLayer
		slot4.mediator = JoinGuildMediator

		uv0:addSubLayers(Context.New({}))
	end)
	slot0:bind(uv0.CREATE, function (slot0, slot1)
		uv0:sendNotification(GAME.CREATE_GUILD, slot1)
	end)
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = GuildProxy.NEW_GUILD_ADDED
	slot1[2] = PlayerProxy.UPDATED
	slot1[3] = GAME.CREATE_GUILD_DONE
	slot1[4] = GAME.REMOVE_LAYERS

	return {}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GuildProxy.NEW_GUILD_ADDED then
		slot0.viewComponent:emit(BaseUI.ON_BACK)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.GUILD)
	elseif slot2 == PlayerProxy.UPDATED then
		slot0.viewComponent:setPlayer(slot3)
	elseif slot2 == GAME.CREATE_GUILD_DONE then
		slot0.viewComponent:closeInfoPanel()
	elseif slot2 == GAME.REMOVE_LAYERS and slot3.context.mediator == JoinGuildMediator then
		slot0.viewComponent:startCreate()
	end
end

return slot0
