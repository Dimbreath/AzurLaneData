class("ReplaceRivalsCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot3 = getProxy(MilitaryExerciseProxy).getSeasonInfo(slot2)
	slot4 = slot3:getconsumeGem()

	if MAX_REPLACE_RIVAL_COUNT < slot3:getFlashCount() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_refresh_count_insufficient"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(18003, {
		type = 0
	}, 18004, function (slot0)
		if slot0.result == 0 then
			slot1 = {}

			for slot5, slot6 in ipairs(slot0.target_list) do
				table.insert(slot1, Rival.New(slot6))
			end

			slot0:updateRivals(slot1)
			slot1:increaseFlashCount()
			slot0:updateSeasonInfo(slot1)
			slot0.updateSeasonInfo:sendNotification(GAME.REPLACE_RIVALS_DONE, slot0:getSeasonInfo())
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("", slot0.result))
		end
	end)
end

return class("ReplaceRivalsCommand", pm.SimpleCommand)
