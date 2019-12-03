slot0 = class("BiliTracker")

slot0.Ctor = function (slot0, slot1)
	return
end

slot0.Tracking = function (slot0, slot1, slot2, slot3)
	if slot1 == TRACKING_USER_LEVELUP then
		print("tracking lvl:" .. slot3)
		pg.SdkMgr.GetInstance():SdkLevelUp()
	end
end

return slot0
