class("RefreshSubChapterCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(13403, {
		type = 0
	}, 13404, function (slot0)
		if slot0.result == 0 then
			getProxy(ChapterProxy).subRefreshCount = getProxy(ChapterProxy).subRefreshCount - 1

			slot0:sendNotification(GAME.SUB_CHAPTER_REFRESH_DONE, Chapter.New({
				id = slot0.chapter_id.chapter_id,
				active_time = slot0.chapter_id.active_time,
				index = slot0.chapter_id.index
			}))
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("error_refresh_sub_chapter"))
		end
	end)
end

return class("RefreshSubChapterCommand", pm.SimpleCommand)
