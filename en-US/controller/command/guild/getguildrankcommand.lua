slot0 = class("GetGuildRankCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
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

		uv0:setRankList(slot1)
		uv0:setRank(slot0.rank)
		uv1:updateGuildEvent(uv0)
		uv2:sendNotification(GAME.GET_GUILD_RANK_DONE)
	end)
end

return slot0
