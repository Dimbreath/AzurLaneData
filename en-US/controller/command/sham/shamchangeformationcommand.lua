slot0 = class("ShamChangeFormationCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = slot2.callback

	pg.ConnectionMgr.GetInstance():Send(23006, {
		formation_list = slot2.fleetShipIds
	}, 23007, function (slot0)
		if slot0.result == 0 then
			slot1 = getProxy(ChapterProxy)
			slot2 = slot1:getShamChapter()

			slot2:updateFleetShips(uv0)
			slot1:updateShamChapter(slot2, bit.bor(ChapterConst.DirtyFleet, ChapterConst.DirtyStrategy))
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("sham_change_formation_error", slot0.result))
		end

		if uv1 then
			uv1(slot0.result)
		end
	end)
end

return slot0
