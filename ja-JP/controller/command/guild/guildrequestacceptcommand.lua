class("GuildRequestAcceptCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = getProxy(GuildProxy).getData(slot3)

	if slot4:getMaxMember() <= slot4.memberCount then
		pg.TipsMgr.GetInstance():ShowTips(i18n("guild_member_max_count"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(60020, {
		player_id = slot2
	}, 60021, function (slot0)
		if slot0.result == 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("guild_new_member_join"))
			slot0:sendNotification(GAME.GUIDL_REQUEST_ACCEPT_DONE)
		elseif slot0.result == 4 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("guild_player_in_cd_time"))
		elseif slot0.result == 1 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("guild_player_already_join"))
			slot0:sendNotification(GAME.GUIDL_REQUEST_REJECT, slot0.sendNotification)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("guild_accept_erro", slot0.result))
		end

		slot2:deleteRequest(slot2.deleteRequest)
	end)
end

return class("GuildRequestAcceptCommand", pm.SimpleCommand)
