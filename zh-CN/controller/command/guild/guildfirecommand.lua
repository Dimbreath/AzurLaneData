slot0 = class("GuildFireCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot6 = getProxy(GuildProxy):getData()

	if slot6:getDutyByMemberId(slot1:getBody()) <= slot6:getDutyByMemberId(getProxy(PlayerProxy):getData().id) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("guild_fire_duty_limit"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(60014, {
		player_id = slot2
	}, 60015, function (slot0)
		if slot0.result == 0 then
			uv0 = uv1:getData()

			uv0:deleteMember(uv2)
			uv1:updateGuild(uv0)
			uv3:sendNotification(GAME.GUILD_FIRE_DONE)
			pg.TipsMgr.GetInstance():ShowTips(i18n("guild_fire_succeed"))
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("guild_fire_erro", slot0.result))
		end
	end)
end

return slot0
