slot0 = class("GetPrefabMultipleRequestPackage", import(".RequestPackage"))

function slot0.__call(slot0)
	if slot0.stopped then
		return
	end

	PoolMgr.GetInstance():GetPrefab(slot0.path, slot0.name, true, function (slot0)
		if not slot0.stopped then
			if slot0.onLoaded[1] then
				slot0.onLoaded[1](slot0)
				table.remove(slot0.onLoaded, 1)

				for slot4, slot5 in ipairs(slot0.onLoaded) do
					PoolMgr.GetInstance():GetPrefab(slot1, slot2, false, function (slot0)
						slot0(slot0)
					end)
				end

				if slot0.onFinish then
					slot0.onFinish()
				end
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
	slot0.onFinish = slot3
	slot0.onLoaded = {}
end

function slot0.AddRequest(slot0, slot1)
	table.insert(slot0.onLoaded, slot1)
end

function slot0.RemoveRequest(slot0, slot1)
	table.removebyvalue(slot1)
end

return slot0
