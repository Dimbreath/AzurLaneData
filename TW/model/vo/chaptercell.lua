slot0 = class("ChapterCell")

function slot0.Ctor(slot0, slot1)
	slot0.walkable = true
	slot0.row = slot1.pos.row
	slot0.column = slot1.pos.column
	slot0.attachment = slot1.item_type
	slot0.attachmentId = slot1.item_id
	slot0.flag = slot1.item_flag
	slot0.data = slot1.item_data
	slot0.trait = ChapterConst.TraitNone
	slot0.item = nil
	slot0.itemOffset = Vector2(0, 0)
	slot0.flagList = {}
	slot2 = ipairs
	slot3 = slot1.flag_list or {}

	for slot5, slot6 in slot2(slot3) do
		table.insert(slot0.flagList, slot6)
	end

	if slot0.attachment == ChapterConst.AttachRival then
		slot2 = {}

		_.each(slot1.item_state, function (slot0)
			slot0[slot0.id] = slot0.hp_rant
		end)

		slot3 = ShamRival.New(slot1.item_info)

		_.each(slot3.vanguardShips, function (slot0)
			slot0.hpRant = slot0[slot0.id] or 10000
		end)
		_.each(slot3.mainShips, function (slot0)
			slot0.hpRant = slot0[slot0.id] or 10000
		end)

		slot0.rival = slot3
	end
end

function slot0.updateFlagList(slot0, slot1)
	slot0.flagList = slot0.flagList or {}

	table.clear(slot0.flagList)

	for slot5, slot6 in ipairs(slot1.flag_list) do
		table.insert(slot0.flagList, slot6)
	end
end

function slot0.checkHadFlag(slot0, slot1)
	return table.contains(slot0.flagList, slot1)
end

function slot0.Line2Name(slot0, slot1)
	return "chapter_cell_" .. slot0 .. "_" .. slot1
end

function slot0.Line2QuadName(slot0, slot1)
	return "chapter_cell_quad_" .. slot0 .. "_" .. slot1
end

function slot0.Line2MarkName(slot0, slot1, slot2)
	return "chapter_cell_mark_" .. slot0 .. "_" .. slot1 .. "#" .. slot2
end

function slot0.MinMaxLine2QuadName(slot0, slot1, slot2, slot3)
	return "chapter_cell_quad_" .. slot0 .. "_" .. slot1 .. "_" .. slot2 .. "_" .. slot3
end

function slot0.Line2RivalName(slot0, slot1, slot2)
	return "rival_" .. slot1 .. "_" .. slot2
end

function slot0.LineAround(slot0, slot1, slot2)
	slot3 = {}

	for slot7 = -slot2, slot2, 1 do
		for slot11 = -slot2, slot2, 1 do
			if slot2 >= math.abs(slot7) + math.abs(slot11) then
				table.insert(slot3, {
					row = slot0 + slot7,
					column = slot1 + slot11
				})
			end
		end
	end

	return slot3
end

function slot0.IsWalkable(slot0, slot1)
	return slot0.walkable
end

return slot0
