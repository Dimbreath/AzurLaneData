slot0 = require("Mgr/Pool/PoolUtil")
slot1 = class("PoolPlural")

slot1.Ctor = function (slot0, slot1, slot2)
	slot0.prefab = slot1
	slot0.capacity = slot2
	slot0.index = 0
	slot0.items = {}
	slot0.balance = 0
end

slot1.Enqueue = function (slot0, slot1, slot2)
	slot0.balance = slot0.balance - 1

	if slot2 or slot0.capacity <= #slot0.items then
		slot0.Destroy(slot1)
	else
		table.insert(slot0.items, slot1)
	end
end

slot1.Dequeue = function (slot0)
	slot0.balance = slot0.balance + 1
	slot1 = nil

	while IsNil(slot1) and #slot0.items > 0 do
		slot1 = table.remove(slot0.items)
	end

	if IsNil(slot1) then
		slot1 = slot0:NewItem()
	end

	return slot1
end

slot1.NewItem = function (slot0)
	return Object.Instantiate(slot0.prefab)
end

slot1.AllReturned = function (slot0)
	return slot0.balance == 0
end

slot1.ClearPrefab = function (slot0, slot1)
	slot0.Destroy(slot0.prefab, slot1)

	slot0.prefab = nil
end

slot1.ClearItems = function (slot0, slot1)
	for slot5 = 1, #slot0.items, 1 do
		slot0.Destroy(slot0.items[slot5], slot1)
	end

	slot0.items = {}
end

slot1.Clear = function (slot0, slot1)
	slot0:ClearPrefab(slot1)
	slot0:ClearItems(slot1)
end

return slot1
