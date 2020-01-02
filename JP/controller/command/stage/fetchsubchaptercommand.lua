class("FetchSubChapterCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(13401, {
		type = 0
	}, 13402, function (slot0)
		slot1 = getProxy(ChapterProxy)
		slot1.subNextReqTime = math.max(slot0.next_refresh_time, pg.TimeMgr.GetInstance():GetServerTime() + 60)
		slot1.subRefreshCount = slot0.refresh_count
		slot1.subProgress = slot0.progress
		slot2 = {}

		_.each(slot0.chapter_list, function (slot0)
			slot0[slot0.chapter_id] = slot0
		end)

		for slot7, slot8 in pairs(slot3) do
			if slot8:getPlayType() == ChapterConst.TypeMainSub and not slot8.active and not slot2[slot7] then
				slot8:clearSubChapter()
			end
		end

		_.each(slot0.chapter_list, function (slot0)
			if slot0[slot0.chapter_id] then
				slot1 = slot1:getChapterById(slot0.chapter_id)
				slot1.expireTime = slot0.active_time
				slot1.awardIndex = slot0.index

				slot1:updateChapter(slot1)
			else
				slot1:addChapter(Chapter.New({
					id = slot0.chapter_id,
					active_time = slot0.active_time,
					index = slot0.index
				}))
			end
		end)
		slot0:sendNotification(GAME.SUB_CHAPTER_FETCH_DONE)
	end)
end

return class("FetchSubChapterCommand", pm.SimpleCommand)
