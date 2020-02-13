class("GuildChangeFormationCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = slot1:getBody().callback

	pg.ConnectionMgr.GetInstance():Send(61006, {
		formation_list = slot1.getBody().fleetShipIds
	}, 61007, function (slot0)
		if slot0.result == 0 then
			slot1 = getProxy(ChapterProxy)
			slot2 = slot1:getGuildChapter()

			slot2:updateFleetShips(slot0)
			slot1:updateGuildChapter(slot2, bit.bor(ChapterConst.DirtyFleet, ChapterConst.DirtyStrategy))
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("sham_change_formation_error", slot0.result))
		end

		if slot1 then
			slot1(slot0.result)
		end
	end)
end

return class("GuildChangeFormationCommand", pm.SimpleCommand)
