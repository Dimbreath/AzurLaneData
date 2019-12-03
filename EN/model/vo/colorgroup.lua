slot0 = class("ColorGroup", import(".BaseVO"))
slot0.StateLock = 0
slot0.StateColoring = 1
slot0.StateFinish = 2
slot0.StateAchieved = 3

slot0.Ctor = function (slot0, slot1)
	slot0.id = slot1
	slot0.configId = slot0.id
	slot0.drops = {}
	slot0.fills = {}
	slot0.cells = {}

	_.each(slot0:getConfig("cells"), function (slot0)
		slot0:setCell(slot0[1], slot0[2], slot0[3])
	end)

	slot0.colors = _.map(slot0:getConfig("colors"), function (slot0)
		return Color.New(slot0[1], slot0[2], slot0[3], slot0[4])
	end)
end

slot0.bindConfigTable = function (slot0)
	return pg.activity_coloring_template
end

slot0.getState = function (slot0)
	return slot0.state
end

slot0.setState = function (slot0, slot1)
	slot0.state = slot1
end

slot0.getHasAward = function (slot0)
	return slot0.hasAward
end

slot0.setHasAward = function (slot0, slot1)
	slot0.hasAward = slot1
end

slot0.getDrops = function (slot0)
	return slot0.drops
end

slot0.setDrops = function (slot0, slot1)
	slot0.drops = slot1
end

slot0.getFill = function (slot0, slot1, slot2)
	return slot0.fills[slot1 .. "_" .. slot2]
end

slot0.setFill = function (slot0, slot1, slot2, slot3)
	slot4 = slot1 .. "_" .. slot2

	if slot3 == 0 then
		slot0.fills[slot4] = nil
	else
		slot0.fills[slot4] = ColorCell.New(slot1, slot2, slot3)
	end
end

slot0.hasFill = function (slot0, slot1, slot2)
	return slot0:getFill(slot1, slot2) ~= nil
end

slot0.clearFill = function (slot0)
	slot0.fills = {}
end

slot0.isAllFill = function (slot0)
	if slot0:canBeCustomised() then
		return false
	end

	for slot4, slot5 in pairs(slot0.cells) do
		if not slot0.fills[slot4] then
			return false
		end
	end

	return true
end

slot0.getCell = function (slot0, slot1, slot2)
	return slot0.cells[slot1 .. "_" .. slot2]
end

slot0.setCell = function (slot0, slot1, slot2, slot3)
	slot0.cells[slot1 .. "_" .. slot2] = ColorCell.New(slot1, slot2, slot3)
end

slot0.hasCell = function (slot0, slot1, slot2)
	return slot0:getCell(slot1, slot2) ~= nil
end

slot0.canBeCustomised = function (slot0)
	return slot0:getConfig("blank") == 1
end

return slot0
