slot0 = class("BeginStageCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot7.system = slot1:getBody().system

	pg.ConnectionMgr.GetInstance():Send(40005, {}, 40006, function (slot0)
		if slot0.result == 0 then
			-- Nothing
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("stage_beginStage", slot0.result))
		end
	end)
end

return slot0
