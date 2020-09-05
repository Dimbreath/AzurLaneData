slot0 = class("SelectEliteCommanderCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot7 = slot2.callback
	slot8 = getProxy(ChapterProxy)
	slot10 = slot8:getSameMapChapters(slot8:getChapterById(slot2.chapterId))

	if slot2.commanderId then
		slot11, slot12 = Commander.canEquipToEliteChapter(slot3, slot2.index, slot2.pos, slot6)

		if not slot11 then
			pg.TipsMgr.GetInstance():ShowTips(slot12)

			return
		end
	end

	for slot14, slot15 in pairs(slot10) do
		slot15:updateCommander(slot4, slot5, slot6)
		slot8:updateChapter(slot15)
	end

	slot9:updateCommander(slot4, slot5, slot6)
	slot8:updateChapter(slot9)

	if slot7 then
		slot7()
	end
end

return slot0
