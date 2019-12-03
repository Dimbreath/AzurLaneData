slot0 = class("FuncBuffer")

slot0.Ctor = function (slot0)
	slot0.buffers = {}
	slot0.notifier = false
end

slot0.SetNotifier = function (slot0, slot1)
	slot0.notifier = defaultValue(slot1, false)
end

slot0.IsEmpty = function (slot0)
	return #slot0.buffers <= 0
end

slot0.Pop = function (slot0)
	return table.remove(slot0.buffers, 1)
end

slot0.Push = function (slot0, slot1, ...)
	table.insert(slot0.buffers, {
		funcName = slot1,
		params = {
			...
		}
	})
	slot0:ExcuteAll()
end

slot0.ExcuteAll = function (slot0)
	if slot0.notifier then
		while not slot0:IsEmpty() do
			slot0.notifier[slot0:Pop().funcName](slot0.notifier, unpack(slot0.Pop().params))
		end
	end
end

slot0.__index = function (slot0, slot1)
	return rawget(slot0, slot1) or slot0[slot1] or function (slot0, ...)
		slot0:Push(slot0.Push, ...)
	end
end

return slot0
