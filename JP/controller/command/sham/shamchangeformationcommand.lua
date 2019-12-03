class("ShamChangeFormationCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = slot1:getBody().callback

	pg.ConnectionMgr.GetInstance():Send(23006, {
		formation_list = slot1.getBody().fleetShipIds
	}, 23007, function (slot0)
		if slot0.result == 0 then
			slot1 = getProxy(ChapterProxy)
			slot2 = slot1:getShamChapter()

			slot2:updateFleetShips(slot0)
			slot1:updateShamChapter(slot2, bit.bor(ChapterConst.DirtyFleet, ChapterConst.DirtyStrategy))
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("sham_change_formation_error", slot0.result))
		end

		if slot1 then
			slot1(slot0.result)
		end
	end)
end

return class("ShamChangeFormationCommand", pm.SimpleCommand)
