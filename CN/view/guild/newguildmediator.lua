slot0 = class("NewGuildMediator", import("..base.ContextMediator"))
slot0.OPEN_GUILD_LIST = "NewGuildMediator:OPEN_GUILD_LIST"
slot0.CREATE = "NewGuildMediator:CREATE"

slot0.register = function (slot0)
	slot0.viewComponent:setPlayer(slot2)
	slot0:bind(slot0.OPEN_GUILD_LIST, function (slot0)
		slot0:addSubLayers(Context.New({
			viewComponent = JoinGuildLayer,
			mediator = JoinGuildMediator
		}))
	end)
	slot0:bind(slot0.CREATE, function (slot0, slot1)
		slot0:sendNotification(GAME.CREATE_GUILD, slot1)
	end)
end

slot0.listNotificationInterests = function (slot0)
	return {
		GuildProxy.NEW_GUILD_ADDED,
		PlayerProxy.UPDATED,
		GAME.CREATE_GUILD_DONE,
		GAME.REMOVE_LAYERS
	}
end

slot0.handleNotification = function (slot0, slot1)
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
