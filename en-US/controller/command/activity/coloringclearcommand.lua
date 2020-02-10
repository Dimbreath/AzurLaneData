slot0 = class("ColoringClearCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot8.act_id = slot2.activityId
	slot8.id = slot2.id

	pg.ConnectionMgr.GetInstance():Send(26006, {}, 26007, function (slot0)
		if slot0.result == 0 then
			getProxy(ColoringProxy):getColorGroup(uv0):clearFill()
			uv1:sendNotification(GAME.COLORING_CLEAR_DONE)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("coloring_clear", slot0.result))
		end
	end)
end

return slot0
