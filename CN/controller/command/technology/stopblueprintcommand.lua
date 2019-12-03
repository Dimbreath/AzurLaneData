class("StopBluePrintCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = slot1:getBody().callback

	if not getProxy(TechnologyProxy):getBluePrintById(slot1.getBody().id) then
		return
	end

	if not slot6:isDeving() and not slot6:isFinished() then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(63206, {
		blueprint_id = slot3
	}, 63207, function (slot0)
		if slot0.result == 0 then
			slot0:updateStartUpTime(slot1)
			slot0:reset()
			slot1:updateBluePrint(slot0)
			slot1.updateBluePrint:sendNotification(GAME.STOP_BLUEPRINT_DONE, {
				id = slot0.id
			})

			if slot1.updateBluePrint then
				slot3()
			end
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("technology_stop_erro") .. slot0.result)
		end
	end)
end

return class("StopBluePrintCommand", pm.SimpleCommand)
