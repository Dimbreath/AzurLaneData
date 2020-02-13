class("FinishCampTecCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = slot1:getBody().levelID

	pg.ConnectionMgr.GetInstance():Send(64003, {
		tech_group_id = slot1.getBody().tecID
	}, 64004, function (slot0)
		if slot0.result == 0 then
			slot1 = getProxy(TechnologyNationProxy)

			slot1:updateTecItem(slot0, slot1, 0, 0)
			slot1:setTimer()
			slot1:calculateTecBuff()
			slot1.calculateTecBuff:sendNotification(TechnologyConst.FINISH_TEC_SUCCESS, slot0)
			slot1:refreshRedPoint()
			slot1.refreshRedPoint:sendNotification(TechnologyConst.UPDATE_REDPOINT_ON_TOP)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("coloring_cell", slot0.result))
		end
	end)
end

return class("FinishCampTecCommand", pm.SimpleCommand)
