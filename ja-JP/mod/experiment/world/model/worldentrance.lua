slot0 = class("WorldEntrance", import("...BaseEntity"))
slot0.Fields = {
	config = "table",
	atlas = "table",
	transportDic = "table",
	world = "table",
	id = "number",
	marks = "table",
	active = "boolean"
}
slot0.Listeners = {}
slot0.EventUpdateMapIndex = "WorldEntrance.EventUpdateMapIndex"
slot0.EventUpdateDisplayMarks = "WorldEntrance.EventUpdateDisplayMarks"

function slot0.DebugPrint(slot0)
	return string.format("入口 [id: %s] [原始地图: %s] [所属区域: %s] [所属海域: %s]", slot0.id, slot0:GetBaseMapId(), slot0.config.regions, slot0.config.world)
end

function slot0.Setup(slot0, slot1, slot2)
	slot0.id = slot1
	slot0.config = pg.world_chapter_colormask[slot1]
	slot0.atlas = slot2
	slot0.transportDic = {}

	table.foreachi(slot0.config.map_transfer, function (slot0, slot1)
		uv0.transportDic[slot1] = true
	end)

	slot0.marks = {
		task_main = 0,
		task = 0,
		treasure = 0,
		sairen = 0,
		task_following_main = 0,
		task_following = 0,
		treasure_sairen = 0,
		step = 0
	}
end

function slot0.GetBaseMapId(slot0)
	return slot0.config.chapter
end

function slot0.GetBaseMap(slot0)
	return slot0.atlas:GetMap(slot0:GetBaseMapId())
end

function slot0.GetReplaceMapIds(slot0)
	for slot6, slot7 in ipairs(slot0:GetBaseMap().config.sairen_chapter) do
		table.insert({}, slot7)
	end

	for slot6, slot7 in ipairs(slot1.stage_chapter) do
		table.insert(slot2, slot7[3])
	end

	for slot6, slot7 in ipairs(slot1.task_chapter) do
		table.insert(slot2, slot7[2])
	end

	for slot6, slot7 in ipairs(slot1.teasure_chapter) do
		table.insert(slot2, slot7[2])
	end

	for slot6, slot7 in ipairs(slot1.complete_chapter) do
		table.insert(slot2, slot7)
	end

	return slot2
end

function slot0.GetColormaskUniqueID(slot0)
	return slot0.config.color_id
end

function slot0.GetAreaId(slot0)
	return slot0.config.regions
end

function slot0.IsPressing(slot0)
	return slot0:GetBaseMap().isPressing
end

function slot0.HasPort(slot0, slot1)
	return slot0:GetPortId() > 0 and (not slot1 or pg.world_port_data[slot2].port_camp == nowWorld.realm)
end

function slot0.GetPortId(slot0)
	return slot0.config.port_map_icon
end

function slot0.UpdateActive(slot0, slot1)
	if slot0.active ~= slot1 then
		slot0.active = slot1

		if slot1 then
			nowWorld:GetAtlas():SetActiveEntrance(slot0)
		end
	end
end

function slot0.UpdateDisplayMarks(slot0, slot1, slot2)
	slot0.marks[slot1] = slot0.marks[slot1] + (slot2 and 1 or -1)

	if slot0.marks[slot1] == 0 and slot2 or slot0.marks[slot1] == 1 and not slot2 then
		slot0:DispatchEvent(uv0.EventUpdateDisplayMarks, slot1, slot0.marks[slot1] > 0)
	end
end

function slot0.GetDisplayMarks(slot0)
	return slot0.marks
end

return slot0
