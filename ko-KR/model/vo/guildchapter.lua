slot0 = class("GuildChapter", import(".ShamChapter"))
slot0.SAVE_TAG = "guild_all_ships_"

function slot0.Ctor(slot0, slot1)
	uv0.super.Ctor(slot0, slot1)

	slot0.bossId = nil
	slot0.id = 80000
end

function slot0.getDataType(slot0)
	return ChapterConst.TypeGuild
end

function slot0.update(slot0, slot1)
	uv0.super.update(slot0, slot1)

	slot0.bossId = slot1.boss_id
end

function slot0.isOpen(slot0)
end

function slot0.isFirstDay(slot0)
end

function slot0.getRestDays(slot0)
end

function slot0.writeBack(slot0, slot1, slot2)
	for slot8, slot9 in pairs(slot0.fleet.ships) do
		function (slot0)
			if uv0.statistics[slot0.id] then
				uv1:updateShipHp(slot0.id, slot1.bp)
			end
		end(slot9)
	end

	slot5 = slot0:getChapterCell(slot3.line.row, slot3.line.column)

	if slot1 then
		slot5.flag = 1
		slot0.progress = slot0.progress + 1
	end

	slot0:updateChapterCell(slot5)
end

return slot0
