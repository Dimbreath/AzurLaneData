class("ChangeMedalDisplayCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot3 = slot1:getBody().medalList
	slot6 = getProxy(PlayerProxy).getData(slot4).displayTrophyList
	slot7 = 0

	while slot7 < PlayerInfoLayer.MAX_MEDAL_DISPLAY do
		if slot3[slot7] ~= slot6[slot7] then
			break
		end

		if slot7 == PlayerInfoLayer.MAX_MEDAL_DISPLAY then
			return
		end

		slot7 = slot7 + 1
	end

	slot8 = {}

	for slot12, slot13 in ipairs(slot3) do
		table.insert(slot8, slot13)
	end

	pg.ConnectionMgr.GetInstance():Send(17401, {
		fixed_const = 1,
		medal_id = slot8
	}, 17402, function (slot0)
		if slot0.result == 0 then
			slot0:updatePlayerMedalDisplay(slot0.updatePlayerMedalDisplay)
			pg.TipsMgr.GetInstance():ShowTips(i18n("change_display_medal_success"))
			pg.TipsMgr.GetInstance():sendNotification(GAME.CHANGE_PLAYER_MEDAL_DISPLAY_DONE)
		end
	end)
end

return class("ChangeMedalDisplayCommand", pm.SimpleCommand)
