class("GuildImpeachCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()

	if getProxy(GuildProxy).getData(slot3):inKickTime() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("guild_commder_in_impeach_time"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(60016, {
		player_id = slot2
	}, 60017, function (slot0)
		if slot0.result == 0 then
			slot1 = getProxy(GuildProxy)
			slot2 = slot1:getData()

			slot2:setkickLeaderTime(slot3)
			slot1:updateGuild(slot2)
			pg.TipsMgr.GetInstance():ShowTips(i18n("guild_impeach_sucess"))
			slot0:sendNotification(GAME.GUILD_IMPEACH_DONE)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("guild_impeach_erro", slot0.result))
		end
	end)
end

return class("GuildImpeachCommand", pm.SimpleCommand)
