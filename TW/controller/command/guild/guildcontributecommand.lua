class("GuildContributeCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot3 = slot1:getBody().id

	if not getProxy(GuildProxy):getData() then
		return
	end

	if slot5:isContributed() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("guild_facility_contribute_count_limit"))

		return
	end

	if slot5:inJoinColdTime() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("guild_facility_new_member_limit"))

		return
	end

	if getProxy(PlayerProxy).getData(slot9)[id2res(pg.guild_contribution_template[slot3].resource_type)] < pg.guild_contribution_template[slot3].consume then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(62049, {
		project_id = slot3
	}, 62050, function (slot0)
		if slot0.result == 0 then
			slot1 = {}
			slot2 = ipairs
			slot3 = slot0.award_list or {}

			for slot5, slot6 in slot2(slot3) do
				slot0:sendNotification(GAME.ADD_ITEM, Item.New({
					type = slot6.type,
					id = slot6.id,
					count = slot6.number
				}))
				table.insert(slot1, )
			end

			slot1:markGuildContributeFlag()
			slot1.markGuildContributeFlag:updateGuild(slot1)
			slot1.markGuildContributeFlag:consume({
				[id2res(slot4)] = 
			})
			slot6:updatePlayer(slot6)
			slot0:sendNotification(GAME.GUILD_CONTRIBUTE_RES_DONE, slot2:getData())
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("sham_change_formation_error", slot0.result))
		end
	end)
end

return class("GuildContributeCommand", pm.SimpleCommand)
