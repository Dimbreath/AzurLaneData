slot0 = class("GetPrefabRequestPackage", import(".RequestPackage"))

function slot0.__call(slot0)
	if slot0.stopped then
		return
	end

	PoolMgr.GetInstance():GetPrefab(slot0.path, slot0.name, true, function (slot0)
		if not slot0.stopped then
			if slot0.onLoaded then
				slot0:onLoaded()
			end
		else
			PoolMgr.GetInstance():ReturnPrefab(PoolMgr.GetInstance().ReturnPrefab, PoolMgr.GetInstance(), slot0, true)
		end
	end)

	return slot0
end

function slot0.Ctor(slot0, slot1, slot2, slot3)
	slot0.path = slot1
	slot0.name = slot2
	slot0.onLoaded = slot3
end

return slot0
