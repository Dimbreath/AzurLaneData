slot0 = class("GetGuildRankCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	if getProxy(GuildProxy):getRawData().memberCount < 1 then
		slot4:SetRank(slot1:getBody().id, {})
	else
		pg.ConnectionMgr.GetInstance():Send(62029, {
			type = slot3
		}, 62030, function (slot0)
			for slot4, slot5 in ipairs(slot0.list) do
				for slot9, slot10 in ipairs(slot5.rankuserinfo) do
					if not uv0[slot10.user_id] then
						slot11 = GuildRank.New(slot10.user_id)

						slot11:SetName(uv1:getMemberById(slot10.user_id).name)

						uv0[slot11.id] = slot11
					end

					slot11:SetScore(slot5.period, slot10.count)
				end
			end

			uv2:SetRank(uv3, uv0)
			uv4:sendNotification(GAME.GUILD_GET_RANK_DONE, {
				id = uv3,
				list = uv0
			})
		end)
	end
end

return slot0
