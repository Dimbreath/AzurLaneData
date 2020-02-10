slot0 = class("CreateGuildCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot3 = slot1:getBody():getName()

	if getProxy(PlayerProxy):getData():getTotalGem() < pg.gameset.create_guild_cost.key_value then
		pg.TipsMgr.GetInstance():ShowTips(i18n("guild_create_error_nomoney"))

		return
	end

	slot10.faction = slot2:getFaction()
	slot10.policy = slot2:getPolicy()
	slot10.name = slot3
	slot10.manifesto = slot2:getManifesto()

	pg.ConnectionMgr.GetInstance():Send(60001, {}, 60002, function (slot0)
		if slot0.result == 0 then
			slot2.base = uv0
			slot1 = Guild.New({})

			slot1:setId(slot0.id)

			slot4.id = uv1.id
			slot4.name = uv1.name
			slot4.lv = uv1.level
			slot4.adv = uv1.manifesto
			slot5.icon = uv1.icon
			slot5.character = uv1.character
			slot5.icon_theme = uv1.iconTheme
			slot5.transform_flag = uv1.transformFlag
			slot5.skin = uv1.skinId
			slot5.marry_flag = uv1.proposeTime
			slot4.display = {}
			slot3 = GuildMember.New({
				liveness = 0,
				online = 1
			})

			slot3:setDuty(GuildMember.DUTY_COMMANDER)
			slot1:addMember(slot3)
			getProxy(GuildProxy):addGuild(slot1)

			slot6.gem = uv2

			uv1:consume({})
			uv3:updatePlayer(uv1)
			uv4:sendNotification(GAME.CREATE_GUILD_DONE)
			pg.TipsMgr.GetInstance():ShowTips(i18n("guild_create_sucess"))
		elseif slot0.result == 2015 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("guild_name_invaild"))
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("guild_create_error", slot0.result))
		end
	end)
end

return slot0
