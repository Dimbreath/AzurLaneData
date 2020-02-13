class("UpdateGuideIndexCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = slot1:getBody().callback

	print("update index.....", slot3)
	pg.ConnectionMgr.GetInstance():Send(11016, {
		guide_index = slot1.getBody().index
	})

	slot5 = getProxy(PlayerProxy):getData()
	slot5.guideIndex = slot1.getBody().index

	getProxy(PlayerProxy):updatePlayer(slot5)
	pg.SeriesGuideMgr.GetInstance():setPlayer(slot5)

	if pg.SeriesGuideMgr.GetInstance():isEnd() then
		pg.TrackerMgr.GetInstance():Tracking(TRACKING_TUTORIAL_COMPLETE_1)
	end

	if slot4 then
		slot4()
	end
end

return class("UpdateGuideIndexCommand", pm.SimpleCommand)
