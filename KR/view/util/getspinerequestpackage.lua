slot0 = class("GetSpineRequestPackage", import("view.util.RequestPackage"))

slot0.__call = function (slot0)
	if slot0.stopped then
		return
	end

	pg.PoolMgr.GetInstance():GetSpineChar(slot0.name, true, function (slot0)
		if slot0.stopped then
			pg.PoolMgr.GetInstance():ReturnSpineChar(pg.PoolMgr.GetInstance().ReturnSpineChar, slot0)

			return
		end

		if slot0.onLoaded then
			slot0:onLoaded()
		end
	end)

	return slot0
end

slot0.Ctor = function (slot0, slot1, slot2)
	slot0.name = slot1
	slot0.onLoaded = slot2
end

return slot0
