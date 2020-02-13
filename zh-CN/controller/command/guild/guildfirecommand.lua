class("GuildFireCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot6 = getProxy(GuildProxy).getData(slot3)

	if slot6:getDutyByMemberId(slot1:getBody()) <= slot6:getDutyByMemberId(getProxy(PlayerProxy).getData(slot4).id) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("guild_fire_duty_limit"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(60014, {
		player_id = slot2
	}, 60015, function (slot0)
		if slot0.result == 0 then
			slot0:deleteMember(slot0)
			slot0.deleteMember:updateGuild(slot0)
			slot3:sendNotification(GAME.GUILD_FIRE_DONE)
			pg.TipsMgr.GetInstance():ShowTips(i18n("guild_fire_succeed"))
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("guild_fire_erro", slot0.result))
		end
	end)
end

return class("GuildFireCommand", pm.SimpleCommand)
