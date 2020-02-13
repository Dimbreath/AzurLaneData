class("ColoringFetchCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(26008, {
		act_id = slot1:getBody().activityId
	}, 26001, function (slot0)
		getProxy(ColoringProxy).netUpdateData(slot1, slot0)
		slot0:sendNotification(GAME.COLORING_FETCH_DONE)
	end)
end

return class("ColoringFetchCommand", pm.SimpleCommand)
