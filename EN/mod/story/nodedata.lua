ys = ys or {}
ys.Story = ys.Story or {}
ys.Story.NodeData = class("NodeData")

function ys.Story.NodeData.Ctor(slot0, slot1, slot2)
	slot0._data = slot1 or {}
	slot0._allSeq = {
		slot2
	}
end

function ys.Story.NodeData.AddSeq(slot0, slot1)
	table.insert(slot0._allSeq, slot1)
end

function ys.Story.NodeData.GetAllSeq(slot0)
	return slot0._allSeq
end

return
