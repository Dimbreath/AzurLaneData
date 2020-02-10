slot0 = class("GuildMemberMediator", import("..base.ContextMediator"))
slot0.OPEN_DESC_INFO = "GuildMemberMediator:OPEN_DESC_INFO"
slot0.FIRE = "GuildMemberMediator:FIRE"
slot0.SET_DUTY = "GuildMemberMediator:SET_DUTY"
slot0.IMPEACH = "GuildMemberMediator:IMPEACH"

function slot0.register(slot0)
	slot0.viewComponent:setPlayerVO(getProxy(PlayerProxy):getData())
	slot0.viewComponent:setGuildVO(getProxy(GuildProxy):getData())
	slot0:bind(uv0.OPEN_DESC_INFO, function (slot0, slot1)
		slot5.type = SearchFriendCommand.SEARCH_TYPE_RESUME
		slot5.keyword = slot1.id

		uv0:sendNotification(GAME.FRIEND_SEARCH, {})
	end)
	slot0:bind(uv0.FIRE, function (slot0, slot1)
		uv0:sendNotification(GAME.GUILD_FIRE, slot1)
	end)
	slot0:bind(uv0.SET_DUTY, function (slot0, slot1, slot2)
		slot6.playerId = slot1
		slot6.dutyId = slot2

		uv0:sendNotification(GAME.SET_GUILD_DUTY, {})
	end)
	slot0:bind(uv0.IMPEACH, function (slot0, slot1)
		uv0:sendNotification(GAME.GUILD_IMPEACH, slot1)
	end)
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = GuildProxy.GUILD_UPDATED
	slot1[2] = GAME.SET_GUILD_DUTY_DONE
	slot1[3] = GAME.GUILD_FIRE_DONE
	slot1[4] = GAME.FRIEND_SEARCH_DONE

	return {}
end

function slot0.handleNotification(slot0, slot1)
	if slot1:getName() == GuildProxy.GUILD_UPDATED then
		slot0.viewComponent:setGuildVO(slot1:getBody())
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
