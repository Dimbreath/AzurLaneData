slot0 = class("GuildRankMediator", import("..base.ContextMediator"))
slot0.GET_RANK = "GuildRankMediator:GET_RANK"

slot0.register = function (slot0)
	slot1 = getProxy(GuildProxy)

	slot0.viewComponent:setGuildEvet(slot2)
	slot0.viewComponent:setSelfGuild(slot3)
	slot0:bind(slot0.GET_RANK, function ()
		slot0:sendNotification(GAME.GET_GUILD_RANK)
	end)
end

slot0.listNotificationInterests = function (slot0)
	return {
		GuildProxy.UPDATED_EVENT
	}
end

slot0.handleNotification = function (slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GuildProxy.UPDATED_EVENT then
		slot0.viewComponent:setGuildEvet(slot3)

		if slot3:getRankList() and table.getCount(slot4) > 0 then
			slot0.viewComponent:disPlayerRank()
		end
	end
end

return slot0
