class("GetGuildRankCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()

	if not getProxy(GuildProxy):getGuildEvent() or slot4:isEnd() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(60038, {
		type = 0
	}, 60039, function (slot0)
		slot1 = {}

		for slot5, slot6 in ipairs(slot0.rank_list) do
			table.insert(slot1, Guild.New({
				base = slot6
			}))
		end

		slot0:setRankList(slot1)
		slot0:setRank(slot0.rank)
		slot1:updateGuildEvent(slot0)
		slot1.updateGuildEvent:sendNotification(GAME.GET_GUILD_RANK_DONE)
	end)
end

return class("GetGuildRankCommand", pm.SimpleCommand)
