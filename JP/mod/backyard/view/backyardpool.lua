slot0 = class("BackyardPool")

slot0.Ctor = function (slot0, slot1, slot2)
	slot0.prefab = slot1
	slot0.maxSize = slot2
	slot0.items = {}
end

slot0.Enqueue = function (slot0, slot1)
	setActive(slot1, false)

	if slot0.maxSize <= #slot0.items then
		Destroy(go(slot1))
	else
		table.insert(slot0.items, slot1)
	end
end

slot0.Dequeue = function (slot0)
	slot1 = nil

	setActive((#slot0.items <= 0 or table.remove(slot0.items, #slot0.items)) and instantiate(slot0.prefab), true)

	return (#slot0.items <= 0 or table.remove(slot0.items, #slot0.items)) and instantiate(slot0.prefab)
end

slot0.clear = function (slot0)
	slot0.prefab = nil

	for slot4, slot5 in ipairs(slot0.items) do
		Destroy(go(slot5))
	end

	slot0.items = nil
end

return slot0
