slot0 = class("GuildContributeCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
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

	slot6 = pg.guild_contribution_template[slot3]

	if getProxy(PlayerProxy):getData()[id2res(slot6.resource_type)] < slot6.consume then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(62049, {
		project_id = slot3
	}, 62050, function (slot0)
		if slot0.result == 0 then
			slot1 = {}

			for slot5, slot6 in ipairs(slot0.award_list or {}) do
				slot7 = {
					type = slot6.type,
					id = slot6.id,
					count = slot6.number
				}

				uv0:sendNotification(GAME.ADD_ITEM, Item.New(slot7))
				table.insert(slot1, slot7)
			end

			uv1 = uv2:getData()

			uv1:markGuildContributeFlag()
			uv2:updateGuild(uv1)
			uv3:consume({
				[id2res(uv4)] = uv5
			})
			uv6:updatePlayer(uv3)
			uv0:sendNotification(GAME.GUILD_CONTRIBUTE_RES_DONE, slot1)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("sham_change_formation_error", slot0.result))
		end
	end)
end

return slot0
