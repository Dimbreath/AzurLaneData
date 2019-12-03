slot0 = class("GuildChapter", import(".ShamChapter"))
slot0.SAVE_TAG = "guild_all_ships_"

slot0.Ctor = function (slot0, slot1)
	slot0.super.Ctor(slot0, slot1)

	slot0.bossId = nil
	slot0.id = 80000
end

slot0.getDataType = function (slot0)
	return ChapterConst.TypeGuild
end

slot0.update = function (slot0, slot1)
	slot0.super.update(slot0, slot1)

	slot0.bossId = slot1.boss_id
end

slot0.isOpen = function (slot0)
	return
end

slot0.isFirstDay = function (slot0)
	return
end

slot0.getRestDays = function (slot0)
	return
end

slot0.writeBack = function (slot0, slot1, slot2)
	function slot4(slot0)
		if slot0.statistics[slot0.id] then
			slot1:updateShipHp(slot0.id, slot1.bp)
		end
	end

	for slot8, slot9 in pairs(slot0.fleet.ships) do
		slot4(slot9)
	end

	slot5 = slot0:getChapterCell(slot3.line.row, slot3.line.column)

	if slot1 then
		slot5.flag = 1
		slot0.progress = slot0.progress + 1
	end

	slot0:updateChapterCell(slot5)
end

return slot0
