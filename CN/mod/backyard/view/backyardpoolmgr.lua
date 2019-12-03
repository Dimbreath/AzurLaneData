slot0 = class("BackyardPoolMgr")
slot0.POOL_NAME = {
	GRID = "grid",
	FURNITURE = "furniture",
	WALL = "wall"
}
slot0.POOL_SIZE = {
	grid = {
		15,
		8
	},
	wall = {
		15,
		8
	},
	furniture = {
		10,
		5
	}
}

slot0.Ctor = function (slot0)
	slot0.root = GameObject.Find("/UICamera/Canvas/UIMain/BackYardUI(Clone)/root")
	slot0.gridPrefab = GameObject.Find("/UICamera/Canvas/UIMain/BackYardUI(Clone)/resources/emptygrid")
	slot0.wallPrefab = GameObject.Find("/UICamera/Canvas/UIMain/BackYardUI(Clone)/resources/wallgridtpl")
	slot0.furniturePrefab = GameObject.Find("/UICamera/Canvas/UIMain/BackYardUI(Clone)/resources/furnituretpl")
	slot0.pools = {}

	slot0:init()
end

slot0.init = function (slot0)
	for slot4, slot5 in pairs(slot0.POOL_NAME) do
		if not slot0.pools[slot5] then
			slot0:initPool(slot5)
		end
	end
end

slot0.initPool = function (slot0, slot1)
	slot7, slot8, slot6 = slot0:getPrefab(slot1)
	slot0.pools[slot1] = BackyardPool.New(slot2, slot3)

	for slot8 = 1, slot4, 1 do
		setParent(slot9, slot0.root)
		slot0.pools[slot1]:Enqueue(instantiate(slot2))
	end
end

slot0.Enqueue = function (slot0, slot1, slot2)
	if slot0.pools[slot1] then
		slot0:dealEnqueueItems(slot1, tf(slot2))
		slot0.pools[slot1]:Enqueue(slot2)
	else
		Destroy(slot2)
	end
end

slot0.Dequeue = function (slot0, slot1)
	slot2 = nil

	if not slot0.pools[slot1] then
		slot8, slot9, slot5 = slot0:getPrefab(slot1)
		slot0.pools[slot1] = BackyardPool.New(slot3, slot4)
		slot2 = slot0.pools[slot1]:Dequeue()
	else
		slot2 = slot0.pools[slot1]:Dequeue()
	end

	return tf(slot2)
end

slot0.getPrefab = function (slot0, slot1)
	return slot0[slot1 .. "Prefab"], slot0.POOL_SIZE[slot1][1], slot0.POOL_SIZE[slot1][2]
end

slot0.dealEnqueueItems = function (slot0, slot1, slot2)
	slot2.localPosition = Vector3(0, 0, 0)
	slot2.localScale = Vector3(1, 1, 1)

	slot0[slot1 .. "Deal"](slot0, slot2)
	setParent(slot2, slot0.root)
end

slot0.gridDeal = function (slot0, slot1)
	return
end

slot0.wallDeal = function (slot0, slot1)
	slot1.localScale = Vector3(-1, 1, 1)
end

slot0.furnitureDeal = function (slot0, slot1)
	return
end

slot0.clear = function (slot0)
	for slot4, slot5 in pairs(slot0.pools) do
		slot5:clear()
	end

	slot0.pools = nil
	slot0.gridPrefab = nil
	slot0.root = nil
	slot0.wallPrefab = nil
	slot0.furniturePrefab = nil
end

return slot0
