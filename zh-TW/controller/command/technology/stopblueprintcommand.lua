slot0 = class("StopBluePrintCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = slot2.callback

	if not getProxy(TechnologyProxy):getBluePrintById(slot2.id) then
		return
	end

	if not slot6:isDeving() and not slot6:isFinished() then
		return
	end

	slot10.blueprint_id = slot3

	pg.ConnectionMgr.GetInstance():Send(63206, {}, 63207, function (slot0)
		if slot0.result == 0 then
			uv0:updateStartUpTime(pg.TimeMgr.GetInstance():GetServerTime() - uv0.startTime)
			uv0:reset()
			uv1:updateBluePrint(uv0)

			slot5.id = uv0.id

			uv2:sendNotification(GAME.STOP_BLUEPRINT_DONE, {})

			if uv3 then
				uv3()
			end
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("technology_stop_erro") .. slot0.result)
		end
	end)
end

return slot0
