ys = ys or {}
ys.Story.StorySleepNode = class("StorySleepNode", ys.ISeqNode)

pg.NodeMgr.RigisterNode("StorySleep", ys.Story.StorySleepNode)

function ys.Story.StorySleepNode.Ctor(slot0, slot1, slot2)
	slot0._time = slot2[2]
end

function ys.Story.StorySleepNode.Init(slot0)
	slot0._end = os.time() + slot0._time
end

function ys.Story.StorySleepNode.Update(slot0)
	if slot0._end <= os.time() then
		slot0:Dispose()
	end
end

return
