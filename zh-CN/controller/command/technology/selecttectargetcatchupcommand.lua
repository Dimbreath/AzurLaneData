slot0 = class("SelectTecTargetCatchupCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(63011, {
		target = slot1:getBody().charID
	}, 63012, function (slot0)
		if slot0.result == 0 then
			slot2 = getProxy(TechnologyProxy):getNewestCatchupTecID()
			slot3 = uv0

			if uv0 == 0 then
				slot1:setCurCatchupTecInfo(0, 0, 0)
			else
				slot1:setCurCatchupTecInfo(slot2, slot3, 0)
			end

			uv1:sendNotification(GAME.SELECT_TEC_TARGET_CATCHUP_DONE)
		else
			pg.TipsMgr.GetInstance():ShowTips("Error Code" .. slot0.result)
		end
	end)
end

return slot0
