class("ExerciseCountRecoverUpCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot3 = getProxy(MilitaryExerciseProxy)
	slot4 = slot3:getSeasonInfo()

	slot4:updateResetTime(slot2() + pg.TimeMgr.GetInstance():GetServerTime())
	slot4:updateExerciseCount(SeasonInfo.RECOVER_UP_COUNT)
	slot3:updateSeasonInfo(slot4)
	slot3:addRefreshCountTimer()
end

return class("ExerciseCountRecoverUpCommand", pm.SimpleCommand)
