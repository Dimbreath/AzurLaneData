ys = ys or {}
ys.Story = ys.Story or {}
ys.Story.NodeData = class("NodeData")

ys.Story.NodeData.Ctor = function (slot0, slot1, slot2)
	slot0._data = slot1 or {}
	slot0._allSeq = {
		slot2
	}
end

ys.Story.NodeData.AddSeq = function (slot0, slot1)
	table.insert(slot0._allSeq, slot1)
end

ys.Story.NodeData.GetAllSeq = function (slot0)
	return slot0._allSeq
end

return
