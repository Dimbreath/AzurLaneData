class("TimeSynchronizationCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	pg.TimeMgr.GetInstance():SetServerTime(slot1:getBody().timestamp, slot1.getBody().monday_0oclock_timestamp)
	getProxy(BuildShipProxy).setBuildShipState(slot3)

	if getProxy(PlayerProxy):getData() then
		slot4:flushTimesListener()
	end

	if getProxy(ShopsProxy):getGuildShop() then
		slot5:addGuildShopRefreshTimer()
	end

	slot6, slot7 = slot3:getExChangeItemInfo()

	if slot6 and slot7 then
		slot3:addExChangeItemTimer()
	end

	if getProxy(MilitaryExerciseProxy):getSeasonInfo() then
		slot8:addRefreshCountTimer()
		slot8:addSeasonOverTimer()
	end
end

return class("TimeSynchronizationCommand", pm.SimpleCommand)
