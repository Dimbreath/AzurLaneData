class("GuildRequestRejectCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(60022, {
		player_id = slot1:getBody()
	}, 60023, function (slot0)
		if slot0.result == 0 then
			slot1 = getProxy(GuildProxy)

			slot1:deleteRequest(slot0)
			slot1:sendNotification(GAME.GUIDL_REQUEST_REJECT_DONE)
			pg.TipsMgr.GetInstance():ShowTips(i18n("guild_rejecet_apply_sucess"))
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("guild_reject_erro", slot0.result))
		end
	end)
end

return class("GuildRequestRejectCommand", pm.SimpleCommand)
