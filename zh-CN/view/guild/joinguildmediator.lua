slot0 = class("JoinGuildMediator", import("..base.ContextMediator"))
slot0.APPLY = "JoinGuildMediator:APPLY"
slot0.REFRESH = "JoinGuildMediator:REFRESH"
slot0.SEARCH = "JoinGuildMediator:SEARCH"

function slot0.register(slot0)
	slot0:sendNotification(GAME.GUILD_LIST_REFRESH)
	slot0.viewComponent:setPlayerVO(slot2)
	slot0:bind(slot0.APPLY, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.GUILD_APPLY, {
			id = slot1,
			content = slot2
		})
	end)
	slot0:bind(slot0.REFRESH, function (slot0)
		slot0:sendNotification(GAME.GUILD_LIST_REFRESH)
	end)
	slot0:bind(slot0.SEARCH, function (slot0, slot1)
		slot0:sendNotification(GAME.GUILD_SEARCH, slot1)
	end)
end

function slot0.listNotificationInterests(slot0)
	return {
		GAME.GUILD_LIST_REFRESH_DONE,
		GAME.GUILD_SEARCH_DONE,
		GAME.GUILD_APPLY_DONE,
		GAME.REMOVE_LAYERS
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.GUILD_LIST_REFRESH_DONE or slot2 == GAME.GUILD_SEARCH_DONE then
		slot0.viewComponent:setGuildVOs(slot3)

		if slot0.contextData.filterData then
			slot0.viewComponent:filter()
		else
			slot0.viewComponent:sortGuilds()
		end
	elseif slot2 == GAME.GUILD_APPLY_DONE then
		slot0.viewComponent:closeApply()
	end
end

return slot0
