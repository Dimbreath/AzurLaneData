ys = ys or {}
ys.Story.StorySleepNode = class("StorySleepNode", ys.ISeqNode)

pg.NodeMgr.RigisterNode("StorySleep", ys.Story.StorySleepNode)

ys.Story.StorySleepNode.Ctor = function (slot0, slot1, slot2)
	slot0._time = slot2[2]
end

ys.Story.StorySleepNode.Init = function (slot0)
	slot0._end = os.time() + slot0._time
end

ys.Story.StorySleepNode.Update = function (slot0)
	if slot0._end <= os.time() then
		slot0:Dispose()
	end
end

return
