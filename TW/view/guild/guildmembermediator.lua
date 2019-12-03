slot0 = class("GuildMemberMediator", import("..base.ContextMediator"))
slot0.OPEN_DESC_INFO = "GuildMemberMediator:OPEN_DESC_INFO"
slot0.FIRE = "GuildMemberMediator:FIRE"
slot0.SET_DUTY = "GuildMemberMediator:SET_DUTY"
slot0.IMPEACH = "GuildMemberMediator:IMPEACH"

function slot0.register(slot0)
	slot0.viewComponent:setPlayerVO(slot2)
	slot0.viewComponent:setGuildVO(getProxy(GuildProxy).getData(slot3))
	slot0:bind(slot0.OPEN_DESC_INFO, function (slot0, slot1)
		slot0:sendNotification(GAME.FRIEND_SEARCH, {
			type = SearchFriendCommand.SEARCH_TYPE_RESUME,
			keyword = slot1.id
		})
	end)
	slot0:bind(slot0.FIRE, function (slot0, slot1)
		slot0:sendNotification(GAME.GUILD_FIRE, slot1)
	end)
	slot0:bind(slot0.SET_DUTY, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.SET_GUILD_DUTY, {
			playerId = slot1,
			dutyId = slot2
		})
	end)
	slot0:bind(slot0.IMPEACH, function (slot0, slot1)
		slot0:sendNotification(GAME.GUILD_IMPEACH, slot1)
	end)
end

function slot0.listNotificationInterests(slot0)
	return {
		GuildProxy.GUILD_UPDATED,
		GAME.SET_GUILD_DUTY_DONE,
		GAME.GUILD_FIRE_DONE,
		GAME.FRIEND_SEARCH_DONE
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GuildProxy.GUILD_UPDATED then
		slot0.viewComponent:setGuildVO(slot3)
		slot0.viewComponent:sortMembers()
	elseif slot2 == GAME.SET_GUILD_DUTY_DONE then
		slot0.viewComponent:closeAppointPanel()
		slot0.viewComponent:closeButtons()
		slot0.viewComponent:loadPainting(slot3)
	elseif slot2 == GAME.GUILD_FIRE_DONE then
		slot0.viewComponent:reloadPainting()
	elseif slot2 == GAME.FRIEND_SEARCH_DONE then
		slot0.viewComponent:showInfoPanel(slot3.list[1])
	end
end

return slot0
