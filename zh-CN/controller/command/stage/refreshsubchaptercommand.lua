slot0 = class("RefreshSubChapterCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(13403, {
		type = 0
	}, 13404, function (slot0)
		if slot0.result == 0 then
			slot2 = getProxy(ChapterProxy)
			slot2.subRefreshCount = slot2.subRefreshCount - 1

			uv0:sendNotification(GAME.SUB_CHAPTER_REFRESH_DONE, Chapter.New({
				id = slot0.chapter_id.chapter_id,
				active_time = slot0.chapter_id.active_time,
				index = slot0.chapter_id.index
			}))
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("error_refresh_sub_chapter"))
		end
	end)
end

return slot0
