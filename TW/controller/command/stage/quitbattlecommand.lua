class("BeginStageCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(40005, {
		system = slot1:getBody().system
	}, 40006, function (slot0)
		if slot0.result == 0 then
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("stage_beginStage", slot0.result))
		end
	end)
end

return class("BeginStageCommand", pm.SimpleCommand)
