class("InformCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = slot2.info
	slot5 = slot2.content

	if not slot2.playerId or not slot4 or not slot5 then
		return
	end

	if getProxy(PlayerProxy):getRawData().level < 20 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("inform_level_limit"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(50111, {
		id = slot3,
		info = slot4,
		content = slot5
	}, 50112, function (slot0)
		if slot0.result == 0 then
			table.insert(getProxy(ChatProxy).informs, slot0 .. slot1)
			pg.TipsMgr.GetInstance():ShowTips(i18n("inform_sueecss"))
			pg.TipsMgr.GetInstance().ShowTips:sendNotification(GAME.INFORM_DONE)
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("inform_failed"))
		end
	end)
end

return class("InformCommand", pm.SimpleCommand)
