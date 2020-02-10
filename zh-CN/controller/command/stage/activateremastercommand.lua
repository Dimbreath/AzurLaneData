slot0 = class("ActivateRemasterCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(13501, {
		active_id = slot1:getBody().id
	}, 13502, function (slot0)
		if slot0.result == 0 then
			slot1 = getProxy(ChapterProxy)
			slot1.remasterId = uv0.id
			slot1.remasterTime = pg.TimeMgr.GetInstance():GetServerTime() + pg.gameset.reactivity_time.key_value
			slot1.remasterTickets = slot1.remasterTickets - 1

			uv0.callback()
			uv1:sendNotification(GAME.ACTIVATE_REMASTER_DONE)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("activate_remaster_error_", slot0.result))
		end
	end)
end

return slot0
