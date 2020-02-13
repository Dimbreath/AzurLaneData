class("GetGuildMemberRankCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()
	slot3 = getProxy(GuildProxy)
	slot4 = slot3:getGuildEvent()

	if not slot3:getData() or not slot4 or slot4:isEnd() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(60036, {
		guild_id = slot5.id
	}, 60037, function (slot0)
		slot1 = {}
		slot3 = getProxy(GuildProxy).getData(slot2)

		for slot7, slot8 in ipairs(slot0.rank_list) do
			if slot3:getMemberById(slot8.id) then
				slot9:setDamage(slot8.damage)
				table.insert(slot1, slot9)
			end
		end

		slot0:setMemberRankList(slot1)
		slot0:setMemberRank(slot0.rank)
		slot2:updateGuildEvent(slot0)
		slot1:sendNotification(GAME.GET_GUILD_MEMBER_RANK_DONE)
	end)
end

return class("GetGuildMemberRankCommand", pm.SimpleCommand)
