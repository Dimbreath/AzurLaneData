slot0 = class("FuncBuffer")

function slot0.Ctor(slot0)
	slot0.buffers = {}
	slot0.notifier = false
end

function slot0.SetNotifier(slot0, slot1)
	slot0.notifier = defaultValue(slot1, false)
end

function slot0.IsEmpty(slot0)
	return #slot0.buffers <= 0
end

function slot0.Pop(slot0)
	return table.remove(slot0.buffers, 1)
end

function slot0.Push(slot0, slot1, ...)
	table.insert(slot0.buffers, {
		funcName = slot1,
		params = {
			...
		}
	})
	slot0:ExcuteAll()
end

function slot0.ExcuteAll(slot0)
	if slot0.notifier then
		while not slot0:IsEmpty() do
			slot0.notifier[slot0:Pop().funcName](slot0.notifier, unpack(slot0.Pop().params))
		end
	end
end

function slot0.__index(slot0, slot1)
	return rawget(slot0, slot1) or slot0[slot1] or function (slot0, ...)
		slot0:Push(slot0.Push, ...)
	end
end

return slot0
