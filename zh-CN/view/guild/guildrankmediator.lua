slot0 = class("GuildRankMediator", import("..base.ContextMediator"))
slot0.GET_RANK = "GuildRankMediator:GET_RANK"

function slot0.register(slot0)
	slot1 = getProxy(GuildProxy)

	slot0.viewComponent:setGuildEvet(slot1:getGuildEvent())
	slot0.viewComponent:setSelfGuild(slot1:getData())
	slot0:bind(uv0.GET_RANK, function ()
		uv0:sendNotification(GAME.GET_GUILD_RANK)
	end)
end

function slot0.listNotificationInterests(slot0)
	return {
		GuildProxy.UPDATED_EVENT
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GuildProxy.UPDATED_EVENT then
		slot0.viewComponent:setGuildEvet(slot3)

		if slot3:getRankList() and table.getCount(slot4) > 0 then
			slot0.viewComponent:disPlayerRank()
		end
	end
end

return slot0
