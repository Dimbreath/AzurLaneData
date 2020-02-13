class("CreateGuildCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot3 = slot1:getBody().getName(slot2)

	if getProxy(PlayerProxy).getData(slot5):getTotalGem() < pg.gameset.create_guild_cost.key_value then
		pg.TipsMgr.GetInstance():ShowTips(i18n("guild_create_error_nomoney"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(60001, {
		faction = slot2:getFaction(),
		policy = slot2:getPolicy(),
		name = slot3,
		manifesto = slot2:getManifesto()
	}, 60002, function (slot0)
		if slot0.result == 0 then
			slot1 = Guild.New({
				base = slot0
			})

			slot1:setId(slot0.id)

			slot2 = getProxy(GuildProxy)
			slot3 = GuildMember.New({
				liveness = 0,
				online = 1,
				id = slot1.id,
				name = slot1.name,
				lv = slot1.level,
				adv = slot1.manifesto,
				display = {
					icon = slot1.icon,
					character = slot1.character,
					icon_theme = slot1.iconTheme,
					transform_flag = slot1.transformFlag,
					skin = slot1.skinId,
					marry_flag = slot1.proposeTime
				}
			})

			slot3:setDuty(GuildMember.DUTY_COMMANDER)
			slot1:addMember(slot3)
			slot2:addGuild(slot1)
			slot1:consume({
				gem = slot2
			})
			slot3:updatePlayer(slot1)
			slot3.updatePlayer:sendNotification(GAME.CREATE_GUILD_DONE)
			pg.TipsMgr.GetInstance():ShowTips(i18n("guild_create_sucess"))
		elseif slot0.result == 2015 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("guild_name_invaild"))
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("guild_create_error", slot0.result))
		end
	end)
end

return class("CreateGuildCommand", pm.SimpleCommand)
