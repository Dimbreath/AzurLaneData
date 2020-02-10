slot0 = class("GuildChangeFormationCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = slot2.callback
	slot8.formation_list = slot2.fleetShipIds

	pg.ConnectionMgr.GetInstance():Send(61006, {}, 61007, function (slot0)
		if slot0.result == 0 then
			slot1 = getProxy(ChapterProxy)
			slot2 = slot1:getGuildChapter()

			slot2:updateFleetShips(uv0)
			slot1:updateGuildChapter(slot2, bit.bor(ChapterConst.DirtyFleet, ChapterConst.DirtyStrategy))
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("sham_change_formation_error", slot0.result))
		end

		if uv1 then
			uv1(slot0.result)
		end
	end)
end

return slot0
