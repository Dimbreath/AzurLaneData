slot0 = class("TimeSynchronizationCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()

	pg.TimeMgr.GetInstance():SetServerTime(slot2.timestamp, slot2.monday_0oclock_timestamp)
	getProxy(BuildShipProxy):setBuildShipState()

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

return slot0
