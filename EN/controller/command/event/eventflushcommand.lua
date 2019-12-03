class("EventFlushCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()

	pg.ConnectionMgr.GetInstance():Send(13009, {
		type = 0
	}, 13010, function (slot0)
		if slot0.result == 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("event_flush_success"))
			getProxy(EventProxy):updateInfo(slot0)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("event_flush_fail", slot0.result))
		end
	end)
end

return class("EventFlushCommand", pm.SimpleCommand)
